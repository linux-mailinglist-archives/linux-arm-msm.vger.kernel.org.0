Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CB7604263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 13:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbiJSLAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 07:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbiJSLAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 07:00:03 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6610B5FAFF;
        Wed, 19 Oct 2022 03:29:57 -0700 (PDT)
X-UUID: a1a477f8d2004174af2ef6a0ad62a700-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7oRov0aCEFFX2VAJP0Edz7qj0UNH2f2pTvq05OvqVMo=;
        b=JJW1zrFkcqnJTdEUP65bDMvSLIa0mcmVLCkWIT1zyt8wxkHWf1jrcBJZoZuGiOma4tfwrEfDLqv0GT/+3wLp3oFrXGFkO2dSKnfK2e+9DAzE/2EW5+XminvHVBPOlIbBcjTTPzH27De0uP/3eg3EIU9rwlmAGx+/AEAXoVAMuko=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:03a65c0a-9bd1-4579-b0b5-6840e7f4a9bb,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:2ed6c6ee-314c-4293-acb8-ca4299dd021f,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a1a477f8d2004174af2ef6a0ad62a700-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1781811733; Wed, 19 Oct 2022 18:28:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 18:28:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Oct 2022 18:28:30 +0800
Message-ID: <052136dffaf0271e48d9ad5d7ade25805111ab27.camel@mediatek.com>
Subject: Re: [PATCH v2 05/17] ufs: core: mcq: Introduce Multi Circular Queue
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Asutosh Das <quic_asutoshd@quicinc.com>
CC:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Date:   Wed, 19 Oct 2022 18:28:30 +0800
In-Reply-To: <20221018160048.GF10252@asutoshd-linux1.qualcomm.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
         <11ee57da1d1872f8f02aa5d94e254ee9ddf4ef7a.1665017636.git.quic_asutoshd@quicinc.com>
         <c89473d2cf48eb92b4afbd78578cd508c481f8b6.camel@mediatek.com>
         <20221018160048.GF10252@asutoshd-linux1.qualcomm.com>
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

On Tue, 2022-10-18 at 09:00 -0700, Asutosh Das wrote:
> On Tue, Oct 18 2022 at 22:29 -0700, Eddie Huang wrote:
> [...]
> > > ---
> > >  drivers/ufs/core/Makefile      |   2 +-
> > >  drivers/ufs/core/ufs-mcq.c     | 113
> > > +++++++++++++++++++++++++++++++++++++++++
> 
> [...]
> > >  create mode 100644 drivers/ufs/core/ufs-mcq.c
> > > 
> > 
> > [...]
> > 
> > >  /**
> > >   * ufshcd_probe_hba - probe hba to detect device and initialize
> > > it
> > >   * @hba: per-adapter instance
> > > @@ -8224,6 +8233,9 @@ static int ufshcd_probe_hba(struct ufs_hba
> > > *hba, bool init_dev_params)
> > >  			goto out;
> > > 
> > >  		if (is_mcq_supported(hba)) {
> > > +			ret = ufshcd_config_mcq(hba);
> 
> [...]
> 
> > 
> > ufshcd_probe_hba() may be called multiple times (from
> > ufshcd_async_scan() and ufshcd_host_reset_and_restore()). It is not
> > a
> > good idea to allocate memory in ufshcd_config_mcq(). Although use
> > parameter init_dev_params to decide call ufshcd_config_mcq() or
> > not, it
> > may cause ufshcd_host_reset_and_restore() not to configure MCQ
> > (init
> > SQ/CQ ptr...) again.
> > 
> 
> I don't think the memory allocation can be moved prior to reading the
> device
> descriptor since the bQueueDepth is necessary.
> But I agree to your point that ufshcd_host_reset_and_restore()
> wouldn't
> reconfigure MCQ now. Thanks.
> 
> > Suggest to separate configure MCQ (set hardware register) and
> > allocate
> > memory to different function
> > 
> 
> How about I keep the memory allocation in ufshcd_probe_hba() within
> the
> init_dev_params check and separate out the initialization outside the
> check.
> That'd ensure that the configuration is done for each call to
> ufshcd_probe_hba(). I'm open to any other idea that you may have,
> plmk.
> > 

Sounds good to me. Please go ahead to make the modification

Thanks
Eddie Huang


