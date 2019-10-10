Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F8AD27A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 13:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfJJLDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 07:03:34 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:64681 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfJJLDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 07:03:33 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20191010110330epoutp02c785568b60edc4a97216d8d2816621d9~MRD_nEKk-0217402174epoutp024
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 11:03:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20191010110330epoutp02c785568b60edc4a97216d8d2816621d9~MRD_nEKk-0217402174epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1570705410;
        bh=H/jBVEnjkoCcq1zVsV2q7DbcSbaejoURVyyjkUnD6BM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=HE1xAIjRoFyfrCSzRubarCo4ffxB2g8ZMbIHE+CVevmacoUTTURqmoJq101ILpeFG
         rnSa33ffG5TOA+WiXDXDFsP8+9njG2ogEg+wOJvynL9MuMOHpVhNyKF2tG5AOTiOsz
         djnZa1U5yZlqK5A8u6VDkyep6rwvj4elhVC6oWEU=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191010110329epcas1p10019d4c8de992b2f45f20aa54640c6e1~MRD_U7pWS2362823628epcas1p1p;
        Thu, 10 Oct 2019 11:03:29 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 46pp9C5tczzMqYkY; Thu, 10 Oct
        2019 11:03:27 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C5.FE.04135.FFF0F9D5; Thu, 10 Oct 2019 20:03:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20191010110327epcas1p48d8652021f48dade2e5f0a1cc2824e11~MRD7oRCMB2567225672epcas1p4M;
        Thu, 10 Oct 2019 11:03:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191010110327epsmtrp16acc8068fba5054d25c35e3bb9372673~MRD7njcu82987129871epsmtrp1j;
        Thu, 10 Oct 2019 11:03:27 +0000 (GMT)
X-AuditID: b6c32a36-7fbff70000001027-1e-5d9f0fff3038
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        67.44.04081.EFF0F9D5; Thu, 10 Oct 2019 20:03:26 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191010110326epsmtip1a5f228388cbefa1d6b89816439679e2d~MRD7dph-c1155011550epsmtip1d;
        Thu, 10 Oct 2019 11:03:26 +0000 (GMT)
Subject: Re: [PATCH] phy: qcom-usb-hs: Fix extcon double register after
 power cycle
To:     Stephan Gerhold <stephan@gerhold.net>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <91431b4c-fd65-9641-394b-4c9ff6f7a855@samsung.com>
Date:   Thu, 10 Oct 2019 20:08:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008115208.149987-1-stephan@gerhold.net>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmvu5//vmxBhMX6luce/ybxeL0/ncs
        Fhee9rBZTNx/lt3i8q45bBY35po4sHm0LbD32LSqk83jzrU9bB7Hb2xn8vi8SS6ANSrbJiM1
        MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwdov5JCWWJOKVAo
        ILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLJArzgxt7g0L10vOT/XytDAwMgUqDAhO+Pqg48s
        BXtEK2av3sHewHhRsIuRk0NCwETi9NrrrF2MXBxCAjsYJRo+LGeDcD4xSky5NxMq841R4vSH
        1awwLT9/PWEHsYUE9jJKTF5qD1H0nlFi5fyvbCAJYYFQiWUnNzKD2CICwRLHm/awgBQxC0xk
        lNi76wzYJDYBLYn9L26ANfALKEpc/fGYEcTmFbCT2LBwEVgzi4CqxOeVO4HqOThEBSIkTn9N
        hCgRlDg58wkLiM0pYCXRf2UhmM0sIC5x68l8JghbXqJ562xmkL0SAq/ZJE6umgv1gYtE64qb
        TBC2sMSr41vYIWwpiZf9bVB2tcTKk0fYIJo7GCW27L8A1WwssX/pZCaQg5gFNCXW79KHCCtK
        7Pw9lxFiMZ/Eu689YDdLCPBKdLQJQZQoS1x+cBdqraTE4vZOtgmMSrOQvDMLyQuzkLwwC2HZ
        AkaWVYxiqQXFuempxYYFRsixvYkRnDa1zHYwLjrnc4hRgINRiYc34+TcWCHWxLLiytxDjBIc
        zEoivItmzYkV4k1JrKxKLcqPLyrNSS0+xGgKDOyJzFKiyfnAlJ5XEm9oamRsbGxhYmhmamio
        JM7Lyjg/VkggPbEkNTs1tSC1CKaPiYNTqoHRY8IWWTE+Le3rYfFr9uaJH5q5VG3DFOH9HFzH
        3LitItLStvDZ+dwyP5vmMO3bvlL5J5kNLNk6Nlx29v91N+saXNLc5/Et6OuG2onZZ1dvelx6
        4A/flpn3470eJMyx3pqczcJnITs779A5rqW6Npkrc3//XMHn1Zy0RSLS/HZqrBtD/KXznsxK
        LMUZiYZazEXFiQDbbw6UsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJTvcf//xYgzkvLS3OPf7NYnF6/zsW
        iwtPe9gsJu4/y25xedccNosbc00c2DzaFth7bFrVyeZx59oeNo/jN7YzeXzeJBfAGsVlk5Ka
        k1mWWqRvl8CVcfXBR5aCPaIVs1fvYG9gvCjYxcjJISFgIvHz1xP2LkYuDiGB3YwSR6a9YoRI
        SEpMu3iUuYuRA8gWljh8uBii5i2jxO6Z+1hBaoQFQiXe/l4FZosIBEs8fXyVCaSIWWAio8Su
        W88YITp6GSV2vl0OVsUmoCWx/8UNNhCbX0BR4uqPx2DbeAXsJDYsXMQMYrMIqEp8XrkTrF5U
        IELi+fYbUDWCEidnPmEBsTkFrCT6rywEs5kF1CX+zLvEDGGLS9x6Mp8JwpaXaN46m3kCo/As
        JO2zkLTMQtIyC0nLAkaWVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwTGkpbmD8fKS
        +EOMAhyMSjy8GSfnxgqxJpYVV+YeYpTgYFYS4V00a06sEG9KYmVValF+fFFpTmrxIUZpDhYl
        cd6neccihQTSE0tSs1NTC1KLYLJMHJxSDYw+Vz7tTNU7zjdz/yUB8XcsHxdI9R6RuzbBsvzI
        bCfNiB2bbkmlBu3fPctiXWjILCWP/p15Xq2POg9EPetImXyheVfzMbVHbvf+/M2UsV94wlHr
        z/1We6NHS9Y07qsxKtM4lCqxflrlbp3YpbO2b9SZ3RLEnRKVnlcQlr5rZVfLa5O/X3i2yJkp
        sRRnJBpqMRcVJwIAw7XeNJ0CAAA=
X-CMS-MailID: 20191010110327epcas1p48d8652021f48dade2e5f0a1cc2824e11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191008115339epcas3p313aae9554dcee0a4269518fef1474ccd
References: <CGME20191008115339epcas3p313aae9554dcee0a4269518fef1474ccd@epcas3p3.samsung.com>
        <20191008115208.149987-1-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19. 10. 8. 오후 8:52, Stephan Gerhold wrote:
> Commit f0b5c2c96370 ("phy: qcom-usb-hs: Replace the extcon API")
> switched from extcon_register_notifier() to the resource-managed
> API, i.e. devm_extcon_register_notifier().
> 
> This is problematic in this case, because the extcon notifier
> is dynamically registered/unregistered whenever the PHY is powered
> on/off. The resource-managed API does not unregister the notifier
> until the driver is removed, so as soon as the PHY is power cycled,
> attempting to register the notifier again results in:
> 
> 	double register detected
> 	WARNING: CPU: 1 PID: 182 at kernel/notifier.c:26 notifier_chain_register+0x74/0xa0
> 	Call trace:
> 	 ...
> 	 extcon_register_notifier+0x74/0xb8
> 	 devm_extcon_register_notifier+0x54/0xb8
> 	 qcom_usb_hs_phy_power_on+0x1fc/0x208
> 	 ...
> 
> ... and USB stops working after plugging the cable out and in
> another time.
> 
> The easiest way to fix this is to make a partial revert of
> commit f0b5c2c96370 ("phy: qcom-usb-hs: Replace the extcon API")
> and avoid using the resource-managed API in this case.
> 
> Fixes: f0b5c2c96370 ("phy: qcom-usb-hs: Replace the extcon API")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> An other way to fix this would be keep the extcon notifier
> permanently registered, and check in qcom_usb_hs_phy_vbus_notifier
> if the PHY is currently powered on.
> ---
>  drivers/phy/qualcomm/phy-qcom-usb-hs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
> index b163b3a1558d..61054272a7c8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
> @@ -158,8 +158,8 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
>  		/* setup initial state */
>  		qcom_usb_hs_phy_vbus_notifier(&uphy->vbus_notify, state,
>  					      uphy->vbus_edev);
> -		ret = devm_extcon_register_notifier(&ulpi->dev, uphy->vbus_edev,
> -				EXTCON_USB, &uphy->vbus_notify);
> +		ret = extcon_register_notifier(uphy->vbus_edev, EXTCON_USB,
> +					       &uphy->vbus_notify);
>  		if (ret)
>  			goto err_ulpi;
>  	}
> @@ -180,6 +180,9 @@ static int qcom_usb_hs_phy_power_off(struct phy *phy)
>  {
>  	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
>  
> +	if (uphy->vbus_edev)
> +		extcon_unregister_notifier(uphy->vbus_edev, EXTCON_USB,
> +					   &uphy->vbus_notify);
>  	regulator_disable(uphy->v3p3);
>  	regulator_disable(uphy->v1p8);
>  	clk_disable_unprepare(uphy->sleep_clk);
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
