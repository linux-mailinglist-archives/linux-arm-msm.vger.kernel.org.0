Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED40A60DDED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 11:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiJZJV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 05:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbiJZJV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 05:21:57 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D77A3AAC;
        Wed, 26 Oct 2022 02:21:55 -0700 (PDT)
X-UUID: 7efce5ed9e614751816215845ad27160-20221026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JoAhk7iug/nUjQM0ATBxIo4/S4gaXK4QbO+PxL1Vn60=;
        b=ZJtAQPWGIbzURd+bce4p6emVe2oimYnCm50iKqryHnY9xVCMfLY7QjKes+bZUVqVrWA8N1LP4ZecYR2wKUEz6nkEFPY7G7V9GxzxyAFXNu2sHIJ9APEM/SVdIkfXr5rfDSGvt3F7hy118Hs94SGVliV5rMYzOICCOo0yyYhmibQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b385b975-c8d9-4146-a876-50d8f47ea57c,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:424d3227-9eb1-469f-b210-e32d06cfa36e,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7efce5ed9e614751816215845ad27160-20221026
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 653056957; Wed, 26 Oct 2022 17:21:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 26 Oct 2022 17:21:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 26 Oct 2022 17:21:48 +0800
Message-ID: <772dd8da737e7fbf0c17f96538cc46df17b280f7.camel@mediatek.com>
Subject: Re: [PATCH v3 00/17] Add Multi Circular Queue Support
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Asutosh Das <quic_asutoshd@quicinc.com>, <quic_cang@quicinc.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>
CC:     <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <daejun7.park@samsung.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, <quic_richardp@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Date:   Wed, 26 Oct 2022 17:21:48 +0800
In-Reply-To: <cover.1666288432.git.quic_asutoshd@quicinc.com>
References: <cover.1666288432.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Asutosh,

On Thu, 2022-10-20 at 11:03 -0700, Asutosh Das wrote:
> UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to
> improve storage performance.
> The implementation uses the shared tagging mechanism so that tags are
> shared
> among the hardware queues. The number of hardware queues is
> configurable.
> This series doesn't include the ESI implementation for completion
> handling.
> 
> This implementation has been verified by booting on an emulation
> platform.
> During testing, all low power modes were disabled and it was in HS-G1 
> mode.
> 
> Please take a look and let us know your thoughts.
> 
> v2 -> v3:
> - Split ufshcd_config_mcq() into ufshcd_alloc_mcq() and
> ufshcd_config_mcq()
> - Use devm_kzalloc() in ufshcd_mcq_init()
> - Free memory and resource allocation on error paths
> - Corrected typos in code comments
> 

Thanks the patch and fixing. I port this series with patch [1] on
Mediatek platform and test pass using FIO program

Tested-by: eddie.huang@mediatek.com

[1] https://patchwork.kernel.org/project/linux-scsi/list/?series=688941

Eddie Huang


