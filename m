Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3C5146723
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgAWLpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:45:51 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:45971 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgAWLpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:45:51 -0500
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MrOq7-1jQft430v1-00oXw7; Thu, 23 Jan 2020 12:45:49 +0100
Received: by mail-qt1-f182.google.com with SMTP id v25so2172023qto.7;
        Thu, 23 Jan 2020 03:45:49 -0800 (PST)
X-Gm-Message-State: APjAAAUWtmJO49mDYvoeUf6WO6p3BIvA57+nxpE6wWtoiLF2pGAzAPM4
        Xmzc6s/tGIsXSPQGx0nYltuP91mjREeKP8huhwI=
X-Google-Smtp-Source: APXvYqxYu69axy0Bewc1SVBnWuSZtPZgssykBaJE3cPmA0cwybtu/U5OsB+bGh3Rj3Te6JVRFOoM+OOuH2eryzlCEdQ=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr15548731qtr.7.1579779948545;
 Thu, 23 Jan 2020 03:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org> <20200123111836.7414-17-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20200123111836.7414-17-manivannan.sadhasivam@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jan 2020 12:45:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3PKukf4K48T89v5R_eUAMuYhoULsF1noK2gzSDpi1qVg@mail.gmail.com>
Message-ID: <CAK8P3a3PKukf4K48T89v5R_eUAMuYhoULsF1noK2gzSDpi1qVg@mail.gmail.com>
Subject: Re: [PATCH 16/16] soc: qcom: Do not depend on ARCH_QCOM for QMI helpers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:drnzXxFqzCA0v3Z9j1+uqKH8+9u+OYJuS6+cG2SpKWhFPUUzQke
 zFdr71U0bVk6NR7X4GhvMBPuA5hAB2FLzeUqheD0IVPIDrKnMUG/xKwl2VlxiHUcYtwP3Sz
 Kvl+U+K5qO1TuGicIimRb1bwnTf3yIo1NuPYSksAulSe4SGPnZiSwK9Bo9F8NX3HQ7NEbiD
 apS2RH3w2sOI5QL13rPWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eNSsmYP/dAM=:5TlaWMR+JT6vEooaGM3TBn
 afIleCIAvJ6ff1Xpv5I34XRDk8BXVjkr171fhkJSrrwuj2GPK5cO+vZygAeBw7JytFWQBp+z7
 vCYBescbp0d2Khb5F4DHDtvQ30Eijlt0ZWoL0jciLwL8TtvaSnfp8sxn2QeeQa+iJE0UOXcRN
 d/q7ugQyGoDRESkKkZHpKdG/XWaQXCYnDEIBJ84lkCeP9yoZW7Vm5TcbhQntKybmQJinorBwE
 ovR4T7hWsfqDoVeqNMbwyckZYgO+5e52KIUGOcToR6e+982NmRJ0NqPJc2jQ6kPRRYF07TaNx
 cVtGv1Z7JyBdBUKPme/45GNfMR1+6aDsV5/+KDrY2Pdwt/z12sAaA5qwB938t2FfbrJ1cNA7o
 +1XdMdtKaY4XqQaenj1cKyIFkDiQGiI6GK8M6M85VsScCZUNzy3xCpcag44Ix32PqFglqVjLY
 dqnaUxkthiLCHI8YqXwOwKe3+L3/3yFOn/Hmo9OpFnYA7+B9dd/NJDcwb8obFt0wW6lw6lhhf
 S+Ttal1BsW1KMcQ+Ax/Zrba0t2GsSsF0xWslxpkhu5jNAuNAuh7vuw/mgJVwVZw8oqdqAB3R/
 O8PGzwcsstvFMeK2SKx6eq5CvKztCkxY/M07BZRo6e1ChvWy8X+L+hc/nthZTpjU4Ip9L1kpP
 NdrFV/Giu3EYvLuN+I6zUEDtaTXehX/MZ4tEA65rg1+vCwpd/EXoFReMJvy8uMhZqsqWZhlpe
 HsaAyWlSbXR3OsA3vZGpP12ygjMoYmbDYvyZrATMcZ2AXbgDGfjOM2sJsNO8uR2NMJTGLVwmB
 nuCxRfrwjuEVmOUt7Cf7GMqC3utAFEjddEiAkj8RZPxWfQb7F8=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> QMI helpers are not always used by Qualcomm platforms. One of the
> exceptions is the external modems available in near future. As a
> side effect of removing the dependency, it is also going to loose
> COMPILE_TEST build coverage.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79d826553ac8..ca057bc9aae6 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -88,7 +88,6 @@ config QCOM_PM
>
>  config QCOM_QMI_HELPERS
>         tristate
> -       depends on ARCH_QCOM || COMPILE_TEST
>         depends on NET

Should this be moved out of drivers/soc/ then?

        Arnd
