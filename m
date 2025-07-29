Return-Path: <linux-arm-msm+bounces-66966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F406DB148A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 08:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11AFC179A68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 06:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8492265CC0;
	Tue, 29 Jul 2025 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="26X3Idx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262DB264618
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771796; cv=none; b=TEruObqwHKooHIriwLZPXPLKZGg4MxrWDgH2U+4ztmPmv37GckGeUtk8LNyMn252u9MyjaEoGYwUrtMhx7VNOs1acCjfT7XEpHvRF8PnpLOuI0wxA9NZZU8uHjRlH64xYrNjy6I94diLcVWP04BdP2w9VF7UHapdL40IaX4DVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771796; c=relaxed/simple;
	bh=EOhJI4XE7EmddrlB9TelXwBH+e7RrRI3HJn7pIRR/rk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y7jcdELu8t0jwJ2j/LzhOhaMCiURoittpXoFWQt0TxuXkyfuJAcGCIzn8XsEwgnYy7xitUtNSzv3HZq4S8npk2pC/fxiEasoyhOFSIzi5b7kG2lW/xPlZbPX1SkaaLc1H1UrwPMjKT1Pxzfv7OOENuBc47SkAKiT1Z2A/SP4gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=26X3Idx1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0d7b32322so865579366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 23:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753771792; x=1754376592; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=26X3Idx1BYDQEUjbe/WE12+rsByQkqNFRz9t0mlCCQMZcoOMcqWZUQPITGUIMcjFCT
         kl5I5w2g7pXjhwftBtc7hLyZa8CRpe+QUDlYBvdklu30eZJu2CJTYVHQJIrYSo412gjH
         5HJW8KmTF5XlVXAraB7W3dm/STPlocv5C0W4f/fuDkwq9fdi4B/EN3HwvmUODcqpSVUt
         ScJcdmrKeVrOljbrRC6Y64732dH12RV/cuw3wZ3adkVhU5YuDCmE9CBGuvLP1hIffyzv
         x++sHYcjLcoYCEGOCfwWjjNJjKQQgciew/AsTgBxb1s8gm0ClBaAIAUlth25CWEI+bfe
         TR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771792; x=1754376592;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=MviG5YCOmgmpJr2gKrijswOgcXb7box5gUEnbHU1XRKZs+zGofKDShiGZHVevh+C8q
         A5HWdbqFpYUj92X3q63eNOtroLd2WiRmMpIkHYWcFVEqYLV9Y/zmcVFQVzwQGJDGilfX
         XtFVTGjmAALxokXi3xfK5Us8YF7HuBDNMbBgE9tuvFKV4CFm+yWHgRz0LaWqnaDKnecp
         zJv0MegW2ww91zWEKX64dgRCBy9UFTA07YQsTzRePjbctM87Bm2sCiWYZTH0V+XYjsXV
         NaE69T+0HhtYS/0Xh6GuRDHNVyIg/RxLJLa1LMJd8Qb+eF3L+cUQ22DCfwXqpKT8mNeA
         8SRg==
X-Forwarded-Encrypted: i=1; AJvYcCWMCPaulbTpbkt2Ws67XA4Qfr0zWkPvPd2V00k1SyGfvzMiO9SsoSut8hUwo0jeE7LhdCUU6/ZiDvb+WB4O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IS6ElgMIdRmygQdCOf3JmB88iWFotUKztKb/+3N73+qG7qtj
	2TNrHaRLpRohRuwsBu1AkKT9QQt5hrNcHsQXxap/NiCkb1tMgkz897IQQHVNtp9m1yE=
X-Gm-Gg: ASbGncsWOwww2u7vPxLHTTB7k988R0XkaKF4CgIjnV+iUN6NDQic4VykeEzo7EOrqMJ
	uKZ1dGXXehfWmtu4rtUogJcQX2u2mslRfaG3sJLjtbLdltsKLuKnoVgY/9e6e4kXPoSaA3o7Y/g
	/rcRVvZyBkhnlt99klXbeQEDyDBJ5Lj34H+MooxgIeT34qhwp9ELosfv5avO/2hC/MAVqL/JAMl
	nKLcgb2kWkpFPcfyZ0c3oUaSWXwdMuBHqanjcDVXYVjJC6BuojNmY5/5L+1iBTr1453MaTLndSF
	TSIRbs9m56P0i8LmHim896PZYqNjUYWZewamg3Cr4RcBYgBEcUrb4TMuuVxh26Nee8zlyKdymMv
	T1fvwUq81VFhIraCLt0CWcgEkuPoVvhNe8PQtaI1PhwOtoKQxjrCgpxAiRtkOP+i4SQE=
X-Google-Smtp-Source: AGHT+IFY1cXRHhDZKmmaOPFoMzRlis7auiB0SY6wze0NFezD/noiXwvsAjKX3xVSDeubNvW/ghlrqg==
X-Received: by 2002:a17:907:868c:b0:ae0:da16:f550 with SMTP id a640c23a62f3a-af619d062b6mr1776275666b.49.1753771792232;
        Mon, 28 Jul 2025 23:49:52 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600b1sm546209366b.7.2025.07.28.23.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 08:49:50 +0200
Message-Id: <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Will Deacon" <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Robert Marko" <robimarko@gmail.com>, "Das
 Srinagesh" <quic_gurus@quicinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>, "Amit
 Kucheria" <amitk@kernel.org>, "Thara Gopinath" <thara.gopinath@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
In-Reply-To: <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>

Hi Konrad,

On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>>> Add a devicetree description for the Milos SoC, which is for example
>>>> Snapdragon 7s Gen 3 (SM7635).
>>>>=20
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>
>>> [...]
>>>> +
>>>> +		spmi_bus: spmi@c400000 {
>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>>
>>> There's two bus instances on this platform, check out the x1e binding
>>
>> Will do
>
> One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can't
> reuse the existing PMIC dtsi files since they all reference &spmi_bus.
>
> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
> connected to anything so just adding the label spmi_bus on spmi_bus0
> would be fine.
>
> Can I add this to the device dts? Not going to be pretty though...
>
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index d12eaa585b31..69605c9ed344 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -11,6 +11,9 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "milos.dtsi"
> +
> +spmi_bus: &spmi_bus0 {};
> +
>  #include "pm7550.dtsi"
>  #include "pm8550vs.dtsi"
>  #include "pmiv0104.dtsi" /* PMIV0108 */
>
> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
> other designs than SM7635 recommend using spmi_bus1 for some stuff.
>
> But I guess longer term we'd need to figure out a solution to this, how
> to place a PMIC on a given SPMI bus, if reference designs start to
> recommend putting different PMIC on the separate busses.

Any feedback on this regarding the spmi_bus label?

Regards
Luca

>
> Regards
> Luca


