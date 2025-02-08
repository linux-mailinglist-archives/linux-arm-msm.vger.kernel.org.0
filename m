Return-Path: <linux-arm-msm+bounces-47222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87239A2D2DF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9645D1885EC7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 02:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5682145B27;
	Sat,  8 Feb 2025 02:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImIsWWIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F0610B
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980274; cv=none; b=kG2SxH7xJTCQsiYHD0EzaPYZ/0pZrjUd+lMbjwqGqEai6w8hwdPSpo80oxlXa577Vs5XequeWdEyv6/QFlFdW06/4IV0UGdyXQuWzQLNkdEb2mkNUjCfjTKNRRUky0qxT3N3AdzLk1WZNAWVTj5+xeDliWGRKZhtw5JYn1Kr5Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980274; c=relaxed/simple;
	bh=J5UfmGM/Tinp+RgrrR5yqRmmM2OHUszHAQXisG5NOEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neKSyBRKkv+8LJL7nTGmyMsEvIvI5vkKIUISobFLBjEIkrcrkW7j9LLzQCttHUSSFDxLBXkx5Fkic33FS5j5K2cpCPbdhPZc9MfKhaBZcm0kaQbw0Jm+9vUbBi7nMT87+6K8BLv78ow4531D0fLocE21DMZEdNTPriUQY0WrxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImIsWWIX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so28201731fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 18:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738980270; x=1739585070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/9UIs3hl18V/afdeYOvtkMcOtx0lTq0XewA1h2xuiE=;
        b=ImIsWWIXlNVYpBGAAo3yH/EscufFV4HBpkdiY+O7VllyinTA0Cf/48pIO/d9EgzRvN
         /XYSgf5oO9/EbpejssBmXvc522B+dIQf4aidpxAWbEhpvOb5oduoiq3hOyuCt/uUzsaE
         Pfw6Vw+DhfmcNdY8J5n9KdnAHiNDtKlYdXNaNeRCT7xorBMfJL0LMlw6BtoCsRWSm08P
         i2lP6q1d4VobxHgj5Eyp2WhlO8a9OgA9MAntyafCVbN7HIfFsPnP3QxUHdRMnbR2LkAz
         fQ37B7tFMyMv64M5CMJFV8xP+Jb+tJtc7Ra5ppenVNWsQUqXZccfwsjUks+iELAPaa3G
         OMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980270; x=1739585070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/9UIs3hl18V/afdeYOvtkMcOtx0lTq0XewA1h2xuiE=;
        b=I2bDFraZ5dEastSskwwp3xaJ9I55M3RlhzRmhcBVR9NEmASbltk75vo4zexJ3vB5oc
         Ipi9qar3TSpT5GQWavpgkjh3ANKlOOrpU/6uOlI3qu1yB49Es2uwLzee3OK22jN+MhgK
         XO6zU30j5UmcLTi03H0iY+64SV/NwGK+TVUZCvRK7Z+8U5aCcVTNVYhqme1mYkbOf3t2
         bPHEevsH6KrThobhirchQ92NYgv6Uv4cN351HcjCBoVZc/snK0U1CjQHMvou5GvPujkA
         hgZH7+A5sJssggtQclj08NCr143sK6iVZp51fpdz7yz9uD31dHK01CsbqfitCtoqziVc
         mxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTgW4Cnh5mvAZEIsPTGEn4nTzaY1XycaZS62OnYPDxpxUE51BHLBuJ3l0TKF6YQhMwCI5DqVXfgnMiHc06@vger.kernel.org
X-Gm-Message-State: AOJu0Yx27FS+H3sWSIwLO2JWwsP4t60dEqlQ9k4g7kVbj8cwl9m/61kK
	KlepqWqVlP0VCLJZyymxx/NQU/VxiAQIqmYIibu5l4IJ1gaa/xdLFkmzI6iLEpw=
X-Gm-Gg: ASbGncsKSrKtEZy10UTuhpJpjW1hRzxekWkie14dd+nxXDIbuvWw6vmLhmwxW384fH9
	z2vdJ3vGuGN40prqaGCCvNMVXuJurXLZdZpM5RnucxxZaW3gf7I3hA2Xa7gUsqFnhnlKoXobl0C
	+riYTTcOG7MvwI8O8XTnwIElqDwms52mkBA+9RXuxKjH4VfAUD0WMpHFKk9WL8thBMnx2XNjATs
	vq74dFdq9AY7M1HJ2kpzR9ZkrIZmQeR9H02OTFdF+G0Bhlma3UklnZlXT7ey06ikJ8x8p8O1h7w
	aPg+iibdIygNv8F/GCpXIAQBYLsIpesdupsPw7UMvR1iSsyYGAW7JwZfiaZmlaUunOEFH1Q=
X-Google-Smtp-Source: AGHT+IG8gRmZag/jkGsALd2FPTjuqUbLGEBG0tbQs302+BUmUper3a9l47TJWJqQdmkiXOJueXM6yA==
X-Received: by 2002:a05:651c:2227:b0:302:25ef:813e with SMTP id 38308e7fff4ca-307e5a8dc66mr19195551fa.32.1738980269771;
        Fri, 07 Feb 2025 18:04:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177c54sm5904121fa.14.2025.02.07.18.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 18:04:28 -0800 (PST)
Date: Sat, 8 Feb 2025 04:04:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>

On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > 
> > While the HDMI block has special block to send HVS InfoFrame, use
> > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > that requires manual repacking in the driver, while GENERIC0 doesn't
> > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > HDR InfoFrame which we do not at this point anyway.
> > 
> 
> True that GENERIC_0/1 packets can be used for any infoframe. But because we
> have so many of them, thats why when there are dedicated registers for some
> of them, we use them to save the GENERIC0 ones for others.

True

> Lets take a case where we want to send HVSIF, SPD and HDR together for the
> same frame, then we run out as there are no HDR specific infoframe registers
> we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> HVSIF when we add HDR support?

Most likely, yes. That would be a part of the HDR support. At the same
time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
HDMI 2.x (once Linux gets support for that). At the same time we can not
use VENSPEC_INFO to send those.

I can imagine that the driver will have to switch GENERIC1 between HDR
(if required) and SPD (in all other cases).

> 
> Also from a validation standpoint, I guess to really validate this change
> you need an analyzer which decodes the HVSIF. So was this mostly sanity
> tested at this pointed to make sure that the sink just comes up?

Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
been validated (validated SPD, AUD, HVS and AVI frames).

> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 93 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
> >   }
> >   #define AVI_IFRAME_LINE_NUMBER 1
> > +#define SPD_IFRAME_LINE_NUMBER 1
> > +#define VENSPEC_IFRAME_LINE_NUMBER 3
> >   static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
> >   					 const u8 *buffer, size_t len)
> > @@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
> >   	return 0;
> >   }
> > +static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
> > +					 const u8 *buffer, size_t len)
> > +{
> > +	u32 buf[7] = {};
> > +	u32 val;
> > +	int i;
> > +
> > +	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
> > +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> > +			"failed to configure SPD infoframe\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* checksum gets written together with the body of the frame */
> > +	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
> > +		   buffer[0] |
> > +		   buffer[1] << 8 |
> > +		   buffer[2] << 16);
> > +
> > +	memcpy(buf, &buffer[3], len - 3);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> > +		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
> > +
> > +	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> > +	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
> > +		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
> > +		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
> > +	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
> > +					  const u8 *buffer, size_t len)
> 
> msm_hdmi_config_hvsif_infoframe() to be more clear?

Well, all DRM Connector callback uses just 'hdmi' here, so there is no
reason to deviate from that.


-- 
With best wishes
Dmitry

