Return-Path: <linux-arm-msm+bounces-114453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fvjlBifUPGruswgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:09:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58E6C3433
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:09:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lX5L0t+o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VwndAS3N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81CA63014412
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 07:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BA9332623;
	Thu, 25 Jun 2026 07:09:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E017993
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:09:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371363; cv=none; b=XZUHkCX/8Szuaz4F98TBE/GK6F3YcpTMNBS8P1qkVC9LuvKPP0Q8wl8mbMfCO0HrOm56Irf3eCBccC6xA29I5w2jlu1RBKQT50ho4N9R5YOk6pxalfeGZCESSW1Af823FKtQseZ4kV9cDxhDyXuXi5H901FpKEYYEEMOuvwHawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371363; c=relaxed/simple;
	bh=djv0tTmb+A/Hc7vFHYTPMoV4v+AC0Sm+bPpYK67KZOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sci2XQyGuqZt10CnjrgE/8UHTwFM03XAh1ARQFyPQ5bGacEsjlGhN0CHyNcW3qy/yYcp34RsnLDdeguVK+OHiGO5fpWee/Lq3JzzPXtUlveLvsaU6dnik8pSd1v04Kb0RbBsCUzZXIz9s20lXfQ25lgVBFTfzyyWeTERDVweS4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lX5L0t+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwndAS3N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6glHK1527031
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTCZ+VJ4Y9dEhL3KzBEduOSLdvMBovKYtTZpjNm7jA4=; b=lX5L0t+o78Q6Cxqi
	PwLETmQBd09pv+VTCvztFKviJlyQ+CxsQvhHBUU7eAs2esbFX18un3SRzqn/wFwf
	36VIKoVq+hHKOh/yb/7GPv4cqyVWfA/PbrmKkEdqdDgt/3TkrSOGBhCd652COqby
	Iz4/nEa54CMNoeJasw+2oQyzhTPFzmVOjCvejqnr8Q/EGw6yE6tI8ARKxW2zB8YF
	RHay0bFfRYx8EZZ0MAcCxNCAy3d8mdsdrr3nuwdzAZSsJHLwddOKJ0fLnRgzLg37
	Vc+XD2fMPhlzLL9Rexs6MMqx09LxFgjoXFDj8jLGla0ipS34w6fZFYyd28UY7N6e
	7EJF1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8r37x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 07:09:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84534f17866so1737958b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 00:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782371354; x=1782976154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTCZ+VJ4Y9dEhL3KzBEduOSLdvMBovKYtTZpjNm7jA4=;
        b=VwndAS3NPkc3tUF+TPZNf05EfIyT+sf0VcDPESzWrD512ndQyv+vmz71yECPG1Zu5O
         O30xU6q2x7cJW8NgSY0fWROnmlU9l+sOCVFHLQm06gDQv3AfE6Vc7KyVdKlcY6a+SEYJ
         zg+B/uVvZKNsZTDBd8XiCQjlSdYIXWKoGheKgaeX4VfAqFwK78krURv8lURwNGl89B6t
         PF6BYFaeSilm4gSu+sWpT10CtzyCwaaso8OhxaGIjECE/cOyUm/xxSH/keRCTMfnqdZ7
         q6EafJ9RpXAFPsBZVC3ZGPg6ycSUE4t3FzGlsCpE9nPomG2tV3QQJHDOgHutGmZgLuiG
         HScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371354; x=1782976154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTCZ+VJ4Y9dEhL3KzBEduOSLdvMBovKYtTZpjNm7jA4=;
        b=ei/d7Tvsb4vVu+kMPbo51S6VfPSH5hIRCiiWg8vWZG7OQeZSez9yd3T01OH2Ueos87
         vU4FN7firOiZZl4Oz7NetcESH6VB74/nFT1CdwBafDSsgz04V9xKGjAFdehPJ4Rf4s3r
         IvpwqA3+G7HtdXmdSjPrejqfHPeUL2d/5GNF3/OTBwCyoyNx9C1bKBmQsrq36LBRTxjh
         NgVyV21IleIL1dMXggGNSsyS6Ro2kQvXagTFVAmkEsarH0AgvxkEEdQceF8Do+dISCsa
         WLR+AH6Osox/gBky1P0vWAPmkhhxsEyEwGCKYtXqLq0LjeQ/r1v9wDJ3NjBLOQ7/8Q1k
         2+xA==
X-Gm-Message-State: AOJu0Yw4iaS3A1bJSHM8s1rYDNxBlYlvocpQFi5DpRwWhsjqbdlKrB7D
	VD2CVb3d+/Tpce5UPGq3jCcJtx0RDvImExnlRQHL8SqWfP6D+dsAM0u60F36gkIOFN5PNI8vWC5
	cjKh02l0z+z9mEqLoOAfD2sz49Ot0G2q8874yXMmnOc4O2zMqgevX33tZ9TSOyV7n/pdV
X-Gm-Gg: AfdE7cnoDMX/kJ2b6w9KwsMNp85vD+uDKJc1/nWgyVVXzSKgYjVm51m1MDv0tRLmCpb
	G+68/MCefLxDYdc2G+YsqOR6OstTvpMkeNz5/+EZ8xa16rsjJpiFyIi8jqJl/YUxr9fFfqn2AEY
	CeEg7ebHQeWKZmf0UMDT0ty2PzPPVkgKmJ5EmX7DWqsEgzciNf3M1DAaCkQoUrKJFz0h0yq114n
	RKOxtFd1XwsAhwS3wLokSytvYnjF++uG53FRkyetQi7HdG3JXNCymsONjuB/WvzYoK0GAIvrbB9
	qvIxvR+v1ZjFVws+nBT2eWXns4Luokeim5nsIM9EJwruiDmQsRBmnTZqTjmuchqoTujhZAQrOcs
	mqvnsD+ZKQ553KavMjNBQWxo4UToy1Ia8mXp5wK52PdNLC4em5KVgpkIpkQ17e1mqPph/TOCnIL
	ZA9ca4
X-Received: by 2002:a05:6a00:1d8b:b0:842:650c:153e with SMTP id d2e1a72fcca58-845b3a1afbdmr1618036b3a.20.1782371354186;
        Thu, 25 Jun 2026 00:09:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8b:b0:842:650c:153e with SMTP id d2e1a72fcca58-845b3a1afbdmr1617959b3a.20.1782371353108;
        Thu, 25 Jun 2026 00:09:13 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d2341sm4045909b3a.39.2026.06.25.00.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:09:12 -0700 (PDT)
Message-ID: <9175804c-956d-41eb-9995-05a7b3bf3fcc@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:09:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260617-spry-greedy-chital-1276e0@quoll>
 <be2b54a5-ce9d-49a2-80e1-60da874350d9@oss.qualcomm.com>
 <4ba2eeed-71f8-4799-b261-e4e2c268043e@kernel.org>
 <36043887-6bbd-4b2d-941c-bf222786b80d@oss.qualcomm.com>
 <91cc96b0-d25f-436d-a0c7-fec39bf72393@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <91cc96b0-d25f-436d-a0c7-fec39bf72393@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2MCBTYWx0ZWRfX3BrdFJ/iygSN
 nogorpdT4Wv9SvEbQ7x2km6O2rBUNKQvSp/4LDOAppgwT/6U8pQ0F2DN5ApIuONpwnwXwZJynaX
 8EwyR/VnxhkD5bIR5Q5k2jdJXSG5Nm8=
X-Proofpoint-GUID: kt2r3nBCeOHLBN7IcNyzgn3341m1t5p6
X-Proofpoint-ORIG-GUID: kt2r3nBCeOHLBN7IcNyzgn3341m1t5p6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2MCBTYWx0ZWRfX+DXfO4vpUoUl
 w6RQCS4AV4L+Z7Z77tTSEz6bdmyt+KsuoJM0dx625E5nYUTk1FapWKf0rqxXvDIE9mAmzor8Imz
 CBRYUoauTHO0BDzFydPxnLRAiDnl7pQ+jMipMVwCFFruidPz9q0M0uOBuDBaRLg+Jb9PhKmA8RW
 /Eex94hGcw1iuUou4t6xVSbx5SRKZiiyAQwSjW54qj0IqUyVRbcLvvP/wfFv32F/h+DwZthO4wQ
 wAyveH9QLCpy31l87DR7LiQMD1zfZ42iuAwG30WjkVsZw4O3H1X97KxvwVvKomML6ZlVbsyAtJt
 8GMEtp1CRf4cP11t1gLgKHYyH3LhkkkprUosTeNKOqNvSNhKpc4XQP8sCD4WHQAxqtpYNyPOnRg
 PN3FIG8sauDQrRYkctVQJ8X1u+OsleHHUauNNp1Im/mUabk/p7W9Ysid0RlZfGaOIqFIIdgdpO5
 +cP18rw6Misj4InxFbg==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3cd41b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3T_W3r0UKrfHlzfwz2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B58E6C3433


On 6/25/2026 2:19 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 03:41, Fenglin Wu wrote:
>> On 6/24/2026 6:05 PM, Krzysztof Kozlowski wrote:
>>> No. Act as maintainer. Clone Linus tree, apply the patch and see if
>>> everything works. My claim is that nothing works and maintainer tree is
>>> broken.
>>>
>>> Best regards,
>>> Krzysztof
>> Thanks for the explanation. I just did that and I didn't see conflict
>> when applying the binding and driver changes, but I did see a conflict
>> when applying the DTS change. I will drop the DTS change 1st and resend
>> them after the driver and binding changes get accepted.
>
> That is not what I meant and you did not follow maintainer process. And
> why did you ignore second binding? Identify how many separate
> maintainers are here and act like them. I looked again at your patchset
> and I am sure about that - patchset is unmergeable by Lee.

I see. So I should mention below sentence at the beginning of the cover 
letter, is that right?

Dependencies:

  - [patch 2/4] depends on [patch 1/4] and they should be applied together.

>
> Best regards,
> Krzysztof

