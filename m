Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966233ABC02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 20:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhFQSph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 14:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhFQSpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 14:45:36 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE10CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 11:43:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f10so1285591plg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gyq5AgwNRarelbVfRJu9j7YFTw4ZYndkdd1MENGMpcM=;
        b=gWZpP3zIwfIurArUQbxL6x26k6M7NQMGOIoXhczSoFTIX4xSC63tPJIwWmXBQZNEv8
         lW0gkj3uUkR5MJwga3sRLggmt5RWp9pCYEenDsV2ZNARm8piT/1jTTELCoWIW7nKgSHt
         8PHT2Y5ldyNTLAulKlpHT3mEx8SuiatezkEwn3pzNLoyQfLNxdH26AUhQKv9cl8pVNLz
         ZA6lvwb0EZBYSU1nngjEfSlfLjbA8Ne7uPddGLMO3IwdyOXDlOjpLz0irregyDDYnv9h
         D8L2RpuxTDRKPAAqGt+F7OXA3lrgJ0q+oWoSGIVH4IHfVUedllnaY+OkUzoeTvPdCQ0y
         52/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gyq5AgwNRarelbVfRJu9j7YFTw4ZYndkdd1MENGMpcM=;
        b=ZrfY6xA4+Z4Pd0KC7d7Lmaw2vwtM7czABotD8Oy91PznSscfJ8scp+Z/J4xqbehwiB
         RQqylKjakB7ek22qSY62drsuIiBx4eZEzYg7qa6Kax4vqL2fAmycpDNxYkzUD895me39
         Hhp77tT/g2ygJDhj0lfBF07A9UBCxayNPvukl6oMX2VgooMZyj35FvOkH6j6qKdiijSL
         ZNRKmM93lKN6OT4PhV56mNBaOgpHoYclCt1J4SxwSySSJSxVJLLKlf7m/MVulmIvLOPF
         CuYdKX0XMlfBeb8QlqxZnwSn2zahlci9dxwwnghS1I1ypx0lNYoIxAzojAt6pLIqtCb9
         iX7A==
X-Gm-Message-State: AOAM532FnM6fUOvK/3tph5LV39A91Rw1d/Ta8K9PjkZlE+LuJwa260mB
        lqHZe+naU0dpmxj1WScgz8fkyGxiszQ/uDqaD7NZmA==
X-Google-Smtp-Source: ABdhPJwaFJAmgOEgRjD4cfEhmU2a7t5ghngCbSCJl04mt6VLW3ywaJLVGu0DAyE8Tgaw+glmV72oZ6LAJ0ypfw30jJM=
X-Received: by 2002:a17:90b:1bc4:: with SMTP id oa4mr6993795pjb.18.1623955408330;
 Thu, 17 Jun 2021 11:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 17 Jun 2021 20:52:26 +0200
Message-ID: <CAMZdPi-r5CiuPT9vR+Pt3Q0nvy31m_NXW7fb7yJ3jPBSQBVH9A@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Apply no-op for wake using inband
 wake support flag
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Jun 2021 at 20:24, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Devices such as SDX24 do not have the provision for inband wake
> doorbell in the form of channel 127. Newer devices such as SDX55
> or SDX65 have it by default. Ensure the functionality is used
> based on this such that device wake stays held when a client
> driver uses mhi_device_get() API or the equivalent debugfs entry.
>
> Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
