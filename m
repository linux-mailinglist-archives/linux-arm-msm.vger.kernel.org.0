Return-Path: <linux-arm-msm+bounces-20734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5588D1A1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851A7B280D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367A816D320;
	Tue, 28 May 2024 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHv+6h+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF416D31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896749; cv=none; b=Ng6p0YTOvbjo7mxWL5IkLqERYTPqNVx/f54O6As00+gVoxdwzZPMdK3ztWg8T9MSQCb/owCgnuAaRgLrn8XZeMLr96yTer1M5vlkMiUem84mkLQbqPW0ckKvAv8pk8AX2hnmHgxD9c2NCrk1/l3n6Xj7yX2IX6uG4S56FEpCfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896749; c=relaxed/simple;
	bh=Cyn0ZlNcviHjkEXTH9iWy+1yurJIkOQsTzZX3IFxF8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FQjzv9bEOAEIpteiiHHqbxaYbue+TuT1ZjdjlUZY8OfQb7TsRXtd8gPSSzd8nI0b2Fkskzn9fVrblqhUl1+KFLTFmgGfDtddkcgLj7rudeZch4yIbTSZZ9hTiwmLGmQw1+FRGIpxEJPEToWFfxr8r8OnCv+q3AuWfGXB5YaIArw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHv+6h+0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a630ff4ac84so82367066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716896744; x=1717501544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs1QUfWnNTWVVMoflcEKhCp+Y3rJQ2FjHWIov/l5yc8=;
        b=EHv+6h+0YQYO4PMI8m4utqV4k7fZHkFk1akdCzqCpVXvBVzrzMbcIU020BIYP7zzl+
         XNnK7Rmh0+RojhhIfv6oJFcMKuiY/7xOof8I2XTS4xYupfVVMFxbWuwNPQ0npRWOkllF
         PQyz7q5aa1coM7Z0fziGvA7J8xNRwdHVZgGHMLEI/R3Td/1CQo8KLEqGMaKnn8X+TldN
         p/58LPvxf4AP5xlVeRBslmJb/dtds7MXG9XuAWH4oceSjGxWp5qclU094VM5/eBCRaD2
         mZWvFxY4iDztRCUuCN9dJvW/zkkz7whBKsunP2XXQNApyfTvMrXDQwC/Hw1oCBZlsT1F
         9lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716896744; x=1717501544;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs1QUfWnNTWVVMoflcEKhCp+Y3rJQ2FjHWIov/l5yc8=;
        b=ITTL2ivvm9FDDxSA5/eXnCtsD8mYZFBeKbBm0pKnksRFPVRalzdUuOdJEcIvTBZk+s
         5yfqMUUCgISE9VcFnJN1g3ga4eKRyXz+twQkA9OTUnIDzu4i2BBKykjU2ridHshEzYTG
         f07J61pQZyBSTdaXxvDGmX26zAMjl8Au7gFEcpyPEfpV6wEBR1Yj6E04C6OF1CASa1qV
         DHeV8YzXHc7wVmBzJM5KmHzfgpFV8wZjgrq8d8ZqPDFgt/lvZjqQ4vZoEnKrJvWCJLwO
         GHVEb4Z/1gUO23MRyeCG01B46TUC73fPWWOFNwjcyLvB/bHm1tXVwmubpPQ7w0sQbunf
         MMaA==
X-Forwarded-Encrypted: i=1; AJvYcCXQMBBFTdEGB/d9OMBJncDVlybcckPjIFKpAjysL42ABTBvRR6mUcXSNhVDWpEb3x5X/Mu6NZvxUfgu0up1UBfNa2lXJuFyvQVwgBTaIg==
X-Gm-Message-State: AOJu0YzCOf+wMTcra+uS7O7FDpuQNbDxydzcwethVFd1LFi17iaq4YUV
	L/vFoR5VANSlk2lSC5WHmDKFyuOPgCuCvbGgHvzaEKZvvuC9kQZyDmIf6IYtB6xQ7N5+Vw6ACSG
	n
X-Google-Smtp-Source: AGHT+IFxlZlJ4wDQ2J0xN/ryGeuByEIqz96HUM0d+K0FdcFLDBc0ijzJee4UW8RAK2ccNbBjAMBr/Q==
X-Received: by 2002:a17:906:b1c3:b0:a5c:df23:8c88 with SMTP id a640c23a62f3a-a6264f15bdemr680485466b.49.1716896744362;
        Tue, 28 May 2024 04:45:44 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c81773bsm605825066b.30.2024.05.28.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:45:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: arnd@arndb.de, Thorsten Blum <thorsten.blum@toblux.com>
Cc: amahesh@qti.qualcomm.com, gregkh@linuxfoundation.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240507222226.288074-2-thorsten.blum@toblux.com>
References: <29b33c18-f123-4656-8507-406c87a12ec8@app.fastmail.com>
 <20240507222226.288074-2-thorsten.blum@toblux.com>
Subject: Re: [PATCH v2] misc: fastrpc: Use memdup_user()
Message-Id: <171689674351.20426.8981962769310707800.b4-ty@linaro.org>
Date: Tue, 28 May 2024 12:45:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 08 May 2024 00:22:27 +0200, Thorsten Blum wrote:
> Switching to memdup_user() overwrites the allocated memory only once,
> whereas kzalloc() followed by copy_from_user() initializes the allocated
> memory to zero and then immediately overwrites it.
> 
> Fixes the following Coccinelle/coccicheck warning reported by
> memdup_user.cocci:
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Use memdup_user()
      commit: a16833330e2fa60912af6abebde711bf2c672cf9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


