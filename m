Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A3A454032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 06:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbhKQFaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 00:30:12 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26328 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhKQFaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 00:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637126835; x=1668662835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AlwB3RTtcb0Bby2mku2EUrYuvZDnavBskw+PSx+KDLg=;
  b=n0dUYteZk29ZEoactV8qimzU3E3Zyi77xoxD2Di629Ai4ohnKv4vunRW
   qKvUKYUMr8jNnrwVY9B2tXjzglPZJc4VoXw62EDcWiv8T57FVU6uraH8b
   qEJymsoYbNSNlDZ7KqRR5QaPDM8Sve7BCVBGu/XhyrL5IIfEVrkLPgAyX
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Nov 2021 21:27:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 21:27:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 21:27:12 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 21:27:07 -0800
Date:   Wed, 17 Nov 2021 10:57:03 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
CC:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: usb-xhci: Add bindings for
 usb-skip-phy-init property
Message-ID: <20211117052703.GA6511@hu-pkondeti-hyd.qualcomm.com>
References: <1636353710-25582-1-git-send-email-quic_c_sanm@quicinc.com>
 <1636353710-25582-2-git-send-email-quic_c_sanm@quicinc.com>
 <YY7vAzxj9aR/zBSB@robh.at.kernel.org>
 <3e02ae12-660b-8cf5-d6f8-3a8d1a2abc4e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e02ae12-660b-8cf5-d6f8-3a8d1a2abc4e@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Tue, Nov 16, 2021 at 04:11:30PM +0530, Sandeep Maheswaram wrote:
> 
> On 11/13/2021 4:17 AM, Rob Herring wrote:
> >On Mon, Nov 08, 2021 at 12:11:48PM +0530, Sandeep Maheswaram wrote:
> >>Adding bindings for usb-skip-phy-init property.
> >>Runtime suspend of phy drivers was failing from DWC3 driver as
> >>runtime usage value is 2 because the phy is initialized from
> >>DWC3 core and HCD core.
> >>Some controllers like DWC3 and CDNS3 manage phy in their core drivers.
> >>This property can be set to avoid phy initialization in HCD core.
> >You already know if you have a DWC3 and CDNS3 controller, so you don't
> >need more data in DT.
> 
> We don't have a device tree node for xhci platform device and create xhci
> platform device from dwc3/host.c
> 
> So we want to pass this property to check in xhci-plat.c and skip phy
> initialization.
> 

Would not the below condition from your other patch [1] work here too?

if (of_device_is_compatible(dev->parent->of_node, "snps,dwc3"))

[1] https://lore.kernel.org/linux-usb/1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com/

Thanks,
Pavan

