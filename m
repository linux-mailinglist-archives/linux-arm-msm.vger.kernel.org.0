Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF2960217F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 04:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiJRC5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 22:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiJRC5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 22:57:00 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E9E97D41;
        Mon, 17 Oct 2022 19:56:59 -0700 (PDT)
X-UUID: 6fda734043c947cb86a08a49f2533b81-20221018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eaYk33buoaLmw3tsf2kJgZmzZSVg+8sYWg/HaGvirUY=;
        b=tpB3tC9UtFQQ06ladJNubx7Y5xnE1dWZCORP4yX+h49nj9ZdxPngeDz5ARvzNyC8fOhyH/Tzzx4wFcnfif2PwybJHOq1ZnVmfVJfOwlgFluXj604/oM/5YSn1D5gpIvd6g4BXXs5GwAnrIL2FM3mcuHqRqOvMLcU3vv2xe6eblE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e671e8db-a6d9-4e93-831d-e2688919ca8e,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ce4d18a3-73e4-48dd-a911-57b5d5484f14,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6fda734043c947cb86a08a49f2533b81-20221018
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 10300800; Tue, 18 Oct 2022 10:56:52 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 18 Oct 2022 10:56:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 18 Oct 2022 10:56:51 +0800
Message-ID: <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Asutosh Das <quic_asutoshd@quicinc.com>
CC:     Can Guo <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Date:   Tue, 18 Oct 2022 10:56:51 +0800
In-Reply-To: <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
         <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
         <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
         <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
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

On Mon, 2022-10-17 at 18:47 -0700, Asutosh Das wrote:
> > 
> On Mon, Oct 17 2022 at 02:27 -0700, Eddie Huang wrote:
> > Hi Can,
> > 
> 
> [...]
> 
> > We treat UFS as a single IP, so we suggest:
> > 1. Map whole UFS register (include MCQ) in ufshcd_pltfrm_init()
> > 2. In ufshcd_mcq_config_resource() assign mcq_base address
> > directly,
> > ie,
> >     hba->mcq_base = hba->mmio_base + MCQ_SQATTR_OFFSET(hba-
> > > mcq_capabilities)
> > 
> > 3. In ufshcd_mcq_vops_op_runtime_config(), assign SQD, SQIS, CQD,
> > CQIS
> > base, offset and stride
> > 
> > This is why I propose ufshcd_mcq_config_resource() to be
> > customized,
> > not in common code
> 
> How about we add a vops to ufshcd_mcq_config_resource().
> SoC vendors should make sure that the vops populates the mcq_base.
> 

It is good to add vops to ufshcd_mcq_config_resource() let SoC vendors 
populate mcq_base


Thanks,
Eddie Huang


