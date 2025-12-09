Return-Path: <linux-arm-msm+bounces-84809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDEDCB1624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63E443026A11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB812EBB9E;
	Tue,  9 Dec 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxU51V8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro7nkgdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED52D7393
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321727; cv=none; b=PExcXI8AGnBx2Q7UFgj8cDuXF0IJs7PAlX25jTD91TexBB2o42YpFEduzgcXwKNB8r0Ec6PqhgsJMQ/gg2W4kR3mBzgca/gahV55/ZjGIh+B2TJoUOgrLVz1+S9AW/nJEyQz4y+Ajm5AgRio+jPX2anH1h9a/ME7su7hthJFDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321727; c=relaxed/simple;
	bh=RggnFRerv8hsIKUZc7qQBZN4oETeENLNJO8PNQFwc1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVSqKAIsNJwKEdrubXXk+w7U3s/fgCHzz56Cs/RFcRudlfZsJEdlEk9pyGoCK7ayTxU7FgkPb16xt6p8zNIaVJ+AMUyKxFQrxU7MIi8D6/55JjNSb6e41jKWPpSShWI70jfIKBpOmou5ewL9oE30+5toCvMMBm7GgNoFZ9fCaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxU51V8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro7nkgdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Mm3b9534678
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nw/k+y04U6jU6a2niMVM4Ies
	iFGnNwuLaJSlSX2a1Hg=; b=UxU51V8LToH676GTgNfTFWZ08J0a91R7CmnkM+Yc
	Xf+4YR0kFcgfRynm0Ws11uljkfkVkoa+z5A5oxi9/zOkx19JHraqoXyQJ9KXhL8r
	LtSm3MlDX7Ch50KANaLGeFNrZncufLsn0a/BGFGqGG7tfRnyMn9uZQQI3h9//pA7
	DvvzBhUf55EBWA1VLe0V9PLSymhmQRsY6G7IlZvE5Zggr3B9ge+BxdiMxuhE2cuc
	crIZWGf8dp3LMAdd213mO8WF7WDqqrnxtN33RrDbF9wjhdQN1tdDSnPOlnqhUWLA
	sF3gtVgS9MPOrca6CzSQI15Pnx2QMkubnz7txBI6+WNqyA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqrajaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:08:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8824d5b11easo128805906d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321724; x=1765926524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw/k+y04U6jU6a2niMVM4IesiFGnNwuLaJSlSX2a1Hg=;
        b=Ro7nkgdXlClmNt7xGusGkPg7kYgMHi/SvamSjPyRrcj/G4imWD3LXxJdRFV05l7kOX
         vDHD9eEii3rcBoplpTdEsgXiEVFHMp27tIbhL6Ng2OPTundCVDitYopWw855c9kVBzuA
         wsb1+dSGerR1HQ0RAhSBeF/F4mbZy91GlvcsJ/ZigHZw/rDTAK3La4ElIIEokmt9W/B8
         fJ6wLOOVoRQkP5EVyGRugPXTemY41gOfPDOlfmH9HRrQgljdXjUuvSluoWDewDVoz8ft
         tmE9JKAilL/i9u4FQrOR1K9XHepAqye+HuxysW9acBL4nR8dA6dlXYwa84kOAiKD59Dt
         d3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321724; x=1765926524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw/k+y04U6jU6a2niMVM4IesiFGnNwuLaJSlSX2a1Hg=;
        b=OpubHfQTDA8hzq3FXPAKzgXnuAa+/VF+4GWQK3nMazASXRtoVtLS9ZMkGuGZJbnVg5
         J5RpZG8SAEGoOASUqU25k3SZuwNNwra28VhK3IRiJdRzJ7bVh9cVcO9MMAtslv5JLR2c
         FrZbWS1YvYVW7PIUDY62zqcRpkwK1gUioICgEqaFyY9jNyRo1mVMJruySc7mLvn+qlx7
         DtBk9WF/qaGADkiOxBl9Hk9Ygjbr8FLxHqycj8natsvTlJlgUWAEXAugJSVqq9purPHz
         toHfPG3L+JB6RxwMWe3B3fJIqsCm8/7kXuH8eeGa+QZ8IHhYSOnVxGTjazT4+IrUyFfv
         Oz7A==
X-Forwarded-Encrypted: i=1; AJvYcCVChl+amNj67fQhDLVNPwqqFsHpfwBsvZqIqHrJ3X4+pYCOZbwBVZolnoVrcOXh16oHgfoFSgtMM27ZiX+j@vger.kernel.org
X-Gm-Message-State: AOJu0YwCr8DzCetTOUDcFb2Tvh3rYffVQcBGlopom10h/W3bluseVZbl
	5XfEFZeClRy1cWeXhnW8MuzY3DUYRB/HqnVSoWg/6jXPObp99f9rYbOviCX/E8/qvoLxJ+5+bPi
	82UmSkQV8RuccZJPH0h4D2F224mAv4IHoGtpcQcz/gkXTT9OilYwat4K5TGQVIy3lWu1x
X-Gm-Gg: ASbGncuXAcHhImwgpW0FtVLc7DFUPIiBAc6wo/E3r7BAGGA0mPeQE15zln8G9xFGXCC
	wyVsTcXmZbkKDy0Nh6UeXmpdH4PRf5EGMiVF5YwILU56kIVT1GcVfIBRnyD1Kerpiby0HE1NvWT
	ziZiuFwnRbia5COF+OIfp/TqotCbza/c0lkq6PKz+s4oRfMPckmJm4MOinKfzbytVijJOZ2nMXX
	N1LT2hoQUn2P9Cti6X7ml+MNilbn1n/8wdM3X7I16ZOuMMsCgrr3+6hwK54Vdk6Jef345WpBM13
	qypYcPLCjJhHrWESO/RTLlKZBtV+sR7imCHctKUQGhlLh3rpZAQ3x1r9XuoEsOx2zOnM1ICM5V2
	V2lptQgRUPXLgIRmw6CgG3g07XgNHBpahO7hYVU5Pbh7uu22+m40PaS516QO8Hkl2SX4g8E5ktt
	y/agcvfLuOjRYHKNqFCid3Ds0=
X-Received: by 2002:a05:622a:40a:b0:4eb:a10c:de05 with SMTP id d75a77b69052e-4f1b1aa2d0amr6378731cf.55.1765321724185;
        Tue, 09 Dec 2025 15:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLQxtlFh2VNMT8KH7jJcIohZ8y6Vtq6UgjThXj0mxceK+qvv622oCeQfxIrXcIbk4vSN60HQ==
X-Received: by 2002:a05:622a:40a:b0:4eb:a10c:de05 with SMTP id d75a77b69052e-4f1b1aa2d0amr6378401cf.55.1765321723792;
        Tue, 09 Dec 2025 15:08:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2820bsm5476555e87.81.2025.12.09.15.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:08:43 -0800 (PST)
Date: Wed, 10 Dec 2025 01:08:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm850-huawei-matebook-e-2019:
 Correct ipa_fw_mem for the driver to load successfully
Message-ID: <vlz4zg6wnxvxz2hqpzinzxztghwxmx2wwkxl4ami42aqvdjkg5@7o4fvadz76cv>
References: <20251208031511.3284-1-newwheatzjz@zohomail.com>
 <20251208031511.3284-3-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208031511.3284-3-newwheatzjz@zohomail.com>
X-Proofpoint-GUID: WEA86PePvGNMM5KDGtVAGuXHkPMj08Aj
X-Authority-Analysis: v=2.4 cv=UrBu9uwB c=1 sm=1 tr=0 ts=6938abfc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WV1l7McVAAAA:8 a=7HaWKvWDqqzqtm7Wip0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ly-PvpxawfTmY1UqWLBn:22
X-Proofpoint-ORIG-GUID: WEA86PePvGNMM5KDGtVAGuXHkPMj08Aj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX9hsx8MwZtLo0
 MjhsAtC9sSgu5vfoz20TaaRkMcVJbKPCStrDTmQj3wGwdzTGizstOx6oW7hTolQnksRKzGjU4kS
 7q3Efq2fpz0Zvk3O+VKBmGUxbMpDKkzZtJVjLFHGgF/r9JCSDlzacNHJhNX170S+vXUrtnXitl/
 ZZ8q+hsdn15nVbE2iofx9qbVXZ9NlHGBZUMHhZPU4vzQL4DhW8zh87DRTweTbGiWhZ9T4xOYn6b
 oOGA5e4Sj6FHYzPbhASwNeVv/xM/DF8iy+vzwCDHeSL7zfGpkmugl4TCQx0RBg3AC2iw1wOnlb8
 C/lRGATtn7aecvyW8DKCvtKSzxTYRP69qpF7xdwpZjYdxVkjYskhq8yes01EQMCOAUIMT69VUPz
 OMl/ZG17ADxQ7JziJXrDoI61L3G72Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090181

On Mon, Dec 08, 2025 at 11:15:11AM +0800, Jingzhou Zhu wrote:
> The ipa driver refuses to load with the old ipa_fw_mem in newer kernels.
> Shrinking its size to 0x5a000 fixes the problem.
> 
> Fixes: aab69794b55d ("arm64: dts: qcom: Add support for Huawei MateBook E 2019")
> 
> Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>

There should be no empty lines between tags.

> ---
>  arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> index a5f025ae7dbe..f04865381870 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> @@ -144,12 +144,12 @@ wlan_msa_mem: wlan-msa@8c400000 {
>  		};
>  
>  		ipa_fw_mem: ipa-fw@8df00000 {
> -			reg = <0 0x8df00000 0 0x100000>;
> +			reg = <0 0x8df00000 0 0x5a000>;
>  			no-map;
>  		};
>  
> -		gpu_mem: gpu@97900000 {
> -			reg = <0 0x97900000 0 0x5000>;
> +		gpu_mem: gpu@8df5a000 {

Why are you adjusting gpu_mem?

> +			reg = <0 0x8df5a000 0 0x5000>;
>  			no-map;
>  		};
>  
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

