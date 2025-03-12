Return-Path: <linux-arm-msm+bounces-51130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2485A5DB08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D00577A88CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC3C23C8D5;
	Wed, 12 Mar 2025 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOEZDBCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051A22F3B0;
	Wed, 12 Mar 2025 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777428; cv=none; b=ltCZMQG/ca1mBrlSzZi+7seFBjgNBluktaXmHVX56qm7X9nHdEaseSrhziDUI4UhtMZDY5kh5Qfq73bKt2Cizok/6lHnCPqJSGRJFAELg7unKIoL8TFCg4cBbMjpJT8A1lyTQDj2p6rctu+D7sDFcWQfZnqAOWSmXwBHP8PDVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777428; c=relaxed/simple;
	bh=7BGHVu8buHkE4R833HEw2gUiMEXqKOFjigGb4Dl6k4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYy4SW864tNhS2RLnAxRaAxJXcEuzDfATU1dNu2tVTdZk01PvtGBn6w2rSnsQVpUABU19MtkQjYTYE0nc82ryb087wOonkm+cE+UFCFlq8PcS7zqFuw+kCNEn5XjviVGtNg2I0exDKPzwglBqHNw8LMZiMKmZEW1mF9kBjwHcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOEZDBCW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so6206327a12.0;
        Wed, 12 Mar 2025 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741777425; x=1742382225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zTeV+0I3vnNHKkFv3a7WhNa9KvVKcxl8h2avxfzw1dA=;
        b=IOEZDBCW7mSr0c46ZKdldS6xfbaQGGpS36Pb7LEm6C2ODSC4QOoFuT6fQC9fk3irv+
         QWN5HIdKSlwKSOnPVwPoQGwYCrauwUHFNEIE4zvvXgx7cjfztJGgQK9SfxWz1gxbcIe3
         mXrdqZhfg9p3PNaPzKVSD4G5Im5T6Oj397t142WSC6qnNGwgWd5ekd+CMkWN2Ht2Ifo9
         UCbgza2/VDQHCbLFrp7gskYYSOl24LV72PcUEEw/ii5oIRedO8DJ4ZsfbgZYFjERPO30
         e/8Lh/eX+50MxDS9fOFFnmLcL4ymtjjM27kdwZTnNw7rN9JdQ2Gc8V9hHPmevusxcEma
         SXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741777425; x=1742382225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTeV+0I3vnNHKkFv3a7WhNa9KvVKcxl8h2avxfzw1dA=;
        b=jtqz7noEa17ma1pd1pexC6nk347JCNC9R7bFyDtPSZ9ZY55JIZ9KTzJzDHjiVe9Y8k
         bD7beKTA79KhWFD7MFqR+OINoww0TAmf4GOe1DITdVfSK3pLMfpfbCc+s3LaPUp5mudA
         xxncLqULI7JKDZZx7vJEqUQjQMxF14ZNsCrgoNs3njzpZlf+uaEgVu8YTvFuvPj2HnTj
         fP5ws5CgbNBzAdv3tm2u8GEedT17Uvwb3Y5/C1Sx91MzkSmtisAIf+h5/AVmoNK+WlHf
         rO91EC3OCemzQ/GyN0dWZbO6lKaPQiXZbg2qjrRdJyS8IRZ5CYbkDWHXphFZFMotaJUP
         tWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpHWcxq+5b9933S7xf5VlYP16TTznti7kyBqFYSVO2WtQ1a/mpjeA79L+10yQePhvQYW9+oPjjIy/jJLQ3@vger.kernel.org, AJvYcCXU1z17Ur1JsKQzYfW8cowOaNswkXCbUh+50VMAq3PAaUzqJVW4vP+TcPiKr4FCkK2VEgFWx9BDTaiH@vger.kernel.org, AJvYcCXvIxv+Tca4R6kcpcIkbF5vrHMzcH/pyn51R5we2Uevvd2Il5F+38iTaf35Iyk0HNVky+yq8CzALXqSy+mJtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUn3j7NzXZnpaY7eIiEi5XpVnd/Nm5Hxu5CP3dIvyqBEXgv5Rs
	Ey8+vjts5ur3SZ1NgBavmF4g16Fi295se6N9YM0sWbNA9PFCnBki7dKhX5ohbQ/uce/WcgCnurd
	ZDMq8csSsiPL9+Ip4U+G93uQG03o=
X-Gm-Gg: ASbGncsPcKoP4GniHVC8WqNB7BZb1KQHG9TsYQhDNHdEd1zbv+qqitdQjvPu6vYIgRF
	+CqdyrWDRM0w6xovCcDfySKvo4xFERNxe+qGZ1yCemC6KvYQbL8psvI/AV9NVW5T68WrPoVdPCe
	5DjK7LF8OWKipAWfTJRqwEooY6gS8loLOyM3zFpcjF3oNaxOrZHIEv/1+qD2HAjFDmAsk=
X-Google-Smtp-Source: AGHT+IFyHmRAQm91BYyBBXLOIkRea83M5cMTQa4BEO+uSdKcNofT32n0rJIAV2xBRKTdpv+ovpKL1xoJuhMVvzl4xgY=
X-Received: by 2002:a17:907:82a0:b0:ac2:b3b3:9f1c with SMTP id
 a640c23a62f3a-ac2b3b3a186mr1028408966b.10.1741777424265; Wed, 12 Mar 2025
 04:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-10-quic_amakhija@quicinc.com> <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
 <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
In-Reply-To: <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 12 Mar 2025 13:03:33 +0200
X-Gm-Features: AQ5f1JrVPD0uoisr8Y0JnYXx8B23G9S5C4qXGU3l30zo3ipSTDnyL45hL0sz214
Message-ID: <CALT56yP+UDF1YeotceqOevr_NTeGjDVw92NwtPDgRK6GvvkyHw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com, 
	dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 11:47, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 3/11/2025 9:11 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:54:44PM +0530, Ayushi Makhija wrote:
> >> The anx7625_link_bridge() checks if a device is not a panel
> >> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> >> the bridge operations. However, on port 1 of the anx7625
> >> bridge, any device added is always treated as a panel
> >> bridge, preventing connector_detect function from being
> >> called. To resolve this, instead of just checking if it is a
> >> panel bridge, verify the type of panel bridge
> >> whether it is a DisplayPort or eDP panel. If the panel
> >> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> >> DRM_BRIDGE_OP_DETECT to the bridge operations.
> >
> > Are/were there any devices using anx7625, eDP panel _and_ not using the
> > AUX bus? It would be better to use the precence of the 'aux' node to
> > determine whether it is an eDP or a DP configuration.
> >
> >>
> >> In the anx7625_sink_detect(), the device is checked to see
> >> if it is a panel bridge, and it always sends a "connected"
> >> status to the connector. When adding the DP port on port 1 of the
> >> anx7625, it incorrectly treats it as a panel bridge and sends an
> >> always "connected" status. Instead of checking the status on the
> >> panel bridge, it's better to check the hpd_status for connectors
> >> like DisplayPort. This way, it verifies the hpd_status variable
> >> before sending the status to the connector.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> index 764da1c1dc11..ad99ad19653f 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >>
> >>      DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >>
> >> -    if (ctx->pdata.panel_bridge)
> >> -            return connector_status_connected;
> >> -
> >>      return ctx->hpd_status ? connector_status_connected :
> >>                                   connector_status_disconnected;
> >>  }
> >> @@ -2608,9 +2605,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
> >>      platform->bridge.of_node = dev->of_node;
> >>      if (!anx7625_of_panel_on_aux_bus(dev))
> >>              platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> >> -    if (!platform->pdata.panel_bridge)
> >> -            platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> >> -                                    DRM_BRIDGE_OP_DETECT;
> >> +    if (!platform->pdata.panel_bridge ||
> >> +        platform->pdata.panel_bridge->type != DRM_MODE_CONNECTOR_eDP) {
> >> +            platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> >> +    }
>
> Hi Dmitry,
>
> Thanks, for the review.
>
> Yes, it is better to check the presence of the 'aux' node for eDP or DP configuration.
> Will change it in next patch.
>
> -       if (!platform->pdata.panel_bridge)
> -               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> -                                       DRM_BRIDGE_OP_DETECT;
> +       if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev)) {

This is incorrect, if I'm not mistaken, please doublecheck it. I'd
suggest following msm_dp_display_get_connector_type() (feel free to
extract that to a helper function).


> +               platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> +       }
>
> Thanks,
> Ayushi



-- 
With best wishes
Dmitry

