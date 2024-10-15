Return-Path: <linux-arm-msm+bounces-34425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C699E9B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C5261C2241A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627411EBFF7;
	Tue, 15 Oct 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DghU+irJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF11EF09D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995147; cv=none; b=j7NJzs7Km5FaSUTI97KYWaSJn7PswEjUod57v/T0nwUJ01gbrYZZCNDg8FyaouEjnyBkMbqNniO1AQ6Xw/eFU/TtTfCKtP1CZyQONz2dSb/8E2j7xP59cgnIh3uRbugIdmjOh1F04RXQ0xQGhnslxOY41F652fQ0o+Zab0ZgYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995147; c=relaxed/simple;
	bh=cqzsFbJM/5VmtaL7Wz0DGufiR6YTrlGuXGh5B6J5Wr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+Vfmh161cH4mltK1w4B/iCtBQ2zJ6sFxp8eJm3PzQdzdfWUIn5cR30IBhPrR1XHDueoaNST9NRHH0I2mNJSp0wl2bvb68DdtLlOcTC1MgWo8pNXibL8lVV5u0r/sof+uZPGaF/T2eG1i3+HndE0E7XX9oQLSxm3Mz/6g5g7IYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DghU+irJ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e3e4f65dso47947517b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728995145; x=1729599945; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Go8RY3f3g+YNRtfmTAreeRvEns8DfLxEuJL0kCvf+w=;
        b=DghU+irJ2lFEd/rJPR1oObIO7VjiOt5aHmpo53jGY8+udWsnnk9VW1uaAK+9N59U88
         3T6jdEKdeOckMnibCIK429LkA13+y8o28qjXNejvwpEOjG//HmDtdo80zwNHSIQlRZsM
         Ma3AIPbgpUtCqoOGX5Q8u0OD7Hru9ZCjPYHVMZGVzOX4iQlyITKNDQdyDW3FpG6+oVNn
         usTTimkmYZlo2z9HOC6tWi1dYbDfG0l2FkJuDg6b2L9zHMjiAwATmFfzd/VMfYPUQIhv
         ESGUeypg3kAZNeVNUtwKBy0Y/PWbIfBlw8nIa+X81SWciYj3ltVknAYJwMU4qiPdNVEc
         MHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995145; x=1729599945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Go8RY3f3g+YNRtfmTAreeRvEns8DfLxEuJL0kCvf+w=;
        b=dicUZR0GWfQIBGqe7AFb0xuiGVOxmGCQztJvAxNEXmtEiRc+2XoLtJ9IOzTdU1HDxV
         Qnnd8Rx2kgCc0i9SGNNBpYZcaTDZy14TBgTBdaIZFrepfcwa4+4Tz9fA9I/5EAlDbcwZ
         xSlAQTEofU3Br7/1Xow2CP7gYki24b+hjwZi6XF6fA8aO1IFY7anfiJYl+5cvtdTe2X4
         S8kzTHnxiOnBGAn+fNiCIG1I4AoCz9lp9eSY+ePVbjZXlU4A/SiaIn9jdv7Y5M6oEXRA
         8nD05IcyZqmxw+urTuHP9rVzvgY2SrK8/il6zcNyvrdLnAunbRNKjjQSx/cfSfLhC73W
         IPlw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Xm4u3PqOWuWGAYlWWgc2tnrv4WqEh/dTTZjZ2JQ4STNqLI/WjzTEEHQ1SN8ubGHIgJZpxF8IkAQeygfs@vger.kernel.org
X-Gm-Message-State: AOJu0YxQzjv4w9vQZL8tOrDMGo8B7rmgGPLYEBIh0LN/iox5z4cB+NdO
	vhov4MMBIufB/aUCZ6RTsgAjTeoTAfKBFeKQtsUWc5d6OLm5GCNywdb4SmgkUhb7x6qklIUeJ8J
	IV5xzHFrftJ6KR7cS7+VFAZ0LjV7FTadNl+lVmA==
X-Google-Smtp-Source: AGHT+IHZzOhozWT/zaACpirlbBqkB9AePGlI8+Gi4sFzG1jRzDW+IwnQjZ8DWZzBKqIJX+L8fdHUbM4O+vIm2GvBe4E=
X-Received: by 2002:a05:690c:4c04:b0:6dd:b7e0:65b2 with SMTP id
 00721157ae682-6e3d40d174cmr2743727b3.24.1728995144733; Tue, 15 Oct 2024
 05:25:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
 <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com> <2a2b1373-6cb4-4813-8736-dd7b12c90c0a@quicinc.com>
In-Reply-To: <2a2b1373-6cb4-4813-8736-dd7b12c90c0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 15 Oct 2024 15:25:39 +0300
Message-ID: <CAA8EJpoM5d=NgcugVdXfSNDAWp+nfDVV+jaLAqk1pEg7RvoM4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 10:02, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
>
> On 10/6/2024 8:30 PM, Dmitry Baryshkov wrote:
> > On Fri, 4 Oct 2024 at 12:30, Soutrik Mukhopadhyay
> > <quic_mukhopad@quicinc.com> wrote:
> >> This series adds support for the DisplayPort controller
> >> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> >>
> >> ---
> >> v2: Fixed review comments from Dmitry and Bjorn
> >>          - Made aux_cfg array as const.
> >>          - Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> >>
> >> v3: Fixed review comments from Dmitry, Konrad and Bjorn
> >>          - Used a for loop to write the dp_phy_aux_cfg registers.
> >>          - Pre-defined the aux_cfg size to prevent any magic numbers.
> >>          - Added all the necessary DPTX controllers for this platform.
> >>
> >> v4: Fixed review comments from Dmitry and Krzysztof
> >>          - Updated commit message.
> > For which patches? How?
>
>
> We have removed the "reviewed by" and kept only the "acked by" for patch
> 1. We have updated
>
> the commit message of patch 5 , to mention specifically about the
> validation of 'only' MDSS0 DPTX0 and
>
> DPTX1.

All of this must be a part of the changelog. It's not enough to say
"updated messages" or "fixed comments". At least please let the
reviewers know which patches have changed and which didn't.

>
>
> >
> >> ---
> >>
> >> Soutrik Mukhopadhyay (5):
> >>    dt-bindings: phy: Add eDP PHY compatible for sa8775p
> >>    phy: qcom: edp: Introduce aux_cfg array for version specific aux
> >>      settings
> >>    phy: qcom: edp: Add support for eDP PHY on SA8775P
> >>    dt-bindings: display: msm: dp-controller: document SA8775P compatible
> >>    drm/msm/dp: Add DisplayPort controller for SA8775P
> >>
> >>   .../bindings/display/msm/dp-controller.yaml   |  1 +
> >>   .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
> >>   drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
> >>   4 files changed, 61 insertions(+), 24 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >



-- 
With best wishes
Dmitry

