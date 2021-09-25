Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED67418436
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 21:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhIYTmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 15:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhIYTmH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 15:42:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED5DC061570
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:40:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y28so55632993lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sWSvtUFJ4a8AS1B3tMl62oa03aiDhehlFo83G3mToQQ=;
        b=sGPZNgqVkCb/9ROB7ezaGhWPtdDtQQqFobbQBHAFiFrAENZLjOJQPMJcjzmqeegHQ7
         nBHKx7MC/TA7Iu8+u4jd5BgtMU3RskVKm0aYx4PXVbRMGvbVrnpcowtcIlZxkagvfFKm
         8szm8hg01rp11VE4vvOcvP4aAyhdnRkkqSk9rKgxqDK17idCzM8tt1dgvt1VHx5aS4cN
         oxcu87EQI2auXRPpolwNTUauO+29WQI0q6U4cTyA5+BQdfplRDKeubW5tV7aX23eQIdC
         ASxaZM/WD7xbEkqtGl6O7v8Y+Uw+p2vVI5hWhvv13N+SNPGp9ELZxOEsrISThPw2rhYu
         ifvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sWSvtUFJ4a8AS1B3tMl62oa03aiDhehlFo83G3mToQQ=;
        b=SdeA7DHUq+dz3j4k1C7LmYYfn6jlOqVj6brvaXvq+xkEPiMPlrXyKXKPmLu7cpJStT
         fjjm+XR1U9YboLXaVuBHMehDKGcOmS5ciTP701dsOVDDj0wrGzVvIJDlyZRzG3Zifwix
         pSGSI9W7IR1qIEZKvvPiSRIaXJVTIdKguxYrOTzSstTsBqBP9wiHkDTfEOL+7nY9UY/L
         Kqd1Hg9xNJd8XatbuLzXXMBFIBHWOkUsEBoP4B3gBWA5V2iCU5rTQnYYEzrzOBa6h8U8
         2cQ2rH1fBFTdUROSnnH81X46NyEig3A/3yaYD9mvDs6W9eOTVYMbPYmkb96t2pVZ6b6s
         XAcg==
X-Gm-Message-State: AOAM532mdakmVDlE2OokbfZzLld2C8bcg36URbjLY7qqW4E52cfe4sEh
        UihFTfT0mnTKn6tN6D5VjvJT0A==
X-Google-Smtp-Source: ABdhPJzHaIiGgkM7qQL6z25JtlJ/hdztEHcqT8jyfG9zIBakiz9TeibxlmJ5FlcZ43ieyNIvmw7OCw==
X-Received: by 2002:ac2:4ecf:: with SMTP id p15mr15477143lfr.2.1632598829579;
        Sat, 25 Sep 2021 12:40:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm1393459ljg.92.2021.09.25.12.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 12:40:29 -0700 (PDT)
Subject: Re: [PATCH v2 0/11] interconnect: merge AP-owned support into icc-rpm
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
Message-ID: <36128ee3-0dad-dbdb-ca66-0d0e45aa0b9d@linaro.org>
Date:   Sat, 25 Sep 2021 22:40:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2021 02:24, Dmitry Baryshkov wrote:
> This patch series merges support for AP-owned and bus QoS from SDM660
> into common code (icc-rpm.c). MSM8916 and MSM8939 support code is
> extended to support these features. As I was touching these drivers, per
> Bjorn's suggestion expand DEFINE_QNODE macros (which makes adding
> QoS support much easier to review).
> 
> Dependencies:
>   - https://lore.kernel.org/linux-arm-msm/20210902054915.28689-1-shawn.guo@linaro.org/
>   - https://lore.kernel.org/linux-arm-msm/20210823014003.31391-1-shawn.guo@linaro.org/
>   - https://lore.kernel.org/linux-arm-msm/20210824043435.23190-1-shawn.guo@linaro.org/
> 
> Changes since v1:
>   - Rebase on top a2noc clocks support patch.
>   - Expand DEFINE_QNODE
>   - Simplify struct qcom_icc_node by moving links to separate array

Georgi, since all dependencies were pulled in by you, I wanted to 
remind/ask: do you intend to pull this patchset for 5.16?

> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (11):
>        interconnect: icc-rpm: move bus clocks handling into qnoc_probe
>        interconnect: sdm660: expand DEFINE_QNODE macros
>        interconnect: sdm660: drop default/unused values
>        interconnect: sdm660: merge common code into icc-rpm
>        interconnect: icc-rpm: add support for QoS reg offset
>        interconnect: msm8916: expand DEFINE_QNODE macros
>        interconnect: msm8916: add support for AP-owned nodes
>        interconnect: msm8939: expand DEFINE_QNODE macros
>        interconnect: msm8939: add support for AP-owned nodes
>        interconnect: qcs404: expand DEFINE_QNODE macros
>        interconnect: qcom: drop DEFINE_QNODE macro
> 
>   drivers/interconnect/qcom/icc-rpm.c |  263 ++++-
>   drivers/interconnect/qcom/icc-rpm.h |   56 +-
>   drivers/interconnect/qcom/msm8916.c | 1214 ++++++++++++++++++++--
>   drivers/interconnect/qcom/msm8939.c | 1283 +++++++++++++++++++++--
>   drivers/interconnect/qcom/qcs404.c  |  967 +++++++++++++++--
>   drivers/interconnect/qcom/sdm660.c  | 1940 ++++++++++++++++++++++++-----------
>   6 files changed, 4815 insertions(+), 908 deletions(-)
> 
> 


-- 
With best wishes
Dmitry
