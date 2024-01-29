Return-Path: <linux-arm-msm+bounces-8750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACB83FD05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 04:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D5F1F2482B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 03:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E055210A0D;
	Mon, 29 Jan 2024 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NefugJT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF9210A0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706500357; cv=none; b=of7uZeKBAiUtf1SRcOV9cRAQZnBqAJ2jgo48HWz1uFNcN8pz7+vGOi5ox7f1KA84++GuiRK4GgeTLr3HBqmpiVB9xFOOj/gIftJv4s9ZT2TSbJ4o+mwiHfuEy+RVZbnpv8u68XE0beSDLxxyVsRaB9r+brh2vPV/zqtS/eAdxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706500357; c=relaxed/simple;
	bh=9H/tH4/4IPpeXe9DdyRn1MteqLeVOuwZBnr+U77gtWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dU1XBvANdqW6EYZaZo5/5Z7ol03wJsl+N3MACQ+lBlxKQQL3MMW2hNFctp4h/lRd0lXKlpq1GbKu9O5K2MLLP8z1O30xGJIhWwzs4bdQxoq5ufSvcg3C1dO8Gwk32w0gzX19T/QCl/Mpqq0L3ND7FP6AZodRjT2PuQWmCVU6vEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NefugJT0; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2445335276.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 19:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706500355; x=1707105155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pXzkmM0Io5FhP7wU1xumZrJF60VkcQ0t5v5wmRt/yWg=;
        b=NefugJT0/4v5CI4pHL0vNEf0y0w0tIbyq8coV1nDIHGaPlxYGTRIMuTqh0sxe75Vjr
         2pZF3TEcKc8/58+Lq/kMEx/kzAgdgufuGW2kJs3JYiwLLBWWuNXRHdUPpU/Y2td5eBcx
         wmxKFNqRFevt+4RPKbKOk6m7dvnpx1XrsE1I7Kk0cIJ4gVtYD+kdxaw4zyVppljeap1Z
         VuIPmEQjIFRZLKum0degPA+82qFiwFlIplgQ+d/s7xBsvM/1tgJRIfq0T0IvMkms99zO
         j5KTjBSpVCoyNg5cm7wsPtqIbn4k8CPQMF9HsuQWay7rrCVA5sSJiQzmsF9ttMbudnDN
         Udeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706500355; x=1707105155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXzkmM0Io5FhP7wU1xumZrJF60VkcQ0t5v5wmRt/yWg=;
        b=Rk/jmx2YfJOaoBV2lOdK6HvtwamETSomsdfVr3vXME9LltSZahD1Lx3tD3+/19LYez
         ydi3N4Zr2TcyxcVpW/D/Kgxfdj2eGl8GQCJkTnAuWylQZ4pPIYs194rbcX0Fx2tnXqtg
         2uZyB1NZ4M4XTK9MRLbgtL6jb5hSuQPujWfBEOocxS2IELa6u9uFYx8eORfw73e8Yb8D
         mKOlyuE63rkIvXETxNu2HyMb1H2ZZ93tqbZymR5410vVF/2/CQSZ+bS9YeyCuJYjgbkg
         kd6QnD4a71G+cCA/qbZ0EHQeIH2BlEGujVPZpS/YRAEI/0tE4CV0fKQXUWMOG9917wr7
         pHMQ==
X-Gm-Message-State: AOJu0YzIzHxOBRCuWkkx+8kUJPEBPXEKAkXybZX+z+tV3dtorOuuG7bv
	cx3d7j0J0LzpK94zrPB3ZrxI0IVSPagmLAcrmX/67A3SdJSRjVPXZTMEiOky3N92Egs1nOe7xVf
	hEju0I0ciDbRuv0ImVQU1GAnWAI3LE7bZPdMx4A==
X-Google-Smtp-Source: AGHT+IG5C65qU/0gcWAKfSFARxzyL6u3mN0Xtc9oqbv09qPqppYihW4uBL1M+tgFQw4KqF1LuOG1RCKLgmDkBH+ElDs=
X-Received: by 2002:a5b:bd1:0:b0:dbd:72c8:738f with SMTP id
 c17-20020a5b0bd1000000b00dbd72c8738fmr3622259ybr.103.1706500354961; Sun, 28
 Jan 2024 19:52:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com> <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
 <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
In-Reply-To: <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 05:52:24 +0200
Message-ID: <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> All the components of YUV420 over DP are added. Therefore, let's mark the
> >> connector property as true for DP connector when the DP type is not eDP
> >> and when VSC SDP is supported.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4329435518351..97edd607400b8 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
> >> dp_display_private *dp)
> >>       dp_link_process_request(dp->link);
> >> -    if (!dp->dp_display.is_edp)
> >> +    if (!dp->dp_display.is_edp) {
> >> +        if (dp_panel_vsc_sdp_supported(dp->panel))
> >> +            dp->dp_display.connector->ycbcr_420_allowed = true;
> >
> > Please consider fixing a TODO in drm_bridge_connector_init().
> >
>
> I am not totally clear if that TODO can ever go for DP/HDMI usage of
> drm_bridge_connector.
>
> We do not know if the sink supports VSC SDP till we read the DPCD and
> till we know that sink supports VSC SDP, there is no reason to mark the
> YUV modes as supported. This is the same logic followed across vendors.
>
> drm_bride_connector_init() happens much earlier than the point where we
> read DPCD. The only thing which can be done is perhaps add some callback
> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
> absolutely necessary to have a callback just for this.

After checking the drm_connector docs, I'd still hold my opinion and
consider this patch to be a misuse of the property. If you check the
drm_connector::ycbcr_420_allowed docs, you'll see that it describes
the output from the source point of view. In other words, it should be
true if the DP connector can send YUV420 rather than being set if the
attached display supports such output. This matches ycbcr420_allowed
usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.

> >>           drm_dp_set_subconnector_property(dp->dp_display.connector,
> >>                            connector_status_connected,
> >>                            dp->panel->dpcd,
> >>                            dp->panel->downstream_ports);
> >> +    }
> >>       edid = dp->panel->edid;
> >



-- 
With best wishes
Dmitry

