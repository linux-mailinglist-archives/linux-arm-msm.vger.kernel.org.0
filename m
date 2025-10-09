Return-Path: <linux-arm-msm+bounces-76633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01BBC8C2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 13:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90A0D4F9607
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 11:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECFE2DF71B;
	Thu,  9 Oct 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3MIRV9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838732C2340
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008902; cv=none; b=dvU7MWDte5Qc+e2AG91JQAVwm83CNRmEDOAR997rj/ub2RYmv083YEWWBGkW/B5X+Tb4wh/auZRCfMTYg8QF+W6cDbSs82qCVx9EwvqeiVzOm0NXGxAmu3Rztt9sdzCmmUdkbM12MhLmXVEN2f/EWgnrNHD8F61H408am43k+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008902; c=relaxed/simple;
	bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uHXCrYbVCm5sJ7adNp6forBVQsGkoPoo6nho6K0TmEir8amKGOYLrYdrr0zMMP8zXzJPXnbw/mYANzh3jrqQO12U+JsBwHuHMTcNYJzZVyzwm39LFC+xJFRjWE8uO9a87WDNjiGCljLqBkWKmt55IZFPkzSOkKNqtshxI1/NTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3MIRV9b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso520230f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760008899; x=1760613699; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
        b=m3MIRV9b1XS61m+5IN+IwLqYRot/WxOMPX/pLjsCv8pEDdgKmbpg3e3qRS4S2z7Vup
         PKrcV6CymqWAM6GSIaXRxOOe23X7YuUh3wae8EzEsO/U06z1ehli74U8TUS33Pu6u7oL
         iC2qhVjg9zkMRMtYDp3SueySjadkMGF4+k89xmigDm3mXBkGLJVhwRDtUJNuNc0pKul2
         6EbCE9WRy7ieKb0HCvyW0EWlIK7pOOw47pUT7dm1PBSoM2f4CZgFJqwXfHJYyFcZHi0U
         J9OPt1mIToH1XILlU7ZFRAJO/U5WrMI1ohhkQdb79FwPhcGKoIjmVy6p9Rg32Yw+Ptyg
         Fn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008899; x=1760613699;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sSh5spmOZHPAgftosq8zlVm3OoCuBCxRRQ44DRZGjc=;
        b=DhlTzFFWM9PrauuxZDqnquTnmhEwumdCjb0cGV+mxi9rnhIv7vpUjpChfUSOfvbJZx
         zu05//6NekjpMFSLDgz3OaLStGZXkHHK82QirvWoIJz1+1jLywhW620kZQjQYVLVDqYW
         5in9tYEGfSeuRxBzthtGlsFiGcBhMwyw1vM6Ny3HNEIdy6Y0WkpApMCNYeqYj+022N6y
         69mz4AoLMVnMdGduoDUiUzJPiEhFY6d581BNGFlVvyeAVg815vX9hV5Gyx2FIHScKDs2
         JVVGiDGgz3x3ZAak6XyCjestD6ph/jeqWgvXXeq2XU72+fdedduuZpGoZv5aKtJ+j+88
         G2+g==
X-Forwarded-Encrypted: i=1; AJvYcCVVzqvibSUz8WC4S4JrCzk8XVrOSi8t3mq9gvtHwXH3cuh8TR9ggvG2pVsRDPlwy8ZqplTMwl5esMpBEyXh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5M50sBIffmlflmeFXOGdw6iFL8AJAgmplTV8pzGg406wQyHf
	8TJTF2O75nG+1g1Dk+q0DF7T1azqToI44Ngu/0NqKkfbl4T/l0KvKIeLcGVSqqj1bTM=
X-Gm-Gg: ASbGnctXUdXY8Jn+Q5D9v1Vym4JpUAdZDBWZFgQ6syUgAG8MRXgEqKLbbpe4J9X2DPh
	+/cPQ0b9HxYQGA0Nw6Kj/YNiTYwInXxOVby0VhD77kOaU0OAwtGOerAb+klqwg9VxzjBpcwLkVD
	iD+BWj7Qx5B7zeQ6qR2WX6eaKqgJdsU8A4nxnavXhg2i3fKNORjKGHC2OG3OqDxmzY7KhW5glb0
	s3yfCKOFRXe35KlI8NIRwU69aLDC+AAJgTJ6XYJRnaXJfgPHLzR0Sy85rm1lR8obece06SgIu+u
	QqsjxbgEWsPffx8zwzl0lPIF9eEDdYv8+f2du8Xi+NE58JL8ZMKgyR1OhqhVsm2Ijm+kNh8xnzP
	5TqTTBSU+Au9SN1gwFGxvEU1e8YwtO3OmluXJk9l1ezbqRZJoJ3pajmRQnogLfYYS
X-Google-Smtp-Source: AGHT+IFflhQlmkSN/2tNWXDC3THAhllPJpTf3aMPCOXB2rnMSjN2hhW4xvzZzF5ZeV/gFPVv90cBLg==
X-Received: by 2002:a05:6000:607:b0:425:72a0:a981 with SMTP id ffacd0b85a97d-42666abb02bmr4351249f8f.2.1760008898811;
        Thu, 09 Oct 2025 04:21:38 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:5333:92bd:dab:a2ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97fbsm33992893f8f.34.2025.10.09.04.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 04:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:21:37 +0100
Message-Id: <DDDR31N2P498.3FYKHZRLUS54G@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC v2 3/6] ASoC: soc: qcom: sc8280xp: add support for
 I2S clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org> <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-3-6b7d38d4ad5e@linaro.org>

On Wed Oct 8, 2025 at 7:56 PM BST, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
>
> The rate can be easily calculated since the card forces 48Hz,
> 2 channels at 16bit slot size.

48 kHz?

48 Hz rate will result in too narrow analog range to reconstruct anything
apart from beeps probably.

Best regards,
Alexey

