Return-Path: <linux-arm-msm+bounces-10502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D528503D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65CF31C21735
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FF433CFD;
	Sat, 10 Feb 2024 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSFeYMKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA524214
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707560154; cv=none; b=aEotw/jysNc7IWZUYeYAMesAyOIe4WEBltVZd3V+tKjtY3uj92KqTzGtkr8mbGCqpQna4EBhsUNnRLbWak5FGEHykybYiRjEHchz/zakVqSeHaNYpP6SxcskAgLRytOeKoRcn3WA0iIP6yFpX9yC8QMvzpbQmjgce9un70cP5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707560154; c=relaxed/simple;
	bh=vUy1qpxBH6Jy+3F1PinnLun8EMeOcT4TsP3pzS8g6cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LL98nBjHz7ELPnCSl4AWws0x+ZJTB8oImO+a2+qym32vJOxQz/ALoe5iRJrIpH9nUb9OT87GVQOtPzP9zjSqCivSjq1vXxPm/txMTg7zA4rNyp1T7zWr2bPoChzcwp1WS+gL3CpSH9IER4T5IYri6exjo+R0BgUnlifVUz0hibU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JSFeYMKY; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc755afdecfso1306725276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 02:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707560152; x=1708164952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nTueEFOakGyv2InDAGvYZKbL+VubaYqrJvCf8EJK9lE=;
        b=JSFeYMKYjfMN+a5quAq59fYmLYmdAFifPSPVuDcLDOxpLJ0eGOsA7Jeq49z3y/zXda
         xRklp6wvOVjCqevmqrSrTllon7ozvKB7crxqNFaptdPa+mR6Xf36IsBzFkrS9Bc/FIKd
         qhokobR3l1fcTri5dt7pjuh+l0aQYY0kXGAgCgykxr7C/sBt1qm5R3Itrkt77OM40+j3
         VOlB8pTiFpc3dfwkdNqZu0asSo6Zn3BjQHaGWC28OLQRkv1ywO/Gl/dLC87itbEDSukD
         sQ4opqD8fBpSoPpoAd88/npWzHUgoXLm7lAJ0jR+uZdx+PsbJPhll6FPLNb0hVqUnHod
         4l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707560152; x=1708164952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTueEFOakGyv2InDAGvYZKbL+VubaYqrJvCf8EJK9lE=;
        b=aO+nPSC4uli8UQy0ZKOJ4ykgSLpf74Jg56xpVYaShMBRkckDaLlpJBEysyxZaw5/Dn
         zXAq3tzN/hCRY1zxg2BBKbMtT34p8tbu9uGW3fxsWFaDuJ+p0Vhz7O86triIwZrpMi+i
         eZE9ips9qRoeNFH4KTKynIiC7RrYM3yVE+Nevsz/Cs4Fsg18Wc/xYEnclZOBC+mtg42F
         MLFqRjElSnVC07niw7kWcfr7SImB6mYz5hHPqMaK+kfecc6Xgl8rnFUQDGw0QbqyQIuD
         MAxyA5x5fZShvvV0WxTuzRCyEfS+q2P+G5486lwoSvSoS4FiaxwPiIIzfjAQC8DKT2hG
         9pEg==
X-Gm-Message-State: AOJu0YzldOBq01gcWj+3rcODkhuSYiFiaPaX+JCn6enU5KsqRHVA4D41
	y540V8M1JhfGtIAM/9Z159TR3LtzOZ9qIJbp+HqS73uEkLBOuPlyk3LmbPP1cQEdeqTptTWUTNL
	nXwPaqZzZeoWvTrJK6U4Fp/pVNHE/ItRGPViA+A==
X-Google-Smtp-Source: AGHT+IH3pyRrF+bOTqZSKxC6d1uuPmJw/Ln+Vm5zM36cx+v+NuNLqQtQuSRqJnbCNZnhzilvIHKApUIQFwXeMRFi5qI=
X-Received: by 2002:a25:d08f:0:b0:dc6:48fc:65e4 with SMTP id
 h137-20020a25d08f000000b00dc648fc65e4mr1465961ybg.40.1707560151817; Sat, 10
 Feb 2024 02:15:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-15-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-15-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:15:41 +0200
Message-ID: <CAA8EJpq0GqJapkLMuGSK7CqJ5mAJJJPf0MQWER9Mb6ErHmXrog@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] drm/msm/dpu: add support of new peripheral flush mechanism
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Introduce a peripheral flushing mechanism to decouple peripheral
> metadata flushing from timing engine related flush.
>
> Changes in v2:
>         - Fixed some misalignment issues
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 10 ++++++++++
>  2 files changed, 27 insertions(+)


-- 
With best wishes
Dmitry

