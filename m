Return-Path: <linux-arm-msm+bounces-22451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933489055F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B22E283818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539C217F396;
	Wed, 12 Jun 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jcPK+yGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DB17F4FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204194; cv=none; b=Iqio50O4nZMgeh8maedTjyp4Bflfaovhb7+QDhgd6p6w+LGSbdGXoMknUbS2c5w/Hwm7ndHbBCTcVouY+FEIbYvVrboKN1A8aVzx2mE9N7UlEtN55WtVNxd6BCW+A/u4fdSqp1ViG5rn2ZPQZhAb2GMGOQim+kOhKjQR3z//t34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204194; c=relaxed/simple;
	bh=4kn8S3LzHMMLi/6nFeWowtDlnUvyLGqfc/HqAgfIrhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=StO+aP/ZlxdevjM+cT/CbwbZk7o7wg9IOP261MQ9tuBs5/xootqu5JKKUSIyTgRClca+RCbrpfRK+UyPsZ+yAiU+AMMCYbcoIHlLmCJibY3lQCruks/H+FSkWq2fMpfuOkulJi+0kq3nw0sgQxCkCem2nccf4uZ8AtjWmc9gsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jcPK+yGu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso694012466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718204191; x=1718808991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5yu8LOR9yMB+oZSUx+fwYASzFM4Hileor0B9Ph2tUI=;
        b=jcPK+yGuvsDp844baXORuuy6LmQF02uRm5rukBMTdd8MDXHPn25+f0462WZrez8Ola
         3rMNDiWO95xmcGBOtVhDY684AkBlRVN9wMFmJL9pAucYAlz64uV9CxblrOU4MpFgxIAD
         ose+245sCKpgoD5qSf5I2G3u6QZCPYUdUwvaoahSVdKUsvwaEpc+QPMQ9yi3jooeQBs4
         YORLLEh0dwDHRAVmbHFZOwok4AN+mfFdthdRzE1ULUiECnMD9PhQgdrVlozuY46Usk2b
         XjtIP12IE0ggKDjjeqNF1Of3PSUbg2U1nEkW6dJvZpM/LlLe4g4aErYcdHRfyk0yxH35
         A2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718204191; x=1718808991;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5yu8LOR9yMB+oZSUx+fwYASzFM4Hileor0B9Ph2tUI=;
        b=NwdJwK3n3RqTpdUMaLFLyizf+/w+S346ZO3VhYCkJjsini34xKKytrTnDlUgF3DOFk
         ImNdLqrLzum2KZd+//QWVu0G2g5o/Q7Wa/9p83U47A/lL217sxgpRgFqvgn7Abla0Xg2
         sUED4F1clNwVo47VTVwMksFe/M07iFQagI9Jj+KWGwvtIpYiqfLx2CxuGgtM1xQc1Meh
         cs55kQAytiTQIXs4hC1cChhDOx8KEWIjU5HcqCtxs40Bhk8ZJnbTzYx+Lw7SN65YhAiL
         ReXL9xAokSiipsCi/K8AFysnMyDAuKF4n11VimsjhJzrIDjNsfpmvZHqczzcAgBBAM7r
         QNvA==
X-Forwarded-Encrypted: i=1; AJvYcCW00Jm6l/1t+G7s/tBBNoD3wGmdb6GGkecuLBQxZIisPw2b05bKdspdhXRjTShJsA999t9C/g5M/ozUccSD5vYCv/+XrXlHRWnwMJhA0w==
X-Gm-Message-State: AOJu0YzdpWqoR9k9v7hdBQ7dEDDq8NcDckRelJXQfuavVUyvbQFE/x5F
	Z0gPjsl0B8tkRbIFLBNGJTQOuCyzb+lUlYWhQd5XH+Fc1hMHf1OQqa8aMjY9KoU=
X-Google-Smtp-Source: AGHT+IEwGz7ExK9rFeDcCAcMm8cBQlNhVoJT3sknKM3Eud8XI4/QAubfXavkLlUfpvUlX4mMSSoZ7Q==
X-Received: by 2002:a17:906:cb13:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a6f4f2c1c19mr45887366b.44.1718204190879;
        Wed, 12 Jun 2024 07:56:30 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0f98a285sm552368966b.210.2024.06.12.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:56:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dylan Van Assche <me@dylanvanassche.be>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240524161423.15392-1-me@dylanvanassche.be>
References: <20240524161423.15392-1-me@dylanvanassche.be>
Subject: Re: [PATCH v5 0/2] misc: fastrpc: FastRPC reserved memory
 assignment for SDM845 SLPI
Message-Id: <171820418971.165525.3637990952357907188.b4-ty@linaro.org>
Date: Wed, 12 Jun 2024 15:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 24 May 2024 18:14:01 +0200, Dylan Van Assche wrote:
> * About *
> 
> The Qualcomm SDM845 SoC has a separate SLPI (Sensor Low Power Island)
> DSP for sensors connected to the SoC which is responsible for exposing
> sensors to userspace, power saving, and other features.
> While sensors are connected to GPIOs of the SoC, they cannot be used
> because the hypervisor blocks direct access to the sensors, thus the
> DSP must be used to access any sensor on this SoC. The SLPI DSP uses a
> GLink edge (dsps) to communicate with the host and has a FastRPC interface
> to load files from the host filesystem such as sensor configuration files.
> The FastRPC interface does not use regular FastRPC Compute Banks
> but instead uses an allocated CMA region through which communication happens.
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: support complete DMA pool access to the DSP
      commit: 9cee10334bdfa9db771b006fe2eba060f8719687
[2/2] misc: fastrpc: use coherent pool for untranslated Compute Banks
      commit: 0ff3de43062785462d9acede2987f35525b1c0ba

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


