Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560834AD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 23:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730428AbfFRVlf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 17:41:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55149 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730412AbfFRVlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 17:41:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id g135so4854236wme.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 14:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=npjnmaSr2vkCmDXoz3+FiT+jLOxPrHd/kPwcRCCzYl4=;
        b=oeNyLCilPkITLmXVFaDVzdrf/aLDJjiKitNEZaENhh0M8+Z+FgTWcVTe3mvprvIMmZ
         kVDAXDElMa+5FkusYyYQg0ZDapkRSnri4u8NuDbzt8OFV6ctmH/yrMbKetHVjwInbqni
         RGNkgOHbdzojbDhs3HnKRB84CKYsunDDcNAgi5zqsOjOJ5n4V4G16PQ4v9V864qKKF5I
         g5FAOLo9bt0kjeixgYLexM4fiYyXsMWLmSR20ETaAb3XZLCrd2xKlA94AWpVJbO/pBwP
         6SAvTW0tN5x9kMA2BmeoKxidSrlTWWtzTSynsZqvwoB5t6QtUt+9DlCBaiaVDDTPLmlY
         t5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=npjnmaSr2vkCmDXoz3+FiT+jLOxPrHd/kPwcRCCzYl4=;
        b=SR9m4sDP3Fd3iAmXOlD7/+GXbm03FFzzjJ3AWVLbWtopSjuwtgFgr0F73fxtO+u41l
         ajFbSOWXEzHO5L1GD5imb18kDfXwU9wzkvIoTsVenmXgjdyrx4rHrsV6A0U2tKqaUrtG
         jFYuYRp7grV9V7jtX0oA2nFi1IW980GJ4/FjSpoGshEQLMR3+zjWhE2D+weY5+rQDGCc
         ZClJ77z79Qs7LedsWj2GgP6Ywvt8LNeUpHgkoFmvPnEf+zt9K5dlgufbQQGmDn3zyJKF
         gOdrebEG0QV/V4YetH71m/YaZyuAlliLimr0sFzcxXEqMacr/PpBp2/2J3nwseahbt2N
         bGhQ==
X-Gm-Message-State: APjAAAWPImVZc0xPRhnUth3p6KP2k0PTWEgbX4hklR9gerTKdofYocrR
        bWMQNph/smIewW91CgAdhv0KEQ==
X-Google-Smtp-Source: APXvYqzriXXa80Q7KkVfSb96pNBw5Q2jgBhKV3KaX+d4NgOHn6hjzmn39dYZ9VMJZ+4IgzakHn7xRg==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr5010451wme.157.1560894093099;
        Tue, 18 Jun 2019 14:41:33 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id o20sm19019027wrh.8.2019.06.18.14.41.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 14:41:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Correct apr-domain property
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190618052547.32376-1-bjorn.andersson@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b0036d9f-eec1-7531-545f-67b651ded729@linaro.org>
Date:   Tue, 18 Jun 2019 22:41:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618052547.32376-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/06/2019 06:25, Bjorn Andersson wrote:
> The domain specifier was changed from using "reg" to "qcom,apr-domain",
> update the dts accordingly.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
LGTM
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
