Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D930B6436F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiLEViW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiLEViV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:38:21 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85C26558
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:38:19 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id bn5so15097251ljb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1zGhkJQnRc9OCOboiJR7eBa33ck6Hcmn3DLCXnVO7lU=;
        b=lMsvYT0M5DCevJX0HmTvRjHNDCQv5AMtZyh1UuuIk/B47KxBNEwwcG7BdPpSlGesY3
         xkHlGncWM+QV57GzcBhWOAnAJKoOAnDIE+bVqKx3FwmcJ/DpPUhY0AByih7Jomm2DpYC
         6+X2kL1ZbodpdgVsHs4VKiIEpvP5McKssG2tKfgaWJFq+Zh23p9NypTaoZ9X3GdwfeeR
         eSZlw2hxoJI+9ATs45bXKlMWebNwMe4hS1/HUGQuTZJHf0zmH6LhmsdZoqqyO0ofXz1x
         ZKV098f7eAybmmOYCq6ENFZ94jZVXp+O/jUvoXd8Q4kuQphtv2xFnM/0h1Jiz4oQNLay
         uFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zGhkJQnRc9OCOboiJR7eBa33ck6Hcmn3DLCXnVO7lU=;
        b=Lp/78vS3ltV3UPP1RqXk1gvp59Bg8gGNA8HiH4Pq6KT5PtUnVR/Cy6vW491SHZocKH
         BM5YNzo2L4O0eXax6MxhFhY83oAxPjz3oJRE2OXyBEjCy8GqkJU2ULwynulo8cJJBfVh
         U11IgenVPDT0vUZvVMX+O0PjJIN+aDPEXXTrGNQFykkOVZB359JSINyOdkYLauhV3Zat
         Uaad8yivU1RVyFpQ8tO3BXadQTV7LvGJJWVdlMH5YP0QP0ES0PGgceDfWRimrx5ApAZN
         JJkbau0HvRgI84ZDTB9E1R0/RENcWMp91I0X2BRqG+N4oa2MCejdDgNxwqjsN2tnCVIw
         OGuQ==
X-Gm-Message-State: ANoB5pldndZ/NEsTaNCzLHJbVcIG9FQiIey0Q9mPRzd3/3lYe2GsnJ3P
        MwVq1eLJeHJ4pIgJQonBl292qA==
X-Google-Smtp-Source: AA0mqf7xZtVu6qeM1GB+thRvFD/vc7cuBejQD22cfS0Oada1Np40xYWeYiheOujwlxBWIrIhBgVfxA==
X-Received: by 2002:a05:651c:4d0:b0:27a:b1d:5662 with SMTP id e16-20020a05651c04d000b0027a0b1d5662mr602824lji.356.1670276298278;
        Mon, 05 Dec 2022 13:38:18 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id s7-20020a056512202700b004b561202ea2sm1072955lfs.182.2022.12.05.13.38.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:38:17 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:38:14 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
CC:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/16] clk: qcom: smd-rpm: drop the rpm_status_id field
User-Agent: K-9 Mail for Android
In-Reply-To: <b250eddc-5164-817a-1c8b-26999feb6b27@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org> <20221203175808.859067-9-dmitry.baryshkov@linaro.org> <b250eddc-5164-817a-1c8b-26999feb6b27@linaro.org>
Message-ID: <77F879AA-7303-4D3A-AD81-9EC5E9CB5ACC@linaro.org>
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



On 5 December 2022 20:04:54 GMT+03:00, Alex Elder <elder@linaro=2Eorg> wro=
te:
>On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
>> The rpm_status_id field is a leftover from the non-SMD clocks=2E It is =
of
>> no use for the SMD-RPM clock driver and is always equal to zero=2E Drop=
 it
>> completely=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>Since the macro is defining static structures it's fine, but it
>could be reassuring to see the rpm_status_id explicitly assigned
>to 0=2E  (Just a comment, no change needed=2E)  It's a good change=2E

Excuse me, probably I misunderstood your comment=2E The field is removed c=
ompletely, so there is no place for it to be assigned to 0=2E

>
>Reviewed-by: Alex Elder <elder@linaro=2Eorg>
>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm=2Ec | 20 +++++++-------------
>>   1 file changed, 7 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/clk/qcom/clk-smd-rpm=2Ec b/drivers/clk/qcom/clk-sm=
d-rpm=2Ec
>> index e52e0e242294=2E=2E828cae6769f9 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm=2Ec
>> +++ b/drivers/clk/qcom/clk-smd-rpm=2Ec
>> @@ -25,13 +25,11 @@
>>   #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>>   #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>>   -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, =
stat_id,  \
>> -			     key)					      \
>> +#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, ke=
y)      \
>>   	static struct clk_smd_rpm _platform##_##_active;		      \
>>   	static struct clk_smd_rpm _platform##_##_name =3D {		      \
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>> -		=2Erpm_status_id =3D (stat_id),				      \
>>   		=2Erpm_key =3D (key),					      \
>>   		=2Epeer =3D &_platform##_##_active,				      \
>>   		=2Erate =3D INT_MAX,					      \
>> @@ -48,7 +46,6 @@
>>   	static struct clk_smd_rpm _platform##_##_active =3D {		      \
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>> -		=2Erpm_status_id =3D (stat_id),				      \
>>   		=2Eactive_only =3D true,					      \
>>   		=2Erpm_key =3D (key),					      \
>>   		=2Epeer =3D &_platform##_##_name,				      \
>> @@ -65,12 +62,11 @@
>>   	}
>>     #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type=
, r_id,    \
>> -				    stat_id, r, key)			      \
>> +				    r, key)			      \
>>   	static struct clk_smd_rpm _platform##_##_active;		      \
>>   	static struct clk_smd_rpm _platform##_##_name =3D {		      \
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>> -		=2Erpm_status_id =3D (stat_id),				      \
>>   		=2Erpm_key =3D (key),					      \
>>   		=2Ebranch =3D true,						      \
>>   		=2Epeer =3D &_platform##_##_active,				      \
>> @@ -88,7 +84,6 @@
>>   	static struct clk_smd_rpm _platform##_##_active =3D {		      \
>>   		=2Erpm_res_type =3D (type),					      \
>>   		=2Erpm_clk_id =3D (r_id),					      \
>> -		=2Erpm_status_id =3D (stat_id),				      \
>>   		=2Eactive_only =3D true,					      \
>>   		=2Erpm_key =3D (key),					      \
>>   		=2Ebranch =3D true,						      \
>> @@ -107,19 +102,19 @@
>>     #define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	 =
     \
>>   		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>> -		0, QCOM_RPM_SMD_KEY_RATE)
>> +		QCOM_RPM_SMD_KEY_RATE)
>>     #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, =
r_id, r)   \
>>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
>> -		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
>> +		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>>     #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_=
id)	      \
>>   		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>> -		0, QCOM_RPM_SMD_KEY_STATE)
>> +		QCOM_RPM_SMD_KEY_STATE)
>>     #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_i=
d, r)      \
>>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
>> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
>> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>>     #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _act=
ive,	      \
>> @@ -128,7 +123,7 @@
>>   					     r_id, r);			      \
>>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
>>   		_active##_pin,						      \
>> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
>> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>>   		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>>     #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, h=
w)
>> @@ -137,7 +132,6 @@ struct clk_smd_rpm {
>>   	const int rpm_res_type;
>>   	const int rpm_key;
>>   	const int rpm_clk_id;
>> -	const int rpm_status_id;
>>   	const bool active_only;
>>   	bool enabled;
>>   	bool branch;
>

--=20
With best wishes
Dmitry
