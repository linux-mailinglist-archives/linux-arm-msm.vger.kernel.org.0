Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA3423F040
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 17:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgHGPzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 11:55:04 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:34303 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbgHGPzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 11:55:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596815703; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mSYxkLsaVq5dfOiTl3Q4gvm7lK+FCJ9JjXvC8E52WmU=;
 b=C+VKElB64zspHeEzyrvZwTcbiyPsY4U/OnMqlZ5oOdmg1pLra6lPEgL6FIxmQSOa/f/ZPgFD
 AA2djETLbozgnEggn07UKnwzChcnVoLafhvMrs5kII4vAAz2af5JipV7IyxF32q3sOKMrbt4
 0QCceldwrukCWpEbGS2JK9acma8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f2d7950247ccc308c5b175a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 Aug 2020 15:54:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A645C433AF; Fri,  7 Aug 2020 15:54:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6100FC433C9;
        Fri,  7 Aug 2020 15:54:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Aug 2020 08:54:54 -0700
From:   tanmay@codeaurora.org
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v9 3/5] drm/msm/dp: add support for DP PLL driver
In-Reply-To: <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-4-tanmay@codeaurora.org>
 <3b0d0e49-5fe8-e217-4ddc-1ff08e65ab48@infradead.org>
Message-ID: <29b8d7f281aa69df491bedd1e6b6fac6@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-07 08:27, Randy Dunlap wrote:
> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index ea3c4d094d09..cc1392b29022 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -60,6 +60,7 @@ config DRM_MSM_HDMI_HDCP
>>  config DRM_MSM_DP
>>  	bool "Enable DP support in MSM DRM driver"
>>  	depends on DRM_MSM
>> +	default y
>>  	help
>>  	  Compile in support for DP driver in msm drm driver. DP external
>>  	  display support is enabled through this config option. It can
> 
> Hi,
> 
> You need a very strong justification to make an optional part of a 
> driver
> to be "default y".
> 
> so why?
> 
Thanks Randy for reviews.
"default y" doesn't belong there. Thanks for pointing that.
It will be fixed in next patch.

> thanks.
