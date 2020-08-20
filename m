Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FE624B01A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 09:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgHTH0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 03:26:02 -0400
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com ([40.107.94.64]:35137
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbgHTHZ7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 03:25:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcAVLu2rbPYQPmVBEgehVBFPwVvJMVLRC8OLuyO4CsXd861S6dFiEfY012F96CMfpqk7tuPpS4iYJhwqVgnJ9cxR5OSZrekSd9eexi6nJz4CsBOlLi3QvVQTxc3s8ddTobFNsE7ASdnwddaSCiezcPjDNPMpINxG/2rYvrBctult6Ds9GSNK4IZcTKZyXZoFBESfe9sekmBesDuZ5TF9mF+OTFpiyYxYFWK2r1PaOZhjIk0aoreovGI9N2DrNa9frl0C6+ftmfcuZhryB+xHreWMi9tLgiQr496wHBQe5rkEoUv0JOJu9WKz+IR9RCN3lxJyPdKoFEUiLQ25gLsCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22EmSTOYadEHlTAC6Khlb5SyYQHlr+bfl2tz1FvoMvU=;
 b=oRn/RAtkC8imRqm0dAlLtro8sKd8yq6VCNYl06anFkeq24KBZm1EK09aPzdq0Ez/lZVMlobczR07Ig3TTC0Flgsj9WVHeIaKhDPx9/6rl3buu3YyaR/iLak3ypxmLkf9/J9M5VmP0iBEgqjRUxFl5WB3CEAV9hLzIqQxrFyV4aKQ0MzM5Ys0NYT8J5NNVLHgcC6/YZ2W1NZpnR3gt7VfpS1FtszP6aFGhuqCusZCci/B2X0SlSgYtdE7tW6RP2aAxdm0WWjwaEZu6nqj7yljr+oTXR7unWVs3rZ9Owg6c+PJAcs2DzHh//wGIu/dztVjjPZHopXmDm2nudwjLdAWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22EmSTOYadEHlTAC6Khlb5SyYQHlr+bfl2tz1FvoMvU=;
 b=rupk/IAzouZiIiUEZG97tLDAqHMXfp628Yv6QXNtnpph1HRXXqMa7EqeXAptJpOLbb5ik5IsBJ86aqJugszdYGQwUw+KBbf4Q1gavp7VdH4sw2g4U1ZR16NsU5lp9eQlwsp8O8zojGerMsWKa9Ro0qKfo/HDE0q8iVLqvYXTsiQ=
Received: from CY4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:903:33::33)
 by BY5PR02MB6900.namprd02.prod.outlook.com (2603:10b6:a03:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 20 Aug
 2020 07:25:55 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::36) by CY4PR03CA0023.outlook.office365.com
 (2603:10b6:903:33::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 07:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with Microsoft SMTP
 Server id 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 07:25:55
 +0000
Received: from [149.199.38.66] (port=40864 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1k8ex4-00006e-G3; Thu, 20 Aug 2020 00:25:34 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1k8exP-0002G4-3C; Thu, 20 Aug 2020 00:25:55 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07K7PjSP020851;
        Thu, 20 Aug 2020 00:25:45 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1k8exF-00028u-94; Thu, 20 Aug 2020 00:25:45 -0700
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
To:     Rob Herring <robh@kernel.org>, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Robert Richter <rrichter@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20200819221750.2055932-1-robh@kernel.org>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <df3992e8-cf97-3b1b-06af-3b57cbce13dc@xilinx.com>
Date:   Thu, 20 Aug 2020 09:25:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819221750.2055932-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 692bd15b-7d3a-4c24-48ae-08d844da46cc
X-MS-TrafficTypeDiagnostic: BY5PR02MB6900:
X-Microsoft-Antispam-PRVS: <BY5PR02MB69003909E5595AA5D41B5E1FC65A0@BY5PR02MB6900.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /77zhXcNEEAys1O5LCqYUkvy6RUFf37rXcGTGvMawgvzXdBYYJocZ71hILnP0BAsLX9iSNPQVHmHQw5J9XD3QeYGKtYy8b8p0wuxzpgGmLn+9RwbF6P/8+9VIc8y8qbJs18/wr3mMEsxpBOH9BT4CSFC7711uulI1I/HfWCAOxhhwZbq0aNA49SFNt0zRTML4fDJ42uEGjLUYXYEiMWsPI2BgroiCUHMZ59kOkVMryDaLmNtJdLQV3OqrH1vhvglr2pQd6NwzVfTNE2xD9k6/iYvXX5xE5ZridSc2foEvGtJzAgyJpnQGtwMtabVMEOD4h9S9vlRbyeE3F8XjKXJrM+6Oa1NzAgT6zArA+vgUxBr2FTcyb1+eFivmZ61r4GdCNXnh9hztUSQV710h9LNxFjfy5Zrte4ddE1GO7gqyUYH4P9Lyt/RWrfls+tR2//s
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(46966005)(6666004)(186003)(8936002)(54906003)(26005)(81166007)(8676002)(44832011)(336012)(2906002)(356005)(31686004)(82740400003)(7416002)(47076004)(31696002)(9786002)(70206006)(70586007)(82310400002)(36756003)(4326008)(2616005)(83380400001)(426003)(316002)(478600001)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:25:55.3977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 692bd15b-7d3a-4c24-48ae-08d844da46cc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6900
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20. 08. 20 0:17, Rob Herring wrote:
> While bracketing doesn't matter for a DTB, the DT schema checks rely on
> bracketing around each distinct entry. Reformat ranges and dma-ranges
> entries to fix warnings such as:
> 
> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under any of the given schemas (Possible causes of the failure):
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: True was expected
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472]
> 
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Khuong Dinh <khuong@os.amperecomputing.com>
> Cc: Robert Richter <rrichter@marvell.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> SoC maintainers, please apply this directly.
> 
>  .../boot/dts/amlogic/meson-g12-common.dtsi    |  4 +-
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi    | 20 ++++----
>  arch/arm64/boot/dts/apm/apm-storm.dtsi        | 50 +++++++++----------
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |  4 +-
>  .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  4 +-
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 22 ++++----
>  .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  6 +--
>  .../boot/dts/freescale/fsl-ls1043a-rdb.dts    |  6 +--
>  .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 12 ++---
>  .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  6 +--
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  4 +-
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 12 ++---
>  .../boot/dts/freescale/fsl-ls1088a-qds.dts    |  6 +--
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  4 +-
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 16 +++---
>  .../arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 16 +++---
>  .../arm64/boot/dts/freescale/fsl-ls2088a.dtsi | 16 +++---
>  .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   |  6 +--
>  .../boot/dts/freescale/fsl-ls208xa-rdb.dtsi   |  6 +--
>  .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 10 ++--
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |  4 +-
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  8 +--
>  .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  4 +-
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  5 +-
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      |  4 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |  4 +-
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi         | 12 ++---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  4 +-
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  8 +--
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  4 +-

Reviewed-by: Michal Simek <michal.simek@xilinx.com> (zynqmp)

Thanks,
Michal
