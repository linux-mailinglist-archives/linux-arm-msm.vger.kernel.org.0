Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316296054B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJTBNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 21:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiJTBNO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 21:13:14 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10B7AF19D;
        Wed, 19 Oct 2022 18:13:07 -0700 (PDT)
X-UUID: 0fe5dc41e47847f08b84541e210c6aa5-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IvDCujvhbE3aZo/FeMAVUwJ8JGX8m9vTb6KyE20WYMc=;
        b=MofHsGkUTdp8zVuIcyxtUPiklJHfizh2Eu6uFJtxYtKKlXmtgoeWlmoi2hF3lf/VvXMYMlMT19bqOaIKiCb62EUxUWhrGiKgnm1eyeUI2zm6GVX3ocriieX+pOMs8bFCtkM7ccpwd9Tz3yoabFgbFieJR7QhDDahTvUETTb+urU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:61494afe-e006-4fdf-8e2a-cc4a16a8744d,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:f53a59a4-ebb2-41a8-a87c-97702aaf2e20,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0fe5dc41e47847f08b84541e210c6aa5-20221020
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <eddie.huang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1414796285; Thu, 20 Oct 2022 09:13:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 20 Oct 2022 09:13:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Oct 2022 09:13:00 +0800
Message-ID: <f8c7d70727c1d60f3dfc0325b6ed83b937c16a5a.camel@mediatek.com>
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
From:   Eddie Huang <eddie.huang@mediatek.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        Asutosh Das <quic_asutoshd@quicinc.com>
CC:     Can Guo <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <avri.altman@wdc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Date:   Thu, 20 Oct 2022 09:13:00 +0800
In-Reply-To: <b11cb7b4-2f4a-c6a2-82a5-c4372ff23610@acm.org>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
         <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
         <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
         <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
         <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
         <20221019195040.GA18511@asutoshd-linux1.qualcomm.com>
         <b11cb7b4-2f4a-c6a2-82a5-c4372ff23610@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2022-10-19 at 14:06 -0700, Bart Van Assche wrote:
> On 10/19/22 12:50, Asutosh Das wrote:
> > While adding the vops it occurred to me that it'd remain empty
> > because 
> > ufs-qcom
> > doesn't need it. And I'm not sure how MTK register space is laid
> > out.
> > So please can you help add a vops in the next version?
> > I can address the other comment and push the series.
> 
> Please do not introduce new vops without adding at least one 
> implementation of the vop in the same patch series. How about
> letting 
> MediaTek add more vops as necessary in a separate patch series and 
> focusing in this patch series on UFSHCI 4.0 compliance?
> 

I am not sure whether other SoC vendor's register definition follow
this patch's arrangement or not. As I explain Mediatek treat UFS as a
single IP and map whole UFS register address space one time.
To speed up landing this series, please bypass this vops. I will send 
a separate patch to add this vops

Eddie


