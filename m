Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47385712768
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 15:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243652AbjEZNW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 09:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjEZNW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 09:22:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F5312F
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 06:22:25 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30aa76048fbso459232f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685107344; x=1687699344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRSS0thFL99+lzuHoifF3dKBkoe4uJEbtzhdpwYILHY=;
        b=VLUzFDnR6LmAKvVf/iHRwZPTSEkBdMW0byWyjFHRJjs/Uoucfx0YumoQ3szeRNCTL3
         9siep6Ca8Gu8v4TjCTadRwLlCfAaNHLyqn2mltKzfTKAKu4kUuZ+0cfD89seK0LMXm4P
         yzFHSTWlraCWICfPz071XFS46lz3LkqXHYH2U26T8g3wRuQEkUlmvqkMAAk4rGilsVuW
         Qovnc/kbwoRnetHqBGeDF2fPdA2V7xqLwQuX5gzjUZqwftlSyPiHOdBaRr0TqZ+vGxsR
         DahtQN6EIpfPDE5zsHIHB4J5OUzGFMAKGIMAY0YNlKoZP07R0R9N72Hda3NbY56IpXPX
         9iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107344; x=1687699344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRSS0thFL99+lzuHoifF3dKBkoe4uJEbtzhdpwYILHY=;
        b=KotWPBwkABX0Zk/2JzzzrLfCfIhehaYIVvgySdZOOyddu4wV6+w1mpSBuWpZaXnrgp
         doInJB7jjsDvTfyYjK6VvzXo6/z5v+uoVGJXf7w2q8nyljStFl9DDBn4s8Gx7+aODseZ
         X62o0my3pwYyB1oMNbRmcn2UCd2eSnjPbbdyY81VrKcYmo7sjVRzLlkBA0F55s/777Ey
         8MVevmhc8QV1QvGpNG4S5skgtKEUp9VfAijyQUyfRYhqDfRBHownosc8TbMTAlyCLm5B
         l1BnKUDp4ThHQUcCac3b046VHopSfZgfA/hNs3JUCeVKlYtrOnKN0tjHA8HT+mJaHjoM
         /8Vg==
X-Gm-Message-State: AC+VfDxNQdTuMWjOoOo6ti90S3AevHdUJ3lR465rRkBftTLDffjvhZGM
        kSdtWlAbsTNcdPxmIRZu6D7gZQ==
X-Google-Smtp-Source: ACHHUZ75vUnzwb3A4ipiR60F8XFG10wwRoZPtxebBNB2iOcxlq7vnIUuGzzo8AeX6KQO8t/SiLNumw==
X-Received: by 2002:a5d:4b06:0:b0:306:3435:f85c with SMTP id v6-20020a5d4b06000000b003063435f85cmr1467531wrq.30.1685107344084;
        Fri, 26 May 2023 06:22:24 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f9-20020adff589000000b0030633152664sm5024803wro.87.2023.05.26.06.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 06:22:23 -0700 (PDT)
Message-ID: <76343325-b06c-9329-2d0a-e1d351bcafac@nexus-software.ie>
Date:   Fri, 26 May 2023 14:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 2/6] clk: qcom: Update l value configuration for lucid
 ole and evo plls
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-3-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230525172142.9039-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/05/2023 18:21, Jagadeesh Kona wrote:
> -	.config_ctl_hi1_val = 0x32AA299C,
> +	.config_ctl_hi1_val = 0x32aa299c,

You should separate out this change from this patch.

There's nothing wrong with having a preliminary patch to change all 
upper-case HEX to lowercase hex.

You should do that since the log here "update l value" != change UCASE 
to lcase hex.

---
0xb0d
