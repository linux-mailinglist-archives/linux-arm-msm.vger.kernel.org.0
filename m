Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F30322B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 14:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbhBWNc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 08:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbhBWNcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 08:32:52 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CEEC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 05:32:12 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id p2so25820721edm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ir3kp14U8G1+wb+xCJ13XHY+EghmiecGUqZEvVpfA0g=;
        b=OsB4KB2Si32bkHzRemtgklr9BgpQWZYiGc9eGN7S+ZDVIsA/I619MFwKhihUDhz3LI
         rOCto5w/SnZGKlxMVNYRRSA8C02ALl64JGD0L06pqgfgsHoOYUkBeIPXokp+PPa9pKMl
         o+IkFyhheVqW8+jDEjbiYUP41rvrf2Ceyoxvrow8NxTB/HeSX/BZYLpK4vbinb/7/46m
         ukJzn5zYVObSwlIgpna47KlTJ66I2DtKjkma4mk5wBlqEvPfOsGKrb6A+hJmMPa74ceU
         mbgweMI6zNsOaTqPBy2H2eenScdMYkkOBzyYd7KirXLAbUGJRMOB5qHg411cPI/SZgq1
         C7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ir3kp14U8G1+wb+xCJ13XHY+EghmiecGUqZEvVpfA0g=;
        b=GIRidg7G/DCoECpyLn7QNdX4yzw5VO7WCTwUPWJxLNQeg3xzVhL0kexDAS5jQCa4Ww
         IYOJ7walG/dQO3X2cpc3KMyPKMaMeos9JsByC6qnzJTI7WpGhlQw0n1UfcDETGWePBMX
         nrQ1Yp/tDI5UtshFpXNP5mXHIFjMO0W6z/21ezMyjjCWjWa6Vnc2HIRtySKzPmWV1EWa
         45dxezF6S8Cp+d20Nn6O/0X5Z4m3Q64e1glNoDoP9SdvQKLAOM3XwXhUTMvhKCrScprP
         gr/egRtRiR9JZwGbI9GGzp7WGn62UXa3+FTH/PxnKPIqfIfMUFMNCez0u9w54ge6hhxz
         2frA==
X-Gm-Message-State: AOAM531zNz0/L4Cjk44YnKB/fXBjQ54wtQr2jfneXKdDhI3cUZOXAmsG
        6ROc2sfltiQl8RT/odQs7d8Pt0xAJsTD+Qi3
X-Google-Smtp-Source: ABdhPJyZ5ULh4ZAOQnXcxe0DzTPnSPjL3+x3VlSxf2EXzFODoUErH+vxJxL3BZStOZTCdduiahYfjw==
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr27826831edt.296.1614087130771;
        Tue, 23 Feb 2021 05:32:10 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id r6sm14747169edm.23.2021.02.23.05.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:32:10 -0800 (PST)
Subject: Re: [PATCH 07/25] media: venus: hfi: Define block offsets for V6
 hardware
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-8-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c745ae7f-d01a-455c-8024-02e3ee905fe4@linaro.org>
Date:   Tue, 23 Feb 2021 15:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> This commit defines a range of new base addresses for already defined
> blocks.
> 
> - CPU_BASE_V6
> - CPU_CS_BASE_V6
> - CPU_IC_BASE_V6
> - WRAPPER_BASE_V6
> 
> The base addresses of the blocks are slightly different for 6xx but, aside
> from that are layout and bit compatible.
> 
> New 6xx specific block addresses will be added in separate commits.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus_io.h | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
