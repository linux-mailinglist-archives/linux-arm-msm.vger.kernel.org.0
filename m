Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAD71AE1B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 17:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgDQP6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 11:58:25 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:40800 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726168AbgDQP6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 11:58:24 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03HFojW7018788;
        Fri, 17 Apr 2020 08:58:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=GHJqwHnlfX5LnfNP4c4y2w3xQ2GjYgiWbKzK5jxCqMU=;
 b=OMb3OPrWuEuSXsD4MSLXb8g8iPFCfX+9OGRnBsFw/mLy+kyPDItnyDoeH2n0g74UB1S9
 SGmw1N+gcXRwMn6SGgl/o1qTVaWgI6iH24wpdiGUsqLBttxBDtANnH336xLjTV7spgdC
 w1Fy3fN8a9F/t77HPkHmaX/auN5U17qDDxC4mS8/Yub5d47L2LtgkRqltHTx2FfJzwFt
 cCn3xhmfdqithTX67TYZ6urye1GwDb1oqoFA3O2bEyRjiIZ3eFYGWkJmDrySbLQgU8iB
 3Vi1MxIRQ9mBjDLBAM4rmiP5vC/wSwNmDrpFAcoi0RCGO59z+RhuI39k0t1QTj8qBr2C xQ== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
        by mx0a-0016f401.pphosted.com with ESMTP id 30dn8gvrrk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 17 Apr 2020 08:58:00 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 17 Apr
 2020 08:57:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by SC-EXCH03.marvell.com (10.93.176.83) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 08:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecN9CUm1H6FVeUe6dVRXFNTV2CMMHS4LjehedpYY0QJlw2emdkZpshnPrZbYxTpYgspkdBGdpEoh3qWRj3BtpES6EgFxPi7cgHF7CZ9+7IJeIaPit+mXvLWMhCyZ6o/RoQvD0sixau0IAQpqJTb1If35Z4xRyGmUDZsAfvkA8uKs3N4aochtrN//ED1nUehoZn/Xz4JoDX7IWUUG8+dpm5/1ixwU3k2tzO6C5aTaBbUqKDjUXbBHHh77ScX7Zp8a7zuLsH38thM4PC0sw2uRXl+t5edfbMq0ghC/hU2dY42r+UOJlTxl2RetwDPHby2OPUTiGaZvrPZ1+VSqbW/5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHJqwHnlfX5LnfNP4c4y2w3xQ2GjYgiWbKzK5jxCqMU=;
 b=QlWEQDbVbSqYqoTaBF3FnzfGzZRXv0PFbtg0k7OAQGA9Bipj9QbNVCe8emYF/yWM7Oks4WN+GRnj5LLDwSBLc7AkwtgOzImC/PwPzvpufOM9RHhK5hLQL0dTa3k9oz9IJYbhkl7LGAFOPWML/Qr1qURI8AY9GnZ7TsaMHV7hJcE+j/fzSBHbWgwS49BKd/3Vly81gmxIfsV+X9hThjrlXDhcRdaap5KWTIjG6K5nyEk2MdIpg9P+yRpa8GNOIDnv3Aty5XxVK1CfxYj3J/f2w6EeZ7l2b9ZHu5Cz75sp1LVGJ1dfqmuq2jCHwGgrlaS2P0p6trohlKGM4zKydNm94w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHJqwHnlfX5LnfNP4c4y2w3xQ2GjYgiWbKzK5jxCqMU=;
 b=o5psAuTJ+1ob7O4kVDh/jan+kj5rAthP7bu9kylEjmoR6k/7+n6vppG8fhS9teALwz3V65nylcFke7BU1CYkQNmesTCejcKmXg8eqdB1HtESnR2gtdLjOAv2wJecKovViDp0ltEL6fLtL6nN+msyc80L0I0XanEafQS/hm0SSl8=
Received: from BYAPR18MB2661.namprd18.prod.outlook.com (2603:10b6:a03:136::26)
 by BYAPR18MB2984.namprd18.prod.outlook.com (2603:10b6:a03:10f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 17 Apr
 2020 15:57:57 +0000
Received: from BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::a165:ffa5:f3eb:d62d]) by BYAPR18MB2661.namprd18.prod.outlook.com
 ([fe80::a165:ffa5:f3eb:d62d%7]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 15:57:57 +0000
Date:   Fri, 17 Apr 2020 17:57:47 +0200
From:   Robert Richter <rrichter@marvell.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific
 errata
Message-ID: <20200417155746.25ugwk75quocyb4x@rric.localdomain>
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416115658.20406-3-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::34) To BYAPR18MB2661.namprd18.prod.outlook.com
 (2603:10b6:a03:136::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR0502CA0024.eurprd05.prod.outlook.com (2603:10a6:3:e3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26 via Frontend Transport; Fri, 17 Apr 2020 15:57:54 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdceadc0-ec8b-495e-b1d3-08d7e2e818d1
X-MS-TrafficTypeDiagnostic: BYAPR18MB2984:
X-Microsoft-Antispam-PRVS: <BYAPR18MB2984BF7924894E27DECC7645D9D90@BYAPR18MB2984.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2661.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(55016002)(2906002)(5660300002)(4326008)(316002)(1076003)(54906003)(8676002)(6506007)(53546011)(8936002)(86362001)(26005)(81156014)(52116002)(7696005)(66946007)(478600001)(6666004)(66476007)(186003)(16526019)(66556008)(956004)(9686003)(7416002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNUdxbhF2B2e7VtgGNaHaksXWCSIvob1C1FpAvPDEUN3MinlBSLM6ELidQ2iRpa9roshacrNq+QlBdHpr9R9ACmvswUkJvCnavi/85kkKrLaxzY7zy5iLgOHf2HNVNPJv70f64ZqhwWDyzcsYsIcG3jomm6ITKbBbz7SEPSdN5nlcpqaiyW/b5Uwl6pBBqMDudhdwgM5xCvoVAE29+p7LUrnUwcKCcCKCNpwNbNhjg5KcyF7RuKoa+cSGcLFawOD79+SNDU3PUlEHX/qDIw+KQp3vmlK0x0Tpmfsua/UYyGg4EnFVh+VrAck7IiFRtcvevbKa9v2QFoQJcVDCMPJI+tyyfsReQq191fUtYvhiVbQSlqYAG8Gk2yz/5IRBfyCtmPEjrihfzAD/Ob2yiXkEA4qvXCNkgdEdeEjk0U+GltrhL9LrkQuNbhuvou1NbCT
X-MS-Exchange-AntiSpam-MessageData: jjCCLRvkgpPfjL3LWk3dVoO7ruMMhvQWGYSQg+dz1UKqR9JIAdm70DstNS7rqHX/N+5EOEsEAd1yajAajejRv/WjAsTmQJ3S4bVLgHSXU4natRsX83XTv8FRUU2ZsU4Zm9NSIsJTeVulnKonbo+3Lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdceadc0-ec8b-495e-b1d3-08d7e2e818d1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 15:57:57.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1O2IqzrJtN+amyUUA9E0WpfixsfmnQpxV5vxoJ3C5RkIN7TyvV8qfRAq23xiUYJqle5Oqt3L8Mj4UsoKpB8tMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2984
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-17_07:2020-04-17,2020-04-17 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16.04.20 13:56:58, Geert Uytterhoeven wrote:
> Currently the user is asked about enabling support for each and every
> vendor-specific erratum, even when support for the specific platform is
> not enabled.
> 
> Fix this by adding platform dependencies to the config options
> controlling support for vendor-specific errata.
> 
> Note that FUJITSU_ERRATUM_010001 is left untouched, as no config symbol
> exists for the Fujitsu A64FX platform.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 8d33d7fed6d8549b..81f52f0b988e6350 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -622,6 +622,8 @@ config ARM64_ERRATUM_1542419
>  
>  	  If unsure, say Y.
>  
> +if ARCH_THUNDER2
> +
>  config CAVIUM_ERRATUM_22375
>  	bool "Cavium erratum 22375, 24313"
>  	default y
> @@ -697,6 +699,8 @@ config CAVIUM_TX2_ERRATUM_219
>  
>  	  If unsure, say Y.
>  
> +endif # ARCH_THUNDER2

For Cavium servers these ARCH_* options are only used to enable some
minor (mostly platform) drivers (i2c, spi, gpio, etc.), so the options
are not of much use and I better would like to get rid of them
completely, which makes us independent and more flexible when enabling
or disabling options. In ThunderX* systems there are not many devices
that are soc or board specific, most of them are detected using
generic methods like pci or acpi. So the situation is rather
comparable to x86 systems (there are options based on vendor or core)
than to ARM embedded chips.

Using the ARCH_* options to control also enablement of cpu errata
handling would add a strong dependency here and will make that options
a requirement.

How about having core/vendor specific submenus that make switching off
options easier?

Thanks,

-Robert
