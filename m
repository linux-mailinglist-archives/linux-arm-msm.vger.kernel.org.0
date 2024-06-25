Return-Path: <linux-arm-msm+bounces-24112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E8916AC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACFE91C21A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A95116D338;
	Tue, 25 Jun 2024 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHNJh8ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7216DEBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326427; cv=none; b=tTK64wLmaen3HVWD8SiaBI5xOpXVpuX5lopB30jV11dvd0qPXJIiYp1kiHI2VwleZX6nDfHqr39pd7n5XQnHrfm/q9BAf/5qjORaYopz94O1zxw6xFl6p/xZHpfsBecjHj0GB61mKQ21YPfCbLor9M8TWVSkzI02ie3YFgvLn1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326427; c=relaxed/simple;
	bh=trALs8KdLx6VhITV+c8+7FsleAuPSHSH71GZILSGCq8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYXnsx/jljWrhUNzfQwJlJQDzIyltNCCYY03FogDqWlKEtIZH+t01RfBBn1ZoiavgfI0WcmC0Tr7SopM3wyfep8FFaEBO/vwFAzVK9Vjv/8T8rAYRTPwF8hUIwdQm9QoLcpsA5MV+Ouhuu9LZuRaeqZyckBau0e+oV+GwkSnvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHNJh8ki; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso46757435e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719326424; x=1719931224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
        b=oHNJh8kikWXt3JTsg9SRimjq6SKmnkmH2Ag4dH5nl5IJvby0LErFjtGTsskBk5Ezhq
         X3+CFvqZUI1IN1fzTYY5Njd1kL4dneyw2O8U8Q3zKIg1SHgwF0YcK1fa5Rd3A5LJ01eZ
         DYmv/78x+qzw3o7zPxSZ93wF6jA76JtPKy+fYw4Ux1Mfrm/qnm4BGxmgV6bB/4iMivQe
         g9YCM3g1RzbK2N9yzdHEXbUlae1rakkBPFWrXJvkPkiEFJ9rMIG6GrZYyLfscrCWukBM
         HBTwK4/WckrR26ctoXz+27yJ102WZd/nz5sW5Ph6c7+UKVDVvrCSnvztkKHSfhH8VxRF
         m4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326424; x=1719931224;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSANmUbEh6D7VW1j/tL/xnWMrzPKUXm5bDXQ8ewTync=;
        b=L5HhTyn51mMR5DSAR4/wRNwqYffm+D5O7klC2cladjpxRVlZFilvAO8tTtUVgiupqZ
         jlqiIzkJo4QsjyB1+KeYuv/nrCXLBa6t29ieG3q2gjJ5F+Tk8x7tjTwQTgsZ4tsUKVCy
         F+o332XsmH0A0YN3XQqfnM4+lmNf/NcFrDp9KvTuH0IBpN0PVoEhOqBcopcNdcE2ublK
         ks3UNRaFkvTqwSiI+mZhF4iKwXhS/tDAmuXylzITc55WWp58ZkIaz54qDoklYh54oQam
         RD/G1albHZ4rTyiLA3V9F58zwkJfr70skJpJfVJ5z+xbD7JjtpPHpsZ6ve+QITgTo+fo
         DDBA==
X-Gm-Message-State: AOJu0Yw5zUYf3Oglf1/foguXfgpwMBXp8Onahw3fUiuV0dsjZfPDW+9Y
	VWNPT7GWqu+vzbvBFr9+YSJcqu0UscLavrXukr8r+W7Bel9cZarxqUB+agdnDJU=
X-Google-Smtp-Source: AGHT+IHETM2J/do/2SDqnSnmgKYgYsfQ586CEBVmGuu5NWFMEzbLBxusn/KmGl6Yk1pyNmCJDNWl4g==
X-Received: by 2002:a7b:c3c1:0:b0:421:2b13:e9cf with SMTP id 5b1f17b1804b1-4248cc66b18mr53553185e9.36.1719326424339;
        Tue, 25 Jun 2024 07:40:24 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b3dsm218556165e9.34.2024.06.25.07.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:40:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
References: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC
 patches
Message-Id: <171932642324.352395.16698786992801289835.b4-ty@linaro.org>
Date: Tue, 25 Jun 2024 15:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 24 Jun 2024 11:19:09 +0300, Dmitry Baryshkov wrote:
> FastRPC is a way to offload method invocation to the DSPs on Qualcomm
> platforms. As the driver uses dma-bufs, add dri-devel mailing list to
> the MAINTAINERS's entry, so that DRM maintainers are notified about the
> uAPI changes. This follows the usual practice established by the "DMA
> BUFFER SHARING FRAMEWORK" entry in the file.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
      commit: 47bf4198bf386018e99673c1ce5dbd8e5eda293e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


