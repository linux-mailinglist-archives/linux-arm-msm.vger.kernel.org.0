Return-Path: <linux-arm-msm+bounces-77925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A1BEE8DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49306401955
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 15:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAD42E2F15;
	Sun, 19 Oct 2025 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnqxyGK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4917B506
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760888580; cv=none; b=dtXKGFGp4KqP5k1YufpeuJMGSODvc2wtTHbJPfo/wZ5HR5fkKpBjtXtiQ7cEqsUEroOqbIkipeSvZ/JkAY2cjqJ/MtPJccvNjDu1VxUmsIhSJ9d5kqwisFqepGuKyr2Mqe5dK5ZCKQrekdZR2BKFP4IuUSTrIY0jI1jgBLuTmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760888580; c=relaxed/simple;
	bh=6yMIQ9DguSJe6ic+F9Z3HJRxEhmXjyWbpn76vKv2rco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haa+OXJz120ToEyV5cJBpYNz2e2m3r1ig6ypcyDIXE/g+GenShnwlP8YiWIpZu7e0KpXMPUwG0NDqW+cefaRM8/zvQVHzwkArq1b/5H+igZUVo0srH3/IQIVYB3MH9Tr1y8+MJbEJAA3VGrn0QL9qVVm2ZArcmDWwVghDOFt5YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnqxyGK8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3496790f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760888577; x=1761493377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kfxazAlKuk9K4Vi4FslEUzQq3LUxlBfoLS51oq9+lJs=;
        b=nnqxyGK84PItv9NaV5gzOSwYKQS591BBIxrrDkEQBWmsn7L+MbEFfCYO8l5zqXBrp4
         JeUEKv7itnsr4SCxRu/rodUgAnRdJRpjuxlKu/36o+a2pmWd3xOunz0whKc/9lziji6l
         G3kqhNLWNSqhGmmSCk7GUzm8UwZ6atQWdKtbZ8CovXQU6BzQkqhN9BOONETOkD8SocYY
         kTtHq6+wc/bgsUq78dZA8eEUmtUKcSS2tpsOAPG0LVbS5SJkZhreYHLbOiE/jCtIaj3s
         6IlMhLaFj5S3cEmHssf6M1XIUidb43wVtyMeayUNLEzr1sfM6AuBE21Qk4JAA8KZ5E0Y
         d0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888577; x=1761493377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfxazAlKuk9K4Vi4FslEUzQq3LUxlBfoLS51oq9+lJs=;
        b=tnVRMIIY3W/fdTtmHOrKKeJGbu1C2tVH3/S7Uzc81x8+f8T9ezC5FOCtldQyGiKcc/
         5toF0Jr5f35QHqtEON6a2vbHJKEVS3VjozDW4Wd8LQMh/rfKTLV/G3dZhMTTividG0xZ
         IJA8leFVWlUOkVDXoYGepiCfnabnxV86tr5pNN7oJZKhFOCzxOwvWchJq5R11wnJm1+Z
         eJw2TKxkXVG3did8GMeL8UC8g7RVqxyhgVcdMLVKggXvWADgxnZaZ7ow1qYwfUsBscLG
         9D+4gCicJTeXJMQKQUzTQEAdaSq9bs0UY7sNnpngvejQNY5Eyba9AaWp78WJDvV0kg8d
         3bJw==
X-Forwarded-Encrypted: i=1; AJvYcCV1TwxVyov+fYh4RLddFwUQltWvZFjWSft/gLSTOW0donhAcML7RpyKRVLcCwTf2tMuGXt5BxTcnjgR6Wbw@vger.kernel.org
X-Gm-Message-State: AOJu0YySGrqiUI1Zix22IUB3EJ83w/g9ZYY5rhp18R8/vtxMuPbjrPGe
	1rojtLXrX4Zh/M0GO8ebFWpRW/zjywjaTIE6xGpdmPkZQFn+oZfORU+fbGnPb3wrGBs=
X-Gm-Gg: ASbGncvwsVGx/s2Eb5IqOZg+YEWv4zgFo0KTnDgHb8k6yZYt6TPKVmks0TlqP6Jo3Eq
	e40AVN5jDAitkQdsojg7zL+33KBLb578Cv5kBJ6hz5b432SX2myOpwJf1aTUV2Pqbau7xNrnTNB
	cmqhlfK1usPR2bfYhAhmtb+dxtfxVJWJNl4aiyEJ+jgZu2gbmDGOZfhp2furRqKanxNVHEacxoS
	6IU4nogXmZ1wV+BC8E2FDeIMf3dUzrq7SF3or5pkaCR/PYsRtF12EBSWcr/Yb+HhjZRCGZcn8HB
	shmTbouu/d8e7d271A9avUgKTa4FAMI3AaN70YXWbPALHDDLy0PjfwiO8KRq8cbL3NVHqhD2sJk
	m2EJalx9PZXOnHGjtZn23hWVJy3rI5EVkGLPijxOaEz4pMAQmjPndrXFJpr2bciW2tLJN+m+ys8
	NA5w4RPRI=
X-Google-Smtp-Source: AGHT+IG3+v2qLeP7l5LT+E1PZqMLuNyjQnEbtNq2tykfvKNcCgkn92fmgyAHFJDyMK3vS/goyWG6gA==
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr2908536f8f.50.1760888576985;
        Sun, 19 Oct 2025 08:42:56 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm10812576f8f.31.2025.10.19.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:42:55 -0700 (PDT)
Date: Sun, 19 Oct 2025 18:42:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4
 master clock frequency
Message-ID: <tqwmgsr5ilw7ao4ayuzi6c23n3qkgqn4yqqr73s3f7b3ehqjr5@5kn4h5bife6o>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
 <20251010-topic-gcc_usb4_unused_freq-v1-2-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-2-4be5e77d2307@oss.qualcomm.com>

On 25-10-10 12:24:51, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 HPG says this frequency remains unused, remove it from the
> frequency table to avoid any misunderstandings.
> 
> The reason it's unused seems to be that the lower RPMh level required
> to support it (LOW_SVS) is not enough for other pieces of the pipeline
> which require SVS, which in turn is enough to support a faster, 175 MHz
> rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

