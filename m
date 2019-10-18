Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10892DCC35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 19:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505292AbfJRRFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 13:05:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46506 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505283AbfJRRFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 13:05:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id q5so4243127pfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3AWhLBU87R+tIjbOIzrOp4O2c50HJ77phRCMMuhDr1M=;
        b=XeC1eSsupnxZ2cZz0V/Tb10DmQP8FRk85GjE//57o3i9hmb/DJCAK42pb5JgfbUo08
         xi3/szTMch6NOOcybQHJD08mJdjKhQHWCLatwJkQVwtJx/JKQOO80zRPK3MR67P0Rw6x
         j8E/DnUOqTD//H2VsFjdRQCnNReZ9usDZVBUPiL+kXiPRV05qSvrF0m+KjEdN9FJnWAt
         p9BlwjAxmXMmWU1LVHKdUjCc5Ny3J1W+8U8g/FD95Z6s03ZiBYO3epkhdsuEzrfI4RfC
         S7/l9ansDJJnZYGJAZm7BddnoEQhm/P619/PSz7bGfdkw9oDiwzmyB7Q98pg2kUaxQQI
         xlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3AWhLBU87R+tIjbOIzrOp4O2c50HJ77phRCMMuhDr1M=;
        b=ilQrYbUZosfBIQi0LdSxw+vtNhpsi3a+3RWO3GQSEEvn3RAs0HcLsQqkVaQrLiIDAE
         ROTWyBlLVUQ8iiZxe+Ru4j/cERiwgPSJNopv0Z2PrNPJfkaUN4WhAe6ak0mM9vGwXSqp
         WdfSC+HoO4ML/gQH4nZ1K5BUwzlIaMu3g/HnFFyFmqZ8cFsUW8N3fs1E55qc7hSyYMx7
         RcWI0VPYfVxyACDbywNm4Rm82WUce/2W5ONCEqOK+mPOwdfIPhlzfzr2KUTD6MNXGh47
         kMwSl3WbXGYqswG5HRnc1ERcPaM2r/7UWum+xf2t8TRKWuJWf3efPDTmyvx0Rs/S3NeX
         gf6g==
X-Gm-Message-State: APjAAAXcXnqBAicrHgVZugiNqbXyG2qlxgVND0fcG5Ef1gAGU+F1jyJI
        ezD1vLVv6NDY6sUNIfO6xZ+AVQ==
X-Google-Smtp-Source: APXvYqz7a3/zrYpGmxBc3pou+oeyNDpKOmnUhi9w1oWvzYGHinizbWe7tR4ZySKQpst4zwh7RFddmA==
X-Received: by 2002:a63:f418:: with SMTP id g24mr11352479pgi.15.1571418334884;
        Fri, 18 Oct 2019 10:05:34 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 2sm8872881pfa.43.2019.10.18.10.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 10:05:34 -0700 (PDT)
Date:   Fri, 18 Oct 2019 10:05:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Enable msm8998 bluetooth
Message-ID: <20191018170532.GC4500@tuxbook-pro>
References: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Oct 15:18 PDT 2019, Jeffrey Hugo wrote:

> This series enables bluetooth on the msm8998 platforms.  However,
> without fixes under discussion [1] and [2], the init process will fail,
> leaving bluetooth non-functional.  Perhaps it is best to wait until the
> dependencies meet acceptance before taking this series.
> 
> [1] - https://lkml.org/lkml/2019/10/17/599
> [2] - https://lkml.org/lkml/2019/10/17/975 

Since the two patches has been applied, by respective maintainer, I've
applied the series.

Thanks,
Bjorn

> 
> Jeffrey Hugo (4):
>   arm64: dts: qcom: msm8998: Add blsp1 BAM
>   arm64: dts: qcom: msm8998: Add blsp1_uart3
>   arm64: dts: qcom: msm8998-mtp: Enable bluetooth
>   arm64: dts: qcom: msm8998-clamshell: Enable bluetooth
> 
>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 17 ++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     | 14 ++++++++++
>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 13 +++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         | 27 +++++++++++++++++++
>  4 files changed, 71 insertions(+)
> 
> -- 
> 2.17.1
> 
