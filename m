Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D02429AB15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 12:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899537AbgJ0Lqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 07:46:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39161 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899480AbgJ0Lou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 07:44:50 -0400
Received: by mail-io1-f68.google.com with SMTP id p7so1155990ioo.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F0K2Mt0cLswR12jsU6gnevEK6yDw/vw4uHmBGVB802s=;
        b=qyBy7eUmjpEsh3fvokoKwKjVV7MbxuJ0n0N7eZjugv6g4aH1ZSUUsEeECWFZBiMpHO
         4KMUhqSbhj0eTzv4kgd88rZvLpNFsojoOUvOBaGh7Q3ASh3UOSxY8GDrvrxGp6WNAc/M
         s6Rv77OELbUEeYJRzmUmi8e08nNBc2VYi9Wz0GXXgtgvLxR/UnKIPy4qU2V6Ej9ouzHt
         GUvbAU91YROSYag2tQDIVRDRwLPS8e2dTEuC3W6eCf9+8be4J441VZYeF604CbvXh8dd
         7u0fXkx82xbtPqgiNjguP8yJMA0qLuhHvAM/SlMIzg24RpPGc35C/GoIo24a8UkIurUI
         yMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F0K2Mt0cLswR12jsU6gnevEK6yDw/vw4uHmBGVB802s=;
        b=GcT4ZPcUoMg2W9YNZyw4s+0PF3x5lccguqfdBqp+HeeOcM25vIUyJuxLLNclg3GqV8
         vnSGoGlQxZp6LxTGIR6b90I9+BqGlDdqYCN/oqY/e4VlIN+GRwYK6QBBSZ8CvY9c5/N+
         6nS+kzjtGEOZlqQ7Rra09iN7XVO29Txrwmu2DEVnKO9BNgvLHsK/iJy3RHc+NYmJ8poq
         LUm+M5atlZm6Od2l80txqnkY6ZyYf10QRtBDv4ZvMqb7DKjTGSzP4w2Sqd9ZDMHKW7/X
         Z5QimdC72t5is/jUYKAXWuuQJAMzCxV53Bbp3cwU5yeW1dkYSi7SIA7PZroTeyheWGKC
         eq6Q==
X-Gm-Message-State: AOAM530qt9maCaNrBQiafMyqJ9E4d0R676Ls3arBedw41htTADBdDCcv
        RNEHEQ7gV7A5mPIvlxJH5YUat9bXc5bLOwcSmZlUAw==
X-Google-Smtp-Source: ABdhPJyzoSl9IkDPIXH0U3eudbApcTKUl9+IAmZSejsMQH/+IRauAmqD1yhE5unMri2eA+DrrSOV4+XlFhSNFgJAbU8=
X-Received: by 2002:a02:c785:: with SMTP id n5mr1891204jao.128.1603799088366;
 Tue, 27 Oct 2020 04:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201027111422.4008114-1-anders.roxell@linaro.org>
In-Reply-To: <20201027111422.4008114-1-anders.roxell@linaro.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 27 Oct 2020 17:14:37 +0530
Message-ID: <CA+G9fYuk57Ys8jVS7Ue7fPc2jd8fTBPY-ZvAixDvpgy3+H9hHA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: QCOM_RPMH fix build with modular QCOM_RPMH
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Oct 2020 at 16:45, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building allmodconfig leading to the following link error with
> CONFIG_QCOM_RPMH=y and CONFIG_QCOM_COMMAND_DB=m:
>
> aarch64-linux-gnu-ld: drivers/clk/qcom/clk-rpmh.o: in function `clk_rpmh_probe':
>   drivers/clk/qcom/clk-rpmh.c:474: undefined reference to `cmd_db_read_addr'
>   drivers/clk/qcom/clk-rpmh.c:474:(.text+0x254): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `cmd_db_read_addr'
>
> Fix this by adding a Kconfig depenency and forcing QCOM_RPMH to be a
> module when QCOM_COMMAND_DB is a module. Also removing the dependency on
> 'ARCH_QCOM || COMPILE_TEST' since that is already a dependency for
> QCOM_COMMAND_DB.
>
> Fixes: 778279f4f5e4 ("soc: qcom: cmd-db: allow loading as a module")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

This patch fixed the arm64 build error.

> ---
>  drivers/soc/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 9b4ae9c16ba7..3bdd1604f78f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -109,7 +109,7 @@ config QCOM_RMTFS_MEM
>
>  config QCOM_RPMH
>         tristate "Qualcomm RPM-Hardened (RPMH) Communication"
> -       depends on ARCH_QCOM || COMPILE_TEST
> +       depends on QCOM_COMMAND_DB
>         help
>           Support for communication with the hardened-RPM blocks in
>           Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an


Build error noticed on linux next 20201027 tag.

 LD      .tmp_vmlinux.kallsyms1
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/clk/qcom/clk-rpmh.o: in function `clk_rpmh_probe':
/home/naresh/kernel/next/linux-next/drivers/clk/qcom/clk-rpmh.c:474:
undefined reference to `cmd_db_read_addr'
aarch64-linux-gnu-ld:
/home/naresh/kernel/next/linux-next/drivers/clk/qcom/clk-rpmh.c:481:
undefined reference to `cmd_db_read_aux_data'
aarch64-linux-gnu-ld: drivers/soc/qcom/rpmh-rsc.o: in function `rpmh_rsc_probe':
/home/naresh/kernel/next/linux-next/drivers/soc/qcom/rpmh-rsc.c:948:
undefined reference to `cmd_db_ready'
aarch64-linux-gnu-ld: drivers/regulator/qcom-rpmh-regulator.o: in
function `rpmh_regulator_init_vreg':
/home/naresh/kernel/next/linux-next/drivers/regulator/qcom-rpmh-regulator.c:438:
undefined reference to `cmd_db_read_addr'
make: *** [Makefile:1164: vmlinux] Error 1

- Naresh
