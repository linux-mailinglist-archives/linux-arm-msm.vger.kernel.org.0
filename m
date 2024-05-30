Return-Path: <linux-arm-msm+bounces-21122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DA8D4E13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA47D1F21237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203EC17C21C;
	Thu, 30 May 2024 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BzytVopY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81816EC1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079685; cv=none; b=YkDKIMUVtJUG7gIyYlHNFfhddhsGKjC0k2QCw2j+g58VU3jQtfDEB49L7DURw6PvQxXUOEeaF2aV6Sb7fbHSVnD5XfL4CDUUrc8e+WnaBjfOxXq2e9qmHtuTAi6bLLISre5Bu8T7FhC5oNTVX4mfniAZkQY/H5V83/4RHTYCMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079685; c=relaxed/simple;
	bh=1qCz4gxX5VkDo8qBKe707hsmEHKhe8QwQY8YDu0jtPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7lKRsoFeC9YM5j/4tmO478hH7AZ40x3+fuPoZzTtVLIiigRKNLV5b1ODcxGVADH7hYUnlo2HehhT32Sm1XX5exZ7SSWGWn0+/H00K0lIhKkrxVwvwMAnmDlqn7vq/7XmG0gWfiPTQns8Wzan5TRPmoWab89RKywxagfg7P8R4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BzytVopY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57a033c2ec2so999534a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717079680; x=1717684480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nexbWWHw4HmMZ2rLkky2t/GA+e/X7pKJTR1LckTnZc4=;
        b=BzytVopYGiiIDs516Mq6IQ7lDpNcdzSTE+7AmXp1dijLc2UDyhG6dNCkDWKbyRksjP
         JcpNn5Yp8FdzFmZT/mN8tNlCCCe62EIehsg6xEv7q3OqyCD+8uOLziM/2KmIJRiA/vTI
         q7Rl+UzvUMtM9Ti/5VFPUHsgPLWmhVi3T95ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079680; x=1717684480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nexbWWHw4HmMZ2rLkky2t/GA+e/X7pKJTR1LckTnZc4=;
        b=BtXKFBmqw5j7S9QqZ9hf102j3C4BvhxttV1VVPHh2fjOJrfb/PCZ8e6lT9w4IqbrHn
         TlxNSCcOEV9XU37vN6TEQl2OAiiLaxbjQnIBf9IkUThcykp99U1fXBUxbKHgx574nOB3
         tjYmi+U28IqKsVH55eejXuySn6MyoytwOWBCokxxu+QN7Ejtz4b/0Y3k7fSvXQM/DaEr
         5GeNDjmO+XhnTKstUfpTsOENdw54n2bEgRs11e0vs43RnfsOrynJNEdXNL9qn9Qbysa0
         W4vMKb2gMnY7pcJTSCZhq8IubjTnbeC8gKfh5MoGsekXrrHVyE3LZi+J+K9xMBzGqzbt
         st1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/jHCQeqY9EaolmaG6p++hyGAMPmCBJlLBKd0m1l0n/Q6oM53lgxucKPwD5TZrxPVMx4JoT24ZHNbZl7h887842N2o1wgIUq2btZ5dkw==
X-Gm-Message-State: AOJu0Ywu/nQ/mc63doc9ubD+gFhv3kSJ1axjAZUW6btZCHfyudBnjiu9
	1PjjMLETLC8uw0F8blJQve8S7sNb2TDxxHkRhWujJ9odb+9xJoyTr43C6mQsQTDZefcQHwpQKpp
	HUg==
X-Google-Smtp-Source: AGHT+IF5xgt3TYZv8YTFJcVBAZ2zsjQDf33WVNySQZPIVJ0V5LgjrpZJMfwzvvjqTgaqYADMZRM0nA==
X-Received: by 2002:a50:8d18:0:b0:578:6198:d6ff with SMTP id 4fb4d7f45d1cf-57a17969954mr1587375a12.33.1717079680532;
        Thu, 30 May 2024 07:34:40 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bc4d8sm9857607a12.94.2024.05.30.07.34.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:34:39 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso16334a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:34:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPYV5wF9GYT4mWdxyyRuRNv3q0YWw2Ovq4SJOBxTkgMNM3Xf3FOLVWpfhUxUWWmIDMuRLnhq2dfGEwNv1G4trWEzgaXkPfBC5caXdqRQ==
X-Received: by 2002:aa7:c14a:0:b0:57a:2276:2a86 with SMTP id
 4fb4d7f45d1cf-57a22762bcfmr100726a12.4.1717079678834; Thu, 30 May 2024
 07:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org> <20240529-edp-panel-drop-v2-3-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-3-fcfc457fc8dd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 May 2024 07:34:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZCeawkF+c8yhwMuR3_LF3Z0swT1L-_r9kRccaxJqUTg@mail.gmail.com>
Message-ID: <CAD=FV=VZCeawkF+c8yhwMuR3_LF3Z0swT1L-_r9kRccaxJqUTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-edp: drop several legacy panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 28, 2024 at 4:53=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The panel-edp driver supports legacy compatible strings for several eDP
> panels which were never used in DT files present in Linux tree and most
> likely have never been used with the upstream kernel. Drop compatibles
> for these panels in favour of using a generic "edp-panel" device on the
> AUX bus.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 173 ++------------------------------=
------
>  1 file changed, 7 insertions(+), 166 deletions(-)

All of these are fine as per my research [1].

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXz1VsF8jG0q-Ldk+p=3DNY-ChJkTk0iW8f=
q2bO=3DoRFvXRA@mail.gmail.com

