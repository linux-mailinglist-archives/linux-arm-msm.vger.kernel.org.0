Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46C9729E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241436AbjFIPcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjFIPcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:32:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B419419B
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 08:32:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C89A65920
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 15:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC05C433EF;
        Fri,  9 Jun 2023 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686324730;
        bh=DDKlZt/t4+fZJTmcZJEowioerzbMSScPFXXwtDJOEiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jJ/XBK38ZeUyblXIfx1CrLCpMGFm9rFq9oFzfky25ZryudFLurH6rnEA7unwLqOUh
         aT392idplglh7W4nq4IPHKk9UKBFJaK980D+Ax1MrPJkXuUNtuQGuSgaPL9k9VT3hR
         8nsVv24FZcYDNqnRzApppMfVaa9SXPEYqSeCzv0mRiCjIdRUXQBHm0HNsTzB16YPYo
         n6wKnX744ar0nz9ZEVAOGPUmdndSGdYD4WpRZwQMgVn3lAKqTc3/8Kx+XFaSREMe8L
         aB6hjsVfbwGFSKeLbrRaGMqBmH0Tx7dVvAzBSI2bPwHU3rlNuKRYE9RqL6zxIEzqOv
         5b5DG6nTeNWEw==
Date:   Fri, 9 Jun 2023 21:02:01 +0530
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
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjRdIGJ1?=
 =?utf-8?Q?s=3A_mhi=3A_host=3A_pci=5Fgeneric?= =?utf-8?Q?=3A?= Add support
 for quectel's new EM160R-GL product
Message-ID: <20230609153201.GB6847@thinkpad>
References: <ac814d016b03c3164dbd8cd7c94f8b4f9-6-23kernel.org@g.corp-email.com>
 <20230608160530.GC8632@thinkpad>
 <SEZPR06MB6087F7C2AAE5B5FB0F5AFF7E8451A@SEZPR06MB6087.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR06MB6087F7C2AAE5B5FB0F5AFF7E8451A@SEZPR06MB6087.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 09, 2023 at 01:21:02AM +0000, Duke Xin(辛安文) wrote:
> Hi Mani
> 
> EM160R-GL is exactly the same name as the old modem with same chipset. What is the difference between these two?
> >> From my point of view, there are only two EM160R-GL products with different PCIe ids, and the HW and SW of the module are the same. 
>    The new EM160R-GL product is designed to fit the customer's new laptop.

Ok. Previously I used to see same modules having two different IDs because they
share different baseline (from qcom). I will amend the commit message
accordingly.

For future patches, please include these info in the commit message.

- Mani

> 
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
> 发送时间: 2023年6月9日 0:06
> 收件人: Duke Xin(辛安文) <duke_xinanwen@163.com>
> 抄送: loic.poulain@linaro.org; slark_xiao@163.com; fabio.porcedda@gmail.com; koen.vandeputte@citymesh.com; song.fc@gmail.com; bhelgaas@google.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; Jerry Meng(蒙杰) <jerry.meng@quectel.com>; Duke Xin(辛安文) <duke.xin@quectel.com>
> 主题: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for quectel's new EM160R-GL product
> 
> On Thu, Jun 08, 2023 at 02:29:27AM -0700, Duke Xin(辛安文) wrote:
> > The product's would use the same config as previous EM160R-GL
> > 
> > Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
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
> 
> EM160R-GL is exactly the same name as the old modem with same chipset. What is the difference between these two?
> 
> - Mani
> 
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
