Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3D52743A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 15:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgIVN5s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 09:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgIVN5o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 09:57:44 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219A3C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 06:57:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so17164643wrn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DGZVXpkjzjAC3dg7W3FDDgroJ+KRU7eRW2TjieEPGOs=;
        b=UT3JyknqdxpX0GVGQvqz0KGFU3G+44tECHiTJakqfTgxQfmfx17OKkiR9ajC1sX3Xp
         CJU05LOZPCOyqUTWXjt12eYomA14K1WKduDmbnwifPLFF9XhOKtdIvFriDxX++0LtvoH
         RAYdkKwHwnaO1+1qdGGZvBsTpGkC9ve/8ljnfOll4DsvuNHOfTKfwg2+dYqhevVNxFy8
         N4IU9aO89d7RpgKoIp1V+7YDO3BvOYxl1MxeR3Gk2v/sQ1Npv5ytDindtqat7oiEj0XC
         x6E1dlEo8ScoTW37+iY14WChjlKXgt3h+aHwvG4SSYZerJY5INGU78zahzWQOgUoYXHw
         FBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DGZVXpkjzjAC3dg7W3FDDgroJ+KRU7eRW2TjieEPGOs=;
        b=WCX/0Akw7Q9BqZxK1E4Qw3R+bW6ML5s3uKCEK65QPAbiPDiuvDuf1ue/fCWXwISmZO
         qjHG0YbhFG3RWMHAvcTsnusj0DbxRRWUfYZmkBvc6QBOM8FKyZkDaWS0M/Gqfol6SCQ2
         pB4WRItdLvvao4Za0RBQcT1Cyar0V/C/riXUJdFZZGGB937vCtIDvWhKqhH/gxz7LyE0
         bwORn+bxjITSa+b3JZrvsDXhZ//ks4xg/dhb8Wh0QjE1PygU2cYOCnmqO4NemRxs5xdM
         Y2m2CoW5RW4+qI37GxZH/nO8lcB0wh7bZdWkND1QoJbI34ML9WjTvdyZ8GjmNiAHo8Lf
         gStA==
X-Gm-Message-State: AOAM531CeSViGYM+TvGLu9Mt43Hy9s7ovoBOfBwTX0Q/0J1vHSKLK7Yz
        DQAVNCqKGVRiKmEp3s39ik4SEQ==
X-Google-Smtp-Source: ABdhPJxpJEG80evddGcTBWHxSsTnTTMSk1RXYjfsOksHLJyqxlBLEQ6HPFNPDCpHk8sVBsEHqBKKew==
X-Received: by 2002:adf:e852:: with SMTP id d18mr5881170wrn.40.1600783062860;
        Tue, 22 Sep 2020 06:57:42 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z9sm5085802wmg.46.2020.09.22.06.57.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 06:57:42 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To:     Rohit Kumar <rohitkr@codeaurora.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
 <20200922110825.GN4792@sirena.org.uk>
 <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
 <20200922114319.GR4792@sirena.org.uk>
 <7f682cf9-0f2a-0227-d5d8-8bedf1f06b00@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b80f060-cb96-1cf9-69bd-f56f7934747a@linaro.org>
Date:   Tue, 22 Sep 2020 14:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f682cf9-0f2a-0227-d5d8-8bedf1f06b00@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/09/2020 13:53, Rohit Kumar wrote:
>> That's very much specific to reg, it's not true of the use of names in
>> general - Rob mentions cases like interrupts for example.
> 
Ofcourse using names suffix for clocks and interrupts has been justified!

I don't mind having dependency on reg-names as long as Rob is happy with 
DT Bindings!

--srini


> I see that patch to support hdmi adds another reg-name along with 
> "lpass-lpaif".
> 
> So, platform_get_resource_byname() is better option.
> 
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, 
> "lpass-hdmiif");
> 
