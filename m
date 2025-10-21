Return-Path: <linux-arm-msm+bounces-78134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A992BF5AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA7A9501701
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D18329C6B;
	Tue, 21 Oct 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BQK0aoUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BFE30216C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040736; cv=none; b=S7LjAXxVs+LCHfIpNOaEsAdcxkPzzWz7p7GfoN2UpOxVAMyFvegvwSa+N0LdViT5UvC3FrlGwONfq3NJw95H6jgis1Ib+K19ydbUWCGrsHfiU+B8V7x9F8YuJVlKcNX850Ix4VEHnV1rvWeDrMfJjMqu14tu3NALMRJ4RxdYurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040736; c=relaxed/simple;
	bh=jL5PiRJcqKuNtEtR529Q+1ag7NmYrhDagjAzjFjAk+s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P8IKiyUKo4rvexGnW7j4zgvsfvgT63CHLhMUtk9E/vZ+wAXwsbxw88UfpYY4Le97+L378EPOnVDgdmXowvK9ZuoQJ1F6f1C17tVGP/A0wtSOYjnpNmEntLatDgtvORWg6ntm2KZ57lURIS9TsO9kUv/E4TCzF2JcI325jcBRfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BQK0aoUA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso9741685a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761040732; x=1761645532; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfc+hYYkM7bFtd7hc1ZsC7zgHKLWgJd0muBJbt3zQ7g=;
        b=BQK0aoUAjVkbvq5PTSRZ9xqpTPqVLUBwxecJNCh3KN7f1eu5J1Byux82uzMFo865j/
         QsBMlXB0KZy5I7iCpd8V+3W+wdEauefyKSgIEEjLc+LioiXSOiSvulDx8LY8rg76rcmk
         QoRxmupi8+1wds0KIUznq2Fq+vMwcztwvzzRur9J3GgbMZO7sZffBxUZrjeKyS+9IMCe
         zfxn+pMFE2Ny5n7qjKGxLQGvyWAIi/TjlAQPPFCEaLGWsonPvZZr6dGkU6TX0/znK+JB
         UUeyjlc5tz3Zdm8SmHyV5cnEN7jbG6OnIqc0KdExqCwsXpyDXDRFqeC0N/jpY/uRNq0d
         7jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040732; x=1761645532;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jfc+hYYkM7bFtd7hc1ZsC7zgHKLWgJd0muBJbt3zQ7g=;
        b=f5h/5GIZ74apOaupu5TxyA4j6pGDnUF/SmQB23pbYT46C8PLIFc1SSV2qMNVaw9sBi
         P2Ieyoo1xBoycJXCjcfK6FdMwcE3RFn1xcAGa6sp/MvJmbOCr9+Dde1yBoC6RFBmSmtH
         3ErKeox9NjTI3fDgSfuqHOAdmknYqgqwL76hP8BlRtlVWwve/7MyQD/pxXT+qSjiNK4T
         4ZUAdhhfChya0B0BpDVg4ePV3i0loKBIah8ruQrERA811Mi/Y3LjfcSQeDk0EWWEBSU4
         GVBs1Jihzr+1waIkm7Rd6E7SIXAOwP5KiaP89c+Kp7W7kvlNB0c2sBwy4AKCNIiDyyQ/
         XEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu8d3kAPledy09HHkaBLY3IK0Ollz2uHIH7UKE0si1k/YvxBl7JUHeHInMNxmybY0Ho27NiFqFZov/OTgy@vger.kernel.org
X-Gm-Message-State: AOJu0YyiLp2e7skzXHRqO2QqPpaHVlJa27Np1vu3D/3yPw0WPthFx/al
	cTK8R5XmWImhWQl+GRMnBhxAF9TZimjbHaRU+ix1MK3F7Y7vpHo+o/shtUQS7VZwEQc=
X-Gm-Gg: ASbGnctlqquc0UH4Gf5Rh0RDq7hWipDkydZ2SQwhGrZvez0K3b/+63vxl8rsT9JmXHh
	X+via5lAy2+JyN1z4T4No1ljT0pd8GWYLmQi3WHUS/DOT3uje/KOZXClPVXy2AdI4OSwiRD5bCE
	vHpBANefFkvCUzpEwqczNnf3pVfojfyy+x5apXiu2xP9u/6c+64v0l80qM0GclP11R+IIs9MCRe
	XdNFCRPX0KrsKYPPfwQWHADnVRd1TIemkCc7KqBFC8AP/mPXKNFopFFGJqAmqQRiirHLP2inDpK
	6hH5PbJbGRBooe98q4qbYqSM5TzFt0fm+u0A5t+r5pX2GYuMsYjejm0YPSIQJ1kjBg4R+50k9r5
	lC+LW/Xp6qtf1KpAm0jELYkfUbUhLy0fVqgCwtk7SryCXvsSDsiQQByfrgqPyxIQ2/4CjgYXcLr
	zF3iGO5xgGNVywqcEloaEUDN30uGrq2j/EHFP1p45CHnjU+3qXsNaH5rKlxokwyH1AsImReviLG
	1v2WX0Ih3vwB0VARw4EiuQe/A==
X-Google-Smtp-Source: AGHT+IGJHerhY1ys1hn8/V3TkFHhEbPbkgZHzY3kFbXZSLcPo/U1Nws0n7oq1SwARwLhYfdcHrxddQ==
X-Received: by 2002:a05:6402:13ca:b0:634:5297:e3bc with SMTP id 4fb4d7f45d1cf-63c1f629a40mr17634517a12.6.1761040732108;
        Tue, 21 Oct 2025 02:58:52 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949bfd3sm8865958a12.41.2025.10.21.02.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 11:58:51 +0200
Message-Id: <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
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
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Taniya Das" <taniya.das@oss.qualcomm.com>
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
In-Reply-To: <3854e3a0-744c-4317-a6ed-e28edbabc4a3@linaro.org>

Hi Vladimir,

On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
> Hi Luca.
>
> On 10/17/25 17:05, Luca Weiss wrote:
>> Hi Taniya,
>>=20
>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>
>>>
>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>> Hi Taniya,
>>>>
>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>
>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote=
:
>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX pow=
er
>>>>>>>>> domains.
>>>>>>>>
>>>>>>>> Are those really required to access the registers of the cammcc? O=
r is
>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicab=
le
>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>
>>>>>>> Due to the described problem I experience a fatal CPU stall on SM85=
50-QRD,
>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it =
does
>>>>>>> not exclude an option that the problem has to be fixed for other cl=
ock
>>>>>>> controllers, but it's Qualcomm to confirm any other touched platfor=
ms,
>>>>>>
>>>>>> Please work with Taniya to identify used power domains.
>>>>>>
>>>>>
>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>
>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>> need multiple power domains, or in general which clock controller uses
>>>> which power domain.
>>>>
>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>
>>>> That'd be highly appreciated since I've been hitting weird issues ther=
e
>>>> that could be explained by some missing power domains.
>>>>
>>>
>>> Hi Luca,
>>>
>>> The targets you mentioned does not have any have multiple rail
>>> dependency, but could you share the weird issues with respect to clock
>>> controller I can take a look.
>>=20
>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>> again, but again hitting some clock issues.
>>=20
>> For reference, I am testing with following change:
>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.z=
apolskiy@linaro.org/
>>=20
>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>> on this phone - results in following error.
>>=20
>> [    3.140232] ------------[ cut here ]------------
>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:=
87 clk_branch_toggle+0x170/0x190
>>=20
>> Checking the driver against downstream driver, it looks like the RCGs
>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>> downstream, but changing that doesn't really improve the situation, but
>> it does change the error message to this:
>>=20
>> [    2.933254] ------------[ cut here ]------------
>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:13=
6 update_config+0xd4/0xe4
>>=20
>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>> iface clk, could something like this be missing on sm6350?
>>=20
>> I'd appreciate any help or tips for resolving this.
>>=20
>
> Recently one particular problem related to MCLK was identified by me on
> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not possi=
ble
> to toggle MCLK clock enable/disable state, when TITAN GDSC power domain i=
s
> set off. I'm working on fixing the issue (a change under clk/qcom), since
> it's of an importance for a customer as well.
>
> I can't be totally sure that it's right the same problem as the one repor=
ted
> by you above, but it looks very similar, as a fast workaround please cons=
ider
> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you th=
at
> this actually helps would be nice to get.

Unfortunately that doesn't seem to help on sm6350.

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm635=
0.c
index 12a469ce7e2f..cf87ad55d318 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc =3D {
 		.name =3D "titan_top_gdsc",
 	},
 	.pwrsts =3D PWRSTS_OFF_ON,
+	.flags =3D ALWAYS_ON,
 };
=20
 static struct clk_hw *camcc_sm6350_hws[] =3D {


$ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
[...]
titan_top_gdsc                  on                              0
                                                bps_gdsc, ipe_0_gdsc, ife_0=
_gdsc, ife_1_gdsc, ife_2_gdsc
    ac4a000.cci                     suspended                   0          =
 SW
    ac4b000.cci                     suspended                   0          =
 SW
    genpd:3:acb3000.camss           suspended                   0          =
 SW
[...]

but still the same clock stuck warning...

[    3.093431] ------------[ cut here ]------------
[    3.094614] camcc_mclk1_clk status stuck at 'off'
[    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c:87 =
clk_branch_toggle+0x170/0x190

Thanks for the suggestion though.

Regards
Luca

