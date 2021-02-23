Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A26322B76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 14:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhBWN3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 08:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhBWN3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 08:29:02 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCDFC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 05:28:22 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id r17so8187308ejy.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4QXVeEw/os+oreDi54biJMn4AGyTi4c2/3fA9dCJcKg=;
        b=tTHqcYbgCj0lm5qFIfVhiTQxxsofWaIlXMSjAjAxF9mgWtbwXysoO+o697Tq0tJoz9
         1YfJbuPgqxr5ErmUPkegOgUZw+JKLrlR42ZLakhfCuPYyWjSSxXB5Ku4w3aqKoZkzmTJ
         iw5Fi/OevXo2I315Bmb/m67FnyeH5nxbxyAe1AuwJvsgXBi6QFoaSa+TERIBJzK2q4N9
         YM8uVnxTAUuCTcaakVHbHsSw0fyd3yeC9GxvOJCXDFta4FXllZZdMCTHJ6ApJndKYr6Z
         PX4HYraQOI9iN4g0EFgslLcM4D59A91tqgiKUThLiNDVe0UzXNYoaNNWNBZz+Avg2DsY
         cETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4QXVeEw/os+oreDi54biJMn4AGyTi4c2/3fA9dCJcKg=;
        b=aQmrcadG9EMWD/u1tbGi0lJGJI258nLm68JyB3vVtL7zK5joNNNDK/vE7CfCyWZSqq
         YLfxA5jHw6cOw+SoiZZ79HlNhb4BGY0pEmFLm+mDZI1Fqfa0pBlWkKQrk3ecWwElcrTh
         1VEskvcB8266SKu9d7kaPj+FIohbYIN9F4kiCAOUEkVlOCLBNkHXugPSpo2NCa47m3Qw
         NThKLJBvh5Qp77vrRoG4sIg4fMfW6HKZCpPI6dnbkGN2EX/s/ouospW4bs83onRUxUmc
         NmO0UUc5JvOhBhC8+1Pp8Cy2lbqOag72su0OeM2quHYvThyFKeG+WVmkXOgTYpeESigj
         t7hw==
X-Gm-Message-State: AOAM530+QCSaBOWdx0JdAEl0qBDlHG9H5WS6mJe7Tm/S0lYMQAONxbcH
        52RuiZJzwjNLa4xZXy/L5G7nIA==
X-Google-Smtp-Source: ABdhPJy4T48Ih1NE2dSBNVeXlLgxuBmEKkaDWG5/bNSjl3xEeNG7qwC+5XVyRQLxLY1JUQms9kGOKQ==
X-Received: by 2002:a17:906:c210:: with SMTP id d16mr21931848ejz.187.1614086901236;
        Tue, 23 Feb 2021 05:28:21 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id o1sm5635425eds.26.2021.02.23.05.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:28:20 -0800 (PST)
Subject: Re: [PATCH 05/25] media: venus: core: Add io base variables for each
 block
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-6-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e10226f5-a028-4b0a-c5ac-d0acc4fb97e0@linaro.org>
Date:   Tue, 23 Feb 2021 15:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> New silicon means that the pre-determined offsets we have been using
> in this driver no longer hold. Existing blocks of registers can exist at
> different offsets relative to the IO base address.
> 
> This commit adds a routine to assign the IO base hooks a subsequent commit
> will convert from absolute to relative addressing.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 12 ++++++++++++
>  drivers/media/platform/qcom/venus/core.h | 10 ++++++++++
>  2 files changed, 22 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>


-- 
regards,
Stan
