Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE57559C4D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 19:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236818AbiHVRPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 13:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbiHVRPB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 13:15:01 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824C72018E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:15:00 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u24so5667329lji.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=HmHJ7gWp7BcjLsSi8xEcBSYmwusbbPRlOVnswlXqR1k=;
        b=dJEvqYTyJl/xn/Peu0pFOu8cZDjSK4xFCOlOQoiNkojf2DkVuDQ1U9riuuj2M4RHCL
         X33SRW81AGp5A0CRW+kF7qE+qoTMDEn1fnnfcYnGl0jEh6t0dfubjrAAnwZCxncFUS1E
         1zDXGXOZSUt8LYF37ZcEkWhkKfS90u4/LvSUUVU8jxdK4JhGwsw9LVRED2es7b0WYfG5
         TRqGSvAWerpZZGf8Jjg8rpmq0QyGk7kmHb8Y5HbpkB9S7rCQsXvZE0DJTCQjB0Esv4Lv
         bumV6AJI7sJE91RGZc7ke5milB+ovDohahBWeJoox2hL4ezVje45qcHqoq62FAUd2dSc
         +vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=HmHJ7gWp7BcjLsSi8xEcBSYmwusbbPRlOVnswlXqR1k=;
        b=AxkxcJNCkWYoQal8bHZ9Qo9vovKkjV2gKjyWdwtDZZLiR2OSivgsrQjakz8/zjqsdq
         TmHOV30GCEOUJUhGf5LzRNlmLS3NO31MgIH8MnvG+Lm/lDnEwl4sofJjkB02Az7ba9Et
         uDPLbfOhVdn+pJEmA87YXqbejv5QW2+/eHZfRPWqjyeuArt5Rp4bcsW20i3ogxvPDw6/
         ihOQmpG57GcJkDQar94yw8j0DEDj+DeDCRCacJcc7rl+Sh0Ter6JpLT5X3eyflzR10TQ
         z9HoG3vO7m1hqbLzRdMuv1BtrmxUClZHE5DvIP0MnQiyhBcbbwLnCK7VceiH0wQcymb7
         ZjWw==
X-Gm-Message-State: ACgBeo3/Z/nk3YE+oeglB4aTCA0UMWNYcRq8w07gnxZ52Y/S2LpaGPOy
        5vjYglqwXYpNJ6nePQSH6Vr0WQ==
X-Google-Smtp-Source: AA6agR58v6ldgC0ZLyOtTHI0ZuRbH59+jLuimO/JwRR1MpmFwzDJ54ATiXx5WOlvwYQsTXqdo+c7GQ==
X-Received: by 2002:a2e:9d02:0:b0:25d:d6b9:b753 with SMTP id t2-20020a2e9d02000000b0025dd6b9b753mr5728079lji.344.1661188497895;
        Mon, 22 Aug 2022 10:14:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e3204000000b0025e15fe421bsm1910334ljy.17.2022.08.22.10.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:14:57 -0700 (PDT)
Message-ID: <c4f5290d-8151-ab90-05d9-bce321719d4c@linaro.org>
Date:   Mon, 22 Aug 2022 20:14:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-GB
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
> 
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
> 
>   drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

