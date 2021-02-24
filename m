Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DC6324059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 16:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhBXOwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 09:52:23 -0500
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com ([40.107.93.52]:42433
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236807AbhBXN0U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 08:26:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7eeuWf4ykRgXzfd+jq97jTy7pdAOaXWc3SVwHUt9XRZK2Vo70ljFyoiMeyZLwMq+ng5tNOc+v9xMIWEv/LqU+yRdtDhox1kJxT+6Nq9y484orBr799O/iZhUpOrF72EXbTn1OkrFXoOjZmQqgOZcMHBXP0bByVGkfj20t4+d+aaJtgdzbLL+mtmpiwsqBei2WntXUjbf0OrglVQsmeouzt57aBHS0lqy1pn7DO9dTp8f6kDfrXzilaxULMJGnMi7GCdsjwqO6+TpBEMPIMlZrqLal97qi+C1aSCSNvMpWyOvV3KlCo/QFMUdmOxKJeD6pVIF8LVKPSlmhJn7y5tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llxU1S+43FCpVCliTg+lyiNWjCTYeaf/751Rmzfdnd8=;
 b=fQrBH3SIv3FktB1uuRE813rV/LMJQ4Cwr4CdfNg8MUVu2iVGmRQaAAkvi2IPDSLG5OMbBG7E9+0ncfXtxTnib4bbUZ7W19UZX45Cf1nPiU6ZYMYSLCQDkKqrr9rDhLdWTTgt8arX/W8aIjX8DUzIHLXU5N/d1NBviCTc0YJkHBC1he0XRpzjdxgEWtDLI5ythMlfvfhG0mH50z4FW3QcF2VIJRhpqIlVWkeiW/U6hUIQiQjH95wXC7IxgEcreE/avSvg5V3oX9wxIIcujYemRvLH/5eLres+iXUo+VMHeHTSaBQV6Z6E9sTdlz6foBxgmHme/X6rX9lGbTcf/fgplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llxU1S+43FCpVCliTg+lyiNWjCTYeaf/751Rmzfdnd8=;
 b=okgbDpeUbjSPWpqjHSMMx6p3e0moKz0BO+P3l6mPfatEY7LxFeixGWxFplwP+BVHRDHFTy0kdtUyW4vmLpzFdF9CdA+5GqEnX5ifeV7Qc0ELbIW4PnGmT4BtqDNWiMNONm5c+MYqk0iIpnrGjC6sHUQ6W+XdsSfnm0vCFfZDOXw=
Received: from BL0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:207:3c::37)
 by SJ0PR02MB7664.namprd02.prod.outlook.com (2603:10b6:a03:323::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 13:25:26 +0000
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:3c:cafe::8) by BL0PR02CA0024.outlook.office365.com
 (2603:10b6:207:3c::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 13:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 13:25:25 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 24 Feb 2021 05:25:23 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 24 Feb 2021 05:25:23 -0800
Envelope-to: michal.simek@xilinx.com,
 linux-arm-msm@vger.kernel.org,
 mathias.nyman@intel.com,
 masahiroy@kernel.org,
 bjorn.andersson@linaro.org,
 agross@kernel.org,
 grandmaster@al2klimov.de,
 alcooperx@gmail.com,
 krzk@kernel.org,
 linux-usb@vger.kernel.org,
 dianders@chromium.org,
 linux-kernel@vger.kernel.org,
 hadess@hadess.net,
 ravisadineni@chromium.org,
 stern@rowland.harvard.edu,
 swboyd@chromium.org,
 peter.chen@nxp.com,
 devicetree@vger.kernel.org,
 frowand.list@gmail.com,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org,
 mka@chromium.org
Received: from [172.30.17.109] (port=45350)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lEuAN-0003kA-7j; Wed, 24 Feb 2021 05:25:23 -0800
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
CC:     <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Ravi Chandra Sadineni" <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        <linux-usb@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Al Cooper <alcooperx@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        <linux-arm-msm@vger.kernel.org>,
        "Michal Simek" <michal.simek@xilinx.com>
References: <20210210171040.684659-1-mka@chromium.org>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 0/4] USB: misc: Add onboard_usb_hub driver
Message-ID: <64179b81-454c-0d26-5413-a8df2e292b05@xilinx.com>
Date:   Wed, 24 Feb 2021 14:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210171040.684659-1-mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4644e484-fa00-4b77-c456-08d8d8c7a54c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7664:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB766469612B164674C00D7D3EC69F9@SJ0PR02MB7664.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fKT/lORXJ29rpnQZdF0cISKLAMBCFHTC/pdNO81qwp9LveeF2GQ+ZFd2L9arPkmml9Hcle9qD02gvl38wUB63/U90c4A0CNHgtDC0K05gD8w1ho177Ec6zy0s+wXhAPPq/83fVBrWVygZ5zJvY1pbJz4Xw3nxqo/V6jdcQ7wpJX1QIYUaf+v+uOiYUTC6UitgvKzoP0BA6DsSsgbNFjDFezxzscWUM9WFtn7Tab2b3EGU38RJPCSHr8BzJnwVFtPZW208YuaccfXqED0I9b0SMEXdS2BV1fuv6KMI/2xYusityG0kkBip0XKOJmE5NmyASqIPjO/FICI4sLFwjAtpwBEbp7HvlPhInNLsPdlytKg/9BdEwaNDrPoouZeOGEkWy8vTMm2Mm927tKh8nAnzS5kzIEp9a7yI11pz/nvLBKNpxzTL8GAkLXetPN+zPDhRxKdRGrlTZhwklRu4Na4TXO6RlNjkUC3h+OpfLSa2Yw9p3VP0PpNsDH8ZFi80p33DtLnPsa/4QVX6WBZ5RVvbvYplbmBfUuOjA81rlWJmEofDLIRKtzYmiNUD/TE9deRQEDfaNcgB7e0sA503UX332y/841PLRV6GQIMnYKAuqSO0Q5OqXNE1o11HGS9rsrdfzGL62X57YG35Az8rNfbmxfUN9ezqDro3F6eK5KPCz5Rn4RRYE4NdlTYwTDJ2BKJHXu3dLbNiEPq+MGSGSpXXRTE44Uh26v9hcvKIsK2Cy+DSTeOk3jLAL0R3zgQbrBmxxszUTosWRKWeMVy73lJITmJdVTvyEr/Ks0251RIP+c=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(5660300002)(31696002)(36860700001)(9786002)(47076005)(2906002)(70206006)(7636003)(6666004)(70586007)(7416002)(316002)(82740400003)(8936002)(2616005)(107886003)(36756003)(110136005)(966005)(478600001)(44832011)(53546011)(26005)(426003)(186003)(356005)(54906003)(336012)(31686004)(82310400003)(4326008)(83380400001)(8676002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:25:25.4819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4644e484-fa00-4b77-c456-08d8d8c7a54c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7664
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2/10/21 6:10 PM, Matthias Kaehlcke wrote:
> This series adds the onboard_usb_hub_driver, the corresponding
> device tree bindings and creation of onboard_usb_hub platform in
> the xhci-plat driver during probe().
> 
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack. Some onboard hubs may require further initialization
> steps, like changing the state of a GPIO or enabling a clock, which
> requires even more hacks. This driver creates a platform device
> representing the hub which performs the necessary initialization.
> Currently it only supports switching on a single regulator, support
> for multiple regulators or other actions can be added as needed.
> Different initialization sequences can be supported based on the
> compatible string.
> 
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.
> 

Rob pointed me here at your series.
http://lore.kernel.org/r/CAL_JsqJedhX6typpUKbnzV7CLK6UZVjq3CyG9iY_j5DLPqvVdw@mail.gmail.com

And I have looked at RTS5411 datasheet and it looks very similar to
Microchip usb5744 chip we use.
Both have i2c/smbus and spi interfaces and also input clock.
usb5744 has also external gpio reset.

There are also usb3503 and others which should fit to this generic DT
binding.

Thanks,
Michal

That's why please keep me in the loop on v6 because I think
