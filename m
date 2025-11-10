Return-Path: <linux-arm-msm+bounces-81146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB40BC49416
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 21:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A1E3B166E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707102F1FDB;
	Mon, 10 Nov 2025 20:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xri2h24q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiGlFDqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13612F12B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806707; cv=none; b=qInyp0amGcubL5WvkMaS0jHy/fUNRrEswaMg0GKOfSTPgfBws0dxyvQaMjpspjn/P9cbo8mRRGULpJYCSyKZ/1X00kjryq3MCjV7m1uXNPRnkf2llNCfJrmSVdXap1Gw6ES3jyRFgNB/sOe+Isfk7aGfGzg1hfPBo889CBl32Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806707; c=relaxed/simple;
	bh=YE6PuNDtpQDapq03SWpJdSQuLlfFhMnJC90bI0n3BiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLHSlPEn4eJG4IFYs9ZGjtj9DxV5OKAMgFI1asL+4Hs/JMSfZMw08Nx2JjuUHTqfYYXoMZE2yzeQ9Ui8gBfYF/trlOU6YBEPaas2Jxu7jwKcv9uOWRMTky/YvtSTgOiVRmCJjh5UjQjvZgfPXq6sOF6n4KRKQwlOfV79wOYOLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xri2h24q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiGlFDqc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFQ7xu4071506
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bIdT5At54DZoymEfDUiwR7h4
	Ocq8orpRWmJMZbcs1fE=; b=Xri2h24q+2MyT9XbcNYp5uUoakuMlmxSRkINmbfl
	wP1Rah4R74hwrw2N5lXsA+ZYK03HZOYndVsaq996VRMCUsO7ftiT5dsdrVz5RVHq
	vmdFljS0ZbsUN7ZZDLoV2vhQ/Iw6BTXJMziUjn8ylic9tQcVwlPSAk+6mEjIzOme
	BuhvgXW8xBpp6iKkNi0YaQXMmQ3yaRrpMpaZ6drxKF0GuQWTb4QFvIv+8VWTp6JB
	ZsGKdQMAu/PFInWyQbWZFvJJFIP0bT0B6hXtH7oZWEtB/FwSWvCvYzj/7VYLi+TW
	CGe+MayQiKVNueU/Mqs1YBqk9Xkm4F1bEBalqhVufohLww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgry54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:31:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed846ac283so4687711cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762806699; x=1763411499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bIdT5At54DZoymEfDUiwR7h4Ocq8orpRWmJMZbcs1fE=;
        b=CiGlFDqcpyzvywIflRzieMSfSAYI5rq3xJp8Bg+QXLCvrDtFEQF+fWNVFjnFrHWR7v
         lzsW7EBfwD0pkcnVqNHoMdKpdTznshYf3MuKZEvXJ/bo7yMs518slyU7MoOMUV6nG4HT
         iBy/E/AmfBMEazZGV4a7uXoro5cILHale+KBWuVt09VNroGQtJMH0ogpMUFqfKkAeA0f
         O5gzlNDz9si4TNaXuaFP4AZ3YoymNHE5O30LR9Be/1x5FIbui6qfWupTuHII4tPRjs1R
         91x4WzZNX8SAvOw1NdeUfUxJIM++3hSVBPS2x7vXY4GCQMMBPfo9lLRp13WGu8YzozVV
         7p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806699; x=1763411499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIdT5At54DZoymEfDUiwR7h4Ocq8orpRWmJMZbcs1fE=;
        b=JwGMbGP+NfXtmF7FwO//Nd9iFs4EsrvXavO3Uctns3op1f4PrdmZV4Z4D8iHJ/qAKT
         ZXbnHZhnXGVB0rIxEcfY1BqzmN/cdc4U4DIdz3vbIYmM82Bwzw5zTbSof3BQtzfusMrq
         tEKP+gET2a11SOTZUCHdhU9vXB0cjgKpIrMr67cXEnzwOFaW+O1C/uOC/m9ZjKq3yYBs
         sRUurt7bbK845zDAThdNsRR9bJONvQs8DeucoARaZ02vwDuPRpFrmnOLRgLvY8v2jDaz
         4P5vFGpLH4tzA+Cnewp+d3mVLvTxkGKjbE+jGgz64tbLBsxgrQOPoXhl6gVG3rQWE/7V
         /KPg==
X-Forwarded-Encrypted: i=1; AJvYcCUhfDzG+7zfrLmGdvKPDbzZYDSXEYRn//8/HrYr4boLQCYCclu11vWkATDkr/CilUAIqGInYLeuNP0iUlWX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AC6AMBUTYt4Wb5wGN5dmQE0vtNUH9zjStr+nxdMrdZ3ukFlt
	QpNNGm74ClMZjolvUCNMiVXRENUVjQiF/pDSooLo1D7BtJVDjlw4lS5GluWDa+YJA7Pfz9hen9o
	uCcdQtS2TKy7kCoyTD1PgsbFq7vym2sQY9qVtg+RExUGAvqm8c7tTvO3KlWuFKlvUffnT
X-Gm-Gg: ASbGnctY9sadGXhxk4zDKWBE8qIWRYuA6OwKugdQECuuIUKtM6iKIzeV0FD0gRR0ma8
	BLU0ha0WT5+keCjYaSH8/gkTTeX7Hh/MRCuDQxHhHivx0MxRmHl9qpjnVzfuQr4CfQapKwqSqQj
	d+ZoALN/1DqKuwqKjp65cpc67Banwgcu/haNsk6I0M1FhqxCgdK1DiF+Vl9bbYiWuHi759iSTyD
	FB9ljmsvm13DbwHmnJBt3BQh1xWD2dDPGon1NgIID6s/mzBqcgSuCNxKx4a1barIosEnmrtW2iz
	8PQypVhK1726J6LwnJ1sB9TnaiCKZsmCGKCG6DMRwtPxz+CUcygt9zmHLjk/cfvqrg64Ma3YTCT
	sFY0NpCqUsXS0oxQkbv4qJpsDBEB/bL/B81HdCNB+la2oGw4xU7+kcspQdUq8Oiy9ksMSxx1QsS
	kqtXOjIzMabZf/
X-Received: by 2002:ac8:7f89:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4edcaaca4ecmr10918641cf.11.1762806698756;
        Mon, 10 Nov 2025 12:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIZbcmmVUaYDitCUIFZPjdhrCzCbtSzSkTsWaMEcYAfRyoi2LFGBk+O42E4nfXG+YHNcdP/Q==
X-Received: by 2002:ac8:7f89:0:b0:4ed:5f73:f82c with SMTP id d75a77b69052e-4edcaaca4ecmr10918211cf.11.1762806698332;
        Mon, 10 Nov 2025 12:31:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a59c4e6sm4254424e87.102.2025.11.10.12.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:31:37 -0800 (PST)
Date: Mon, 10 Nov 2025 22:31:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k
 calibration variant
Message-ID: <oufiptvhpgr47xekpex45wyp3ysoz27ko2jlygoeho5u7e7n5r@maz7m7wmwkm3>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
 <wqjil4hhrbsozvhwdf355dqpwu736z4x2nwnurug2bpx23ed3g@c4shkwfyohky>
 <5fbe9d10-5d6d-404c-8f47-e4a12ebe7eeb@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fbe9d10-5d6d-404c-8f47-e4a12ebe7eeb@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NSBTYWx0ZWRfX3MhR/j214wqW
 DVazdrZp65Bd2ChqsCWEWesZ28gO6fLEDwbU+YRtsiqTBejJYGMm3MKD806YWvpBWYLYJSCHe4C
 vsXdrJmluRlzGpDFHDYcWPFdmOWKjppf/t4phrlfuuNfkmbS2hgGczXGpcm2SG+ZNWELv+LaZbC
 Nyv9kcfQCytyLu1Hbsdc7aw/NQBCv+8HEHsIaGDNVVGqVVAg+BgyivK6qvENLSR4nooI/TEAuNy
 HKbsC9/JOD6gHAeeESEpcKV7VtfRBEWaGDN2ymle5ikXDJ/OeX2MukH9HrFJbH8sGJRqbXVYnZP
 AmosI+VXQfvXf6oaFs+lRaN33Qw4zugmodxfA6eJbJzN+qeT0qwQw6wh7TcnVvDJ1GA1oMM31LH
 TYsL2tyrA74DEOo0uqZIWPydALEggQ==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69124bab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=uFkZ6A_fq3OJCtIxTy8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LOb7iJ94ha6Hm_WceUD0Oy3HmrhS5g1P
X-Proofpoint-ORIG-GUID: LOb7iJ94ha6Hm_WceUD0Oy3HmrhS5g1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100175

On Mon, Nov 10, 2025 at 05:04:35PM +0100, David Heidelberg wrote:
> On 10/11/2025 16:58, Dmitry Baryshkov wrote:
> > On Mon, Nov 10, 2025 at 04:37:46PM +0100, David Heidelberg via B4 Relay wrote:
> > > From: Dylan Van Assche <me@dylanvanassche.be>
> > > 
> > > SDM845-based Oneplus 6 and 6T have their own calibration files
> > > for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> > > Add the calibration variant name to the DTS to reflect this to
> > > allow using the calibration files from linux-firmware.
> > > 
> > > [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> > > Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > index db6dd04c51bb5..a0c2f6efec59d 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > > @@ -929,5 +929,6 @@ &wifi {
> > >   	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> > >   	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
> > > +	qcom,calibration-variant = "oneplus_sdm845";
> > 
> > oneplus_sdm845_6? or oneplus_6_6t? SDM845 is too broad.
> 
> I verified with https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/WCN3990/hw1.0/board-2.bin
> 
> $ strings board-2.bin | rg oneplus
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=oneplus_sdm845mmm
> 
> $ ./ath10k-bdencoder -e ~/Downloads/board-2.bin
> ...
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=oneplus_sdm845.bin
> created size: 19152
> ...
> 
> Since OP6/6T should have same WiFi.

If it's in, then we dont have other choice.

> 
> David>
> > BTW: Were those board files sent to the ath10k ML for inclusion?
> > 
> > >   	qcom,snoc-host-cap-8bit-quirk;
> > >   };
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > > 
> > 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry

