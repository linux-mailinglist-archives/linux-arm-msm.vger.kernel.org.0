Return-Path: <linux-arm-msm+bounces-95506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAXlIEIgqWnh2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:18:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F360720B63E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F9F0308AFCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B6B29DB88;
	Thu,  5 Mar 2026 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muAfd2FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgpuyQgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977AF29B8D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691262; cv=none; b=Pd8h/CotJwXnoANSlPUgaEIC97kWuZPHNY2xZYkaEGmwD2/W68UvrIHlMId+luFG5evMZG+4IzmdBTmprezHc1N55ooeSFpcescsibN1ShXaAfYNhoMhfHgAZUDU7fQRNiBm5PGnD2cKt1yIy7uvj+9H6SRn+Ow2ScjmtzU4VFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691262; c=relaxed/simple;
	bh=4BYvVO/iDWU9EMNQernU+rQFNIn30Ov/Eu+EtTd11LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcJ6cTElBHYsG8LI9EcFpnQ7caML7IKHiHIGaxs4ez3DhUtTwAmcnqE7VJH9eo7r4QkN1DpB4MbJ0LCThpcp9j84uWQNOuJad3zZX4J/zVBVqLWi8O6GivQULVCi1MHmwi5wwOLKClk+Vr7aaiwN0PUw0C4tPSh3Q2hxFZnDCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muAfd2FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgpuyQgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bl4M628796
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 06:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=; b=muAfd2FGinoeMt8e
	pwbVnxtHBlQ7hmpCqZF7e9t369gMBxgG6GCJ6By5HLCeW2AESoZfvoFQCz/G9Ysj
	Z1sCiI4k5f/jpJIEiveHRTnDHEyScXqHKoIIZsWJ1K+4j4AU/2UouNUFoThmNcpk
	Zm7bBBgpyEfxbxGIY3s/+HO6biIxgs45KgntMoS37uGsAB9jx8KJQqzOhHunvyAL
	iUvC5ya3UuocF7P68fyKf2t0/IAGIG38raFTjAhCl1a8swhfkf7J3ceWVGeZL8El
	VKe+HOHiBovWY+rWBretbMVByvxtFaMIklsBSmeMcMp8b9Ib3seM6iVckhB/4a+r
	pSlyKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m21sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:14:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso42673847a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691260; x=1773296060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=;
        b=WgpuyQgWrhuy+d1ReY07jOfQI4EP6Zw36uFxMypTkC+0Zz04RbIOfSdDf8x9Q310Uv
         BQLcs9YbyHEKQfTTU6qrH2olUukwO8OoMJM/0oEFOzynh0dTn5qJ4dWgl898Q9ck/Hz6
         4uQtYDk5goMq6t8mMSJAEsX54wYjcIf/dSlAjW0KhaeD/hqqitOWGcsDIkKMooXuk1wv
         AUNqHK8/615HND+29mlpCNl/NCh/eoRLyBoue/NNdiEWBnaOLVddGNjnMbkbHClT6ncO
         x5lnTHyHhPqJhivfBNfc2BAzB1yeei4OzGLZNcwA98cgqd1tX8PAMM9eEus2+ky10pjm
         qW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691260; x=1773296060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahl00og2ZBWHRNyL0TO0ijloE03SK4ZZ9U+ZClDCZgw=;
        b=vA0p35A3/mnJPKSAgSksNOLmjLDiKGfCjvyogWZIg1OS5RFMjbJXbHlDmxeYmAZ4rD
         aRQU2K/LrZdEwBQSAauIgRtMcmQwxlthh6fQu/hceIHcCvljR+hVUf1CMrmadLe0ItLq
         rkqv1k4GIG8sjoN2pcu5KAgGTtt/aV/he2w6RSlbIdWDRb1xSk57qFh5ISUu3+CLOO/t
         G5CDZXrUsOObu53YlXaW9KfqXR1MeOWN1I5fAtfcEpsoCXVwbVkOiiDH/XeGw9as/l3r
         OmKtafUjyrCW7wwyPBzv7yRCMoKCpjneOFB/246TAGTv1AVIW8f4zNINgI1BddU7pbgf
         lv6w==
X-Gm-Message-State: AOJu0YylI68dgEguzDIq3gOx1E/nxg5h2NbYXipcpLdPEAUF9R2iYR5P
	8tCryeS4pnK5K61EoYZllp0laHLP8j1q+ugUmKTS6d9l8vbcJyMRPH/mzM7M6RCQ94WfPMQou+S
	qg9a2y6ssfze2nq8S6Fj7gH2/ejA9x78iKAQSpMJ2W6IwyEtBiyqj5P9kho0IZsWucT6I
X-Gm-Gg: ATEYQzwvDTwhozza6EQ2gu5tEiarQ6E5nEhe1a3xtOjGj2mVE73KBCn8sDI202ea13e
	YiP/ab5MFPSpSMS1R8PU6QPvvuDjijFShggWjLvrEekU0v1i991pDom+/mnwxMDNOSiRSF2n/5S
	bGq/Q3fhrCMASDty9mToZJizASWYZOm7uT48mnO2TFqWaLbfESYyf4alklSx+e549Q6n3yM0/Xk
	CAR1SBbWp484Q5GMG0JNPEeHYx4EF3Rv5h2qbuoQ7MNd63Htay2F9A/Q31Du98bDWUG+kB3qix9
	WqrCf2pLHQj1qe0FrJhOG7KkuQ5G69HPvbROSKcugDyOyjMLa6waP6jhozdBd5+aC9IzgoZ9/Hm
	GAu9sN4RcEa2Tv6UU02O1WsB9KR+gS532hpSgrAmKUrMOOLFW6g==
X-Received: by 2002:a17:90b:3a50:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-359a6a66f35mr3289494a91.29.1772691260262;
        Wed, 04 Mar 2026 22:14:20 -0800 (PST)
X-Received: by 2002:a17:90b:3a50:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-359a6a66f35mr3289472a91.29.1772691259793;
        Wed, 04 Mar 2026 22:14:19 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e14821sm792326a91.17.2026.03.04.22.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:14:19 -0800 (PST)
Message-ID: <061dc51f-872b-469b-8df2-13385aace063@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:44:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a91f3c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-moZBm4D9L3eB_LYtbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: auVMJ7mKxhLE5LbwcD2n8q3E0KYn7qzV
X-Proofpoint-GUID: auVMJ7mKxhLE5LbwcD2n8q3E0KYn7qzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX/Uaqo6vgNpHJ
 ydd2AS3iJamlHXpXzy0daPEGEcoMzeAW+mclGG5esWjaVgbNSjwMNHARkjXc5k7z/sD0z/uRWyk
 F2kX4d9+6uZHmUvCeIQ2q5D+OcOQ27Y1KmAnEqkXxfER7GYT6U5Nj5qNJh+DlyX1Mv5z6ABI/SX
 nB/7m1nhzmWp4eOXG9kCFvrJ4WRAHVVriGG1dZRSJKhKyhnnDq1++F47PMjmyQVjm7qdy3leE6J
 TS7uaCR+KkR4f4XN2iwEu3ACdp8kAu7PshSvmvEWJRxqNbIpcxh0Tl0bN+vVCG1JriNyALr6K4K
 uTNq66SuYKaaptUxf0GIZ4fpi7zmAZF0jsYJUWb4Zx9FsldD+hyax7NWRVrR7hDYuc2CKx+jQJ+
 2TWtIi/lvCHKYBHF/FhAUq/AW77ZugJ1MrpyWF1wD2Hv3+xaaP0mTerp8Ty42oUSReruptCATxH
 ySHZzpvdDji9rfRwwDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046
X-Rspamd-Queue-Id: F360720B63E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95506-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: 76f05f1ec766 ("clk: qcom: Add DISPCC driver support for SM4450")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


