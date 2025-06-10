Return-Path: <linux-arm-msm+bounces-60719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABDAD302F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6850F188CEA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D3B281512;
	Tue, 10 Jun 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIIe+Y89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54325F797
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543835; cv=none; b=jxpUo/56YAtw1sqQ8LFG3g2xqd3YB6kW45Mvy3poCqkB1de8DVeOgMPAt6wNqxNHydRKVBPgnhZ/Z9kimD3cGmnU9MKQFddhE6soH+4yYSuyckocM096r5ZoV+w/ihQJxPKo3l65e06ojqjSEFZkusN6rLxtsdkwUvPMEkmdXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543835; c=relaxed/simple;
	bh=b1jhOiJyqA4zYoY+BOwKTSPFo8x95oByiHS9hReu/7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ip5IjyBtY4YFGVxJfowxgQ68YY0pcY/qzhHGUg6Vn3DW/ce5x4MW42LwvlRiLtTcqRxrx6JerlcQgGimjTDKdEw5d0QZm7XLfL3qc0gJdGbRoFk9G0FhBG/UVO//xAnqSxOICpOyh8veKjAjbWmdAGsY28pqXQBub0NwIasKQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIIe+Y89; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso455456f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543832; x=1750148632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9m4OUSXgJ1j1ai/CSmPLyPDP6fV179jfH+S2E7Ly5A=;
        b=iIIe+Y89drRx66mohk+G4z+IQhYZ+doZOh+/LWI7c6dDqZ7TwIBG87ObESxtyN1cpD
         8dzmFhL1kD6Rsv8Mjgm4vckMfj2Ln+Z8UBTg0ZBGwaheqHoDVJyCl7YM5cj0oLuo3C2e
         GaCu64xnhU0tJWs5YYGdZQM9948FWDCik8u3Fn0LTNh+L+/cVwkljIqFv2ifxZbsluSk
         3J+Ro1jOdu/0TDMGgV2BL33lCfkqE/V5wSGj6YCx4F08lILqXRjOjSK6AuFpJyI2DzFG
         4v0Cl7uMlhDYCly3ChZdqPUxQgIiUckgp7JiItO8Y3styvftVhuHJim+GY0pgsuDo5Ri
         mgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543832; x=1750148632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9m4OUSXgJ1j1ai/CSmPLyPDP6fV179jfH+S2E7Ly5A=;
        b=aNynUD4aWfs5RWRbqK3d8znfCaPvGrIYHhPqd0V/68+6BFtaAy/qmSkti4l6wRGRXQ
         erDKwMc5iny8PaBm9BBnRKFUqGe9kCx84fo87pxND6E1lL40J33fo9oPKne0s3bFWep9
         JaA9GSSE+ZYrNKEGa9eRmCJvKVqoVTXMl+8ZMHpL3ixIjaxIRo1GUaviMvqylcLZMHIV
         gRXMJsVPAEDPusVCvrXjp8TdpSrKSlI1ZrVI2+ieMe71iQjTbPEPIQWnCfIbrBFnFKwW
         ab6++Cw4DDkMMwUYHK8h2AlxXy0RPovVyPod/PC0U9LJSTq41fw3T6pXcedHS9Hxs8uC
         aIwQ==
X-Gm-Message-State: AOJu0Yx7Q0XKoap56g3Yk6w4tsF6dO6081YJovtRfbXerSMNR1uHFb4u
	dO03/PnvaISLXLsoUs3oAFrbemlwyMTKVL6H1fdPDx0Eg8i4I5dVNO1gb/wXgjAX4oyuUy7DAkP
	uO/4Hd8c=
X-Gm-Gg: ASbGnctv90eCK0aiBKeQ7Fs1wnDngDbOXw3QyVJgkIDpN3rr1XuMzw+26yksZ9iHXXr
	qEtu312pJ2SPP9uIVnN228TIbRXgVKvtzPz1CAkK4wvFEVZ0eNiFPX2UPeja9hWxq03gF30pSSU
	Nz9PWku7xvsFISg5zyhMcp+Hn4A4Db4YCD5dD1xkBuODhkUbfHVZbtJ102w/kCaTJphG5kBK8KG
	SGIlnnRdB2Grd2g6DUB5A7Y6mjkcF/CikLcdLJ8M8H95XQThw6Bxoc6HeiodF0/dsI7jT2BGnz6
	V5onU02LR3yoOPcAsV7Om8BjaahGjV5zJBFXPZpaFDFHABq3WK1EHaTPGPAn6z9+8gPzeNbv2kj
	E6Dk9tQ==
X-Google-Smtp-Source: AGHT+IGpZK0XvUNv9m1dJ73uM2GMwmUIp1i5vaUr5TtZWfaeMyf9vb9r9+HjN1GptA0mzLdkOh2ECg==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137359f8f.2.1749543832232;
        Tue, 10 Jun 2025 01:23:52 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Eric Biggers <ebiggers@google.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Will Deacon <will@kernel.org>, Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250523115630.459249-3-casey.connolly@linaro.org>
References: <20250523115630.459249-3-casey.connolly@linaro.org>
Subject: Re: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Message-Id: <174954383078.117835.876974227207154784.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 23 May 2025 13:55:34 +0200, Casey Connolly wrote:
> This config option was renamed, update the defconfig to match.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: update renamed PHY_SNPS_EUSB2
      https://git.kernel.org/krzk/linux/c/f17d5b90947a7b89a27913abf47cb0c7063b3430

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


