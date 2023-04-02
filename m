Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4616D3768
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjDBKtq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjDBKtp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:49:45 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA5D1207D
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:49:43 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id ek18so106603278edb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680432582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjR00TgAnnMwLDCvz0xT0MzHATrmHlJrCAFtw5aFKdk=;
        b=pkSrbHT2FYuk1Z6tCCsWbzsSFqJrBPI6wjADRsIIxnUglOL3L9Qu6voguaiIUrnnU2
         JPjcWYsxgRQbir6z1Wx/eDztWZiSw5OBWG4HtkXAkEsR3exMnhz0XP47cDxIk6Dl7vDa
         f3vCSRhXip5T1S8AQVDzFKP6Cd31AO9Ihs6Sy4B1AeWwcE0FX2PpeYJxULMlok4JVIPp
         ydNNsv8E8ral5yWhU2/zxN5VSC6lRhnlGefjW3J8G1lAF3F1c4YYF0/9Xlyl0isNvVjf
         m8ucRuuoWEMiGSBM5/+sHQuME5Lqt7GIZKs0VmolQsb3CzO+35GIp315QJlpRNegKbnL
         Lzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680432582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjR00TgAnnMwLDCvz0xT0MzHATrmHlJrCAFtw5aFKdk=;
        b=wWH2LgDgboz94vy+L7r/Mt3XaMEBWs7RmSPpzmkoLGMOjn2eLw2EkkRUUrxbOtYMRj
         SnIGsGcLKtZujzBGfDckqg4+StcBhCFVlWK+e60AyQv8Xp6AEMeZLVeyq0cCl1igED8B
         yLLB9hHMTjPJ9hBTj32K2iGltXwKUhMRQeNxkri/lNLwC+xvo6YH8Pz4P+YTWSqyBveq
         5BLfBl+ljjE+vW4pHkPcYGNOiBlixV06QjwrUBlVLnyHpB1NH/AlKoDEwqRmRYmA0mFo
         0UKEEXAkW1Fe63NYM7AqaCX6MVyk9A1KrFu70edaTip9GaLzNSXs+cXKTiT/M7MXlGjX
         6FOQ==
X-Gm-Message-State: AAQBX9dh0nXQywp/0zIuIRTb6PL2Y4hv42E5lM6AzS/3ju4YQHHXGnfw
        NWnQtggF/MtDwsYfg1TZltTQ6g==
X-Google-Smtp-Source: AKy350bwisRgcgGnMtchBJUcbuj4Pcg+osZs9dbE8qToLV5KDtYpFRlg5/KXsZxdQi+Q/OWZDnLNPA==
X-Received: by 2002:a17:907:a42a:b0:947:d757:d822 with SMTP id sg42-20020a170907a42a00b00947d757d822mr6531312ejc.68.1680432582447;
        Sun, 02 Apr 2023 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id ee55-20020a056402293700b004aef147add6sm3082265edb.47.2023.04.02.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:49:42 -0700 (PDT)
Message-ID: <a13ae120-b50c-b5ef-a686-bc811e6b9d37@linaro.org>
Date:   Sun, 2 Apr 2023 12:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next v3 04/12] dt-bindings: net: qcom,ethqos: Add
 Qualcomm sc8280xp compatibles
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-5-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331214549.756660-5-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 23:45, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

