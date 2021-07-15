Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544A13CA58D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 20:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhGOSea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 14:34:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59291 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGOSea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 14:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626373897; x=1657909897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpeO1UlOfz03vCZPOKMaLcC15cHuHWekXiIrFd2h630=;
  b=KtplTw6nTScT0R54FA9FlNgafCeQQ4rBNhbpGa1r2pQdWTvS6smlN086
   B/0qOyFFXFF+8LfVR8Y4/p3JnX6gu5ulWfRn9k9eJhCJgKeeEkrVQsuRu
   71yOrV9lCG3U2CEBtbh3hkJ02WE2/kJmZtWGvFNmQz2r2lb64PIwudQCF
   Y=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Jul 2021 11:31:36 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Jul 2021 11:31:35 -0700
Received: from quicinc.com (10.80.80.8) by nalasexr03e.na.qualcomm.com
 (10.49.195.114) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 15 Jul
 2021 11:31:34 -0700
Date:   Thu, 15 Jul 2021 11:31:33 -0700
From:   Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <linus.walleij@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: clock: Introduce pdc bindings for SDX65
Message-ID: <20210715183126.GA6897@quicinc.com>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-6-quic_vamslank@quicinc.com>
 <YOkUd3B0vvclk7un@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YOkUd3B0vvclk7un@yoga>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 09, 2021 at 10:31:03PM -0500, Bjorn Andersson wrote:
> On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:
> 
> > From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> > 
> > Add compatible for SDX65 pdc.
> > 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> That said, this patch is independent from the clock patches and would be
> picked up by a different maintainer than the clock patches, so including
> it in the same series only risk complicating the pickup of the patch.
> 
> And with that in mind, looking at the recipients of all your patches you
> forgot toadd Stephen to the clock patches, Linus is not involved in
> the clock patches and you completely missed the irq maintainer.
> 
> Please use scripts/get_maintainer.pl to list the appropriate recipients
> for each patch(series), to ensure that your patches will get the
> attention they deserve.

Thanks for the review comments Bjorn. I'll run get_maintainer.pl like you
suggested.

Thanks,
Vamsi
