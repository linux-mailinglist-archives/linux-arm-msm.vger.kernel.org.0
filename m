Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8ABE455409
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 06:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhKRFHk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 00:07:40 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56355 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhKRFHk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 00:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211881; x=1668747881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IsaWKyhthX5lBDxhXoSIO5fcbfKHt5XcuIWS/T8Zmyo=;
  b=u0agtOLdx4eMVLshaK48A7iA2cW59Lxe4kGU1qSpFIC1uM+T1DXSUWjW
   M62XeyZHf2YujWbBCI1f85S8hmPv7Gvmi7A0ozpKmP3h9nLCBBQ9p4rCC
   yx5NeEwdaTPJZryfUxELOwTn01rFmc16tqHwxiiFl2QQbLSf+6RNUqLJd
   A=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2021 21:04:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 21:04:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 21:04:39 -0800
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 17 Nov
 2021 21:04:39 -0800
Date:   Wed, 17 Nov 2021 21:04:37 -0800
From:   Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: Add SDX65 GCC support
Message-ID: <20211118050437.GA22466@quicinc.com>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
 <YZNsvjwp0/AX0Hdo@matsya>
 <20211118015117.GA18984@quicinc.com>
 <YZXZEhV6Jp3LOjmH@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YZXZEhV6Jp3LOjmH@matsya>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 18, 2021 at 10:09:46AM +0530, Vinod Koul wrote:
> On 17-11-21, 17:51, Vamsi Krishna Lanka wrote:
> > On Tue, Nov 16, 2021 at 02:03:02PM +0530, Vinod Koul wrote:
> > > On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> > > > From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > > 
> > > > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > > > 
> > > > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > Missing support reported ??
> > 
> > Not mising support but it reported to delete unused varaibles and after
> > the fix mentioned to add the reported tag.
> 
> I think it does not make sense here, you may add a note in changelog
> that you fixed issues reported by kbot
> 

I mentioned that in the cover letter and thought that is sufficient.

> -- 
> ~Vinod
