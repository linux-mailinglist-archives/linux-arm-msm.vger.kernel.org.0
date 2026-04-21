Return-Path: <linux-arm-msm+bounces-103883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEQ+OVwS52nL3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:59:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD1436A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 07:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E947330233E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 05:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11DE3659EE;
	Tue, 21 Apr 2026 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyWCfznJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY2jaFoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1C34FF41
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751147; cv=none; b=jCT4fwpK+9ZHPLSrcdna5V82l7n2FW+UiHVXzYNJtr1czLHtcs3woarP+m/5E1uVsPMFyPFKw9XKobzLhoUz/DGTfB0z3qIuuSDaqpIWHSFkUySsQNK65g164zcJkhyuF/YV1FIwBYttAGc2iDizAoW/W0Ec7BjYsX9Sa1cq3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751147; c=relaxed/simple;
	bh=g/CnjycFgb/w7TP6KvTEF3kp3w7+Ae5Ok2KVIGyAFS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2wPYoikyPrphKT3+E3IH2ndNyje9guJ46rve2PMb+FlBgE5X5Jf+hJVbRc+oSaJARlPCE6dQc9gbO0o9EkZS2YxyLdQJOQyrNaVpxhCZOFC/hfT3GKDgNg+XbZXjUjjxMu5zkgf1Y/E2Fbob5WjDXfLJljU6rd26yc5MnkfXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyWCfznJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY2jaFoD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1UHfj1599908
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PeWfUqzN8k4bN1hyibqxpIMf
	Lo4P6txvt15c1HjmL30=; b=oyWCfznJOlCpoLVqg7TNw9mxubIG3dcgiHoLOrId
	hM/cYoLeaIRmZqQ2oa2mLIXuRk+OcLWViPwogHccQcIzS5TvlqhA3AbhZhawLY7b
	5ztKvSHGwyOYF2+SxdVeGfDyXOD/L6fBsCkENd2suYCfjQY+5xa/jP5zEfwcO0dw
	AhUGjZCMACuGx25QrqjecCD5Hnrbc7nS78xNALtG80i0NNw/6CIPu9Y4revAuhEA
	y7URE2VD6BSD7SqlJpdhLDCWzYIr5iATnKhFUqP7/DTTT76dvxDio5z/9rFTf6Sb
	RWubMgPEPQ1C7Imr0tkRWzEdoIgx4b/UxvAlUaG+6AhvZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh89byvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:59:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ec948174so36471095ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751140; x=1777355940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeWfUqzN8k4bN1hyibqxpIMfLo4P6txvt15c1HjmL30=;
        b=hY2jaFoDAkXd7ZdnpT1mjUhm74I6IsdSoV/JG28wL7OerzsumPXVC4+/nmaMzQlUZL
         up9FyK7UpxISR5lXV0JXZV8iGpbCtcbuZtyh+GEG2LY9MPCvTh9Hcly8Ghk/NklbES0K
         rVmLfT9+L1uJ8Nu7FnyFCzVTbMvd0kXaNIWntualvmv5ferWz4ddS6S+8sMmk6SEmPzD
         ynCQmorcwPUz3bzVnMKpzOFTTq6DwNuQph4rMKTEZ93FMSrupTovftZRVBDG9qkwq+p1
         5JDg4Jhn2I+kAuJ1y7/GU1qb85s9iVdEsm/lyDHI0nJh8+1gIDUFjfdxrj8vO5R1WD95
         MdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751140; x=1777355940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeWfUqzN8k4bN1hyibqxpIMfLo4P6txvt15c1HjmL30=;
        b=DO1JF6xZG45oXlUx8gI9YUIcbaSbxzbcxt46mRu5yMizzUre0MRKn3Wba6OE/fV5yO
         cZqyztDPP17r3rNkSCBdmlges9knGl1OUraBeCUPl3LiM2tFkNuBiB8QUxLASAn98wV2
         nnVdrI7a/MVWv3EufVSuwyNHHaVDZi6qrOapqM6zOAfmk+NfiH+qPoq454cw6Qr8m9If
         jTQodAI+4Qjq24/4Ws1yl4e78RLmtFBtHpFadIGoLentjFKA24O/qzPyGHbavpxZvFhQ
         0mhcUj7N8cGGuzJolWA0XRcV0HwmkRTU/z8H+Mn2wR1irDopl3YS4JcR8NMaF8Iv/Xqh
         5ZKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yOrmd+jLvbTvR8xNEXshTyxa91h0cmUDtCGLv7NLYUfMk47qhcJtRP1Hg9YGXNWcrbdnIjJBG7/BNGGr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwU//eUGNyEMW2XrO1Al13nbJ27vbyaTjIA28kfspPCkakRy0/0
	CQP0Wxy4CeuRgd7lAcKjMj8vkVV3YUL3xVQsSZsJWYZDddAWkTRrj2yoYWwHfJd2M6mlKuhARhY
	r0T3tQ4jnNFz5vDMFI7ZxnsLU9ztWyllGAphyz/1Q9onTad8jGpLTe9brmLjQrZmCipts
X-Gm-Gg: AeBDievZIU6bcMapjqPnvWCYwtHyArR/pzz2CeADrak2c3G4rNagbl7R7vAwTIDTw7k
	uBud5DZTTEMNzySiFscoovVeAbe4TIAicQQYNhX5NcrFT78f266Lp28zlT/AAOVycmH13qjySbR
	jIBimgH4LTw6ocp5CcWlu2GcFC5H9S82+S8yldQBOytWjJNMrOPlShl2amvZojxVwMSNiGLxT2u
	gEyij4c6XljarvkQtPdDx1po1r5RPcJjYFyA8ztabGkhXS5rujrntQgPS8Mp7hv23YrA25w2QRR
	3NYXZn7FBIZ313k4yN5h0+t7kmj05Sakzh+GpmtKNunOlR3LJ6cwLMe4SWW22JZsl0kHVhxleOM
	BaHZOEcx+2XgjmrhaQaS29EUKDdb5/dJKyxvJ4HCa1tZptbv+R3NaLm5yyqhPK/bEqidBCA==
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr177240705ad.27.1776751139693;
        Mon, 20 Apr 2026 22:58:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr177240255ad.27.1776751139098;
        Mon, 20 Apr 2026 22:58:59 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm112915165ad.77.2026.04.20.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:58:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:28:50 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <aecSGmAWyzf04BIU@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
 <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NiBTYWx0ZWRfX7itWjoMpyZYm
 jMdmHmXQkj+RwqyJ+S9cFJTsOo4Mjxrq9H8D+iL/LziG0gDMKDjGVyagDQ2oI6KTXGiQeDHYR7j
 M3BpGX6SwNyxxPSgMZBbPptvn0WMR4mX73xhxbk4eDT9p8TCSoLg9gI6+fbSTVCq5cZwa/VBKOf
 vUILNNQrZgK+fyvAAMPiX+QX6hNa4Kk8K6lrJwyR9tfFQsevzrLdcH76pIzm40lo/rYxelImkVx
 w61p1DvnQ7xnLmvEJuo28sX+T0IxfWBja0AQf1tdrKR3I6hqiSmcrXePtL0CSVs6nzmIggT/DtU
 dfW9AIcYVHGPusH/4s/aJRnEE9VDK+NW3kIzq48LavVP2g1osNOKSvepzXW53e/dAJfe5tB3z2m
 vMenJfrARX+QeNtMAfVIBaIk9KHuM/zSCT41gv1AVjW/zGzh8TZuo6AT57cHdvaMqEYgvpaHEw4
 u8GxLurk5eWK5RMbeNg==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e71225 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: CgisYIMaRV6017I2cjhceA7W7-Tvang_
X-Proofpoint-GUID: CgisYIMaRV6017I2cjhceA7W7-Tvang_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103883-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65BD1436A54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 04:23:51PM +0530, Kuldeep Singh wrote:
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> > platform.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index c899a17026fd2a10ebc528a816629c88ee3bde5d..b0aa1970d42a3bb0b9d371e0e6cd09b8cd164dbe 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&rpmhpd SC7280_CX>;
> > +
> > +			operating-points-v2 = <&ice_mmc_opp_table>;
> > +
> > +			ice_mmc_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-150000000 {
> > +					opp-hz = /bits/ 64 <150000000>;
> > +					required-opps = <&rpmhpd_opp_svs>;
> > +				};
> > +
> > +				opp-300000000 {
> > +					opp-hz = /bits/ 64 <300000000>;
> > +					required-opps = <&rpmhpd_opp_nom>;
> 
> As per hardware spec, 300MHz is supported by SVS_L1.

Sure, will update this in next patchset.

Abhinaba Rakshit

