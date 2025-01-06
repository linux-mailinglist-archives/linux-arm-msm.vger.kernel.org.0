Return-Path: <linux-arm-msm+bounces-44016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525CA02873
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E099118868E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA581DDA2D;
	Mon,  6 Jan 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5OBMbRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0A1DE899
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174875; cv=none; b=pq1d1TS5c+tsq8b99g2XGKCWYsESgERihkwVxPOisHTIquP7+nZNPEZqSqzV3Phs5ipy8tArFxHinER5GjbQ+2gu5f6EjFeiVPBWchUEkNg6++jyD+ARhZncYcTjh/2Ov25pCosPAIJhmGbq1Hc3FTC/AFzP69L3wCWoht8UqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174875; c=relaxed/simple;
	bh=XsIxgXbUZuTD5KK+y/0Q+Q8bZTIptCr2vEQ6/d6j1lc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IYHsN+DTXOpOyb2dKLiCxl6I1aI8JruEGUoUQGQzELO4StrCVo1xkHvzbcdPhz5I07vxj5Dc82jMDqAxhB3zCnUjSUk05swyaVc3zySe3it5oXvkSFiEWw96GbnBxCuL2a2Lm6MKVuQ/BhZRLRPCbA1BLI4KbCYnS8MSMvFkQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5OBMbRO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso104585225e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736174869; x=1736779669; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P0ntcOdwfTK1ckknnSib9L8kT5fhMX/1TeuOQQRzi8=;
        b=u5OBMbROjqM7Uvpl5dCknAIDx/3Dr/rYxaO4BOyRjwBg0pbEm6bVxj1O2F0gNNdF2K
         i9p7KpgBlGpH9xRjq/zQbhDlb8ec3AlNphT8LE+J2cEYJXmpImz+W7AbsKUb+2FYeJCa
         W59m9ydXYL+1pbBqMb90ok72C2q7eU9A9E6lizW/eS97v05lnw4nU8bOivOsCbd7aoi0
         4yGHsvkWYef1Ldbl6rNTWdF/m3NMth8rIYrLBDlVyvze95RNK1Tn3D+YNrg4wTNlUFoH
         hHhFCOi+hJ5voBbwh+19tXs0ZmdGSp2eZoy/9qymeEbjXhlJagl+g397SiYtVRpFiLje
         0Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174869; x=1736779669;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0P0ntcOdwfTK1ckknnSib9L8kT5fhMX/1TeuOQQRzi8=;
        b=aKrGwXjzTAjf93fJy3hlfV732IgpQL+bmaNsK1KwdT4xusFDUf7Rs0cqPE9Ue9wgZL
         WtL9OynId0Xfno8L8sUPhd05To9eVUjSZ3UQAgua6Nctk43Apka5ZP33J9Tluvi9UY1X
         U3G9xfuRi0VtP1rNzOjI/AMCxee9dYXwtFzUGHHuVlLDm+NU5Va6RxfnImWqV6atCAOF
         HCO8fFEmpPpRLW7T4D4wNw8uv1DbtZCtIoFrVNfgscbxwXhgLuAE/U9cGeHlCCv5hmEB
         mJLwfo9DkFsrCzo6+1q6JoRpswyoztEHmNyLc+oQF3ll13+zexM67+pUnJ1rzEY+PJOB
         92IA==
X-Forwarded-Encrypted: i=1; AJvYcCUxFhcOXy4zCFQqDZxiisYKK5md+2UNynCgy9cK3o2CoSDlp7pfpAY52dCgMlqt8hvqxhtShVwkyglaPl21@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZMZLYGVgKTzaSTnD8/VwjGAzHx4WGMutJjEz2vaxpNrXAVPR
	5mK3fjz8fEYShgrkzQK2h9lnELGzKT+dOxdFif9Hzk/5Mc3s4ihG7M/rR41cOGU=
X-Gm-Gg: ASbGncvFWcEHDl5qp06UZlRkP8V8jgGp0dlqqyE4Cg2aaTpWf0M+uBqsa0wKp+yTGtK
	TuX28vxng2f8DKwTj5emmLq+Uzu9K5kESqFfdV0qnGfAzu2ca46DjxIzCgcfnzQKF45wpzM60sG
	0dM+FnFhORpBsHcImNe7DgH8SnpsNUXaUViavCTOT0aDIxsGpQ7eN69F8YLgrNfQsLNo6yTAlMA
	Hb1CV0xTM58WYBBkCRcjpDsMomMYkr+0VH3Jfzu+jp2eT0nF3NQZeACTqAQLg==
X-Google-Smtp-Source: AGHT+IFocU5Kt7cIBiwiA3+35zB5dzuUUOuHVV1AmW3qxjkF+Uvui4xX2ynQgH/d8NYqO2a5Mr9cDw==
X-Received: by 2002:a5d:59ad:0:b0:386:4277:6cf1 with SMTP id ffacd0b85a97d-38a223fd49dmr51138545f8f.39.1736174869017;
        Mon, 06 Jan 2025 06:47:49 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8292f4sm48841898f8f.3.2025.01.06.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:47:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jan 2025 14:47:47 +0000
Message-Id: <D6V2MJHNF54L.L16IHKEY9455@linaro.org>
Subject: Re: [PATCH v5 0/4] qrb4210-rb2: add HDMI audio playback support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bjorn Andersson" <andersson@kernel.org>, <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Cc: <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <krzysztof.kozlowski@linaro.org>, <caleb.connolly@linaro.org>,
 <a39.skl@gmail.com>, <konrad.dybcio@oss.qualcomm.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
 <173527442286.1473071.12713395655975649786.b4-ty@kernel.org>
In-Reply-To: <173527442286.1473071.12713395655975649786.b4-ty@kernel.org>


Hello Bjorn,

On Fri Dec 27, 2024 at 4:40 AM GMT, Bjorn Andersson wrote:
>
> On Tue, 12 Nov 2024 02:53:02 +0000, Alexey Klimov wrote:
> > Rebased on top of today's -next and re-tested.
> >=20
> > Changes in v5:
> > -- drop MI2S clock in sm8250 patch (seems to be merged);
> > -- fix gpio-ranges in lpass_tlmm (Dmitry);
> > -- added reviewed-by tags from Konrad and Dmitry.
> >=20
> > [...]
>
> Applied, thanks!
>
> [1/4] arm64: dts: qcom: sm6115: add apr and its services
>       commit: c722e3ce278826f29a2a8500d685130dd0b6a297
> [2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
>       commit: 4541a5f11e59015d2f4b39864e421bf9e804097d
> [3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
>       commit: 6624d17a8142776e43bcd632c227ebf0bbe9d590
> [4/4] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
>       commit: 1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8

It seems you applied v5 of this patchset.
There is also v6 of this patchset that was sent here:
https://lore.kernel.org/linux-arm-msm/20241204140027.2198763-1-alexey.klimo=
v@linaro.org/

Could you please merge v6 instead?

Thanks,
Alexey


