Return-Path: <linux-arm-msm+bounces-116036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CjuJEXlnRmpOSwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:28:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69A6F858D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 15:28:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mdGnnwiL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BJUcdeXC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116036-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116036-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D986302F58D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E81496919;
	Thu,  2 Jul 2026 13:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8273EDAAE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 13:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998388; cv=none; b=ndWsFtJToWnJ9qFsL+tTJ4XFSOa2d6dfb7YyC2UXigQwayQ/aR2yEb0EHD1Ey8bzQpYXgpZnuMvEomJZcIYliT+kDF9TyOxReaZ//3jzX4akNILUCYX0OtsfSRNsEkWQY5Yyj3a+WRKeaXu8Pyi+a1/OIxezmKzternOH1DvirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998388; c=relaxed/simple;
	bh=dR1aTWUCRvBY2I5PtVwstzuVzibl4jzNueUpfxJRmEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMRHeM17b7mqiMPbKit2b4B3GSrW4k5AFEzt0/7ZYZbuPIZZb59N4/pDTDVyd/s+/tUOvH0CsS1GSu+FsnACpr3f7IdkxOp6/U71S8B3jL0xlxf+mFXLfpvBfSJQxcMWEb2XW+QE6olPUvApWKfKljd32xu65aKBEOWpiZX9NKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdGnnwiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJUcdeXC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0a5V539023
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kxGnLji2fygxOtG9DCgg4Tsn
	ElQ4YaUAnlvU7bHGohk=; b=mdGnnwiLenyDVMAE3XRU51yS8dYzm0Kaji2J/s1Z
	0SHGf+Cp6xK0986Cs2uQlC0Gm8x5FZGM1WxdLwdo4KBigddR3fCVvd2D2oQB2CXt
	t/2Y9eeaL6vZdYK8Rg6ZjTijTWLDgXRXEU+vB+hYChfCIehJr2aXb7870acagwRe
	7MoQQ1gmlhogq7M6FxwWMo9POj2xxghU1KRxRNVDHbhH7moj59RFkzGSnm6ePPeP
	Fe6hs7Y6h0tnqc+S0R9z2LNsr8J5UCASMQCmvuctndaRVqh73rK4LPeDd+LCcd71
	4sl6tzpB1X8KbP0q5nGxDD59KK9FSFbAvX7UpjUpFTUP5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvws0fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 13:19:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso1362311a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782998386; x=1783603186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxGnLji2fygxOtG9DCgg4TsnElQ4YaUAnlvU7bHGohk=;
        b=BJUcdeXCKATb9J5lfdyDRek328YAkvwG7uHqNJRvdf5c+y+WAvuOrTcHyllUsi8DHy
         cjGakORAYyDDgIeaLTDCxOV2K9jLV3OUqEal73A4bjWAIXCpFvTj5W6L4zDYgsIKcPV5
         0OVFLARFGakuL1AtVvVJ+flWVQXDUUdpqRI2C0/agWzQk7OZ3t04e42kOFbCdM0LLYiP
         auTGrDj/mdMw04KDK6UnULuXN9EtoMgK/RqRceXaZsG0exBvQZp9SGcYW2agGsfdmmcA
         JartEL6zttx3v3vsa4xacHLNeLwRglT7fO3HmQ/zcxI1A+5SNuA/59Kr6KVFxvjMGgrk
         B5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782998386; x=1783603186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxGnLji2fygxOtG9DCgg4TsnElQ4YaUAnlvU7bHGohk=;
        b=SjVHNkScaTRbdGpY9yZjBrGRW3jaTa72QH3W38lz9r/RKncbTkZETTQFQbhyNXZ5eG
         6/KjxfHU0UbC23vttT92sMLAv/Zs95u6XSoKlq113gMk5YJ7P+iDg+fBHj7Ppjn0VnBB
         szRapUXi5krS0lxrnKjmaR3+XMnksukkh+c7ldyPzWCcccd7FrTBOVEb605aISA81Uua
         QxU1mfZ77LWAFwNs+OEW8QVoLPtma+Vwm7+ZRhil1+AbvjzYfZ0kYwhlFYUTQNLtXYPR
         3PDb2X1qtyZJj5GNvwc2SHEvKGVxNUwg8wgPB5p5V1EH3UPMdxoqCsJtEnvVBwP+hyCN
         4BxQ==
X-Gm-Message-State: AOJu0YyftKKQXeLjsl2fhg15XqgP6iUwqnnWt5tlGFu7CdyB54urBfLS
	WlExG5poJROnsZGHOKpnEMGX2xAl0X74VezvDS8CSLQwzLmuVTjyCP75419LXCpMHucOk35f8Pl
	rk5+iZLtqt42zC+pYxJZCynEqX86XmsRcTk7vgbCQxr4rtD0o8qZ2AXlXleG2LjsMwE4k1lFB8p
	yT
X-Gm-Gg: AfdE7clOGXo2R1+fSZHfmbqS7GjQpXTAHCJSGHynFeo7IXBNVOdHZSnOPxS7KE+NE59
	vb6epvbBEIYZFG/sOsPni/touyvIzBEJZPgmbupA+uIp6jMt1xv8YcPL+AhBOrZzaTo5yyN00vd
	a8gJJZfxT6QBmNxqwkv3dWx0Vg4vW2FLs09FWL6YPd+qGKN2tb/hEEvb4yGcM2foSFfR6JVKdZz
	6BilkD9sEe2PKMdkJ0rM61PbZ4tLPKb2Cd1kk51cCKtPKunAhfj+7z60FGW1LeoAfDi0U3hVHtP
	Gv9nH9/FOypllmY5qfJi0+y2TohDJlua71A/XItdFioZ9dw2BQeZFCW2gSef0rVYZpPcJb2Se8X
	Cj+ZOd8uJVHG1Sx1kY/ObrqwaUNqgxo//0ZSnPg==
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr54120595ad.0.1782998385888;
        Thu, 02 Jul 2026 06:19:45 -0700 (PDT)
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr54119995ad.0.1782998385350;
        Thu, 02 Jul 2026 06:19:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm14334282c88.10.2026.07.02.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:19:44 -0700 (PDT)
Date: Thu, 2 Jul 2026 18:49:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol
 to use power-domain-cells
Message-ID: <20260702131939.dexu4jxuixxnzyee@hu-mojha-hyd.qualcomm.com>
References: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: PJTHyT81rItzCK_fbzwdITMW5BUDjrZn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzOSBTYWx0ZWRfXxYM+E3eMz4yY
 PkwP15cTOj9kHAh3P7ZN5oTL5mTvh52yvmY+BkWzJxMGY2cPJEgwhot5xiSS5nKcckI1BNTbM2N
 A7XAhFPZVVSELZwmwL8RLCk6+P9UM/yRCb1eiFBLtNOSnxBo4K68NDH6qkb0J4oMTuHlLhgGKn9
 TdsqcgtXnij+eJINxlGbCOlmIsrvw46wD0sV7IGgP2IfynfhzuIr1ok1/5x0Y6Jptm5y7ezCQtM
 RegcRM3DyXrNPeXnnyylozlIhSpt5Xu5kzHpCPQIAkxBqBbV2BGBGGSFlQwllqKsN7Jsc2dNTI5
 cYkW8MmagcA7JRQK3UZyQ86zt+hhiqbDX5dmcYi7XRghgfBAg/4TB+bM8aEGyejDqt1ZF+iFRkV
 +OQEWyCQmwe1gMTJ+hSaXJGk61L2wHFGF3JWyQol6F3hlT8SkDtIChbP0/odxMCRxxiXxJymYP5
 7gFdgyh3xHpTKL/IGOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzOSBTYWx0ZWRfX6pLB6GHfzc7X
 fzDAvFzh+kla4Sf5KOZ1KKMHlYjn4YzVNj75T0cNeG4ea4wtbRavVWVEmXszSd5K6PrhaGSF9wI
 uEEITfty18ztt4gIybbFY6nAslAfj68=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a466572 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fqTeQLrJ5r4hnVr44MMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: PJTHyT81rItzCK_fbzwdITMW5BUDjrZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116036-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C69A6F858D

On Fri, May 08, 2026 at 01:57:28PM +0530, Mukesh Ojha wrote:
> The SCMI protocol@13 (Performance Domain Management) node was using
> performance/power domain, not a clock. This was using the older
> mechanism for passing the SCMI performance domain index to
> scmi-cpufreq, which predates the #power-domain-cells support added
> in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
> domain-id using #power-domain-cells").
> 
> Switch to #power-domain-cells to match all other Qualcomm platforms
> (sm8750, glymur, hamoa) and align with the semantically correct
> representation.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Can this picked up ?

-- 
-Mukesh Ojha

