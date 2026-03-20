Return-Path: <linux-arm-msm+bounces-98879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP4+DDnMvGkk3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 05:25:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0822D5C4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 05:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131E43067A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 04:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994322E7162;
	Fri, 20 Mar 2026 04:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="ZCdr9Eta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298C2E8B8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773980726; cv=none; b=D1gN7Yfq+keXGoNVO8WdBLGaCDHzZmnR5WE2XdaAU2dGIRxoOD2k1Oj9Vr6Mt3ROLBrISEumu+OSyn71MqOAUpiLmimgKXPf+3elE8oXKuOz/WrLK/+khmcP8L/ui5zFBNENaSMAg4ToOnquHPWx9HYydZAfr9manhjlulHVyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773980726; c=relaxed/simple;
	bh=6IbZCnAgMzbyfScoEQp8CPfeU2ha+EwH+CWvVv7ealw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Q7l9wuoSHttbl/Z/F2VvDAb2du0ncfVaaV/e5saksALsPKg6XhU+HqltauPVciq1n+CnCFNZOk+rn+XqexF1V0R2EEr2+C80caYxUQ1xq/J0L4LREY8tmOuhA5Yglcwr9IO7SUTW2419fGHJxPziYD7ZTASGKgZK4bFw3AeGVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=ZCdr9Eta; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5090c7e9081so14412231cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 21:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1773980724; x=1774585524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTWWaO+/XhoNRCAuJEz9H+WLHO2eUwKG5OIDlVViY4s=;
        b=ZCdr9EtamSWNboAJ18U7F4emlerQpM5zBgWRRoo+CHf11fAfS6qsGFJHwxrFK3pCRT
         tQXfrOIoOOllV1Sl+In39EF7Vc6QBAcZeh5i+HCdxXe/G9tD8kcYyrmbFjhsOSyQmqhQ
         mJdzV3dDpx/Egv85RWX2HgenXdIMhDHk0XjZ/D2FtiYAMRyhfqKFFEQ+fRSWjvAGxU24
         OGpmCkJTC6WH2oQMeCwxNt/ow67EdhpiGJyM7WQG7w4qCFx5nk65Oy2GoG3ZNiCVQcAP
         vJlOXkUdLFWuVz2x4PrH5TpwrYQgubzLDPztgG8vVGzHNioqOdM0syWFUe4G54kciWEu
         ISLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773980724; x=1774585524;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTWWaO+/XhoNRCAuJEz9H+WLHO2eUwKG5OIDlVViY4s=;
        b=iWdB6TjRK1pCUq5l5w7oisyXrop+T/Yb+t09ndSWGgcH5Qkph4MfaarxWfPOhdi7IB
         WcA6LSENguct35a/lIAclQL7ff0n3sfU31PA0bwLDmE94lrtyTXWKeGaYOi8U5oaLqqo
         WPmGJnTcgd6uhr4JZo5IXp+vRyzc/v/xML2x5x4f5Z6nKsUkAss2W5gHNuUSCvFiJ4e2
         F7SLHMc6TU5wBrfxMNVOA/FFE+lUfNuPNiadJFLHnH7n9OoED+EnWlTvwD4XMTgFNKON
         pRn62Tmgulyr4FgIlkUxXxHyS0jUchpO0mRWbtcZvw8GR8nGs+kMyeNV6W2iFFR042jn
         8VTw==
X-Forwarded-Encrypted: i=1; AJvYcCUi9N1lwcA6zSNQv2FY96XWBSwOt+DNXs7wJDbDQL3WIb7EU5TpbsD+8SwYrihUcM8VSIetRCKkC0HTON+m@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPAEtdixmBkjl6sAjeAd6I+TzoyHzTtS98Y9Wz42/Sl6Ddu5f
	kmzrczsYb6uhfA0OBTFLSdH3cO+LPIOnFJv801TOzm3HCVCM6skUD6vp6i5ajphZEMo=
X-Gm-Gg: ATEYQzyaD8O0/LnQLVJT92l4egLJqxcWvBHuHUBtyLnThjdBNT6WAPSmUWsR/QBLzIJ
	s5/pEF1yFqjW0fofeId3lxbyprbzMygQg2Tos6AHStJWuEVoovQS5hcSLV1hw5bhSixTsx+LJXp
	kusCckEZ5On4QP1NqD3ICbgQdHVp3IJUr3Ao9Zei9H+Fa2erMuN7YZpHqucx7apGSPF71i0/ZIs
	k+StvmWcP/HuJGHLvwoAcVkLaHEU4exW1OSZrVW4vCRxzYw9mzNiSuAN9/BXQRRXc24ew/ArKGC
	xKwXOb5HeiXMhuAmXc6hw69EdKaM2I1wE0YmodxJO/9V7kRDVwILppxy4Y1QZWpBXCxYgX5E9vT
	/P0n/87mV9FYjKQqw8OuAiw4VpeN7DPUWKI+qfkLidyHbUjz8DRGjXwzxdnWV3/h5IVX01TALI6
	A83CYXbNxg3tj/wucBhGYH72XWSow4/ObFt2FY7vVuFHYO1C8DK0efsT1N+8uv5cPiz/02bA==
X-Received: by 2002:a05:622a:1249:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50b37503075mr24487301cf.55.1773980724006;
        Thu, 19 Mar 2026 21:25:24 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85251e32sm12201056d6.16.2026.03.19.21.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 21:25:23 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
 <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
Date: Fri, 20 Mar 2026 00:25:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[marek.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[marek.ca:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,marek.ca:dkim,marek.ca:mid]
X-Rspamd-Queue-Id: 8C0822D5C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
...
>>
>> That's not how it works. INTF (which feeds DSI) is after DSC compression.
>>
>> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
>> the INTF timing should match what is programmed on the DSI side (hdisplay,
>> which is calculated as bytes per line / 3).
>>
>> (fwiw, the current "timing->width = ..." calculation here blames to me, but
>> what I wrote originally was just "timing->width = timing->width / 3" with a
>> comment about being incomplete.)
>>
> Okay. After reading the docs (sorry, it took a while).
> 
> - When widebus is not enabled, the transfer is always 24 bit of
>    compressed data. Thus if it is not in play, pclk and timing->width
>    should be scaled by source_pixel_depth / compression_ratio / 24. In
>    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> 
>    For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
>    by the factor of 3 (= 24 / (30 / 3.75))
> 
> - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
>    more than 24 bits. In this case the PCLK and timing->width should be
>    scaled exactly by the DSC compression ratio, which is
>    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> 
> So, this piece of code needs to be adjusted to check for the widebus
> being enabled or not.
> 

The widebus adjustment on the MDP/INTF side is already in 
dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for 
48-bit widebus instead of 24-bit. there shouldn't be any other 
adjustment (downstream doesn't have any other adjustment).

a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends 
out 48-bit compressed data per pclk and on average, DSI consumes an 
amount of compressed data equivalent to the uncompressed pixel depth per 
pclk."

Based on that comment, this patch is correct, and the 
''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment 
only applies to DSI. (note: newer downstream looks like it would divide 
by 3.75 here, which doesn't make sense. older downstream would divide by 
3 here. I guess downstream is broken now and video mode + 10-bit dsc 
doesn't get tested?)

on DSI side, "uncompressed pixel depth" shouldn't matter either: DSI 
only sees the compressed data. But based on that comment, when widebus 
is enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then the DSI 
pclk is in 30-bit units instead of 24-bits. And with this series DSI 
side ends up with the right result if 30bpp format and widebus is enabled.

