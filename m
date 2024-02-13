Return-Path: <linux-arm-msm+bounces-10852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E8852E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2A8EB269B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 10:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F362868D;
	Tue, 13 Feb 2024 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uxh2Rp0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41928E3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821678; cv=none; b=r6kMisW/5eHTT/BhlWglHaKnAziCopGAneHmM1gYy++8VGW4LXeQHVL3gmlHTPjno5ZvQMN4znbrFsWmyMDjPxg4iz50B/PWRGbEcJHmPmgrc/0M+HuYB7vAtenON/JNdRMriHoQNkQ6nURHHrrkNJF3o38FLlisJR1YIzWf1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821678; c=relaxed/simple;
	bh=gYHrqM3G3kRoZsoYastsq+KgNzJfw/bctahA7VNbwNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAJD0vRZexTY2SEtGPqB6G9qHLouIuXOAOmf56vRzhRs3Chvfv4POEkOIW6I79DCb/o9wN3wbeYYKgSBROfwI3989rDSlj/kvqT0cBWAbHa+y17GtmRhdMTCBcMBVvHtzf+7Dxz5N8sEtOD0Mv0iMUReL6n/MnNUJMn9W9hp62k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uxh2Rp0T; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1361077276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707821675; x=1708426475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1uzd+QYrNr3GtaEVm7817MCVofpByYmPHh8dkivfTM=;
        b=Uxh2Rp0T2SPY6/aSaLGY+K3wzeoyzUmbEPLlrfQ+CoCRg0lGtdMDsJb80qNmYkHCa3
         ubf6NoOCpwgKlDYZDNJYGbJ25rvGPrQXCiXaMsnvA5TBQKhskIe4xrR6sv7MvGib7k9x
         +Jwj9KxqMZOkztIT9hV/yWWfhPtDShrR3QmQnz37s5snIg2tbsXMWNChzpsamixC8bhW
         dAbXkZwgUpH4/DtQ+2F59Qj+GIOw8+OFBHpEBaNvfnIQqzVGSsZ5M0Nrh+tZg1e1vIKY
         w7hiAUcPswKg4Sr00bdOB2A4eAEOfNWLbAn4FX8udlQl4t/3g75ctbFF4AY5tux2xSD+
         d7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707821675; x=1708426475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1uzd+QYrNr3GtaEVm7817MCVofpByYmPHh8dkivfTM=;
        b=u2LQwjlaZ4I86aX7/gnCoy922sqjZZiqfNtso5RdCVeGuOdYnDcYW5r7yohMeXJXnH
         tQtf93SRBGP/R7C783saQmtuj3P4G4hUTIRDOwctQkoH6KuQm6xhvrrgSYATc0ixetMt
         m/N9Qy2STTROc5ituP+Mv5CbwXn7NdGabAoQXNUFU7qVo9Kz0YQTkQyPkQlqgY8WWR3j
         iTWWIQ7oojOI43LJd7ZwsBWn1pE76Y/X0AkakQolHUUg6jcZM0c/vz6rCMToEbvm9ClW
         ATpVxgp54klJLTfTOSRtccz2fsK/bHpT/FwlHpxvFZ45SZJf9Feb2KB/oG9O6RW+5nP6
         JTGw==
X-Forwarded-Encrypted: i=1; AJvYcCVGEb/lP6bKGEjZu6xhdYvAceMkkhInzaDy9rkMVQR5mg8Ibo+jhp8++38OgKlsiK7vrhWckBvm0ChLi7MDv/jktRJG02gd2um8QE4TaA==
X-Gm-Message-State: AOJu0YxbtPATf0Us6n3gccQNSG+akxPkXdvFEaIHo685PTK/Yia+yQx+
	xNd7rSSwHGXNRwipdkz7GJuryhKimDGNA0j5HkOcGnTg0UX9KvkBQ0qJa1BzWxcWx2fdln9IALH
	zJGMqupsEUG9LBXAk/CF4u0pMqOlkvK7SBhx7bw==
X-Google-Smtp-Source: AGHT+IFAWLxJcI5gkouU1r1s5LPV7Trnv3iW1vw8OhO7CT8+bqdVLybIeh0ETpjhTb6NanG6KbE/5Wo7b825LL+mGTQ=
X-Received: by 2002:a25:9703:0:b0:dc2:234d:214d with SMTP id
 d3-20020a259703000000b00dc2234d214dmr7312147ybo.40.1707821675312; Tue, 13 Feb
 2024 02:54:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213104754.8195-1-quic_riteshk@quicinc.com> <20240213104754.8195-2-quic_riteshk@quicinc.com>
In-Reply-To: <20240213104754.8195-2-quic_riteshk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 12:54:24 +0200
Message-ID: <CAA8EJpq0AnPgcP_zWw2hOYKeZ7uvuf9f=Z6=af5H4BCE7TC-Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: defconfig: enable Novatek NT36672E DSI
 Panel driver
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 12:48, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
> Build the Novatek NT36672E DSI Panel driver as module
> because it is used on Qualcomm qcm6490 idp board.
>
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> ---
> v2: Fixed review comment from Dmitry
>       - updated commit text.
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)


-- 
With best wishes
Dmitry

