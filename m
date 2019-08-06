Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77DE782DED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 10:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731735AbfHFIkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 04:40:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46003 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbfHFIkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 04:40:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id n1so718620wrw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9S2OrSnHcz2XIEp00Z2uwFwV9br4hMO2npiHqZr1Nfw=;
        b=jOEpmmvLb75qXd97zx5Cpwu+JQZOlgeIKW4SNNbJF3coCYZE1V/p1dXPWS73sThUqZ
         VeAy6lZwGL/hUb+QCer9bmtcTgfQWXE6MhPlPtisdsXaetNa4elkTsmXZVMKPFYSJ/US
         QoYpPFEf86E5tub3jhvJjaALFndSMhWp77b9tIlQk6ZntVmr+a5VmfrHami8M+WywHUx
         hMa+0CSa2/0UvriLQMJlqa/h3myiOjwnVwq7ceyK1rLFtpof1AlaBktw1wBWGNHWFrOB
         c4+PU+9OTeFNseuUnn6BSKm8Car0EfW6z4TztjsgouJ4WFY+RUpTltNSIHv151obfufU
         SISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9S2OrSnHcz2XIEp00Z2uwFwV9br4hMO2npiHqZr1Nfw=;
        b=SyhTwmYzEfTzOPT+iSSkuKiPFK8aPKbTh1Yc+ZFSXVEMcQ4BCxpES8CR2Y2sbHO8Se
         moFb7NOpDugJ+yPoQOIFetUyapUCSKFoMt/02RxwEUGrXXdPjnKF8/gVh4gkW/meNB6r
         mD9/YY6PXmHFpEgvZUyfClS/uKTbmu4z/FucwyM9qvQ7jA/DeKw8qoMtkV7sRBtGlwdv
         mahOnw8px/YoYvPr2oXKWo+qFAuBL4nJFeLWnBXeHkzTPHyxE0jn1Cb1lUOGmGxcrPjB
         yR+weYJreGygaFP9nb2mMUEgMJJwD33AMTn/nkbLVOG9B2MXsItUhQD+OGOo3w+ZsL6c
         cXxQ==
X-Gm-Message-State: APjAAAXmTSO7T4xBIHVeA4D+ERhxr1jIYvgvHuwFDhw5eOPB6oUhUME+
        Y6gbE+aH+MBYmFj2+e39M4lioA==
X-Google-Smtp-Source: APXvYqyNrbhE5lyI0PBvvuPol+1GQZ+9ZGCblooDRlEw+9xbE0GazkhDHHR+PxhTNnZUQ4j5Qvyy5A==
X-Received: by 2002:adf:d081:: with SMTP id y1mr3463306wrh.34.1565080816226;
        Tue, 06 Aug 2019 01:40:16 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 32sm79637252wrh.76.2019.08.06.01.40.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 01:40:15 -0700 (PDT)
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20190804162201.5838-1-nishkadg.linux@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a2eb9347-1568-c6e2-d9b7-e45669e192c6@linaro.org>
Date:   Tue, 6 Aug 2019 09:40:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190804162201.5838-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/08/2019 17:22, Nishka Dasgupta wrote:
> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Applied Thanks,


--srini
