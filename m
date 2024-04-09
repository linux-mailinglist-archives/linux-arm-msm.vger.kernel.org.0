Return-Path: <linux-arm-msm+bounces-16985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D389E593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 00:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FA01F22EFB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 22:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC2A158D6F;
	Tue,  9 Apr 2024 22:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBa8aVND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F1158A0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712700749; cv=none; b=dyMyIOmGCrSZcDNHGe9Q3naGuEc1qHTG7039A11wcCRCeHr645cU9cHiCNTGMV4w6kd0ZyNtj4K/y5XUQVLdp3Rc4E8BZe3QqY5JtIktzcmVj1buVl1wl9VB/i0nqLy2dw4h8GrdLUpzSYtBNypXrGmYeknP88GD0CJa2UZ/KgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712700749; c=relaxed/simple;
	bh=YLJEH85clw7tEXgAtdTffvSmJMpNKomSK7PNp/pDT/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5rXz1RbK7FNrnGAD7jl1WAl/KCJ0Ufe4XqhrTHkYefxB0ygZ6mrGZnFbWh485YiCul6ZPVvE38ejH+LN9+c0opuAHOA77B7ICJ25bbk3cxy5AcXVYgcQKYJQPjAFLAilXRo2q+FjLaA50mPDr2401Zo1zD+tUgE3adJBuzG7Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBa8aVND; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso6310167276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712700747; x=1713305547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8tzg7SCUjt/yUYzqXEcGVGEwcUFNvaCr4pngNN78J0=;
        b=HBa8aVNDjWYejpbg4g3JT32cVQZN0UAmHfBq6KWs2+1PryUJBcNy/L6GWttJ7unUnR
         LzJYD9HLg2N13I5FsULHdnPjnnZe+8Q/cxmnLTIYEvibqx3FEtIeqtJ8ZvtXHjWzedt0
         xBPLQaDOzh9v8VtyawZ3qyw/bIeLhybfsZ7hDmdakl5t0M2h2z9V/vEr+gJZGIc3GJx9
         /9LDZDo/BGcHJq6Kze+tIP2hUTULZNmRroFohclf5RKf+MVuJfjpzT7DjpCViKEBPCrg
         M/YhYoYh3pxSn4j+w5WlB6dglq1gxyKdzKNL32gqIrTtD+o+Y9X2Q3fuO8QLYkeZBVZj
         PNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712700747; x=1713305547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8tzg7SCUjt/yUYzqXEcGVGEwcUFNvaCr4pngNN78J0=;
        b=ZCYeeLdzO3OaqSp8RLXNSeQA9qB5uzoMPrBR7TIwrw8aaP0kxGUJalKGOX25aJO8nn
         Yo13OnEzUt19mI8hkf2Lugp09Ls+1dbvxGYXantWcChY9E/urifLWl0rqDP2Pu8T2Sc0
         zVAAfTEUgolqXNM+nr9eGmzr041q1zuc91NDlBWntDa4XqvYCQLEmHOERRZavujTVxVv
         +szAGJQiKe7EN2mITHWLbbcm5KqpyTxXieQyL0Fi5CZWNWeh2a+pgLmNpwuqE79Bd3TW
         MLbwuy4KHBMKd01IQcMhsJQZ/e23/0iATjdpSfJL7j+S9aNB5qpced9mIUNkrpoY1Gtp
         aaww==
X-Forwarded-Encrypted: i=1; AJvYcCV6gsQ5YOKRrtRPcH86t6M9D5DtrSsb20+90Nl+NPc9/lGrMVZEJUn+QLCsuSUa8HBQ83KgV7j03FhxbiNRdliCRIE1xWBlunBjRpAKeA==
X-Gm-Message-State: AOJu0YyAuC+FvA21RrSfcObluJ77BM99fsX+UhQHJaTW5RR+ikU6aGee
	nyXCHXeP/ukBMC3FSv4Y9QR54IzXj3gKHYZ38H8sRy+Y1neW1iaTR0IR8YPg7/UlWVBplvYgSF9
	EaZ7Q0VIFO2hcpqKGu2XWXfvVySV3sdsFsqCClQ==
X-Google-Smtp-Source: AGHT+IEZ6aM6yObNjruSpCvpScgy+qYyCsXf8ewGZrqz5AniYe5/UVVRbO1+i75M1vmRW2YOmjsc8+doHeipVZdhQgc=
X-Received: by 2002:a25:58c4:0:b0:dc7:47b7:9053 with SMTP id
 m187-20020a2558c4000000b00dc747b79053mr1102765ybb.15.1712700746763; Tue, 09
 Apr 2024 15:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org> <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
In-Reply-To: <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 01:12:15 +0300
Message-ID: <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> =y for console?

I think with pinctrl being set to m it won't reach the console anyway.
And earlycon should work w/o ICC driver if I'm not mistaken.

Several other Qualcomm platforms also have interconnects built as
modules in defconfig. I really suppose that we should move all such
drivers to =m and force using initrd. But this sounds like a topic for
plumbers.

>
> Konrad



-- 
With best wishes
Dmitry

