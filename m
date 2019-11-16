Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9ADFF609
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 23:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfKPWZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Nov 2019 17:25:04 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44271 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbfKPWZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Nov 2019 17:25:04 -0500
Received: by mail-il1-f196.google.com with SMTP id i6so3054721ilr.11;
        Sat, 16 Nov 2019 14:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kr0PGCQy0Z97bgHM5LKSHLI8FBQC2icjFwrSq2WjiI=;
        b=mcXGJU44h2VhVUi44c0HCwkZowXeV+SUbiixMSGtj5F+6qlghGFT2Xq8YFIsBM3b6a
         NB2j5Nvgi1eWjexCryE5t7Z9PFBEjTZgRl7FpG0HVfliudk+t6skWdFnAPAgDsiXWMOD
         H0JdBXkeu00GGM50LQS1NVVKhOnWS8ae/Gv2n/g36A9sqRAsCeHL6fRqBVCZlqSnrUV8
         FulaYnkIh9Bwmvgv/5Tci63+PxwFdYSXlKyq8KcUkvFreu/o0zpqs8zePODC+D0CKMz9
         b5YR2yz9gcNrpO6d1aQ+a2KiiT3vYxwjF9WYOBnakvQ0HcBi4oDkRhiL6X57twKT33NO
         b7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kr0PGCQy0Z97bgHM5LKSHLI8FBQC2icjFwrSq2WjiI=;
        b=fhmey4iga4g1xYAGjSjmS6I2okPwVR2gdPCvewMhZ3ub8jiec3FPhA5/SiWl2nMpOx
         n8T5nwyc4wjmaxUUCo0382ZuGWoCuF0LaGE/ljLCySd50GUlIMk3eDwgiCL4X5wldyUU
         ZxEcbtlbH8H3J0hbs8dtjUcDwv7vB4lB0eVh6VqgQDEiMUum0VloN2Lv3R6NwF2Zsst1
         5WdN0WvmrCykEvoD1dbYZ3NGX9+6w+N/cU6TBCBeoI5GSQaPEmjEmya2MEScOZV4nzXD
         9W9vKvtBwc1Jd2/C4lQ0o1cKJtquuaFbOQKBKICpauLjiBU9CpkuNqlyKNrLm+rHgxFY
         xajw==
X-Gm-Message-State: APjAAAVUKRQxoeAzys7OO2Yyd+PgAJbS+qnjHlz7+QWWvq+W3AvUQxjL
        6rTnYEWQEShi+uvMeNbDCt7rX+r3nuPg7gWNQeg=
X-Google-Smtp-Source: APXvYqzPn3HQYK20FTVeH+W1yj1lPcrDj1BwE1CLbpmiUnRIY00feiJCzGRMO7t/qKoOnMNQwYe2938iUr38hcC/qto=
X-Received: by 2002:a05:6e02:c91:: with SMTP id b17mr7894961ile.33.1573943103501;
 Sat, 16 Nov 2019 14:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20191116064415.159899-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191116064415.159899-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sat, 16 Nov 2019 15:24:52 -0700
Message-ID: <CAOCk7Nov_HvZe1Z6COd2z=VUf=mVbvqS4wjqU4Ee=F1qR_KKww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 15, 2019 at 11:44 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The msm_serial driver uses a simple counter to determine which port to
> use when no alias is defined, but there's no logic to prevent this from

Which port to use for what, the default console?

> not colliding with what's defined by the aliases. As a result either
> none or all of the active msm_serial instances must be listed as
> aliases.
>
> Define blsp1_uart3 as "serial1" to mitigate this problem.
>
> Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

That driver behavior seems like a strange thing to be doing.

If you clarify the question above, -
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 5f101a20a20a..e08fcb426bbf 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -9,6 +9,7 @@
>  / {
>         aliases {
>                 serial0 = &blsp2_uart1;
> +               serial1 = &blsp1_uart3;
>         };
>
>         chosen {
> --
> 2.23.0
>
