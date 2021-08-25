Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86FD3F777F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 16:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241755AbhHYOfU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 10:35:20 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7362 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232168AbhHYOfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 10:35:19 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17PDhOum003655;
        Wed, 25 Aug 2021 16:34:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=uB5VgDvAvQ72i1SM94ZVMnpWG1uPhE/nxCUf1gUKsDM=;
 b=J8/nsnlyrDt5jpFg+8ufKUpDe6dVqgJmzghbCCt+7/M/+I3kVGJCgbzgdP3TQZCjIOTe
 iWbxcWomfrrB10/SNyFZTN1CM6gGvvVUDK5QtgRueMmhZnJIedm+5AVnYPd+Nlv1kono
 MUbyH1DR3gCN6eP+mU/cbblmM8l5F+Oxg1IUTlE7N8wi+DTA6ewIA+82kIMzO4+KKv76
 9dxXrNsvU+WNHO0uqnXDhqyRYxo6MeCE+1ObFqDjvqAleK0tWd86Y5U7APjKMOvX3Xhn
 C3f7JdvJgVPaALaIESNwEYpJClgEYYakEtGyDlmOAtlDSPv7nhgLs/3HfZnrhOe61voI Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3ana52vvwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Aug 2021 16:34:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00AD910002A;
        Wed, 25 Aug 2021 16:34:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C47FC25F3F3;
        Wed, 25 Aug 2021 16:34:11 +0200 (CEST)
Received: from lmecxl0504.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 16:34:10 +0200
From:   Yann Gautier <yann.gautier@foss.st.com>
Subject: Question about MMC_PM_KEEP_POWER in MMCI driver
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
Message-ID: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
Date:   Wed, 25 Aug 2021 16:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_06,2021-08-25_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

In drivers/mmc/host/mmci.c, MMC_PM_KEEP_POWER is unconditionally enabled.
This prevents correct low-power sequence on STM32MP157C-DK2 board which 
embeds a Wifi chip brcm,bcm4329-fmac (this wifi part has not yet been 
sent upstream).

This MMC_PM_KEEP_POWER can be taken from DT with the property 
keep-power-in-suspend. This is what is done for other MMC drivers.

I wonder what should be the best solution for this.

1) Remove MMC_PM_KEEP_POWER from the driver, and modify all SoC device 
tree files embedding a arm,pl18x with adding keep-power-in-suspend; 
property (except stm32mp151.dtsi file).
This can be easy to do (~10 files to modify). But that could be more 
board dependent, if an SDIO chip is plugged on this MMC IP.
And the name keep-power-in-suspend can be misleading as it only applies 
to SDIO.

2) Remove MMC_PM_KEEP_POWER from the driver, and modify board DT files 
with the property. This could be a difficult task to find all those 
boards. And this should be applied only for SDIO configs.

3) Just modify the driver to apply this capability for all MMCI chips 
but STM32. This could be done in the dedicated file, in 
sdmmc_variant_init() function. But some boards based on STM32MP15 chip 
might want to keep this capability.

All advice is welcome.


Thanks,
Yann
