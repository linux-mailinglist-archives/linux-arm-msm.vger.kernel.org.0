Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC576D0B5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 18:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjC3Qde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 12:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbjC3Qdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 12:33:31 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664D9C16D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 09:33:29 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h17so19695832wrt.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTAy36BLiNsY+GkgrBrUwBdOqLgTRdyYQkO3DlArkGg=;
        b=ykj9ItrhNGUbv3CLkEnrHIDWenINsrAnNwTGgbRlrB7UtpwbpGwUJG3pPRS0Q3Gjsq
         C0za0JX1ykye5t24XjVKO+IxqsIgdWPisYLm0N3ihpp4+IEzA49R7J/xoRALzmX1oQG7
         LKKTPxPyFWJUnxsDF1aGcfKxEwiWlHRNle9zG2xIXb4VumSEuG00LzhyJaeDmmu1APrA
         l4h0dSuOwE+DjnK7DNPSX+x+cW0zXAkxsJZ5PMym8eb7s5rnF6mRNzFCCQoii+JKEjTI
         qpPNAm4oGkElOk/1g1b+gSN4eocx1J8w1cc9cds4XalHSK0cxhMyMLq9XdwuIKHE4Lj1
         J5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTAy36BLiNsY+GkgrBrUwBdOqLgTRdyYQkO3DlArkGg=;
        b=022dBWI3Mp+jto8lTdVTpc2RqiScaSyZ8M+4QLbdsx5wGMKCHM7bo7Bycf3fV/NpEW
         tJUfKV3KTSYsPrW2b5lGFJs1B0LI1QZ8OW1B9Db5HPpjLypkLpzes5wLqFT/0G6sZk4f
         SJRBICvR76vlqY3F8O64MdZJZYTwbTXvLWe1esfM0++Omv/JazI72ARUrUf7/Rw/BGMM
         MH/UdXQhDybbq0JcPSyGNkn0nfx5e1RIo7/7oQ6R8Q12bdoNDRlnpa/ogXfR2PjW6i1p
         2aJlBofsEBb/Yt+aGjlARVhHD3MvxUC305VCn4B2Hr9Bh+KuDYFmX28zZFqBnkOrNOOD
         6GPA==
X-Gm-Message-State: AAQBX9dRO5Smen7j6/mdFvGcVDla146Kdx188FSwmuqYbuK8a48P413v
        qiPy/YCqgKM54R7S5VaksJQwEw==
X-Google-Smtp-Source: AKy350bcRapicwm5w7+VNlWB7IP7tnaAHFf7ULeuGrQbhL5+YP/wpni6b+q+nRFmJNuZzpji+lzLxQ==
X-Received: by 2002:adf:e4cb:0:b0:2ce:bd2e:1fea with SMTP id v11-20020adfe4cb000000b002cebd2e1feamr19906723wrm.26.1680194007864;
        Thu, 30 Mar 2023 09:33:27 -0700 (PDT)
Received: from [172.20.10.2] ([37.166.66.243])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm33209463wrr.88.2023.03.30.09.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 09:33:27 -0700 (PDT)
Message-ID: <d099f038-7c73-9765-fa4e-c245bf8d0951@linaro.org>
Date:   Thu, 30 Mar 2023 18:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8350-sagami: Add PMIC GLINK
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230321-topic-sagami_dp-v1-0-340c8bce4276@linaro.org>
 <20230321-topic-sagami_dp-v1-2-340c8bce4276@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230321-topic-sagami_dp-v1-2-340c8bce4276@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le 21/03/2023 à 23:12, Konrad Dybcio a écrit :
> Sagami devices, like other 8350s, uses PMIC GLINK for various
> functionality around battery, charging, TCPM etc. Enable it.
> 
> Worth noting:
> My USB mouse is unimpressed when connected to the device via a
> non-powered USB-C dock. Microsoft HD-500 dock refuses to estalish a
> PD handshake.

That's interesting... perhaps UCSI is required here ?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 60 +++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 1 deletion(-)
> 

<snip>
Anyway:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
