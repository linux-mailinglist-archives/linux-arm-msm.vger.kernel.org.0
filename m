Return-Path: <linux-arm-msm+bounces-19489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0E8BF917
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75E582861F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E927953807;
	Wed,  8 May 2024 08:54:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCDD53801
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158448; cv=none; b=YB7H5QTo7huMThiZ4Rm6ubf3toP+n+cbbaDihMLiBXUlFlE1PuKTbppyieipRpmVQDZvXqVRsDwklV44xwLrbvmWiafV5xe1fY/CVk82khejFqXRleQSK+2lACIjxkbiGnEEFdRVLPjKfYOrXfsP+fnJHNIPgpfYJiK/Y6IGB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158448; c=relaxed/simple;
	bh=pflO7IhFdkN0vZOy11haWgFFUMQUG7T+bleZpLFH1m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUiR3wX+dO1XSx0eICLSBtgzpndmx/i1TAYcj8Snu5IcZWe4F2eK0+4hslFM5Qu+SW/zdApXEJ9jjB8+gZSZE6o20gzXqoYU9ivfV7g4MwgHGFfO8dBpCSLByQRwQPvf6cPJdjPXXy2BuGSflE9bpskc72kNI0wJ1vs2O+MpWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d3M-0001lz-IY; Wed, 08 May 2024 10:53:32 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d3I-000F6P-1y; Wed, 08 May 2024 10:53:28 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1s4d3H-000Z3P-36;
	Wed, 08 May 2024 10:53:27 +0200
Date: Wed, 8 May 2024 10:53:27 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 01/18] media: allegro: nal-hevc: Refactor
 nal_hevc_sub_layer_hrd_parameters
Message-ID: <Zjs9h40l9gfaiOei@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-1-7aea262cf065@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240507-cocci-flexarray-v2-1-7aea262cf065@chromium.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

On Tue, 07 May 2024 16:27:06 +0000, Ricardo Ribalda wrote:
> Replace all the single elements arrays with the element itself.
> 
> Pahole shows the same padding and alignment for x86 and arm in both
> situations.
> 
> This fixes this cocci warning:
> drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Thanks for the patch.

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c |  6 +++---
>  drivers/media/platform/allegro-dvt/nal-hevc.c     | 11 +++--------
>  drivers/media/platform/allegro-dvt/nal-hevc.h     |  6 +++---
>  3 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index da61f9beb6b4..369bd88cc0ae 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -1852,14 +1852,14 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
>  	hrd->dpb_output_delay_length_minus1 = 30;
>  
>  	hrd->bit_rate_scale = ffs(channel->bitrate_peak) - 6;
> -	hrd->vcl_hrd[0].bit_rate_value_minus1[0] =
> +	hrd->vcl_hrd[0].bit_rate_value_minus1 =
>  		(channel->bitrate_peak >> (6 + hrd->bit_rate_scale)) - 1;
>  
>  	cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size) * 1000;
>  	hrd->cpb_size_scale = ffs(cpb_size) - 4;
> -	hrd->vcl_hrd[0].cpb_size_value_minus1[0] = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
> +	hrd->vcl_hrd[0].cpb_size_value_minus1 = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
>  
> -	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
> +	hrd->vcl_hrd[0].cbr_flag = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
>  
>  	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
>  
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
> index 9cdf2756e0a3..575089522df5 100644
> --- a/drivers/media/platform/allegro-dvt/nal-hevc.c
> +++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
> @@ -210,14 +210,9 @@ static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
>  static void nal_hevc_rbsp_sub_layer_hrd_parameters(struct rbsp *rbsp,
>  						   struct nal_hevc_sub_layer_hrd_parameters *hrd)
>  {
> -	unsigned int i;
> -	unsigned int cpb_cnt = 1;
> -
> -	for (i = 0; i < cpb_cnt; i++) {
> -		rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
> -		rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
> -		rbsp_bit(rbsp, &hrd->cbr_flag[i]);
> -	}
> +	rbsp_uev(rbsp, &hrd->bit_rate_value_minus1);
> +	rbsp_uev(rbsp, &hrd->cpb_size_value_minus1);
> +	rbsp_bit(rbsp, &hrd->cbr_flag);
>  }
>  
>  static void nal_hevc_rbsp_hrd_parameters(struct rbsp *rbsp,
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
> index eb46f12aae80..afa7a9d7d654 100644
> --- a/drivers/media/platform/allegro-dvt/nal-hevc.h
> +++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
> @@ -97,9 +97,9 @@ struct nal_hevc_vps {
>  };
>  
>  struct nal_hevc_sub_layer_hrd_parameters {
> -	unsigned int bit_rate_value_minus1[1];
> -	unsigned int cpb_size_value_minus1[1];
> -	unsigned int cbr_flag[1];
> +	unsigned int bit_rate_value_minus1;
> +	unsigned int cpb_size_value_minus1;
> +	unsigned int cbr_flag;

The struct is modeled after the specification in ITU-T H.265, which
defines the fields as arrays. It's a limitation of the current
implementation that only a single element is supported.

Maybe replacing the hard coded values with a constant would be more
appropriate to document this limitation.

Michael

>  };
>  
>  struct nal_hevc_hrd_parameters {
> 
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 
> 

