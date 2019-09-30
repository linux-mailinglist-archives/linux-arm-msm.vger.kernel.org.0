Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7A1C1EE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2019 12:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730332AbfI3KZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Sep 2019 06:25:49 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42173 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbfI3KZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Sep 2019 06:25:49 -0400
Received: by mail-qt1-f194.google.com with SMTP id w14so16252157qto.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2019 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O1z93OtgR7VdxVIjNkCEUsK+ccpKeXdZBlp96khKUcs=;
        b=ddOFZcdvsp2geREFUxi3qF551h7DgnD+h69CdWBKzV3GhbxYdtGmvNV/namvlcZDIM
         Iba5qmKMfTz5swc0/CpILi3+oAZEyIHfTFQeY5gHAedvCCfG6pbEaGdVRkAfp4MalIfK
         5B/QlcH4b3OvHaHrjdL6xCoYwyNSO2/DJb6VsbxHOFR9GA8MtiukHCyylRsfur5cJVMO
         +GEF8ZoBzol6Yvhzh7CWntYRemHpnH0EwbwPTp6x1OX5M26cMTvm5doQviGf+da/I8Pa
         I09/etjEKyWXjAqjFmYpBSM/Lwv/T4P6SqWp1dSu80psYfhPZQWn2WoYZFuJrvlb6f0t
         x1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O1z93OtgR7VdxVIjNkCEUsK+ccpKeXdZBlp96khKUcs=;
        b=X46JhQzETzztSbRYhFEtA1nB0AnnWU7GNxrL3Owo3I/PfCcSr6r3k5Y2bpFu1dc4gb
         5A3hlBtoOOxKCm0hAcs+Vkam26oSihymbCO7gPn8dAc76PMIeuo/c0QIVEq7nKV7PSPm
         mpFE6gYKRXjRUK+CYjseeRAOboiShp1anmStPnckq+lkMFD4BoNig3toVjDHZLoltUoC
         kLldXlvCtxQIMDr4NmsBq4pPquICT8eEOnBT/Qj8/rapdLSAdEPxNZIKBWu+eJMIEaLx
         VtiSvxbRdTK7mvuVMOnIk5mFIG464ISlqC5F3ZQTnYXpo2sZU/GZ3h2NH5wqtKcm3tKi
         Ssdw==
X-Gm-Message-State: APjAAAWACM98mPLmbXGcg4BXYQRI/hRFMNYi8nSlJ9rpx6P5rH/+6bsw
        7SQZtgJ25LzLvIdfZz2wTAxdTIORV0hnpD6rfm/caw==
X-Google-Smtp-Source: APXvYqwer/T5wi3g8dz5z+0OR5oh75h5Jpr5lyLzUmj1D8xOHIRMsTpiee3XcZGB/26516Iy76/6kvqnQmR0Id0KjG8=
X-Received: by 2002:ad4:44e2:: with SMTP id p2mr19341410qvt.126.1569839147964;
 Mon, 30 Sep 2019 03:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101740.430-1-kholk11@gmail.com> <20190921101740.430-3-kholk11@gmail.com>
In-Reply-To: <20190921101740.430-3-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 30 Sep 2019 15:55:37 +0530
Message-ID: <CAP245DU6tjtYyPhA5cDmXCwr-mMH9m+4HcWOHagTdRWWgJsjpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt: thermal: tsens: Document compatible for MSM8956
 and MSM8976
To:     kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 21, 2019 at 3:47 PM <kholk11@gmail.com> wrote:
>
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Support for MSM8976 and MSM8956 (having tsens ip version 1) has
> been added to the qcom tsens driver: document the addition here.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 1 +

Thanks for the patch. We're switching to yaml bindings that were
reviewed here[1]. Could you please resend on top of this?

[1] https://lore.kernel.org/linux-arm-msm/805a2ae9c95f41dc733ccc80346941998e1b230c.1569015835.git.amit.kucheria@linaro.org/

>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> index 673cc1831ee9..91a8c5666638 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> @@ -6,6 +6,7 @@ Required properties:
>      - "qcom,msm8916-tsens" (MSM8916)
>      - "qcom,msm8974-tsens" (MSM8974)
>      - "qcom,msm8996-tsens" (MSM8996)
> +    - "qcom,msm8976-tsens", "qcom,tsens-v1" (MSM8956/MSM8976)
>      - "qcom,qcs404-tsens", "qcom,tsens-v1" (QCS404)
>      - "qcom,msm8998-tsens", "qcom,tsens-v2" (MSM8998)
>      - "qcom,sdm845-tsens", "qcom,tsens-v2" (SDM845)
> --
> 2.21.0
>
