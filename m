Return-Path: <linux-arm-msm+bounces-78191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 563E6BF711D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DFD3B8718
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFED330B3C;
	Tue, 21 Oct 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="s4+73RCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80B8338900
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056703; cv=none; b=mHZ92JDziPND6BnXRzicJr9+o+U0RPMRuZcb+/FxKYZahZtqB3XkTxXQGJJ8ELyRCc2yd1OsSXbmtYrj4oEjIEZDhuSG6mjKBigCPs6wzqGS89lvsfqaGj6dXdGVF3WYvlTRfgNDPs1y7md7Hl0w+LMFGv57rKacHNG9/ogcu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056703; c=relaxed/simple;
	bh=ePnTqcsi+LRujOPSNyRV/6QAM93Sn7upy/IagZIVJrE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hf86KKMUnpcPVeX6CUvwmRW6zghT/UWeVFPCOPpoQUZbaRubcj33LSm3pemaYh5gVbNQ7bIKyCDALB3jtlMR+obDf+SHlNm4ygvjPAAnxg6mmpeAKIQ1FtViSHIIaUrZG8YIICh+vh1GKCSeXxn5dM4o2Tur5OCC+lVqCHQvdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=s4+73RCR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b463f986f80so1095826166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761056699; x=1761661499; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1WyHXr/eyRqrbObxdSXrtwAmI9rbqGkPfkhsgs81ls=;
        b=s4+73RCRrWdL/ZJApbsT6bFUejx3J3HcfFJUfkYwVKpMTBfgJeHZXLV9Vy1pXWQgRO
         ct/+xi3dBLqr1vxdqFdPvv+dwFvE9Nvz1O0VRmL3LHCOAJjqFMSJNwA3qvlmS6aFQ5gK
         YSspiVFJxrUUH+1KLBYLZcl8fL9jljJewwCNyb8FM3xOSIftwCKgpScbnVoUMsZ7OfRo
         jwv/vPXfcWW7Vvl9q8myFD5YKtMJ59xcaGKY5Stte2dRrCbR3b8g+YROfbJm2jdX62xi
         EfOG/Gp0pKT+2cXE1bk+mKSgJJTETn3v2uxJWhhphktwFJUtz5lLE1uWPHtNs+LFQ0sG
         M7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056699; x=1761661499;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1WyHXr/eyRqrbObxdSXrtwAmI9rbqGkPfkhsgs81ls=;
        b=Or6KvhqgA2tcZGn14+DPabDm7M0K77SlYscWgj90V47nTo58IhyJpBbZhp1NCMyaEu
         sHmlHJRNzhHfIyHy2BGOm+EdL8FZJFIHW+UU1cacONZ7nPr1D9l584Wqwav9AeJPAELb
         uqNLWRIn7z/s2xDOzK8LN/PA/k1tj7jem3PMJrJSVCgcHrIy0TKptSjnHiY+yxS3c8Qu
         NT3k9wiE6xgVAswqd3wx8OP1kLYuJxOrOoDl13k9/C3lm98X35dNh+mr1YvckiHJWbgy
         RKBXK1/mfj54lp2iYeOx1XUIfAw8M3OG8kusuMbBjS9liQjdS2cuzCTLEpdWZhbvXJN+
         ljng==
X-Forwarded-Encrypted: i=1; AJvYcCXdLiwHqRNTsokhboJ9ymmNCeduTT6V6080JECXfgHenS4Ue/doDpQWj/rt+ZGkXsH4rBgoS5ewg5bAkWLK@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnbTWeWUdX3IuOWVSzokGssRHOQwDRWAQV52PeL/QbEMl8jDN
	xovie5tAgbEQeh5g9HGbcmALEVchro+wN+YLniBQ3cwSjtu+K0Q/jhwnr99lM8+zWi4=
X-Gm-Gg: ASbGncsG7a0kriaYvHzqegDV+/e6Y5jAqxuqi6mzpLy3VWvhLGJdzOoV2B58WbaUjGQ
	hfg1Cvffk2CaA+/UHDgsr0vWyQ8YQPP9gyQjGa+Hgy3bQEW/4GaaW7TNNhHh2wn/yPug0wGdrIa
	mGzpFoNsSu0SKuwLI161kQgaNLxHfGY5g0m/PppFlp8f0b5wZBOhCV8c7p+amKO7Eo2+u+3qajX
	Jng0YuqYtWzxHgQLMsfpaVn3JRXEg3QrfYUNyEHlCVDp5QWGLGNhjrMYUOPlDvtYovAVDgXfYYD
	GU6dbhUMK0o4x6uaiMkNqJVaHmkba/xCwhJ0TjeUKqMUB/ggL1+mOXD5At7HjApISbg2Wn1/5/o
	F/Jtt1lrHQbjutr+HZR4VWt6tjlt5BgqFLX9YCT8/e3WQ8l0Kd9YxtiQuXLKKLujkzsVFlgHttF
	qYvR/ikdSl0He/SP0X4DPqQCRQpouDSz/+gbDlKlnHjR7vjSgVSUEGXvm6/GsZAWpXwxwqHLKxx
	qpz6A9WIIZo/CoB8NlHteDuOQ==
X-Google-Smtp-Source: AGHT+IGN0X72iZ/uaFC3lc/dWPSmP0zEnWLE/5oi/QxvD+hnnLPe3mmfMdan2K+lK4hSorY9nNdgNw==
X-Received: by 2002:a17:907:3e1c:b0:b3c:896:abf5 with SMTP id a640c23a62f3a-b6473144021mr2164787466b.25.1761056699095;
        Tue, 21 Oct 2025 07:24:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25c9sm1109196966b.11.2025.10.21.07.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 16:24:58 +0200
Message-Id: <DDO2HYG8H2XJ.1MZLPJH36PR85@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <3854e3a0-744c-4317-a6ed-e28edbabc4a3@linaro.org>
 <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
 <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>
In-Reply-To: <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>

Hi Taniya,

On Tue Oct 21, 2025 at 1:12 PM CEST, Taniya Das wrote:
>
>
> On 10/21/2025 3:28 PM, Luca Weiss wrote:
>> Hi Vladimir,
>>=20
>> On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
>>> Hi Luca.
>>>
>>> On 10/17/25 17:05, Luca Weiss wrote:
>>>> Hi Taniya,
>>>>
>>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>>> Hi Taniya,
>>>>>>
>>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>>
>>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wro=
te:
>>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX p=
ower
>>>>>>>>>>> domains.
>>>>>>>>>>
>>>>>>>>>> Are those really required to access the registers of the cammcc?=
 Or is
>>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applic=
able
>>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>>
>>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM=
8550-QRD,
>>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however i=
t does
>>>>>>>>> not exclude an option that the problem has to be fixed for other =
clock
>>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platf=
orms,
>>>>>>>>
>>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>>
>>>>>>>
>>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>>
>>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitr=
a)
>>>>>> need multiple power domains, or in general which clock controller us=
es
>>>>>> which power domain.
>>>>>>
>>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>>
>>>>>> That'd be highly appreciated since I've been hitting weird issues th=
ere
>>>>>> that could be explained by some missing power domains.
>>>>>>
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> The targets you mentioned does not have any have multiple rail
>>>>> dependency, but could you share the weird issues with respect to cloc=
k
>>>>> controller I can take a look.
>>>>
>>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone =
4)
>>>> again, but again hitting some clock issues.
>>>>
>>>> For reference, I am testing with following change:
>>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir=
.zapolskiy@linaro.org/
>>>>
>>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera senso=
r
>>>> on this phone - results in following error.
>>>>
>>>> [    3.140232] ------------[ cut here ]------------
>>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.=
c:87 clk_branch_toggle+0x170/0x190
>>>>
>>>> Checking the driver against downstream driver, it looks like the RCGs
>>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>>> downstream, but changing that doesn't really improve the situation, bu=
t
>>>> it does change the error message to this:
>>>>
>>>> [    2.933254] ------------[ cut here ]------------
>>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuratio=
n.
>>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:=
136 update_config+0xd4/0xe4
>>>>
>>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK a=
s
>>>> iface clk, could something like this be missing on sm6350?
>>>>
>>>> I'd appreciate any help or tips for resolving this.
>>>>
>>>
>>> Recently one particular problem related to MCLK was identified by me on
>>> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not pos=
sible
>>> to toggle MCLK clock enable/disable state, when TITAN GDSC power domain=
 is
>>> set off. I'm working on fixing the issue (a change under clk/qcom), sin=
ce
>>> it's of an importance for a customer as well.
>>>
>>> I can't be totally sure that it's right the same problem as the one rep=
orted
>>> by you above, but it looks very similar, as a fast workaround please co=
nsider
>>> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you =
that
>>> this actually helps would be nice to get.
>>=20
>> Unfortunately that doesn't seem to help on sm6350.
>>=20
>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm=
6350.c
>> index 12a469ce7e2f..cf87ad55d318 100644
>> --- a/drivers/clk/qcom/camcc-sm6350.c
>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>> @@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc =3D {
>>  		.name =3D "titan_top_gdsc",
>>  	},
>>  	.pwrsts =3D PWRSTS_OFF_ON,
>> +	.flags =3D ALWAYS_ON,
>>  };
>> =20
>>  static struct clk_hw *camcc_sm6350_hws[] =3D {
>>=20
>>=20
>> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>> [...]
>> titan_top_gdsc                  on                              0
>>                                                 bps_gdsc, ipe_0_gdsc, if=
e_0_gdsc, ife_1_gdsc, ife_2_gdsc
>>     ac4a000.cci                     suspended                   0       =
    SW
>>     ac4b000.cci                     suspended                   0       =
    SW
>>     genpd:3:acb3000.camss           suspended                   0       =
    SW
>> [...]
>>=20
>> but still the same clock stuck warning...
>>=20
>> [    3.093431] ------------[ cut here ]------------
>> [    3.094614] camcc_mclk1_clk status stuck at 'off'
>> [    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c:=
87 clk_branch_toggle+0x170/0x190
>>=20
>> Thanks for the suggestion though.
>>=20
>
> Hi Luca,
>
> Seems like the CAMCC_PLL2_OUT_EARLY output could be OFF here, which is
> sourcing the mclk RCG's.
>
> The user_ctl is not properly configured to enable the PLL early output.
> Can you please try below change and check if it helps?
>
> diff --git a/drivers/clk/qcom/camcc-sm6350.c
> b/drivers/clk/qcom/camcc-sm6350.c
> index 8aac97d29ce3..d33db530b7c9 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -154,6 +154,7 @@ static const struct alpha_pll_config
> camcc_pll2_config =3D {
>         .config_ctl_hi_val =3D 0x400003d2,
>         .test_ctl_val =3D 0x04000400,
>         .test_ctl_hi_val =3D 0x00004000,
> +       .user_ctl_val =3D 0x0000030F,
> };

Yes! Indeed that makes the clock not be stuck, and debugcc is also
correctly reporting ~24MHz from that clock when it's enabled!

  cam_cc_mclk1_clk: 23.999592MHz (23999592Hz)

Is this PLL also missing a value for .user_ctl_hi_val? The other PLLs
have that set as well.

Out of curiousity, where's this magic value from? Only some sort of HPG
doc, or is this also somewhere referenced in downstream? Curious why
this is not set there for this PLL.

This is one major step toward camss & camera support for this phone!

Regards
Luca

