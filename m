Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F42486316
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 11:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238092AbiAFKoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 05:44:22 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58566 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238072AbiAFKoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 05:44:17 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206AQKAu020260;
        Thu, 6 Jan 2022 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=ddaxfcGNlehFazQdvbcFdidESgsVhv+768zKOt6NfRA=;
 b=ceDhdfS4YmgoCXaiiQBLqYQiIN5O2Q+gmFA0l0x7iLhormjg3MsTu6KiNGdIh/PPROqx
 bOaW1EE/fFlO/7gkYMxZE8ioNoyEg4HBCnzgo/sTwcNftv63EA0VqWJsZxYdnpT8OhCE
 1INlYBbf5mmuVUinh5Yac9a6Cddp5oURHIc32Ql57eacUxdUPyTeuNwVSahNirsG8oBH
 qaXwkZNU3lyZLgIfA4qrTCe+eKqujzezYiaznEdH+D0g6KnM4oKKqL5a8xNh1T2/4Fed
 TWOSK4VDwFMU5J3sQXStBgBGVNYMG4Y7oYgWvJPpP/rbkgySPVT51g8gYlDwGpFRqOaM WQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ddmpdhccy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jan 2022 10:44:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 206AeBmB062134;
        Thu, 6 Jan 2022 10:44:02 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
        by aserp3030.oracle.com with ESMTP id 3ddmqhdxpx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jan 2022 10:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhhjhERkyIRSn5HthWjD9YVPGCcNl//NTYW+Ry3Z+ZFhMSu+i3i6cDoXMaSrkRq2cigWm3SXTTEVp+qpUQFhoF0Gd2AShi2PcnR0wbg9usE6E69dfG62hlxUycZeEu2Nl7CUTccVzco8qwVAYAOCEpa5nu04O+Z6iAj10Ad4V6BGssMM27Zp9RTumge8VPz+5hDK5y0T5Pv8OSigdMT+MdGynA33kUDaMt6v3xMU4qEnIMAIsAD1pJQL3dYhcNLMYIbL4Z/ljzrxnfA9jyQMk9XStDP+NGdrrhkFDOEmME7wvfV0MvJNxy5asXwSgsVd65yTxhZLXTpteUsJ+W3+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddaxfcGNlehFazQdvbcFdidESgsVhv+768zKOt6NfRA=;
 b=MtslZlAbUzXAwSOFSKal7KfWKJRQ0gtrNWxgzQ6hUyY0WpbnMlT/jVaW7J6EvmrDBZem9bFgGdtRC9YAGGgpWExuVtdFKH7booTExs/63N0Pm/UIk0IEgvXKqS/VyLJODaymzEVutUaELChWkREBIOu7Ot7tFpYH6x0Tcqoxa0HUUf01xjxoDM1pg27oOAMPAgZSX6tzJxK45MPcYOiurjrenQaRRYQTDY01lVEnetI7hB2sunNcDuEHOZ5k9kJvIbsAT7TxsKF/d+K38AyV//thU31pcK/bEeBiNRWJhHdP/jVHCIrKsz7j7nJklcxUQB0g3Mx2NGZg7AMxcQi0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddaxfcGNlehFazQdvbcFdidESgsVhv+768zKOt6NfRA=;
 b=JKkWfHZG8OvvypAXV/W21ru1F2RmBT41LG87hqrYBBDNnSyG0m8GXmyiEOSom9G+PRRnpsqQUO8W1UCke5I5U3Pwzwxx5vtPt/nBXkQbaTswy0flAe9UwGf7s8h3mEHFuPRC5eOp9LJL/ezfx8+6vXsBOAeKH26hCPw8V/MNyGo=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5714.namprd10.prod.outlook.com
 (2603:10b6:303:19b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Thu, 6 Jan
 2022 10:43:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 10:43:58 +0000
Date:   Thu, 6 Jan 2022 13:43:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/8] typec: mux: Allow multiple mux_devs per mux
Message-ID: <202112282331.V8Kkx4jf-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228052116.1748443-7-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0063.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a49804f7-6762-4de6-07ec-08d9d101713c
X-MS-TrafficTypeDiagnostic: MW5PR10MB5714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW5PR10MB5714692E191DFA42458E0E738E4C9@MW5PR10MB5714.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iS2LAR4XvMWX2mhK8/Vfi6gGUxUZNa8mX/2MjIf8IZU6lQO4QwxCFrzHLnJ5QrMiuh9ZyPXyLAj5YSAyNl0x7k+jp23o3Rckd8lVVbCGzGVzXBOUv3GqzMtjCvZi2u+uJ5nJ5+v1VNcZ88kKtN1l0DqMA6LG8SZKDXCHDOjzt+wWwGSimbYOzaLCyQGEon0yvNxxZEP65YHyq1R+h0kDtZ6ApQ1rdo2YP9Q5oLqR+WG9w0seyazAiRM6R753np10H1vmiG4iZP4iFzcA10Us9dUOLEs7pFgstsSAJJ5BvO8BF0NM3LwIARS1DZE/S9xNHj4cpSffxIHOMJy7ScTpQLqRWwdnNMAWOV8P7JxQYgyK2UDbw8VE8AoJ/XiI6+7f7/D1Goyb4WCBnj5NhcGgz6PzD1vYuZtL97DLX9j+yqio3eZc6WL5gmNHBWvY2xkTTstHCebDWvfu46ak3eZuUDL2A7dsUb7+s+hkrZaoh+Dv7EeV6TMY4Kx1Kh7Cm1agvnhUfdOw827NVxfYIIsc5mYCh7bahGZTlTIaGDW5388YUEAA9GGuFxXlz65bIqMQGczZgGvgEZDVfORa5vYPjKBOeDM1cHqghBDTdmZ6DeQDnoPl2vVv0IVTrATuqqvtuWo8t2X/Xsxv6BrnNzj+apKSZNT9t8f5Gf9v+VKb+ooQ2JYU0soLrPAXn8843VGm+7H4WhyZLZyJcsB4ciALHjb42+RGXKnVZ5hHx38taHVVtweYUJgNHddDFEpo8V28HEs74hdf6rxiE3sKsBo3Dwwvd10RLwoz5q6Iygg8WLbZW2qhUll651FdDcnRZz/5yEWdME6hgXhPh0W/JxuzTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(6512007)(508600001)(9686003)(66476007)(4001150100001)(83380400001)(86362001)(4326008)(36756003)(110136005)(186003)(5660300002)(6486002)(966005)(1076003)(44832011)(6666004)(6506007)(316002)(2906002)(7416002)(66946007)(8936002)(26005)(66556008)(52116002)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LCDkcGel76O2QVP9ecizDYsI3/EWbBg6lafKqxw2RfrGX+IsnZn61BdEOsgi?=
 =?us-ascii?Q?V9TuQ+ld6gfFTA/IuPKblo8ff47ZV2sJTj4AHPLE5B1YmDWCwXGiTXFn2/7m?=
 =?us-ascii?Q?IXGzyvzLuiakcm45lA1fGTwjufOD65cLpuiniwzClih5YceMZgO2VuaW4QZg?=
 =?us-ascii?Q?REQ1RxKXJefU9nPrvwc5wQbiLmFpC+KRHC7ggtH04Rbmroswqemy9qVOm2gk?=
 =?us-ascii?Q?b4uo7HUolWp6TfW2p3kleCNOrv902MG4IfrAVYZI3tJUCw7YvifvtY7f6/FO?=
 =?us-ascii?Q?BWOyLXJJMuuqfS1yx8MhiA9skjMCHDQqTbt0Nrf7Od/giy+SoVxwf3QIZvRN?=
 =?us-ascii?Q?FMEfp+zRV7ug5V3flIgz8V+00xqYeJR/nA/U6XmZXF1QjksFGS4m134hrXJC?=
 =?us-ascii?Q?OfQfu/5ODWJVByw/Kx8ENHbqEA8vU40yS2lPZEutmp2U+WNyusD9hYFOQ5AG?=
 =?us-ascii?Q?fgaJ4t5/51nUdBth86IPwSQq/WPPlat1uYLNeblB3mbdeT2xvpuADCt6OSHL?=
 =?us-ascii?Q?sMFgn1/+fpO/ChrqxGNJKUQdkYTYbPnyXlsQgkGaLCXFJUlvYtjYjMSurItg?=
 =?us-ascii?Q?bRy/WOnmWjqIvLGP7yewgbnlq1WmfLJvNz3DvK6e4P5Sbd106FQZEaijS4Tp?=
 =?us-ascii?Q?2G0uufvxt7a+y1Sdl9bQa/Ela4HUlXh8CzzhGymhJk3A+8m+oaa+7Glf5D8S?=
 =?us-ascii?Q?Ob0/+LIgMJTUTnzolK5Xotb/YR8qy+EQ1n3N6MIiUN9kgTpY6ITV7Q6dP66c?=
 =?us-ascii?Q?e3ir5GyVcbLmicTzKCH6rDtDj8hYpSp0xF3rdSFQ6Tg/LaAyeu2OtYBixoqX?=
 =?us-ascii?Q?GsyT8K4k2oifkpmhelclZaGcrtKLx19lYXbP8AEVBfCX1+hyN/H2WH2Ulvif?=
 =?us-ascii?Q?tBW14UtAcOCqYfeLr6D5Q9S8JdsBBLPCmlzM3u8OUSZ10qDS9g6GeSBUfle9?=
 =?us-ascii?Q?PblPph3gmp142cuatqxJKk0WGoAoERAEbGxYm/9CZBjwE73eTrG3/NbQn7r5?=
 =?us-ascii?Q?fN7JaS1DoA7w1/JQ5XAc1qfao0S9T/MJ9vXF7t3tzpwm6GodF/QNEuX2g1tl?=
 =?us-ascii?Q?g1Ej+aEZyGEy8H8KllWwYFHzPbgc8pr/UuthxCO3AZ7EbhvyyUv19kaWgnmn?=
 =?us-ascii?Q?QSCeBAZYZFI+GIHJzEdB0YgEXhWA9gUy5GhAHF1KlgHu2B7u2bJQ7dsKVJIh?=
 =?us-ascii?Q?n+msAwrpQbv5Q6PFP9e3hZl2wvFHAfIqZzMWfF64FLNuQfjsreHlPGwe3H6u?=
 =?us-ascii?Q?f3pAiu/5TaWToIy/GwgXNJdLXLJ2I7ZvpoJ5urIud+iYRMrg3YsRJNptc+eu?=
 =?us-ascii?Q?Gm+P9iEHSFdf1XjeMONcXRit?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49804f7-6762-4de6-07ec-08d9d101713c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 10:43:57.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmceLzDv+mTbTCqw7lZWkbkjTySiz0jl5k5igK2sggtbVp0ZutOmUFovCVmkPzofENq2/0I33eQLFHiLEbuO9Lsf7NR8dFAbRYC+rWVkhIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2112160000
 definitions=main-2201060075
X-Proofpoint-ORIG-GUID: XisC2EhtHRS0jyUblIqN4bmcBE4QjsqL
X-Proofpoint-GUID: XisC2EhtHRS0jyUblIqN4bmcBE4QjsqL
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/typec-mux-Introduce-support-for-multiple-TypeC-muxes/20211228-132045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-randconfig-m001-20211228 (https://download.01.org/0day-ci/archive/20211228/202112282331.V8Kkx4jf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/mux.c:114 fwnode_typec_switch_get() warn: possible memory leak of 'sw'
drivers/usb/typec/mux.c:373 fwnode_typec_mux_get() warn: possible memory leak of 'mux'

vim +/sw +114 drivers/usb/typec/mux.c

d1c6a769cdf466 Heikki Krogerus 2020-03-02   71  struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
bdecb33af34f79 Heikki Krogerus 2018-03-20   72  {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   73  	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
bdecb33af34f79 Heikki Krogerus 2018-03-20   74  	struct typec_switch *sw;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   75  	int count;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   76  	int err;
8ddb6d277ef580 Bjorn Andersson 2021-12-27   77  	int i;
bdecb33af34f79 Heikki Krogerus 2018-03-20   78  
8d7c70bd032dda Bjorn Andersson 2021-12-27   79  	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
8d7c70bd032dda Bjorn Andersson 2021-12-27   80  	if (!sw)
8d7c70bd032dda Bjorn Andersson 2021-12-27   81  		return ERR_PTR(-ENOMEM);
8d7c70bd032dda Bjorn Andersson 2021-12-27   82  
8ddb6d277ef580 Bjorn Andersson 2021-12-27   83  	count = fwnode_connection_find_matches(fwnode, "orientation-switch", NULL,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   84  					       typec_switch_match,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   85  					       (void **)sw_devs,
8ddb6d277ef580 Bjorn Andersson 2021-12-27   86  					       ARRAY_SIZE(sw_devs));
8ddb6d277ef580 Bjorn Andersson 2021-12-27   87  	if (count <= 0) {
8d7c70bd032dda Bjorn Andersson 2021-12-27   88  		kfree(sw);
8ddb6d277ef580 Bjorn Andersson 2021-12-27   89  		return NULL;
8d7c70bd032dda Bjorn Andersson 2021-12-27   90  	}
8d7c70bd032dda Bjorn Andersson 2021-12-27   91  
8ddb6d277ef580 Bjorn Andersson 2021-12-27   92  	for (i = 0; i < count; i++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   93  		if (IS_ERR(sw_devs[i])) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27   94  			err = PTR_ERR(sw_devs[i]);
8ddb6d277ef580 Bjorn Andersson 2021-12-27   95  			goto put_sw_devs;

"sw" not freed on this path.

8ddb6d277ef580 Bjorn Andersson 2021-12-27   96  		}
8ddb6d277ef580 Bjorn Andersson 2021-12-27   97  	}
8ddb6d277ef580 Bjorn Andersson 2021-12-27   98  
8ddb6d277ef580 Bjorn Andersson 2021-12-27   99  	for (i = 0; i < count; i++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27  100  		WARN_ON(!try_module_get(sw_devs[i]->dev.parent->driver->owner));
8ddb6d277ef580 Bjorn Andersson 2021-12-27  101  		sw->sw_devs[i] = sw_devs[i];
8ddb6d277ef580 Bjorn Andersson 2021-12-27  102  	}
8d7c70bd032dda Bjorn Andersson 2021-12-27  103  
8ddb6d277ef580 Bjorn Andersson 2021-12-27  104  	sw->num_sw_devs = count;
bdecb33af34f79 Heikki Krogerus 2018-03-20  105  
bdecb33af34f79 Heikki Krogerus 2018-03-20  106  	return sw;
8ddb6d277ef580 Bjorn Andersson 2021-12-27  107  
8ddb6d277ef580 Bjorn Andersson 2021-12-27  108  put_sw_devs:
8ddb6d277ef580 Bjorn Andersson 2021-12-27  109  	for (i = 0; i < count; i++) {
8ddb6d277ef580 Bjorn Andersson 2021-12-27  110  		if (!IS_ERR(sw_devs[i]))
8ddb6d277ef580 Bjorn Andersson 2021-12-27  111  			put_device(&sw_devs[i]->dev);
8ddb6d277ef580 Bjorn Andersson 2021-12-27  112  	}
8ddb6d277ef580 Bjorn Andersson 2021-12-27  113  
8ddb6d277ef580 Bjorn Andersson 2021-12-27 @114  	return ERR_PTR(err);
bdecb33af34f79 Heikki Krogerus 2018-03-20  115  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

