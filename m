Return-Path: <linux-arm-msm+bounces-111056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QQqpIrOeIGpp5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A4F63B68A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:37:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Nv/bb9gh";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VvEnLTJv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111056-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111056-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00A4730128F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 21:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4932B4A139F;
	Wed,  3 Jun 2026 21:37:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ECE48C8D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 21:37:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522673; cv=none; b=O4UwnSNDcehFVfLrY2R3jn7/H3AjE/uXQbzN3uZHW8vS8DkLfVQXW1FFvGOtaVBm6fRi3aePlLDVNIRpo7jBdJXPOolmXLxzGm4DuyW8uNcpNPZrS2MXWcDFiObKfUgRO3OsIFGRRw054JR3o4bLVXhrydF9UBYsEabXnLJgQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522673; c=relaxed/simple;
	bh=cci6z7n0a1zGKgEm96nflDnX7klcKdSu6EEGpSG5uBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbeOGhtZg4c/RmuxeEsQ5FTovHUKZaPMEHARyV3wp7hA74+QyIAlaEqMI3vstS/KR8hrnQPEN73cfF0lQJFO8cPBAgvg8nOTB2KNa0j3y/PSnQAwKz4vu0iFTyqfEbiBDMy/r60M7DwpaV0ysFbFFSBFfNN5OUd+W4ASC96qQkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nv/bb9gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvEnLTJv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HA0xv2650442
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 21:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8u/3tgEfqqg/P4YRpc9c8Z/hbvNV5upjexngb80EYHs=; b=Nv/bb9ghc9cikK7l
	E130v2DD27zRgpRnmm249nFZzH3yg4O+SjhjjT//gbjT7mlGDWd+jbt1FmV5gz2H
	NelIqjrSv8pS/9D1GsHzLdpDertm/chS+zI/JxskJEw8xbrnBzHq70YMyFuBqZ3u
	rr0fG4OiyptWxyj3w7xA11oV/PhWpPhyUH4YZIiYW7npDccxAxgL11rBPHxChyra
	tFTMQIonUlxhCEEB5fH6/G3Iczq4cI9OASPbNyb52a5Lek+HPG4mUt4EZhvmZt5e
	A3FnxDQqO7AZZHZmSsiz1rnX8Ri4Gy/b0nkQLbyyEyOKNdIpe6hopFSFNLW1Xh2B
	2jbSXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejre9h1fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 21:37:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea1eea05so17764972eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780522670; x=1781127470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u/3tgEfqqg/P4YRpc9c8Z/hbvNV5upjexngb80EYHs=;
        b=VvEnLTJvb61rx9o7eRPy94zq3evA8GxC1ZSzTrmWgAl9TeFv7maQFpj3itq5yaXvfK
         exyojP2w8UPNSUBtMv4n1f3zVvaHEel7jTBp5EK6Dg5wsx2XE2pDHJSd1TplQTyOp9gb
         SikZvigly8bHN6ch3cm09fhygpBDfh06Z8kU2se4GrcE3FLQdJv2kEZ1O3iMBpij42GL
         5R9jvnys57vGh6PmrucdUnQiHlfmpx+9I/E0R9PTR4RgNnPhl30XJo6OwPUQZd6hhifT
         z0jRwa1OK8LQb1SI/ncl5hS2cHJNks3eEIgXhLokBLgCHBDoo0vq+YnSlO2JfCSBsWye
         Plaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780522670; x=1781127470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8u/3tgEfqqg/P4YRpc9c8Z/hbvNV5upjexngb80EYHs=;
        b=n0iSUzzTthTZB0D/GsVbS7M2Ia5DhlpF5vWTpV545iU5W98wMFL+1f+v3n9iPS1DKB
         fEIFWi8i2AeQeyQxiUPlc2HvzbcGr5rHMI9/4aYjbDTnkyRVd4VlhP+SymN4v8uLQV2t
         qYAcujGpAw1TnnJGg7tVWbWs4VrnyjOS8VbCK6sHKHgp34whUvF/JJ5riy1y63D1WrkT
         6yCBi3T1Qw1noK4gR1lH95cf/f3k0ffOEqdi6RJ3gBA/7+a7lGzbpG2qBCHSabCwZX5O
         qX0Juxe8RV3+uTzFSgOiFP7EVnBZG1VAz20xYlza54b58/3++KRRmcqz+C82+0pl7NkI
         VkhA==
X-Forwarded-Encrypted: i=1; AFNElJ/yjA1Vm5XoUQd9Ifzabv0C7X/QfaTuFShHICqhu8cJXmoNTNcWLtGqttsGSeJ/N6Jc/aOQDjBwmQUtIp5o@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2uId7VxaY48l1Op9eVHYK4O4/vF10sc1lRRlJLJu0MEfJh9Z
	d+env8dLNe1xUzd/vUGyINJzw/28K7O3zNkptt+PgglrlPMpA3Mu6u7pbiowMJ2hoqqNDLozXM/
	hc+Xg7rregt9ETPuD3Wo7iS7bhWXzwmGfR9WMbeBfqlkEDcTtJRST5t4UWacrDGidPZF8
X-Gm-Gg: Acq92OGyKYFeDemMhBpQsZW7pYa6o8t0KTNM9Ys8DbY94ZYPP72YV0TL32K57BPAUtQ
	oDv3PG4gLW0E/kVjiDj1uAjkCWlMEgVFFNqXpOi/V6ALY+SmrVGaN2CEFZAROGsJ1GRDhfERMXq
	1gJUjicEASkn7Cyj6JBqhb/R9+Imh2gxqp0F7guNX+F5DLUrubiDAARUfvq9j9MdKPklk1dxVRW
	fgn03jQnFa4LkcGxuDh9bWOzAzJKMI14XH/NOGc9tV1jfxiAUoExlD5zO3H8Q/D2BU2e6eOjviF
	S9ZfeAx/Xd+Z+wFtOuGlnkSp6FAAbYP2PYcCyLzeelkd1ex4CV1d1/WIEHxAIrh2eYKf7wmHTcp
	EdcLWFEn0oF13A1OiEaSZ4tKpotmNcTI9PfdqhDQ5W7xvwyzfNJBrdhPE+wLNs/XHgcBj+9vjKe
	7mvetrYoYzxRw=
X-Received: by 2002:a05:7300:aca5:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-3074fc6ed0dmr2667482eec.29.1780522669968;
        Wed, 03 Jun 2026 14:37:49 -0700 (PDT)
X-Received: by 2002:a05:7300:aca5:b0:2f4:3a9c:818c with SMTP id 5a478bee46e88-3074fc6ed0dmr2667461eec.29.1780522669474;
        Wed, 03 Jun 2026 14:37:49 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcad34esm4837604eec.11.2026.06.03.14.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:37:49 -0700 (PDT)
Message-ID: <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:37:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: keJ96g5ar_pXy1gm44pPd6exqVjioh8p
X-Proofpoint-GUID: keJ96g5ar_pXy1gm44pPd6exqVjioh8p
X-Authority-Analysis: v=2.4 cv=KoF9H2WN c=1 sm=1 tr=0 ts=6a209eae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DMLOElT0OXlkgAQsb38A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxMCBTYWx0ZWRfX/J0V3gFQL3dC
 +xvhqwGwrppOeJv++U/1mCVQLGdBH5W0DWpkPsjf4vebbVm/HbLzuRLuoZX/8UBY5q4tXTiE10U
 lag6/AlJyjA2KdUM9hhc8l2dcO9wN4+DjDxYnq/1byyIgTpZScXiN7AAN+TghfTZ72ldXi1VSKS
 jbPLJJtHK++YstUZLO7BiaxVjpFV5wNaQT7+1g9tMO4d5oWssBZ2ANGTIsQ0RBmvM/CSPWTsE6c
 i6BtmKJPFqyGhbIvNF5c6MZVOTBTP6mOsUi3R3OdOMfaXcpYWjAdlE0+PDzyNQ6PjwOLtaIQI9Q
 hkbCLauKtOLRK2ClvucM0Uym29XQ83Au8FxJHwEH1/oiIz8rraX5r9G8G5mIH1OdxP2kNvA3aZv
 1mBM1878L6WeVVQpbKW/NtZrCN3btISerNJDy5CqBKRr0YPAiKm8eCTyY2vP8TnLKHSPkP40Fu+
 H+hJhWTYan59aQPBtoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111056-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04A4F63B68A



On 6/3/2026 5:57 AM, Bryan O'Donoghue wrote:
> On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>>> Are you sure about that ?
>> Yes.
>>
>>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>>> CLK_LN of some description.
>> Split configurations explicitly use other lanes for clocks. E.g. check
>> the RB5 Navigation schematics, CAM0B connector.
> 
> Can you please check:
> 
> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> 
> 0 LN0_PWRDN_B Lane 0
> ...
> 7 LNCK_PWRDN_B Clock Lane
> 
> ... just a badly name field
> 
> CSI_2PHASE_CTRL10
> 
> Bit[2] = IS_CLKLANE
> 
> Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
I can check this with the HW team. Although the SWI has this knob, there 
may be some limitations to use any lane as the clk lane. AFAIK, only two 
specific lanes are clk capable in DPHY mode.>
> ---
> bod
> 

Thanks,
Vijay.

