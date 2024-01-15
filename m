Return-Path: <linux-arm-msm+bounces-7255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011F82D671
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 10:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64EE21C214CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FA8E55E;
	Mon, 15 Jan 2024 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIeVukvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE3E54E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5f3da7ba2bfso81862737b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705312449; x=1705917249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Km0Qtz7q4pHjc67v0RYg5L+Ylsfr/XKzPScLyVzzc6Y=;
        b=LIeVukvySD5Rmx82CeO8DpbZwXc+rJAvX5rdWtSFqvtUts5FtnqIjEDJ4QAPOGg3Rj
         8AD5E8jw9cX2hZPAohLby2F5bSNAZLFqoOaSQ9Ndcr06N58Ito+SjT6rpd5aFVCl/spg
         EG9ydIuZV8h0rnUyrQ9ZTZ/6L6sy1yW3dWgJnCPWNqXowIXZMOZzzWSx83tVODyqoJHD
         Zd//VSrnFL3i4zba7d7IlYHzjtNIUDqUCpM9ff3herThRWFpnYcfuGgkMa8wT7ZIFgly
         ItujrBTEzCT1SkXBgSDlIpIaUEpkUVq3mTkeYCyEF1GHBKtGGx84CHRgpbQvmP+Z7X0C
         aGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705312449; x=1705917249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km0Qtz7q4pHjc67v0RYg5L+Ylsfr/XKzPScLyVzzc6Y=;
        b=NQWrGJeacsA6j8TSbg1hrnSgIvjyMQXiIn1eDscyOVPDppbQ8IZAEm58D0oj0HktIt
         jmnmXusx9sOv9nC0qmuUzCTnfJTL0lnyVvSMynwGZlYExIXTK/JQZBaap/IHWYJ2xiw/
         2PM8JUPh/Kr+hPDBIo8D6MfElC5quNaYugRvFzZC5q5StwkNj8EyrSkV9YE8+fdo1u1A
         k4IE2OAA/vLlHN7swb9jAb5dxzOwMiDLbX+qEsNe25EHVk4D9bLkKYSTjZewPO3B3E+l
         eorFhGapvGpV3xUpDNwwzIRaRWgnC4J6pdJk9KzCrmLcEWLbJbQ6dDUAvmNpNN5Qs+sH
         HVrg==
X-Gm-Message-State: AOJu0YwEhpLX/db7B7UgtTv5jd3x4mTKm+451glPsz5HaURlcoew5u3b
	Xu6x7yk0yIrXXqbrLdE2rEs2veUOPXTw0GCg4lR1CWEcnQP4vg==
X-Google-Smtp-Source: AGHT+IHgPr4mySPIKN0GZxQVkUboa43McGL/GwUZ+1Mj1PlmzOjQHJxG4eujLEV9NPTQruJeaT4oSS/65+x1zvItebg=
X-Received: by 2002:a0d:d74f:0:b0:5ea:448b:cf12 with SMTP id
 z76-20020a0dd74f000000b005ea448bcf12mr3624493ywd.67.1705312448979; Mon, 15
 Jan 2024 01:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112-lpg-v4-1-c4004026686b@quicinc.com> <CAA8EJppdjVRpzrdqm4VOZwUO+khjTdRbY6jN2E2VGmCKSd8inA@mail.gmail.com>
 <8e51796a-49b6-4217-877b-e393d65ff398@quicinc.com>
In-Reply-To: <8e51796a-49b6-4217-877b-e393d65ff398@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jan 2024 11:53:58 +0200
Message-ID: <CAA8EJpr_W2Uj=yU=xxn=5aUm7B6_6DXZnkNHendXa3zW_VL2=w@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-idp: Add definition for
 three LEDs.
To: hui liu <quic_huliu@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 07:53, hui liu <quic_huliu@quicinc.com> wrote:
> On 1/12/2024 11:36 AM, Dmitry Baryshkov wrote:
> > On Fri, 12 Jan 2024 at 05:07, Hui Liu via B4 Relay
> > <devnull+quic_huliu.quicinc.com@kernel.org> wrote:
> >>
> >> From: Hui Liu <quic_huliu@quicinc.com>
> >>
> >> Add definition for three LEDs to make sure they can
> >> be enabled base on QCOM LPG LED driver.
> >>
> >> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> >> ---
> >> Changes in v4:
> >> - Removed "label" definition and added "function" definition.
> >
> > You have removed "label", but you didn't add "function".
> I added function node "function = LED_FUNCTION_STATUS;"
> Don't you mean this function node? I didn't get your mean.

The "function" is a property of the LED (each of them) rather than
being a top-level property.

> >
> > BTW: the commit subject is still wrong. Compare "qmp6490-idp" vs "qcs6490-idp"
> OK, I will update it to qcm6490-idp.
> >
> >> - Link to v3: https://lore.kernel.org/r/20231215-lpg-v3-1-4e2db0c6df5f@quicinc.com
> >>
> >> Changes in v3:
> >> - Rephrased commit text and updated the nodes to qcm6490-idp board file.
> >> - Link to v2: https://lore.kernel.org/all/20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com/
> >>
> >> Changes in v2:
> >> - Rephrased commit text and updated the nodes to board file.
> >> - Link to v1: https://lore.kernel.org/r/20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> index 37c91fdf3ab9..8268fad505e7 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> @@ -5,6 +5,7 @@
> >>
> >>   /dts-v1/;
> >>
> >> +#include <dt-bindings/leds/common.h>
> >>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >>   #include "sc7280.dtsi"
> >>   #include "pm7325.dtsi"
> >> @@ -414,6 +415,28 @@ vreg_bob_3p296: bob {
> >>          };
> >>   };
> >>
> >> +&pm8350c_pwm {
> >> +       function = LED_FUNCTION_STATUS;
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +       status = "okay";
> >> +
> >> +       led@1 {
> >> +               reg = <1>;
> >> +               color = <LED_COLOR_ID_RED>;
> >> +       };
> >> +
> >> +       led@2 {
> >> +               reg = <2>;
> >> +               color = <LED_COLOR_ID_GREEN>;
> >> +       };
> >> +
> >> +       led@3 {
> >> +               reg = <3>;
> >> +               color = <LED_COLOR_ID_BLUE>;
> >> +       };
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>          status = "okay";
> >>   };
> >>
> >> ---
> >> base-commit: 17cb8a20bde66a520a2ca7aad1063e1ce7382240
> >> change-id: 20231215-lpg-4aadd374811a
> >>
> >> Best regards,
> >> --
> >> Hui Liu <quic_huliu@quicinc.com>
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

