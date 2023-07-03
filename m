Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B69745B35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 13:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjGCLfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 07:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGCLfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 07:35:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2733E3
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 04:35:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so6929889e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384149; x=1690976149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR6gW6QqPVhQF4uZh4Ai5jdCPhHvwhrUtKxoyIWDUPQ=;
        b=rHY1DLerRbOhYNNVRe96k8xQpd4pnTJaDLPbKTZXdOKpBuUPCnHMaTGSNfp2vFtENE
         H5Lb2yeylWzK0tBrDgScWRb4bfh2lrfSYdatkGYmNxYtSsnF6rXebe7ABGUwJosyx964
         lMS7tRPEH7717OamE00LZeeg8xWiSRKjbV4+VzAuAB+5DR+muIWcWAiGuMbO5z/DTrPk
         Ptems8E/nkk7JuCSlvfKZoNrqWg5+5Xvq9+79/gLlP+yqFbti5P5G6A0u9UYt0ts2zs/
         dFh/XafzcXrtXkDSKDBR3XZ/sgpHcnP1sAGpkOUifYfvR/qm48wgZFV4ez05mZxTG4Rh
         x9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384149; x=1690976149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fR6gW6QqPVhQF4uZh4Ai5jdCPhHvwhrUtKxoyIWDUPQ=;
        b=JFUqPYcw4ykX4ExQatmRhGVCn2JmszmAYDIDoIkIZz2WtFEQ/z7X9uJJPyEM52jmdL
         DM0EGZY8f4+359fuOnENv0TQCCXTK73oEfd0p2PEJ0ILDlZM5jcczpd8so1lRXgIzz5S
         0L/TWv8MBuyLFoxQNoSSnFFVRqXZG5DMZ3vcVXtzgw8lmjgFvLcNRxf6mVHSnOMoiFPR
         tlfwAWT65dxwZwrkaD21tIxjPOPUyYAQuluHX1irYgL0xfLo3TD0NPbtrtfCBNwspDho
         1OmIYwESuZ1uDPPKonKl5z1gMSa8Jz+ON5247FhuKubzolOIVgILJqtDSzWQ7FqelpaT
         +/BQ==
X-Gm-Message-State: ABy/qLY9KUzFEiAzoUH7o7R1EVcVEpG4D5ruFp4wcPdirfsRuTsEPAX0
        dij8mDrOzYMKxICOPOm7y9akXA==
X-Google-Smtp-Source: APBJJlFYyFRmaxnd3ulQxmEgzLYB26UKCRVr7Zjj1tFIlXUhU4KJAPhpjOqh5tgH/FdV8SX0qj+xSQ==
X-Received: by 2002:a05:6512:308a:b0:4fb:89bb:bcc4 with SMTP id z10-20020a056512308a00b004fb89bbbcc4mr7744687lfd.51.1688384149094;
        Mon, 03 Jul 2023 04:35:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id q28-20020ac246fc000000b004fb96436ac7sm2623973lfo.250.2023.07.03.04.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:35:48 -0700 (PDT)
Message-ID: <43f16d47-3318-7a9f-ac87-8e595435b6c3@linaro.org>
Date:   Mon, 3 Jul 2023 13:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 08/15] drm/msm/hdmi: move the alt_iface clock to the
 hpd list
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
 <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 13:42, Dmitry Baryshkov wrote:
> According to the vendor kernel [1] , the alt_iface clock should be
> enabled together with the rest of HPD clocks, to make HPD to work
> properly.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 3132105a2a43..0fc3df43aa70 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
>  };
>  
>  static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> -static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
> -static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
> -static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
> +static const char *pwr_clk_names_8x74[] = {"extp"};
> +static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
> +static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
>  
>  static const struct hdmi_platform_config hdmi_tx_8974_config = {
>  		HDMI_CFG(pwr_reg, 8x74),
