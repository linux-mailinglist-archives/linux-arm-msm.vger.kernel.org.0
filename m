Return-Path: <linux-arm-msm+bounces-30896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B696D888
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16BE11F27B11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0778E19D086;
	Thu,  5 Sep 2024 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAG2FSu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D819B3F3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539246; cv=none; b=hOg5Kjg7HCB2/wP0VJryEhP9QXKKDg/VVKq7MQpq5Wh9N2hGpWognPVv1Cx8+cKBmwQxkLIhT+v9DsAZ9ZfsGknLQ1HfMhk4veykaAeKJtxnTng095tn9ZVBiwyUr5NHSslfGsDQT9uRpSSQ0o1awESYvVmTJrbzlCdHULoQkN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539246; c=relaxed/simple;
	bh=4GL4wu0MXv5Zo32mStDpWO7XiaxGz/eqw951ir/jrpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtOf6vuraqzRv9QJIdjMJ/1elXCuF0bOuUGd+cyG/l3olNjRLNH9ARqq4eahwXOrsr5RqkjvyNAkJNpAacD/yMg8yqb6KupcfboCMTSK1VY9MRTh1LQ/lVp8/8om036A5BlsDxdFxMHF03Ityi3HsgP4gcWEvfZKw7uz9WxARow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAG2FSu+; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b6b9867f81so6256897b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539244; x=1726144044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpuELiuDCnG9ORAqJlu7U8YtP7sU10a0q1Q1XH/Cqew=;
        b=QAG2FSu+AGeFM1z8wApc0EeiWKLr+FukS/3zK+qYFK169R8JYmCkkevrZEWbcgqhTY
         c/6o+aefarwz5urCbe4699RG+4TmMLsuWsTG1DLTkSelh5u31YNOs7fh5yG7Sgqmw4kQ
         m1XViLw+7aP6Hm3phUwr+mtSpjI8D4QVmJJZi7QRgK8ut2ZzmnDVnGhJGi4Fauisn3Q0
         sAH9IbBD9Jiyq5w4dgz4QnxHM4ISClgvJS+qomf+x+ecfRZnkLu295r48S8ppPiEjsII
         l5JuLqxgxt0xe50CuZ3d/pWFRlC6v5z+82UHDbY78zeq4RSpD2I4/KO0D9yJyCWB9/cr
         Idlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539244; x=1726144044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpuELiuDCnG9ORAqJlu7U8YtP7sU10a0q1Q1XH/Cqew=;
        b=N+y5BnXCfLwp6O0J9HrxzJiGPF7hWoe4LX2a3eLMqZcpEVgZQSCNmJLfrpqO0fbx4K
         lpx6cbd+IXpnROBU4ktMJcoNwDO1zrqOk3qb43KbzCyqsUb822QU7zo8GjzUgiHxibUb
         ydDOma/Bxl4Cyi73dVsFK387G2d+2hpZGXXRe+FwrI6cs4afZd9awoUzigqJa42YOgy3
         N6GV9XHY5M4B3tGZdUD8wePeNb+iL6NVyn6b99z1S10ZG4tqYHP+eiRCv2DxV2QTjYNf
         Z2FOriufRaOEJFZkz/oPIqNi1NymK5QnquX3CHfryocEV8R0v2Qwr030Ajguzqkb8c2P
         0jiA==
X-Forwarded-Encrypted: i=1; AJvYcCVjOwy5w+kp454F1Z+Jc4lDHVkTgB8yKrMICmqaASPx6hl5M6RJTnwmVe6igPcJwKJCL7vCKjMh1HXCdTW+@vger.kernel.org
X-Gm-Message-State: AOJu0YwymFljZgApAuOa3adWIOh/7ZJaz/4DGWgP82MYMRXKJrL/WQc4
	htgjEAh1AqH7QXugMAgMyrS6qbBLEzNQfcTQhV0EplA8wzXJUL91gw7q7qpbiGqW7gF1p5veuEL
	Sr8pthfagF2k5pweeElz4iH2Pk29yjBqixbxOUg==
X-Google-Smtp-Source: AGHT+IEipp3nFbghziTxQBlyaXZKzf9SpRdRpCvdn45rRKpyvNaBOhUVm88FSmPAi+h9oMcNOuFo+w8gOWxk5tjCOY4=
X-Received: by 2002:a05:690c:d90:b0:65f:d27d:3f6a with SMTP id
 00721157ae682-6d40da7efecmr224769407b3.7.1725539244170; Thu, 05 Sep 2024
 05:27:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-4-brgl@bgdev.pl>
In-Reply-To: <20240905122023.47251-4-brgl@bgdev.pl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 15:27:13 +0300
Message-ID: <CAA8EJpo2-P8N92XFRYszbZwo1gDbRPe+O=THafxWSbk1ZH-BoQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Sept 2024 at 15:20, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
>
> Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 98 ++++++++++++++++---
>  1 file changed, 86 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 6a28cab97189..88b31550f9df 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -400,6 +400,67 @@ usb1_sbu_mux: endpoint {
>                         };
>                 };
>         };
> +
> +       wcn6855-pmu {
> +               compatible = "qcom,wcn6855-pmu";
> +
> +               pinctrl-0 = <&wlan_en>;

pinctrl for the bt-enable pin?

> +               pinctrl-names = "default";
> +
> +               wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
> +               bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +

-- 
With best wishes
Dmitry

