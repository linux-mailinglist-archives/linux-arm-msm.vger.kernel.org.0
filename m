Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EBC7325B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 05:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239387AbjFPDOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 23:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbjFPDOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 23:14:21 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189D41FD4;
        Thu, 15 Jun 2023 20:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQIFG8UR/aYyINDE5aoiAu2o1WV3a7eU0661mHHbM44TzUjsdnY1yBduqEnQrdfbw39lHUHeAlno1tpfpsvt6zSzH7l0fy3jQbdavda+33IFJygGQYVlCSYRMfFEsWqDes8q/VbRMFOSqViRt9YBOEvevc/Uj1PsIQUJTdhFzfrx8vAKnZc24mXTmSkweNH+HT9I/wYAJiRFEd4uEcJ1oh6B2d3xlW32132HqbtfixBya9NwYlkJOJVQg/DqvUwwg9RAoAs75sTj1b9nCX34nsZm0KoB9ur5l2l3SonQhmoKnD1VJyOgyffrK3lKlImbkQklLh/rcz6i28kzjQgOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip7UWdjCK0MLi5AMa7oTqUQEsUaZtcVA4tFknvoJdI0=;
 b=PiogxqqQm+9p7b9S+7qewlCT/sy4FRcbK9RDjHCo2eGjluRb6tlHipu+D4R+Az1CA2fvgugJWENwCO2Y55P2p3TWJh6I503RqPNzkSg2yGF9+RiAe5kupe7N3oE3/mtpgOdfmHdQoLZsr4jkZaRHadu1lBJlhXyCSr1h+kh+8t9/pdsl4m6M8MtJM8UsGUhOXtX9SSL0fxvngZM0xYYO34JYhgrbtLEqLwsO/a/Y8sXsbkd0JZX+JBKqE/rCBFUm0VoBnqukQ1FLzDN2vBaeoncrnxGjTfIoUVHxh9huC1ku2V0I6gUxmsewO7XUZaNwympFW1zpJbBHbN6/K3OZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip7UWdjCK0MLi5AMa7oTqUQEsUaZtcVA4tFknvoJdI0=;
 b=0LiLkDZyOW+6OUBF945pHPTHzkPhQWCfCjegEYc8bsM4lK3oG6TJSA4CcL7viu/7UNTu4zxO8OVOuZg+U4ldpdCdx6gozkoOysqOc+bIXakgRE6faW6mTNULf+ENSCbN5AdJnDsV5uq/XPhPR1Mk71X1dS0iSv67kvYBv9/NjRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by DM4PR08MB8698.namprd08.prod.outlook.com (2603:10b6:8:18b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 03:14:12 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::e6a9:c49:b451:962]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::e6a9:c49:b451:962%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 03:14:11 +0000
Date:   Thu, 15 Jun 2023 22:14:04 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] input: touchscreen: add core support for Goodix
 Berlin Touchscreen IC
Message-ID: <ZIvTfE5O31NKnywd@nixie71>
References: <20230606-topic-goodix-berlin-upstream-initial-v2-0-26bc8fe1e90e@linaro.org>
 <20230606-topic-goodix-berlin-upstream-initial-v2-2-26bc8fe1e90e@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v2-2-26bc8fe1e90e@linaro.org>
X-ClientProxiedBy: DS7PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::23) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|DM4PR08MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 51cf47be-ae2e-4c40-2f65-08db6e17c149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g12gUweX2lK6W3Cnr5z6TgD361tWsKz4gs1hCqjrBk/nJEomQxeul3tYVJhBoLLBG/j4zQcl3oVrD9eCnzvK4CS/4lesgn1yknoYyeygcQkgR4+y4l+d3ExQ103DFrg7nOI0segGzRpl5VF+E/cqvLf4muxRy1KfRqJfoHy29GnYwQ8nSnXMyf4bqFeHbRsR1NQiy1bFyGoAg+PGNhFo9i/SRAJoboCo70OvQz9hOXQg+W0Q5SK8+HaSzEL4oCgaNLKXe+Uwc/6ujlLmntN0H3Q7WT01FhDus8VSIeLVX/hD0kJTqMRa4nQaK4DqIDYBfpTb+E50KJiCxZfInej/pzDtGmzaFSf7No1QjfBstNyaVYz19Sf8tL90YPRuq4qJUl5qerFbYr8ug9Ll9rLEgd6SrQTTGffnQl+qRQ1cFp0pLlaCukuIxgqfSGaVnsv8OR1JhgsU3hbW9JHEAbZbTGEqsrfMbnS+JTn5hf9ie/7/8Cal2ROkNhBpS3v9iji7R3e9C2d0+V0YYUf5XdCOStEmvDxtA9fQ3bBTY7Hdec8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(39830400003)(346002)(396003)(376002)(136003)(451199021)(86362001)(54906003)(66556008)(66476007)(316002)(6916009)(4326008)(66946007)(966005)(478600001)(6486002)(6666004)(33716001)(41300700001)(8936002)(8676002)(30864003)(2906002)(5660300002)(7416002)(38100700002)(83380400001)(9686003)(26005)(6512007)(6506007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4gPHMj9+FU11h9xALeCJ5bfLTumnPXXxWzneb+gutJ4U5ZjDYTcsy82hbVH?=
 =?us-ascii?Q?vlB4u/VeWnoi1MDcEyprDobVCeXkjMOkjsdKSHfSDCG4f1TWow4YEZyT519E?=
 =?us-ascii?Q?b8n2LzCxchOQ0lOfMJIwGSbdVnsTDaI8D4WefOeBX6q5eTWvUueguWtsu6l4?=
 =?us-ascii?Q?z+31zAxle5OpOzeo4ceKynz8boxumnKcvL2z+hsJCOayWlUahdunXFSAhymr?=
 =?us-ascii?Q?UW2e8Z2b/y57iC7jHgxcet+XrJt3CbGJsERy/Kxj3Hk6KscTDn7R04XvoTfD?=
 =?us-ascii?Q?QVs+EpEHZdjHPd9OKT5wPBgA2dVzzUhsU4jBo9u39M9tn/Kxq7MVpbtCusfV?=
 =?us-ascii?Q?0xVIYgm2BGaqmTAEOFW6JEEwvJjsLrWYBOYt0gEyQS7cUTCx5HVyolfinyYk?=
 =?us-ascii?Q?LD2wBN7kAyB1GUvwpKQ/eGvjb5kAVzh2GlwHk4QP7zdBl0G1Ix5Au724HpeF?=
 =?us-ascii?Q?0m5HgHF1ZC3XHMt7PWSjJZ6eZj1S++VyJj9lfh5KsHQSOsHM12Fm6bA/HuUv?=
 =?us-ascii?Q?APgyBwYgqO8o6SeIC4LV4llYDqRhpEuNdpYveUxdAfbSfFzQ3ncbRvYjF9iX?=
 =?us-ascii?Q?Ea6mXZIwQ70iFF8Frr/6YIpVrMQ1VsHGbOptJJWd1xU7ze4N7+4ypNZFQBZn?=
 =?us-ascii?Q?5DsavNlq7Q+U8bvBk6ioJXPGGyVtc6I/kRJ2YadKQM5yxQyuxTtwHNkwr3a/?=
 =?us-ascii?Q?HrbYPShloJdzCnYCYsFs8SGVHN/uWq/k8KuMQGR6Mb18nQGU20F5J4XzQI/A?=
 =?us-ascii?Q?xxHAb5M5o2WoHMOZwaJtUms1x1tNMblUKpUx5DxLymxHTcKoaN2+I664+COd?=
 =?us-ascii?Q?8D1gaOPDfH7HmfCvTDNsfCDlugG63xJQzLXtRRMfC4DLGSmcmA4H6BQMpNZ7?=
 =?us-ascii?Q?DmSOw070yro4UMzuDtXZ6rVcPRNsdzIVzPKinKiK5eNLrKEYnjSFKjxR2/+c?=
 =?us-ascii?Q?77w2tnPQERqBJ5v+GHgIF87UdI0LeMXdStSUiavRHVv6EWYQkXL/M6V/P431?=
 =?us-ascii?Q?1xm27x17XICiWK/5Gc+k3dLjyPx0r/aXcxK3miii9JgGEoql2TQEiMW1dNQm?=
 =?us-ascii?Q?suy0JJ3AbBKwxf8p1hiKTjAgqYniKUe6+5HGOq4U5OQWZdFspw/OL07Msd+4?=
 =?us-ascii?Q?7tV3bwIXbQAk8JjdzsY9xJMYmS5uSQw/sawQial9Ht7phaZda7VlknZupbbB?=
 =?us-ascii?Q?wHoJtVTo3xXTxCf42DdYOg0H3sKjQk+36NFTyz064aP0rPvW/VAWvJp+bUn4?=
 =?us-ascii?Q?xaVmnt+uwBfWGu4fvqThryBqLYBB21V6NkWPlUVPneF02uStU6fRUq9FiPnG?=
 =?us-ascii?Q?qtVwKmiGu6uW9ZGy/+pEwF06wAM1hpqkikUor2L0zOI/HhPYbKE5/Y0FU5gt?=
 =?us-ascii?Q?/fs5QZ7wBr7uNSaixrobmLgJ+6hDmVSZh0JQRZTAkfaES3rO59eqWg8zEr3V?=
 =?us-ascii?Q?8oSrKAZ0MQak7gpS49xRLQ6z0mDGIXli9P87z6DUfeCGEBhyM2fwfY0Bv7qO?=
 =?us-ascii?Q?yW4FCGm1etzXTB2uzwWVov2LubNvleSnc+RGHtAnFbJhgAcDx6nDPw9frZ1n?=
 =?us-ascii?Q?PUNgNL+l/1MecvY0X+7Cyxr8ulMPQUMNB6pkA5Bs?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cf47be-ae2e-4c40-2f65-08db6e17c149
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 03:14:11.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sutIM7XvWLMcM2Y+iKofWp3aj7na1sOI2VKyppvF8+0IGmDm+yKAt7Rin4BnMblv2t8naDCJw6z5ZuE9MTBu2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8698
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

Great work; this driver cleaned up quite nicely. With the previous
noise out of the way, I have left some more detailed comments which
are relatively minor for the most part.

On Thu, Jun 15, 2023 at 12:27:01PM +0200, Neil Armstrong wrote:
> Add initial support for the new Goodix "Berlin" touchscreen ICs.
> 
> These touchscreen ICs support SPI, I2C and I3C interface, up to
> 10 finger touch, stylus and gestures events.
> 
> This initial driver is derived from the Goodix goodix_ts_berlin
> available at [1] and [2] and only supports the GT9916 IC
> present on the Qualcomm SM8550 MTP & QRD touch panel.
> 
> The current implementation only supports BerlinD, aka GT9916.
> 
> Support for advanced features like:
> - Firmware & config update
> - Stylus events
> - Gestures events
> - Previous revisions support (BerlinA or BerlinB)
> is not included in current version.
> 
> The current support will work with currently flashed firmware
> and config, and bail out if firmware or config aren't flashed yet.
> 
> [1] https://github.com/goodix/goodix_ts_berlin
> [2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/input/touchscreen/Kconfig              |   5 +
>  drivers/input/touchscreen/Makefile             |   1 +
>  drivers/input/touchscreen/goodix_berlin.h      | 178 +++++++
>  drivers/input/touchscreen/goodix_berlin_core.c | 681 +++++++++++++++++++++++++
>  4 files changed, 865 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c2cbd332af1d..1a6f6f6da991 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -416,6 +416,11 @@ config TOUCHSCREEN_GOODIX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called goodix.
>  
> +config TOUCHSCREEN_GOODIX_BERLIN_CORE
> +	depends on GPIOLIB || COMPILE_TEST

No need to depend on GPIOLIB; all gpiod calls used in this driver define dummy
functions for the !CONFIG_GPIOLIB case.

> +	depends on REGMAP
> +	tristate
> +
>  config TOUCHSCREEN_HIDEEP
>  	tristate "HiDeep Touch IC"
>  	depends on I2C
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 159cd5136fdb..29cdb042e104 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
>  obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
>  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
> +obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
>  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
>  obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
> new file mode 100644
> index 000000000000..56c110d94dff
> --- /dev/null
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Goodix Touchscreen Driver
> + * Copyright (C) 2020 - 2021 Goodix, Inc.
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Based on goodix_berlin_berlin driver.
> + */
> +
> +#ifndef __GOODIX_BERLIN_H_
> +#define __GOODIX_BERLIN_H_
> +
> +#include <linux/input.h>
> +#include <linux/of_gpio.h>

I believe this should have been <linux/gpio/consumer.h>.

> +#include <linux/input/touchscreen.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define GOODIX_MAX_TOUCH 10
> +
> +#define GOODIX_NORMAL_RESET_DELAY_MS 100
> +
> +#define MAX_SCAN_FREQ_NUM	8
> +#define MAX_SCAN_RATE_NUM	8
> +#define MAX_FREQ_NUM_STYLUS	8
> +
> +#define IRQ_EVENT_HEAD_LEN	8
> +#define BYTES_PER_POINT		8
> +#define COOR_DATA_CHECKSUM_SIZE 2
> +
> +#define GOODIX_TOUCH_EVENT	BIT(7)
> +#define GOODIX_REQUEST_EVENT	BIT(6)
> +
> +#define GOODIX_REQUEST_CODE_RESET	3
> +
> +#define POINT_TYPE_STYLUS_HOVER	0x01
> +#define POINT_TYPE_STYLUS	0x03
> +
> +#define DEV_CONFIRM_VAL		0xAA
> +#define BOOTOPTION_ADDR		0x10000
> +#define FW_VERSION_INFO_ADDR	0x10014
> +
> +#define GOODIX_IC_INFO_MAX_LEN	1024
> +#define GOODIX_IC_INFO_ADDR	0x10070
> +
> +struct goodix_berlin_fw_version {
> +	u8 rom_pid[6];
> +	u8 rom_vid[3];
> +	u8 rom_vid_reserved;
> +	u8 patch_pid[8];
> +	u8 patch_vid[4];
> +	u8 patch_vid_reserved;
> +	u8 sensor_id;
> +	u8 reserved[2];
> +	u16 checksum;
> +} __packed;
> +
> +struct goodix_berlin_ic_info_version {
> +	u8 info_customer_id;
> +	u8 info_version_id;
> +	u8 ic_die_id;
> +	u8 ic_version_id;
> +	u32 config_id;
> +	u8 config_version;
> +	u8 frame_data_customer_id;
> +	u8 frame_data_version_id;
> +	u8 touch_data_customer_id;
> +	u8 touch_data_version_id;
> +	u8 reserved[3];
> +} __packed;
> +
> +struct goodix_berlin_ic_info_feature {
> +	u16 freqhop_feature;
> +	u16 calibration_feature;
> +	u16 gesture_feature;
> +	u16 side_touch_feature;
> +	u16 stylus_feature;
> +} __packed;
> +
> +struct goodix_berlin_ic_info_misc {
> +	u32 cmd_addr;
> +	u16 cmd_max_len;
> +	u32 cmd_reply_addr;
> +	u16 cmd_reply_len;
> +	u32 fw_state_addr;
> +	u16 fw_state_len;
> +	u32 fw_buffer_addr;
> +	u16 fw_buffer_max_len;
> +	u32 frame_data_addr;
> +	u16 frame_data_head_len;
> +	u16 fw_attr_len;
> +	u16 fw_log_len;
> +	u8 pack_max_num;
> +	u8 pack_compress_version;
> +	u16 stylus_struct_len;
> +	u16 mutual_struct_len;
> +	u16 self_struct_len;
> +	u16 noise_struct_len;
> +	u32 touch_data_addr;
> +	u16 touch_data_head_len;
> +	u16 point_struct_len;
> +	u16 reserved1;
> +	u16 reserved2;
> +	u32 mutual_rawdata_addr;
> +	u32 mutual_diffdata_addr;
> +	u32 mutual_refdata_addr;
> +	u32 self_rawdata_addr;
> +	u32 self_diffdata_addr;
> +	u32 self_refdata_addr;
> +	u32 iq_rawdata_addr;
> +	u32 iq_refdata_addr;
> +	u32 im_rawdata_addr;
> +	u16 im_readata_len;
> +	u32 noise_rawdata_addr;
> +	u16 noise_rawdata_len;
> +	u32 stylus_rawdata_addr;
> +	u16 stylus_rawdata_len;
> +	u32 noise_data_addr;
> +	u32 esd_addr;
> +} __packed;
> +
> +enum goodix_berlin_ts_event_type {
> +	GOODIX_BERLIN_EVENT_INVALID,
> +	GOODIX_BERLIN_EVENT_TOUCH,
> +	GOODIX_BERLIN_EVENT_REQUEST,
> +};
> +
> +enum goodix_berlin_ts_request_type {
> +	GOODIX_BERLIN_REQUEST_TYPE_INVALID,
> +	GOODIX_BERLIN_REQUEST_TYPE_RESET,
> +};
> +
> +enum goodix_berlin_touch_point_status {
> +	GOODIX_BERLIN_TS_NONE,
> +	GOODIX_BERLIN_TS_TOUCH,
> +};
> +
> +struct goodix_berlin_coords {
> +	enum goodix_berlin_touch_point_status status;
> +	unsigned int x, y, w, p;
> +};
> +
> +struct goodix_berlin_touch_data {
> +	int touch_num;
> +	struct goodix_berlin_coords coords[GOODIX_MAX_TOUCH];
> +};
> +
> +struct goodix_berlin_event {
> +	enum goodix_berlin_ts_event_type event_type;
> +	enum goodix_berlin_ts_request_type request_code;
> +	struct goodix_berlin_touch_data touch_data;
> +};
> +
> +/* Runtime parameters extracted from goodix_berlin_ic_info */
> +struct goodix_berlin_params {
> +	u32 touch_data_addr;
> +};

Is there any reason to wrap this single member in a struct? It seems like
touch_data_addr can simply be a member of struct goodix_berlin_core; this
would shorten references to it throughout as well.

> +
> +struct goodix_berlin_core {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regulator *avdd;
> +	struct regulator *iovdd;
> +	struct gpio_desc *reset_gpio;
> +	struct touchscreen_properties props;
> +	struct goodix_berlin_fw_version fw_version;
> +	struct goodix_berlin_params params;
> +	struct input_dev *input_dev;
> +	struct goodix_berlin_event ts_event;
> +	int irq;
> +	struct dentry *debugfs_root;

This last member appears to be unused.

> +};
> +
> +int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> +			struct regmap *regmap);
> +
> +extern const struct dev_pm_ops goodix_berlin_pm_ops;
> +
> +#endif
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> new file mode 100644
> index 000000000000..11788662722a
> --- /dev/null
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -0,0 +1,681 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Goodix Touchscreen Driver
> + * Copyright (C) 2020 - 2021 Goodix, Inc.
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Based on goodix_ts_berlin driver.
> + */
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/regmap.h>
> +
> +#include "goodix_berlin.h"
> +
> +/*
> + * Goodix "Berlin" Touchscreen ID driver
> + *
> + * Currently only handles Multitouch events with already
> + * programmed firmware and "config" for "Revision D" Berlin IC.
> + *
> + * Support is missing for:
> + * - ESD Management
> + * - Firmware update/flashing
> + * - "Config" update/flashing
> + * - Stylus Events
> + * - Gesture Events
> + * - Support for older revisions (A, B & C)
> + */
> +
> +static bool goodix_berlin_check_checksum(const u8 *data, int size)

Based on how this function is used later, something along the lines of
goodix_berlin_checksum_valid() may be more descriptive.

> +{
> +	u32 cal_checksum = 0;
> +	u32 r_checksum = 0;

This can probably just be:

	u16 r_checksum;

> +	u32 i;
> +
> +	if (size < COOR_DATA_CHECKSUM_SIZE)
> +		return false;
> +
> +	for (i = 0; i < size - COOR_DATA_CHECKSUM_SIZE; i++)
> +		cal_checksum += data[i];
> +
> +	r_checksum += data[i++];
> +	r_checksum += (data[i] << 8);

And then:

	r_checksum = put_unaligned_le16(data[i]);

In which case you must #include <asm/unaligned.h>.

> +
> +	return (cal_checksum & 0xFFFF) == r_checksum;
> +}
> +
> +static bool goodix_berlin_is_dummy_data(struct goodix_berlin_core *cd,
> +					const u8 *data, int size)
> +{
> +	int zero_count = 0;
> +	int ff_count = 0;

'zero_count' and 'ff_count' seem like odd variable names; the following
seems cleaner:

static bool goodix_berlin_is_dummy_data(...)
{
	int i;

	/*
	 * 0 and 0xff represent ____, so declare success the first time
	 * we encounter neither.
	 */
	for (i = 0; i < size; i++)
		if (data[i] > 0 && data[i] < 0xff)
			return false;

	return true;
}

...with the comment filled in to clarify what is the significance of dummy
data, if possible. Note that the caller already prints a message when this
fails.

> +	int i;
> +
> +	for (i = 0; i < size; i++) {
> +		if (data[i] == 0)
> +			zero_count++;
> +		else if (data[i] == 0xff)
> +			ff_count++;
> +	}
> +	if (zero_count == size || ff_count == size) {
> +		dev_warn(cd->dev, "warning data is all %s\n",
> +			 zero_count == size ? "zero" : "0xff");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int goodix_berlin_dev_confirm(struct goodix_berlin_core *cd)
> +{
> +	u8 tx_buf[8], rx_buf[8];
> +	int retry = 3;
> +	int error;
> +
> +	memset(tx_buf, DEV_CONFIRM_VAL, sizeof(tx_buf));

Please namespace this #define as well as the one below.

> +	while (retry--) {
> +		error = regmap_raw_write(cd->regmap, BOOTOPTION_ADDR, tx_buf,
> +					 sizeof(tx_buf));
> +		if (error < 0)
> +			return error;

This should just be:

		if (error)
			return error;

> +
> +		error = regmap_raw_read(cd->regmap, BOOTOPTION_ADDR, rx_buf,
> +					sizeof(rx_buf));
> +		if (error < 0)
> +			return error;

And here, as well as a few other places throughout.

> +
> +		if (!memcmp(tx_buf, rx_buf, sizeof(tx_buf)))
> +			return 0;
> +
> +		usleep_range(5000, 5100);
> +	}
> +
> +	dev_err(cd->dev, "device confirm failed, rx_buf: %*ph\n", 8, rx_buf);
> +
> +	return -EINVAL;
> +}
> +
> +static int goodix_berlin_power_on(struct goodix_berlin_core *cd, bool on)
> +{
> +	int error = 0;

No need to initialize 'error' here.

> +
> +	if (on) {
> +		error = regulator_enable(cd->iovdd);
> +		if (error < 0) {
> +			dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
> +			return error;
> +		}
> +
> +		/* Vendor waits 3ms for IOVDD to settle */
> +		usleep_range(3000, 3100);
> +
> +		error = regulator_enable(cd->avdd);
> +		if (error < 0) {
> +			dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
> +			goto power_off_iovdd;
> +		}
> +
> +		/* Vendor waits 15ms for IOVDD to settle */
> +		usleep_range(15000, 15100);
> +
> +		gpiod_set_value(cd->reset_gpio, 0);
> +
> +		/* Vendor waits 4ms for Firmware to initialize */
> +		usleep_range(4000, 4100);
> +
> +		error = goodix_berlin_dev_confirm(cd);
> +		if (error < 0)
> +			goto power_off_gpio;

All of this cleaned up nicely. The following comment is idiomatic, but I feel
the goto can be easily eliminated as follows:

		error = goodix_berlin_dev_confirm(cd);
		if (error)
			break;

If you feel strongly otherwise, please consider a different label name beside
'power_off_gpio' as it is a bit confusing.

> +
> +		/* Vendor waits 100ms for Firmware to fully boot */
> +		msleep(GOODIX_NORMAL_RESET_DELAY_MS);
> +
> +		return 0;
> +	}
> +
> +power_off_gpio:
> +	gpiod_set_value(cd->reset_gpio, 1);
> +
> +	regulator_disable(cd->avdd);
> +
> +power_off_iovdd:
> +	regulator_disable(cd->iovdd);
> +
> +	return error;
> +}
> +
> +static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
> +{
> +	u8 buf[sizeof(struct goodix_berlin_fw_version)];
> +	int retry = 2;
> +	int error;
> +
> +	while (retry--) {
> +		error = regmap_raw_read(cd->regmap, FW_VERSION_INFO_ADDR, buf, sizeof(buf));
> +		if (error) {
> +			dev_dbg(cd->dev, "read fw version: %d, retry %d\n", error, retry);
> +			usleep_range(5000, 5100);
> +			continue;
> +		}
> +
> +		if (goodix_berlin_check_checksum(buf, sizeof(buf)))
> +			break;
> +
> +		dev_dbg(cd->dev, "invalid fw version: checksum error\n");
> +
> +		error = -EINVAL;
> +
> +		/* Do not sleep on the last try */
> +		if (retry)
> +			usleep_range(10000, 11000);

This works, but do you reasonably expect to continue if the checksum is bad?
Perhaps the device can still respond over I2C/SPI, but returns garbage data
if the communication happens in the process of the device waking up?

If so, this may be even cleaner:

		if (retry)
			usleep_range(...);
		else
			error = -EINVAL;

> +	}
> +
> +	if (error) {
> +		dev_err(cd->dev, "failed to get fw version");
> +		return error;
> +	}

Again the following comment is idiomatic, but this seems cleaner:

	if (error)
		dev_err(...);
	else
		memcpy(...);

	return error;

I do not feel strongly about it if you prefer the existing method.

> +
> +	memcpy(&cd->fw_version, buf, sizeof(cd->fw_version));
> +
> +	return 0;
> +}
> +
> +/* Only extract necessary data for runtime */
> +static int goodix_berlin_convert_ic_info(struct goodix_berlin_core *cd,
> +					 const u8 *data, u16 length)

Nit: these arguments do not seem aligned as below:

+static int goodix_berlin_convert_ic_info(...,
					  ...)

> +{
> +	struct goodix_berlin_ic_info_misc misc;
> +	unsigned int offset = 0;
> +	u8 param_num;
> +
> +	offset += sizeof(__le16); /* length */
> +	offset += sizeof(struct goodix_berlin_ic_info_version);
> +	offset += sizeof(struct goodix_berlin_ic_info_feature);
> +
> +	/* goodix_berlin_ic_info_param, variable width structure */

I don't see any need to make up this name 'goodix_berlin_ic_info_param' which
is not defined anywhere else; a generic text description of what this area of
memory represents seems fine.

> +	offset += 4 * sizeof(u8); /* drv_num, sen_num, button_num, force_num */
> +
> +	if (offset >= length)
> +		goto invalid_offset;
> +
> +	param_num = data[offset++]; /* active_scan_rate_num */
> +
> +	offset += param_num * sizeof(__le16);
> +
> +	if (offset >= length)
> +		goto invalid_offset;

Do you actually need this check after every operation? It seems the error
would be cumulative such that you could perform one check at the end, and
potentially avoid a goto statement like below:

	offset += ...; /* foo */

	offset += ---; /* bar */

	if (offset > length) {
		dev_err(...);
		return -EINVAL);
	}

	return 0;

In case I have misunderstood, please let me know.

> +
> +	param_num = data[offset++]; /* mutual_freq_num*/
> +
> +	offset += param_num * sizeof(__le16);
> +
> +	if (offset >= length)
> +		goto invalid_offset;
> +
> +	param_num = data[offset++]; /* self_tx_freq_num */
> +
> +	offset += param_num * sizeof(__le16);
> +
> +	if (offset >= length)
> +		goto invalid_offset;
> +
> +	param_num = data[offset++]; /* self_rx_freq_num */
> +
> +	offset += param_num * sizeof(__le16);
> +
> +	if (offset >= length)
> +		goto invalid_offset;
> +
> +	param_num = data[offset++]; /* stylus_freq_num */
> +
> +	offset += param_num * sizeof(__le16);
> +
> +	if (offset + sizeof(misc) > length)
> +		goto invalid_offset;
> +
> +	/* goodix_berlin_ic_info_misc */
> +	memcpy(&misc, &data[offset], sizeof(misc));
> +
> +	cd->params.touch_data_addr = le32_to_cpu(misc.touch_data_addr);
> +
> +	return 0;
> +
> +invalid_offset:
> +	dev_err(cd->dev, "ic_info length is invalid (offset %d length %d)\n",
> +		offset, length);
> +	return -EINVAL;
> +}
> +
> +static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
> +{
> +	int error, i;
> +	u16 length = 0;
> +	u32 ic_addr;
> +	u8 afe_data[GOODIX_IC_INFO_MAX_LEN] = { 0 };

No need to initialize this array.

> +
> +	ic_addr = GOODIX_IC_INFO_ADDR;
> +
> +	for (i = 0; i < 3; i++) {
> +		error = regmap_raw_read(cd->regmap, ic_addr, (u8 *)&length, sizeof(length));
> +		if (error) {
> +			dev_info(cd->dev, "failed get ic info length, %d\n", error);
> +			usleep_range(5000, 5100);
> +			continue;
> +		}
> +
> +		length = le16_to_cpu(length);

This seems incorrect; it seems like you mean to initialize the following:

	__le16 length_raw;
	u16 length;

And then this becomes:

		length = le16_to_cpu(length_raw);

> +		if (length >= GOODIX_IC_INFO_MAX_LEN) {
> +			dev_info(cd->dev, "invalid ic info length %d, retry %d\n", length, i);
> +			continue;
> +		}
> +
> +		error = regmap_raw_read(cd->regmap, ic_addr, afe_data, length);
> +		if (error) {
> +			dev_info(cd->dev, "failed get ic info data, %d\n", error);
> +			usleep_range(5000, 5100);
> +			continue;
> +		}
> +
> +		/* check whether the data is valid (ex. bus default values) */
> +		if (goodix_berlin_is_dummy_data(cd, (const uint8_t *)afe_data, length)) {
> +			dev_info(cd->dev, "fw info data invalid\n");
> +			usleep_range(5000, 5100);
> +			continue;
> +		}
> +
> +		if (!goodix_berlin_check_checksum((const uint8_t *)afe_data, length)) {
> +			dev_info(cd->dev, "fw info checksum error\n");
> +			usleep_range(5000, 5100);
> +			continue;
> +		}
> +
> +		break;
> +	}

Even after the loop gives up, we will still sleep for 5 ms; it seems we can
simplify this. One option may be to offload the function calls into a helper
like below:

static int __goodix_berlin_get_ic_info(...);
{
	/* ... */

	error = regmap_raw_read(...);
	if (error)
		return error;

	length = le16_to_cpu(...);
	if (...)
		return -EINVAL;

	if (goodix_berlin_is_dummy_data(...))
		return -EAGAIN;

	if (!goodix_berlin_check_checksum(...));
		return -EAGAIN;

	return 0;
}

...and then:

static int goodix_berlin_get_ic_info(...)
{
	/* ... */

	for (i = 0; i = GOODIX_BERLIN_INFO_RETRIES; i++) {
		error = __goodix_berlin_get_ic_info(...);
		if (!error)
			break;
		elseif (error == -EINVAL)
			return error;

		usleep_range(...);
	}

	if (i == GOODIX_BERLIN_INFO_RETRIES) {
		dev_err(...);
		return -ETIMEDOUT;
	}

	/* ... */

}

> +	if (i == 3) {
> +		dev_err(cd->dev, "failed get ic info\n");
> +		return -EINVAL;
> +	}
> +
> +	error = goodix_berlin_convert_ic_info(cd, afe_data, length);
> +	if (error) {
> +		dev_err(cd->dev, "error converting ic info\n");
> +		return error;
> +	}
> +
> +	/* check some key info */
> +	if (!cd->params.touch_data_addr) {
> +		dev_err(cd->dev, "touch_data_addr is null\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int goodix_berlin_after_event_handler(struct goodix_berlin_core *cd)
> +{
> +	u8 sync_clean = 0;
> +
> +	return regmap_raw_write(cd->regmap, cd->params.touch_data_addr, &sync_clean, 1);

Since your register data width is 8 bits, can this not simply be:

	regmap_write(cd->regmap, params.touch_data_addr, 0);

> +}
> +
> +static void goodix_berlin_parse_finger(struct goodix_berlin_core *cd,
> +				       struct goodix_berlin_touch_data *touch_data,
> +				       u8 *buf, int touch_num)
> +{
> +	unsigned int id = 0, x = 0, y = 0, w = 0;

No need to initialize these.

> +	u8 *coor_data;
> +	int i;
> +
> +	coor_data = &buf[IRQ_EVENT_HEAD_LEN];
> +
> +	for (i = 0; i < touch_num; i++) {
> +		id = (coor_data[0] >> 4) & 0x0F;
> +
> +		if (id >= GOODIX_MAX_TOUCH) {
> +			dev_warn(cd->dev, "invalid finger id %d\n", id);
> +
> +			touch_data->touch_num = 0;
> +			return;
> +		}

It does not seem this check needs to happen in the loop.

> +
> +		x = le16_to_cpup((__le16 *)(coor_data + 2));
> +		y = le16_to_cpup((__le16 *)(coor_data + 4));
> +		w = le16_to_cpup((__le16 *)(coor_data + 6));

I got a bit lost here; this almost seems like there is an opportunity
to define the coordinate layout as a __packed struct.

It's also a bit confusing that all of this information is stored in
the driver's private data and then passed around multiple functions.
Please consider whether this logic can be simplified by consolidating
it into one homogenous interrupt handler.

> +
> +		touch_data->coords[id].status = GOODIX_BERLIN_TS_TOUCH;
> +		touch_data->coords[id].x = x;
> +		touch_data->coords[id].y = y;
> +		touch_data->coords[id].w = w;
> +
> +		coor_data += BYTES_PER_POINT;
> +	}
> +
> +	touch_data->touch_num = touch_num;
> +}
> +
> +static int goodix_berlin_touch_handler(struct goodix_berlin_core *cd,
> +				       u8 *pre_buf, u32 pre_buf_len)
> +{
> +	static u8 buffer[IRQ_EVENT_HEAD_LEN + BYTES_PER_POINT * GOODIX_MAX_TOUCH + 2];
> +	struct goodix_berlin_touch_data *touch_data = &cd->ts_event.touch_data;
> +	u8 point_type = 0;
> +	u8 touch_num = 0;
> +	int error = 0;
> +
> +	memset(&cd->ts_event, 0, sizeof(cd->ts_event));
> +
> +	/* copy pre-data to buffer */
> +	memcpy(buffer, pre_buf, pre_buf_len);
> +
> +	touch_num = buffer[2] & 0x0F;
> +
> +	if (touch_num > GOODIX_MAX_TOUCH) {
> +		dev_warn(cd->dev, "invalid touch num %d\n", touch_num);
> +		return -EINVAL;
> +	}
> +
> +	/* read more data if more than 2 touch events */
> +	if (unlikely(touch_num > 2)) {
> +		error = regmap_raw_read(cd->regmap,
> +					cd->params.touch_data_addr + pre_buf_len,
> +					&buffer[pre_buf_len],
> +					(touch_num - 2) * BYTES_PER_POINT);
> +		if (error) {
> +			dev_err(cd->dev, "failed get touch data\n");
> +			return error;
> +		}
> +	}
> +
> +	goodix_berlin_after_event_handler(cd);
> +
> +	if (!touch_num)
> +		goto out_touch_handler;
> +
> +	point_type = buffer[IRQ_EVENT_HEAD_LEN] & 0x0F;
> +
> +	if (point_type == POINT_TYPE_STYLUS || point_type == POINT_TYPE_STYLUS_HOVER) {
> +		dev_warn_once(cd->dev, "Stylus event type not handled\n");
> +		return 0;
> +	}
> +
> +	if (!goodix_berlin_check_checksum(&buffer[IRQ_EVENT_HEAD_LEN],
> +					  touch_num * BYTES_PER_POINT + 2)) {
> +		dev_dbg(cd->dev, "touch data checksum error\n");
> +		dev_dbg(cd->dev, "data: %*ph\n",
> +			touch_num * BYTES_PER_POINT + 2, &buffer[IRQ_EVENT_HEAD_LEN]);
> +		return -EINVAL;
> +	}
> +
> +out_touch_handler:
> +	cd->ts_event.event_type = GOODIX_BERLIN_EVENT_TOUCH;
> +	goodix_berlin_parse_finger(cd, touch_data, buffer, touch_num);
> +
> +	return 0;
> +}
> +
> +static int goodix_berlin_event_handler(struct goodix_berlin_core *cd)
> +{
> +	int pre_read_len;
> +	u8 pre_buf[32];
> +	u8 event_status;
> +	int error;
> +
> +	pre_read_len = IRQ_EVENT_HEAD_LEN + BYTES_PER_POINT * 2 +
> +		       COOR_DATA_CHECKSUM_SIZE;
> +
> +	error = regmap_raw_read(cd->regmap, cd->params.touch_data_addr, pre_buf,
> +				pre_read_len);
> +	if (error) {
> +		dev_err(cd->dev, "failed get event head data\n");
> +		return error;
> +	}
> +
> +	if (pre_buf[0] == 0x00)
> +		return -EINVAL;
> +
> +	if (!goodix_berlin_check_checksum(pre_buf, IRQ_EVENT_HEAD_LEN)) {
> +		dev_warn(cd->dev, "touch head checksum err : %*ph\n",
> +			 IRQ_EVENT_HEAD_LEN, pre_buf);
> +		return -EINVAL;
> +	}
> +
> +	event_status = pre_buf[0];
> +	if (event_status & GOODIX_TOUCH_EVENT)
> +		return goodix_berlin_touch_handler(cd, pre_buf, pre_read_len);
> +
> +	if (event_status & GOODIX_REQUEST_EVENT) {
> +		cd->ts_event.event_type = GOODIX_BERLIN_EVENT_REQUEST;
> +		if (pre_buf[2] == GOODIX_REQUEST_CODE_RESET)
> +			cd->ts_event.request_code = GOODIX_BERLIN_REQUEST_TYPE_RESET;
> +		else
> +			dev_warn(cd->dev, "unsupported request code 0x%x\n", pre_buf[2]);
> +	}
> +
> +	goodix_berlin_after_event_handler(cd);
> +
> +	return 0;
> +}
> +
> +static void goodix_berlin_report_finger(struct goodix_berlin_core *cd)
> +{
> +	struct goodix_berlin_touch_data *touch_data = &cd->ts_event.touch_data;
> +	int i;
> +
> +	mutex_lock(&cd->input_dev->mutex);

I do not see any need for a mutex here; this function is only ever called from
a threaded handler declared with IRQF_ONESHOT; it cannot become re-entrant. In
case I have misunderstood, please let me know.

> +
> +	for (i = 0; i < GOODIX_MAX_TOUCH; i++) {
> +		bool pressed = touch_data->coords[i].status == GOODIX_BERLIN_TS_TOUCH;
> +
> +		input_mt_slot(cd->input_dev, i);
> +		input_mt_report_slot_state(cd->input_dev, MT_TOOL_FINGER, pressed);
> +
> +		if (touch_data->coords[i].status == GOODIX_BERLIN_TS_TOUCH) {
> +			dev_dbg(cd->dev, "report: id[%d], x %d, y %d, w %d\n", i,
> +				touch_data->coords[i].x,
> +				touch_data->coords[i].y,
> +				touch_data->coords[i].w);
> +
> +			touchscreen_report_pos(cd->input_dev, &cd->props,
> +					       touch_data->coords[i].x,
> +					       touch_data->coords[i].y, true);
> +			input_report_abs(cd->input_dev, ABS_MT_TOUCH_MAJOR,
> +					 touch_data->coords[i].w);
> +		}
> +	}
> +
> +	input_mt_sync_frame(cd->input_dev);
> +	input_sync(cd->input_dev);
> +
> +	mutex_unlock(&cd->input_dev->mutex);
> +}
> +
> +static int goodix_berlin_request_handle(struct goodix_berlin_core *cd)
> +{
> +	/* TOFIX: Handle more request codes */
> +	if (cd->ts_event.request_code != GOODIX_BERLIN_REQUEST_TYPE_RESET) {
> +		dev_info(cd->dev, "can't handle request type 0x%x\n",
> +			 cd->ts_event.request_code);
> +		return -EINVAL;
> +	}
> +
> +	gpiod_set_value(cd->reset_gpio, 1);
> +	usleep_range(2000, 2100);
> +	gpiod_set_value(cd->reset_gpio, 0);
> +
> +	msleep(GOODIX_NORMAL_RESET_DELAY_MS);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t goodix_berlin_threadirq_func(int irq, void *data)
> +{
> +	struct goodix_berlin_core *cd = data;
> +	int error;
> +
> +	error = goodix_berlin_event_handler(cd);
> +	if (likely(!error)) {
> +		switch (cd->ts_event.event_type) {
> +		case GOODIX_BERLIN_EVENT_TOUCH:
> +			goodix_berlin_report_finger(cd);
> +			break;
> +
> +		case GOODIX_BERLIN_EVENT_REQUEST:
> +			goodix_berlin_request_handle(cd);
> +			break;
> +
> +		/* TOFIX: Handle more request types */
> +		case GOODIX_BERLIN_EVENT_INVALID:
> +			break;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
> +					  const struct input_id *id)
> +{
> +	struct input_dev *input_dev;
> +	int error;
> +
> +	input_dev = devm_input_allocate_device(cd->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	cd->input_dev = input_dev;
> +	input_set_drvdata(input_dev, cd);
> +
> +	input_dev->name = "Goodix Berlin Capacitive TouchScreen";
> +	input_dev->phys = "input/ts";
> +	input_dev->dev.parent = cd->dev;

This last line is not necessary as devm_input_allocate_device() already
does it for us.

> +
> +	memcpy(&input_dev->id, id, sizeof(*id));

I do not think deep copy is necessary here; please let me know in case I
have misunderstood.

> +
> +	/* Set input parameters */

This comment is not necessary.

> +	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_X, 0, SZ_64K - 1, 0, 0);
> +	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_Y, 0, SZ_64K - 1, 0, 0);
> +	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> +
> +	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
> +
> +	error = input_mt_init_slots(cd->input_dev, GOODIX_MAX_TOUCH, INPUT_MT_DIRECT);
> +	if (error)
> +		return error;
> +
> +	return input_register_device(cd->input_dev);
> +}
> +
> +static int goodix_berlin_pm_suspend(struct device *dev)
> +{
> +	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
> +
> +	disable_irq(cd->irq);
> +
> +	return goodix_berlin_power_on(cd, false);
> +}
> +
> +static int goodix_berlin_pm_resume(struct device *dev)
> +{
> +	struct goodix_berlin_core *cd = dev_get_drvdata(dev);
> +	int error;
> +
> +	error = goodix_berlin_power_on(cd, true);
> +	if (error)
> +		return error;
> +
> +	enable_irq(cd->irq);
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_SIMPLE_DEV_PM_OPS(goodix_berlin_pm_ops,
> +			     goodix_berlin_pm_suspend,
> +			     goodix_berlin_pm_resume);
> +
> +static void goodix_berlin_power_off(void *data)
> +{
> +	struct goodix_berlin_core *cd = data;
> +
> +	goodix_berlin_power_on(cd, false);
> +}
> +
> +int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> +			struct regmap *regmap)
> +{
> +	struct goodix_berlin_core *cd;
> +	int error;
> +
> +	if (irq <= 0)
> +		return -EINVAL;

Please include a dev_err() here.

> +
> +	cd = devm_kzalloc(dev, sizeof(*cd), GFP_KERNEL);
> +	if (!cd)
> +		return -ENOMEM;
> +
> +	cd->dev = dev;
> +	cd->regmap = regmap;
> +	cd->irq = irq;
> +
> +	cd->reset_gpio = devm_gpiod_get_optional(cd->dev, "reset", GPIOF_OUT_INIT_HIGH);

You can simply use 'dev' instead of 'cd->dev' here and throughout.

> +	if (IS_ERR(cd->reset_gpio))
> +		return dev_err_probe(cd->dev, PTR_ERR(cd->reset_gpio),
> +				     "Failed to request reset gpio\n");
> +
> +	cd->avdd = devm_regulator_get(cd->dev, "avdd");
> +	if (IS_ERR(cd->avdd))
> +		return dev_err_probe(cd->dev, PTR_ERR(cd->avdd),
> +				     "Failed to request avdd regulator\n");
> +
> +	cd->iovdd = devm_regulator_get(cd->dev, "iovdd");
> +	if (IS_ERR(cd->iovdd))
> +		return dev_err_probe(cd->dev, PTR_ERR(cd->iovdd),
> +				     "Failed to request iovdd regulator\n");
> +
> +	error = goodix_berlin_input_dev_config(cd, id);
> +	if (error < 0) {
> +		dev_err(cd->dev, "failed set input device");
> +		return error;
> +	}

I recommend calling this after goodix_berlin_get_ic_info(); no need to go
through all this trouble if the device is not there.

> +
> +	error = devm_request_threaded_irq(dev, irq, NULL,
> +					  goodix_berlin_threadirq_func,
> +					  IRQF_ONESHOT, "goodix-berlin", cd);
> +	if (error) {
> +		dev_err(dev, "request threaded irq failed: %d\n", error);
> +		return error;
> +	}

Typically, the interrupt should be the last resource to be registered. At
this stage the device is not powered and the IRQ pin may be in an invalid
state.

> +
> +	dev_set_drvdata(dev, cd);
> +
> +	error = goodix_berlin_power_on(cd, true);
> +	if (error) {
> +		dev_err(cd->dev, "failed power on");
> +		return error;
> +	}
> +
> +	error = devm_add_action_or_reset(dev, goodix_berlin_power_off, cd);
> +	if (error)
> +		return error;
> +
> +	error = goodix_berlin_read_version(cd);
> +	if (error < 0) {

	if (error)

> +		dev_err(cd->dev, "failed to get version info");
> +		return error;
> +	}
> +
> +	error = goodix_berlin_get_ic_info(cd);
> +	if (error) {
> +		dev_err(cd->dev, "invalid ic info, abort");
> +		return error;
> +	}
> +
> +	dev_dbg(cd->dev, "Goodix Berlin %s Touchscreen Controller", cd->fw_version.patch_pid);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(goodix_berlin_probe);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Goodix Berlin Core Touchscreen driver");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> 
> -- 
> 2.34.1
> 

Kind regards,
Jeff LaBundy
