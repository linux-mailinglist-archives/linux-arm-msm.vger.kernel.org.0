Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD4F42109A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 15:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237895AbhJDNtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 09:49:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50548 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239025AbhJDNsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 09:48:46 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194DCXqt018669;
        Mon, 4 Oct 2021 13:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=PM+fZ13L35F+HSG+nVe6SKmcEM1lhdZt1kfiN1Ky9jI=;
 b=gpCPYZN0wdMA2G0KIO/L9kADzTj1FUGM9FavwfUwxE/dTwo//Q0FxM6Tvgx6B2DqEGlQ
 bTCYjyqUJQNkxL8FMXXhns4BsvRFyNNz6YzCLnfHkBL3Z7u9O68NtSw4T3rEoDEj3/oF
 3OuGvFIRxR192qdmoYuPONprIJnHkgnm0VKvnBCv66JuLmC4DMYGMXKz0jqldu9DJ3Bn
 k+ZkrnRdg9K5keB3sU6vjLriMaCuZCXJYPd2izYZZEjCLbYlKMoQotq9Z9jr7revqtoH
 eeXt12fs5ZtCiUvHYU5JYlF+taidN16qOGj5GMG6qqxb6iNtWkZl4tsBBJc1gBaMipic 8Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bf9m04hd4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 13:46:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194Decoo098440;
        Mon, 4 Oct 2021 13:46:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
        by userp3020.oracle.com with ESMTP id 3bf16re4cv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 04 Oct 2021 13:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfUVvkB6fQH4GvZcNBw0UDWri6U+Fec9QiAYmGj78YDREOM4K29NDLiubaZBTPnuL/UzD9N0KuRLBxVsOqDy/72bNmzXWRCQZecTVAPCjTSjunOD161QNl2G0vpj3QeZPJnUM1FNzh9UKuqlGv+Kwz2Vy/dWulzw29K8S0HT4X+ytAeDZOHzkXEAiR0lFGv8g2g+pJQLR9vGUQwRihBkwIxCreKMfdyGItDLgA9ooYp0/L99Jl268v8Qrisz2QDo6CtdJGF3HF3W4jGvRpezcen/i81cdTLdFdpQAsuV5Wb4vhFPMP7k2idBQgaeDkVNk5f6tCWhrD54XUBPQclkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM+fZ13L35F+HSG+nVe6SKmcEM1lhdZt1kfiN1Ky9jI=;
 b=XabR7SSc1tiUgvpNWFzm5uooiW6mjbCGWxZADOQxfjJyFUmuNoQb//EHX4L2OPQJ7sblms26A1otPObZDk0HM8y98NKlMjiSf6sTJVC/NXB7+2tVSTwKrFe9g2mSu7pLLiwObZfrWaGvxGbjeDR26KUPEPP0x+fGAzQqFeRRXCiiK+yttv2eu6FHVkGfPrT5gzZibQ5x9Upo1Q82ZH7nc4tXoZpee69V/JdbV2TN9BSPkux7XWElg8HyDYlwYc4nhmiS3L3/3Qm6rkHbAZlkQPMCQrx0FkUhm10X+YoVdPkvQ5d1h0wZhmezNNOL2gCevetClXJ0/B8pUcTxn4MHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM+fZ13L35F+HSG+nVe6SKmcEM1lhdZt1kfiN1Ky9jI=;
 b=uCEMcVXybLo7BzgZ+TQz1oGJzNOmMQTOM+yIdGejoNfhZuWB1sPXp98NWVtHKLs2bQWTaswaPYKV+hW9+zWxcwjWrNbC9cli9JRndWXFwUawkocWx8IMzfbc0Cqyo5hlEUpcYTspfUOlPV6csF/gcZT7hMvHHt2rq0sbcuTaNSI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1949.namprd10.prod.outlook.com
 (2603:10b6:300:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 13:46:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:46:34 +0000
Date:   Mon, 4 Oct 2021 16:46:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Add SDM845 DPU support
Message-ID: <20211004134624.GC11689@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::25) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend Transport; Mon, 4 Oct 2021 13:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed28f2d-c304-4473-32bd-08d9873d6139
X-MS-TrafficTypeDiagnostic: MWHPR10MB1949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1949DDD2887629C530CFF6D18EAE9@MWHPR10MB1949.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCMSm5uUgrxeM9VGOqja+zk6ZVk63hjAiHwtrj8ayVkvuQKexRmx04udn9XHmUKSuE06PieNsCNEA4FRqcGVBtu3ge7v2xS/NtqZ26ZUCNNtaNiNu2ePgj+MOAzG5Ld7mlvPBzGVjddKMiH/sk1CMRgOpeW5QXjepn9DCuLqn3oXjE8hNFHN63XyxUnGg7+ez+zqZpbCCDudPY3kt3v5/Mat0T/O4AGP4YIe9Uk8TTZ84cVI8R7WeZ/XDs5xiDPlKhktc+KfHdYiQAKWfEJXBRjlMf9B3nw+ll0+EF7y+cjl9sleoxxfOh0naPzoSRJIqQ7UHJ3B/0Pyog0FcYX/sCUK/dZBmux3z75ZUyyIMt/4r9cd39pUBI87K7s+2iYD7g2kDfhdibGyfRUjgr17LlwLebW6l5OrLj2FA/qp1OCnA/IcIGfEBFCcPKny5re+AH8H5qM+V+1HvnLy+L+hFYMBK84lFkz2sgkoMqXCUnZ0RmIqa2aAe9MlDl3AlT47riAACR5DnJwJy4EuTctlT2jSKQupdRepglY3zpWJ20mnUVjFP9N0mPTvFNhbzPrzUDLHHv5DDzvC5JK2YwiYWQxUFayublV8SPXeRoKJ3KJNQ2faaia8O/6knG1e7wIBnEmA9aiugyBzP66FQRHevTI9jhkUQ2nAmMatJWwC0FgFuX9WTETVaIW4XWkqiD8LYkvupBDZOzXquGeKYX1sLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(33716001)(26005)(66476007)(66946007)(6666004)(8936002)(2906002)(44832011)(1076003)(316002)(9576002)(8676002)(956004)(55016002)(186003)(38350700002)(83380400001)(6496006)(9686003)(33656002)(86362001)(52116002)(508600001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smjCXMFtIJOzcHvYscdqf47x5pf8TmwPqEFzeqGBSTBuiISHNbZ40xScRIGV?=
 =?us-ascii?Q?KLsKKBdC6bysSrQXhk7UMuaMmm0jPviptxb0l7MXVLwqk8QkVxfp+msSdNwe?=
 =?us-ascii?Q?pjX/5TdlLX5qxu6jnMsfj1p96OVs3kIXHXVV0z06AHovksZpJHWqgKI28xjV?=
 =?us-ascii?Q?ECcvFBW2MJC+7N3PzEro/i90UFOAfI6jndmjSm8nWrygV7lV0wYmj8CqyV41?=
 =?us-ascii?Q?t3tnohLiu0cTNyJgUahhtVBgahFQfrXkhoOQtCMllta9NfXxSGYXBcyZrnOl?=
 =?us-ascii?Q?LF3J26RpsFEGBt+mrZrwtokahcoH8Agex+hGNO5oT2yahBNKscdlyJYCvTX8?=
 =?us-ascii?Q?jqZ8aXmNLtmXeZyp6DADXxyT6uv0IuG4j/aX0/otQRS9nLGa0zKQfayLjYYe?=
 =?us-ascii?Q?QtCsiJgy/D+U2771HUNs4hpi4e2RDVLI7vRrviki40A6Xdp6dFLcr5cqaf+P?=
 =?us-ascii?Q?aYC//JGoK/rUSuYCi/rRw5TThddqNW3JKgwmVBHeSK1ifOARvm/OsLSW/88s?=
 =?us-ascii?Q?pYRUEC2jPZWQwXe/VqgJ3WiUhwj0bi11HHrI1pvruhrrsrRuKr4WPUyExTA2?=
 =?us-ascii?Q?7MKQ5If4N18y654vwKKqy/OzZi9O9gSqMVbHX4NnnnNHJwu4FZenji/6c4y3?=
 =?us-ascii?Q?785h8Vrk82FgKxC25FkjlLCGxYfZQgRtMCQA//fyWhcXxcwXQ4CyObk5YuNC?=
 =?us-ascii?Q?HfatQMED0Zj6SANS7OSPPWPe2FRvy8ZJeUo4q/egnfITbMJHCrNpfmd05+xb?=
 =?us-ascii?Q?AaACCUP1DXBFYa8RjuA1VF/ODmAL2+Do7s4wdbvmTFp3hKo3/TmRDUHaFR1S?=
 =?us-ascii?Q?WOsJ5nSm214XVwjdCHjDiCeXRLqQ+cdTcdbwUKB7ff884X8v/JY/3gWISWzi?=
 =?us-ascii?Q?wiqquak/VQUu4wbKz8xHKxt8FvREPajKWYHG4GgHagpGOoIQdlmxvaz9bXdK?=
 =?us-ascii?Q?V0a8BESUTUdmpFJmtk2udMHcvFhU+xggk5SQ8m2MOatZpYTpUTU6d2TZdeql?=
 =?us-ascii?Q?/YtNkka2+Q3k4xoreWjPvdikLLdsC0eCXScUrsIy6UkX0ahht/is/5r9E0kG?=
 =?us-ascii?Q?fCma0RRCmFgAV7MClp9aJISkmYoZz8sy38CTj2VtUGEjG5ZINHrsGw9wllxY?=
 =?us-ascii?Q?ZLpcXLRlKjx1Q738B0CyOxaBami4+pPrqgoPuuHUx7ZFiiv0+8k3gnjZcJed?=
 =?us-ascii?Q?KszzQF1XGx927FQlUH55HUyPfvS8F1pxr7bi0NDmI2B5gyvbpCPuWMbPKsJ7?=
 =?us-ascii?Q?HsBcoLiON8bcFtlp2eS01ihfsZiKVDe0hwzv2yjlGtWd8tnc7kHWuRidE9Dk?=
 =?us-ascii?Q?nZzD52Yttgu2Vlmo6ewOnUDb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed28f2d-c304-4473-32bd-08d9873d6139
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:46:34.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd/J4ITcuusoTBhZUoFtpKhkw31rndOrioUrMmb7PAMK9PWjApxoK96CBOr1Laih67aX8S9AgBq55Dzpb4GURnfNE6rlNuTwyIebkOC7rcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1949
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040094
X-Proofpoint-ORIG-GUID: 051bMiz9TfsLvHvBZs8nwGJOTeN6bgvM
X-Proofpoint-GUID: 051bMiz9TfsLvHvBZs8nwGJOTeN6bgvM
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello MSM Devs,

The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
27, 2018, leads to the following Smatch static checker warnings:

drivers/gpu/drm/msm/msm_gpu.c:301 msm_gpu_crashstate_capture() error: potential null dereference 'state->bos'.  (kcalloc returns null)
drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c:177 msm_disp_snapshot_add_block() error: potential null dereference 'new_blk'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:96 mdp5_plane_reset() error: potential null dereference 'mdp5_state'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c:98 mdp5_plane_reset() error: potential null dereference 'mdp5_state'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:963 dpu_crtc_atomic_check() error: potential null dereference 'pstates'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1009 dpu_crtc_atomic_check() error: potential null dereference 'pstates'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1075 dpu_crtc_atomic_check() error: potential null dereference 'pstates'.  (kzalloc returns null)
drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c:214 dpu_core_irq_preinstall() error: potential null dereference 'dpu_kms->irq_obj.irq_cb_tbl'.  (kcalloc returns null)
drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c:215 dpu_core_irq_preinstall() error: potential null dereference 'dpu_kms->irq_obj.irq_counts'.  (kcalloc returns null)

drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
    901 static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
    902                 struct drm_atomic_state *state)
    903 {
    904         struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
    905                                                                           crtc);
    906         struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
    907         struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
    908         struct plane_state *pstates;
    909 
    910         const struct drm_plane_state *pstate;
    911         struct drm_plane *plane;
    912         struct drm_display_mode *mode;
    913 
    914         int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
    915 
    916         struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
    917         int multirect_count = 0;
    918         const struct drm_plane_state *pipe_staged[SSPP_MAX];
    919         int left_zpos_cnt = 0, right_zpos_cnt = 0;
    920         struct drm_rect crtc_rect = { 0 };
    921 
    922         pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
                ^^^^^^^^^^^^^^^^^
There are a bunch of allocations with no checks for NULL

    923 
    924         if (!crtc_state->enable || !crtc_state->active) {
    925                 DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
    926                                 crtc->base.id, crtc_state->enable,
    927                                 crtc_state->active);
    928                 memset(&cstate->new_perf, 0, sizeof(cstate->new_perf));
    929                 goto end;
    930         }
    931 
    932         mode = &crtc_state->adjusted_mode;
    933         DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
    934 
    935         /* force a full mode set if active state changed */
    936         if (crtc_state->active_changed)
    937                 crtc_state->mode_changed = true;
    938 
    939         memset(pipe_staged, 0, sizeof(pipe_staged));
    940 
    941         if (cstate->num_mixers) {
    942                 mixer_width = mode->hdisplay / cstate->num_mixers;
    943 
    944                 _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
    945         }
    946 
    947         crtc_rect.x2 = mode->hdisplay;
    948         crtc_rect.y2 = mode->vdisplay;
    949 
    950          /* get plane state for all drm planes associated with crtc state */
    951         drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
    952                 struct drm_rect dst, clip = crtc_rect;
    953 
    954                 if (IS_ERR_OR_NULL(pstate)) {
    955                         rc = PTR_ERR(pstate);
    956                         DPU_ERROR("%s: failed to get plane%d state, %d\n",
    957                                         dpu_crtc->name, plane->base.id, rc);
    958                         goto end;
    959                 }
    960                 if (cnt >= DPU_STAGE_MAX * 4)
    961                         continue;
    962 
--> 963                 pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
                        ^^^^^^^^^^^^

    964                 pstates[cnt].drm_pstate = pstate;
    965                 pstates[cnt].stage = pstate->normalized_zpos;
    966                 pstates[cnt].pipe_id = dpu_plane_pipe(plane);
    967 

regards,
dan carpenter
