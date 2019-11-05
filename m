Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E045AEF34B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 03:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbfKECOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 21:14:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57628 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfKECOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 21:14:49 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AA64960D85; Tue,  5 Nov 2019 02:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572920087;
        bh=0uidgkLkU8pB/hQcd5eELhl2vlQ93A/xAt8T1/nz1HM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ndPLVpqwIejr4mWK+39aBDHCZ+ckhTJ9vPysEZEfjNuRQ6j07dP7Kf6Ci5XP+YmZD
         owiFjDzzxe1/ZeUqKM/m0+kEGfiCRo0rrDdZk0UOZxVexiTbuyGgX/ApZ7zNTn6chG
         brSPHOk/VbeZbCz8le4EtVR01dft5qi/uJI6w/Fw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 7903C60D61;
        Tue,  5 Nov 2019 02:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572920082;
        bh=0uidgkLkU8pB/hQcd5eELhl2vlQ93A/xAt8T1/nz1HM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GOiVsOwt7S/mDZ4dtWHF+KL+Myp7znhfio9X8xMqyWxxcgjkhEK8cT4E8/aSJbuWf
         Lg7bC4s1PEFfIfHg7LV/A68oFRJgveBqEQpnTievgA7TCnU6ILn4wi/67nUiNjIAGA
         bdq/kZ5O0+8kyCu8YAxM0r2bm1JiHZwKJsTVuGvs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Nov 2019 07:44:42 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Elliot Berman <eberman@codeaurora.org>, swboyd@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] Restructure, improve target support for qcom_scm
 driver
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Message-ID: <c608454385b38703be0888b60aa915a8@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-05 06:57, Elliot Berman wrote:
> This series improves support for 32-bit Qualcomm targets on qcom_scm 
> driver.
> 
> Currently, the qcom_scm driver supports only 64-bit Qualcomm targets 
> and very
> old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
> Convention to communicate with secure world. Older 32-bit targets use a
> "buffer-based" legacy approach for communicating with secure world (as
> implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM 
> SMCCC.
> Currently, SMCCC-based communication is enabled only on ARM64 config 
> and
> buffer-based communication only on ARM config. This patch-series 
> combines SMCCC
> and legacy conventions and selects the correct convention by querying 
> the secure
> world [1].
> 
> We decided to take the opportunity as well to clean up the driver 
> rather than
> try to patch together qcom_scm-32 and qcom_scm-64.
> 
> Patches 1-4 improve macro names, reorder macros/functions, and prune 
> unused
>             macros/functions. No functional changes were introduced.
> Patches 5-9 clears up the SCM abstraction in qcom_scm-64.
> Patches 10-14 clears up the SCM abstraction in qcom_scm-32.
> Patches 9 and 15-16 enable dynamically using the different calling 
> conventions.
> 
> This series is based on 
> https://lore.kernel.org/patchwork/cover/1129991/
> 
> [1]:
> https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n555
> 
> Changes since RFC:
>  - Fixed missing return values in qcom_scm_call_smccc
>  - Fixed order of arguments in qcom_scm_set_warm_boot_addr
>  - Adjusted logic of SMC convention to properly support older QCOM 
> secure worlds
>  - Boot tested on IFC6410 based on linaro kernel tag:
>    debian-qcom-dragonboard410c-18.01 (which does basic verification of 
> legacy
>    SCM calls: at least warm_boot_addr, cold_boot_addr, and power_down)
> 
> Elliot Berman (17):
>   firmware: qcom_scm: Rename macros and structures
>   firmware: qcom_scm: Apply consistent naming scheme to command IDs
>   firmware: qcom_scm: Order functions, definitions by service/command
>   firmware: qcom_scm: Remove unused qcom_scm_get_version
>   firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
>   firmware: qcom_scm-64: Add SCM results to descriptor
>   firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc
>   firmware: qcom_scm-64: Move SMC register filling to
>     qcom_scm_call_smccc
>   firmware: qcom_scm-64: Improve SMC convention detection
>   firmware: qcom_scm-32: Use SMC arch wrappers
>   firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
>   firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
>   firmware: qcom_scm-32: Create common legacy atomic call
>   firmware: qcom_scm-32: Add device argument to atomic calls
>   firmware: qcom_scm: Merge legacy and SMCCC conventions
>   firmware: qcom_scm: Enable legacy calling convention in qcom_scm-64.c
>   firmware: qcom_scm: Rename -64 -> -smc, remove -32
> 
>  drivers/firmware/Kconfig        |  18 +-
>  drivers/firmware/Makefile       |   4 +-
>  drivers/firmware/qcom_scm-32.c  | 621 --------------------------
>  drivers/firmware/qcom_scm-64.c  | 567 ------------------------
>  drivers/firmware/qcom_scm-smc.c | 949 
> ++++++++++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.c     | 235 +++++-----
>  drivers/firmware/qcom_scm.h     | 115 +++--
>  include/linux/qcom_scm.h        |  72 +--
>  8 files changed, 1169 insertions(+), 1412 deletions(-)
>  delete mode 100644 drivers/firmware/qcom_scm-32.c
>  delete mode 100644 drivers/firmware/qcom_scm-64.c
>  create mode 100644 drivers/firmware/qcom_scm-smc.c

++Stephen

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
