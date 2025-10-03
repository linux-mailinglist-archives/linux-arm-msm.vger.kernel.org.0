Return-Path: <linux-arm-msm+bounces-75876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D5BB67F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 12:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B64713451CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 10:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353B2EB846;
	Fri,  3 Oct 2025 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dt+2do/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A32EB5AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488910; cv=none; b=YQa/9gMSTgdu98srmr5kCiE0ii6Yq3kukHhxNKeMY9UoRyplikieiBLuVllYWdvsNXvUCffORm4pykS8QWmcRUTtxiTaLfKZzZ8ZnphOdguNzqugi6IRpj2py7lRbU/VRgIl125eM94CPaGyqMCs1e0UoJRE06V+Yzvuy4wWzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488910; c=relaxed/simple;
	bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwPbg56aO/sVQiywkSTfPG3R7DmMaJ2FBycd0hE0Ba0ZYVPagdH8iFx40Db3VtybSlnw9sdKwWRZqFYmGDpkbFO97VqnvioHEqGx+K3vrGnb5EovHdGNCe9BQD5LJ4o0wxDydjYx5mcfi3wuDapMt0Dk66gSM7DShpNkoTP0Ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dt+2do/4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5797c8612b4so2691169e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488905; x=1760093705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
        b=Dt+2do/46SGcsGlqutC2Q/beezSoVs9eXPKN5p4FKJxnCrCkMHXrFEv1Pa0koWb1E0
         E3ylkTaRcOxyh6BZxHlh+rP9wzmHFm1G7KxB2fVhYuaG6x589AbsxP6vxrSvRrS5vR3x
         oh+kBAzL3k6rz1y8rRZi7VMcbKuVRc1z+QRe+tJJLeZqIC9jEIj7LCWdNXNjAjOzm/XE
         B48aP0YzfnBskXW5Xy5JNslpK4lkwWyMtGGcWHydOubqHA2wHw/iGjFPnS7pZMs01azt
         Y3V8rr5hGGRgUITB7xI4DWDkwDg/eR1PARpPsg1VkjP+gdv+dyCsyGIPFtgoclSivWzQ
         pDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488905; x=1760093705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
        b=RpRKkJA4xSJ8/qfSYSfddGsNSbmnsUossoJg2ksX0gsG4EcSh+D1MdvErU6bVS0jQ8
         URsLjdm3o+9B9FxcYb6jGyGqizmtPom7ynK4BOC8BXKvY6e1HXNUx5LHiYy88D03Dr3i
         duBGjigIWawZgRR0TGz1qrrW3szIE1hQTeZs16cQY6i+ZteoXp0Y09Caj0B8+ebNNjpF
         ce81lquzMbR1Xg9P/nhczuGpsKB8R5wLXoxy616H/Pg56MbDFdJbecfJyo4F2L9ihyl6
         B/fxX3ENjRAOJS5gp0GyQIkIhZwom+6c6lDkI+7R9TshII8dh+6gcxtrNzyBu797U7Q8
         V3cA==
X-Forwarded-Encrypted: i=1; AJvYcCW1/KaLiqKz2dmoA8DNOcAyGgua2v8D5zfI1lO3SLqPMUa1kfNsr8C+M/ShTmTtj4eVQCbULu1khVCvp1tj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzij7cNih3lUEghsGYxrluRL0bXzlGwIn7YwDytNsteZtcHWCLW
	xkFyIL3dCvXiWR2b2Wt0BHtWovzsn8yAWAfL16c2IFrbv9iyaUBijwz3M/dDSIEzhDvcBC3u4MD
	rAxNnMPcDvOXwnqXM4LqZ6IHGgqZBIkTfGIcL8YYW1A==
X-Gm-Gg: ASbGncs7WiuBH+moT2C6oOEequil+oDCEDgO4lcRjSkIiP1Paxwv/1Yk99hoKat7y4f
	tYi/BL7OM6Rp2IfP7X5sk52M++cARTcCQm7aI4VoV9Ht/Bj/NF9xVDwlR4lTcytkU0Vea5fk3J2
	Keb95eWKaBtXpGfYMLXbcK93+4uVuWwm9XDXXuvh/aKxv/53D+bkpHHhBoZyn5OBsvVPYTUVVkR
	5IwVN2q9BWR+RSJyT4n4Uww9LnBK0YW1sTrW3UJ50FfmXNVO4r1klnmDXUguw==
X-Google-Smtp-Source: AGHT+IGo1Glv8ZcBFFkRNiPBtLkYhJhSKCGq1mD+OwgNLadjXj8hOaQai5wx3gNPSSCbTSSPaFVxfKegSNtXTCiWc44=
X-Received: by 2002:a05:6512:b96:b0:57d:8870:e96a with SMTP id
 2adb3069b0e04-58cbc2a5121mr956262e87.43.1759488904866; Fri, 03 Oct 2025
 03:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com> <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:54:52 +0200
X-Gm-Features: AS18NWD5PiAgE6Z0yAwhzxIEi8uvGvV7o02AtdVmxa4WxKd4BMM2EBFXwJajs9U
Message-ID: <CAMRc=MdaT-ZSep-VYBUvS29XPje2FF4EvCfuUrXUUE1+8bGTaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: add the tlmm driver for Kaanapali platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 1:18=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> Add support for Kaanapali TLMM configuration and control via the pinctrl
> framework.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

