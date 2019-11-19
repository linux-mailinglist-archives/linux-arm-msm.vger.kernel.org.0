Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D2C102836
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 16:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfKSPiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 10:38:10 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35509 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfKSPiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 10:38:09 -0500
Received: by mail-io1-f65.google.com with SMTP id x21so23715846ior.2;
        Tue, 19 Nov 2019 07:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aA8kllhbmf7SaJ49Rl3eadbxFpnLArVBB5k6qFkePI=;
        b=tgR7O9KctrJr2cHitt43wLn244YdnM8UGcA97A4tnRg3Cr+V+h0xdvnoOj5dFMlwlH
         eGY6BbfHF7EDq2cCEvIlbtvMAyrzmMrIxPRKxv5bHgqiIO/eQuEv5HZyqKJJoK34XeUk
         RGoZRAk1koI1ij5Q3fxClec4Qy0xJaz6JIc50CIYsDA0Cu2sfRQZN0JVYSAjELI0rirT
         CzUx/vTlgtIW0QPJmb0XMofbWK2/ncYbwedDDpowhoKEuhjZdN1vb5dtP30UY7IBrk2p
         3wFjFzK6IqZiis2j2242TU+TYblUFupQfgOyvD8GZ66n0YSlzzG/apFDgxgbvZJK8PhD
         pp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+aA8kllhbmf7SaJ49Rl3eadbxFpnLArVBB5k6qFkePI=;
        b=MMuq6dSk8w4oVUHxzY7UsJVkSAWBDrZYy2TBcRGhQkcPLPhsowRz4jY0LxhVyQ24/q
         CPBoqPHW34ij+L7uwSXQnmjEmi3J6xleuKSD/uK+jsfUbGOQ8COvhVIBEpm/ToysBQOr
         YeBlGLNfqX7XLGTxrkH02mJtBSTCjL1/EP2/PU/pCkwv0gBojFkde6TCsaqqbXPmY38j
         vIpDHIkYgioDZxyurnULZLp8iGhM1KTDipTJdmtNuPAHogGFAbknta0j9NOKx0sNoybx
         PQujzz5dy3B+tiYFO9tNkJOtEZtTL6g8ZgLkcGTmzD9+g4TTcAeGBLOSSlB7RBbFobVJ
         Zlhw==
X-Gm-Message-State: APjAAAVyLipIncEfvpjLp53lFM4a9s0jil9l1nKLPNtngqw3D/GUMdLx
        Z87CZHyR6C9yHnDE2+JxvI4vx7L8pyPr+f1HK/Q=
X-Google-Smtp-Source: APXvYqwAFFo0t0y1g8caum4zUH2fgSu3r8rkRHLGEpTBTxhzhQB12bzMfxB4EzLgHiS+gW+7Bos6JSbmeo7zNxl/F+o=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr13839903iop.33.1574177889000;
 Tue, 19 Nov 2019 07:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20191119011823.379100-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191119011823.379100-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 19 Nov 2019 08:37:58 -0700
Message-ID: <CAOCk7NrvmVFu5PgQsaDJO69kpMAzWdV9DCiGrtQyQRFf6xX5Nw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
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

On Mon, Nov 18, 2019 at 6:18 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The msm_serial driver has a predefined set of uart ports defined, which
> is allocated either by reading aliases or if no match is found a simple
> counter, starting at index 0. But there's no logic in place to prevent
> these two allocation mechanism from colliding. As a result either none
> or all of the active msm_serial instances must be listed as aliases.
>
> Define blsp1_uart3 as "serial1" to mitigate this problem.
>
> Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Seems good to me.

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>
> Changes since v1:
> - Rewrote commit message
>
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
