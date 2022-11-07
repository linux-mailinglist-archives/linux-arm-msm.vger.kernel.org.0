Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C261FD29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 19:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbiKGSRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 13:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiKGSQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 13:16:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0FE26AE9
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 10:15:36 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id b2so32392873eja.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7pmt2HngsIty5fjoD5/n01C+C3m5PcZ1nRjgP9AEiKY=;
        b=H6Pt1iEIO9Je8Lj5yki7ij1JghQLmX72gIhqHI+1jUaHVV13J3SINQWIVw3YubeLVp
         C+nZadw2za/hQ+csoF5oGR5WOqHGIUMFOx+YyEPuKWNjq0C9+DVkJEnyOUGereMCx0nO
         F/S8mlzyMxtnsWh3TP8OuxFgLAOtKuNRf5lHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pmt2HngsIty5fjoD5/n01C+C3m5PcZ1nRjgP9AEiKY=;
        b=OTEdVYzkH1Sql8dNLjlntJLIxlGQaNqxnPu0LmCQpbPbsE+CxJwShyVcNLJPLVlZpl
         zQnBSj11SgQcw4qy7nZLMIpLRzv1xxNoSAX6zwsrZMCu5KpIg97oUa3xrrrYgIFLbm+1
         eIMA1ZV2Tn/pYRoEMerp49Dkh4lzw0+9pKPO00qim+tjBgM1IIcDtX97sZCtSxsyjEMF
         O+XzE3pfVGmSf3plZnzuUoVt7cRd5Dr7PZiW+lujmpJLlYt4+GfcwD02cpdCQNlhcVSv
         P7l0ANGem3F1WjlpoLSykfkE3hCqgM7XGxXJB6FQvO8KMgv7E087nXG6xgIgvOY0SvKw
         yU9A==
X-Gm-Message-State: ACrzQf0O+UOsRngesJkKXQnsgUFmT1vxKDovUWLB3h5ajMLWL7vzSo2Y
        xUdH+IcHX6pNDxoywq6Dq/NBb8H13afej1hn
X-Google-Smtp-Source: AMsMyM6QdQAVzdywQOvt9Mlw0RtFgB2X4gDl8L2sxoYqO+pKLvorwXNX0bkSqIJdR2xZlqPOa8UuTg==
X-Received: by 2002:a17:907:1dd7:b0:7ae:41e1:cdfb with SMTP id og23-20020a1709071dd700b007ae41e1cdfbmr14690266ejc.58.1667844934605;
        Mon, 07 Nov 2022 10:15:34 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id o11-20020aa7c50b000000b00463b9d47e1fsm4531923edq.71.2022.11.07.10.15.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:15:33 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id v7so7416840wmn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 10:15:33 -0800 (PST)
X-Received: by 2002:a05:600c:4486:b0:3cf:6e1d:f4a5 with SMTP id
 e6-20020a05600c448600b003cf6e1df4a5mr31342979wmo.85.1667844932555; Mon, 07
 Nov 2022 10:15:32 -0800 (PST)
MIME-Version: 1.0
References: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221107173954.v11.4.I9718ac3622fa550e432209ae5c95c87b873a0f87@changeid>
In-Reply-To: <20221107173954.v11.4.I9718ac3622fa550e432209ae5c95c87b873a0f87@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 10:15:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uc78wH9A1bev4L=-kje00RNu-AQu87zLK6Sx4AdxDe8A@mail.gmail.com>
Message-ID: <CAD=FV=Uc78wH9A1bev4L=-kje00RNu-AQu87zLK6Sx4AdxDe8A@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] arm64: dts: qcom: sc7280: add sc7280-herobrine-audio-rt5682-3mic3.dtsi
 for evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 7, 2022 at 1:45 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> +&lpass_va_macro {
> +       vdd-micb-supply = <&pp1800_l2c>;
> +       pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>, <&lpass_dmic23_clk>,
> +                       <&lpass_dmic23_data>;
> +
> +       status = "okay";
> +};
> +
> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> +
> +&lpass_dmic01_clk {
> +       drive-strength = <8>;
> +       bias-disable;
> +};
> +
> +&lpass_dmic01_clk_sleep {
> +       drive-strength = <2>;
> +};

All of these "sleep" pinctrl states don't actually do anything useful
because (currently) nobody refers to them. Off-list I've asked
Srinivasa (now CCed here) to address this and I think it's fine for
you to have them here for now and then we can use or remove them all
at once.

In any case, this patch looks good to me now, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
