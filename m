Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DEE1F2B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 02:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731315AbgFIAQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 20:16:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21123 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731199AbgFIAP7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 20:15:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591661759; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cnXptHuROdhiqd7OJYq02Tw3oZx7BeMflcINlbXkNI4=;
 b=DMvCpr8oio3opvf4ufWV839uxQBvHcRjmMgGHyWfXlKHznKXeHS1+ciqS+JVY5LGN2qWIivA
 7aORyGCcsV7VvIULQk57A+0Elr2krqeaOo5eYpJY+kCZm4QCdRofxtku7A0IpuUV0wxqssTe
 oBTsufZnUfY+YMKhio5EJqPsPIg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5eded4abf1889e857a21e4c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 00:15:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99DECC433CA; Tue,  9 Jun 2020 00:15:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72257C433AF;
        Tue,  9 Jun 2020 00:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Jun 2020 17:15:38 -0700
From:   tanmay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, jsanka@codeaurora.org,
        aravindh@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [DPU PATCH v5 2/5] drm: add constant N value in helper file
In-Reply-To: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
 <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
Message-ID: <51b45caae61860d6732d7ef575859d72@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-23 16:41, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-03-31 17:30:28)
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> The constant N value (0x8000) is used by multiple DP
> 
> There's one driver using it, not multiple.
> 
Changed commit message accordingly.
>> drivers. Define this value in header file and use this
>> in the existing i915 display driver.
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
