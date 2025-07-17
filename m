Return-Path: <linux-arm-msm+bounces-65429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADFB089A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 11:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9FF189BCE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC48F28850C;
	Thu, 17 Jul 2025 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lpcGqe8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6680235354
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745579; cv=none; b=OV20d19oPf+t6HyDCumjf2KnylY/+c+XdD0C9g54oTBpBmYycLRMRKB4rmd0gCghTsowznqV8XKvXIik6hVSYrkaO0FUUdePVtedHnVZcnwoSCNMZrz8D0GraLCV/L6gT7ZURWNIIiWguO3v1++Ozzak5jxWpd4tjISt5VeG8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745579; c=relaxed/simple;
	bh=SNKCNuS07yOhNClyun4AtdBr5+gzFNw6Inn1wst24b0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Tj92oZJdeU0qbA7iWPF0fTpQeYvFcUInnKsGXU3dBeUov7UXkgu+mlsKl4ZNzkk/ncbNU48j3us2evAAhK1jq1c/Ux6TYiS+9A/z31OigRO582y5oTGCoxuts6ywtwg3qSq9ptYn637tUNmEzZ9PeAsG5/PwwWYPx0CuHyPXNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lpcGqe8b; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0c4945c76so103527166b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752745576; x=1753350376; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ru/mu5vOTULTD4H+wkh3KmAvhPvotp/lHqkpBJrbBE=;
        b=lpcGqe8bgzQXCJRH9llp8Wup0wahZZ63GZPfBMKuG5xnp5YCX9DgnGmM99AkY0Xiau
         EelPRHsz9UXd4sdm+3caaj8q5YSYNJbEHVXpAoEhMSXhHeCOatKCgK+1P7VNccezQNOR
         idb0Y6pN6yRPvprw/fyvhIivt7bRpNQKXLj85ncRd59+JvsVv/sI7jbcQpXlrNnwnKsx
         /vv61S6PR2F/l/gNOEUXp6lerExDqD/v1LtJzhLIPmUhyE3oKwn5RzWxppp7vNsk2q0n
         ImL/G8IFhPWV0SOX5e5t9Q5MP81EamOv8NuaL21bDHyArTjzwwPj5OvTME0Z2tv2gMlQ
         WN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745576; x=1753350376;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ru/mu5vOTULTD4H+wkh3KmAvhPvotp/lHqkpBJrbBE=;
        b=Ivc54kOBluvaYhyYRCOsRfvqDQSCuMxNt7NYrVbj//wQU7195hZPxeT74nwLH/xHLL
         vmqMjrzB0fSipxrBJ18vuX0AUPkP/5p9QDytfR7FXrE8H4fzYvFis4bVpO/DAbb9d+/2
         bQA2fewscwy9X2v1q23XthvLD8PiPUGeOPXR39otJFH+kEJ6GSw8gLskmtLEY2s6BVTR
         3vvUayS3hwvxjQ/RZMMHWdYOM6tePgsjiD2vBc/WXtwcPp+S0gXgsjeH+q2RX3MjiZxh
         0LwqfqQVG0mhTLf5iLWtnFgJjc7zomvhm9Bd43Mm8GGjlOvSEsX1xViqL/LuuJx1mMyv
         9KKg==
X-Forwarded-Encrypted: i=1; AJvYcCUm5tBMNpamQ7cmdTvVpwEYwiuLmmCwfw7gC+e0Va8vK0KgMSfnM7aql3fM5X36hlFJ+gs20XKAg5E9he+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CuUG7xapPljPRNuh5rWWvMc8nluizqQrEr2VyHM03+UHo4iP
	PirRIuqCEM8VIhvtjgEzIT2AXMEhOigYvS8zfOWawr2q3vZngo1HSWh722f99Ikt0hE=
X-Gm-Gg: ASbGncs6Kgj2GcHeAzYZAjFVbWi799Ces5ePhcKM3nsSMUNRYcSw3pH/OzNF9iPAWE8
	4BILGDAYyhS3+aEYuS4sW8cQH7+eF+hY1oJPlE0h0fi+uyAbyw/fvZdyqloS3BGhUcABpDd5FJ1
	Q4n99kAj26R2gYnKoz+RcX0K81WuXea08GezDghULH2U9ajq3Gcnk89QVPG3CDPnQJiM7gb+SIW
	PDHRBlHkteapqILnnMZ4IvMi1zZF9XIbwoi7A+jNTnVkIP43I/cc/jss+a92lkV9X+dG4JW24xw
	+Hpdyqlg7TZ0y+1PlxzcSmQjEZro7kkfJL9xGbp0oTWipSWwMcMx9UaIzbsFRQaRhANMwPmvba4
	uphYp2isuHEsclDP3SwSwJqKDgZ4c0Zc1ypwNI6PO2bdtWoBKPGmHGN47
X-Google-Smtp-Source: AGHT+IFFJ+Gwq77Z/PIy0XMlE+NNaiR8R9S0OSFVxrU0iuecWvqgNe/XZ2Nw4b7IKr3qQanK/C4caw==
X-Received: by 2002:a17:906:af16:b0:ad8:87ae:3f66 with SMTP id a640c23a62f3a-ae9ce1d8ba4mr400610566b.60.1752745576031;
        Thu, 17 Jul 2025 02:46:16 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bb2sm1333325866b.114.2025.07.17.02.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 11:46:12 +0200
Message-Id: <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
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
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
In-Reply-To: <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>

Hi Konrad,

On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>> Add a devicetree description for the Milos SoC, which is for example
>>> Snapdragon 7s Gen 3 (SM7635).
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> [...]
>>> +
>>> +		spmi_bus: spmi@c400000 {
>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>
>> There's two bus instances on this platform, check out the x1e binding
>
> Will do

One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can't
reuse the existing PMIC dtsi files since they all reference &spmi_bus.

On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
connected to anything so just adding the label spmi_bus on spmi_bus0
would be fine.

Can I add this to the device dts? Not going to be pretty though...

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index d12eaa585b31..69605c9ed344 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -11,6 +11,9 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "milos.dtsi"
+
+spmi_bus: &spmi_bus0 {};
+
 #include "pm7550.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmiv0104.dtsi" /* PMIV0108 */

Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
other designs than SM7635 recommend using spmi_bus1 for some stuff.

But I guess longer term we'd need to figure out a solution to this, how
to place a PMIC on a given SPMI bus, if reference designs start to
recommend putting different PMIC on the separate busses.

Regards
Luca

