Return-Path: <linux-arm-msm+bounces-82124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D4584C649AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 99F2E348EEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A743B32E6B0;
	Mon, 17 Nov 2025 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwW+gQ1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMT4byCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346323ABA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388709; cv=none; b=Z3l0WUs0qV/hu6MDDHo1aqRNXCnfslhL+ZufniLuoG4bBWCF3ZkBKduJf7qwVLJ9c+oJBQaXTNaavulIL50X/YXBtmVGWdxFdbLb0lZxCH5dFjGaJgtiOddH/wm+mjMBuSPg2aC5nTnz4u4A9GLHUEF508Gi4zLheIPoleQfso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388709; c=relaxed/simple;
	bh=SU7heSg5zapbqrEFBITwtgnp1Q0ghfjt2PmWzfpMmCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgkOrd3s4vIxJzz9vymPFB6DyqCff2uRRhQpnN+d9xdMLopqnle20AzHJCdBDUGH++rDtx4ti351OMtSBTMPH1Rul5sn5WF2GV+OQRLujdj2Cs54gZwhuoRMYVSOC8SqugDo+IxpYWnveiL/tp1NEozIbg7bon2T7h+e1otcJWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwW+gQ1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMT4byCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHApkfF3920779
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=; b=VwW+gQ1bZKZ4bchC
	0eJAWTU0VhFxfW1xuIn75ZsOvLyxTQrNZ1t8te6kxDyjM1hZVtlBS5t7caEgkLne
	1cVCEybNvgdIr/8kSF6m8DwZxbJ5HES/sOt8tYmLsbJ9S8TVboE/HkX8gceqA1TO
	/My0IsHahPTUpNJrusBF72DkQ9NgV0eAKTvwYwzIR3Gl9O5KDpIeQiPu8RlccaUH
	a54WhQPVksyZz+wN3Ip73+XBZo6poBe/3quHKAJpSr5j7RGUIS/YOAzBZ4J1dxi2
	6y/XlSMOATHyo7jb5IgPoEfEy8fUy77ri1l0VTdpC4cwlhRQvvpNx5UhHurjLZ+3
	1gEbRA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8htm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 14:11:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-937294e4697so243179241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388706; x=1763993506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
        b=WMT4byCul2HyRC5YlAMfKNgd1eGaTwW8okgHbgsIYiLjLumNJKlh/acDrblNaGdVp0
         ODTfejtnGdD/qN0Lh2du/w1+3tr5jYxpvPYIKyiO/qYtqph6TEaLFMYtp5qnB4FOnXI/
         7BX3qgDiiIxBjFTSqst1wJFpNl3ZhbZvDoYT74rsaBPVG87Ecp9T7lW2ok3lOy+ijpqv
         EL2pi2y2lx5PTN7dAc9+fmMEKVtJ8dxKDo5Yc6sK04NPzObXxNicK3bR5i7OFhYsScM6
         Z6PK57HqIHtzv1vAHMzkaBLI4TiW2/BimS6q/ICpz0KsqUxwOdQk8/DLoQXFb7Sduten
         EBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388706; x=1763993506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
        b=iTlf5DA+i6J4ZEslQQzWvujDp5V7+K72169xKpXrpha5iIYPIxVKvQMWTix+xi6E1X
         81yarOyct/EpCwwExnW2ijmhwiDKBseLubUL7RSAxxFJNAFe0RbPkrc5iGQqTT0/4LDD
         I3Yk0NFV7R1unwESJ5HrqoWEJ/8NeoDww04rVyf1maIwNdLFijnxeO8Af1pYyDuCz+f+
         mZU6MEaWQD7POhG6vZBKsTz4ZVSUmnikaSNmpA3YX41XCCWYvl1Tu5Ift2ozGsQ2zdPs
         xKxWrpYVVw0InmKaRvl3HkdtiRlQziBNRfm08+trFgjz5sTW8mc+XKPnPzFZRdYpkEGx
         PaIA==
X-Gm-Message-State: AOJu0YzrnXy48vaIMD5H9ORwMNB4Qz9+e3n/EL3esP7ncWVVafCIRIa/
	zWxOyfff8NnhfEGMckHp2y5YBw63lrf4LAuPIwjjC1mxJc5kLRYlesYXF338AFk5gqDGM6Qy7pB
	H2c/qXBQPiYk7My/zXdR8V6VpNAm+b0WUmBAJ8ui3LPrFGl2oQejh34bLUP3NUJVN24TO
X-Gm-Gg: ASbGnctDW8hGwiA9s89EXkF36o+i5ZaTtxoEwKblytkTYmcqJ/mE7Ov/bb8ic10A6p3
	jnudmgI3Wh8ICdhC60/6DRX1/jCjeE6o0KYIWi463GHBHEiGYROub0z1i6Q6kpbSRYUY+4nS07W
	VUIRDR43KKvMSd4NRpp1BLPWgST1g6zjjp8/FJlvvwjgsFDdgpJ+uE/yfczlO5/cgP+5mQEdPdu
	CFPSD8vpaIOn8lD09i0yObLvhr/KC1IFpjfb5g9M2gLs2d1wLA79mK4g1eP1LAFn9iz99u1tF7R
	Bm92y62iDs2C4F5/uimdGXgkJcLYe9kDfWCYT66PjFCRu6bm+Mrj2Whs8d0DY6DiKTommbnUG2q
	N61hfNFgNJoi+znoXvGlo/aMXkKKbiuVBMZkviX292rw87ta4hniEdCy3
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5dfc85a1070mr1838397137.5.1763388705858;
        Mon, 17 Nov 2025 06:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENBd0uWmCrys3Bjr4M1SOKmS2/3SUY9Sd2AfbAO69+iQX3Prr35SDtghb4rlEALS2PgI5ogQ==
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5dfc85a1070mr1838348137.5.1763388705349;
        Mon, 17 Nov 2025 06:11:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdae69fsm1066684766b.51.2025.11.17.06.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:11:44 -0800 (PST)
Message-ID: <e2d50441-bb32-4a66-b00f-7c656c8817e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:11:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b2d22 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VffenE3n-DyGx4saXfUA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: I6heTet6xCpF7i8F87W-eJBwJGf4QoS9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMSBTYWx0ZWRfX9OF2B4wTYU/O
 MXIGowxosqTaxso8C1C3jWhCT3kQGiSD5ZkgxR5YJOfwPz4YrNtdmnRBBWX3U54RA4/vK5D6ZO6
 6YbeGaIK9cA+/W9clKhP6Xf01hUHoHP3ZDkVGNIV3nw287bk4z6FtHOu8tE305ToC3E94JOwO3e
 SBi6SjwF5eFQI7UeZNTZmHAIFC0JCmsr7QpI0ifF5ENjl86cN4lCIvhSFh4O1xZV6RSFmvoNtVR
 58IOD7BIGXYlPaaXSE1gs1s+ChxbU8rXehaO9WcriW4tOhyUGTrtF/FAwTzk/LFu7pbfCy210nU
 6OM2GF1ofiVSsemLAqcvJNLp1Iabn9Jc/hCB2BpCX+4Z1BYr+DB/AP/LGFjN8e93ussqE2869QJ
 rGgyuxHRaFpF2VCEVWf/EfgvXOuM+Q==
X-Proofpoint-ORIG-GUID: I6heTet6xCpF7i8F87W-eJBwJGf4QoS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170121

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Current logic assumes that the voltage corners in both MxG and MxA are
> always same. This is not true for recent targets. So, rework the rpmh init
> sequence to probe and calculate the votes with the respective rails, ie,
> GX rails should use MxG as secondary rail and Cx rail should use MxA as
> the secondary rail.
> 
> Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

