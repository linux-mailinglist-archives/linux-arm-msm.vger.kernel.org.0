Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103445AFA92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 05:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiIGD0l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 23:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIGD0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 23:26:39 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158F8832FD
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 20:26:38 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id t8-20020a9d5908000000b0063b41908168so9406413oth.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 20:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZXmqcDwCNHYT98hHW5xGO1fd6xJaEvG9lWSh2f3hy/o=;
        b=Zfrz6fe6Lo9OTxr6Ld7B12LdCNi7ipVOK16cY/oT88UV3+svcizdul7KOGXqYEBXko
         UGC5PTG8Tr7zmeEDcbGH3zbvRbZHaAobvoMle8ptzBbHakxwURUlbhHHWKTMrDgPcrpV
         eKYvp/X2iGg3GMzbm3+YemhVtu7cfdSBNINYiXaUQ0J2iJv2zrdeK1a1wCEASpQb41fb
         okdtHYhJkKgLsN+dUVpkmKPXoRc7zFd4fCjt4lva0XQFBOOyEgFg59SBoKtq/URxVLlh
         cuHpGQLb/tt6Dmcag1M55BAYLz49Yqv//5ljnW0J0962LOjJ0NrLs0cu/NPEw8pQUltC
         11Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZXmqcDwCNHYT98hHW5xGO1fd6xJaEvG9lWSh2f3hy/o=;
        b=2oOBgrfRxX6n3VmsPigOsJJh0zK8wW9t/ebnzd8WUZK3KuspTngh64fPFMW65x6X9t
         70X/1mUJHjT24wqJ3RpbLUHpcE3GPFVxosG9Fe7XXFxJ63KzDy39FtVsefm4Jb9n6IT/
         bpNxwGopiZfmxven0zzy0RFfaTw5+gm/Mhvc6GtFeaHCOQy5Uuf4fjkITLnWr6aii3RF
         ILOrg0yFTatCrum3Q1dMvv7mg5kyRJgtk4YHTlyfqyW0k1WFgUC/A5utapTv91LvVJrr
         d82+Qxa0nHfA1j2DQ1ST9sMCAcCIUDn2KfK/Sqy7VRNuOS68K4dKqOybtvVPzAS/7yxE
         8bwg==
X-Gm-Message-State: ACgBeo3SiG5UkGmyfpplMdeo4HRUOSu5qfaOZh/+LbdbCqSZx9h2r9qa
        nR2STUAtZOpy/tZ+xRKjyit/Zw==
X-Google-Smtp-Source: AA6agR7YsmduzcN42HFQdUUCbrwuK36JyuKORNqNhUEkKjFlcOBhSt9x9LiHfpoT+hWgIJFU6yQwvg==
X-Received: by 2002:a9d:4545:0:b0:636:cd1e:494f with SMTP id p5-20020a9d4545000000b00636cd1e494fmr670321oti.132.1662521197431;
        Tue, 06 Sep 2022 20:26:37 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id v14-20020a0568301bce00b0063911de9fd8sm6795403ota.24.2022.09.06.20.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 20:26:36 -0700 (PDT)
Message-ID: <a2d5acff-10fd-31da-a04d-f0ecee3c5a44@kali.org>
Date:   Tue, 6 Sep 2022 22:26:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] arm64: dts: qcom: sdm845: align APR services node
 names with dtschema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
 <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220906121655.303693-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/6/22 7:16 AM, Krzysztof Kozlowski wrote:
> DT schema expects APR services node names to be "service":
>
>    qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 98d34b5e1df2..8e7b577f78c2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -767,13 +767,13 @@ apr {
>   				#size-cells = <0>;
>   				qcom,intents = <512 20>;
>   
> -				apr-service@3 {
> +				service@3 {
>   					reg = <APR_SVC_ADSP_CORE>;
>   					compatible = "qcom,q6core";
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   				};
>   
> -				q6afe: apr-service@4 {
> +				q6afe: service@4 {
>   					compatible = "qcom,q6afe";
>   					reg = <APR_SVC_AFE>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> @@ -785,7 +785,7 @@ q6afedai: dais {
>   					};
>   				};
>   
> -				q6asm: apr-service@7 {
> +				q6asm: service@7 {
>   					compatible = "qcom,q6asm";
>   					reg = <APR_SVC_ASM>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> @@ -798,7 +798,7 @@ q6asmdai: dais {
>   					};
>   				};
>   
> -				q6adm: apr-service@8 {
> +				q6adm: service@8 {
>   					compatible = "qcom,q6adm";
>   					reg = <APR_SVC_ADM>;
>   					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";


Tested on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

