Return-Path: <linux-arm-msm+bounces-47739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE797A3240D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 738B51614EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A37C209F32;
	Wed, 12 Feb 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0iYJc4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180FB209F25
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357817; cv=none; b=tcBtmka98MItVshtdxi2lXYSYxWLNOpztVScAZwmUeIfWbhrazGGHj8yW+i99gT9KPu0OjNXCOwMIEzX4ylj8nqKJrD0RoWZSmEI6v5qYr/8w5BQGkxsBBX3Ms0qyny1BrCI/Y3iOUeACy+FI+IVlA2GHRbx7JQSe3r+P51jSe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357817; c=relaxed/simple;
	bh=A5pC5dDJnqRwMtrMiOZEAqDqHk310SV88vnXHb2NFww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+l91VNv0cTmVLqvX7keZbwiPuwt/jV2t9JJG7z3wp94aX/B7ngVTzyB9heuijID/qcwoEzDX/1WvV8DyYbHFonbcPzVu2AWFdFk+psreC1AndKkmog5e86spU6deDirj5dcygE790oSP/uIaipNTf6us5EwObkmTRoG2+XGWJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0iYJc4T; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307bc125e2eso61863571fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739357813; x=1739962613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sh3RbFHEBFXy8Gx0UkHY8V+uObJHLtwHJzqWdL8vuU=;
        b=g0iYJc4TGdfz/0FuMMKJLMApO/ihjgLRFABSRlTIUIspUEyiwhUJjzZgsysmIY44Rn
         LeLFYlWvsddgJhrTVgmu//9a5fCkS9+nswfgHrFxfOa8mGxouT++tU5HJjqRHlhg0f5N
         y7+Uf/gvn2C+8ooEQxhMZJH5lV9/9B0Sq9okFG5KkkDWkh1U6wEnxTv7kIfaLub9JXjs
         8qtaLbjC7oNdOUtXlVC0VeN2gje4hFs75nTYZd63RUDXsORaJ/711hh3pKOWgQqdrV/r
         qzUN5S1tPitDqu1GU/GsHTzEdNUkS6vWr6C9SJivnHmUZ7+NwJWA2khXkJ3vQe42xC/6
         SDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739357813; x=1739962613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Sh3RbFHEBFXy8Gx0UkHY8V+uObJHLtwHJzqWdL8vuU=;
        b=MIq+hGChzGGI0fiZWblCi6RH2sX/kRMNSGUci6U2BsdN8VaCO/fP4NpDa4+3k1GvvF
         RW4ydGikabyfz9929n4vm3n/KhuiDL3svBr6/j4uQyZsLI37PPlhzEjsRfb2+ObMtzKe
         dFJZ/34/QyRGdYJ+9bqFP5aFnKLh1GJDcJNj0uy2KXLk6mgrDkMEsN7MDhNJr9wIJB6c
         Mi/noEYIMHH/LzNRC6jJMq+iVOmGzWq6D+QB+xBVyOFMqDm7YUEBIiU6bljr6mo3vLVw
         wmfqAwHiDedSt/7rSdUQUXFYrxhVLkOEtWEQlPMKw3QbkUz/GXrlUxeEEyHHGO0is7IE
         95pg==
X-Forwarded-Encrypted: i=1; AJvYcCURZws1QaDBhwn8pxbf43SxxHq5sQUsKJ5znqZxc8mBZfhNpiTb3rciSLMZzb86/RSjp2xhoSrdQvOVpstC@vger.kernel.org
X-Gm-Message-State: AOJu0YzWqfiBc18KAvWzGtKgYY8FU6no5qNg6VFNO7vJy31wza+nAOfQ
	K+p8VsRC2Ba83MPkNDHY4PqqKBDJdLmHhiMuJ4Ffa+MjwCZB/w2Zri6doWwFfug=
X-Gm-Gg: ASbGncs4UjEsx60BofhBzCSVllc/5Y5eD8g9TGYGC5JYrDVYPE8B+h4q4WoCOQhcnX3
	E3y8n9k2VGJlM/CeYiYHMwGvKSXnTslINCwPorULSjqlo/LtykKkSleooFDxbQKTJlHwjank6OK
	5X2pRiS6qmRqjIGQCH6FEi3oKFcTQ0XtAgyiHP9Rynaf7qf1UlTFoVGReiCAvR422RUb9Sit/pw
	+k+t+G3Hl9ZGNgmAiT9WaElpqKOMFYVv6jAGIiXg9CMmacosHFMkt6/zKnnt2y6JjvKq+6aVFBe
	9w32qXA59u5m1v0uY+XQGejTHyEHYZgHLYReZSvRyATd7SncSybDQqFxRP1n2xp+3hUwdlE=
X-Google-Smtp-Source: AGHT+IHZQXx3v7w680Qx+ZSGx5WSzNY1jlx0QqT9maGbSAp/UsmN348CsHz3deqPCtQuvMdlKI3eAQ==
X-Received: by 2002:a05:6512:4026:b0:545:6a2:e56 with SMTP id 2adb3069b0e04-5451818b3bbmr785437e87.37.1739357813106;
        Wed, 12 Feb 2025 02:56:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e83820asm788032e87.100.2025.02.12.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:56:51 -0800 (PST)
Date: Wed, 12 Feb 2025 12:56:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <fixmfluomzrdnoyztkd57gjpoqzutlv3m4es5jc7fclhpbauby@7u3ddi6dz4f7>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
 <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
 <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
 <c80ef960-7dc6-42bf-89a1-79e43be2bce0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80ef960-7dc6-42bf-89a1-79e43be2bce0@quicinc.com>

On Wed, Feb 12, 2025 at 12:48:01PM +0530, Akhil P Oommen wrote:
> On 2/12/2025 5:30 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 11, 2025 at 06:41:39PM +0530, Akhil P Oommen wrote:
> >> On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> >>>> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> >>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>
> >>>>> Enable GPU for sa8775p-ride platform and provide path for zap
> >>>>> shader.
> >>>>>
> >>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >>>>>  1 file changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> index 0c1b21def4b6..4901163df8f3 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> @@ -407,6 +407,14 @@ queue3 {
> >>>>>  	};
> >>>>>  };
> >>>>>  
> >>>>> +&gpu {
> >>>>> +	status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&gpu_zap_shader {
> >>>>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> >>>>> +};
> >>>>> +
> >>>>>  &i2c11 {
> >>>>>  	clock-frequency = <400000>;
> >>>>>  	pinctrl-0 = <&qup_i2c11_default>;
> >>>>>
> >>>>
> >>>> Bjorn,
> >>>>
> >>>> Please ignore this patch for now. This is probably not the right
> >>>> platform dtsi file where gpu should be enabled. I am discussing about
> >>>> this internally. Will send a revision or a new patch based on the
> >>>> conclusion.
> >>>
> >>> Akhil, any updates on this?
> >>>
> >>
> >> I am still waiting for the discussion about QCS9075 board dts files [1]
> >> to conclude.
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/
> > 
> > Why? We currently have several boards supported. We can enable GPU on
> > those as your patches are pretty fine. Then we can land Wasim's patches.
> > Not to mention that the discussion seems to be dead, last message was
> > sent almost a month ago.
> > 
> 
> sa8775p is an automotive-grade chipset which has a pretty different
> non-HLOS firmware. One of the major difference is that it has a SAFETY
> monitoring system (using SAIL IP block) which monitors different
> parameters like GPU frequency for eg and it takes control of the entire
> system when it detects an anomaly. That means we cannot use GPU DCVS,
> passive thermal mitigation etc there.
> 
> QCS9075 uses the same SoC but has different NHLOS firmwares that has
> SAIL disabled to make it behave like our regular chipsets. I am aware of
> only QCS9075 boards' GPU spec at the moment. I don't know the complete
> details of the impact of SAIL/SAFE features on GPU and other specs yet,
> so I can't disturb sa8775p-ride/qcs9100-ride boards.

Ack, thanks for the explanation. Indeed, it would be interesting to
understand how that's working together. Do SA8775P / QCS9100 use a
different GMU firmware?

> I can see that Wazim is still discussing about board DTS internally.
> Hopefully he will send out another revision of his series soon.

The discussion stopped a month ago. 

-- 
With best wishes
Dmitry

