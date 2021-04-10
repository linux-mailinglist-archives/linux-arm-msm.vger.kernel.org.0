Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B579935AA15
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 03:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhDJB7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 21:59:01 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16878 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhDJB7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 21:59:00 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FHJ5h13NTzkjnQ;
        Sat, 10 Apr 2021 09:56:56 +0800 (CST)
Received: from [10.174.178.140] (10.174.178.140) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 10 Apr 2021 09:58:37 +0800
Subject: Re: [PATCH] usb: dwc3: qcom: Fixed an issue that the ret value is
 incorrect in dwc3_qcom_probe()
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <agross@kernel.org>,
        <john.wanghui@huawei.com>, <bjorn.andersson@linaro.org>,
        <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <mgautam@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20210409004945.56776-1-cuibixuan@huawei.com>
 <20210409100018.GC31856@work>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <6475e758-f2df-b58f-c7a1-a77ca7973d17@huawei.com>
Date:   Sat, 10 Apr 2021 09:58:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210409100018.GC31856@work>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.140]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2021/4/9 18:00, Manivannan Sadhasivam wrote:
> But this error message can be removed altogether as devm_ioremap_resource()
> reports it already.
Thank you for your reply. I'll revise it.

Thanks,
Bixuan Cui
