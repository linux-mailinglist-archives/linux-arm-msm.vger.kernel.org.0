Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CCD6023C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 07:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiJRF3e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 01:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiJRF3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 01:29:31 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9934312D2E;
        Mon, 17 Oct 2022 22:29:29 -0700 (PDT)
X-UUID: fe3239c3e847422b8638b5a232ed27c7-20221018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YO6bg0cMLXXav/rFBnuDF/0bAQIkPham0X+fM8ZmkXc=;
        b=YzR4pfBd+pwsxkULQHTMGhHI8uyGvlBMdYvDILMuRn4rdDXADmZQScqrMvkwK67soDknDpaZDRfY28NrTSa051Ojpa+kItdQ8/dMcwgBkNhav/Iu64tOpQUifX519VQ+T/3Y6jqT9uh+LwcNLDPMzZKUATPnzDBLnhxzh+g4uts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c5dbd2c2-1a13-4816-9996-48b662fddb0c,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:753699ee-314c-4293-acb8-ca4299dd021f,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fe3239c3e847422b8638b5a232ed27c7-20221018
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1890543427; Tue, 18 Oct 2022 13:29:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 18 Oct 2022 13:29:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 18 Oct 2022 13:29:18 +0800
Message-ID: <c89473d2cf48eb92b4afbd78578cd508c481f8b6.camel@mediatek.com>
Subject: Re: [PATCH v2 05/17] ufs: core: mcq: Introduce Multi Circular Queue
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Asutosh Das <quic_asutoshd@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_richardp@quicinc.com>,
        <linux-scsi@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek>, <liang-yen.wang@mediatek.com>
Date:   Tue, 18 Oct 2022 13:29:18 +0800
In-Reply-To: <11ee57da1d1872f8f02aa5d94e254ee9ddf4ef7a.1665017636.git.quic_asutoshd@quicinc.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
         <11ee57da1d1872f8f02aa5d94e254ee9ddf4ef7a.1665017636.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh,

On Wed, 2022-10-05 at 18:06 -0700, Asutosh Das wrote:
> Introduce multi-circular queue (MCQ) which has been added
> in UFSHC v4.0 standard in addition to the Single Doorbell mode.
> The MCQ mode supports multiple submission and completion queues.
> Add support to configure the number of queues.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
> ---
>  drivers/ufs/core/Makefile      |   2 +-
>  drivers/ufs/core/ufs-mcq.c     | 113
> +++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/core/ufshcd-priv.h |   1 +
>  drivers/ufs/core/ufshcd.c      |  12 +++++
>  include/ufs/ufshcd.h           |   4 ++
>  5 files changed, 131 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/ufs/core/ufs-mcq.c
> 

[...]

>  /**
>   * ufshcd_probe_hba - probe hba to detect device and initialize it
>   * @hba: per-adapter instance
> @@ -8224,6 +8233,9 @@ static int ufshcd_probe_hba(struct ufs_hba
> *hba, bool init_dev_params)
>  			goto out;
>  
>  		if (is_mcq_supported(hba)) {
> +			ret = ufshcd_config_mcq(hba);
> +			if (ret)
> +				goto out;
>  			ret = scsi_add_host(host, hba->dev);
>  			if (ret) {
>  				dev_err(hba->dev, "scsi_add_host
> failed\n");
> 

ufshcd_probe_hba() may be called multiple times (from
ufshcd_async_scan() and ufshcd_host_reset_and_restore()). It is not a
good idea to allocate memory in ufshcd_config_mcq(). Although use
parameter init_dev_params to decide call ufshcd_config_mcq() or not, it
may cause ufshcd_host_reset_and_restore() not to configure MCQ (init
SQ/CQ ptr...) again.

Suggest to separate configure MCQ (set hardware register) and allocate
memory to different function

Thanks,
Eddie Huang


