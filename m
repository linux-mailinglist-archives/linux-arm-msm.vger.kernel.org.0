Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7978370BEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 14:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbjEVMsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 08:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbjEVMsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 08:48:00 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0D618B
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 05:47:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f608074b50so3877805e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 05:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684759675; x=1687351675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=reNNC9pZnQSArntILOyRROkJnhY/TRZnM9slSrFPRiU=;
        b=aiwrpfY1GGtFZQOWe2Rrc3JApCBthpXYPB4Nyhtju0NHhHyklsoBY0wnK3ckCIC/fU
         zC9QyVjmPAv9tDyZTxOVWO/CEy9NqliYc9IoYgOEUrITkBSAnW+efyExLBf+kEgD1iNj
         /ZZ1829z+73R1ZjybQEub1MkvpQPlCsw/yt2TNJNuttdoBpBxsd7gri9lKISXr/U3iBK
         Rby5mAbPtFrLtOM6RJtrf9KQ9zzxyGDUZF4mKvMBFSeuR1l0OwuPdet4lnilWVxWmmPR
         UhpCAOMhxO4t5v8XOwELfKzmHeYzT4o9kmNSq5IGoilnh/CwmM15e+IptSSZeD03zfgx
         T9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759675; x=1687351675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reNNC9pZnQSArntILOyRROkJnhY/TRZnM9slSrFPRiU=;
        b=lIdT7VmEw2RktvPNKKhaX7hb68BZctbhlWGMnk7X6Lnv9CU7nW7f4jcz/wyp5kpYjl
         DE0yhnLX2spEoT1/uT8dve7cwpI/2CpwMqlyMDStQ4Sa3as16PSd7O4Zadj23S3nUxb7
         s96ic5AWw1AtQCIJyPSDtAMyS+flf6mhXUIXuj+eQZUD1vQAFghYD38jkPmvrcFCULAq
         wjsqLWk/oQWTra3aurKxId7WLy45Vo3qzq0v9EiOQSLVXR+fIlUb2Sux4V3sMFExjMqm
         jRZtg5wb7EPyTlOoZ3OVoVnGkriKf9aWjr5znsXTUv28Izk8yaNonXfbf4tNzCxS+zJo
         c6pA==
X-Gm-Message-State: AC+VfDx4xxb039FgfLO4KO1NVDsrjMw/XsU6cu37ycl0GtdVFAouOAmd
        AWh2+ERxR5JMk5EHcgUQ0Ret9Q==
X-Google-Smtp-Source: ACHHUZ4BnQvsY6CJ2EAvos+sjvHvlSttd2/6DifgVMYML9MuWOItyxpPS1WeqfCLUtpfnl1X4x6YJw==
X-Received: by 2002:a05:600c:2057:b0:3f4:27ff:7d52 with SMTP id p23-20020a05600c205700b003f427ff7d52mr7943537wmg.2.1684759675557;
        Mon, 22 May 2023 05:47:55 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003f42d8dd7d1sm11646398wmf.7.2023.05.22.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 05:47:55 -0700 (PDT)
Message-ID: <3bc15d87-62ff-8b99-06bd-7de405e6f386@linaro.org>
Date:   Mon, 22 May 2023 13:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/1] media: camss: fix VFE bpl_alignment for sdm845 and
 sm8250
Content-Language: en-US
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230518215235.1668871-1-andrey.konovalov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230518215235.1668871-1-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 22:52, Andrey Konovalov wrote:
> I tried to capture an image from SGRBG10_1X10/3280x2464 camera sensor on db845c
> board (sdm845), and from SRGGB10_1X10/3280x2464 camera sensor on RB5 (qrb5165 /
> sm8250). The captured frames contained incorrect image.

I hadn't booted on an RB3 for ~3 months. I've confirmed this fix on rb3 
and on rb5.

Nice, work !

@Hans, @Laurent, @Michael any chance you could pull in these two commits?

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-qcom-camss

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/c694ba97bccfc3e0c32504c1a71df3e8c04cfdeb

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/54140e166c2ad5e2a21949f78e16d0c2093bd55d

---
bod
