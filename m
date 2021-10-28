Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AA343E5AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhJ1QDf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:03:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhJ1QDd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:03:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5C16610E5;
        Thu, 28 Oct 2021 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635436865;
        bh=xeAzej3Fsyu5AFhb9nTdF5rn3u4z1benrj68KSun2pg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JTwfp+3DCx19RQk3AuNEXyVA8xXZ77rPxXvyPey4HtJVDu1o00WaKoNmMf7os7RLM
         MbEzgNZheigKtnA2l5mEV02bE/EOr5UeOyo1Fl1cvAhuRGUC+7bCk7sri+X2Uqsc8e
         gEe6rXufB91aT3Uv5bJjW3UFxalkmHE6oVxKNeo4ACB0OLsQgU915VQMDwIJICxqKz
         qHdl339+LiFa6gimVrBApY8z9BONHUr7N8tGREs6Ld0EimwlZNsCbHiCPznAhllAHc
         lHEd7ptuLOft4KXb42fAoaRdcuUCDzQnbDml6eRWwV+x6vOFYa9jVnpDQoMD+ocrvc
         G72VdvBbIClqA==
Received: by mail-ed1-f45.google.com with SMTP id 5so26113403edw.7;
        Thu, 28 Oct 2021 09:01:05 -0700 (PDT)
X-Gm-Message-State: AOAM532fLDAGpuQHg+C/8mpJVRXrlsRkrIiPMTRSKD4HkhXZbtzpKnI2
        tSdMfH/L89a0Nc2/L+Fz3BYqTrXa5wW8g1SHjg==
X-Google-Smtp-Source: ABdhPJzho79HGh6gdpx5ZhYrIp8wOV2w/u+agaP+cBRGszdSafDjrH1NJeojMR2xVujT0JTaMBr6DSCLqw2u5GrJ5Jc=
X-Received: by 2002:a05:6402:643:: with SMTP id u3mr7295782edx.164.1635436864307;
 Thu, 28 Oct 2021 09:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 28 Oct 2021 11:00:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKoBFwiEOXZ-G3ZB-wnSHVm4B48wuZe25zE=KU5ct=H6A@mail.gmail.com>
Message-ID: <CAL_JsqKoBFwiEOXZ-G3ZB-wnSHVm4B48wuZe25zE=KU5ct=H6A@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add pm8150b TPCM driver
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 8:32 AM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> V2:
>
> Guenter Roeck's review
> - Converts suggested qcom_pmic_tcpm_core.c into one-liners
>
> - Adds comment on how polarity is set in set_polarity()
>
> - Removes optional set_current_limit()
>
> - regmap_read/regmap_write
>   Reviwing other pm8150b/spmi drivers I then added in checks for all
>   reamap_read()/regmap_write() calls.
>
> - Fixes (type == TCPC_TX_CABLE_RESET || TCPC_TX_HARD_RESET)
>   thanks I definitely had the blinkers on there and didn't see that at all
>
> - qcom_pmic_tcpm_pdphy_pd_transmit_payload()
>   Treats regmap_read and read value as separate error paths
>
> - qcom_pmic_tcpm_pdphy_set_pd_rx()
>   Replaces boolean if/else with !on as suggested
>
> - Returns -ENODEV not -EINVAL on dev_get_regmap() error
>
> - qcom_pmic_tcpm_pdphy_pd_receive()
>   Guenter asks: "No error return ?"
>   bod: No we are inside an ISR here if we read data we pass that off to TCPM
>        if somehow we don't read the data - it is "junk" there's no value IMO
>        in pushing an error upwards back to the handler.
>
> Heikki Krogerus' review
> - Includes Makefile I missed adding to my git index
>
> - Removes old Kconfig entry for remove driver
>
> Randy Dunlap's review
> - Rewords drivers/usb/typec/tcpm/Kconfig
>
> - Drops tautology "aggregates togther"
>
> - Corrects spelling typos
>
> BOD's own review
> - Drops redundant include of regmap.h in qcom_pmic_tcpm_core.c
>
> - Propogates qcom_pmic_tcpm_pdphy_disable() error upwards
>
> - Propogates pmic_pdphy_reset() error upwards
>
> - Drops error prints in qcom_pmic_tcpm_pdphy_pd_transmit_payload()
>   I had these in-place during development and don't recall them being
>   triggered even once, they are redundant, remove.
>
> Differences between the two can be seen by
> git diff usb-next-27-10-21-pm8150b-tcpm-v2..usb-next-25-10-21-pm8150b-tcpm -- drivers/usb/typec/tcpm
>
> Latest bootable series can be found here:
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-27-10-21-pm8150b-tcpm-v2
>
> Previous set:
> Link: https://lore.kernel.org/all/20211025150906.176686-1-bryan.odonoghue@linaro.org/T/#t
>
> V1:
> This series adds a set of yaml and a driver to bind together the type-c and
> pdphy silicon in qcom's pm8150b block as a Linux type-c port manager.
>
> As part of that we retire the existing qcom-pmic-typec driver and fully
> replicate its functionality inside of the new block with the additional
> pdphy stuff along with it.
>
> An additional series will follow this one for the SoC and RB5 dtsi and dts
> respectively.
>
> A bootable series can be found here
>
> Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-25-10-21-pm8150b-tcpm
>
> Bryan O'Donoghue (7):
>   dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
>   dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
>   dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
>   dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
>   dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema

Send to DT list please.

>   usb: typec: qcom: Remove standalone qcom pm8150b typec driver
>   usb: typec: qcom: Add a pm8150b TCPM driver
