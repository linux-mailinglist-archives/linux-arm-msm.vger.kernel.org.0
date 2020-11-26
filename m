Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B182C53DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 13:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKZMUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 07:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgKZMUk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 07:20:40 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E800C061A04
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 04:20:40 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id u12so1950824wrt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 04:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=I1UeLhK5lkQUqckNmvEUJhsql5YPBYYgHazHv8lUUUU=;
        b=uJfDXMDZnxJTIwPzTRofjOQ6csb2iWvSHYxuSNZjQ956VRMK9y4wUe1LNnD2eadr+O
         2BUFCHRIH1okWoDHgKaeGGcKlteYmwFI8/8rLWKeZAY5gVgKloHTfTnhpdWrMftj8h/X
         wZz3edoQ+6WKNoIEUt9l7MGOHo9TOxUDNZ4ft1uRwVYQG+IoC9maSsxlb3UsZSSkzOGa
         MfisXrWQo6aSqZ1TAuSn8LCru83gZreYdYvob/CsrkllRxRbqC68IMHO0WOwLTazxUaJ
         Zs3HB4S+gpSFWV6qJjUClFxm74hpOr+hy3w9UmPh8LhBtVy/xsBqbWl9UZaoSK7zPqOu
         QoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I1UeLhK5lkQUqckNmvEUJhsql5YPBYYgHazHv8lUUUU=;
        b=U51x6le4BgNTNhNH8oFYb+0VxbcVgYeSA83jxSI99wwy8PIHRKl1lgL0IwUcgFDYvh
         dytoBjDYFGJQd9bIpDUxn2Ep5Q7ba5OPiaMfj43UeVSrMh7BdV2/C1Mox5aBSns7g3zF
         zXkS0tf53ewixRr+O2iK9GVMMy06MD1P7jkvrFFkESIUdIowRyWr7W0m9p3ys3AuKexK
         DVtGohV7Zi4XPVqFgi9KIZK1Pww/+HF224v3ZnppIhOSSKhQUDaqj0xHVaTev/B7UFEk
         vjCc6C+k6hRHr/KlDhIsAtxYGHBGO5tV7D1vhAZn0cEaglVXnUW4Ue0wGLGNn8mx978p
         zwKA==
X-Gm-Message-State: AOAM533jTczz5i24lkrF0G7wGNL6Qrb1/XB8smq26j0wykCP6NPX8HLp
        hrFj5TizZeG5MCncHkMGhVuaMw==
X-Google-Smtp-Source: ABdhPJyFsR5iWagJrLMSBiKU/iHYYfx3vRdcZJkFceccaNGTO2pBE7QpnOJDOLlPaApTXZUHnsN0Lg==
X-Received: by 2002:adf:ec8a:: with SMTP id z10mr3621132wrn.113.1606393238890;
        Thu, 26 Nov 2020 04:20:38 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id f5sm9060135wmj.17.2020.11.26.04.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 04:20:38 -0800 (PST)
Subject: Re: [PATCH 0/5] Consolidate RPM interconnect and support to MSM8939
To:     Jun Nie <jun.nie@linaro.org>, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
Cc:     shawn.guo@linaro.org
References: <20200930081645.3434-1-jun.nie@linaro.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <43318c75-cfe2-d219-2ea4-7a130ea5883b@linaro.org>
Date:   Thu, 26 Nov 2020 14:20:39 +0200
MIME-Version: 1.0
In-Reply-To: <20200930081645.3434-1-jun.nie@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/30/20 11:16, Jun Nie wrote:
> This patch set split shared RPM based interconnect operation code and add
> support to MSM8939 interconnect.
> 

Hi Jun,

Are you planning to refresh this patchset?

Thanks,
Georgi
