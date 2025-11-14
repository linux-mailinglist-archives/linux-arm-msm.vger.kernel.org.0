Return-Path: <linux-arm-msm+bounces-81886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA19C5DA34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CE3C4F1642
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B510329389;
	Fri, 14 Nov 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxOhnBg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joR6SdeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF87A328B5E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130410; cv=none; b=bnbysnfaeCQLlG3/PGqEigglO5pWgGP0WjaZzc91sZ2aYvZmOci2s2fXuqjPivvzGeOKN5Ohyt2R9od0i24IjNsC4RimrK7f7vyWyekiEyYmg0NpvQ50ZcSEJ5kRZXjeX97thzgcgIMIyO3BIVKtn6trkB0EvRSVyBe0IdLUVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130410; c=relaxed/simple;
	bh=XsC1RHMqo+5fbpwRlVHrhXzX4C7rl7hLD88dSZjaBoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oztjhsSTjT56UNnuEQIOyhBi6sUOwuoVKtrO93cvjUMxgZj10+O7L+oasZEnf4GkGqAXFJ7YTuTsrEpU4sky+wLaqsXB/9SmLtjh28/oRx+c2wXzB67GzuWoUhG//WBDrU50jZPIkq4TAA8KcltJIte227ULBJv1OD1rOgMZ7JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxOhnBg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joR6SdeP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEDtkbK4117540
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=; b=kxOhnBg3XvmjeOzE
	B3mQ2nJExBuvH/Y1wuO9u5ude7VfF2xLSaJ9whpA6bv7gEj7rk5fy9tgvj+f75P8
	eyXZWQVYCkUF/0hIS6mz00UhIss8JQs8vB1FwQ3d6wQtZupaKaoj2YIXRlcofmGg
	fXm5lmR889etm2n1YxjnynBgJiIIKalU1+1DHaDNmfG2nSlLiyy9z04LlqQfXXz4
	rpUCatgUdcBsET0IMdquPxZc7jRQjOlwtUKn6LQQioXlujibC5+YZ9ZPgKvbcPaU
	NFHaqWFSAbDaiPuUANHlJDruvGyumFQaVp0ZTSa9vdVrzf9A+sx9tz2WjgSWx8GG
	xgfJ0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed846ac283so73978821cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130407; x=1763735207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
        b=joR6SdePTUxiPab45et7TlcFRbquwO4SMf2GqT+xDmcl7u8Rs3ZxU0boiups+qcs7h
         2kBBY5NW3tCA4u+1T9ak/ZLcmpi0aBC0wJqzB0BJU2z3XN/2QHVmLbBho2RMslTLGBIa
         frM6smtw1oJhAWuo135nbF00dTq0Rn/UlgrtMhCyK9PL4tZh+6NA2Th7qNtgxspJ45cy
         hx+mzLUl/y60AZ/9Pn+4vyeN7PMWxM61dzGM5biBYJo5pCCdCIG4lpOXsyrCZKueh9qZ
         ma56WUJ6515wCr/KJ9yS1FG1id2XG3JO4+gRoNLPHjd7BQCtdKA4LIx4pTs88OLfFZbD
         bovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130407; x=1763735207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
        b=uxb2B8XJKEfopSaG/qWI+Rswf41fH9/OrLXUpQFawMevaMKfyMkaLrpbaHsZ8Lqo0C
         PcuF5I1zs917F8zTvtYerN4pHFJtlkdHbFkt+JY1SjKErJRwWVNGQDyNJRDhcSlF8PGU
         GtvHmtt+fTEE1ZNwObN7+/xD6B3g2peCtpKiCCdZJXzfvRaAOJEBb4f4tLR1WawPf8q6
         dEbxpX5fjgh6bXF+o+lfF2Bl+nEHr/B5nebIca88wsPTv6eQCUOYp5JKMHK/F/7ryamW
         GpTrt1UWcU82SreHsto72uLbeABjlq8rpdii+clEI0FaePTpivSF2aWtz2/i5TO9nmIX
         8whw==
X-Gm-Message-State: AOJu0Yy4Kkn9/fp4WUq4am7A+7O19YhiWwRHkswKllbnrge52xvOSyET
	F25aheRjPUqUca//e1hlfdbg6syWUGUM/AkjL8S+b6bN2H0IOYgK2dSnjJEerBdVOpSWcL0/Ddt
	a+8jxRES4NLKSX052Y9x836k98tRrFAgLR5X4WjgwZFt2Qoi6G531j8pRCn4H8gUInLTa
X-Gm-Gg: ASbGnct11+qbrQ+Lx/BUvpiQzNIsCDxDB7vbqZaq71/cKaMdSH94Fw/c8EqeHAs5mcI
	W5pVZErNe0a0a4ZNdhypd8tLe8wOfuZF4hhIKFUrdDOC8DjdfPmE36Ecj5kk2k2K5rv92JhfDim
	YtFEoNE50nN3jXX5l6K0EYOaJdiOiWTDAUAqeqCVn4BOGnHsaod68w0JO1yZEA1Ve9K5WVC6KJO
	FGdGX+94rrOIlNUhIHNheNTDl11uN7eNY0/XdnSgeoTZW5q5go0EUer3hRVM+x35n7KiByK+WcP
	LqR3rpcOckUplpC4d9cL4T8M0p9wQLERm3siDSZlivUkGkHmZOBY2AVfE/I3swd1mIWH+oi8yq3
	QN8TsSSX54ZmcpHYclcC31sIYl+5jxSDOxx5UgGGW7yjSSJQsbUIEwIAN/BVr00pwYXFkfc9Tgg
	TNyQs9b2Kff8b7
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ede70ace82mr110839481cf.36.1763130406888;
        Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmQo+aCQCjvCk5e76s4w1boHfDoEoeJkhdDuyaoO1EvXqxjOf/iL1LbyOWdf2SGW30aTGtBw==
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ede70ace82mr110838941cf.36.1763130406353;
        Fri, 14 Nov 2025 06:26:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/4] Add DisplayPort support to QCS615 devicetree
Date: Fri, 14 Nov 2025 16:26:36 +0200
Message-ID: <176312947282.1737000.8802274913506269356.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX50s+1I/GM1mx
 5JHInX1PWpgU9WO7XqyM5vlY+fIV/tgdfYQC6NG0X4NfY/rHqQNh1Nh3oCTKT4V05IINXd6nHEQ
 bqqe2ZyTUrlFWxH1xmex7dSh85E7cTMF9U/aLCM8BTHqmqT4mIygLuCduPfbTtibMGrJTjHsYOx
 +vnLv66dEcAoI2bKWWV4RDtIj8cm0qW9T7XRt2j2EvTMr7n36yCo0ZIr1fOs19+fJ5Eb2HPSGju
 IpOCotWfBMQ5ZhGABh35rdgymC+hLh6LFo1kV5qKgou7iXR9z+Y3qgK+ShHNabKSC7mw4L0/RQn
 P/eZSHmtyFFsdgrHL7vVWlEr2LphV0LoXALR78V6TEhlwNOdIw75PEc1wpPmX3Qx0MyAt+xal2f
 JHEf/1UBtO/rwi+vka/0yfqZbRpS2Q==
X-Proofpoint-ORIG-GUID: donwAgmp-cQDWx5-tigx3wQzT9hfNILx
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=CQcgnb-tr3BYDHGJJJgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: donwAgmp-cQDWx5-tigx3wQzT9hfNILx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116

On Tue, 04 Nov 2025 09:33:22 +0800, Xiangxu Yin wrote:
> This series enables DisplayPort functionality on QCS615 platforms.
> It introduces the required bindings, updates SM6150 dtsi for DP controller
> and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
> connector and link configuration.
> 
> Depends-on:
> https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
> https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/
> 
> [...]

Applied to msm-next, thanks!

[1/4] dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2e6c262a5d3
[2/4] dt-bindings: display: msm: sm6150-mdss: Fix example indentation and OPP values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5fb24290cb5b

Best regards,
-- 
With best wishes
Dmitry



