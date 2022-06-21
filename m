Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476C1552B44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 08:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346204AbiFUGqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 02:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239480AbiFUGqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 02:46:19 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D610D1C121;
        Mon, 20 Jun 2022 23:46:18 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L0qdhD031178;
        Tue, 21 Jun 2022 06:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=nObtXQFnj9nspfwJ4u3GY2uUVEP+rI34OY8nhtLb+48=;
 b=vCXwUBOkwqvQUaSY1FLBrdAQTEMduNExrzlbb87CwQHZI2v6yj4hOMcESkhVYjtKxP3/
 wZOfKzlYkMvlSp2uHJq3XeFMz5nud1r127fSKpW5A4ukHZ7Qe3luV0HWNL4gBgLbM4BI
 rMfwhY23lx7PuW6NN42NAf6OpuAb5/DsHRf/8KSS60lWvlHuWG2lAKQQy79eDNFqhEHf
 LFIHHiBP11OfAbGyc4rN8XrxIybCf/kJsG/kG4+xqJ4L6ToG62x72LOTlLMKpQHnzerN
 1RZEpSOFXcVIUHi2eGDxKjBHwfe18THgPR8l4UmRYcJJJOZ8dCVqKhtz8x0qOrnjFtFN 3g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6kf4n7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 06:46:03 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25L6egTC011206;
        Tue, 21 Jun 2022 06:46:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtd9tub01-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 06:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7A+z5Ipu7GKf27CpFy9GFdMDoeCgnQsyGd6CAIEw5sdcWZLq1hLRY/eZkF9nEDOGme+Nk7nsOHK6Xg1L71BzMIrF+2NGIUiQC9wBi3LPCqsdAddK2hhRxRjFXhfFI/imupYhu0A9yQzN/rTFfwkA8aw7iURcADa+WnRGgAkjCEeQOOBn4mo8qMY8Z4Z3GGM9OpDezewgBgg9WC517A6kU1S52PwjAwirL+vYehM91QZRXtaOv96AAPGLmJIQQ74jiXcwsZaJm+MNRgGUZfS7A0nxJ7C/sWSWYpIafdR8UCLqlHqg6K2M/SzzgyZqzIBXEHqdogUUpDJa46OZbb6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nObtXQFnj9nspfwJ4u3GY2uUVEP+rI34OY8nhtLb+48=;
 b=FlMOTTsvTZHqqEwNMQO2jumyQhQVChY2K83p0BroYiYyHPdf6GyD7kcfoABRo5Kv+BxzA5JVmDaTU9r3IC5mmExPYAa3pVQZ2sxibdlHOC/kIn6FaiYcf0ZHhPXx34i5faqF464xGK3ZOYGsp5R4i8B35YM9J1FXUU9wEmcEzNWadIC/vf+Yq9fu908j4yDbsfByeuy/k3/qiLaQcy3qLYrys0wr8SSWFyqUZ0TumWVxZQojlZUvU/gtDzvOwOVdh/WfsdB1O2MC13bETHlur5w1RbZIujtxW0VlyRYgAAsNsQrJhQBWpgeOVcn/XKKxqShNOCdqirOB4RRbOpENRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nObtXQFnj9nspfwJ4u3GY2uUVEP+rI34OY8nhtLb+48=;
 b=XPR+dXo7E6gXBsLoKUcKxSMeSLmk/ODjH9HW8JDQMAnZddeP3/wyDZDAgXcqi0xnQVxJLFr3quxR4RReCvnvjKSVJbASr8VZuIi0o0mOS1JasWqnwKBsFIuSADd0pXeYOyCCW1PydNbuFdpdSC0WU0KDzzGVnTrF+cBDdAw8JPM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4617.namprd10.prod.outlook.com
 (2603:10b6:806:118::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 06:46:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 06:46:00 +0000
Date:   Tue, 21 Jun 2022 09:45:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [kbuild] Re: [PATCH] clk: qcom: common: use parent_hws in
 _qcom_cc_register_board_clk()
Message-ID: <202206210257.lD0x1WPz-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org>
Message-ID-Hash: I3RIBYGVOPTARPVC6EXC4NWLMN3QPLFU
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33c1712f-8d60-405c-7c98-08da5351b420
X-MS-TrafficTypeDiagnostic: SA2PR10MB4617:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4617B30B8F4CD602DF0425228EB39@SA2PR10MB4617.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8qyuC1NbgiX32SEIhtiey/wa7xGTmAfenhtMyAO9OsAh0EelCFdSBd9Vz/QOENaNJh5ly6wgRM2SI+tWPAlEvrDST8XVULq63I1/4UOK33KcLWhFMC2tU++xGEhHxXj5ZS3YM8LF9SoFiVmngein0IMo0AxRACdh0x2qrE1xHfiai3EDAiG3SQjyxJripwX/PmN9r/iwDLA4dOpUIsB9tJ1KZcfl0Fdsm7sBJrVadI/0gPS38R5zW3UchcI1MVAaH/UbxHMnvJhb2B5/Uu1RVJFUKR3dg/LKk66C0KuRvFVYkjKWpY1sJPIWUqbFKnkVQszQoRlZOF7WkggE6gIfFRDF2vAu2mxXR78hwN/KrRu7Jk/UZn/DsLIBHM6gdLoFHfeGXEO56ypR7SWxhtJIonbiyZvIjRITRaay3qOFsAwLVL0bXkEaGHuM/x8ENZ0EPnCKq8ftb1Qm8SDzr2cNYxJ0m8WaDI5sPo3yHdw5uoyvvOIZlN0usa9fXEP9QkBqH63FXFdJxR21kSCD9LBh0OXpvHpOkI3acuMCwj4rRMPpdZOWf+xW4gpuBxEB64nWJuD+lfYX286gls1QPxY/b+2go/pt8kvI/DXJd3e0Znlv2ccom++uk0J4yEwrrPpAlphHSO+heBlPtc0whGNKc0I08menVQIqqVRg/fmuKEOOHoeHV8LF8nn5GLFM2Sb5kdYPzaCRZPfhH3BqN2yjZnxifkzXX3e6UVssanJfR9N5bBvjb/JsJhMDMP/vY/Hay69AS7KfGwIt58uy3wI0yZJUCIeiRIHgGcCO3fNu3LymFcandb1+2W72tV+GgIysV1sj2HCSQ+CUxxQZhuZdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(366004)(136003)(39860400002)(26005)(6512007)(41300700001)(86362001)(6506007)(1076003)(9686003)(6666004)(38350700002)(186003)(66476007)(52116002)(38100700002)(66556008)(4326008)(44832011)(7416002)(83380400001)(8676002)(36756003)(5660300002)(8936002)(2906002)(4001150100001)(316002)(966005)(66946007)(6486002)(478600001)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NH80+GtCbqySUJW4cB4Y7Cp4ocGc119uYu9AB3h98eNB3ChJbbnYQY3G8xR9?=
 =?us-ascii?Q?eDafaG01y4SQiVmrzfz/56yCrxQ0lWlllct+dOYsS18tXRxER0gBmgT+7Ia+?=
 =?us-ascii?Q?PvwcjgUFoN92ELK0j4f7efQs76sNXhOB9KgHhSVqAyib2hK0d7AyqaCP9j7E?=
 =?us-ascii?Q?RSrVTL9AMazlOu/t9ajd1jQn0KUqGeVHnH8UJSZsXFSIrTZ0N9g2tS6ee6vl?=
 =?us-ascii?Q?d9mmN2OGRzCJuXSNMNyYyMWDf5qk6uWXYo7/w/s/ezFDh3wkOL/MImZ0kUG1?=
 =?us-ascii?Q?7Gnyk1Kfeae4Usvo7aVIEJs0bYgRJd7z9y5NpxtcxpQvgSCNgHj3NTpuwluT?=
 =?us-ascii?Q?W1+djwwkntZ4hihGzKmMeObyG0mWg8yG9RYUg3TM7Hy6vUGmp1VRsZ6qMDUv?=
 =?us-ascii?Q?wrqeqvyxBxYvTJ7fpPYpwo3zGgXXe1G6c2T6aPZnH5Sp35P2FOM0V6qKfrxZ?=
 =?us-ascii?Q?P8zzWZLBW8mLydb0XA4LiuOWdMMPgLIq6JsKjVQ0vJ+RPT7SqnI4ug9DCirl?=
 =?us-ascii?Q?ijofc+3Kp5CZkgZssoY591eoDRiuAI3PZ83CatXBNZznPU+WVisfU8pg5b/w?=
 =?us-ascii?Q?p6qkvTPGHepf/E0E41m63nXOQndFZaj5lExJ/ECCYH9NaSbEOW6XebpiHlxH?=
 =?us-ascii?Q?mpZ8KNw/jPYqJNpOw/+6mIsb+vAHbaxD/HMFPLi/TaG+m7F5RtzXQw1izqPZ?=
 =?us-ascii?Q?pDaTjhoR2BDQpsh+ph5UpyIvObgTmvRnfpEK3AtHopc1SGsgzG6ONHsNos74?=
 =?us-ascii?Q?ZSqUj86ZiO3Lhv3uRol/19LNSIipMHO7F58gNmsytYRFcEHYUkIp431oThP1?=
 =?us-ascii?Q?/amopur9ndF4ZlNMPKOtM8thqkukb0tsVY2vBrYEx6II1luMwBLXqPlWaZGN?=
 =?us-ascii?Q?LgOrPn7Zn9BVgzw4CjjqKMj1xLJMdw6q4emaSAMdXx6y+8iEPhW1iVCkodUV?=
 =?us-ascii?Q?kVSKvns53LWuuy+F5dSa+qTPJBkp4ImB52eAMc2MiXqZxMAbcHUFhS0hcTsk?=
 =?us-ascii?Q?YcVjFQtBZiEnUmmKbWBIp7gQtKknsyM8X1gNiyhwhof2K/alczxx2pEhIod9?=
 =?us-ascii?Q?zyZDqhH6Qk/aYuch/bo1Y4RrCfvm7W29Mz3+m78+7Cd9X0Au37767KK+ZoD0?=
 =?us-ascii?Q?TeuR3uOhDcOPvVidauKC2xgWp38Nf1c/BxC71/QVOP/JUOCK7UhR3d60AmGu?=
 =?us-ascii?Q?fpNE5oFPF+OuBrGKVg+FnB27nBRSQi6SKPt+jwKJg9xDPQOISeE0rrZdvKYP?=
 =?us-ascii?Q?jkVVDCUFtccWKb3CKiWYNIAZ8G8C49ZFuWktAf97nVBU+zgse0/zg8fjcHq0?=
 =?us-ascii?Q?TDaydiAoYzA/a5k6BNAdDHyjpc/l14cYsV+WZPQCuMZpoN4/aQL0MqRn4s4H?=
 =?us-ascii?Q?qtNS/ekVaN/RNHfABHJ9jaWkh2NphffanYvB1wmXd+mkiIx9JkCTVCKm0e2A?=
 =?us-ascii?Q?feYD185VsGPzYGVWOA720U7hU4y86j2/Y5opCzQmZa7lqmstT3P2tMQUKMMZ?=
 =?us-ascii?Q?hKXLCXCoUkIEWBXguAGgCICdigjjv1acyHXC5Gm+BM56yX9dAmzwMQI6afkd?=
 =?us-ascii?Q?br+1Y70FDQhNqfhIFnoBLnI+a7rI4jduJZxpiUmU7VF83i6wRCECO6QObMXY?=
 =?us-ascii?Q?CgLhOtDqIMvY80xtj9LbJ++PdB6kMrWh0YpFb52aDujxNbLrhUtOB3LXqLQd?=
 =?us-ascii?Q?5ktZNCyzGtrN6MJt0d12ZfMst60ap6gbhVKqqNr+9iXlp28Oez2M4VLeWNu6?=
 =?us-ascii?Q?FjHI8zPKg+QWFXtEXCjvvpX0bXawRp4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c1712f-8d60-405c-7c98-08da5351b420
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 06:46:00.7705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMCvbCXgtiGIv6uwIhMPD+RQx3hRwpjRenzTA9kkoGPL9j3aTqCVcZ6eB184coaIr5A2gtKqqJbB8c5SGBF0p17hsM/tcpSTn6P++RG2its=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4617
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_02:2022-06-17,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210028
X-Proofpoint-ORIG-GUID: UTdVJbLoInitrxvXM_1n4dzpBjXOB5VJ
X-Proofpoint-GUID: UTdVJbLoInitrxvXM_1n4dzpBjXOB5VJ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-common-use-parent_hws-in-_qcom_cc_register_board_clk/20220620-160242 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git  clk-next
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/archive/20220621/202206210257.lD0x1WPz-lkp@intel.com/config )
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/qcom/common.c:172 _qcom_cc_register_board_clk() error: uninitialized symbol 'fixed'.

vim +/fixed +172 drivers/clk/qcom/common.c

ee15faffef1130 Stephen Boyd     2015-10-26  129  static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
ee15faffef1130 Stephen Boyd     2015-10-26  130  				       const char *name, unsigned long rate,
ee15faffef1130 Stephen Boyd     2015-10-26  131  				       bool add_factor)
ee15faffef1130 Stephen Boyd     2015-10-26  132  {
ee15faffef1130 Stephen Boyd     2015-10-26  133  	struct device_node *node = NULL;
ee15faffef1130 Stephen Boyd     2015-10-26  134  	struct device_node *clocks_node;
ee15faffef1130 Stephen Boyd     2015-10-26  135  	struct clk_fixed_factor *factor;
ee15faffef1130 Stephen Boyd     2015-10-26  136  	struct clk_fixed_rate *fixed;
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ee15faffef1130 Stephen Boyd     2015-10-26  137  	struct clk_init_data init_data = { };
120c1552839036 Stephen Boyd     2016-08-16  138  	int ret;
ee15faffef1130 Stephen Boyd     2015-10-26  139  
ee15faffef1130 Stephen Boyd     2015-10-26  140  	clocks_node = of_find_node_by_path("/clocks");
43a51019cc8ff1 Johan Hovold     2017-11-11  141  	if (clocks_node) {
43a51019cc8ff1 Johan Hovold     2017-11-11  142  		node = of_get_child_by_name(clocks_node, path);
43a51019cc8ff1 Johan Hovold     2017-11-11  143  		of_node_put(clocks_node);
43a51019cc8ff1 Johan Hovold     2017-11-11  144  	}
ee15faffef1130 Stephen Boyd     2015-10-26  145  
ee15faffef1130 Stephen Boyd     2015-10-26  146  	if (!node) {
ee15faffef1130 Stephen Boyd     2015-10-26  147  		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
ee15faffef1130 Stephen Boyd     2015-10-26  148  		if (!fixed)
ee15faffef1130 Stephen Boyd     2015-10-26  149  			return -EINVAL;
ee15faffef1130 Stephen Boyd     2015-10-26  150  
ee15faffef1130 Stephen Boyd     2015-10-26  151  		fixed->fixed_rate = rate;
ee15faffef1130 Stephen Boyd     2015-10-26  152  		fixed->hw.init = &init_data;
ee15faffef1130 Stephen Boyd     2015-10-26  153  
ee15faffef1130 Stephen Boyd     2015-10-26  154  		init_data.name = path;
ee15faffef1130 Stephen Boyd     2015-10-26  155  		init_data.ops = &clk_fixed_rate_ops;
ee15faffef1130 Stephen Boyd     2015-10-26  156  
120c1552839036 Stephen Boyd     2016-08-16  157  		ret = devm_clk_hw_register(dev, &fixed->hw);
120c1552839036 Stephen Boyd     2016-08-16  158  		if (ret)
120c1552839036 Stephen Boyd     2016-08-16  159  			return ret;
ee15faffef1130 Stephen Boyd     2015-10-26  160  	}

"fixed" is not set on else path.

ee15faffef1130 Stephen Boyd     2015-10-26  161  	of_node_put(node);
ee15faffef1130 Stephen Boyd     2015-10-26  162  
ee15faffef1130 Stephen Boyd     2015-10-26  163  	if (add_factor) {
ee15faffef1130 Stephen Boyd     2015-10-26  164  		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
ee15faffef1130 Stephen Boyd     2015-10-26  165  		if (!factor)
ee15faffef1130 Stephen Boyd     2015-10-26  166  			return -EINVAL;
ee15faffef1130 Stephen Boyd     2015-10-26  167  
ee15faffef1130 Stephen Boyd     2015-10-26  168  		factor->mult = factor->div = 1;
ee15faffef1130 Stephen Boyd     2015-10-26  169  		factor->hw.init = &init_data;
ee15faffef1130 Stephen Boyd     2015-10-26  170  
ee15faffef1130 Stephen Boyd     2015-10-26  171  		init_data.name = name;
daa853a735065a Dmitry Baryshkov 2022-06-20 @172  		init_data.parent_hws = (const struct clk_hw*[]){ &fixed->hw };
                                                                                                                  ^^^^^
Used here.  This would work if fixed were set to NULL at the start but
I kind of hate that it requires us to know that ->hw is the first member
of fixed struct.

ee15faffef1130 Stephen Boyd     2015-10-26  173  		init_data.num_parents = 1;
ee15faffef1130 Stephen Boyd     2015-10-26  174  		init_data.flags = 0;
ee15faffef1130 Stephen Boyd     2015-10-26  175  		init_data.ops = &clk_fixed_factor_ops;
ee15faffef1130 Stephen Boyd     2015-10-26  176  
120c1552839036 Stephen Boyd     2016-08-16  177  		ret = devm_clk_hw_register(dev, &factor->hw);
120c1552839036 Stephen Boyd     2016-08-16  178  		if (ret)
120c1552839036 Stephen Boyd     2016-08-16  179  			return ret;
ee15faffef1130 Stephen Boyd     2015-10-26  180  	}
ee15faffef1130 Stephen Boyd     2015-10-26  181  
ee15faffef1130 Stephen Boyd     2015-10-26  182  	return 0;
ee15faffef1130 Stephen Boyd     2015-10-26  183  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp 
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

