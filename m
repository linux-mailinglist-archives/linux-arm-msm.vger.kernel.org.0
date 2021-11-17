Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCCC454093
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 07:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbhKQGFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 01:05:14 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:17269 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233492AbhKQGFG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 01:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637128929; x=1668664929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjjG5wR5uHgr3YmxjNHMilgpmUQk8RzAtejYJxRqHYU=;
  b=e44eVum5ukbQ9lA1Cr4LBQK1qm7byD1IpC/e86Dxaakcs43KW+jrPHqr
   ZiggT0eet6jETzZNX96JU55N/I/q3VHq46gRBnap5cb81AVKSolhBd6Fp
   OXhsVThT9dohr6ONBNVRNfVpyxDV+kkBpnYqn9JFmd3f5tvDQoYFJpuj5
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Nov 2021 22:02:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 22:02:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 22:02:04 -0800
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 22:01:59 -0800
Date:   Wed, 17 Nov 2021 11:31:55 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v9 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <20211117060155.GA7792@hu-pkondeti-hyd.qualcomm.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

On Mon, Nov 01, 2021 at 01:23:41PM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown when wakeup capable devices are connected
> by checking wakeup property of xhci plat device.
> Phy should be on to wake up the device from suspend using wakeup capable
> devices such as keyboard and mouse.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 643239d..a6ad0ed 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1787,7 +1787,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -1848,13 +1848,16 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		spin_unlock_irqrestore(&dwc->lock, flags);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
>  			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  			break;
> +		} else {
> +			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  		}
> +
During runtime resume, we enter else block and call dwc3_set_prtcap() which
is not done before. Is that intentional?

Thanks,
Pavan
