Return-Path: <linux-arm-msm+bounces-78194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E756BF731E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8B92355674
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52CA166F1A;
	Tue, 21 Oct 2025 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mZppEYbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE465340A77
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058576; cv=none; b=aaTvkgLq9IOW6vE+gJZbmOrjl+2lg50rXfEqj53okVSH9mpPMUkUlMVrU6tYW8VsZKroqGV1DSB17ujd3HsAShfi0kkfIjjFpllSDhoH+79E81KtCC6zjouzQbmGa+swmdhLjeEYh6ywUDqTifOg0qvotDmaYJQzfrY3hnB7S1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058576; c=relaxed/simple;
	bh=KyNo6thQEOTJXsThDPVdD5NrRwqVtey8BPK2uJX6UTA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ahGuHuIrF6s5DNnrF3Ma5zGRJjeoqk41gomdyorYz8lnRO9opbJM3A2VkMrL5t22Wbn/HdIQDtHsHFpixMmFxF6657ON5stx7eKoB7bw7IRyQT6zT4/6D695scUkN1PUx4rAW3Em8Y/p99xe77BGQPAurRFjRUq+qVMXj0Q5uzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mZppEYbr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3d80891c6cso1299276266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761058573; x=1761663373; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6+v9PlKDyKuyf0Qjke6DSmKcv77GPvo265+QAbD/UI=;
        b=mZppEYbrGOlwB4+c+PcVZHLV6DRFby/K2LtWEPx4q566N+4tuQlfZYcw/pOy9S6ONK
         FaXdS7r47pe7jWTx0TnHrT8ztftwwq3wq1A3AzysVqWSdSp3uO2rsXnOs6VepkjiZJz3
         E9wbPadxn6hVke7365t0xMupiPPfcmmFqWOgzjC4x5RTrjDMOiY/Xi966lPdJevvdWw5
         AgfIEvI1OCkISgOnUEPW6FvprRt1D0DaVcISXZ5CE1WNicBWXoQ2D0XwDBBTGjHmHXTX
         ZExaJ+ebduObsRo0NHmEV1qveeP9/4P1ABdp8bUrMSBj0dgWHFYSZz7LHfPtwth7oGwN
         xa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058573; x=1761663373;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6+v9PlKDyKuyf0Qjke6DSmKcv77GPvo265+QAbD/UI=;
        b=SveEvkmiK5QvCd1eKV4JGeKZHmL3Ftw9FviyltIomouD/6B5BoRDmIcm1If3stPzXB
         JLeAqCvUWsRkovBknSKf05RII4TAi+Ma6p1IfAnTW27izvXQjO96qMlTtWx1rad+hsMV
         65+qtt/juJL35BR/R5LqlWYwly6vb+/oh5eLROjeXfRc2y6bFYbKE89/o+D1D2vYmQxc
         U70EKi3zlBy/rl2xq+vnyXXMTRUBQMVYDrRGSX42GXsOydrtBRLk1+Stmk0MvogECAwv
         LfwlQZzV7l7ku/0HpRlVTnPWUeyU6EPqNq+wkRL1qz5z67yZD/ahM866pxrJYuniJGsq
         dl1A==
X-Forwarded-Encrypted: i=1; AJvYcCWmHV44+i4yz6pndFsDpMVf+ZRn0M0glqSFRh6xlp3WPUWANHDgHrmhUMEiT0EsJGuzy6Ap0beZinK/+3Zv@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBMxfd83CE2jldP2esPSXdMJVoPn05uxnnJLSo5jbin3SioVj
	eAZGZgiGoXQK0/Pn96l2QiNGg1/P5tFltW7tHS041znWdHPygSK0bOjKMl+8dnJ4k9E=
X-Gm-Gg: ASbGnct+Y+K8LThk8mNYSmBiUyw2cjgV4Nb8INsdydwrMHkftgjEiEUzPisdqAsANRR
	ljVVxaiIq6J8erV2AMU8meESeDxZtR9YlFh0jywnwLDDjMV6geLJpNgP01f9UCl4kUC+7IiIDBr
	14gHEZSjNlRHmvrne5Te4BMtdwUR1wFQtRdLDyCM8EDTfT2T/1GWRKHX9SgvfaofpIhoAYIfE9D
	qyNeW0kwBUIzgwti5na/Ejd540KjxkIdAALWV+/bD+coFUKNahO+QJWWCobh2uYyrfgZwAZ3QsO
	U/cgKCFuqpPoHcMKShZfVj5Qh5+GaDVAN66V3CPdEpYUJvVxONAztZ0JqCZEpo270QJY8UwGT+Z
	ys1XlZyAZzBm0Qt1z1agPou31Mof6AcBYmckdTJMs0EkKSSXJuaKp5oZx8pDf3eKZ9k9BX4z+6W
	TeH7jpqqF610ZYpR5O+EB1boXDpWPHji67F72PmMELVIZNTkwxoyKJzaVMGJQRUD95r4nyqJbZ1
	+WYMOEvc85kxTU=
X-Google-Smtp-Source: AGHT+IETvZRvD5jNdS67zvf1E9MqOP8k7cWq+8VKCliU1S1QhyrIzj8Lu65VbulmNCZ2Mz9ZC+1rYw==
X-Received: by 2002:a17:906:fe09:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b6d2c00a06fmr6056366b.14.1761058572645;
        Tue, 21 Oct 2025 07:56:12 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83937a3sm1105133866b.23.2025.10.21.07.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 16:56:11 +0200
Message-Id: <DDO35V8IMUNE.2VXRN239GETSB@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Taniya Das"
 <taniya.das@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
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
 <DDO2HYG8H2XJ.1MZLPJH36PR85@fairphone.com>
In-Reply-To: <DDO2HYG8H2XJ.1MZLPJH36PR85@fairphone.com>

On Tue Oct 21, 2025 at 4:24 PM CEST, Luca Weiss wrote:
> Hi Taniya,
>
> On Tue Oct 21, 2025 at 1:12 PM CEST, Taniya Das wrote:
>>
>>
>> On 10/21/2025 3:28 PM, Luca Weiss wrote:
>>> Hi Vladimir,
>>>=20
>>> On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
>>>> Hi Luca.
>>>>
>>>> On 10/17/25 17:05, Luca Weiss wrote:
>>>>> Hi Taniya,
>>>>>
>>>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>>>> Hi Taniya,
>>>>>>>
>>>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>>>
>>>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wr=
ote:
>>>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX =
power
>>>>>>>>>>>> domains.
>>>>>>>>>>>
>>>>>>>>>>> Are those really required to access the registers of the cammcc=
? Or is
>>>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this appli=
cable
>>>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>>>
>>>>>>>>>> Due to the described problem I experience a fatal CPU stall on S=
M8550-QRD,
>>>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however =
it does
>>>>>>>>>> not exclude an option that the problem has to be fixed for other=
 clock
>>>>>>>>>> controllers, but it's Qualcomm to confirm any other touched plat=
forms,
>>>>>>>>>
>>>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>>>
>>>>>>>>
>>>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>>>
>>>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bit=
ra)
>>>>>>> need multiple power domains, or in general which clock controller u=
ses
>>>>>>> which power domain.
>>>>>>>
>>>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>>>
>>>>>>> That'd be highly appreciated since I've been hitting weird issues t=
here
>>>>>>> that could be explained by some missing power domains.
>>>>>>>
>>>>>>
>>>>>> Hi Luca,
>>>>>>
>>>>>> The targets you mentioned does not have any have multiple rail
>>>>>> dependency, but could you share the weird issues with respect to clo=
ck
>>>>>> controller I can take a look.
>>>>>
>>>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone=
 4)
>>>>> again, but again hitting some clock issues.
>>>>>
>>>>> For reference, I am testing with following change:
>>>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimi=
r.zapolskiy@linaro.org/
>>>>>
>>>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sens=
or
>>>>> on this phone - results in following error.
>>>>>
>>>>> [    3.140232] ------------[ cut here ]------------
>>>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch=
.c:87 clk_branch_toggle+0x170/0x190
>>>>>
>>>>> Checking the driver against downstream driver, it looks like the RCGs
>>>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>>>> downstream, but changing that doesn't really improve the situation, b=
ut
>>>>> it does change the error message to this:
>>>>>
>>>>> [    2.933254] ------------[ cut here ]------------
>>>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configurati=
on.
>>>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c=
:136 update_config+0xd4/0xe4
>>>>>
>>>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK =
as
>>>>> iface clk, could something like this be missing on sm6350?
>>>>>
>>>>> I'd appreciate any help or tips for resolving this.
>>>>>
>>>>
>>>> Recently one particular problem related to MCLK was identified by me o=
n
>>>> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not po=
ssible
>>>> to toggle MCLK clock enable/disable state, when TITAN GDSC power domai=
n is
>>>> set off. I'm working on fixing the issue (a change under clk/qcom), si=
nce
>>>> it's of an importance for a customer as well.
>>>>
>>>> I can't be totally sure that it's right the same problem as the one re=
ported
>>>> by you above, but it looks very similar, as a fast workaround please c=
onsider
>>>> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you=
 that
>>>> this actually helps would be nice to get.
>>>=20
>>> Unfortunately that doesn't seem to help on sm6350.
>>>=20
>>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-s=
m6350.c
>>> index 12a469ce7e2f..cf87ad55d318 100644
>>> --- a/drivers/clk/qcom/camcc-sm6350.c
>>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>>> @@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc =3D {
>>>  		.name =3D "titan_top_gdsc",
>>>  	},
>>>  	.pwrsts =3D PWRSTS_OFF_ON,
>>> +	.flags =3D ALWAYS_ON,
>>>  };
>>> =20
>>>  static struct clk_hw *camcc_sm6350_hws[] =3D {
>>>=20
>>>=20
>>> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>>> [...]
>>> titan_top_gdsc                  on                              0
>>>                                                 bps_gdsc, ipe_0_gdsc, i=
fe_0_gdsc, ife_1_gdsc, ife_2_gdsc
>>>     ac4a000.cci                     suspended                   0      =
     SW
>>>     ac4b000.cci                     suspended                   0      =
     SW
>>>     genpd:3:acb3000.camss           suspended                   0      =
     SW
>>> [...]
>>>=20
>>> but still the same clock stuck warning...
>>>=20
>>> [    3.093431] ------------[ cut here ]------------
>>> [    3.094614] camcc_mclk1_clk status stuck at 'off'
>>> [    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c=
:87 clk_branch_toggle+0x170/0x190
>>>=20
>>> Thanks for the suggestion though.
>>>=20
>>
>> Hi Luca,
>>
>> Seems like the CAMCC_PLL2_OUT_EARLY output could be OFF here, which is
>> sourcing the mclk RCG's.
>>
>> The user_ctl is not properly configured to enable the PLL early output.
>> Can you please try below change and check if it helps?
>>
>> diff --git a/drivers/clk/qcom/camcc-sm6350.c
>> b/drivers/clk/qcom/camcc-sm6350.c
>> index 8aac97d29ce3..d33db530b7c9 100644
>> --- a/drivers/clk/qcom/camcc-sm6350.c
>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>> @@ -154,6 +154,7 @@ static const struct alpha_pll_config
>> camcc_pll2_config =3D {
>>         .config_ctl_hi_val =3D 0x400003d2,
>>         .test_ctl_val =3D 0x04000400,
>>         .test_ctl_hi_val =3D 0x00004000,
>> +       .user_ctl_val =3D 0x0000030F,
>> };
>
> Yes! Indeed that makes the clock not be stuck, and debugcc is also
> correctly reporting ~24MHz from that clock when it's enabled!
>
>   cam_cc_mclk1_clk: 23.999592MHz (23999592Hz)
>
> Is this PLL also missing a value for .user_ctl_hi_val? The other PLLs
> have that set as well.
>
> Out of curiousity, where's this magic value from? Only some sort of HPG
> doc, or is this also somewhere referenced in downstream? Curious why
> this is not set there for this PLL.

Ah, just saw this part in downstream
https://git.codelinaro.org/clo/la/kernel/msm-4.19/-/blob/LA.UM.9.12.c25-028=
00-SMxx50.QSSI13c28.0/drivers/clk/qcom/clk-alpha-pll.c#L2443-2463

That's quite different to the simple

	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
							config->user_ctl_val);

that's in upstream.

Also explains makes it clear that .user_ctl_hi_val is not applicable to
this agera PLL.

From looking at camcc-sm7150, I guess they have the same problem over
there. A bunch of post_div and _mask's set, but no .user_ctl_val set for
PLL2. But camcc-sc7180 is fine though.

Regards
Luca

>
> This is one major step toward camss & camera support for this phone!
>
> Regards
> Luca


