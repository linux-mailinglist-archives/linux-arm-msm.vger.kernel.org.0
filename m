Return-Path: <linux-arm-msm+bounces-35129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9B9A4F9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 18:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B053282585
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 16:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAE718BBA9;
	Sat, 19 Oct 2024 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9thH5UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441D4155747
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729354401; cv=none; b=oMya7AbfFMDpwod7Jr/qlasaCkKG3SwfTFCX9HBhuAbmdiMQgLxO7w36lSnxG8DgkKTDmRonl/TENv4TUhiO2Fk0hOIlHGnff1ySELoPReeIJImEhlw3iTeodG3Yv+CKzqcefDIqZo4RvaW1wm7UG98RAb+8VHet0eZpQpd2cxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729354401; c=relaxed/simple;
	bh=8lBiGI3bJlCZOOUYTUqzSYteTk7WhaUcq+DBRoI4O08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoKeNMuTDwD1ZZRd7AfD6yv4Rfq299zXF751gB1pE9JMiDBA98GzLuQ0h1LLulaPdKwlQDC4WIrdgv4L805TJX5VNcaZySleJ7mdDY9MopTV2zddatH7xBkySDvPauyiAnLOsSCO2x7KeDiaARr9dGa6p75tJLjNCFAR7frbdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9thH5UB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f8490856so3466925e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729354396; x=1729959196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eyqsi5/T3uW08fQdohg8/tA9trO3ULnXgBI887qHaFA=;
        b=k9thH5UBgB/1v4FvZ0JjQw03/WknIRw57HEhLX0IvHthPBgovrljIWQw0lEjxZORRz
         2Rhki7i0SOSpjk1Dm0mXWDpY3xCbW1HL8g4AFKC6qrNs8ocrGCPlkY/BZxNl7K967Ob5
         CpYcpsIpBLwF1TEr41UUzdy109sUPmE4nWJYA9bKZ4cm9F0K/ExZlFvzx4TnWu0jrrDf
         MHizMGWnUYdCdSDc1UMME+2vdv25TaqOZtgP7EAxWyPkPomCKkFAJi0nu7oP1bmzGpwC
         gthwBpjppMEbcTGv5d6XqtO7AotYnvDLAygt5IrBjLO3ZdCdneDS1E5hOlaNlJ7TbSaP
         KREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729354396; x=1729959196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eyqsi5/T3uW08fQdohg8/tA9trO3ULnXgBI887qHaFA=;
        b=OVMu5s7eak6rLYP+YgLJ0v6ENjYlnUru0fZZklSUEvDN3xTH6AXKJ5v98EBA83b0R6
         KzAlhD4XAtbKb/6WXdbJgu7s0+4INKS74NjRIUGT9MA2GwnA1MyRRicMuXvOv9RucZWg
         CIhu8+Kk2OtT2EsrD+9xz+AyzZntaTZytGOV7IbV3gtpPRF3fUSrtUHEZRysH+3i1EHw
         SVXZ75A/EbTS5ZJKVvf/aSMLtuZSDURlB0D6IN1Z4kZSaKRmpANcGSnuzAQTORRyVR7v
         2v9k8P3y0gpSFtJRdV66MAYXYAXwndjmnVfMU5+SX4AUxE8JE2F7HHZvYJQGEzeQJL2+
         RCDA==
X-Forwarded-Encrypted: i=1; AJvYcCXPyRKIal0S4sV94Rcy7gnfHV87UY6YJeRkKagWOz0madg66XQeEmLJEMlUvvcRI63baVFj9dcdX0iExoes@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBuBtD3h18G/5MsSqjjWqsHO6ElVKbXjmLzp/Pc9SHi9Ys0wy
	sNd4wHdaU1F6YcsTl4OEaMQg1pZdD4/V2O1b82EWt0bWKs6cyEe9MGmx7wcSfv8=
X-Google-Smtp-Source: AGHT+IFWgrZia2nkdXraoHHT50Jbl2vwki91dY9I8mJ543UJdCNHT1fkfo2f/WFCMjjCtYRhtihkIw==
X-Received: by 2002:a05:6512:b9b:b0:539:f1a6:6ca5 with SMTP id 2adb3069b0e04-53a1549dbf9mr3051471e87.26.1729354396042;
        Sat, 19 Oct 2024 09:13:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b92f7sm562207e87.71.2024.10.19.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:13:14 -0700 (PDT)
Date: Sat, 19 Oct 2024 19:13:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Message-ID: <nka6tuz5ackflwzkvqwkn2sqt4rgmmib3n5sywdawsfay7xyte@nejv7uuldg3z>
References: <20241019-patchv3_1-v4-0-a95d8f0eae37@quicinc.com>
 <85873886-c578-4f42-a46e-728f9a92f837@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85873886-c578-4f42-a46e-728f9a92f837@quicinc.com>

On Sat, Oct 19, 2024 at 09:13:23PM +0530, Mahadevan P wrote:
> I apologize for the inconvenience caused by uploading the incorrect patch
> (v4). Kindly disregard it.

One thing makes me wonder. You are using b4 tool. It should handle
versioning, changelogs, etc for you. However despite all of that you
somehow have sent a duplicate version of the patchset. And the changelog
also doesn't follow B4 style (which is useful BTW).

Could you (and possibly some of your colleagues) please stop doing
whatever strange things you are doing and just use the tool properly?
This way, each time you send a series you'll get an automatic version
rollup _and_ a properly formatted changelog with all the links to the
previous iterations, etc.

Please stop making your life harder than it is and just use the tool in
a way it should be used. At the same time it will make our (maintainers
/ reviewers) life much easier.

Thank you.

> 
> On 10/19/2024 8:46 PM, Mahadevan wrote:
> > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> > includes the addition of the hardware catalog, compatible string,
> > relevant device tree changes, and their YAML bindings.
> > 
> > ---
> > In this series
> > - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
> >    binding documetion in this change:
> >    https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> > - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
> >    depends on the clock enablement change:
> >    https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> > 
> > ---
> > [v5]
> > - Update clock-name of display-controller in MDSS documentation to align with
> >    qcom,sm8650-dpu.yaml. [Rob]
> > - Update power-domains of display-controller in DT to do proper voting on MMCX
> >    rail. [Internal Review]
> > 
> > [v4]
> > - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
> >    to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]
> > 
> > [v3]
> > -Edited copyright for catalog changes. [Dmitry]
> > -Fix dt_binding_check tool errors(update reg address as address-cells and
> >   size-cells of root node one and maintain the same for child nodes of mdss,
> >   added additionalProperties in schema).
> >   [Rob, Bjorn, Krzysztof]
> > -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
> >   path in devicetree. [Dmitry]
> > -Update commit subject and message for DT change. [Dmitry]
> > -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
> > 
> > [v2]
> > - Updated cover letter subject and message. [Dmitry]
> > - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> > - Update bindings by fixing dt_binding_check tool errors (update includes in example),
> >    adding proper spacing and indentation in the binding example, droping unused labels,
> >    droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> > - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> > - add reg_bus_bw in msm_mdss_data. [Dmitry]
> > - Fix indentation in the devicetree. [Dmitry]
> > 
> > --
> > 2.34.1
> > 
> > ---
> > Mahadevan (5):
> >        dt-bindings: display/msm: Document MDSS on SA8775P
> >        dt-bindings: display/msm: Document the DPU for SA8775P
> >        drm/msm: mdss: Add SA8775P support
> >        drm/msm/dpu: Add SA8775P support
> >        arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
> > 
> >   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
> >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
> >   arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
> >   8 files changed, 830 insertions(+)
> > ---
> > base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> > change-id: 20240930-patchv3_1-600cbc1549e8
> > 
> > Best regards,

-- 
With best wishes
Dmitry

