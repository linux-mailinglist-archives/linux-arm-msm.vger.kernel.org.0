Return-Path: <linux-arm-msm+bounces-51719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D74A673D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66E451680E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC1C20B208;
	Tue, 18 Mar 2025 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUyifBEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4CA20C000
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300813; cv=none; b=I9ca0lOJB400EHB+LkjgxEC9tD8Xgrl0knHTOEFr2v48DAqGGck3nrTvv3FIIjlf5sPUMRlXSda/1T8jip4rJwUmwrbPTvQyHdbSrfdtJb4+OIj/hOruQMTtH+zuL0DPIACk/beEmG+QHxSlYm5VULY58Lv21GKJ+etpw86Iy4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300813; c=relaxed/simple;
	bh=uousjQKWNW+e5mJRSDMmDWWJjTXOsonCXs2/axAtZ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URPqdGO2HCrMEL51RaMNKnBPXiDHCgtxrBKw8uDAxOsPE7LJnGKQY0CNBIvI24SAwfeocuFo0u3Npn0psv2DUrKVauPDX6kJP5eAkCtWwctUwAw7EOwVxo0LqPcFkwd/rs/8pzVVyw1OArUkcth3IO0u15s0BrQowM3bc9JOF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUyifBEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8Qs0w004557
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fn6o9sruIXfwvCI8WMCUouk1
	Y9QTIiAVEqwCsNznX/A=; b=KUyifBEdxAy+bNjktmMLxn1q0cz885B8NnY82uZV
	BXPTBeBzaz+rjyOpCifm8s04bgwGhH6WFTRw031xNMOkFSKCqeivFf/hXTnAECC8
	JCYrzC0pzigFX2h1ZhI3NaZP+ALy0/o+xN7zXMwPzFkpJXpn24todpgOz9XTsHA7
	b5ILmsHdrOVkqjh8ZTf/XfqiytLlM+tvqLqJTGsZHSxIMmeh5xIhHEqykGtP+k9v
	sqCfqI+xO46ERt9zeG2tN9FxJ0/XBrAQp/dcQaKr5WBQYZP2x1UUHmTBAdI3ObQj
	BE6RB5aO7zh4oJtZQGCAjPgpq0d2inE5ox0J7bPeYJ9bqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbtahb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:26:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766c80d57eso102901141cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300810; x=1742905610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn6o9sruIXfwvCI8WMCUouk1Y9QTIiAVEqwCsNznX/A=;
        b=q6sf3cKwv+5VSibtDu4mts9k+QzAPcq1Y3BPerJIWfJSBbU9Fu5ISkzmNpvbhU4Fo8
         cchKuEE1dmITYw2jfKtixeCpe3gITkCzv46jWm7Z3Qct5QhHeag8jPtlabul4cpZJGE1
         EyZYAxdxshVEW5nV1H0yP2MUqAxlIo4zh/IKjYsuTuClBLrwWp+bsuxYugZN72qB9tFv
         9OQAHru/YBqqgndRiDdFBxyBZKx5YnZSyYW7drZQMvAJ7MGFAtMeXdRTV0GiqpQqHdhX
         1ulpZa+OScnLP9Tyed4TEcG3KkW2qnsNG96rT2FZmEAoOBYLNl7Waku5TEXjfjRwGMxG
         w/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSc8wahxV5jXxqSqpxOiMIBRnWBKNhTRz7PCaiD8B7da9KVkkOd1XwlGJswZZHJ3ZQ7SBODYOnaLjINTZu@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVnNVZXLv2xv9W1wVOyzvCql406Sgc8XCyR9zV4I24dyYy0Hh
	y9PVysEOUMEKXCgat8GtuKiCSpYO8ctgnHeHYL5xPMHdUKI3r5p2GQCyyNl6F3sLCskW4HP3cUj
	jRHghA+pl3LjAQ7UNdYX+WBDLxBidyvTVoGXRVK1sRZLrpPuunfN0xiDn1cIjRQiE
X-Gm-Gg: ASbGncskPfuzpFHVVdeZIRG1yLUBZKZyTjDOkW9LkGjcZzIgmxN/BtsafF8k5v66IC0
	9/W8gXtkVhFoGfL6ASNBtfVMCNfNCyHuMpMAF5LEsmygrj0jOvuqea2vp1pfJL1QdHvYznAC775
	xwOKdcbZnCEREZs7Ud9DkkbSgcf5B69nKEYxXKSiziLeOA6nIvTvNdLCgW+0qJehKW//uIiG9wZ
	1srEy62hPnYa3X8dH5CjvnukhEZOj72EMHlcV3dzKfvKxfOeEt8xjQpxwCMyh5dddoruWLihLXY
	j9NYklH0KAp2N+dVkLgLKjbsVdnRyic8uPGswFXrsHdP2bqMdLY9WkRRRqVvUVlhX60+cfeyi8z
	9nw4=
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id d75a77b69052e-476c814a05emr237383371cf.16.1742300810268;
        Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcR9xUHBK9TFXZWSwLWT2FsKGFofnO2SkdyZ7fM94gEY42uE07dGuuS4gCqZY8gVYIkurgsg==
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id d75a77b69052e-476c814a05emr237382801cf.16.1742300809924;
        Tue, 18 Mar 2025 05:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bee7fsm1638070e87.54.2025.03.18.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:26:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
Message-ID: <p4hda4puovabvqnf3unge2rifzu37hgim2k4fnvdpbekhojzq5@cx7j4hrspzdy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
 <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vItmSsWONIgGAUInrC64MRbB34Ou9VTG
X-Proofpoint-GUID: vItmSsWONIgGAUInrC64MRbB34Ou9VTG
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9668b cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q9XyVQKgEbIbea8yYzIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=449 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092

On Tue, Mar 18, 2025 at 01:13:23PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Use new SoC-specific compatible to the SPS SIC in addition to the
> > "syscon" compatible and rename the node to follow the purpose of it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -402,8 +402,8 @@ saw3_vreg: regulator {
> >  			};
> >  		};
> >  
> > -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> > -			compatible = "syscon";
> > +		sps_sic_non_secure: interrupt-controller@12100000 {
> 
> The register that the consumer of this points to doesn't seem to exist..

It does, although it is marked as reserved. And this matches msm-3.4:

                .smsm_int.out_bit_pos =  1,
                .smsm_int.out_base = (void __iomem *)MSM_SIC_NON_SECURE_BASE,
                .smsm_int.out_offset = 0x4094,

#define MSM_SIC_NON_SECURE_BASE IOMEM(0xFA600000)
#define MSM_SIC_NON_SECURE_PHYS 0x12100000
#define MSM_SIC_NON_SECURE_SIZE SZ_64K

I don't think anybody tried bringing up dsps on APQ8064 though.

-- 
With best wishes
Dmitry

