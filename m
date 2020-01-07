Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B238131F4E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgAGF2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:28:38 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:46991 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgAGF2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:28:38 -0500
Received: by mail-qv1-f66.google.com with SMTP id u1so19218087qvk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 21:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LrovKwm+jPRAKOqa0FyTlwwhDmCZ3Mza1hSSAiPcdyE=;
        b=MtqDiXAL12AeJPWBUKa0PuyE6cxZyNgdZBT8RetZ3anpcZjnYU2Z/vlfeOkWLoxQiW
         s5ydKbF6FWq0p3Z/mPVk5BBZEpn/k8brjogMHnHSJdOeb5wfGTFxl/hXoALIr1zXYI2n
         +NWOJ13qjrWEslS+XaPx44uskG7aNyUS8sU18GukZii808jjkdkv0hYtJl68/hQPK6/X
         9pijLCY6VczH3XtThl47JFuGuihn5YLowK8kOOxc2kMDItOOMM2Ec9HJPkX+rX65Ndor
         r6exxXB9Sh9o4RFpji5U0KYFoZPZb0CwQFXPJYYUy5gbVW4o1V3OHvsD3+BcLgEfGTep
         GppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LrovKwm+jPRAKOqa0FyTlwwhDmCZ3Mza1hSSAiPcdyE=;
        b=mFeJcD7Kotb9RLl+Sfgx2SkZU3BzwakWD6Swj7oEjA6fzrLTwQRy5KltKk+617pCvM
         vTVpPKXkZcsobg8+r3g3it6zpA+G/9gobpuYKW8+n27jH1H1J6d/yBltZIbYUpiA3PL0
         dSRyU/PCq3+D+ZC1uNimOi8Z5XKdkEvtcbDXKXWINYbszbPpB/r5NilMpmR3oc3da3L+
         768y0YUO/WVPfeHzkAJFoSmNxWdbUDKY328opAUkPnfRDIvbyOcBKtEyc3w7H/fFuQ1H
         ddmTw7RSHorv5gYSUEuKv5+bGCToooRaxEV4sD5+QUHlKevbb2eDY92+iAZMHyLxMDuK
         thkA==
X-Gm-Message-State: APjAAAVpkBJw1nbbfAEMne/IS3sgABuX9BucWprwi1OxFrknq8Gnfwlh
        kYi6SUmjmym2LSzkkixB80m7l6fSm8xfQs8HtILUHQ==
X-Google-Smtp-Source: APXvYqyJn9I0DKa741yo+rZndYTlijoLIkHjVG5v1f6oc56h+ugdyOL9zZuDDOwzy2oaNgIKBCAKbWDGORgiOE17Noo=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr81417595qvo.55.1578374916826;
 Mon, 06 Jan 2020 21:28:36 -0800 (PST)
MIME-Version: 1.0
References: <1578317369-16045-1-git-send-email-rkambl@codeaurora.org> <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 7 Jan 2020 10:58:25 +0530
Message-ID: <CAP245DVdrTyn_h=anra21Psfh5znxKSz-mGM5P72v4aJYTJUwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: tsens: Add configuration in yaml
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        sanm@codeaurora.org, sivaa@codeaurora.org, manaf@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 6, 2020 at 7:00 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Added configuration in dt-bindings for SC7180.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index eef13b9..c0ed030 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -38,6 +38,7 @@ properties:
>            - enum:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
> +              - qcom,sc7180-tsens
>                - qcom,sdm845-tsens
>            - const: qcom,tsens-v2
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
