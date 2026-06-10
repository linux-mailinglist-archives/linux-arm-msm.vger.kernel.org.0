Return-Path: <linux-arm-msm+bounces-112493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QVosNSpsKWp3WgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE37B669F77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G+vkeQnV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=frQrIuke;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112493-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112493-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13689300106F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC81408633;
	Wed, 10 Jun 2026 13:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6223BAD89
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099418; cv=none; b=Ib+22nOAtqBLs0l8J3S7TBPiPq2IMnB58CG6oGrCDrUD4SottH+hESKurwburS8/Ci2M5NP0AL0BPrYLPVmAUxOAfLQh95/IKaCFL84Itvu75EONP/reOpGWvF8GhiudIV3H485QjV2vs1fExzyC9urs+UouSLN313jf70GbOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099418; c=relaxed/simple;
	bh=m1tGw26woFdfkPZTDBW7hW0NfQPofXVFfIcHxqyVtMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQCOUYgRy8eACSloj726DDlX9zZVQrabgAgQ5R10tRcQt7TlBF+hkgM0wOCT3cwDGAvZqy/wZ3/0lnqnOxrR8SCnKkv50/jaYg9DKE/rqOfmmE9FYTwDPKrtbSl8t6KmQYrPpAh+DcBlKJ1WfY4Gd+euRGTAedm/dbZlhCMhf78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+vkeQnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frQrIuke; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCJRH1472712
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=; b=G+vkeQnVe72weTGC
	g7FgPBXZmLHvDIHws+NRZL1bMFAxxNJx6hnT80CtXCqVoXm/mtgLCLOzBojyBKZ5
	PANR7VltJ3lV8Z3VuB3IFWP8Ultnm3YueekmfkZ4Yhy49tdOIAR/48kEqnDlXjry
	+Cb0uMDy5AEDvCi6aEow9zUlKlEHEEB5P0iiG89yPCEEBUz5ARLOrEOi9SVazPzA
	S9xHLwPLlX6H02ggqgnEBh2nXUPy+k+EG0RcCB/OMVCEyKVykfr27IsbC31p8hfX
	W18Ig7oucRR9KKfgQdmCmLJdiNULD/QoafouERXUIUJ2eZNSGKi0IQhjVShKr2W6
	uUL/dQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda48f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517865e6219so14246701cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099416; x=1781704216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=;
        b=frQrIukeYuNpY5SHEL0zo5WG+T4+zo28s7wNY5ZIWVL5o3+U6tXwFQEfMvMSgGjNQC
         sHuf8wAMV6FAWatrLTb1u8Z0cFDqR5c0vAVJQC7GntmIO7ZJ/WZJoPznCn4RVfajXsQx
         iUvkhh0riBYFaXIxH0oYv6tzJq2xerEeTdXgvQGQ9p5XhUHV9a1Ghfv4CvA03TSUo5RC
         imNL49moBUuTLXHEs9IobBxQd8fw0VPaumVnjIYteecRvRZlJoQVKdRfiFPbIWlYFHVn
         FQ/aflQxOpHa2+3Dpmqpm4jCrwRMeX8iusMsr3AOIJQuw6FnpGKAySbiNrIlshu2Kthg
         Lsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099416; x=1781704216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=;
        b=JqrUXidXZL6NbjC6LIixnT/P59nKlVrRDQIdsp9IWVrDl5fEF4HMaM6WVoIQiK2m9v
         fOrY6T37zs9vhpb9w4qFPZHOPvQaOymbnazz157IpFTHzNTOnS60KsigBUBUaoRtpfWg
         P2n+zdIOVDV0zdm0iblgv6o1ePO8vj9JesmTJQOe472cXD6eu1avwbU+lykjl+9BJ2iG
         I3A5BSlU1+QgBFVhkaViOkjCppihqtdij8fmFWTWwYCMts4WyEkDZrDWkIRZkDCSsCUz
         ZvIj2fDGqvCthbOo5yIVa9ZFHIAjE/T8GtB4VZV3fJNPKctKxiCHhFQ8CYTLapHMsQnp
         kJkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hcPbfmwzudGa1IiKDh3V7qM1PrdaOhF7xJswbnA/kJA6qK/dUmFm4DrzFPkPsFU9+YdXWRJB9LCNn8jYx@vger.kernel.org
X-Gm-Message-State: AOJu0YxPzT8FNlJkaFklMVxBARyIfjy8Dn1w+aLpofTxKVWS6jJhwxGm
	RWn/8aie1toUuf47jQmhZRItVL9iaa0Zu/wg8Ur4CKu9/GfM2ueiHjHfeokgr5L+IvSiEvXvQZZ
	QHhzxWT3029QcTulAfLMLlHMZfwoPweuxRWI4K2rl3f3jDy46DMUus65QkbTE7ggD/0OV
X-Gm-Gg: Acq92OEy7l/2b+REeIo0TW/W0PcSctxAV6MawZYPihS5zAZUA7fH/o+xj2WZw5EaPKH
	GMZPiIXRlqSyZleRV45r1d2mTRGCX2JwsX1JuAo1Zb2Uoysog3qEfQE3JOSnBsc3AjAv7mnBktU
	+uzsCj0pcWrXmNsEXEnkG5AT2cRQ2kzQGBqTt8HC/aeWFp5ghyaspVAKmnQQtG80YFy5907pgmp
	DSvvs2saLWYltICiija+zc1JP99Z7AEyYWD3GoyMOgRtXaVMXfVHnonKMAs+vLAvU6FVUiIYl1G
	wajMOCs/Z8a8Eq8A0tXSvaa5FK5ZpdDnutG6BBTllbV6/IiVj7amOsWWRrgx4zSUibBlNSYzQkf
	Srk3AagJTB0AIiH/k9xEe5z7GY7fAjSnIXzKqJLRSpiyIg/JnoBBweW4y
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228447601cf.4.1781099415779;
        Wed, 10 Jun 2026 06:50:15 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228447151cf.4.1781099415315;
        Wed, 10 Jun 2026 06:50:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm1205291566b.42.2026.06.10.06.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:50:14 -0700 (PDT)
Message-ID: <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a296b98 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=Et88DFpTZsi3nXjlyzQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-GUID: 2NqpfUFdg9TjE__hYGsJlc3xls4HOdzc
X-Proofpoint-ORIG-GUID: 2NqpfUFdg9TjE__hYGsJlc3xls4HOdzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX0XnLaySRTtjx
 R4VgLNz5CXCxUY0fOZk5l/JNmJVDv2fGTrmcCq7byQEBfY6HBRsYiOO762Olat8H46WtoHi2mWf
 XGUMF7G9VmeuZd5F13/+bMtznZgvcBzcuusnnfi+efxnQ9RT5Ia09unU/tDlMrxGRq+LqZvIcRo
 KZ2/E/FGFBDj7PsxM+JijuXgBAcHm0LTlgAhDpoej/5v1hxtnzd3hbWTEdTL1sP+2nHRO7/uzg0
 aU2TkOq4TNBRKbroJJrsGXvbZJj/Tc/VbUE4g3t3nDEM6upqg+npvno/c9diyEvCacREGZo8blm
 DHNVyWPmhBXR+nkAJOLw2DabwSFBCWnMNoLn8ne8yLlhoLQbS/Mm7FomdhlNbHNnnuiXidND+Jf
 Jv3iE9cxbp61dZbZ1v47jWe+yozYUMYucTD7zpthbqizazkxCtkzNwgiTdx8VFtQbT17Md/mi72
 aMFzbItuEl2I4gKKPcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112493-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,gerhold.net:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE37B669F77

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> This clock does not seem to exist on MDM9607. Reading/writing the registers
> always results in 0 or crashes. The math in the frequency table is also
> broken. GPLL2 on MDM9607 runs at 480 MHz, so:
> 
>  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
>  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
> 
> Presumably, this definition was mistakenly copied as-is from gcc-msm8916
> (which uses 930 MHz for GPLL2). There are no branch consumers of this root
> clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
> parent instead of this clock), so we can just drop it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

It does, CMD_RCGR @ 0x37000

Interestingly, there's also an SMMU instance.. although downstream doesn't
seem bothered with it

Konrad

