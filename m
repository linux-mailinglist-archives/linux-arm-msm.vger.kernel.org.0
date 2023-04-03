Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEAF6D3CE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 07:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjDCFak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 01:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjDCFaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 01:30:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E0D268C;
        Sun,  2 Apr 2023 22:30:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D71E614AD;
        Mon,  3 Apr 2023 05:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C20EC433EF;
        Mon,  3 Apr 2023 05:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680499835;
        bh=HPu3sFlRqoh3oweE3JIi7aHwwxG7tnzMuUvSxk1K1cw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OeGN5RITsafQ1n5scfQweJuYsgV/kyCOc5uAlHmxEl0NSLES9/iiGHBL5omHFilOg
         Um4+gz5/D3K3MnrkmMnSP+BfFvEdzPGSBPHFtESy8/eieUe+IjnZbX9hE37yRFlCZN
         rn6PYyZHr5LYWF+/UBinzsYRmY7ph06nb9iCPrvidhtANWb7AKdud6EFK37jDpEDJ9
         ltLapA/HnOjrOvrlpqslT+PYgj44iSX9GSpKIdYshEwS5BTS/1iHCimjptvZtJyrw4
         zi+K+zL5P9yoF4ylxxi15/gYU2fgzIZaMyJfeZzkXPOj5MtRUmC/RK2f73lDPHoG0X
         MVWjSRvpyjU8w==
Date:   Mon, 3 Apr 2023 11:00:28 +0530
From:   "mani@kernel.org" <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke.xin@quectel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>,
        "slark_xiao@163.com" <slark_xiao@163.com>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        "dnlplm@gmail.com" <dnlplm@gmail.com>,
        "yonglin.tan@outlook.com" <yonglin.tan@outlook.com>,
        "fabio.porcedda@gmail.com" <fabio.porcedda@gmail.com>,
        "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>,
        Jerry =?utf-8?B?TWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjNdIGJ1?= =?utf-8?Q?s=3A_mhi?=
 =?utf-8?Q?=3A?= host: pci_generic: Add support for Quectel RM520N-GL modem
Message-ID: <20230403053028.GH4627@thinkpad>
References: <5d722f4810c89cf2baec3644adce988031-1-23linuxfoundation.org@g.corp-email.com>
 <Y9jbWEcx4frG/V7F@kroah.com>
 <SEZPR06MB608778264B368ABF3F10785584929@SEZPR06MB6087.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR06MB608778264B368ABF3F10785584929@SEZPR06MB6087.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 03, 2023 at 01:21:29AM +0000, Duke Xin(辛安文) wrote:
> Hi Mani
> 
> I'm sorry. I might bother you. 
> 
> I want to know the review progress of [PATCH v3], it seems that you have forgotten my [PATCH v3]. You gave some modification suggestions in [PATCH v2], I revised them and submitted them to [PATCH v3].
> 

Still the patch has some concerns, so I shared some comments. Please fix them
before sending v4.

- Mani

> 
> 辛安文Duke Xin | Software Department IX Engineer | Quectel Wireless Solutions Co., Ltd. 
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
> 发件人: Greg KH <gregkh@linuxfoundation.org> 
> 发送时间: 2023年1月31日 17:12
> 收件人: Duke Xin(辛安文) <duke_xinanwen@163.com>
> 抄送: mani@kernel.org; slark_xiao@163.com; loic.poulain@linaro.org; dnlplm@gmail.com; yonglin.tan@outlook.com; fabio.porcedda@gmail.com; mhi@lists.linux.dev; linux-arm-msm@vger.kernel.org; inux-kernel@vger.kernel.org; Jerry Meng(蒙杰) <jerry.meng@quectel.com>; Duke Xin(辛安文) <duke.xin@quectel.com>
> 主题: Re: [PATCH v3] bus: mhi: host: pci_generic: Add support for Quectel RM520N-GL modem
> 
> On Fri, Jan 27, 2023 at 06:47:54PM -0800, Duke Xin(辛安文) wrote:
> > The project is based on Qualcomm's sdx6x chips for laptop,so the mhi 
> > interface definition and enumeration align with previous Quectel sdx24 
> > configuration
> > 
> > Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him a patch that has triggered this response.  He used to manually respond to these common problems, but in order to save his sanity (he kept writing the same thing over and over, yet to different people), I was created.  Hopefully you will not take offence and will fix the problem in your patch and resubmit it so that it can be accepted into the Linux kernel tree.
> 
> You are receiving this message because of the following common error(s) as indicated below:
> 
> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.
> 
> If you wish to discuss this problem further, or you have questions about how to resolve this issue, please feel free to respond to this email and Greg will reply once he has dug out from the pending patches received from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

-- 
மணிவண்ணன் சதாசிவம்
