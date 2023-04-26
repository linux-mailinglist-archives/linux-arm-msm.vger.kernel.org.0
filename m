Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3921D6EEB2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 02:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbjDZABl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 20:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237905AbjDZABk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 20:01:40 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD6B146F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:01:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f725so9426888a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 17:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682467297; x=1685059297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTdc9DJ14HbNnnfxarhYVsLnqLsfg9vMdDLB5FChyxE=;
        b=T2u6R7p0/3Naz9CpQHHIiQlXKSa/8shAFvj+JmuSUz71hjyl/B7wfyjWpKY2MSwt9X
         kxiSDY2DP8qtEX0Yr4FIsYI2hg7SSG7pTRcabKuDw80MFxmROsrTI++g1HtIGdhFzmID
         vV+CyugLT6r83uuMVEXW1xXRZqH+T9Wkm1WSrxGD5YEIhPe0nETPbDe1fy8Kt83zxaa+
         q/vJVVVrSwfux57up5piUclqlR84rIcI5jwSpigbe5uK1sYaZLNbRQ3UUxoJP4iZUv1H
         ICuzx0Fk90LCu7cjfqcqSSJXvCxy7j3Fzn070mx6aJRI4ndd8TQO64D0zX7Gui2YHRlf
         s23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682467297; x=1685059297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTdc9DJ14HbNnnfxarhYVsLnqLsfg9vMdDLB5FChyxE=;
        b=LqFp1vK7EJhTQ+af3TJt4jegsIqIjxbUIsUjFCiFayMsgKUJ1DxRFPIvv1WsWVY9+h
         6+uYxDWQlD1illIDFMd0EecPtDcJqjNVlSnKgu0d3ErOGCDjAgaeF0QdpwTgjBxpzcED
         3nuiapyQMRfNc0AX1x6ocKEvuxheCcXBN1G+5+KHFYupIRvOa52GfSvy2r2lyuTVBi7D
         mX3cS+964LcXuzmQ/0NPYybeUyrTPU3ESddxpHEDkGuLhgQjbjtvBDm10ehG33xLpbwq
         Nfq/k8jcy0bMcquOBm73VgBZehhoPd7H7VQcIwZSwszicn10dnkpnhhUf+UIUK1Cr0F9
         UB5Q==
X-Gm-Message-State: AAQBX9eubvt8Lk/mxYHmN54/3X07cUzyObwi1N8V9j2vcglJSLTosgTS
        X861j95dlKA1C2fEb5rv6VAb5A==
X-Google-Smtp-Source: AKy350Yi+SP1ungFzVgkmrReJnEHkZSbkfMXXsoAkLVpKsdFjozoiLrSA2Mv5lSGeMBCu/kUCxwNeQ==
X-Received: by 2002:a17:907:8b87:b0:94f:21f3:b5f8 with SMTP id tb7-20020a1709078b8700b0094f21f3b5f8mr14879847ejc.21.1682467296852;
        Tue, 25 Apr 2023 17:01:36 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id op4-20020a170906bce400b0094f39379230sm7381550ejb.163.2023.04.25.17.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 17:01:36 -0700 (PDT)
Message-ID: <41d74c67-3d66-a363-f888-ee7763c76495@linaro.org>
Date:   Wed, 26 Apr 2023 03:01:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 04/21] drm/msm/dpu: Reindent REV_7xxx interrupt masks
 with tabs
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Adam Skladowski <a39.skl@gmail.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-4-693b17fe6500@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v3-4-693b17fe6500@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2023 02:05, Marijn Suijten wrote:
> Use tabs for consistency with the other interrupt register definitions,
> rather than spaces.
> 
> Fixes: ed6154a136e4 ("drm/msm/disp/dpu1: add intf offsets for SC7280 target")
> Fixes: 89688e2119b2 ("drm/msm/dpu: Add more of the INTF interrupt regions")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

