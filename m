Return-Path: <linux-arm-msm+bounces-16402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2B89889D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 15:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F731F234B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 13:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAD51272DB;
	Thu,  4 Apr 2024 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCwQTXUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D25286245
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712236456; cv=none; b=g9x3cqw4NG5SSRZ3PtrRviDn1qR9mQyyM7WNX96HVvNxTllym+ZAKihYtJ/4pgmegmd2psX3VMd7bhRf5li3s50LsiNzzcTF/tR1xPTqGzw9vHb+hnVxIP6al622WpKOjZEVuPxdNK8xTOabII9+HgHJr4C/OQJ3Vx9cz6g6G5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712236456; c=relaxed/simple;
	bh=TvVo9cCYyR632GL7Cc0fqR3Kh9+qrXT134eJYEYfMZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYTlaNwlNUgJVTzpMZRuQNzmQ3WcAgQT3hj2O7SlOvhGEq/KmbUfPTy5S65TPTHtF7SYpAC+yJfX+fL066hrnV7LA8SA0fOK38XKBFNOhnmdbnEPrO2g7s9jMgWnH8Zx5sXNuz4BYd0Y5yMwF+AKAkgnw2DJa3UBrXybBsjuh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCwQTXUs; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6150670d372so10307867b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712236452; x=1712841252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tknSODYMU/l/2VPgjwwryjgmML6llAA/U7CzR6kpVHI=;
        b=QCwQTXUsjxHVDw6kc1QhrXrHBl7OZSxalSAqJgIWQorp1SSNS7tcpYj8+KxuymXMAG
         3l5SZy8RPm9EfT6De3dAeiFjf3rZXtzdqlhG1xVjxEluN+zqn0hh1qLBbr8wzi4wDyUE
         v/juRr40Bpln/wr5QopjwTep8aCQmeqrckSgU31vPKcIS3MK1S5G8RxITI2xM8FGhd85
         MYoB+MALAEt1iXahOqSnrsDvMZlx/JSll/y0l6OuqQ9A2OYg6xOZ6B7DgurpVWEk44FU
         kwSoXsUJrs4RFC/HAE7AcKksifNIZldTWhXu3qeH66VBSQ6nK96C7jiwsc8ATq3wvUYl
         iaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236452; x=1712841252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tknSODYMU/l/2VPgjwwryjgmML6llAA/U7CzR6kpVHI=;
        b=CRzvX66kWtGXhP1VKcqQ9BNpx89Ei6/pjWIQqUGNlTfGA+XGxJ1I0RLKeE7VQCOzgW
         QHx0W5YwBFRytmpoi6bFLy4egGdpqXojQJnXJC47byaVBBPMZeSEaXvsf778PqQG26m1
         SRCCRbG2rLjEovllu6PH/SxL4D0BiQbAZXxvcbEcUp8O7c/k5RoeigsG4yUW11sfK7Ya
         B56tpcTyHOdPLKACHrRZbfuMhjtgKW2DLI9401OiC8JWnfdzvImIMA9UPXPw+Hiz7O/M
         XPQb0koOMAyb5WjH7DNHAgY7pucvlWg7hZIHNjp3F97bIXEpRqVpiGNacz7PEqeFf7xI
         cj0A==
X-Forwarded-Encrypted: i=1; AJvYcCUBusc6BUec7jqg8LwvvwOs2zjnD4l7LiKmqwPZaVn8nYICKYDsAfQNq+Pv2PWG5dXg2s2hDP4KeVvo/SjLA5xvJMyo7pCgS0Cyb6v9HA==
X-Gm-Message-State: AOJu0YxMh+jW4Za+FL/8daPGa0xLhcjCVgol0/slNXbGTH9CMOAM/lcs
	jNnSC3Jio7gbMA0VxU0Wc3MpJeoSmQ8SxsG5HF/w8m5WJgmSMIIvei+02MjEcFDmWLN8Y68xRA5
	3kdjAx/FSvIqUiyojNiMetlUI8AbbjHKvaro+HQ==
X-Google-Smtp-Source: AGHT+IHryU3PLO20GBRCCgKMJ6XaprTWbXPQPdQ4lA3pQDeAvfm7RbBhJGsftpZ1ACzQsnluXERsu8pQW/NEsN9JBts=
X-Received: by 2002:a25:2e4b:0:b0:dc6:8534:bb06 with SMTP id
 b11-20020a252e4b000000b00dc68534bb06mr2340069ybn.17.1712236452434; Thu, 04
 Apr 2024 06:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org> <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
In-Reply-To: <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Apr 2024 16:14:01 +0300
Message-ID: <CAA8EJprBe_th5n_J4BRxUhAO1k89cZOGyTfCBzGQazN5fe9Nuw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath10k <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>, 
	DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Apr 2024 at 15:30, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 04/04/2024 13:57, Kalle Valo wrote:
>
> > Dmitry Baryshkov wrote:
> >
> >> I'd say, we should take a step back and actually verify how this was
> >> handled in the vendor kernel.
> >
> > One comment related to this: usually vendor driver and firmware branches
> > go "hand in hand", meaning that a version of driver supports only one
> > specific firmware branch. And there can be a lot of branches. So even if
> > one branch might have a check for something specific, there are no
> > guarantees what the other N+1 branches do :/
>
> The consequences and ramifications of the above comment are not clear to me.
>
> Does this mean:
> "It is pointless to analyze a given version (or even several versions)
> of the vendor driver downstream, because there are exist a large number
> of variations of the code." ?
>
> And thus, "it is nonsensical to try to "align" the mainline driver to
> "the" vendor driver, as there is no single "vendor driver"" ?
>
> Thus, the following patch (or one functionally-equivalent) is not acceptable?

For reference, I tested this patch on sdm845 (db845c), qcm2290 aka
qrb2210 (rb1), sm6115 aka qrb4210 (rb2) and sm8150 platforms.
I was not able to fully test it on sda660, modem crashes without this
patch (there is no MSA_READY indication) and with the patch applied
the device hangs, most likely because of the IOMMU or clocking issue.

>
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 38e939f572a9e..fd9ac9717488a 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
>                 switch (event->type) {
>                 case ATH10K_QMI_EVENT_SERVER_ARRIVE:
>                         ath10k_qmi_event_server_arrive(qmi);
> +                       printk(KERN_NOTICE "NOT WAITING FOR MSA_READY INDICATOR");
> +                       ath10k_qmi_event_msa_ready(qmi);
>                         break;
>                 case ATH10K_QMI_EVENT_SERVER_EXIT:
>                         ath10k_qmi_event_server_exit(qmi);
> @@ -1048,7 +1050,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
>                         ath10k_qmi_event_fw_ready_ind(qmi);
>                         break;
>                 case ATH10K_QMI_EVENT_MSA_READY_IND:
> -                       ath10k_qmi_event_msa_ready(qmi);
> +                       printk(KERN_NOTICE "IGNORING ACTUAL MSA_READY INDICATOR");
>                         break;
>                 default:
>                         ath10k_warn(ar, "invalid event type: %d", event->type);
>
>
>
> Regards
>


-- 
With best wishes
Dmitry

