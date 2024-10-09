Return-Path: <linux-arm-msm+bounces-33656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1C996440
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8D8F1F21FB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3A218E77B;
	Wed,  9 Oct 2024 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaNJx1uK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6562D188906;
	Wed,  9 Oct 2024 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728464138; cv=none; b=qfuKr782i5hniNBAXsU8apwM3dotDJfW3FSlHf40Ntq4Hj0terd9vfv0ORRCsNczs7oaPn1ZIlr2839Pgf7aoyI1Md1okJQlaFah8kb68eMOxKv7TddEztwgKTgJc8biWYQFng/55OG5ihjh0rYwkSzNnaed0f3mMbv52hiW4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728464138; c=relaxed/simple;
	bh=0/gRJ6jJLc44WvH9OzkedYWrnCiZWnF//bS/JRemQQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2+IZtqCuI9xdJBwueNjfBICZ/JleSb6mEaFiGrnAYqtQkQuG8dsrf9t9wOrZLJFbpxEnE7JZg7b5/q2RDaSnBxxDUAPFagKAzcI3XLNth4DALigtRooy2ns50qFlZvbKFpcKzDvh9P4Hu/AfNFy+Dp8DshqKvuNBejC8aXy5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaNJx1uK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d3297b7deso1034299f8f.2;
        Wed, 09 Oct 2024 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728464135; x=1729068935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WphfgnPDMnwX7oaOi9JXFd7MQA5RROOBlEbuSKn1EsM=;
        b=XaNJx1uK1ndD5M4sLUydAwhXaAcFZPm/xhCzenkGeVahpXwM3pREyBfYC/jzM/9NoY
         dYIzyoltaVd6ZceBkeubapA6lyoInFzoAyW8VYYcdgQgzr4UV++1rK5t8lCQDlxOEtbu
         EjbK9qyaOpzP5a3VgBU3IuX/OjF+y+f0k0pDTaVGUe6GoSqVaYy2uVDqI8S2MX0YB9ff
         EziTYfkKOY0nUuM0dN5sX66A3XHN2NMNI09OPbjWNohl2ReaHMYkH3w+F0As2Beyuo3Q
         p8dkWeMPT9yfLpugPbIrqQsGRLJ2UDigtKNIe9O72quw2sjm3T37BA3NTUicx4BlQzOX
         60HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728464135; x=1729068935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WphfgnPDMnwX7oaOi9JXFd7MQA5RROOBlEbuSKn1EsM=;
        b=P6g+AOIF6ZfT+IiLjg7Kc3pPld6V499kY0VymPtxTobOJjWXxIF1qtT44XFlno2RUB
         tbYhO7shG/pursefI5711KAVpAfY66D1F6gJA5VBAmuxIAuCYWf0GObNipdPpfeIafHF
         fXGVmMXm+FPc0ZW94kamveta2X7waxPNxFOnE5J/dQZoKn6RYS6fCGBoJxHBe++CrWSq
         kQTQjDBhac7tY9AbH/KWJA7QRrxaXrG5NH/BQbpa3nE+V5f6rovbs1+FGifV/6A8/4qa
         oS3lbxFtRG8QmwB9wFwCxt+dqYkxK5B66JUpOdcze7Sbr5JaI9RrxsMTw8gfgMgNPwew
         X0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcuf2LcvzNPIxf1Aco7psfK4zNnKDd9tmfiiiwskG4/+00T26pj+bvHVedzkajLpO5wZHp+LdPIEgwgGde@vger.kernel.org, AJvYcCUhYRgsGnIU9HfuZ59IZ4j0E2+L9H7x54fK2e8Gi4eufpc0vhMVd5fJaBrpaEiGx4ERtu2nbXzC89merDVSow==@vger.kernel.org, AJvYcCWobt9cMD1SwdHo519MB/7vsmIRz9mFT/ThA0v7C7vBG8kg8c5xMw2z5AwI/8ZexLewjxMPQKIcmO+R@vger.kernel.org
X-Gm-Message-State: AOJu0YzgdwcfuaJdsHuw/4E81StOdFdNjq7fu21KFZXB5z/GGBWWNUfx
	3ng3OMbxrkU77MPKZxENrVd3iWtbxCD8mC0/dMBuqZPUOrDX5YAFoJqzKkb8/o0PGL5XT9KcEL6
	10m0lcB8rwCxrGLKxoOgzIk3oi/32NNH42A==
X-Google-Smtp-Source: AGHT+IEYzo3MA+dPvZPaY28/YTKYN9AcjwVylaHdAX/BSMOtf/4gGk6+GSIZBx+dytsDaLNLylwYYR1donBA56ZZJf0=
X-Received: by 2002:a05:6000:247:b0:374:c16d:6282 with SMTP id
 ffacd0b85a97d-37d3aac1cfemr876070f8f.55.1728464134254; Wed, 09 Oct 2024
 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
 <20241003211139.9296-4-alex.vinarskis@gmail.com> <CAEvtbuv1OUekj5=fzafJKby6jBiZ6BzgT4TrrihDNdiQQM_vQQ@mail.gmail.com>
In-Reply-To: <CAEvtbuv1OUekj5=fzafJKby6jBiZ6BzgT4TrrihDNdiQQM_vQQ@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 9 Oct 2024 10:55:22 +0200
Message-ID: <CAMcHhXoRgBS5q=70=nj72_dH3R2eHf3bPt=ZxjsUQEV5FZxvsQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, robdclark@gmail.com, 
	peterdekraker@umito.nl, Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 23:09, Stefan Schmidt <stefan.schmidt@linaro.org> wrote:
>
> Hello Aleksandrs,
>
> [Again in plain text]
>
> On Thu, 3 Oct 2024 at 23:13, Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > Initial support for Dell XPS 9345 13" 2024 (Codenamed 'Tributo') based
> > on X1E80100.
> >
> > Working:
> > * Touchpad
> > * Keyboard (only post suspend&resume, i2c-hid patch required [1])
> > * Touchscreen
> > * eDP (low-res IPS, OLED) with brightness control
> > * NVME
> > * USB Type-C ports in USB2/USB3 (one orientation)
> > * WiFi
> > * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> > * Lid switch
> > * Sleep/suspend, nothing visibly broken on resume
> >
> > Not working:
> > * Speakers (WIP, pin guessing, x4 WSA8845)
> > * Microphones (WIP, pin guessing, dual array)
> > * Fingerprint Reader (WIP, USB MP with ptn3222)
> > * USB as DP/USB3 (WIP, PS8830 based)
> > * Camera (Likely OV01A10)
> > * EC over i2c
> >
> > Should be working, but cannot be tested due to lack of hw:
> > * higher res IPS panel
> >
> > [1] https://lore.kernel.org/all/20240925100303.9112-1-alex.vinarskis@gmail.com/
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 863 ++++++++++++++++++
> >  2 files changed, 864 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
>
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>

Hi,

Thanks for taking your time to test this.
For the record, which variant did you test it on (low res
IPS/OLED/high res IPS)?

Regards,
Alex

>
> regards
> Stefan Schmidt

