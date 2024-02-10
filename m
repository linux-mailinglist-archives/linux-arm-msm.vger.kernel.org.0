Return-Path: <linux-arm-msm+bounces-10497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6F8503BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3091F1C2116D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5883E36113;
	Sat, 10 Feb 2024 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="huCDsEr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EE32C6C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558300; cv=none; b=StHjgr7n4mS66fsa3RV2ECeItUfNoMx3/izWDlcHWZ+DAA9vmysW2NoNr0Kldw7BiIQfthzw5jywqHfuKH6Uhxl5zj46jhnQ8Iujnn1Px6wC+7dCmhIwDc85dVBpU+WRTGl5XdjR/A+ECrIc0tS31eO6Utu1j8B1AugQzOuZbcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558300; c=relaxed/simple;
	bh=OVl4cFWfuiCvufXQ1gEFYs55wC/9EBgV+DKCTQzKEXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pM7POAGI69wEhyPlcRoh/M43GdpX989LcP9VUEh86qz7rmUQQp50d1Y06j//YR0r88C2erRHC/f4egRanPHDkQ6QLl+x5WsDLc10sX2rNoTTiZ8mqXBla7NePn+Ycbg6bVDWR/LnWx+HWMa2SgYFH3Lj3UQCPY7zbykEUAMMDJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=huCDsEr6; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so1713676276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558297; x=1708163097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
        b=huCDsEr6DTnCgsn7U0LBFjT9o1k8jCYgJrnvgT2wfYbFVcxSVo+Dhs5zUQsv1D2ley
         qbbf2BP6fAbmhkZ9T2VnhGWJwXKxLiy6NV81aYhQHkcLVtnJUsoIGvZyulHm2HAfWLbi
         CzJUWpvFtLUeJKHuM+2bRSKANPxnhnJXaLjDaJralR3gxlvcH/vrK5wNXwslsRwGkh/z
         6Vb2s3LXtIphS4GQUg/STd2Z4IeoccbMknreVnntAulMqjdnDrKRWQjifh9lYjOaRz+C
         9l+1lwlAocuGeRf8WiqlKluNXDWRI2wda4PhSEE+kiU9lXU/ILOThAc6Of9yhrgeTy8y
         e/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558297; x=1708163097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
        b=KcyQool28Xjvi0zAn7EpXhVtMp4H7D8MWvnG0Z9Z+wy9sPSQ+9bUXv0V0yLp7Xp15Y
         +9UjW8noiGwhNRaSe93l+7NkNrLwGHVgMUjOtkaxl+rEhAJlD9HuaNaeuFY3caPHUB7v
         1HuF0+t8h1XAkA71w+RT7K3ZqjxbJR0vMB5oV2ZD6GMkPmv3oHGcmzyHjCzCIgjJFemJ
         I2wm9V+cJXz1ZRbri0zz9bydgKN35Smh9bozwBDmwEuNDTpYui7zMIjfKXVppfhxGIch
         1fpZSaxKAv/bffC47PRVTfCm2TUi6m7ykZ3u9ewrq5GTB/ltX2WKooEwmn2uc467bAbl
         QCeg==
X-Forwarded-Encrypted: i=1; AJvYcCWk3srMqTX1R1jMQxTZ+LPxYpPn8GVWERj5B4MNVbvoxJbdFS6dpiDrpAx8qgUm/Y7cserWAHh6vBCw7HM1GZNeHpew3Y7EJeaKprw4aw==
X-Gm-Message-State: AOJu0Ywb7VizjxHWpG8SfD0wBs5afbW4vIxKQY8DIrsyv4ZGAOE280uF
	4bDM4ex2X4kkw1T0t6zZY8cmec2YaQlB1xwRiOhO6rWP/czLOcUvzqs/zh6+JmFumuW6SWozqgb
	KvyBOzvgRdJvJwaMw2hXD+eiStyVlmEsfP3gu1g==
X-Google-Smtp-Source: AGHT+IF0eF6lGAv+TUyybyGNECGzCMVsbLQbS6zL7lEgkfBkLiiZ3utg1bX7sy4VZtcBLvZgXXa1fnVTapkwH3o8UVY=
X-Received: by 2002:a25:b89:0:b0:dc7:481f:f578 with SMTP id
 131-20020a250b89000000b00dc7481ff578mr1613461ybl.40.1707558297705; Sat, 10
 Feb 2024 01:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-11-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-11-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:44:47 +0200
Message-ID: <CAA8EJpoh3E0b_rNCN4drhB65_xkDN1QJhPLBHWouQaKOLBKCQA@mail.gmail.com>
Subject: Re: [PATCH v2 10/19] drm/msm/dp: program config ctrl for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Change relevant DP controller related programming for YUV420 cases.
> Program the configuration control register to indicate YUV420.
>
> Changes in v2:
>         - Create a new patch only for configuration control programming
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry

