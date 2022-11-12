Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF076267AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234533AbiKLHdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbiKLHdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:33:45 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E86A12ABA
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:33:44 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s24so6828853ljs.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcHiUI9DGERAno0rUlyB48/qOHRTatayzGuU/OKYXhQ=;
        b=Pkn45t8/abunZrzIujANrGcPg1WRPhrPt0gULUKesLGYhpCLV+q+oJcIbbobDmS0M/
         m63GzfYoLg/SQi2PNYyYONMQXtaiADTf7wuJRSIJwvuGnzXHeQTV1gn1JLsyCzM6t83H
         x1gOfaIMrrazgCRQgwPzloWArLao7gh2CqvnkD78MvSQN3Aht3ck8DoymWaq7+435F3m
         bMXzDGaguJKIPoYyim2lIC/Zx8HUHDJWHroZhHi9C6R9nnapSUsm+WGY0duMbahu5KGB
         hcpVATmoBH0zElnOMdXq21rUib99dIPfIuYkcBUSmWsDdgbnOD+p69uOkmEvxfYF5ChL
         M+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcHiUI9DGERAno0rUlyB48/qOHRTatayzGuU/OKYXhQ=;
        b=nCIFFp584hRMAjw+0Sdb05BBFmdyW0+OatlMOOs8hQM7BxXMGnCAkp8veiJSFnaKSU
         LoIgsLKKDrmWsDh8n7tVizCrmMxawPC6U5q3m+VyfDR8mDIta0ArEy5C48epQo3xR3TS
         1dfEmxF6s2/YEgVVLVpDEB/sFZGasblqhrMk6o66JtC8gdTWa6NH2i1gtaqajE6w1Yxh
         VIYBLwaWCIIPj09ot3l1SfbNjWmIB1+uTNh8VuDrPMUoTU+yAo6eqduEmnt0m2Q3nvRO
         CPEQ4qqQrQKJVmAZLItpjSdDMR1/2x/7hhu3em2b8LXkjiyqbNfN/dWbo2j+S+3V3fDy
         LwWg==
X-Gm-Message-State: ANoB5plHG+Hy8AnSLRqA0BM9ZXZB5O3Uey5Fd235phjGmfPt7TlzcDD/
        zl3gJuvQyO6uYUYhxBNr5GF2Jw==
X-Google-Smtp-Source: AA0mqf7IYmIualQg3UXqEPIXTCGeFZKjAX/hHgShiK8f7MOBFqehwnnxzDVWFY0zfn47rDrvQkKnxA==
X-Received: by 2002:a2e:869a:0:b0:277:f46:617b with SMTP id l26-20020a2e869a000000b002770f46617bmr1514630lji.221.1668238422461;
        Fri, 11 Nov 2022 23:33:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t21-20020a2e8e75000000b0027711dbd000sm761494ljk.69.2022.11.11.23.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:33:41 -0800 (PST)
Message-ID: <c77b34aa-e45f-f6c0-86e3-66d92079461c@linaro.org>
Date:   Sat, 12 Nov 2022 10:33:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 11/22] phy: qcom-qmp-combo: clean up serdes initialisation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-12-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-12-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Clean up serdes initialisation somewhat by making the current helper a
> dedicated helper for the DP part of the PHY.
> 
> Note that no error is currently returned for non-supported link rates.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++++++++++------------
>   1 file changed, 24 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

