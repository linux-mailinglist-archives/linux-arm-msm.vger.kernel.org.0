Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217C67663CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 07:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbjG1Fvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 01:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjG1Fvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 01:51:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFC910F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 22:51:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so2917411e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 22:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690523498; x=1691128298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbJoy+y2Yudh1CYrBwAxIycjhiEMLkeAf2hLUb9dK34=;
        b=LH6YTDFSPga/O+VAxidGwEtHUFiI3euAsZYJ51ccNSFe5Qgtgeg9kwxBqunN05CDlm
         kGNggeVbJqUWLEqxdzRBLOUO4KA24vRH2TWLcqYZFoXj4kApGdquNlNU4oFte+F6WFIS
         6GfIpews7zvObUBnY1Mw94OfijKGIIIOYc+v2SFkeyRifN/mkWxK588/D7xru6SLq3iZ
         YCGk1V3fqh4Hk/f6tzMe3sJfUJB4z+9Xjt9WAF50WSbNiudloZSmfk0OHe/YmrjUbIXS
         D7DnFpN8sgy9CikjAz6AkK222KA1IDRS9zcCdz5QGmQXtObIX3fwlOu3rIJv6IGo2ABB
         O9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523498; x=1691128298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbJoy+y2Yudh1CYrBwAxIycjhiEMLkeAf2hLUb9dK34=;
        b=ZKPeUTCocgOGkitBCpfbosxGPJ3eZ55wP3NsPZz2zlDuV0XNi7I275HJLyTF20QSBE
         F9OC8eimuZsrPMrIJt9uKtwP6ZLizHFpvgtwyCXZvH/4rlOBSSTr+a0eZD1S2ptsKyiC
         NsNS9Y2yFzgJ0bYX2T6PCn73vHspoSqj7kaA6QDQJt6QAFGHJg1ur2TL67MezyQhnD20
         ZGgHRcP1cUU9COEBkn56U4JUIddbjG7GuFUBGWrAqOwHDkbPZmOw9+BuBHJNtCIPKn+V
         CZujNXpoA5f3mHe5cf507af+9+3zfyNWn9/nl13+48V36udcCrcHGrOkQOrgVMTK7tUH
         KN7g==
X-Gm-Message-State: ABy/qLb8334W/P41fFA6AE+JiQwEUu2SmZ9WTJy4lVVjCmtIZ0/mIsXR
        jv/SkQIDfT/gnHHT0k32J8DveA==
X-Google-Smtp-Source: APBJJlGAM9s+ylKBZ7ENa9yuO0NicGa5hvMyehHWMw1AMAyqXxPn/1i1xulnaAcUNfJR3YVDzOPtCw==
X-Received: by 2002:a2e:b6c2:0:b0:2b6:df25:1ab0 with SMTP id m2-20020a2eb6c2000000b002b6df251ab0mr924764ljo.34.1690523498209;
        Thu, 27 Jul 2023 22:51:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w4-20020adfec44000000b00317614b6a5dsm3857666wrn.50.2023.07.27.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:51:37 -0700 (PDT)
Date:   Fri, 28 Jul 2023 08:51:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v4 9/9] bus: mhi: ep: wake up host if the MHI state is in
 M3
Message-ID: <1399c766-791b-486d-90d5-a00999eb15fb@kadam.mountain>
References: <1689232218-28265-1-git-send-email-quic_krichai@quicinc.com>
 <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 12:40:18PM +0530, Krishna chaitanya chundru wrote:
> @@ -464,6 +484,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	buf_left = skb->len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
> +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> +		if (mhi_ep_wake_host(mhi_cntrl)) {
> +			dev_err(dev, "Failed to wakeup host\n");
> +			return -ENODEV;
> +		}

Since you're going to be redoing this patch anyway could you please
propage the error code:

		ret = mhi_ep_wake_host(mhi_cntrl);
		if (ret) {
			dev_err(dev, "Failed to wakeup host\n");
			return ret;
		}

regards,
dan carpenter


