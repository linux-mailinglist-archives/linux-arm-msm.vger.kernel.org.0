Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE8C49BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 10:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfFRINC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 04:13:02 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38843 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFRINC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 04:13:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so2120475wmj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A1EQqhov8GIAHcRALyrTo95BX/wMNvkrcX1BAH+gcHU=;
        b=fVFXPhPqKIKjaT2O6gcVuMT+Bp6qsx0D3k8Zab+TsU468kSMjEi7t1AsBPaFFPoVGz
         YFt/t7e/lBHvir+0dDviw50OaKw8BoS1n8ag7dkiF8QctNTnM1PtVwTt2klkB1GC/GPi
         3uhFkk5SmeidcOT84y94qnWZY2C1t+NVDsRq2nj8hNuTpsnkgvubcHK/ibV6f7gWWDiS
         nE4AEYUnk6DAPts40QJ2RSBxr0lSGkNGeR/Aw79iXvFYWUeKgls21JHuI6X3sT+2du3/
         kHUsei92oxxLKcb+ZgCYHddMVQZMUiuHD7uUFiICCl0LydhP4PX9hRpuY/+6F64V2C88
         qC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1EQqhov8GIAHcRALyrTo95BX/wMNvkrcX1BAH+gcHU=;
        b=VAmSogzkiKrscWoSKB4MpevHyljlQZvHHooCDqF8xcVrLD7RWwsQ69/Q8iCmkxBVSB
         3dJTnSGNhTZXHpZrTBCcNXXXrcmRiFbbqMFXyQCG2jIuC3vCPkt3Ja6jKD60pHJKFECQ
         vqHM/k1xWw24UnCarYiVNbq4ASkYg3LzKl5zROm5BTHquORp+R3/CR+ha1mOc+OGJ882
         5bjITYb7zNJSAc2Jt8n/gO0SUU2dBmZJqmp94Lz9mTcCus09KyljpMLCqXk2W1869H/c
         xsnGRDlPQFdcaxLoSVMkTeEzDxczJ2Ts3ti9wyXklBv8IQ1vCABwuIsnd/k/DoN4Jwpr
         hswg==
X-Gm-Message-State: APjAAAWpzNmVQKsl9sZFzTSrhewEksS1+INHKO6j1qcuCq4McHh7PJp2
        V0TIKKjn5Jfhb0NdcESlheZ7w8OHpl687w==
X-Google-Smtp-Source: APXvYqzIrn8u/txhtI7DRk2qYrbC/FWvYlvylHwE4xyIyB3aOYH2N7Zh2XTDr4RKjkCNwWcHIIYflw==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr2360140wmg.63.1560845579797;
        Tue, 18 Jun 2019 01:12:59 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 32sm30733908wra.35.2019.06.18.01.12.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 01:12:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: common: Fix NULL pointer in of parser
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20190618052813.32523-1-bjorn.andersson@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ad8ef1b1-a69c-df2f-cec4-d69278b570dc@linaro.org>
Date:   Tue, 18 Jun 2019 09:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618052813.32523-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Bjorn for this patch.

On 18/06/2019 06:28, Bjorn Andersson wrote:
> A snd_soc_dai_link_component is allocated and associated with the first
> link, so when the code tries to assign the of_node of the second link's
> "cpu" member it dereferences a NULL pointer.
> 
> Fix this by moving the allocation and assignement of
> snd_soc_dai_link_components into the loop, giving us one pair per link.
> 
> Fixes: 1e36ea360ab9 ("ASoC: qcom: common: use modern dai_link style")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I think the original patch did not realize that there are multiple links!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
