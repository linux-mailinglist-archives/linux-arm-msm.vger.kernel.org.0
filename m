Return-Path: <linux-arm-msm+bounces-42002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0CF9F0BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CFBA16499D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252FF1DEFD9;
	Fri, 13 Dec 2024 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpk3h/JR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ECA1DE3BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090867; cv=none; b=kQkooC5bp07q2XxwZ5fUDK/n6GMzkdPl5yuTth+9PTjol/rxBs7m22o2hFMZyYhN2qWr96zF2jTCCUPUbJZV8oeVmODtK9Pwfg2xtjQWjSjsP/2NYDf1baVBJBGIkBFJe8nmNJOsKElV13OQ54GWK+Ektsjn33esEQwG0da6fCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090867; c=relaxed/simple;
	bh=7OdF0EY5Q+8a9qm+6ImL1Xu/5X7exvu/NnoY6NU8IIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K281LuGNe6GcY2j4I8/eDiPaUUT4ByAVgxPiU2z0w3XDD3+18Wd4CeGmhWii0as/DNZo/ZjD+MjAZlMKSwKQB1ebySfefkyo6+FVlzlBh7IA6yPVSmAkXCHbMmGFdF8PI5CNZ0R01/aG6nLbAq6lmmGUjs9Jsx1xkOk5zqK+tnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpk3h/JR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f796586so19752105e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734090863; x=1734695663; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OdF0EY5Q+8a9qm+6ImL1Xu/5X7exvu/NnoY6NU8IIo=;
        b=hpk3h/JRnLcpSvkrdx2bcHVsUe4XoYEAOFMPBfPKRMNXylA4VFnfxbB2hNgIi6Uusl
         Wcb8GA/yZwFIelLNQqAAdQzZFiEzUgr58N2Poj7Y6V1gYnB5jaRCjZVicDHWZESVbNOP
         nk/HcP08H9Vn5nnM1QEop151AvwbbVhEMFWfjDU4QqyEGWcgroVit0yLAVlmNTBYTfdP
         eOptqSOa7l4LA5A+JN6h9lcEbSPa1ETjHD9dcv3r+5YIJ78v8EaSAF2V13Shbb5D/mTw
         kQA/EypBbKNpuNPE9aekM62eX4qbZuCe5oIvK2xFraCx7cLcTvrG9DKWgAxoCFeygChk
         8DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090863; x=1734695663;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7OdF0EY5Q+8a9qm+6ImL1Xu/5X7exvu/NnoY6NU8IIo=;
        b=UHJE4IosRbU14oL0g6wfqJEvlfY9mUXENHTAovPXDyOg3JRdf8tyZpC6xuJN+cm8jm
         dfMcYP3pB6V7Um+mwvNIsH0Tt3N7lhUWell8EXM4WGksK17YsQChK8d/zL2lv8mH+/4B
         XdpZfmQ1ZHtMFu7oWvkx/NERZTUuUTDvxWpOV0fSkJpZVPPgXxy0lyytUC7+v0nLKUIk
         dmzOM8pnOGb8ZgA7vrBHBGYlxs8uhUBVKpH3j2wjMo0kBCwrOuAkV14EJ2EJe8GkKBJn
         zivC2nM2jxmNt1t1GKf6mQ7UoBBLxtWvOsqJzfBtx+Qt4l3bTBF480Q3yPlmgqXADT6O
         lXCA==
X-Forwarded-Encrypted: i=1; AJvYcCWSS/K02jKupYwC/AONJ1SXqQm5t18oDB7LVRzo9ZV0AxgKMBEfX/Czy7+DqkcJxaMptbrUk31OiP42kuU9@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgUOjlHmFsfiQyu5MJRUBtSHc6iyZv805BcJOPEp/Ss8CC5+f
	IOn+u8XG0eE0TVQNWeRrkqjm67FCj3TtKxjG8sASAFA8vrgXv/QQOrpF4BBS+us=
X-Gm-Gg: ASbGncuhjTIKgCPQnKLCBYf3TyiluTId0YxA5vzFkST8+jNDxHVINr2fsomdB7DbiU1
	H7DrhTswb9FL+KuqjHAipjbwi16dMarG5f/UvfPWayKQcSrtJQ4IFPv4lHhobKh9kwSHz3fWKpw
	WkMtUj2oZtWd21foJAIBcOESyhRCq2dPZQJqez4KiJIOYj/OCgJ5uiJSIsAdwfenSLa4MYzQcsD
	62jJ4IASuqm0eE9rS167ZpLs8qW+YK+RUM7ThreCKmCZ/H7DzMVTeg4ths=
X-Google-Smtp-Source: AGHT+IEP7mBEOvmUCI0JCUPommiopQ1xlLMzyLAN5twn4ljSdanIR6qca1odC4tLmLtYHsoaBmE8aQ==
X-Received: by 2002:a05:600c:6749:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-4362aaa6334mr20421705e9.31.1734090862466;
        Fri, 13 Dec 2024 03:54:22 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559eaf6sm47324465e9.20.2024.12.13.03.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Dec 2024 11:54:20 +0000
Message-Id: <D6AJWNO2P6MR.1ZSDAC71W3SS2@linaro.org>
Cc: <tiwai@suse.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via
 RX_1 output for qrb4210
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, <broonie@kernel.org>,
 <konradybcio@kernel.org>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>
X-Mailer: aerc 0.18.2
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-15-alexey.klimov@linaro.org>
 <ae57068c-5d73-459d-b319-46a582ed7f3e@oss.qualcomm.com>
In-Reply-To: <ae57068c-5d73-459d-b319-46a582ed7f3e@oss.qualcomm.com>

On Thu Dec 12, 2024 at 5:22 PM GMT, Konrad Dybcio wrote:
> On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> > In case of mono configurations we need to enforce single channel
> > output. This is required for audio playback on QRB4210 RB2 board
> > since it has only one WSA8815 amplifier.
> > Implement data variant for qrb4210-rb2-sndcard with
> > sm8250_qrb4210_fixup_params() that does that.
> >=20
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> Would it not be enough to set channels->min =3D 1?

Enough for what or to do what exactly?


