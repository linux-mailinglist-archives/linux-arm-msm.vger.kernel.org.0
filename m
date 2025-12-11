Return-Path: <linux-arm-msm+bounces-85069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58ACB63A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 984E73004D3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62291248F72;
	Thu, 11 Dec 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK5j8pQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9020A24A04A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464103; cv=none; b=kKIE/eTNYeza/KOqNQfY9hcVXSXiUp3xSvJYt18Zz6jdKTBeZ+9JPzQWrZ/rzs6IYOu/x66X54sA9e3SbwRJ+/ojghHVqOo57zSK/I+r7F9os/qlg91yHMEhLFZN2p7bonFySNzbcg6YqFNbVIAGTv5380sYvsrfQkIqEnu/nuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464103; c=relaxed/simple;
	bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzyRGaSROu1+qjfFzYBuGcA95D5nMt06+ORy3+m1Tg+PbKu4k5N6j0ntbCOU8S/h5b2dJYfIIZfp4BPhdOjVF7T1XPxCZuCQwm0OEWMc5DypPqKZKLvFsBEMlVsmT296Xt3ErNrG6aAI3tl/cQtIwu03CDdSNOhayeYvYH7S9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK5j8pQr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-598eaafa587so178218e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765464099; x=1766068899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=YK5j8pQrSp19WFlSsShgo5pF1l74Owhrzfy81Qmeoz7jkXoSK+nHX+q1uy1WNzXcfA
         bJYdp9DavVMCNDkxA0802rfW7bVS3orM2QsIQs4mXOH9WmPpGMzS6jylyjPW+ncHq0Ih
         IngGy3QhsyYH55xHt1cEaijdQuWoPUOIzPz+8b8IHKeJcWS0wxkMW/mqmIWLJ2OQ4xN+
         xXEZJ035bT8ciuX1cOXurRCyk3zEUDCwHaxzhHBveslyhv9aNYAouNilUJ5xv1VoQ602
         E/RNghQdGnLXpkXg9LUGpyLac1wStq+KqfKqv50Kfn8cpsZX8Cy39gmAFIRggo9utTNr
         0lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464099; x=1766068899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=fOBbdOxkaECdYjwYGA88KAPiLQSvLkvC3Oy8KTjd7IBQZcnwRiSQSf1FH0ysKVK6FQ
         sNNseq7uZxeExXitytxq2zlHgZzAyliNNmK2cH97AwaoNO84sbOdyQGlPM9JbKepN8kT
         ng63d/FNZIVJUc1OuGCLbEt/CpoHCuMPOgTzglVaSif4vqCNBii/jiVZQdDDEvhxERmD
         jX6MX9EtGyMIHpuTH3IiJIBR4hwDo5dCXM05z3UFqybgVFoFVncqtsAXhIuSA8SBpWiZ
         A6/Q/3ybK3VTbRCr6AncPAjv3pYieuCmulrroUrVMkmuTIGSGJPNIrUIAALLwyAAwXu5
         3O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJf3lJNHHrPXpJ+BVStTimdBIYsA37Mhhs26XVIxKHXEbDdh0Xj77Kce/NZdAbPIWJyOH+UaxpwQVoNGdF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52HEnkriZyZVVWwz4//tLTd80YajY/MeglJI5MxImy9tRaW8z
	jPrcos8nlRR7HsuQ3nT9WAkGj8h7yL5vbwdRbUVWRTL/6DDzhtikaH5RhfRyWc+gJnkxACeMS27
	ZysPZgOI9tvVN0IpddAvk9/R+H0V/A0g=
X-Gm-Gg: AY/fxX5WRB8wTfKGMB4sEPBJlYaIbhzac29h454+Pb6M2WMySyXpHFgBPEQwQHKYE1o
	EBEoOAGFfGQfZrQzt8qmRjaTS98dJGXQmw/Ovgn/x1kmrAJVSuFPjdEDA8+QLBiDMHo0NqttXxK
	nFuQ24kGv8Ncs9EUc8stu2GNo1uiWRUdwMDsGXazcK2Nt7Q+A+uaUSiGUJQzgMjz/DMP5/YNU0z
	3OqxaRfpZ+FsiD7IUk0IVgfIG9MZhokgtK6+gNQ25TV6qAYXw6P0UGKsxGJvp0mk2tyd5v90AkN
	nu5O
X-Google-Smtp-Source: AGHT+IFiIR+iIsV4mJ6qVbYZvp4StuXMH2zma5BiBkgrZg+TTdcuperTYP94aUirT3N2xa/3hEPBPBBlokr7QfLebLc=
X-Received: by 2002:a05:6512:61a1:b0:598:f85b:b12f with SMTP id
 2adb3069b0e04-598f85bb2f2mr223765e87.38.1765464098416; Thu, 11 Dec 2025
 06:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu> <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
In-Reply-To: <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 11 Dec 2025 17:41:26 +0300
X-Gm-Features: AQt7F2pajj9Y1bhJt30iOkjeSJDSjern_i-FqbzQqEVWSt5mgRNTFkDTUxa7MnY
Message-ID: <CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D0=B4=D0=B5=D0=BA. 2025=E2=80=AF=D0=B3. =D0=B2 19:33, Konr=
ad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 12/7/25 11:35 AM, Luca Weiss wrote:
> > Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> > reference for the SLPI PAS.
> >
> > The Linux driver unconditionally tries getting "cx" and "px" supplies,
> > so it actually is used.
> >
> > Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 =
use CX as power domain")
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> > There's literally one board using this upstream, judging from that I'm
> > not sure this is a misuse of cx-supply or what exactly. An alternative
> > to this patch is of course removing the usage in
> > sdm845-samsung-starqltechn, but as it stands right now the patch under
> > "Fixes" introduces a dtbs_check warning.
>
> FWIW that's likely a hack (because IIUC it needs to power up some
> regulator for the sensor devices to work) but that's "fine"
>

I confirm this probably powers up devices, because firmware boots fine
without cx-supply.

--=20

Best regards,
Dzmitry

