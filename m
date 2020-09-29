Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790E427C63E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730766AbgI2LnH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 07:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729962AbgI2Lmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 07:42:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB62FC061755;
        Tue, 29 Sep 2020 04:42:51 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b12so5105730lfp.9;
        Tue, 29 Sep 2020 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gtW6Ox/3tUcCMKN4N8mUtDGypoU61VjKgzz6aPgmqcA=;
        b=Iqjn2aZlDpnRRfZsWasVKK2tWH7Kx/6zoFdoSRQry34hejCBL+DLEq5kpn21ybyjDN
         Zx86B7ghjQk2nlXmyBDh3CDhhlun5ACLmB7FDKMcl3sck3TZzWoMI0elKE+uS+eA01ac
         0UNV9sXEQc2/HtsDpBzgux2Ur4jQW7VwCLKxuSqaXIdjHWuKYGhSVgw50ajKcgTpZb0I
         1Sgppf/q0fpwX1AmxciPjqA4t6QJmfHpoKMC/trevhXrZYwNT8WaGR+zJwWWGZ7HAyOb
         asrx51fU4MZsa1RbfFI/OfxQldGyyCT7iTGJx5u19lgSP2Uz1v8VjctWF8eleAj7oxXA
         aGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gtW6Ox/3tUcCMKN4N8mUtDGypoU61VjKgzz6aPgmqcA=;
        b=Jcd3bBQ3dAaA9jXJ9ZQFguuwZ4uH/5O0aEcgeaa7u6dm9Gqd0UA6WI4WuUl2yFLdq2
         LAIm0PSyq47ajn33/D6v75H2QHVYVuKIKCEiBt1UZgavNGnYs5ofsokgEN5QxsXEwJhA
         papWTiAAqM1yatKrHExp12Yz13h722QLDxDp9sFFo0r9xDuTV3I9YIG46pKJfw9MtWOX
         idExtqbCOJHaq0LXS2PzJ8H12tTRIyFwo08byrrhfpvERR9WmSYRLvjR7euU/b5i4UuC
         10T1woaf4+1dTYQi9k2q3i7FyossVCQrcUJobvaYAAVNT035oI470NU/4kLZnidWmLL8
         L+Xg==
X-Gm-Message-State: AOAM530sayWgPEjdsFbe5lcyMTZaUHgk+KhN6mHSSjDV6DrsVV1oCN0+
        vUo3YHqFWvO75jEYHMkg0aQ=
X-Google-Smtp-Source: ABdhPJy7h4tqQ3d4mYBYflORtUUy/5CjRN5eJiXyPb52nc6lCUyBtXJfPSXVfNEwwQygCrOsCUNl5g==
X-Received: by 2002:a19:ee12:: with SMTP id g18mr1173677lfb.515.1601379770277;
        Tue, 29 Sep 2020 04:42:50 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:861:66d4:f163:48a3:b6d3:9d73? ([2a00:1fa0:861:66d4:f163:48a3:b6d3:9d73])
        by smtp.gmail.com with ESMTPSA id w9sm3242107lfr.220.2020.09.29.04.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 04:42:49 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] usb: dwc3: core: Host wake up support from system
 suspend
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-2-git-send-email-sanm@codeaurora.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <84c8d18a-f339-b140-a784-1ad489d41a23@gmail.com>
Date:   Tue, 29 Sep 2020 14:42:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601376452-31839-2-git-send-email-sanm@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29.09.2020 13:47, Sandeep Maheswaram wrote:

> Avoiding phy powerdown in host mode so that it can be wake up by devices.

    s/wake/woken/?

> Added hs_phy_flags and ss_phy_flags to check connection status and
> set phy mode and configure interrupts.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
[...]

MBR, Sergei
