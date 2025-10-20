Return-Path: <linux-arm-msm+bounces-78026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED6BF1E02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32BEF3AFD54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C061C215F7D;
	Mon, 20 Oct 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2AqTT8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985F1F461A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970945; cv=none; b=NJTNLDgqBoo73Hx4liHHp9/h3R3HPPISO0CF1Jb4kcwO2VvcHk9FFDbZltFLbj8AkgZoaGEZbiXs44XEddBVJKdVBKZ5PCGJxzTQT8jCRfjA/hWObCtkjQAkfMzUCTnWJRlThR8wtPf8QdZDlF6lNz5m8WwQKCtE2Er0ggHgCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970945; c=relaxed/simple;
	bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=twNM0BBcT4DrSDGxieHuSeciuDwBBglaTFrltdyBEBFUKejGlR6AjGCt3uTrcBDs91el0iexdOsCj71N1k3hGU58380UB4p+6g/+9r93tJbP2nMRCAb+nu+gc9+GHTtYF6X65fLLBeLdjI0jcl5mnAhCkx04LrWUpdCj3M/dlLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2AqTT8B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so15729735e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760970941; x=1761575741; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
        b=d2AqTT8BxzPj06lnKw6PwUJzRS+mwWO7kv/T733MPM/8/v2UJ7JIJ7YOMFEsWsNerH
         4OgL6OPIHWQH3nKHWloRaGOcD505CyRF8IAgWjMiYW7hUxp1OXL6XDDXiKGh6tlW51pG
         kBq0osh+V0mvARgbBlgRFkA9rvenk/VWPQaj4FF1nmVGtW+TAGTAcdcExxc8DHNglECM
         ++sW6a/gCUqj+be+dGO2FngG0CXfTBbupgp5vL4AfzcciOqP+k5DZbB3copDn4pigIQ+
         b2aOF8iZK+V/NXkm59eAx+BdFW4ZaHCJyXYaHZU8CIzkyVb6QjYklfvfUdHOqV7kko4j
         9+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970941; x=1761575741;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnYcHCuWZPeDg0BhtNTyWjiqcR00ZxV8ZoizojL33d4=;
        b=nCJ51F3lHd/2p1b+14CZw7ldKN2QyfvhxSUirgdl5wNwVl10Ahxs/+ukWd7BChqjwZ
         Oyca2H8f30qY6AJ4d0xmIRoeiSkVLkUaA/ors5jewXlG+ciBf/SqcrSoSMcduLhmQVJT
         wDzn6QyoytoHo+WpJP3f78Rw/KHDkU8hVW8wtujW8na6xt1xWpwPVrETYFy6XV0p9Q7f
         djxiW76VYl0xjI5KraqMKJjLMo4wrIcVGLxcgPDSga+6GCdoJOBhf3OSs516e0zEAesY
         oNjvhlamLA6TMQVvG3KhgiH1XgnB/HtJgMbBTu9cQ0vf/Abn6G6uxXX6RcC6OBh2LB1H
         CUNw==
X-Forwarded-Encrypted: i=1; AJvYcCXNkRq2s4yBUiZIZxbFfR49qxOqdDHwL3VB/NApkq8/LQOoeBbzNbggI44mc8mZV0/B1gVEFtcT3CdpkLwk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5h9rGmxJF5IcNvsParTkTQA0M5ug7nc5wYIrgZdi/cQyQw3iO
	+WiJVqaC/tvlBb3fEp5s+pgrLE6/VkcZZKY0f0Cg5J3etzeYypdRLjNtYPmyQ+QPIZQ=
X-Gm-Gg: ASbGnctAAq+/1BghsOyCoGiZHTLsQLY+1ZwtvDCNaYW5F+NmD8d0WtMsd7pUCA7PGE6
	25dwlYBJkfNRqvf8xL76sHUg0UA0T2rupRgwHZn3ALkTnEuBf1jsV7vgN0IM8Mqt7oO4XHb9sla
	4Ai1wPYIcv48tlPv75rnRy0EVSnO0qO6/tnFDNg3ZkrMLG2yk9g+lHS9eHbddkU+36HoLhV3erZ
	TljlFSUAZYjDdSdDFmOj7Ksg3K6t8fi/9GlAh84N2l0XGNQMIebzhnfY1DjRuhknmQmBrsv6MhZ
	yKoZoAdD72v3hmsTWW54vblm4Zf/zSRddmYEGe72z5uEZFOLLSFffSIGdw78XCRZvty6GSyQtjJ
	ujReVrxMdHbkH09O+p0r3H5BT2QjAvb0niAQjwSYMVApwmeMAyrWQHjBuA5fapfn95hw/eelbPE
	7HuhjqD/F0EWtZuw==
X-Google-Smtp-Source: AGHT+IHstFjqQkjl+l0ywmYAHSUcGq43w07vFirmXX5YtQRkOxuXbbdfyJ4BicC1pVjbmBltYMMqIA==
X-Received: by 2002:a05:600c:828d:b0:471:11a3:a289 with SMTP id 5b1f17b1804b1-4711791c5f5mr91081905e9.27.1760970940912;
        Mon, 20 Oct 2025 07:35:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed4b47fsm116778775e9.4.2025.10.20.07.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 15:35:39 +0100
Message-Id: <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after
 closing
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> For record path, multiple read requests are queued to dsp in advance.
> However when data stream is closed, the pending read requests are rejecte=
d
> by the dsp and a response is sent to the driver, this case is not handled
> in the driver resulting in errors like below
>
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10d=
ac] not expecting rsp
>
> This is same for both write and eos.
>
> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
> ASM_DATA_CMD_WRITE_V2 as expected response.
>
> Reported-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I was also reporting this error months ago.
Thanks for fixing this.

FWIW there is also DSP timeout error on Audioreach-based platforms.

Thanks,
Alexey Klimov

