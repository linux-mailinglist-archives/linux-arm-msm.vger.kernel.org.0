Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA1444467E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 18:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhKCRD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 13:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhKCRDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 13:03:53 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5E3C061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 10:01:17 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u17so2882963plg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DMBzmvBB22CaA8yfJuHBpGm7OJc6owoxQJi2DnYHmDQ=;
        b=Ygi8fQv59gfgwqZ8UAEbGTKMby89lkZW988rBOfZPoIbVnZrgIeKjxkyDSlq1HzhBN
         lH+tWlN7poas7qmmVToiuC9U/ghuwWOd7IGDHgh06BUEkmiRkZiF2Z3B6Lqe2RNRf+L2
         DJrkKz3aQIPsCWgD8bpA7rMHAo6MX3cE4OTbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DMBzmvBB22CaA8yfJuHBpGm7OJc6owoxQJi2DnYHmDQ=;
        b=5I36dotIXcny7R72+iUcs3Yy4qzt/oTR/D8Rh91T2WDoKTYPyVrjbIrRofgbgWMfvU
         LgpLodizzEQ2nWdR7px/egHVXUrMLDKrkI2UFo2hdWP/7eQhYkbk30vvCbcaT02gOcsx
         MAstBF6gN63aZrudZ2dfdO503q3MIm2QQv7XXx5YFitzWpBA9njWU8omuIRJTt1MQoYe
         61gPwniOwSCEUBNHnP6XAufU2yASTWfHk/NRjvOfxFRBWKyU39fhRx1rnBigRPpuWIMf
         akyXHp/jAntgHLr8KvaFjvLFw2gfu9FA6A/x+q5r3nWxKUQbQujzK3j1PXwqen/chb+g
         1KgQ==
X-Gm-Message-State: AOAM532Hg/5RSLsdDJmUSzqqf7/4qCK4Asim8h3xHL3VwM9cxb6qJ7Xu
        Jny/nwOh+kkbpRq2NaDTK/dlqQ==
X-Google-Smtp-Source: ABdhPJwFWw4jYft9LGXVGSTlOQj3Q3VNW9elUyrIOaU7e8FcQ0hcRQ2cZmJ6zFkP5jNPOpEJqcpSEg==
X-Received: by 2002:a17:902:6bc5:b0:13f:f585:4087 with SMTP id m5-20020a1709026bc500b0013ff5854087mr39922356plt.32.1635958876669;
        Wed, 03 Nov 2021 10:01:16 -0700 (PDT)
Received: from benl-m5lvdt.local ([2600:6c50:4d00:d401:d8a:3314:9c20:7eff])
        by smtp.gmail.com with ESMTPSA id p17sm233807pgj.93.2021.11.03.10.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 10:01:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] wcn36xx: fix RX BD rate mapping for 5GHz legacy
 rates
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211103155543.1037604-1-benl@squareup.com>
 <20211103155543.1037604-3-benl@squareup.com>
 <CAMZdPi8c1aJCCL8b6iYSz1Ev46jK15Fpa9pG-2FGhrT3FR2RMA@mail.gmail.com>
From:   Benjamin Li <benl@squareup.com>
Message-ID: <5a74137a-97ee-711d-97a2-105b0dd92cee@squareup.com>
Date:   Wed, 3 Nov 2021 10:01:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8c1aJCCL8b6iYSz1Ev46jK15Fpa9pG-2FGhrT3FR2RMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/3/21 10:08 AM, Loic Poulain wrote:
> Hi Ben,
> 
> It looks fine, but can you replace it with a 'status.rate_idx  >= 4'.
> I get sporadic 5Ghz frames reported with rate_idx=0 (firmware miss?),
> leading to warnings because status.rate_idx is -4(unsigned) in that
> case. So better to report a wrong rate than a corrupted one.
> 

Thanks for confirming that. Will send v3 that just falls-through on
rate_idx < 4, no warn or log.

Ben

> 
> 
> Regards,
> Loic
> 
