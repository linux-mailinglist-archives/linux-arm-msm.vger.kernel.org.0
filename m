Return-Path: <linux-arm-msm+bounces-30244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E048C965FB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B85A3B25E78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DD819259F;
	Fri, 30 Aug 2024 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGVXmE+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882818FDD7
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015385; cv=none; b=gCvX2Q9Vz90A+sGXPUrVGHhRy+Ki+5eNf5/Fzq/Kz47Gv+gSzHp+WQ5Ra5OX1+0cUBP70VRLhr422GWC0tgkYieoyrdFh4qFebAQAmzz7vqSGsuTGp8F3lVfGeyN62tk4hZ7FHZQvNG+59d5MbnlyNrP5v/7uZEur4EHZOIk87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015385; c=relaxed/simple;
	bh=0yNkwl+K5/f2VBOn0wh/xwNfO68u56iaPDTBCQB+eAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9lzefoCU66y48A8NWW5hDkA4lcOC1KbwxRmive66+5bizPO5EwIa33vgkF2JmERJhBtmall4dAmJVsuOnchNU9/BGHk9nsLlXbuO6EKCZbdHAjqX3YilZ5wR4ILkMBqtHHqe8aPPvlPa3Ya04udvxIqGuB85VxOOQjBRiLl2I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGVXmE+1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so2143980e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725015381; x=1725620181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gKyKcoJ3TdGstuho5BLbj3dZPw1dj82Fy+eFXEsXQM=;
        b=xGVXmE+1pE+9jg7cyDn3RqoS9NbP3TyjTQXw5VuoMLjKHAFPF3AgtIo9LQTeeWtpTx
         vJZiAPDn35JxD5oRpOyAQu7S5Gzt6sQWboITPGUkbFTPqf5vCxFRjzP2bSXtxWwaJK4c
         +GWpGiDWNBhrO+Vjq/bUSax0d5zYUjpaWBGmqNN//5jV9KPqNbBIK8IpJCapYZ+/qguI
         HkLsONC6n0r4/S1F/Z4qZvR5CZoy9W5wEOkjF8gY+zem3rvxs67WzAt8bI95Qn1PXh8p
         pKXaggt42Aj3Dtda6E2yh4iXc3U1hJoyJxfJ0XnG69fYECp6PbpU7edDaMp/vzQYFuOo
         QS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725015381; x=1725620181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gKyKcoJ3TdGstuho5BLbj3dZPw1dj82Fy+eFXEsXQM=;
        b=f0ATnTblXk+auf8Z5TjRLFwJ5yBlBUgXVeAWPHxOauskhTB0IdWQ3EuKWCwcqiYk4R
         gRYvdaV8/HtlkokYy89OD797GaWMYeGiBubSVLAI1jNvCOjwDvi86oBEl72Mam/zSn3C
         E9jsqUHl9WSbSIjvcJgyZuCOJZzal0vh5QUv9Y4dLdDCrF9N5v4DJ/LOqd7Q1Eqp1kLB
         NeGw6s2DHUErkRCQKcf7Jd894g2B9PH4oE9EAxjKVX/su8ngdIJ643bnOpK9u6jqmgmm
         4CBNHKX+dCZlu2dHz+v+F5tQJjSntKikMWaTwoKnw8WFtZ2Im2xzSQrTctncJvaBxYjO
         qmJw==
X-Forwarded-Encrypted: i=1; AJvYcCVWupUMhy97H8+gUhly7JXaBWVcwich2cSkrO0/g504b4MFt4Q8617rrB8uiSmUDE9dR2FtuDRgTxLeuBIO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5lZFQayRJpP4PPVSnakIHkl7LsZ9rRk9NXMy6x6EmvDeayZt
	n5cpaUzkdBUpUizqSJh2nrRPFXJMlViwxNJdBEVx/iELPP57zM9QNCKXFfDfFbd5P95yIfzxmfh
	Q
X-Google-Smtp-Source: AGHT+IFhQ6PoGmrOUr14jdbBRUr38XMXRb64j/1OyzzvHshRezk/QL3UWUvUtUOcTCJicKZk+oUx6A==
X-Received: by 2002:a05:6512:2309:b0:52e:98f6:c21f with SMTP id 2adb3069b0e04-53546b0b111mr1274057e87.16.1725015380724;
        Fri, 30 Aug 2024 03:56:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a11sm545340e87.162.2024.08.30.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:56:20 -0700 (PDT)
Date: Fri, 30 Aug 2024 13:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: srinivas.kandagatla@linaro.org, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-ID: <7tzmorkxuaiztz4vabjvfclv6s5vu2dtlfd6vzlnz66jhg6y2p@msgesiuficec>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
 <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>

On Fri, Aug 30, 2024 at 09:37:39AM GMT, Bryan O'Donoghue wrote:
> On 16/08/2024 10:12, srinivas.kandagatla@linaro.org wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> > platforms, they do not have a reliable way to get the codec version
> > from core_id registers.
> > 
> > On codec versions below 2.0, even though the core_id registers are
> > available to read, the values of these registers are not unique to be
> > able to determine the version of the codec dynamically.
> > 
> > Add the version info into of_data, so that driver does not need to use
> > core_id registers to get version number for such situations.
> > 
> > Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Seems to be fixing the reset I've been seeing on rb5

Let's hope this patch can find its way into v6.11

> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
With best wishes
Dmitry

