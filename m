Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB50C1AECAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 15:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgDRNGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 09:06:22 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:10915 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgDRNGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 09:06:22 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95e9afb3c434-ae501; Sat, 18 Apr 2020 21:06:04 +0800 (CST)
X-RM-TRANSID: 2ee95e9afb3c434-ae501
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.0.105] (unknown[112.1.172.61])
        by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55e9afb3b593-93bdc;
        Sat, 18 Apr 2020 21:06:04 +0800 (CST)
X-RM-TRANSID: 2ee55e9afb3b593-93bdc
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
 <20200402064552.GG663905@yoga>
 <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
 <20200418115400.GF21900@8bytes.org>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <a92f6302-e7bb-0456-b0c4-83298eab71fe@cmss.chinamobile.com>
Date:   Sat, 18 Apr 2020 21:08:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418115400.GF21900@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2020/4/18 19:54, Joerg Roedel wrote:
> On Thu, Apr 16, 2020 at 02:42:23PM +0800, Tang Bin wrote:
>>          The function qcom_iommu_device_probe() does not perform sufficient
>> error checking after executing devm_ioremap_resource(), which can result in
>> crashes if a critical error path is encountered.
>>
>> Fixes: 0ae349a0("iommu/qcom: Add qcom_iommu")
> Yes, that sounds better. Please use it for the commit message and also
> add the Fixes line and resubmit the fix to me.
> Please make the fixes line:
>
> 	Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
>
> So that the commit-id is 12 characters long and a space between it and
> the subject.

Got it, thanks for your instruction.

Tang Bin

>
>


