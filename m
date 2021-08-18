Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0AD3EF891
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbhHRDc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236392AbhHRDcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:32:25 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C44C061796
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:31:51 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u25so2546605oiv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 20:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WN4dMj5d20fATkNAOc2ycF2zHpaO1GPJJSRhHXja7SE=;
        b=eJhaLJfma1JQ5TUG+s2ia19ac669B2P5fCw2l5SDt2KfGVOg1G/GKqJAYkhZzznN9Q
         UvWMan8aRQfSlT7BNpfBpHgxCWb0o9zNEXZ1uXG7A8CFAbmqDYq217zaJ9MQYYEYV4kk
         Bf0KiLDGuI7NTTpmQUBmgeAinkn3u+emo+SMlcq3UxJ+aJKECzaO2YWSZsE3F1Im+oGa
         qf3qq9JDCN6Mac93pWOo7YsLJDQKaN3JG+kpPj15+HiCxJfTFrGUCv+BD9uyry//6hh9
         qFSX12EoEuSVqSYU5RDr0SrjRWdF+ov9DvIZHpjGWSfj7IuFAgJ+S8j7B9qX2QQ/9KA5
         rWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WN4dMj5d20fATkNAOc2ycF2zHpaO1GPJJSRhHXja7SE=;
        b=E49eKmCW95VxPnH+JaIJx2A6V+6PEVfMXF0E18SAF9EoOdaKssB7egABQVqCosAKeM
         OlpSKtxapFX1WJHwFTk5Tq1L2A8HaGk2pNm0rGnBqQWy/JzIfqg71+QaQIfEtd1CmXwO
         UVuthpTvLbASdyTpXHiuCOLTFn7AUJLEi7rcC/WhTTyHYPzlyfViP7rMkSqLzs6+ql/H
         ivI6zU7U61oKaZdt2VIu11SuNKGZVMTwIsvxDZd/nMEFVU8itezIJrw9YyrHmQuVrKNN
         YcU1u6yQxDwQ+8dT+PXZoCG0l4DZ8VAYKSDaRtkZ9PjgKt+iYr79vW6kh20j0GDFXU55
         VkiQ==
X-Gm-Message-State: AOAM530ZYfFpc5yOgPp8Y08eFSnoRLe8oDa6A7Vh6OJCY6AVxWL7tMmc
        Bu770+VefGpPa3Q0G7UExMIl7g==
X-Google-Smtp-Source: ABdhPJzgyuYUy7LVLHvBOog++sY2NASP245ebr4tWB0Ur51NO1QI5VJ1GtOePi85x+y/FKUpgfHKfw==
X-Received: by 2002:a05:6808:2020:: with SMTP id q32mr5157063oiw.30.1629257510865;
        Tue, 17 Aug 2021 20:31:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q187sm1026923oif.2.2021.08.17.20.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 20:31:50 -0700 (PDT)
Date:   Tue, 17 Aug 2021 22:31:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] interconnect: qcom: Add MSM8996 interconnect
 provider driver
Message-ID: <YRx/JFLXHvIlKgOR@builder.lan>
References: <20210811043451.189776-1-y.oudjana@protonmail.com>
 <20210811043451.189776-6-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811043451.189776-6-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Aug 23:37 CDT 2021, Yassine Oudjana wrote:
[..]
> diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
[..]
> +DEFINE_QNODE(mas_cnoc_a1noc, MSM8996_MASTER_CNOC_A1NOC, 8, 116, -1, true, -1, 0, -1, MSM8996_SLAVE_A1NOC_SNOC);

Unless there's strong reasons against, I really would like for us to
follow sc7280 and avoid the DEFINE_QNODE() macro for defining the nodes.


That said, I really appreciate your work on bringing us an interconnect
provider for MSM8996!

Regards,
Bjorn
