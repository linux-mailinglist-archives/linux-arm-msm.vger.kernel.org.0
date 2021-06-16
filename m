Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31173A8EEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 04:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhFPCnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 22:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhFPCnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 22:43:16 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42C1C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 19:41:10 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so1042682oti.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 19:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EshI4bqUmVEEVExJ3gYsyYNGmN9qxTZS5ZH9Au0ZZBk=;
        b=FvgPOO/8K5n0Tjoh9uyvTZcOt0KuWABO3NhaL28k8BEqk4abCVsh92cgSWj5NxP/rl
         1Iikzrz1ISMhziCn8EktMFMwgrsuhXR7vDY+jrlYpbOLaeWXu25ZQDl1OyEU0zl9YwyZ
         /3t6QhxirA1BM7r+v+nbFTMQsZ4HHSMSMDQmtQBK3eVlL5WeJPp61Rc+YOqBdnEL5bT/
         8CW87gAhu2Adi3CPATDCo5ZPYdNS+SRwcmHCdw9Trw3y2d3Y5j2LLMrJapmUH43kuM+2
         WGh4xTK++5qp3qQWmaCEjKJBso0evB+nlKQ3JsZ1icqDewitbOGfTHLuNrKXahL/a4zK
         V3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EshI4bqUmVEEVExJ3gYsyYNGmN9qxTZS5ZH9Au0ZZBk=;
        b=SlbgD64dim9XKWhhSmAfGrjpIbwMRHIBDCYYOIxvzUg1k2hYEpS5ungzYVl2FIgQQW
         c2f0/z6+p6+y+Fk3NDPFjfhZweC+M0JzV67UD/G0JjBKF4R/fPGesNfE5g3QvZDzatSy
         2X55nKbATUiJCHVIDRXfBykK2tAqobx8yyc05Im0JNBpI9PwwriBwuwQK17ARe9B9eWa
         o0Y+qIsaE9W4YgoGcH/qXyATMV6Mm7eApSdt4xD243nC4qvOT/E3L4+km3LERpDMeBET
         W2gN7sd9qrchCDnya1ijEK8Av8VomXkGMqZIJa7BFkgb3YMsVpna0FLK9jcvKPg5iTo2
         vr5g==
X-Gm-Message-State: AOAM533hmQ7E20dh4hIdCjV9IHJkQU2fFrdWdYWPZcB/dGViWnRiCy4r
        Hx2V9WS1TBKsAO1gWW67oIV64A==
X-Google-Smtp-Source: ABdhPJwZPDMUicit3JzJiXztmJBMurEJw3kguVXDbZRwZyl5PAGCtTxv4Hnd0VuvGSWyp0Dn/fFXPQ==
X-Received: by 2002:a9d:5d11:: with SMTP id b17mr1963880oti.216.1623811270208;
        Tue, 15 Jun 2021 19:41:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e23sm209800otk.67.2021.06.15.19.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 19:41:09 -0700 (PDT)
Date:   Tue, 15 Jun 2021 21:41:07 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: Commonize PCIe pins
Message-ID: <YMlkwzxR20p7GI7g@builder.lan>
References: <20210616005843.79579-1-konrad.dybcio@somainline.org>
 <20210616005843.79579-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616005843.79579-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Jun 19:58 CDT 2021, Konrad Dybcio wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
[..]
> @@ -3490,6 +3508,89 @@ data {
>  					bias-pull-up;
>  				};
>  			};
> +
> +			pcie0_default_state: pcie0-default {

I thought I answered the other way around (that it should be in the
board file), that said I don't think these are moving much, so I'm not
against keeping them here.

> +				pcie0_perst_default: perst {
> +					pins = "gpio79";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				clkreq {
> +					pins = "gpio80";
> +					function = "pci_e0";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				wake {
> +					pins = "gpio81";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
[..]
> +
> +			mdm2ap_default: mdm2ap-default {

These however are presumably only present on devices with SDX55, so
please move these two to your board file.

Thanks,
Bjorn
