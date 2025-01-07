Return-Path: <linux-arm-msm+bounces-44126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34124A03E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9956D18866B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3F1E379F;
	Tue,  7 Jan 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h71W/DNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1101E9B19
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250406; cv=none; b=jQb88rBq/5Bq1OVJD6ct3TCJMTfddi4Hkr2+LBGPEUXu0zGbMtX/mOSODzxnNfOMaDoSYnklZjy3NwGS8NbFb3OUDzsn0jzxym+NwJiduGrKqtIWVUZelHr1kidkVCaaOLQy5XrsXmyFQVKqcJj7v4joBRvTkjJVBeQ78N4WYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250406; c=relaxed/simple;
	bh=rgBTlhMKST9jNZTsXmM4EqnKskactjwgM25xvasx8qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u01urLBDTduYLp2QWRU/VYNvQbBQR5i8gE2QhuRdfuZEQJ055NRF1I1lyFfKGPB9gwwhKuR7cohwB0gfJsXilRL6TPLNyplA/KrSys9dwehorWD0vSG6TieNRIV3aY8G+CjlP/V3lbyP2aU6/Coe491qFKrvry8suKksmMS0YEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h71W/DNH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so93905471fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 03:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736250400; x=1736855200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
        b=h71W/DNHMREKic8kqnqrgU2XWbHwWL2eJChVHnLz+N7Hl0qu/1fNa8T4Dxp/d9epk2
         gNI+pgF0RugODtZXEwA0OXTuq7voPO/aaBy7FEvkIKffJqC8Grirb/CGfDtzoIjBqpGR
         y/Y6PubNnYkQqhqZS2jzzwfCWCFoXLLvgZkkSy2ipdN1hQMaMtpWEJZf/3kGMxnMehdd
         hECh+3qcSqW4h5EUDOygtcs9IgyhRN7Bq3nXRYrT+acoCOeYDQEvWSNJVHf2aoaIsON4
         kBvydg8GuUh/MyqVeCHJMGXI9Yu46/jlU7tLnEenzEIwoOZd6O+O9Q8LYjnzQfIPYnfh
         EPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250400; x=1736855200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
        b=qo0zcDo3OHgFIMtioZ98joIdU4VUrX4MDoD7G//2e30RgxH2guWWtHfWBSTyAMTIr0
         b/YOOxbVURgAz7ucOOohDkK0UHTpD0Txb5IULSN2OFCg84N7UDQ1Wq/lAcF/Egyqj2eS
         fTrVKwlwsVR91MTK0O3ydYl5g4b+wjiuPfbyaen4hFMVUdpOZZTmraBsa1KD49+wf3CP
         209LBLkV1k4L5FGduO+ysUrcs2r5Ujbt8pTQoICVSPXdE3ItFJfDu8cqWn5wAW8lu9w+
         bcUdGlbB9R4XKG1A8JNhyCf6lbGDmA0aqJCDIIzOgI7Rp6HZ1YCcHL36Uo7aYFuts0R1
         2y2Q==
X-Forwarded-Encrypted: i=1; AJvYcCViR4Hm8nK8YWsNhp2r/ymhK8D7FUROu92G3LziL5vPe+oZ/WMEZe+cAZpoF9To5We74ja3cFMy5lyVvSFU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qtFW4UiFuizydjdlkKdJXOxETaUvxsiNVgNLOVmGEE/NiK0F
	dfvu9dB+OIS72tQCcXJJH1yLT8pyOMDFUQhiRaq6Pb3vHiIVraVhuQlM7DOuXKI=
X-Gm-Gg: ASbGncs9+ghnoUS+6NkkWZ3B+0eKfpZFGzpYKM9peefTMBYj1yQ0k1Zoonjni87qltG
	i2kVkmtAd2/o2e1u8wOwYsbtKaS/pltBupzxfDnxZLY8DNdxPXoq+xBQGDCJPbg5f9DMkjg7WB1
	ID+JEoL64G4dBiJLJiAW0yqVq04YVjPhYrCmO47+C/xupIB8rCQeVsezKIQ+Ox/GZsVvxlDTdsj
	Vh7k2Z0ndTukUn2maIJSPo5vIuKUta/Mltk87883ARhmbxCgTEgg06ta5mxiwD7HL+jNvNV96Vc
	E8g4sl1edLfyTWtPw38HPktRS9b56bRMzuNB
X-Google-Smtp-Source: AGHT+IHc6EgVBLn9/SQM53EGhpryw3Dq5lMmYc0JINGrSFhjD24qHjoSL/GI445hMcy9tZWQjpzLZA==
X-Received: by 2002:a05:651c:1a0c:b0:302:3534:1fba with SMTP id 38308e7fff4ca-30468547e32mr208884401fa.17.1736250399600;
        Tue, 07 Jan 2025 03:46:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e01sm58637631fa.98.2025.01.07.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:46:38 -0800 (PST)
Date: Tue, 7 Jan 2025 13:46:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <6etymzv5vziexe6kcgzas6pr2qgxbgsw3weobydwst7np77col@jszgjhnvcsy7>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>

On Tue, Jan 07, 2025 at 09:16:21AM +0100, neil.armstrong@linaro.org wrote:
> On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> 
> 
> Can you specify how to validate this ?

Use YUV for Writeback or DP output.

> 
> Thanks,
> Neil
> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >        drm/msm/dpu: rename CDM block definition
> >        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
> >        drm/msm/dpu: enable CDM_0 for SC8280XP platform
> >        drm/msm/dpu: enable CDM_0 for X Elite platform
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
> >   26 files changed, 26 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> > change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry

