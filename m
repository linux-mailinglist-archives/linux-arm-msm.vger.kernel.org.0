Return-Path: <linux-arm-msm+bounces-5879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B381CB49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 15:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C20E5B22B70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EEB1CFB7;
	Fri, 22 Dec 2023 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxaPrVTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E6D1CF98
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5e730eb1770so18183167b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Dec 2023 06:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703255172; x=1703859972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/WcW7kl3eKiFx2yQXtYtkkJpmLb6u8OiRxqotQfMNeU=;
        b=PxaPrVTrqhGotIJ43C9XJvk6A7q+ONc/W5Q8EoKEv98ZLNQP1GweTFQ1TpxviTVY+v
         R8DKwPMdMaoj6dOnX4vU8XIGrI9GbRzSKx5XX1l1kCBkjBktGsoZzlsYiUiL1/ItiBjS
         oRxxjNV8JySjFoykCvjId4D08dcYlqTn0ei1T0wKM0VS3cOmg71sYOjIBgcRYpa+uKT4
         /sEynVHFM3Glw+MZWJY2E1MiEILMK3GsBB6EFaQIT9YOIETOUPhShKAZE1qAWBKKiYIt
         pdUUKjycSQOlauoI5fGSlj1Lxn79r5XjxTufZWqrJU/BQUwon5SJO3dJLmeuFt8M1N51
         vOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703255172; x=1703859972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WcW7kl3eKiFx2yQXtYtkkJpmLb6u8OiRxqotQfMNeU=;
        b=gjlcHayT1yu4l1lssoRy5cL/ecpeLV0NKORsK9bpWtkkIy80+1dlkTPgz+lkk4jH4v
         wd5WRCFWhgQAMnAacdY9eXLOnvuGrmI6Xx+gUduSZRCMGtEhHsqovyP03JvbLjJvxZb9
         oLqdX6enOF3SEKfBCWmTFs4VKrT/6A6LnobmRhl3u9ev2bSGyQfMLqMbOGqy4rXop1DP
         eCWNXr3BhjDNaFTFB2wlCC00YDVomf7TjgW59XmMCceKFiclVlNP0hhpezuYyy7jJMbA
         PTVW2Arf+QXX31N2Kq+Sh4RPffI2rZlUUJoDsTRLCpkPDb539mkfUrNffH67vOqQcWeA
         97Cg==
X-Gm-Message-State: AOJu0Ywggrq9L8HTCremVMQSfZ11fbhU9O/2lkByeRuKjPUfPIA9x5ST
	bWCYRRTmWYXWA03K7ryaAQyYT4khgsFGiHc/sRP9K+xc7My2/w==
X-Google-Smtp-Source: AGHT+IElmB4VqvGYTwCfFZK3FiuZWJ24/FN5SIz6CG19wFyaznlCSm1flL8NO5u4ItlOh+16eYQCNMZKCErxFu4JFHE=
X-Received: by 2002:a0d:ed82:0:b0:5d7:1940:7d6c with SMTP id
 w124-20020a0ded82000000b005d719407d6cmr1298125ywe.67.1703255172509; Fri, 22
 Dec 2023 06:26:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220114225.26567-1-quic_kbajaj@quicinc.com>
 <20231220114225.26567-2-quic_kbajaj@quicinc.com> <d7ae374a-7269-4992-ad44-18b2516cad42@linaro.org>
 <CAA8EJppYuXpqKpTcUda1LBFfBmm40-VpC+3heJqoL82kS=+erA@mail.gmail.com>
 <519138d9-2434-4357-abec-f400b87755c6@linaro.org> <CAA8EJpoEwU_S05EdO+sXekE355d5vAQCO+Vt3iH9yibhqOhH_A@mail.gmail.com>
 <a93867af-80e6-ab91-6a13-cdf94aa7f80c@quicinc.com>
In-Reply-To: <a93867af-80e6-ab91-6a13-cdf94aa7f80c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Dec 2023 16:26:02 +0200
Message-ID: <CAA8EJpp9JWdezk5C7dNrWjTE7HgxZGPthmSxxnBA+i60uY_8vA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-idp: Enable various remoteprocs
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Dec 2023 at 15:25, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
>
>
> On 12/20/2023 6:04 PM, Dmitry Baryshkov wrote:
> > On Wed, 20 Dec 2023 at 14:29, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 20.12.2023 13:18, Dmitry Baryshkov wrote:
> >>> On Wed, 20 Dec 2023 at 13:46, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 20/12/2023 12:42, Komal Bajaj wrote:
> >>>>> Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.
> >>>>>
> >>>>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 20 ++++++++++++++++++++
> >>>>>   1 file changed, 20 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >>>>> index 03e97e27d16d..ad78efa9197d 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >>>>> @@ -419,6 +419,26 @@ &qupv3_id_0 {
> >>>>>        status = "okay";
> >>>>>   };
> >>>>>
> >>>>> +&remoteproc_adsp {
> >>>>> +     firmware-name = "qcom/qcm6490/adsp.mdt";
> >>>>
> >>>> Why MDT not MBN?
> >>>
> >>> I agree here. NAK until this is .mbn. Please follow the example of
> >>> other boards when you write patches.
> >>>
> >>>>
> >>>> I don't see these files in linux-firmware and your cover letter did not
> >>>> explain anything around their submission. What's the status on that part?
> >>>
> >>> This isn't usually required, is it? I mean, the firmware can come from
> >>> linux-firmware, from the device partition or in any other way. With
> >>> the FW_LOADER_USER_HELPER this becomes just the key string used to
> >>> identify firmware to be loaded.
> >> I think Krzysztof referenced the fact that the Qualcomm-made boards
> >> usually came with redistributable firmware.
> >>
> >> As far as my 5 cents go, not submitting the files to linux-firmware.git
> >> only harms the user experience, so I'd always advocate for it, whenever
> >> that is actually possible.
> >
> > Me too. I think this is work in progress on the Qualcomm side, see the
> > discussion at https://github.com/Linaro/meta-qcom/pull/551 .
> >
>
> I was searching for MBN files pushed for SM8550 at
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/,
> but could not find it. Am I missing something?

Nobody handed out the files for sm8550 yet. So we could push only the
audio topology files.

> Are we maintaining it somewhere else asking just out of curiosity and
> learning and do similar for QCM/QCS6490.

That repo contains existing firmware for older platforms.
The firmware signed with the test keys goes to the SoC directory,
vendor-signed firmware goes to the subdir.

See qcom/sm8250 (RB5), qcom/sdm845 (RB3 aka db845c), qcom/qrb4210
(RB2), qcom/qcm2290 (RB1), qcom/apq8096 (db820c) and qcom/apq8016
(db410c).

For X13s there is a vendor-signed firmware at qcom/sc8280xp/LENOVO/21BX/

Venus / VPU firmware, being chip agnostic, goes to qcom/venus-* and
qcom/vpu-* Vendor-signed venus firmware should go to the same subdir
as all other device-specific files.

Generic Adreno firmware (SQE, GMU, GPMU, etc.) goes to qcom/ directly.
Signed ZAP shaders go to the qcom/SOC or device subdirs.

WiFI firmware goes to ath10k, ath11k or ath12k dirs. But please
coordinate with Kalle Valo, he maintains those subdirs.

BT firmware is piled up in qca subdir.

All mentioned files except the WiFi have migrated to .mbn format.

All licences are documented in the WHENCE file.

-- 
With best wishes
Dmitry

