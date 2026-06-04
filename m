Return-Path: <linux-arm-msm+bounces-111242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SnHmIyGpIWomKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:34:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DC641DF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:34:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FsfbA5eu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eBAn7ZTV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2608631C9893
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1045421A19;
	Thu,  4 Jun 2026 16:21:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6BF47DD7C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 16:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590089; cv=none; b=ZRO6zOX45FVWhyPUW7CNuTXphiRWxQn3tX0D9xqMJGbWL/TQzwyeD0bnEPbk2Ugdulk0q2yvZWjF7ZkWkX/fmL9Xkj8UpnPlR1G1+uQvDvWo+SgNza255VP0iOVN7QL+y43CQ1/armb8Y2AhMa5YxXRzfNowzywuXDDACFy7WSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590089; c=relaxed/simple;
	bh=U9TXOPd4VUyfgdGP/3YuDWRwWJZMvGYeMnDKutkGlKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqPkoy7JpKMj5Rht0X1weWfE19OHnQR6m+ybHFaRNuSO2pZ95EHm0LyciGhMYxnln8sju8+4Y3evj6hzQvfo24gM5Qo7XsBbbHS1ExXwZHDITkP5GosXk04wzEDYs+1B02O5SkYYFjA3CqZCy+1npTCDBedOjTrPnWYPATwkIuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsfbA5eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBAn7ZTV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BhJob994556
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 16:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5z8HxmxqWrZU+ab7mxdqWnWs2pi1AFMItihc/yIPX4=; b=FsfbA5euuy6Fn8Oq
	LqN9kBz993FqfFn3JLUeP8qIZA0gOg65FBm8meZBdXOgElmKWi04pAhnMlxFBHcz
	q9wQVXEYBye7iQSGuUkjVKLrGEOu+guFT6j5yaFV6/0ooodeaaj2SEINF87f4AdU
	p6eSQFxKaJ1F9K2hNwxhsu/5Q/yMOTnpBG55rdwX0ZhdmQNp8DtufQcT99RQS7Nm
	n7XzpreRptrAHZTkFjlXTMKRTOL3dgclJtdQVDyEKNQ7NlQExzK4ioqsVUP32JIL
	RXyMjb7W0a6mqX15xW0OvOmyqnqUlkR4w64pcv4fiGPhxWSktXH8LH0MnhOOndmA
	/XJcQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374tmw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 16:21:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so7928205ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590087; x=1781194887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5z8HxmxqWrZU+ab7mxdqWnWs2pi1AFMItihc/yIPX4=;
        b=eBAn7ZTV28tKNpYIblro6uBmMLzhqJjruOsA8Wk1FFFSRBPJT8FGoFvSy+62C2G33K
         HZhocPoq0IIg8SB1r+EGmXt7SYeB5H2Oj2+Nikp4QDJ5nhsupfI3A51avTgayN2+MtIA
         g/k+Ijrsz1A0EtMyoacQYLgl30Sp8cByLsWQpv2N2h/Svi1EeE/vjfjUQuWzReK3z5q4
         EsucqtC1c1IcjnwF2Yve8R8RsEOb3m6wKcs9l7ccWL0jioT7tgE8JvfLd0KeD7CpouDH
         r2SRBSEKwMBJeiGjYl9X6v9OjHYvvxDVl8fXH2tXd+SLm2dlZHYB2HmAW7sEJG+oqfe9
         yNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590087; x=1781194887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5z8HxmxqWrZU+ab7mxdqWnWs2pi1AFMItihc/yIPX4=;
        b=IysNEbl9bS8lrh8bn8eOnrb2NSewGAJV1AN6v99e0LB7rQ/LrodDjHttFbG1UTMPg5
         Em7U+bPqeXniC7ZVxN3kBrmWQv1OlGq1JvewI9XQGQHPhZ39bA25Wwb3ADB9os9kzvsb
         9f21mjT2F4YGZZ/+HwZSAjBSaGux2p3vJ8Y0BleWlmkOp2aVtfGLvvy3I6J3DWhRJmet
         rXIskvf4zsPQ9v9QUuUtgwslSYryBZFHb+kACDW7KISaKoYV5o7BFuHKY79zylH5y5xf
         TZuSJL8d0DOvkFiRFE0n9OREMvEZSc7ysttIDtCX3jVb11VHZ300SIno2Wjokk5tEEap
         Jprw==
X-Forwarded-Encrypted: i=1; AFNElJ/+HaNRZVuKqopakXLL/4IlkpmEdCnE/rJ+01sqfSKrR8XtzZlP8xFsVZGZeHYCXbaqHzSZKsw9N0j054sh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8atfR3RUI6XP0TAFDwLvrBP19jq3lMjWgOsAV5raamxf30eBe
	I9zrdlBf6JconmzOX7sUizHlaYjuR+yW+G6pa6zroAV7GtGS6I8q5wWKJ/afIFt1BdHtbOcKIaE
	eUbB7EfQQSzW3cJAZeyFBhK8c2EYEhtfvTEWXmCoI7qJiEAcrneereKq5SbCgH5UcOyvM
X-Gm-Gg: Acq92OGeFt7dQyZxSq0X2/xDy7Ec+0xaXUOKLem9MZZKBNcTR4eVH9+Dv6adY1QXDxZ
	zOU+tCOdUo+RNTXtZzZLezPdZ5nMc+zzESL6arj5hAR2JcqkLt898wjrPVrqU292jp5iuluQQdm
	zbfs1JN2PVlSTIYFpr39seekcN7FSVo5tpOLmUcon/dgEQ/iYCcznQp3A0l4Yt5ZGhI6G2RBNqk
	kFMlypH+BTOpPqwGI8+ezMitYEaW80sAUkjxqMf65bDmVfD4rEgZBcq+/EAJoBMHhYrTYunHyXy
	a+BcdQ9Ix6z7ojRh/0mJDGZVnj4E5B4NX4101RGtiBgUeHPpTE5Pxgdll0BhySX8c/up1xdQ4VU
	5m1e2PRkzI+NWy+Pjo///12ZqzEPN0c7ZU74/wrAIMRQ/WGAlnE3xQ3J36PN4WuRS
X-Received: by 2002:a17:903:b0f:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c197d3a55cmr40577705ad.11.1780590087193;
        Thu, 04 Jun 2026 09:21:27 -0700 (PDT)
X-Received: by 2002:a17:903:b0f:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c197d3a55cmr40577315ad.11.1780590086785;
        Thu, 04 Jun 2026 09:21:26 -0700 (PDT)
Received: from [192.168.29.82] ([49.37.133.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649bde7sm63691785ad.72.2026.06.04.09.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 09:21:26 -0700 (PDT)
Message-ID: <15a69353-8e1f-4ecd-95ca-96d8527fac54@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 21:51:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Hawi UFS PHY compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-2-palash.kambar@oss.qualcomm.com>
 <20260531-rigorous-gay-sturgeon-e8cfe2@quoll>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <20260531-rigorous-gay-sturgeon-e8cfe2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1OSBTYWx0ZWRfX/FdIlIjNcyYg
 B99/D+utiYnAt/80S5EUU8vaEH454exeh2xWU9x3R5HHg0ue8wo4w/PpNdUjBvfv2gPdIeJuCan
 dkFrEApHTu0Z3ATxTQkJDwTlTldiZzEtuR4WTf2uTaU8JXe6+Wo7J1itj+yd5oAqC6I0SM3QAA3
 e5ko4vPPMc7npRGEKfow31qlzayTSjmznjSQvRYAUVCJKAbcaK++8wCiPurGFL8ssin5ZXkQ9id
 +zZR1nvuWh2uc2jeo9CDqNsga3fH4XWzDB42CiKqbjCCffbTf9cnuyLIS0TYLmVs8LHNrNZPe8+
 bDndWFxauguoRcfs7NWdsqj9mduKHby8L5X16kgCVanXIY0I/NxM71OgSKKZqvqLRdP5rxyH44b
 U0waMc9k6j6O/JCal7svs7jHWUN9IHB+O6NHesIjY3laEjrnkVYe9UqFBxZL0TLbnL7IFWYwz6E
 PaPL9qfON53YKCiij+A==
X-Proofpoint-GUID: Zj3QO61QvKScD5A_DmspvplVHyxd7Ko3
X-Proofpoint-ORIG-GUID: Zj3QO61QvKScD5A_DmspvplVHyxd7Ko3
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a21a608 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=p6nWuE1qLcVxvtXth5uE9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CrkXPM5SzrEx83M7ahcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 016DC641DF7



On 5/31/2026 6:03 PM, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 02:39:54PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Document QMP UFS PHY compatible for Hawi SoC.
> 
> Lack of compatibility is a mistake or intentional?
> 

 Hawi Phy is not compatible with any old SoC.

> Best regards,
> Krzysztof
> 


