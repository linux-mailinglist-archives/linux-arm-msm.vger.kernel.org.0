Return-Path: <linux-arm-msm+bounces-42009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D5A9F0C3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5084281D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2AC1DF74C;
	Fri, 13 Dec 2024 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ApTCdx4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545E1DF728
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092955; cv=none; b=FkDmuXypIPSPWHYQC2YWYaukX4Xah2yJweN8b2c7CFTHOzOd22L/3L0sim30u9YMo7vQUFBnB8sBQwJNhguCypDj12b9ccqIZEz3F937JQDu2CZDyO4BbT1Y5HVV7FoILQ50FZH6F7EnC2kz3FC1BgnlSwURa09WBnoLGZadG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092955; c=relaxed/simple;
	bh=93KVkxX3HqqmyrQ/h4LhI1Yswq7WZECZktzyWt2bZz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkOS9Qo54q4mHGYuXNc5AkaLeMGIj1AQYJrJV45D/nF5PU/9yHidb6M1YmMggW5q1yX9heWCsFIXaGMSTStyemLg5JT3lUnTia3+gn2WrUdm6J/EyqssdcbInOxycExnYyga6FWrAzAv/tj+41EcBuol+9FeLwgC+dOys4U/SlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ApTCdx4y; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4aff04f17c7so1566974137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734092953; x=1734697753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FtUtQH27YInSkS7QubBxHe0++ef4URa+tbTRrDJRxjQ=;
        b=ApTCdx4yqf7ajKoTqT1ybcA3/ECB1uL8BHxcYukX2IQRPw8hibHTFftbBIblBjKfHk
         7716vDyMG5rC/Wl/1MoEEx+ohNAZiU08VU1YvRMeBBOw0aiX5US83Nbu6j1E3tTqBj6b
         p7bxx6K9whYBzEQzXOMttnWkt7H+0m9AguCl7uTDxl76IbCW0EfyluDQtRqDqcuGFwUt
         fyrvVmrOSDUYjYb0pzhk2BkywMwU4iu5Pd/mf8cNAVPQ2FzSa9SNUFT6ETJ1vpNeLoZ+
         M7AzG6kOWXGJ/jGfV4/OV0xbIYSo15OXOxckKA7WTAabJz0eLLMvE41Gc3b9K8JX38Ad
         kWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734092953; x=1734697753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtUtQH27YInSkS7QubBxHe0++ef4URa+tbTRrDJRxjQ=;
        b=GpoU8ljInf+k2mLBJagtm9Fz5voCRq6XL3RT/HXGYM1RxctkAr4jtoaK3v/nK6ZEBt
         f20vBCgYH6hK069VmH4p4LxWbN9NQFIGD+pCHA9dMimSx7/ujNmAWjp3yswyKQBizI74
         UQjxY54GODtmwf+WfdJTs1v5IztjdYenAh+jCVHH7tRG3/jCuwdkq9cQk8C6wJLsLbaT
         VTctl9bJ9LF3nQGBaFd/yoXZAiJKgCAoJiI1OYLEWbQ+Pn2rB9bGytbAeY6fhPRnUDhB
         mv4w5GGgSmBw5X2T87UoaydRE8qKJCtcyKWXtEOe2OSQ7vsinozARyt4s32V+tPZcbEz
         M8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn3BRefQnhqGsBxY6AmBsqioz3mVsNzNXdcHwQqbYw9Fcb2w+0B0kNzZ0ZMKWigo4VsvTHzulwr9+D2Fnn@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTmEwwaXbksrL1WjlFcIoA5gPxF9wCCdQ9ybolv7XE9axrwyf
	7pRSUpvhuXH/p5tnv4CLpymTK+ppso8NhZPOGJkhUBosc4/n78EfZ27xgNYWOWJ0ZAoncSn6YHL
	9wcDvw06jvrB9JMoSZj/LzpNRO0gvXk56OOBbQg==
X-Gm-Gg: ASbGncsI6XKJ+o000uFIN4viotmGmFGAzdm4aRu42ri4xvQpNZFBv19tZ5utKbKkFfN
	kx57FJZdCmAhrliZgIjji6sZH8ekSJZE4SA5dKeRP8ApACYLvEoPB7rgxGyRxsdyUtCW1fA==
X-Google-Smtp-Source: AGHT+IG1eUwqPBtXeSmNUetsnaD01mL9MHBqUyLkem51OibyPkckl12MvzfT6CQybG/qaUW/KE7JovIxwZSB3Z1xuaQ=
X-Received: by 2002:a05:6102:54a3:b0:4af:dcf3:b384 with SMTP id
 ada2fe7eead31-4b257b57f38mr4991199137.11.1734092952957; Fri, 13 Dec 2024
 04:29:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
In-Reply-To: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 13 Dec 2024 17:58:37 +0530
Message-ID: <CAMi1Hd3_aDCwkg6g5Mb7Oc3sKQPmCcwoSz1vigHUbkDS2Y8a3A@mail.gmail.com>
Subject: Re: [PATCH 0/3] scsi: ufs: qcom: Suspend fixes
To: manivannan.sadhasivam@linaro.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Dec 2024 at 23:10, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
>
> Hi,
>
> This series fixes the several suspend issues on Qcom platforms. Patch 1 fixes
> the resume failure with spm_lvl=5 suspend on most of the Qcom platforms. For
> this patch, I couldn't figure out the exact commit that caused the issue. So I
> used the commit that introduced reinit support as a placeholder.
>
> Patch 3 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
> PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
> this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
> device powerdown during suspend. This supersedes the previous series [1] that
> tried to fix the issue in clock drivers.
>
> This series is tested on Qcom SM8550 MTP and Qcom RB5 boards.

Thank you Mani. This patch-series fixes a UFS breakage on SM8550-HDK
running AOSP.

Tested-by: Amit Pundir <amit.pundir@linaro.org> # on SM8550-HDK

>
> [1] https://lore.kernel.org/linux-arm-msm/20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Manivannan Sadhasivam (3):
>       scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
>       scsi: ufs: qcom: Allow passing platform specific OF data
>       scsi: ufs: qcom: Power down the controller/device during system suspend for SM8550/SM8650 SoCs
>
>  drivers/ufs/core/ufshcd-priv.h |  6 ------
>  drivers/ufs/core/ufshcd.c      |  1 -
>  drivers/ufs/host/ufs-qcom.c    | 31 +++++++++++++++++++------------
>  drivers/ufs/host/ufs-qcom.h    |  5 +++++
>  include/ufs/ufshcd.h           |  2 --
>  5 files changed, 24 insertions(+), 21 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241211-ufs-qcom-suspend-fix-5618e9c56d93
>
> Best regards,
> --
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
>

