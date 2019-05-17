Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DE621B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 18:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbfEQQZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 12:25:21 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:51980 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfEQQZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 12:25:20 -0400
Received: by mail-wm1-f46.google.com with SMTP id c77so6025406wmd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8x2Jy6/gxZmiezgdFVn1BQR/C6WvCQ7LwkCWGJtj+hI=;
        b=QaZHohHYfmwHjH4GvWttm3+9MJWC/0IJ5/Aro3Wu+pdYp7FyBA1SYgTXoWSUFJPpZF
         yyHQmF+d2nOxFU8JzNBbveifLDji7skAw5dWHCnc+z2dSJGpNvs3685UrWXp7u0fXnd5
         +mIt8qddf2y4wwI0ffXo+rr3bittdci8FYuzZbEonksAISNEquDZNrkAo5XghTlRP6AX
         3fgq5Hoc7sWuMARPZuo19SMlYM30mYhupvF9gCXQHLGB0IZkJNwtZzNakL0qdAXdz749
         nhDmsikrJAlgjjTZb5RDfxAY6A8BNFfIW+kWbROm6RTdRjoxVoQuBEPj3JjnQxchB9xj
         Wl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8x2Jy6/gxZmiezgdFVn1BQR/C6WvCQ7LwkCWGJtj+hI=;
        b=gAWJh9svVhcM5yc6YXpuJpNbkfZsrQ+HCfT7lBaJv+QbniNWG8FR9svAG/dMPLFppj
         0v1UJKkFAbBGeO+JK7HvMfxSJ84PfKXnillaoDMJIyKSjYbHXY0fbwQDM8ozohKXHZD+
         W9olD/1AIuMtsICm8QWw5UDDmHqpZQlQdy2KbRVA6ujEK/0ZHKkm0l6pI4gDrBpk+B+H
         8/a46C9dtvA6ZVcKmvA8GBbv/wmaFbwXNHEG7oeWxoodk7PXmguDoRanYT7YHUVijT5N
         aw1egFo/k5CM2tETas9fPgPbmd/niUbt4+DrhtZ0M1YyRcXfk3ERZbHFJWOWcA8vWsZl
         JWdA==
X-Gm-Message-State: APjAAAXsOJuY2ZuMr+J12wEQ5VccM2bR1Fs9c9K/yuLjyV9/2q2g/umv
        tqmHH4fsXGlBvnyR+TiHeuy7QQ==
X-Google-Smtp-Source: APXvYqwPm5Uo6MeWvcRhGVDqKtnGQIbzB18KIfogvsXWSaBa2KfTjIHRF150v5mcpy4LLvwCUH28FQ==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr17740012wmj.25.1558110318183;
        Fri, 17 May 2019 09:25:18 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id k30sm13228108wrd.0.2019.05.17.09.25.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:25:17 -0700 (PDT)
Subject: Re: [PATCHv1 8/8] arm64: dts: qcom: sdm845: Add PSCI cpuidle low
 power states
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
        devicetree@vger.kernel.org, mkshah@codeaurora.org
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2132b7dd-8832-7db3-d05a-69eec3d5f139@linaro.org>
Date:   Fri, 17 May 2019 18:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <044cd74e461a1dd7934f44531802f4b557264365.1557486950.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2019 13:29, Amit Kucheria wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> Add device bindings for cpuidle states for cpu devices.
> 
> [amit: rename the idle-states to more generic names and fixups]
> 
> Cc: <devicetree@vger.kernel.org>
> Cc: <mkshah@codeaurora.org>
> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

