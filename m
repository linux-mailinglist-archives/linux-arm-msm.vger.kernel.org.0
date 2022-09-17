Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E945C5BBA66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 22:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiIQUeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 16:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiIQUeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 16:34:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD62B2F002
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 13:34:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bn9so29621770ljb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=2Y1O5W5ZK28eg1neor+oaEXrSqDR7BOdeg/qxT29wqY=;
        b=jtIrDJ7Eyvm/ojEtYCR7rZTmenqjMJwE/dO6p0M8Y0WJ1ZyqMVriL67OwAZ6uRpFtE
         e1RilQzbJhIAO2RcGotuo9ficZJPXHOW87Asz9OEOH3nXxKIGCcl8B/fh8owUoBecvTs
         HUBEUDUwNmudRspSl3l4yQbn4KceZFMs8phcmQKG9RbAQLDdQAjzZ+t6DkpahoWYknR4
         DB6fK1px8Mm+9oSGJrnQbcEvSZQSki7FdzNJ6bPZL4qxmhlHt6BNahto7eiPKuPL4FPb
         6kf/KgdidMru6MPjGpKZM4CjQF9BC1uk0iLnF86zOu/ORBw2lxHEQ1eyaEE6QJF1LF0S
         IicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=2Y1O5W5ZK28eg1neor+oaEXrSqDR7BOdeg/qxT29wqY=;
        b=TXfXVVyxRT9TnhspNskFc3wU9NO3hl2s7UGSHNWPH+3Yz/nJb/AolvLunTf7uLHeyz
         6dJgU5j8tHwWkFUG4NEcXUeeIQO8MkaFjeuzy2Z82dRGSs664Lvhj3oqdgx867Jye8aS
         bAE9Zq3FJKelj1AnRWyjugDUVLMDK9f/wPKPlbLP6LW6xFrpcIOuqkYpodYxRQs3CKqo
         FpFqwpzkqvjgJEdj9Jlt0Oj7gdU7wsgMPu4tc6yjWhoEySFaMR/vOKNsnDFl7AYs1oCZ
         CVn8Z2j//edT2lVl18o61/HQEJj2MsI/7Vuuy0gIHyADmD370TKrUYXeXAXXjXtDUtL+
         5r0g==
X-Gm-Message-State: ACrzQf3QRKqO4jltU/sHn/vkT3RfFdY0nuVRu5PGF+DKmFIzXCj9B975
        DnNqeoYJsfaLLQG4C8TpHqL9NQ==
X-Google-Smtp-Source: AMsMyM7bnnopvuZP6zJTx1BTPUhAP8xR75gy0SpMz4s0r6XB6jt8bxUkXllqVPKyhuIvxYFrnuqctw==
X-Received: by 2002:a2e:bba2:0:b0:26b:e2d6:fe44 with SMTP id y34-20020a2ebba2000000b0026be2d6fe44mr3061475lje.286.1663446858141;
        Sat, 17 Sep 2022 13:34:18 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.169])
        by smtp.gmail.com with ESMTPSA id z27-20020a0565120c1b00b0049a6a9bc0dcsm3836790lfu.134.2022.09.17.13.34.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Sep 2022 13:34:17 -0700 (PDT)
Date:   Sat, 17 Sep 2022 23:33:09 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 5/7] arm64: qcom: dts: sagami: correct firmware paths
User-Agent: K-9 Mail for Android
In-Reply-To: <5c701a7f-14cb-a11c-d822-6a89c4ca903c@somainline.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org> <20220915152630.133528-6-dmitry.baryshkov@linaro.org> <5c701a7f-14cb-a11c-d822-6a89c4ca903c@somainline.org>
Message-ID: <710F2BE9-F2A6-4931-9856-FE81293D1929@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17 September 2022 16:07:13 GMT+03:00, Konrad Dybcio <konrad=2Edybcio@so=
mainline=2Eorg> wrote:
>
>
>On 15=2E09=2E2022 17:26, Dmitry Baryshkov wrote:
>> Correct firmware paths for the Sony Xperia Sagami devices to include th=
e
>> SoC name=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  =2E=2E=2E/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami=2Edtsi | 10 ++=
+++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami=2Edtsi =
b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami=2Edtsi
>> index b3c9952ac173=2E=2Ee0940cb58681 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami=2Edtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami=2Edtsi
>> @@ -77,12 +77,12 @@ ramoops@ffc00000 {
>> =20
>>  &adsp {
>>  	status =3D "okay";
>> -	firmware-name =3D "qcom/adsp=2Embn";
>> +	firmware-name =3D "qcom/sdm8350/sagami/adsp=2Embn";
>sm8350 ;)
>
>I think it would be cleaner to follow with what's currently in linux-firm=
ware [1],
>so "qcom/socname/vendor/platform-or-device"=2E Xperias have a single key =
per SoC, so
>per-platform is fine here=2E Should be the same for other vendors, but no=
 guarantees=2E
>
>In this particular case, I think qcom/sm8350/SOMC/sagami would be appropr=
iate, as
>it seems like SONY is still internally using that name [2] (SOny Mobile C=
ommunications)
>(sidenote: they are still using the legacy SEMC / Sony Ericsson Mobile
>Communications in some places if you dig deep enough :D), buuuut they can=
't seem
>to decide, might as well make it PlayStation at this point haha

I'd vote for plain Sony=2E Both SOMC and SEMC are non-obvious and too cryp=
tic=2E

>
>
>Konrad
>
>[1] https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware=2Egit/tree/qcom/sc8280xp/LENOVO
>[2] https://github=2Ecom/sonyxperiadev/kernel-copyleft-dts/blob/64=2E0=2E=
A=2E2=2Exxx/devicetree/qcom/waipio-nagara-pdx223_generic=2Edts#L10
>>  };
>> =20
>>  &cdsp {
>>  	status =3D "okay";
>> -	firmware-name =3D "qcom/cdsp=2Embn";
>> +	firmware-name =3D "qcom/sdm8350/sagami/cdsp=2Embn";
>>  };
>> =20
>>  &i2c1 {
>> @@ -175,12 +175,12 @@ &i2c17 {
>>  &ipa {
>>  	status =3D "okay";
>>  	memory-region =3D <&pil_ipa_fw_mem>;
>> -	firmware-name =3D "qcom/ipa_fws=2Embn";
>> +	firmware-name =3D "qcom/sdm8350/sagami/ipa_fws=2Embn";
>>  };
>> =20
>>  &mpss {
>>  	status =3D "okay";
>> -	firmware-name =3D "qcom/modem=2Embn";
>> +	firmware-name =3D "qcom/sdm8350/sagami/modem=2Embn";
>>  };
>> =20
>>  &pmk8350_rtc {
>> @@ -210,7 +210,7 @@ &qupv3_id_2 {
>> =20
>>  &slpi {
>>  	status =3D "okay";
>> -	firmware-name =3D "qcom/slpi=2Embn";
>> +	firmware-name =3D "qcom/sdm8350/sagami/slpi=2Embn";
>>  };
>> =20
>>  &spi14 {

--=20
With best wishes
Dmitry
