Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962EA2740A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 13:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgIVLWm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 07:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIVLWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 07:22:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF11FC0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 04:22:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so16599619wrn.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2020 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KcHBNX7nlokKK8kXMf7m8iqw5HFaqgsL1z5AnKdw5mI=;
        b=HFkCRyZ/G04J1NQM/rjpr4zU+6zo1oRGQLNqubIT4svzl5PHzy4iRgnOurNoDiI+Gi
         MXvyGTRi0Z0M5B6IopUrBYm9enSxRWJM5DL+VfI4K6tad9FBRV3XF4cJiW1MiSQVyF+I
         35Fg2wVjsjmBxcuTvBy+PbR0MjEnh5qRCk3phLYnJYAauDA71gn39IDbMsgXObjAgK0p
         i+KukRYF9A5kA/Xz1g7Ln4BZBwE2A/IlGSJKr19MLpYW9bHEWY8jbr+rrX94VtW/S1+p
         aLBNlVR6tinobS/05m0JH2pXzvGToQ2BIMswIsiwvB3e2DeUqzQmUmYtBDnC6ufG5KP7
         6BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KcHBNX7nlokKK8kXMf7m8iqw5HFaqgsL1z5AnKdw5mI=;
        b=LvZI/Oz34MW4mY1/916OZaUjels2Nv0MjEU7RTBlPcaQNYngMmwY91df+eMRewTFOI
         fuo18doMMQmvSNhD41kDCFf+Y1UMg/krdFQYqvbSfQXY/LHW9Q6ZkcFsX1mIIZQiGKEc
         MxUrXSBlMm4FQRMhAwHR9yFkpL55SHnq5f4Vpap6rVZQBRzvIut/ccfpogb89uTtfQSR
         ASIKASqys2Oc3MhZ4uk+sVfqAM/fC3A3AwuJyTT93ZNDxGeiSKEAdFV5bBMtHNUo7XVB
         uyWC13ef7iTn7jjTioUNjEowwk8FDsIjGqlYvrlPf1rKtgaeU41rZPARvCuE4kKq1+IT
         +EzQ==
X-Gm-Message-State: AOAM532FLul1r6ZKDXo1KtNcfzcW7J99UWptWAip8vu+vLHgUjBIsqvi
        5xUIe68Pu4g/OziG7JQm/YJqmuN6LJnc4w==
X-Google-Smtp-Source: ABdhPJwoirXaeQd83hSfKFcPFFMyZX+E/QOqT24xhgtDSOc64OlQ49XFn+VCUoLu28OplXJhN5OQGg==
X-Received: by 2002:a05:6000:109:: with SMTP id o9mr4276415wrx.364.1600773760449;
        Tue, 22 Sep 2020 04:22:40 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id n10sm4494807wmk.7.2020.09.22.04.22.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 04:22:39 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
 <20200922110825.GN4792@sirena.org.uk>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
Date:   Tue, 22 Sep 2020 12:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200922110825.GN4792@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/09/2020 12:08, Mark Brown wrote:
>> On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:
>>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
>> Index is always preferred over name w.r.t device tree bindings, so lets
>> stick with that for now!
> It is?  That's not usually the case...
> 
>> Unless you have any strong reason to lookup resource by name?
> Looking things up by name tends to make the DT easier to read (since
> things are named).

I agree with you on this and I see the point, but Rob had a very 
different opinion about the reg-names bindings to start with.

This topic been discussed in the past with Rob in many instances ex: 
https://lore.kernel.org/linux-devicetree/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/

According to him, reg-names seems to be highly discouraged as it came 
along for the OMAP folks and was related to the hwmods stuff.


--srini

