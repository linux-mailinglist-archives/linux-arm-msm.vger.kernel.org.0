Return-Path: <linux-arm-msm+bounces-22302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F60903B3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6794C28869E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E3F17A931;
	Tue, 11 Jun 2024 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTXKZQhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F361514FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718107085; cv=none; b=sN+6qgcu97w7w5u4G0CMS8WAFepmTz5pAOlRKBPuwtaXb2mndH6bWiwfgJnG7P/r/NONYPVYMv4rzmkLBPBHSf1rKMMBK1Ad0vLXY8IEit6h5Iewbi2UawwoHA1vrzVOJRcuILC9oNWcdHgYReiK1aTpvRlhCVYCQru26xj/ur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718107085; c=relaxed/simple;
	bh=KQOQMNe/0O2p5NcAx9Wr8YU3xBI8taSDf2dxsX8eN+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QWpsv4bKSzlZ/mz8F7N/Nc/fnzYU4D3DFaH4aZ0yKj3YtAghIGYWUcUwaZM4Kqj9R3/IyCElDT8JSL2W3ZbgaRqzVNAgKT9EkOfiC70Vr02qgesHiPbUej35OZUbR7GsyTYTZ/ZcCQKWY2h8wptQHnnCmsf+yuu0fjPQv30moK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTXKZQhE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6ef46d25efso438974766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718107082; x=1718711882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8km0fCrQgO57gFXBsXFIYcrjuKczDYZLAASbYW83aek=;
        b=LTXKZQhECbbfKv/qkZCqUXiwri9YSZmnMzOpcOcBiGAxiX//EtvEs8CaahYh4Hlavk
         NdJVYFn6ZRh0wfmkpsI6XgV/oHsQNI87gpiReGDii1AFcIfO2QLPkZTdS92ChNjXUKHU
         VbVzQ3dHKh8wgXN/OQaLpOKMxiykQBSrW+rDA5aXq7GXDxfnRe1IUBwQlc6F+73JBngb
         CMdw5KdbQU85kcTzttxuSsCrYRNZbCH2dpkjXcB7Yy2x5ZqQSXjz5Z6KMSUr0cRUJpVk
         650bUQFLGSG64x653XGcQwCzDwR6azGKRzbHW9sjY+boMPUAGvTZexbMm9avCX7Gkzle
         uNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718107082; x=1718711882;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8km0fCrQgO57gFXBsXFIYcrjuKczDYZLAASbYW83aek=;
        b=gT4cyldOLdik6BF3g38dHkAcYy4Ao8xU4/Sa0M1tI6APnmCqr6QZ93akdMLBcWk/nH
         I0rlLm8Zo2rYgUiYhlAjwUXa9rQiP+U92bJzrbgocAemVL2W8ALIIOtYNYWY1uCWvKLi
         7zliNFUOvao5+HQv9Pc1OpKu975KyuSSMXfdL2xBeEXh8x7TnJH31+yWMpsvGWCGQAhp
         PaGlc/UgoAoZQwxzCqVttkh+68J+JqFzCDvgv52G5T4RbRbkqHt1o4EMAK2kn6tYOIIy
         EeehYxsAURkmKqxooibIDk02OiuFGuiCBgIswKXeVE/j3L6yYj8XQKfpMUs7MRXzTKiu
         qJXw==
X-Gm-Message-State: AOJu0YyjvgdxFsB6mGGOmeBdi00kuJfbLOI3p+Pxc0QYmu+zwb2WPc5T
	XILJdcWqi4SsLskMP2b2izD0VeEDoYb2IKFRAkcyvfU0JU1xRwpC9cv/5WqvRcA=
X-Google-Smtp-Source: AGHT+IFE/E3oXsA/j5Sw46isYeAbfSwDcm+QTBQfzlRN7+BbqOoeqoLghf4L6f7cDyPU3Yb2H/A/fA==
X-Received: by 2002:a17:906:4eca:b0:a6e:f75f:be04 with SMTP id a640c23a62f3a-a6ef75fc386mr549563966b.38.1718107082022;
        Tue, 11 Jun 2024 04:58:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c6aa014c1sm6226784a12.41.2024.06.11.04.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:58:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, kernel-janitors@vger.kernel.org
In-Reply-To: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
References: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
Subject: Re: (subset) [PATCH] misc: fastrpc: add missing
 MODULE_DESCRIPTION() macro
Message-Id: <171810708104.74168.2910983617658418174.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 12:58:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 03 Jun 2024 12:58:08 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: add missing MODULE_DESCRIPTION() macro
      commit: 6814f03445b30f6a136ff043cb54c0a86e3de982

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


