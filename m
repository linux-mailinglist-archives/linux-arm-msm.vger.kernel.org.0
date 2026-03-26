Return-Path: <linux-arm-msm+bounces-100133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA1vKhZlxWkn+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:55:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08A338C91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3A6A300989C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860E929ACDB;
	Thu, 26 Mar 2026 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBnRnPhd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aS03rsLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C514035AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544143; cv=none; b=u2BDwZnHs0J+zn64v2EAx68ZeDz6uBaYxpnw1ykJyL1kFN4gV5D5tKAmoKG7T4/s7pDNVdWG276ys4zrM91Ly1dSwDesprUCKR12XWVypFSFAEj7tY5p7WWyZTtDs+y7nyZpkNyaQC+CW6HkP4J7+aUiytULT1Tbm0rHxybe9TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544143; c=relaxed/simple;
	bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gh1viMJqQucCOdxQiQFc6O9tIymMe+uPwg5hDnCYArYDVClgaGZyOD1N9tPWmpatClIANoNIklOO0sZXZ95+lfQplRGG5oTl6C3GL8z4OgCvuHmuDWnMXobQmlWFzjCwwJFIn+eF8JWdv+uOtrwJvt/PwlzPPcnl/msWx1f863E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBnRnPhd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aS03rsLr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9p8o790496
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=; b=UBnRnPhdVNKnwlkE
	VpyP0kxOkTHkg3wusTG8DGi/sL9lXdpBpmavyw9JDtNzDDiOO7X70L3rdC/CzxLx
	o/YPIm/LmnWo5AvqP84wjymMsEsswDuFgT9/B/dypd5+AmiNNowKfyBSMWruHfnr
	5q8NhvSDhB9AoQjFacd3OFXz1wVbYKlA5qXc3Iamqob7vBq81IB6L66CPXaGAejq
	CEwFAL3ehdXBcybywQDQkWGs4xjGOmlANCyTLeKwbDSrC4BdcoH5tGCLklv1nLrV
	ivxnFjqB5qbEyCuDaqSQGF7pi4U7M+leQpsQyDiBe9/NfB074SP4Xr/pOnLtU06E
	Xbz39Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqh7u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:55:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so1660886a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774544141; x=1775148941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
        b=aS03rsLr/sjo3M3OgtYOBrIDLh25w4+3L1eapNbPr9Dy5VArx207l0nAo+IBm4L2mi
         zguHCcl81wgSDBLF3HRC9XuGqXB8aN4SdENDZS9um3GKoNCQGcg8JdkR+YJ9S2n+j8i4
         aMuu58E65JYhZSnTggsP9z9hi7Q5J8WXRSSaVvxkoUZCVzpA5DZoX6yh13K+yGU8mHSH
         HZYp30rB2Ammztie772O2OWX4bKi52uD1Xj/EsZRzLqDGJnUzVbPGk2sg/iDOzjm2/2M
         qbz3XI0NLu3/yVrZz8Z96P0zBiG7z246Dovxw8LFs5IMnh/TVwDa1LvMfTz1smKnarm0
         8ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774544141; x=1775148941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34I1cZD5tJvv2Sx8VHq0An05xW89MQuOzPSQsGgEZUs=;
        b=oQDCQtm48MneAQSm8rwwVuL/rpFe/u3Vsj3v2LzSimsUKp55aTFv5/3jvqiKWAHslF
         BL5E/ChOvBhuqGwighIQDs6kPRdf+w1OwV2WOeg5vE5lr4sllR4K63zBcXnya2+pwzQF
         a7RBS/fnzNWmwsW+Z1Zg0OqRFjYdiS+JgknGKt8AwXDkwgAUI/BzCMSd6BPuoFVSaCbF
         hLKvikB77+Vu++4Gix8hPhr2A2Otiy3sxS/a9jFS7KZ/0poc0l5wayN2N2OKeXbeifsZ
         NtbMchMTmQ8xAZhsH/Uli1Ej2cLLRg5eGqdU02meg7XULuA+4TTIx9t3+O8051ejukxV
         E7AQ==
X-Gm-Message-State: AOJu0Yxv4CUdJ+EsMUVILdP6E+9Z2Qfig3DYjZ/bkuObZDGrRqJcm5cJ
	c1nc4nI4TiXe+TwY9vEeFwIfyQSUXhiH6i9UpVSkdjuLBu9yn3vXyky49vOmFkCktjfvtEFxeWE
	Obnb8KSixX9I/TVSH9NZSjXDdVv4lm8lMREj9tmvtpCcilm5R5HNgbXPK5c3aEDL354o2mTU6nb
	Uv
X-Gm-Gg: ATEYQzwzIUMbhnwt/Ixwb30pcuWcDAXeTnSTBKwyKCC+2Byu0u0iD6A3dbTtRqkX5fT
	ff82pGqlVrpwyZKvbgWWNilEG8z1jgtvM/VWnya6xYBQ1dVLiA1/vJh4Ssjsl41BFQF4Fw+9yJr
	gx27aMrIwYZ7oBgwZAhX353ZAoUWElJN71LESWt0P+FzIoZt6Kd5zca89X0GIn8G141pwGDV/d8
	2zQ+Fqy+JFwWMzWUvXVqY7JxHBMPCm0FCxK6PAZzfrAdQPMkc458kzfBZTDtwkKqP0bEfMCWCUv
	8Y5VeeDkuwabTXJZDD4XngipETI7ZB5Gr3gWsLrD5cKEExHg+b6PL61BzHcH3vHSL8ACG1N+87a
	wszD7a1GYwf8flP6YDIdLj50Boxutkr6L/W+6q7e28EO7RqZSqfK2
X-Received: by 2002:a17:90b:3a83:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-35c0ddc50aamr7186683a91.23.1774544140647;
        Thu, 26 Mar 2026 09:55:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-35c0ddc50aamr7186664a91.23.1774544140124;
        Thu, 26 Mar 2026 09:55:40 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm2243987a91.16.2026.03.26.09.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:55:39 -0700 (PDT)
Message-ID: <328a120e-e9e0-4b3d-a2c0-04eb471c0937@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 22:25:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMCBTYWx0ZWRfX/ZTe5EJqj+gX
 AuIPO2d72iaCdUKwNgsj7B96uJoEyuPfmhxeZ7HLTN65Hd1oPrnVkJgPeKlxajcdrAUk+ttaRcl
 W5PQ9VkvEThm81lDrgiUnXhPsEU2nKLgdBt5GAWHaamhhciz0hvDHEunLs+qbiCOgWf4OOsleSH
 tv3/HavX8cDvWo71Jda/vCClCe3rVxMIy8nJEu8ilNpd9/7mgX7UmDBmdzQGVQxAQHBqcgo2c06
 s6BB46Mr9YPaW/ZDJ6FPGM/AeVNxj4mwWfqh29oDsvo3NTSE4KVuI5xf/oPttSyts0ehi3xaDPL
 kO9Q7OemFCceW9EqmkkjAnNn60yrQCoNJWS0C98aCZKKt86mh9ED+nz5xM0p1oxZ4+DyT5ywJkS
 C0hX3fJT9tJfM3Uit6OjkULguVCpsZlPilGFyVYc368cYlLH+Xb0WpMUZoHTuNuaUhntRUaHagw
 yot92LYazrcGe85Msig==
X-Proofpoint-GUID: td6xdxN7DosIiE8cCkY6Yu2_9yclNOZe
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5650d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vK87R4Ct5GjYayJDMpYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: td6xdxN7DosIiE8cCkY6Yu2_9yclNOZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100133-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D08A338C91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
> Same questions as for earlier tries (why this has to be repeated?), e.g.
> x1-crd: Please describe here what is the actual common hardware. In
> terms of physical hardware, not what you want to share.


There seems to be some kind of confusion here. This patch doesn't
introduce the common board file rather it just moves the nodes
mentioned in the commit message to the common board file.

https://lore.kernel.org/lkml/20260318124100.212992-3-gopikrishna.garmidi@oss.qualcomm.com/

The actual creation of the common board file was done ^^.

>
> Best regards,
> Krzysztof

