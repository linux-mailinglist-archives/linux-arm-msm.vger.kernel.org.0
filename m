Return-Path: <linux-arm-msm+bounces-103901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLkPLLlF52ls6AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:39:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA6438F69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8029300AD42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8521F3A63F3;
	Tue, 21 Apr 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUAcNvzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gr9wc/O4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7A3A5E70
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764338; cv=none; b=P6K2coG5OoIpb5/zjGXao1ZKwJFyLtbWuLJi7Q5Ws3P7qDKsPFiSUQFta/RCw1mlKjfVntQ1Bul8vJrqlyxIXm3+ZbGP+pSjh4DkTFVipegVMZ6Oa5YyqvVQ5SX72SazLRarCaVhzenSDPXYUEnTAuAnlHHALI0K7brw9LBwhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764338; c=relaxed/simple;
	bh=u8DbJynolgW2SvOQbI/uVBWstmdlEgoOwuda/rhYsak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0DLGGsBTnfr/kKqxMEOYtwXOcaW2rQoiVh/6UTw9HA2GJ5Cm1S9RRikTYDMXunDchJBQ4I2j9omWbFNZzcjhsKBF9FtYOPjLaSkW0DOmuQemd1Z4nG594gVQNj/Fw6O8VHgk5kVQ3Ie8RdBcj6iXaxzCYrabchRm6GWRXIT944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUAcNvzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr9wc/O4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5JkWE1011843
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=; b=nUAcNvzEpKTjV782
	cEUuOOhtE2u5bJayd978sNcQNtB12tl0+IjyDHVZ9XxpYaBaD70/NHBc5xvo/nmt
	G8NaVwywC81Zhu+CE7U0WoJPhtz+RF+1hXYDgMh6eM24JP4P3FVXr0yR77PjDrH8
	DDihjoakKxpSfdBoVDfEzC6j4J5b2+0LJADkkJUNzPARjtimi807YDgCCs68K1fn
	kNyL2LiDEfSkWCss+j6Yor4PfJn3mMUPSf+BVw/7GczvhSnMXqQozCmKRDc2JZR9
	MvKJh0vHjxFgnjhvcC0hb3Nn+wnhZeFWaKnA2s1tfXQnYkKQpuz7JD7ozrZOoQMG
	nLO86Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902jr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:38:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso3204691b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764335; x=1777369135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=;
        b=Gr9wc/O4nOxGeSMuwBs8M4zTVfwN56jKYcY/gz3tY+SuBsYB2N0yJuTx7jYSjwtog5
         8lfMUnmyQr0ZJ0mPQyn7o2mRjFs+EJna3DcdnIXLlOG0w1J8eMSQxEmTURy8wzgIvXEU
         vqSonwn9Vj8IS2rh7Mu0hdt5rU1l/HBuZSir71DoiMqkkkWXk6KCCIfSPwA+HUMFCSE9
         TpW8P5LP/0tgILERJJWuEMrclQ+N81cqfD2QJq99loBdFux22lL78Wgbgo+xTdxM+Gk4
         pH+Z2geDK+Gsrtx8oMhp9WMmMDeVLF004OjBO1V6mb26ECy5vwvy6FHjKYgaBpMfqBXe
         3IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764335; x=1777369135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=;
        b=lWBQEcDAEcZb+2f11HkDSXsAvrLLKZ0aJX4w2obiLiiRIcqM4UdWBacz8siKqcSxpp
         sem0dqv/3xkrjQBQB68I6mfV7zgYcTYG+LwksfUHUWdj5O7WRqN7kH4eibKoFmNj+rYV
         7ooIyCYuUat4P+jVg88prcBNOnKweWmGmmbOht4idoo+HXWQuPyB5L/xvJCVOEbitDFU
         0S3Tt7Fw2DrLf2feT7DWDRydnDG7kp+5XGJBFVQxVoWadkhH3onqwFxsMSxzo0MVpaEY
         J4mh6hQETecFRndfqLvg04OZlMP7bnbGOUtnEeG5gFelhMo8zWecc8gN7OwyE6HEUW4S
         PrgA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y1BPENVz5YpdERlqEaOFBGpbxitpdPV1uDv9hSupHGBwUNXAjgAB7tcVogi8nMKPnCU3LbJ53Qc8v7OV2@vger.kernel.org
X-Gm-Message-State: AOJu0YzuzJHoibzKrmpinB/j9GankcSfZ+Es8KYRJ8FCzAhFkex2DjhN
	c098pREhTpRj+xb9PaaKu2ECbcFALlki5hesUqNRxoFxhNRT1566nwPhCaInPFbQww02CBUJlxv
	SaW4/Mnt22KsDsNz9s9PGpp+6QvHRWTtXPwYL5VW5FP1NqJGVYmKl4+bySEIhnepXFedQ
X-Gm-Gg: AeBDietmczfeweoNc06d43fxnXqIkV0xb86+wAbPHITZvvgLm+/qOKmGZ/0tbp6IBSW
	siYQTNdcDdVbzmhhxyo4UtGCB2elr5G9hzGGsYlrRXDMgHbuM69zOhF/XzJX0GHPDUJkPU8NjlH
	lRnTifqCauiHi3xxkyYBrVU4qTgrrHJssawK7k1b8ZspDIjxVRNAAwxbQc3e4wxtbGvRk8VMM30
	DNKiweiLBaLZb6/t/5DuzfmXkguAdwU5LoRZPjDdFURwPcnWu5PMObl2/wpTVeSJ85VZRIvvUBX
	/usj9ZoD5mAwstrM2g1cG7uz8cO6DoHWpBBOGGMq03f4uenjSSrfeXhSKPwjgOHwEADahF5wpBh
	HUMYP1vlnGWjpBkfWneUxyHEJNWYZTyYS6PRqgVbbevWebfElWjivWNFeUWWKHhk=
X-Received: by 2002:a05:6a00:e1a:b0:82f:2a78:6302 with SMTP id d2e1a72fcca58-82f8c9027b0mr19301350b3a.26.1776764334977;
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:e1a:b0:82f:2a78:6302 with SMTP id d2e1a72fcca58-82f8c9027b0mr19301319b3a.26.1776764334499;
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebcc9easm17161300b3a.39.2026.04.21.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
Message-ID: <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e745af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oL6z003X9diVxq0giesA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: e4En27qsZU0ZRTXJ3b2lassbJGfbSNqY
X-Proofpoint-GUID: e4En27qsZU0ZRTXJ3b2lassbJGfbSNqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NCBTYWx0ZWRfX9NmaTbLMm32m
 tFDqysvDX4c2lt1btkvOs9vRR0WJlgrHiwkx+fb4Ccg8ZbjIp9dUClqN1Uhqg2ci7UlMdv6UdWx
 8L0JpqRxVWEU8pOGiodVqbqwmFVSqV3zSbGdxLWAmLu9W9y/UXTxCcRK+5Gna/8FvIi/P/flGpC
 aVX2o5EZ3EJ0DHocyFSFp+fG7A70uVOzwncDWcAx2Lb55JN3M86dDmmUGfK40eg8WNp6Gw3irxa
 BlfLFn/8KQe6OYcERyH4yWWkq13QmaYhNCO8EKrlL2M8Dw5ToSXLtozQhtqPmglOEMrDAuzZ/Hr
 Vwp3WbgoB3ePXKMwbL5G9UnbGn1NaiMP/3SdlmXhsUn0j1F6H3N3hLG7OF9m4wI2rwrgdb+/bzw
 Hkp36PegSocvj1yTWG4xX21JlfyJj0Kjhfm9reXxpp/ZapQGf38KBBZqWVUrZ8oRCBFkXizhnhL
 cYZ0DefRboiDnviv8RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103901-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2BA6438F69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16-04-2026 17:29, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> eliza.
> 
> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")

On thing I noticed in entire patchseries,
https://docs.kernel.org/process/submitting-patches.html
"""
If your patch fixes a bug in a specific commit, e.g. you found an issue 
using git bisect, please use the ‘Fixes:’ tag with at least the first 12 
characters of the SHA-1 ID, and the one line summary. Do not split the 
tag across multiple lines, tags are exempt from the “wrap at 75 columns” 
rule in order to simplify parsing scripts. For example:

Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the 
number of pages it actually freed")
"""

Fixes tag need atleast 12 chars and I see other submissions specifying 
12 chars whereas this series specify 13 chars.
Not sure if there's some hard rule on this.

Other than that,
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


