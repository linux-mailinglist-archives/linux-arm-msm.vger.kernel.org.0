Return-Path: <linux-arm-msm+bounces-52872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E24A764C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 13:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4093A4A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDF01E260C;
	Mon, 31 Mar 2025 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vI1nH82f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197E1E1E12
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419500; cv=none; b=aH9VFGjqyRlKDrj3UqwjszLy26PPJQJtqB/AvzMgGpqRxK75vRT8r0+J+H1/qcVVyaGsL84CxaJ1eOkMLZ6oEr/AyLTDzvAVD3opJ9+emufPJleAg4KrylyaMZfQhpo2ndUop86TQjA9zFuNvzoxhND3kNN4kbVpJDUk/JtYbuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419500; c=relaxed/simple;
	bh=bQvxaj99iKc9Prh5cmtyf4pcZBD8XtodfthaYAnrzqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX65lrM5W6xUTSDqC2hf6QO+4d15VseTBpNjirgiprM5dfbY2T2W7BoNSA35m2VKGEtgipcWJYjXhmoQCmxvaXfmoQjTfwfZ7UmbusLIWFCB+GI1/LLqpLiAvsf9zIfF1H/FQ9QlB4hDYU7dMG6nfbqZTto90tKkWWRCSLIk0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vI1nH82f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39727fe912cso1536859f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743419496; x=1744024296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/z9KaeViB+nABb+i0f3FPF1rJaPqOeT5WIFGvfG0zY=;
        b=vI1nH82fHnBbiYc3zwyDDW6ktusaYpVukZlitKv1Zz47qrTBB/ZGhoDb3W5V8R+DKl
         71Y89xmA+ow4E2I1kibEEREy52NDffzJ9G7VJENloJdJtChGVRYpdThatvZNNd0wVaH7
         r9uxQOUSIQafYmdEN4c5/6RHQY/9+gRhBa8Mav2hS6BOyA4xdutssdkpmVDQM3RjeIDJ
         KyZp5guxTi78K0HNsMYpJW+e26TwYg9rNMwx9fru6GVVfhuQz9ZRFPAQFFBxmLFtSU90
         5rAMiUjr9hq6xxOiFjqHwXOdqs5u/9lSvFLC2I1kqXhQa4v3Zva2hLX7pyIgDdYb8Qse
         Ytdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743419496; x=1744024296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/z9KaeViB+nABb+i0f3FPF1rJaPqOeT5WIFGvfG0zY=;
        b=DRZnp2gFdMizTjkBDTSjROdfiIpsGkMP6wJtO8CAu4+jZc7ttgdLUYtm8rY9PNg4OO
         gpPC4zek7ilOSNIQFFawkAQTnxCpo5B9MdH+xFgqq0TRk6SzveEGHFO+O8n11bhRPfMl
         7hLL3Z7Rs/mthJCDrMVFDcBEEIfR6pbLSvWVxeD6hJnO1qXtTRuUlzyvoz7GFm/nCT5T
         UvoHxvqYVw9n2WV7LOY8qpPQ0bENEC+ooMTWh83yrtFVIRoJ0SMFRZ0Qc8yD2ExRVZUk
         m/pXEW0X3hCAWJyZ/7R7tfJY7hO+FsStnaeYf4PUCJsSY/g1HpX+0VqsHpo+xlOes/BT
         7Afg==
X-Forwarded-Encrypted: i=1; AJvYcCWg/hOqo+ts7e2FJBz8zXHTuunwUXzINZbJWLUrOoMk9+yjbVJ1DJpp08etDQCceZbrnxisBgGot34hO2iv@vger.kernel.org
X-Gm-Message-State: AOJu0YzqhvcOoPUiCdzh1A6j3z1qQe8/hbrSEEK/Ab9z93xldWVFGKVN
	l1PiwAZw6XOFPKlibGcIitwbxKi6AkfYP7qg0vRmKKe/IDvLvP6n8VhNjC4HyHU=
X-Gm-Gg: ASbGncsBfk+6qQnEo2H1mlqy3YDdJwLjQpBeRgSVi+sdPc2sKAaP0eiy1rKAtfjf74z
	F32j0kQQ4thifcCCDXC6QQAQRsOLyustH/KFdI3bqsldxxWP16jDt+j+vLhVGr0zpHzKyUxAgK3
	RDUJhlCYy3+5Q80pAqCH1FCO1nYWrnejjiPVcnwrN/U1RdMiKQ4bbX5Qi8hqZEyEz1X7G44O/PW
	aIichYxgSB0s12w1N3XPoHdo4kVISQsn633Y30vjiui4YQDbfj6np5tAaSqpxDbJF6M23+574J2
	9wbSEMUlIXzdP21ZMOhYqc304x8vdctHmAvQwtTzpKrGyZZJliWJGO/7iVQGjmyXBHLsk7ub1Rp
	cAOpC0Iz6BAyLxCzYYsWVV76Tw4l/xSTlJNMRAw==
X-Google-Smtp-Source: AGHT+IHbzgndrMf5AmHgtnob+9Zffklj+mzgcK1rt8g4VD0vaNiQLwfQIes1v+pMENrKBCJDAmITYA==
X-Received: by 2002:a05:6000:2d10:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-39c12117dc4mr4659354f8f.40.1743419495944;
        Mon, 31 Mar 2025 04:11:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efdff2sm161702445e9.17.2025.03.31.04.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 04:11:34 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:11:32 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: qcom-wled: Add NULL check in the
 wled_configure
Message-ID: <Z-p4ZLkyIIeyVzPm@aspen.lan>
References: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331091245.6668-1-bsdhenrymartin@gmail.com>

On Mon, Mar 31, 2025 at 05:12:45PM +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function wled_configure.
>
> A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.
>
> Fixes: f86b77583d88c ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
>
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/video/backlight/qcom-wled.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 9afe701b2a1b..db5eda8ec37e 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr = be32_to_cpu(*prop_addr);
>
>  	rc = of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> +		if (!wled->name) {
> +			dev_err(dev, "Failed to allocate memory for wled name\n");
> +			return -ENOMEM;
> +		}
> +	}
> +

No objections to the check but I don't think it needs a dev_err(). It
is a waste of .text to store a string that is likely never to be
printed.


Daniel.

