Return-Path: <linux-arm-msm+bounces-98813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHaBEH1IvGknwgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:03:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB12D1768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D55C304AD0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFA6344D83;
	Thu, 19 Mar 2026 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="PUT45Q9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042628313D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946985; cv=none; b=uvV1yf0hG9ObJbeJZHGR8EhHZYt8Lc5uV1lionxBG0iZBiBDl9yd+yULLaXU/Ix79OTFPvB0puerxGj5FJBDPVcU3kG+WIDjQ+4MvfTXWXpwrpZNlO7Zkt2+XWGFb+mNpRnnYVdwUs3pnQUcFDlW19ZJzaMNnYc8O/ZDXKhodLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946985; c=relaxed/simple;
	bh=IAvfMaNT5KdjWO5ThRStfaBzS5WoQbA8p6DqwFaWra8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DuTdeDxtyRlFLsGeK+uEFkjxIp8OFstZbMFpxXzXPdxrmYJl/bHzNOgztE56HBo7d3ZiZ6+s0Zgkts3pvvVDybkdHa0h8puXsCjNU0E/es6lKXpJcRzW5u+1T103ju5VKcSrfekBgqIUDx0DNRuBYP0NdpNjMpAjYdZdRL28axQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=PUT45Q9A; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899eabc5292so10233326d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1773946983; x=1774551783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1HBWRD3UdfQ/mqZ4c9b3lsjSPXBlvDoL130uUTkvuA=;
        b=PUT45Q9ARGa4Txm/JwqMIr2FORHCZdFGJ0vaDC701eDO0BruZMzQ5yCB2DFxbEhJKc
         zYiXbQiJpfe0TtL98y72ZQRwCcXYD877vNBEz8Dvp+84+1j0jKKaAkHnK1dPicRKYixL
         VArvdMrqU7hqFHCW2eZsXL/QSzugaOPlFMbQ5YtG+0TzW9lYBdWSdj6w3D2Gl5T3KJq/
         J1zGbDL1kmRZNNTxzb2t+MkJQwiCOqgyo0RBG28nFbUBOJ01+aSLDlwGPI9km5eU3k//
         tsCJKvGJg2xY+F67gxnS4I2r+q48NAUbxpfUi63+WZ/bzSmxN8ZgP3db4C2En2VlHldD
         rPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946983; x=1774551783;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1HBWRD3UdfQ/mqZ4c9b3lsjSPXBlvDoL130uUTkvuA=;
        b=YGfsJokxgkZFqwGuEE7nPxwn7N/9uz6BXFfO4sSX3YrQaU4+jqxii9Tgu21YVeYAuE
         iU47/dHcj9X4bh7XkSFHH91fFY/T4/s8lqjo7s4HfN9dscowihjgIGMPlluFYGh7JT56
         GqFSTcm/TYLChsn3nZv5XqJC7Bdw0ulz5sCq4g0tnF1lMOdb1NtZYCzjh7frciZr24N3
         6NfoPq4Clw1XBZ3C7BQ49PbGoEAgv7h7olBrAsT4imo4HvtJxXTlBC8hs6fSlFpewpVg
         /ffyfbuU71q4/uWbQZvQKXHvAT2y6fUcYQvsPB4Idj1SQDR8ZGJMPHX09wIS9pV0JtSW
         vThg==
X-Forwarded-Encrypted: i=1; AJvYcCWSc2qymYXkN/5rAFKtzbQ5HBOlIxsd2XasK0kJdqhykUIhqOVo5B+HoNvRUarI+TWiEvLjp8POiByASlf2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyjUYZifKwbjmdmI6US7K1QltWFYcWKTZvqB14BhA3cH2odre
	MIU9q6yiE8xfDT8daDZy+iGDWFJtYNMKVR2Q9mn7kCaqthH1kea0EkFHdSkui0v/XjM=
X-Gm-Gg: ATEYQzydgqZfNaC9PVXYIhbdjfgL9u7WEcfNf9BK7S9egI+MJHH3OCEZz4vPlv1Rf09
	prIkMYt3uAEgnwpSioMzmh4//D5ucmKiHlptCCXRsWAipd1rixFEYKWC+7Cze9w8q0+WIOEc/Sp
	cQXvug7+rddqCW4RmDGqn69iEXcUImfmEJPwgCpuh6oQxTwjmf1tdvirKENHBFXgH3LiibHFYBr
	m3FILziTP46sK0l+IvZHqd5HZOmV1sbhrsKicK1+rTfeaGMwmcurDzlFmNEy56dmvv70bT5Bq+h
	shjHiiKSC1FYKqyIQETJrl+AtCEh+HTeDV1ark6U+Rfo4gtpSo5k+5mGSsdj0HBMxCyHImBabcM
	o/4FG/+PA2hCe0F4IhPBu5H4hPueoCyuNqEyeBTQcrL2wFyqFdEO6evOD8D1HmQTu1neSgQJ1KD
	xSplOMs7Mq1BPltUld6tjwNJicB6gN5lP9LFeMz0ayXa2YiwLEgPTmDOikaj1a2D+CsSBcjg==
X-Received: by 2002:a05:6214:411a:b0:89c:55c1:4234 with SMTP id 6a1803df08f44-89c859cb38dmr3785616d6.2.1773946983319;
        Thu, 19 Mar 2026 12:03:03 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85379401sm3035576d6.46.2026.03.19.12.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 12:03:02 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <EEQIOfQNcsc4wya1P0uxlYBG4w9lAeW4OcTZpsxmpGCzf-tgl_3YO0H5zoZyU5XIwBKurxuki_gGca-Z9YfcdYOXN_wpwixoK8q_fITL1bw=@pm.me>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <387eeb90-df96-9d32-14fb-8fa7fa2fcd45@marek.ca>
Date: Thu, 19 Mar 2026 15:02:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <EEQIOfQNcsc4wya1P0uxlYBG4w9lAeW4OcTZpsxmpGCzf-tgl_3YO0H5zoZyU5XIwBKurxuki_gGca-Z9YfcdYOXN_wpwixoK8q_fITL1bw=@pm.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[marek.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[marek.ca:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1EB12D1768
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 1:31 PM, Alexander Koskovich wrote:
> On Thursday, March 19th, 2026 at 1:23 PM, Jonathan Marek <jonathan@marek.ca> wrote:
> 
...>>
>> The hdisplay calculation in dsi_adjust_pclk_for_compression (which only
>> affects the clock rate) seems to be wrong, and I think Alexander's panel
>> must be running at a 20% lower clock because of it. dsi_timing_setup has
>> the right hdisplay adjustment.
> 
> Checked against downstream and the clocks seem to match more or less:
> 
> downstream:
> pclk: 110070156
> byte: 103190771
> 
> upstream:
> pclk: 110073457
> byte: 103193865
> 
I was curious about this and looked into it a bit (without testing any HW):

- using MIPI_DSI_FMT_RGB101010 dsi_byte_clk_get_rate cancels the effect 
of adjusting with bits_per_component for the byte clk, so the byte clock 
ends up being right
- using DST_FORMAT_RGB101010 DSI pclk is in 30-bit units instead of 
24-bit units, so the pclk ends up being right too (but that only works 
if widebus is enabled)

a recent commit (ac47870fd795) changed the hdisplay calculation in 
dsi_timing_setup to match that in dsi_adjust_pclk_for_compression, but 
only when widebus is enabled.

So things work out if widebus is enabled and MIPI_DSI_FMT_RGB101010 is 
used (note: looks like the only upstream 10-bit panel uses 
MIPI_DSI_FMT_RGB888), otherwise its broken.

AFAICT if you revert ac47870fd795, use MIPI_DSI_FMT_RGB888, and change 
dsi_adjust_pclk_for_compression to divide by 24 instead of 30, then it 
should also work (and won't be dependent on widebus).



