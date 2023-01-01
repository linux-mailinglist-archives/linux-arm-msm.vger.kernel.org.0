Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA1565AABD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 17:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjAAQs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 11:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjAAQs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 11:48:26 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C532621
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 08:48:25 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id q2so27089651ljp.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge4PP1SVJmKzIUfpzygbNjv7xfpf7GwfAHU5wdsn3v8=;
        b=iyWofjg1cuc1wFt7FbNU03134Ig4lU4d7FLbhbPl/5XKtZZzoggW9hhf/5Bn+T6NRV
         vyntxu9tdPh1FFPRtc2lY87M26ZGGIJvH+dsuUEHpuuTK3+I2rrTkAMDLJJEDFotdKTu
         poawfAgq6/2fO+SRgzqMWgpDpBv8DpBjh57Bmg3fVlvJ5YcrAG3/2X4uuAUeNeZI/ALY
         PvcQkh+5DnchCubmpZoa2BeP/bFzZsL4cO1PNVoidx0jjCQGZaR2PpUGEIp7uwaL8hhu
         IV19ZfdqZlmWN41RXaFzCWFCpY61XLp2dAJuKLIjTyK4ooYqDjR36JiFbpihzlNBi+xx
         VIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge4PP1SVJmKzIUfpzygbNjv7xfpf7GwfAHU5wdsn3v8=;
        b=USHbm7LM4oX0vAFEM6eF1oyE8NG7wijw2U7bQOIDqXFKlTVbL+U2aYLCd2naVI25/8
         +5fQcKWc4nf8zVxL05L+abMyTeVdgA1JwnZf6iy1TS8Jy2lrmMgtgRvR1nN2/0bo1SWa
         g6P+gjQzrbIav5GbYt6bbxDPwLI3bQCfKRIBbhnMxWRzzpIkXII6z3enU3a3iVgUx+dl
         mzzE+uNAMfluPYfPPTQjrQAJhli4eiOi7kbHWSLBomnxnTjwnpktpYOp+/P1agGqXwdE
         IZp0WA2c6geWgqzVDRB03lk4XGcdsOFfDSQuzuGIsjmPGJZliWHQsQIpF+Ra0M8Jcp/W
         fqhw==
X-Gm-Message-State: AFqh2kqsV0prrPP9Hfd+PX3fkC0qKzhMLrYODzNUptUBCsMD1LgaD3QB
        ATZxz30xEE0swodDUS5w8QfMXQ==
X-Google-Smtp-Source: AMrXdXsbed8972ttl4tuW+r6II/l4+IDIN3XfWFXtwKU+S+h7RqPDrhNKmmYR0qUvjU6oenThQCNSA==
X-Received: by 2002:a2e:88c2:0:b0:27f:d050:d95c with SMTP id a2-20020a2e88c2000000b0027fd050d95cmr4172562ljk.10.1672591703879;
        Sun, 01 Jan 2023 08:48:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e26-20020a05651c039a00b0027e4da2d952sm3014101ljp.68.2023.01.01.08.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 08:48:23 -0800 (PST)
Message-ID: <9d77ed88-a6b7-74f0-4f0e-f67b3ab15982@linaro.org>
Date:   Sun, 1 Jan 2023 18:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
Content-Language: en-GB
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/01/2023 18:38, Fabio Estevam wrote:
> Hi Dmitry,
> 
> On Sun, Jan 1, 2023 at 12:58 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Support loading A200 firmware generated from the iMX firmware header
>> files. The firmware lacks protection support, however it allows GPU to
>> function properly while using the firmware files with clear license
>> which allows redistribution.
> 
> Could you please share more details as to what firmware you are using
> with the i.MX53?

I have been testing i.MX53 with the firmware generated from EfikaMX 
generated files 
(https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu).

> Is it available on the linux-firmare repository?

Not yet. As the firmware have clear attribution and clear licence 
(BSD-3) which allows redistribution, I'm going to send pull request to 
linux-firmware as soon as the approach, presented in this patch, is 
accepted by Rob.

-- 
With best wishes
Dmitry

