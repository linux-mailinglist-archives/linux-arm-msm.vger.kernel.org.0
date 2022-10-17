Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6E6600A97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbiJQJ1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiJQJ1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:27:15 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05D515A37;
        Mon, 17 Oct 2022 02:27:09 -0700 (PDT)
X-UUID: b32ff4598615471288036fbe5affdc57-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3gdiwwP8VicLXvgcqxaNWmclhgGy7ymu62tiLxXrCGc=;
        b=rQSrDh04Pxwf0elQeRkUG2AP7YzH6T8ecnzCiZVNeJ5DZv0fpUEkJDM4n/OgwBKkJMONC6zBExSp+5vDEwEwAh+oPY/7U/Etrl4pV1Z3/cQx2MiY5QCtriCDkQ4zaRnBJLrZamkpMOf9ppmOmC31JJL/fbQUqgnL9QZo/2R24ZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:802fa7b4-52eb-4097-b218-a75202a759b4,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:4a4704a4-ebb2-41a8-a87c-97702aaf2e20,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b32ff4598615471288036fbe5affdc57-20221017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1376876088; Mon, 17 Oct 2022 17:27:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Oct 2022 17:27:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Oct 2022 17:27:03 +0800
Message-ID: <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Can Guo <quic_cang@quicinc.com>,
        sutosh Das <quic_asutoshd@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_richardp@quicinc.com>,
        <linux-scsi@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Date:   Mon, 17 Oct 2022 17:27:02 +0800
In-Reply-To: <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
         <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Can,

> Subject:	Re: [PATCH v2 06/17] ufs: core: mcq: Configure resource
> regions
> Date:	Fri, 14 Oct 2022 17:31:52 +0800
> From:	Can Guo <quic_cang@quicinc.com>
> To:	Eddie Huang <eddie.huang@medaitek.com>, Asutosh Das <
> quic_asutoshd@quicinc.com>, quic_nitirawa@quicinc.com, 
> quic_rampraka@quicinc.com, quic_bhaskarv@quicinc.com, 
> quic_richardp@quicinc.com, linux-scsi@vger.kernel.org
> CC:	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, 
> quic_xiaosenh@quicinc.com, bvanassche@acm.org, avri.altman@wdc.com, 
> mani@kernel.org, beanhuo@micron.com
> 
> 
> Hi Eddie,
> 
> On 10/14/2022 5:08 PM, Eddie Huang wrote:
> > Hi Asutosh,
> > 
> > On Wed, 2022-10-05 at 18:06 -0700, Asutosh Das wrote:
> > > Define the mcq resources and add support to ioremap
> > > the resource regions.
> > > 
> > > Co-developed-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > > Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
> > > ---
> > > drivers/ufs/core/ufs-mcq.c | 99
> > > ++++++++++++++++++++++++++++++++++++++++++++++
> > > include/ufs/ufshcd.h | 28 +++++++++++++
> > > 2 files changed, 127 insertions(+)
> > > 
> > > diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-
> > > mcq.c
> > > index 659398d..7d0a37a 100644
> > > --- a/drivers/ufs/core/ufs-mcq.c
> > > +++ b/drivers/ufs/core/ufs-mcq.c
> > > @@ -18,6 +18,11 @@
> > > #define UFS_MCQ_NUM_DEV_CMD_QUEUES 1
> > > #define UFS_MCQ_MIN_POLL_QUEUES 0
> > > +#define MCQ_QCFGPTR_MASK GENMASK(7, 0)
> > > +#define MCQ_QCFGPTR_UNIT 0x200
> > > +#define MCQ_SQATTR_OFFSET(c) \
> > > + ((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
> > > +#define MCQ_QCFG_SIZE 0x40
> > > static int rw_queue_count_set(const char *val, const struct
> > > kernel_param *kp)
> > > {
> > > @@ -67,6 +72,97 @@ module_param_cb(poll_queues,
> > > &poll_queue_count_ops, &poll_queues, 0644);
> > > MODULE_PARM_DESC(poll_queues,
> > > "Number of poll queues used for r/w. Default value is
> > > 1");
> > > +/* Resources */
> > > +static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> > > + {.name = "ufs_mem",},
> > > + {.name = "mcq",},
> > > + /* Submission Queue DAO */
> > > + {.name = "mcq_sqd",},
> > > + /* Submission Queue Interrupt Status */
> > > + {.name = "mcq_sqis",},
> > > + /* Completion Queue DAO */
> > > + {.name = "mcq_cqd",},
> > > + /* Completion Queue Interrupt Status */
> > > + {.name = "mcq_cqis",},
> > > + /* MCQ vendor specific */
> > > + {.name = "mcq_vs",},
> > > +};
> > > +
> > > +static int ufshcd_mcq_config_resource(struct ufs_hba *hba)
> > > +{
> > > + struct platform_device *pdev = to_platform_device(hba->dev);
> > > + struct ufshcd_res_info *res;
> > > + struct resource *res_mem, *res_mcq;
> > > + int i, ret = 0;
> > > +
> > > + memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
> > > +
> > > + for (i = 0; i < RES_MAX; i++) {
> > > + res = &hba->res[i];
> > > + res->resource = platform_get_resource_byname(pdev,
> > > + IORESOURCE
> > > _MEM,
> > > + res-
> > > > name);
> > >  + if (!res->resource) {
> > > + dev_info(hba->dev, "Resource %s not
> > > provided\n", res->name);
> > > + if (i == RES_UFS)
> > > + return -ENOMEM;
> > > + continue;
> > > + } else if (i == RES_UFS) {
> > > + res_mem = res->resource;
> > > + res->base = hba->mmio_base;
> > > + continue;
> > > + }
> > > +
> > > + res->base = devm_ioremap_resource(hba->dev, res-
> > > > resource);
> > >  + if (IS_ERR(res->base)) {
> > > + dev_err(hba->dev, "Failed to map res %s,
> > > err=%d\n",
> > > + res->name, (int)PTR_ERR(res-
> > > > base));
> > >  + res->base = NULL;
> > > + ret = PTR_ERR(res->base);
> > > + return ret;
> > > + }
> > > + }
> > > +
> > > + /* MCQ resource provided in DT */
> > > + res = &hba->res[RES_MCQ];
> > > + /* Bail if NCQ resource is provided */
> > > + if (res->base)
> > > + goto out;
> > > +
> > > + /* Manually allocate MCQ resource from ufs_mem */
> > > + res_mcq = res->resource;
> > > + res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
> > > + if (!res_mcq) {
> > > + dev_err(hba->dev, "Failed to allocate MCQ resource\n");
> > > + return ret;
> > > + }
> > > +
> > > + res_mcq->start = res_mem->start +
> > > + MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
> > > + res_mcq->end = res_mcq->start + hba->nr_hw_queues *
> > > MCQ_QCFG_SIZE - 1;
> > > + res_mcq->flags = res_mem->flags;
> > > + res_mcq->name = "mcq";
> > > +
> > > + ret = insert_resource(&iomem_resource, res_mcq);
> > > + if (ret) {
> > > + dev_err(hba->dev, "Failed to insert MCQ resource,
> > > err=%d\n", ret);
> > > + return ret;
> > > + }
> > > +
> >  Mediatek UFS hardware put MCQ SQ head/tail and SQ IS/IE together
> > (SQ0
> > head, SQ0 tail, SQ0 IS, SQ0 IE, CQ0 head, CQ0 tail....), which
> > means
> > mcq_sqd register range interleave with mcq_sqis. I suggest let
> > vendor
> > customize config mcq resource function to fit vendor's register
> > assignment
>  
> In your case, which is similar to ours, you can just provide the res
> of SQD in DT, then use the
> 
> ufshcd_mcq_vops_op_runtime_config() introduced in Patch #8 to
> configure each operation
> 
Let me explain more detail about Mediatek UFS register assignment:
a. 0x0 ~ 0x5FF: UFS common register
b. 0x1600 ~   : MCQ register
c. 0x2200: UFS common vendor specific register
d. 0x2800: SQ/CQ head/tail pointer and interrupt status/enable register
     0x2800 SQ0_head
     0x2814 SQ0_IS
     0x281C CQ0_head
     0x2824 CQ0_IS

The register location meet UFSHCI4.0 spec definition

In legacy doorbell mode, need region a, c registers
In MCQ mode, need region a, b, c, d registers

As you can see, region b in the middle of region a and c. If I declare
"mcq" in device tree, i.e.
reg = <0, 0x11270000, 0, 0x2300>,
      <0, 0x11271600, 0, 0x1400>;
reg-names = "ufs_mem", "mcq";

Linux kernel boot fail due to register region overlapped and
devm_ioremap_resource() return error.

If I don't declare "mcq" region in device tree, Linux kernel still boot
fail due to ufshcd_mcq_config_resource() call devm_ioreamap_resource()
using calculated res_mcq which is overlapped with ufs_mem.

We treat UFS as a single IP, so we suggest:
1. Map whole UFS register (include MCQ) in ufshcd_pltfrm_init()
2. In ufshcd_mcq_config_resource() assign mcq_base address directly,
ie,
     hba->mcq_base = hba->mmio_base + MCQ_SQATTR_OFFSET(hba-
>mcq_capabilities)
3. In ufshcd_mcq_vops_op_runtime_config(), assign SQD, SQIS, CQD, CQIS
base, offset and stride

This is why I propose ufshcd_mcq_config_resource() to be customized,
not in common code

Regards,
Eddie Huang


