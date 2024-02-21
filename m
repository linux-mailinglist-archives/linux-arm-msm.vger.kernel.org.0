Return-Path: <linux-arm-msm+bounces-12113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3C85ED57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427D6283CAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0246812BEAE;
	Wed, 21 Feb 2024 23:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DueHmEmB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4712AAE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708559192; cv=none; b=axZ3bwipRjkWAg+n9ahPRxkCUSMm/g/UUpPHb5YmOtPLbLr1uHH3+mdv5WUTyY7C2EQ+YcU26lkDN97NGcZySgQQV2J3p0qdVMpaku526VD5awsx5SrqbQXePpp4Vzyco89hC8qSmeltFUGvyB+21CsJ69BU47N5ZxlWrIu1TUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708559192; c=relaxed/simple;
	bh=pnWmeqP+Q+Ss6Z1HiEF7qic+Q6eECcvYbDCo4XWvvrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTZpG7k5qgfnGIckE8Jo4oE7qVU3IZ3Qpv9NDkbZ5NqET8llGRaKNxDyx9wkcTSGPkQhoY7qVu/JozPFBboLvhQranE6Vr9LfB727jSBuJ5osZCS7JgvLtcn3PSmeaC5HK3XL/By4873rZ+CSiQjX3x5cQCOtrom3Ms+bdAQwRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DueHmEmB; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso1401249276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708559190; x=1709163990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9dEH93zhYBQD4O+y/ZdH1upWZUpwf2rY+NjXG87KgkY=;
        b=DueHmEmB56IJsWfC2ZCVxdkD0nfWvrE4zvzf0eooQaREXhPI7xLhOOgEwH/pIbnFUt
         V7OiXBQmSbqQ/Ip0iIbNsK411MBG94IhV/J5o6+qLziklzBkkV39XGGMBHtKi283IGSc
         FPd9kgjW8PttPOF6GyYwTMHHFhHwo6WZgOA5WJUb/Imqlhhw3av6qZFsV/dBi8D+svU2
         guUwyVvnXxaFxF52yivbsbxKzWZmIon+pgI/11Xilc9ykxuOb5JBwVC9p9CZKdRGIO0s
         LuTxvKZ9a7Z/04DkKFgbUeCcvXe+s2tAk8sTEuDIrg6wNqB8Cswo8ramwF/MVdoKO7/z
         Dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708559190; x=1709163990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dEH93zhYBQD4O+y/ZdH1upWZUpwf2rY+NjXG87KgkY=;
        b=CcqLEaup/AOZn7YS3NyjcqeLZTKjRNw0niaYSUXAys0SChv8BT8/4JAZ+vJn5r96/K
         wI2YRHivj/CSYWiA0RYcfMNL1NOSjcHK1PSAnanhrvvT1kJhkUquMhzueNqdS7mSPyhd
         mryuXMFmBEiXSWwwTLZpjT2y72J6BNAnWck9YoTdrJzi6I71uVYUUDVp0ndYfwg3Hmmc
         HIOhQIzZ2zqLD2SQTh9ZCCKiJ2lQvNTfPjD1lKlj/o/14yW5CcFCA3hWe6cjV8Z9nC/w
         hddycuCkVbKsC3L7XQ58T0rXnW7olMqHE3OL1iz9q1ow3IdzpiVKrK6F4zeFhCfViVG6
         ZB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWWZf7fqxlQcCGsBUt26JR5IwyhSknfgfXlidf5TjQIeCK42f+bfvNdPDu0sU+Gsk3zGhNnWfPEytWq7CVVN0q0XsYHBsi2iLfnE8RJQ==
X-Gm-Message-State: AOJu0Yyh2OFe+ix7aie6DiTEw3fZFnPfoQkecyLJrVpTUadLa1hSPFFI
	O42XYmODXjPzxnz41P0D0+3ec5wdjcyshC2kC8ypmPMbT40VK1Cz8T+riaygr/S3ZI5MONrm9mD
	IbNF9Te87tiHqwWHovqW/U/o+7X4TeJ4mUYifpA==
X-Google-Smtp-Source: AGHT+IGT+kCZVUVphawG3vyzsnULQGNfcmUnmQnWaJ9LkQcRZTA/qLxPQfQPfUp2YntsI2O5+i9NAL76Naaxfiuwc7Y=
X-Received: by 2002:a05:6902:2412:b0:dcc:245b:690e with SMTP id
 dr18-20020a056902241200b00dcc245b690emr1138030ybb.40.1708559190364; Wed, 21
 Feb 2024 15:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-4-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-4-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:46:19 +0200
Message-ID: <CAA8EJppeStVB4Fn9Abh5hae6UBT871r9OrdCSux-YBwUOGAN3A@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: qcs6490-rb3gen2: Add DP output
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The RB3Gen2 board comes with a mini DP connector, describe this, enable
> MDSS, DP controller and the PHY that drives this.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ac4579119d3b..32313f47602a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -430,6 +430,23 @@ &gcc {
>                            <GCC_WPSS_RSCP_CLK>;
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_edp {
> +       status = "okay";
> +};
> +
> +&mdss_edp_out {
> +       data-lanes = <0 1 2 3>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};

Please add a corresponding dp-connector device and link it to the mdss_edp_out.

> +
> +&mdss_edp_phy {
> +       status = "okay";
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> @@ -470,3 +487,9 @@ &usb_1_qmpphy {
>  &wifi {
>         memory-region = <&wlan_fw_mem>;
>  };
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&edp_hot_plug_det {
> +       bias-disable;
> +};
>
> --
> 2.25.1
>


--
With best wishes
Dmitry

