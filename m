Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9927839DBC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhFGLzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:55:31 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:21260 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhFGLzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:55:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623066805; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WDvHeVyb1fam9A3ae3q/u569ggyW5HiqX3vtxT7wXDVH/euXB0sggAHxARI1WTnk2K
    9nUzJVMDF8HRXWe4cnLBdAaf21A9HJaHxvoPvwt51JrPM8WtHaQQ9rNk7hk2Bm/2EaYb
    tr9jTi1GXhk/Rz08gaJnqSClff/QN3I5AJWhD7wH3VT1DUmC96NVe21h36alC4Aki3hP
    zaPrAe/wk/JcVg8QOpqx75Y4vW6W/42XkXLwAYHE/UYxIiAeNya+2UPpKy/F+6QlUZnD
    sAGS4Mdq2r+AQntk0TVa/IN8Jq+wytrvA1BFvEuAqz5o3OT43TKSyTSyNc4PB6DYqD01
    VxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623066805;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=m4+ki6pyAeRftYCv5yy/aXH3P2NWvcn1Xj3msV73uKI=;
    b=hYbWEVrWSwTJLx4WgcLTSNf7Q/UnEBLyjxZYeZ3nFcr3O0B7xhH1h1oO6Tv3e2o3rL
    tFrX2k66X+K7NMDZeA6OJyMFuh1yLrcCX27A8xlfc6U7KcX6QKLOT3j2cz/7+fC92ajf
    R1uRPBOGgg07WTGTAzCibdthM0R73qhB6jJX8tbqe+aN4xyvuz/Ogjs8k9oe2Et87QYV
    Be9cOMplPONEYpo3Xxl6/DwO2JhoHaPg+HZkSTY71f5Jrs/LuFhXqNJRnonHGJfqxRlX
    oP1Jhvl/deWNjS32GlukMJuwpqGr6oQOhy7YGQ9vhdODSvAb0Iqaar8FUUK3TtL15l2K
    Sdmw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623066805;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=m4+ki6pyAeRftYCv5yy/aXH3P2NWvcn1Xj3msV73uKI=;
    b=Qbwc4gjI0Wsa5klcF6JKzgwpkayOFPvNxGIBWzglD1Mxm783HpVO5F7szx8L3LCQkI
    eGcISosEQjUxYvfnFquPFjj4vNrrFUja2RO4OxGjVjxOtpVFKydo/uv1I0Vr9iver1zz
    /P0wdJv7OyOgquIayhl7mjGTaodn5lWzGyXKeb0mZkCE73xOZwsFsYlaNKxWSRq/se6o
    97iUodoh6XX00BPN3R+zpAXdjct5LovoJhqhABAgSkjWsMqnDY40rZK9g0BWnJWk5Ccm
    fpoOUh2tn3WGnCNvQhljBXDxyE376y9R53phuOrOR+llp/LNH6pkwKLftnSslFMl6ZQO
    7oNA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/BBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x57BrPUIE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 7 Jun 2021 13:53:25 +0200 (CEST)
Date:   Mon, 7 Jun 2021 13:53:23 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, He Ying <heying24@huawei.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] cpuidle: ARM_QCOM_SPM_CPUIDLE should depend on
 HAVE_ARM_SMCCC
Message-ID: <YL4Is1LNzBuViF3/@gerhold.net>
References: <20210606190048.689-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606190048.689-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

On Sun, Jun 06, 2021 at 12:00:48PM -0700, Randy Dunlap wrote:
> QCOM_SCM depends on HAVE_ARM_SMCCC, so ARM_QCOM_SPM_CPUIDLE should
> also depend on HAVE_ARM_SMCCC since 'select' does not follow any
> dependency chains.
> 
> This fixes a kconfig warning and subsequent build errors:
> 
> WARNING: unmet direct dependencies detected for QCOM_SCM
>   Depends on [n]: (ARM [=y] || ARM64) && HAVE_ARM_SMCCC [=n]
>   Selected by [y]:
>   - ARM_QCOM_SPM_CPUIDLE [=y] && CPU_IDLE [=y] && (ARM [=y] || ARM64) && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && !ARM64 && MMU [=y]
> 
> arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-smc.o: in function `__scm_smc_do_quirk':
> qcom_scm-smc.c:(.text+0x5c): undefined reference to `__arm_smccc_smc'
> arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `scm_legacy_call':
> qcom_scm-legacy.c:(.text+0x140): undefined reference to `__arm_smccc_smc'
> arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `scm_legacy_call_atomic':
> qcom_scm-legacy.c:(.text+0x364): undefined reference to `__arm_smccc_smc'
> 
> Fixes: a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic CPUidle driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: He Ying <heying24@huawei.com>

There was a similar patch from Arnd a while ago (which fixes another
warning for ARM_CPU_SUSPEND?):

https://lore.kernel.org/linux-pm/20210421135723.3601743-1-arnd@kernel.org/

I'm not sure who is supposed to pick it up. :)

Thanks!
Stephan

> ---
>  drivers/cpuidle/Kconfig.arm |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20210604.orig/drivers/cpuidle/Kconfig.arm
> +++ linux-next-20210604/drivers/cpuidle/Kconfig.arm
> @@ -108,6 +108,7 @@ config ARM_TEGRA_CPUIDLE
>  config ARM_QCOM_SPM_CPUIDLE
>  	bool "CPU Idle Driver for Qualcomm Subsystem Power Manager (SPM)"
>  	depends on (ARCH_QCOM || COMPILE_TEST) && !ARM64 && MMU
> +	depends on HAVE_ARM_SMCCC
>  	select ARM_CPU_SUSPEND
>  	select CPU_IDLE_MULTIPLE_DRIVERS
>  	select DT_IDLE_STATES
