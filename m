Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EFB5F3362
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiJCQWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJCQWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:22:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4F61E3F3
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:22:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u10so17393381wrq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=D5pXQsMMi7moC3mXvNU29sA3D/rodNgy/MSdInrFFLM=;
        b=Z2TY18qYuQhda2jTGLjJWoxYyFIyR1INnP2UHyNlnyVgjHWlR+znbw93Y6aga3gKQH
         ETy9H/e9kylF285cJTGDTpoHUncFZ5O/c4xoDWQ+8QmZSBO0HuONcl+Z71vkRMkT+yuv
         2h7CPvJVMiv2NAkQ3hWo3hs3XTREKfln9Fv9C9roX7yL0sMbuLpH5TF9kcHgrWTJhNz0
         FQU4N/VDqs1cCrr0q/sO1XzSFLGzDhGoJVTzhuQJHD2Vv+byCuADonVomuDQy9l+VcbQ
         wa4EMvmHMblMErVwyJDFVU6+URHBgG9NYWazUvIa6gyPcVMCorOGr5L99Qu+07JfI9av
         qUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=D5pXQsMMi7moC3mXvNU29sA3D/rodNgy/MSdInrFFLM=;
        b=WX//375MtEipRoc/0DF1wXp2d1PQYjDnh3jkx0eZxIywByujV2xEg27AYX1du6wfRg
         eB5utLxzQweSbcJKFHihVnglwukcqxnBSY6yqsV1NElXfU0tkvELQrSuyIX5XdhOX2qC
         wkrpruYC87Wsyypft9YiJuWp6VnZBdEWuTNEFg+z6JzhnJRG7wAyFmjpL6nl8gRq7/xf
         Go7NsResl0I05YTA5G6kkAxC9rKK1AQ/2C+rv8n1vaRXlZrjGvxu1VtVjeVTL3oCRUW4
         Yn2LAvCYLu45Ulby7+W6e653JfKl65Lrh0AReIQbAGIxSn0jiri/mqf43d9Nko8ivb9f
         NJDQ==
X-Gm-Message-State: ACrzQf3VWBycs5uUY5Ox7cHJvX811ez39oRkUR+FbPs7OL/+g5S1/Xnd
        A1i85cA/aX4iS8UgRNUPv4dlQQ==
X-Google-Smtp-Source: AMsMyM690xN/kwBSq+gs9AOSZvBkI47hHVXhOQtXJOowPtH3oWUYJrLTaoHGN5PCMkMFkkZt2/PHBA==
X-Received: by 2002:adf:ee8b:0:b0:22d:e736:c2f1 with SMTP id b11-20020adfee8b000000b0022de736c2f1mr9232228wro.89.1664814158811;
        Mon, 03 Oct 2022 09:22:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id x24-20020a05600c189800b003b4727d199asm11350321wmp.15.2022.10.03.09.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:22:38 -0700 (PDT)
Message-ID: <5c8af71a-6e03-0849-2a97-75ec673879d4@linaro.org>
Date:   Mon, 3 Oct 2022 18:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/23] ARM: dts: qcom: apq8064: drop amba device node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-13-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> The separate amba device node doesn't add anything significant to the
> DT. The OF parsing code already creates ambda_device or platform_device
------------------------------------------/\ s/ambda/amba/

> depending on the compatibility lists. Drop the amba node and reorder
> sdcc and sdcc bam nodes according to node addresses.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 131 +++++++++++++---------------
>   1 file changed, 62 insertions(+), 69 deletions(-)
> 

<snip>

With typo fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
