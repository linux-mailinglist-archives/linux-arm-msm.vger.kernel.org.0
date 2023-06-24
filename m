Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC8B73C731
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 08:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjFXG5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 02:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjFXG5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 02:57:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1D91706
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 23:57:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2149860AB8
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 06:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72652C433C0;
        Sat, 24 Jun 2023 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687589869;
        bh=toF4EBgCXkrjlP8EG+AMEChN1VhN9P26lMjqYGNkT1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nouXr1Z2SVd7KsHroM2bVeZ8pPIZvGJXpA2zA1HsYg6hKIeip3KO81zs68UOewz9M
         UWxWWVdPumpO5mIuj2Hiz8mGAOw+v3tb4wuNEgl3rlC6kaQ2hrsOrLxEUjbca5neZO
         yowOLwo9md8Dwhjt8eRdg35IuN+v24vobk/e9MZfDZlapvxmgelrgQIq7o+cEHubDN
         giCJB3gXdhAcNIRAEjp3UtWsbFVFUrB520rJiloIrKcQBLSVQzQggagmmWYm+4bBer
         hP21SZYvDYFdWDzR0mSKFadWPVmlifuaZroQ0ifo7jmpi3up4Klbc11MKMKlq4G71A
         l4RTnBNFt8SBA==
Date:   Sat, 24 Jun 2023 12:27:34 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke.xin@quectel.com>
Cc:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "koen.vandeputte@citymesh.com" <koen.vandeputte@citymesh.com>,
        "song.fc@gmail.com" <song.fc@gmail.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Jerry =?utf-8?B?TWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjRdIGJ1czogbWhpOiBob3N0OiBw?=
 =?utf-8?Q?ci=5Fgeneric=3A?= Add support for quectel's new EM160R-GL product
Message-ID: <20230624065734.7az2zttz7yzq7adj@thinkpad>
References: <d86d1878598b633b437f87e5b75196079-6-23kernel.org@g.corp-email.com>
 <20230609153800.GC6847@thinkpad>
 <SEZPR06MB6087B403321E6528CB5589428454A@SEZPR06MB6087.apcprd06.prod.outlook.com>
 <SEZPR06MB608764064A2D2E91117C2610845DA@SEZPR06MB6087.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR06MB608764064A2D2E91117C2610845DA@SEZPR06MB6087.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 21, 2023 at 10:36:36AM +0000, Duke Xin(辛安文) wrote:
> Hi Mani
> 
> Regarding [PATCH v4] submission for review, I would like to confirm with you whether there are any defects that need to be corrected?
> 

Patch has been applied to mhi-next branch and will be part of v6.5 release:
https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-next&id=6bb6aba2f57ab58a8853bf09cc4e875a46646c0b

- Mani

> 
> 辛安文  Duke Xin | Software Department IX Engineer | Quectel Wireless Solutions Co., Ltd. 
>             
> Mobile: +86-15375456183 | Email : Duke.xin@quectel.com  | Tel: +86-0551-65869386-8632
> Website: www.quectel.com  | QQ: 602659072 | Wechat: 15375456183
> 
> Building 1-C, China Speech Valley Area A, 3335 Xiyou Road, High-tech Zone, Hefei, Anhui 230088, China    
> 安徽省合肥市高新区习友路3335号中国（合肥）国际智能语音产业园A区1号中试楼 230088
> HQ: Building 5, Shanghai Business Park Phase III (Area B), No.1016 Tianlin Road, Minhang District, Shanghai 200233, China
> 总部：上海市闵行区田林路1016号科技绿洲3期（B区）5号楼  200233
> 
> -----邮件原件-----
> 发件人: Duke Xin(辛安文) 
> 发送时间: 2023年6月12日 10:02
> 收件人: Manivannan Sadhasivam <mani@kernel.org>; Duke Xin(辛安文) <duke_xinanwen@163.com>
> 抄送: loic.poulain@linaro.org; slark_xiao@163.com; fabio.porcedda@gmail.com; koen.vandeputte@citymesh.com; song.fc@gmail.com; bhelgaas@google.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; Jerry Meng(蒙杰) <jerry.meng@QUECTEL.COM>
> 主题: 回复: [PATCH v4] bus: mhi: host: pci_generic: Add support for quectel's new EM160R-GL product
> 
> Hi Mani
> 
> Ok. Previously I used to see same modules having two different IDs because they share different baseline (from qcom). I will amend the commit message accordingly.
> For future patches, please include these info in the commit message.
> >>  Got it. In the future patch, I will add the corresponding supplementary information (such as baseline) to make a difference.
>   
>   Thank you very much for your patient review again.
> 
> 辛安文  Duke Xin | Software Department IX Engineer | Quectel Wireless Solutions Co., Ltd. 
>             
> Mobile: +86-15375456183 | Email : Duke.xin@quectel.com  | Tel: +86-0551-65869386-8632
> Website: www.quectel.com  | QQ: 602659072 | Wechat: 15375456183
> 
> Building 1-C, China Speech Valley Area A, 3335 Xiyou Road, High-tech Zone, Hefei, Anhui 230088, China    
> 安徽省合肥市高新区习友路3335号中国（合肥）国际智能语音产业园A区1号中试楼 230088
> HQ: Building 5, Shanghai Business Park Phase III (Area B), No.1016 Tianlin Road, Minhang District, Shanghai 200233, China
> 总部：上海市闵行区田林路1016号科技绿洲3期（B区）5号楼  200233
> 
> -----邮件原件-----
> 发件人: Manivannan Sadhasivam <mani@kernel.org> 
> 发送时间: 2023年6月9日 23:38
> 收件人: Duke Xin(辛安文) <duke_xinanwen@163.com>
> 抄送: loic.poulain@linaro.org; slark_xiao@163.com; fabio.porcedda@gmail.com; koen.vandeputte@citymesh.com; song.fc@gmail.com; bhelgaas@google.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; Jerry Meng(蒙杰) <jerry.meng@quectel.com>; Duke Xin(辛安文) <duke.xin@quectel.com>
> 主题: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for quectel's new EM160R-GL product
> 
> On Thu, Jun 08, 2023 at 02:29:27AM -0700, Duke Xin(辛安文) wrote:
> > The product's would use the same config as previous EM160R-GL
> > 
> > Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> 
> Modified the commit message and subject to reflect the usecase and applied to mhi-next!
> 
> - Mani
> 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > ---
> > Changelog
> > 
> > v3 -> v4
> > 
> > * Update commit message to include the changelog and reviewd tag.
> > 
> > v2 -> v3
> > 
> > * Add patch CC to mhi@lists.linux.dev.
> > 
> > v1 -> v2
> > 
> > * Remove Space before */ and "for laptop" description.
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c 
> > b/drivers/bus/mhi/host/pci_generic.c
> > index 70e37c490150..5f204b819e95 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -591,6 +591,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
> >  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> > +	/* EM160R-GL (sdx24) */
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d),
> > +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> >  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> >  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> > --
> > 2.25.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
