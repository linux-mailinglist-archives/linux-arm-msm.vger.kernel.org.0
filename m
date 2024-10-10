Return-Path: <linux-arm-msm+bounces-33835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A39982EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFA91F21C85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814201BDAA5;
	Thu, 10 Oct 2024 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKOee0Fa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089419E7D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728554161; cv=none; b=BnEnqmZotObevWWXPcvU+Hy6Qox/UjgYJNlrBuHZ6U4Mh87QcZoBjyRFBO0EWCxexx/7CE+Y8pwZFOGqghxEf0PbKlvGEfamfL7y2F1yScV4KxqBJZfOchntCTD5bmAAhVL6MaDQz3UPI3oUbxrvMtVHVvprh58SGm3gSpbiAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728554161; c=relaxed/simple;
	bh=XopSwLBUnKMXMFt2QF9TxC6ddo9IsvZRHm1kfbjdsR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfp7DBRPw48RrKWQlDKncv8LFToddP+7766BBleveTEHgBs5H37I4bMqkzSUA9rxAP3OBvGaf35XTh+t9jOHa9FVDqMuDvHQ+mEl+28ur9HjItVh8/Ddmklmit7O0XYX3gT0PGcaujrd3wjlwVuvnwvF7i2kPNkDItTj1/GF+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKOee0Fa; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e232e260c2so6917517b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728554159; x=1729158959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOxBidp2LwpSxAPZkgwnhCDQ++zAlIni8FAvSy37V9Y=;
        b=PKOee0FanXR78U8uzaXTGICADQho+Maf6NiPaSKMo/svmaCa0hfIfTB6pafuAmns/9
         Qoz8jncV6dlVndVZWCxqI/PUSZ3+Aos3fYDHzDS+bKZqZBcpAK8Pg5FYJHKpRqY1h51v
         BJWplOrcBCVJxV+XhYYR+Dg3hYZgXV76kwNKhSb3KmLaADsjZ9xM0b8YwhZS2dLwfiZ9
         /RjTg2hfVrZa587JynC/T4ocdJRQFQnU0WSXWRwJyxS9okQdXO/KWLYjRmOvjkKixvLc
         uKjLuCMgWMQIPwZv1PL4XwwE4EjsGyLp/M17Cl/8GngV0Mh6cyLkTtVK2QEGDIPQjPBl
         F8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554159; x=1729158959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOxBidp2LwpSxAPZkgwnhCDQ++zAlIni8FAvSy37V9Y=;
        b=kLV+lMg7qADMfbMNJHwuwMch7G2pcnGLDkyQDCKRncY2kzOOtVviDjGHn+h9mOL6eN
         AEqKsMqpIQaXXejtjgt6zqbqDTXstoGx0+yZnWbsv33G90jWwNxZnn3HKhB7CMvhUoUE
         ATzidk/HefJBThn1guCyND+UL/eeqUpATuTzdMWUQvohV5Gq4UKzF3stpSKtt5wyvikC
         jfDV0mMEKR5FavtQxblSgrrDmd79e5n8pQuN6iZ+38/avjG/hLG/CyY6ZSbWkUOGFgnD
         tg4iXVfQzgNgBSCBExQ19l8s1nuGGiI++89MlGpM6oldj+EY6ZacS5TTRyOmIVoXrVcg
         4Srg==
X-Forwarded-Encrypted: i=1; AJvYcCXrfM3zSdtJ2o+GDIbxrc+7Te16w1+COztFJ8PY4ro/dKyG+3zDJv7FmuYu9tFPyQZF8VXp5PhY9Lpdx6tH@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8jlN6jx39CfLTIYB6HEIqJshAkZ2vjMiRHSWCui9pThJCYkj
	QFWrd68SOYKbzNQrIPOpJ9fKTpgy3GTrB6MEJHttEO+CtS5cC8ux4CBPYYZQTaP0wDbBpfJY0QL
	/kcNDpHI96HWR5dOyeG7zjb6d+4zM1SQ/2PrlEQ==
X-Google-Smtp-Source: AGHT+IHQZs+aj47vmsFfuBifBBcYuqtrZOQCAYpL4cJf6+m/xMJish6M+co6AowbOJStpK58DqwxzTCpkJFzob0nWP4=
X-Received: by 2002:a05:690c:7690:b0:6e3:39b6:5370 with SMTP id
 00721157ae682-6e339b65672mr605897b3.24.1728554158835; Thu, 10 Oct 2024
 02:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010074246.15725-1-johan+linaro@kernel.org>
In-Reply-To: <20241010074246.15725-1-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:55:48 +0300
Message-ID: <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 10:44, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> When using the in-kernel pd-mapper on x1e80100, client drivers often
> fail to communicate with the firmware during boot, which specifically
> breaks battery and USB-C altmode notifications. This has been observed
> to happen on almost every second boot (41%) but likely depends on probe
> order:
>
>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>
>     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>
>     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
>
> In the same setup audio also fails to probe albeit much more rarely:
>
>     PDR: avs/audio get domain list txn wait failed: -110
>     PDR: service lookup for avs/audio failed: -110
>
> Chris Lew has provided an analysis and is working on a fix for the
> ECANCELED (125) errors, but it is not yet clear whether this will also
> address the audio regression.
>
> Even if this was first observed on x1e80100 there is currently no reason
> to believe that these issues are specific to that platform.
>
> Disable the in-kernel pd-mapper for now, and make sure to backport this
> to stable to prevent users and distros from migrating away from the
> user-space service.
>
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Cc: stable@vger.kernel.org      # 6.11
> Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Please don't break what is working. pd_mapper is working on all
previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
qcom: pd_mapper: Add X1E80100") instead.

> ---
>
> It's now been over two months since I reported this regression, and even
> if we seem to be making some progress on at least some of these issues I
> think we need disable the pd-mapper temporarily until the fixes are in
> place (e.g. to prevent distros from dropping the user-space service).
>
> Johan
>
>
> #regzbot introduced: 1ebcde047c54
>
>
>  drivers/soc/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 74b9121240f8..35ddab9338d4 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -78,6 +78,7 @@ config QCOM_PD_MAPPER
>         select QCOM_PDR_MSG
>         select AUXILIARY_BUS
>         depends on NET && QRTR && (ARCH_QCOM || COMPILE_TEST)
> +       depends on BROKEN
>         default QCOM_RPROC_COMMON
>         help
>           The Protection Domain Mapper maps registered services to the domains
> --
> 2.45.2
>


-- 
With best wishes
Dmitry

