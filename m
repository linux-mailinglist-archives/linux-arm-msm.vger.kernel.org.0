Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8EA6F9BB3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 23:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjEGVJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 17:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjEGVJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 17:09:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE10C100F6
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 14:09:39 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so3653643f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683493778; x=1686085778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uqWO0qQpK7ufgShdgqRMNTR/7ovm2xVdfX8EelQzFI=;
        b=UaMnXm/bH9hqkgRvevcUk9l8LrRqSKJD03P9umeCXMIUJyzfvrrQP8TUO+8DX3cMFl
         0zt/7/wc6qJwFLZjuQRVTY/s064xJ7xVvLWuAYVy8IL0It5N3IKgm7RNm2ipc7sjmdpv
         gTx28FqVOOyp/g4Dng2yOoTkT95nDHnzQCG7gP0uMRh9pUSC/TiG+rsu4A/1PimI4ymW
         dZqWuByQjtKhEK2jwAHnrrxBEMiLx16296k3ilkhE9zZU+yovAp2AeSKEfzQNjtR250R
         SpPy749cJau2LJJRJ1NVeF5djuKmZ5WwC1gKin1SXuiBtGVX/5YaMCEYKM7cNpbhaVMg
         Dvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683493778; x=1686085778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uqWO0qQpK7ufgShdgqRMNTR/7ovm2xVdfX8EelQzFI=;
        b=ljhHh6ouoBR70lc7Jfjua1iVaUE6srxJqXatKj2UNuUs2EIQXyPsfU6QcToWscfOqf
         FZLI2f/ARL8DpJrUOP/4AMVudUzoM05w/P171mCpuhB5Iwc7AgvpX04Jaz/Ttfv/1Az5
         PwnxlhW6BSLf6fondkIRLpsumwI2IL3dF9jTkJpSMFSQLT7SqdzWnzFoceaHkpkMM+tV
         F38rLbX0rBcvZU0hCTvpkTPf9c5Nzm7IeaIVDFHZJGwiO8wMHu3yy6GacgvMdXyFZZz4
         tDcYSRySWliUdFOosNrFmkFuxsVPLGEJSHQozO0cPAuI+e1deBd3GHOrJ0OmENoLuF2z
         b5bw==
X-Gm-Message-State: AC+VfDxaPLut0dpFZUyuaYe+itMYNxEsV1o3THbD7/O6jgaJ9TX2fnHc
        FTVvOyRSLNqtKGP6xsnHIL71Bg==
X-Google-Smtp-Source: ACHHUZ6AkZkK0j34tKN5sY9ByIuNF2/oH5xGsWbla3vcWmeLVo2011h/Jnelf2r0web/v1Rlk42ukw==
X-Received: by 2002:a5d:4530:0:b0:306:43a7:c2f0 with SMTP id j16-20020a5d4530000000b0030643a7c2f0mr6466675wra.31.1683493777936;
        Sun, 07 May 2023 14:09:37 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4c42000000b003063db8f45bsm9169375wrt.23.2023.05.07.14.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 14:09:37 -0700 (PDT)
Message-ID: <dbee2473-0768-606f-7a0e-a07c44da4648@linaro.org>
Date:   Sun, 7 May 2023 22:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
 <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
 <41581143-2caa-bac1-479c-c8feaf2de1b9@linaro.org>
 <378d0ec8-5ce1-57d3-eccf-8e053d647f47@linaro.org>
 <44c26ca6-12b3-74ad-70de-1dc2d4f42dca@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <44c26ca6-12b3-74ad-70de-1dc2d4f42dca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 12:47, Konrad Dybcio wrote:
>>          connector {
>>                  compatible = "usb-c-connector";
>>                  ports {
>>                          #address-cells = <1>;
>>                          #size-cells = <0>;
>>
>>                          port@0 {
>>                                  reg = <0>;
>>                                  pm8150b_role_switch_out: endpoint {
>>                                          remote-endpoint = <&dwc3_role_switch_in>;
>>                                  };
>>                          };
> ====

Hmm, I'm actually recoiling from doing this now that I look at it.

- Every other implementation defines the connector in the platfrom
   dts not the core dtsi

- The connector would have to be named something like
   pm8150b_type_connector which is not consistent with the
   rest of the Type-C connector namespace


Yes it can be done that the connector with the ports can be defined in 
the pm8150b dtsi but TBH I think it is more confusing that way and not 
consistent with other implementations.

I'm citing prior art here I just think this is nicer/easier to follow

- arch/arm64/boot/dts/qcom/sc8280xp.dtsi
- arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts

So for now

https://imgflip.com/i/7kw6ck

---
bod
