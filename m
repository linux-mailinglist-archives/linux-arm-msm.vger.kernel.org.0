Return-Path: <linux-arm-msm+bounces-75878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A917BB67FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 12:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138B53C0FAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 10:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B3123ABB0;
	Fri,  3 Oct 2025 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VibDdP+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE626E16F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488979; cv=none; b=sVKf1dMgv0PkFEQl2zE8is4coH2myOW8Dm4LASTpSpe+tn3lPjnIhv/el2c1ib5nEPKxP1fSPHnzFXIAqDrO1oqrmKN/lcvpTMfOb+4Kl/KGigvClypJHW6msbOXIeNgNVBy3UPFof1yU1u5xym2JnUum8w9CaPRG6ffhWwGzQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488979; c=relaxed/simple;
	bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXrmtHi9cH/8QBsTUBLRdTmTbgp5+K+2mjJShWbUdNa2ah8saGRKfW+CPqRzOEJ1pUGDCeBVCFt498GX/AE6reVBZT7rlB4qBNeQTh31QDQfSULg7YYGOI2X3OeFq7mFBQ047JevDdJPF8D8FS0G4HeIWWL5mpGYNiSKPGDs6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VibDdP+u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso2486434e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488976; x=1760093776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
        b=VibDdP+uOuIhrl5no8vm5q0cbo+Lid7gD+esE1Wu+sSEoXEQoATvwqZCihNpnab7zI
         wrxrsooEhnGJocuOCTj5uK9vjNfiHaJ3/Y0HcXzbAdqRLjhJveVA3YOYIfXZ6zFeh++t
         5w30wJCV0ozNwuqQNCAeLQGIZ5IC0PksxuwuF+DnS+W9CePNIrbcmtlZDrzwNQSgcZIo
         Q8QdplqD2iMB5fpkj3YEL6qwBztti5/F09X0aQe1ySSlLkKD5aZX3VlgPgJ0iIrOl455
         01seSpLCacLYYGF+cUXWRCE1//QkkPeLzPK1gYXuewoNlkzQJj/P3n3f3EEAyA8kG97a
         xhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488976; x=1760093776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
        b=G5Icv9biv9K4py3ZBfSQMI33/6xLQLghv7ZqU4MPjHzwqAfv94SZtzVf6Oio4NKRLO
         pmpMMVpcuPYE0ulRBoeCOSLVtnqf+Ug77KJrN6fFYbh7hDVWOrk2OXXOTxJuShYMEKIU
         iTQ4dC4NIJOmz0X8QEw9oFcbm6f3w/M5tqhiijsBQH+/NKEz3IwdfGRinFICLvE5sMsy
         EZlKwZ19a9dUNQA0mxCyDW6im0kkgXCnH9/VwdleLOOPEAm0rlYtJ468IlAmqACzEAOI
         bYh1/lmprpSlWytnR/uUxLvz5L00FC+jkMiTrPp52/q6GLioJR2R1A4t4YdHeQdlAWZu
         Tigw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKBYrh+rpSYjbTFBISQrzS4T7RcyCuSnW+7tqgCdrYdGS9qs6Dgul28HsWvyQ4dLWb66Y7kPWuedYSmdW@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEsX+uPFuagMQluPtaojNWI0og1fItfj9K2Yf5nlRT2O6xze2
	M2rypRSne7zKWpjLJEKgANcGoBYU+X3VNvp5l4ROVXbjzkiE227UtulPPzz4N5X1vVsxED5uWyw
	N9PagBYGD4Og2FFfVHTeKHzetOBZuSUIljZ5Mw2Yqmy+9O9P9MOF5nRagOw==
X-Gm-Gg: ASbGncs6tkII5rAUus2EyBKYW9n6zbHm+uGhY/r6aYTFX1WeDejZvE/h12gFC+bSxzg
	MS1vXo9otxCQI9eMRycsMd9jhl9TGyrrRLSL6yGJRNbylTrDMPQctRuk2tPeA/L48bemp4++cQn
	O7tX4ub8BgrrJaZX9V1QKiDbJYXLJIQa7vPLgG4sym09BZ3uY6yOAVinfK5kNb+3pxMu4uxtIy1
	VtAnjnlrLcoi2eLowqj0/8NDkutVz3gqyotncC/t3v8gaSV18KgM1MBF8DQdw==
X-Google-Smtp-Source: AGHT+IFiU0MN9oFDa1Ikp5HhcLAYNTyvSihwUsMlbYXnDWwlSzxFK2G3ZkO+ccPb0Mvvv+PkirvsKjnH+mfjQhaDv48=
X-Received: by 2002:a05:651c:2357:10b0:372:9780:a2b2 with SMTP id
 38308e7fff4ca-374c386133fmr5363621fa.39.1759488975942; Fri, 03 Oct 2025
 03:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org> <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:56:03 +0200
X-Gm-Features: AS18NWDueSWU7qdepgSCRftSEYr-_-nyt3yO-QZq5da38at0E2Itzjmkp-rYUwQ
Message-ID: <CAMRc=McL89znciy=Rtksk18zLJwRSdX-7YJ796YLV9cF4+L=Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Fix the gpio and egpio pin functions
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:18=E2=80=AFPM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> Mark the gpio/egpio as GPIO specific pin functions, othewise
> the pin muxing generic framework will complain about the gpio
> being already requested by a different owner.
>
> Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

