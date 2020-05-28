Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A941E5B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 10:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgE1I6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 04:58:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48072 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgE1I6J (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 04:58:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590656288; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TNqDL40LlCjpsjbz12NhEYJJSkincfYBy8FmVcop5ek=;
 b=un1Guamk731ECamhPZu6kMW+3kcBi54VyO9lQAUW8ntKcoJa6hwG6iAglrXMUx9A+iFdNd2u
 QMebZLL/UYrhmBwiJr625vpiG8hArkUOGISnb/DYd9uAwrFyQSMc3aper1Zbb+upjDGw8NqU
 Bwb0Vw3Ub60o4+LWc5eHd8RX2es=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ecf7d1fc6d4683243c5810b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 08:58:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86AD7C43391; Thu, 28 May 2020 08:58:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D3E5C433C6;
        Thu, 28 May 2020 08:58:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 14:28:06 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, mka@chromium.org,
        devicetree-owner@vger.kernel.org, robin.murphy@arm.com
Subject: Re: [v1] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
References: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
Message-ID: <219625b5b2cc0eddb2e975d457a2c40d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krishna,

On 2020-05-28 14:08, Krishna Manikandan wrote:
> Define shutdown callback for display drm driver,
> so as to disable all the CRTCS when shutdown
> notification is received by the driver.
> 

Would be nice to add some more context for adding this shutdown callback
something like below:

If the hardware is still accessing memory after SMMU translation is 
disabled
as part of smmu shutdown callback,  then the IOVAs(I/O virtual address) 
which
it was using will go on the bus as the physical addresses which will 
result
in unknown crashes (NoC/interconnect errors on QCOM SoCs).

PS: Credits for description: Robin Murphy

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
