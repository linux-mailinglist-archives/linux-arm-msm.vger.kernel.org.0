Return-Path: <linux-arm-msm+bounces-69085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4ABB2580F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EE9F2A6F48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2FBA55;
	Thu, 14 Aug 2025 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDBjSgkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280915A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130221; cv=none; b=kjL5TPX0tjY488h4aQsjX+Sd+FPV1J0LoXr1ofQEiltLzvvqz9TfNiLnVzME7Mv0gY3qgOvUfQiOXMgopqTSxc2HIqntrULhm/ffgv7xoAIcz0CyGOPSsw5RemRSzGozlDkq3NqG5yq2ahLf4xkTwGZ+GvN+ovPhcUNPWfBn77U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130221; c=relaxed/simple;
	bh=r1QCrmN8tVo4aJpeIo0LUvhjUnUqAZ5cDFytjwJaPAk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qdy106dCPLY9nuvfynDV9//tajUHr4vFk22OOaV//x9NgXvhdsWCZWmPKZ7hB01WFFXiKorBxDhkgQkfY81ftgi1sv5U1I4n7+3TV2aj/imMNIr0wVPw1TYeKpNmTk3nl5TAsf39x1mRgg3sEL+x7MN1ER+nHn9SmIdPZ1Y7vyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDBjSgkH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so10142585e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755130218; x=1755735018; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpKIMCug5prSO8UBINdYvWrP0TkGisSi9mxT6awdEX8=;
        b=gDBjSgkHkE1DcZ8ecoJHcRpsd84Odlscj+9dOKuA26g4J2691NnFt+59dIajYA0rkJ
         uDN2O+Mvm6uS9DXHJv3Ft8pDKkv5DC/JbtNVENuU+mmpwCh2RS26vdIWBi8f/3qJTPb6
         zE/2ycRw6wBtLEKaMCXgrpYkHpVEXgAU/eH+WuJAr8xOIQ4x/rbM1dbJmG0AJ6PWMKKF
         sehdD5KELkext8T+V0+kOh62Zkl873v1zqojpKFKjkenBb/dh+QfB2vnHkGEPI0mymfs
         AiEYhDSvPaE8G5CD1kBlui6YUsXIPvBTqzqtA8wW5A33cp/IsUKqARWHfRDIyjyg/fGx
         /WXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755130218; x=1755735018;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpKIMCug5prSO8UBINdYvWrP0TkGisSi9mxT6awdEX8=;
        b=A6ndaRySbxi/MRjW1I5nHQAwPZR8mIEAokjKAm63GuTbFN9o/fW6hImhhnRrtIKwe7
         +JbeLISAAATT/RkWdcWD8/p1Z1uWKu2C/EeputQWPd7GxHxIUWnsYmj5SiO3RTScrmVp
         4aEtXBPs8Ux1euVaSJGiEDSckEwCgfmUDlaAZByiEDpIeKKvd6fSjDw076jYf3UPqlQh
         5+8m1WSiHuaGG5WXEPEWfhKKur1oHrXg1aJKDemBlJprVHn07+8dqkyBtkqn85GlLFbq
         d0cgTEzMI6XIOe4QU44Zop36U7UfgS+g+hvGZZn/wxaz8Ke658rUlr94fNs346dlgrX4
         tPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNRKaAjdVpM7nqabVz7u/3MGBHyxXPrgVZVFLNhCdu+yGOjOArINnVPySUbHvkfySyFVGm/UeKmrH8zzOv@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAwXDTOrH/RyD1vZMy0+qUi16UT2IVL3sDJLFWybqQoiu+Yti
	0z50F2ebyLesdiqtUn7+M+uuKfMdlhXXZwgco0Wxdi9UXjnXw6krNwRHEWxlgbCvlHw=
X-Gm-Gg: ASbGncvH1hIhBKLwVfzcLwjCsE0w1VTL/DBtA5Pub2LMLvRpocpNNf7YAZ2h/K3wBPq
	q2gUVidIhFWycprzf/XZ7bqDHd+myYyiKmMzCRDYfs+rns0vaZNSP6Hn/9uEcrKW06vup5LYtWR
	IAZ0G6KZQM9T/W2E2p/jMVJGRp2dJVMNXbpiYQy8lGMQC7fkLq3qYVFPVxDXvqJNmAR3Ql24b7C
	+EFsAq5KJH9NwhGgWl9LQaNEJxxxedRQqN9M1OvdeA4jvgZv4kFVXH1wKB/zP8DEQdfXy3laQO1
	hUvHmmzerry1yz59ykHMX/wQSI8YGYyL83zeLmbtSwDdqWOucYoUQeSvTzT61CQoxbYs9bgJyDI
	2hj2dkIYAm17ZPHzQKnn5wSOhVvs=
X-Google-Smtp-Source: AGHT+IEL5c2Xg+0dBRlOrtdb9SKnnns8CAIkWnJ+rAhdQ3/ikKH0DsK1f2QeK/B8eUDvA0MAmimMfA==
X-Received: by 2002:a05:6000:200f:b0:3b7:908e:e4ac with SMTP id ffacd0b85a97d-3ba50662180mr342068f8f.2.1755130218457;
        Wed, 13 Aug 2025 17:10:18 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac093sm51686067f8f.9.2025.08.13.17.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 17:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 01:10:16 +0100
Message-Id: <DC1PQIF1FR6Y.JO8TBH3K6TS1@linaro.org>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: x1: Disable audio codecs by
 default
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>, "Johan Hovold" <johan@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>
In-Reply-To: <20250813-x1e80100-disable-audio-codecs-v1-0-af82d9576f80@linaro.org>

On Wed Aug 13, 2025 at 4:58 PM BST, Stephan Gerhold wrote:
> Currently, the macro audio codecs are enabled by default in x1e80100.dtsi=
.
> However, they do not probe without the ADSP remoteproc, which is disabled
> by default. Also, not all boards make use of all the audio codecs, e.g.
> there are several boards with just two speakers. In this case, the
> &lpass_wsa2macro is not used.
>
> Disable the audio codecs by default in x1e80100.dtsi and enable only the
> used macros for each device.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (9):
>       arm64: dts: qcom: x1-asus-zenbook-a14: Explicitly enable used audio=
 codecs
>       arm64: dts: qcom: x1-crd: Explicitly enable used audio codecs
>       arm64: dts: qcom: x1e001de-devkit: Explicitly enable used audio cod=
ecs
>       arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Explicitly enable =
used audio codecs
>       arm64: dts: qcom: x1e80100-hp-omnibook-x14: Explicitly enable used =
audio codecs
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Explicitly enable us=
ed audio codecs
>       arm64: dts: qcom: x1e80100-microsoft-romulus: Explicitly enable use=
d audio codecs
>       arm64: dts: qcom: x1e80100-qcp: Explicitly enable used audio codecs

The subject or title is a bit confusing. "Disable audio codecs" and bunch
of enable commits.
Maybe "Move audio codecs enablement out of .dtsi into whatever"?

>       arm64: dts: qcom: x1e80100: Disable audio codecs by default

Best regards,
Alexey

