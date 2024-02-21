Return-Path: <linux-arm-msm+bounces-12114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7E85ED6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 00:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666AAB23C66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 23:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B0F12D763;
	Wed, 21 Feb 2024 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhA3ETk3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064C12D752
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 23:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708559426; cv=none; b=eD6nksjQqhC1tv45kUFKnKidFDZIUjDkDfGc4TVVVs1gRmmbcMx6wlvL0xnCfIBGjl+p/9vSvbYgAoMVI8yOpWzz733B5muMebPWDxXt1ZmH4Agt6rubr9jhwVmWAVi+KDQhN46HBoa+QAiYbbJ1+WHLoMKjTYris9+jCq0WDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708559426; c=relaxed/simple;
	bh=y3MIWBK0YFitBa1SLGaOLrvzg2gVwOMZAiNBj6d1t2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQs0H0Qq9T/w9wBQ0Co8K6kV/1JJqffjQ3QOiLy0FbhbXpqxnmq6Ur/eXZDcT7n6C52mIY231y1W3VcEYgao6iG2tHpacjoIq2NVS7BHSkbQhRwyNGmSMTW0UCH+FmkF++EYGJyRUlLLUzRrvLR6O4+RiwwQIg/g+Des+LelC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhA3ETk3; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso5876885276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 15:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708559423; x=1709164223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XpZt7hzwc3jNcQDwZUZ5vMVTQ3xQ4U9NKZbGKi742g=;
        b=NhA3ETk3NVvQ/4D4ROhT9QG3s9Ax5+t5GQuNDlKakQGiBJnR9NOEWkyYqYOTw5hlkN
         w0Y4qSSStdP7900XKsYL22AOoEO8IB/sNr/0Xb9EUL1uYg7JqqRUle8KeXcCeZT8lJCH
         k220zewx2vNIncGdPkbuxPSdaMMZx6zGegdkwi/fqzdWDEritXZFlYCH7sWhwb1htJFT
         0++fC0Lsya9GGAzuLQR1joLUy420z+u2cI2GKKnaxeaedSKbJF2Psxb978GRpGdlbb0Y
         D5VEDufNXFqzpInzOSmQn8i2bfI+Y+El2XWxRsdYFZFNy2Lkafa3trrzb+XZaqMUwfwD
         fKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708559423; x=1709164223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XpZt7hzwc3jNcQDwZUZ5vMVTQ3xQ4U9NKZbGKi742g=;
        b=eu8HbQFDO5to/ExnFfErb7mzozPpQ94jYg5pH8o98RbovVwkGggMIObHDjrsVnfu22
         rPse90CRA7KKW2hvKVmQO09aDVdHAhxC0PvMuUYN5pXGy1dlS9/I5pIVKggUueEGWQdb
         7ABMHoLDGTaw21rzN5CkC9pHdcQLWg2XjwjroI4Mx0MUlnrSw/UPjGfm2a1sw8NlkClW
         GmKPUIPlRu9FXW7sCZA1dfaS4bMCOMBnVP2KXHAzA7a1TqkL+5hs6RrNO4Er7OSs3+yU
         oSvLwQbH0LCI7Ex7MESVe58Usk7yM8QNcd0CjEe9Kti5RpSP2izLmfYZ+InFwddhU23M
         hLJg==
X-Forwarded-Encrypted: i=1; AJvYcCUIpd+Z2UjF71siHgkC/thx1WAeuZqlU+YdpjbLl0DoGW31x7+XmLr+Q9dMFdyuHQL+8jMFiDz0OT31RV9DpN/BsjWPUX/+dlq8ChGswQ==
X-Gm-Message-State: AOJu0Yz+0zxv/B3ylGrC7PYsi1zciKRTOQUsgkuGpiVxPkvFZYQgGycr
	/M8EOuQPbVmZRhgF89x8cJR4Sm/AhxdGh54ZKrkKBcTzUa1WhK+6IgzxUIrQPNiBkVUDFxnzwNK
	Kh2WZrrmRItQo1DLdILz+/bfga6vlG9tBCsJsjQ==
X-Google-Smtp-Source: AGHT+IGFCpzYN9Tvhba/FP/G+LXkXROeoh+7TE5DeZAwGefezlUG4taS3kLJsE2C4lj2w55Q3QXgdigZ/ja3jgLbmO0=
X-Received: by 2002:a05:6902:220f:b0:dc7:48f8:ce2e with SMTP id
 dm15-20020a056902220f00b00dc748f8ce2emr1016956ybb.37.1708559423600; Wed, 21
 Feb 2024 15:50:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com> <20240221-rb3gen2-dp-connector-v1-6-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-6-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:50:12 +0200
Message-ID: <CAA8EJppAVehWUeLAqEAq8A3nq-o2g=8GK--XRVWtDV7-0BCskA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB role switching
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> With the ADSP remoteproc loaded pmic_glink can be introduced and wired
> up to provide role and orientation switching signals.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 +++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index ab498494caea..079bf43b14cc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -121,6 +121,41 @@ debug_vm_mem: debug-vm@d0600000 {
>                 };
>         };
>
> +       pmic-glink {
> +               compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               connector@0 {
> +                       compatible = "usb-c-connector";
> +                       reg = <0>;
> +                       power-role = "dual";
> +                       data-role = "dual";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       pmic_glink_hs_in: endpoint {
> +                                               remote-endpoint = <&usb_1_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +
> +                                       pmic_glink_ss_in: endpoint {
> +                                               remote-endpoint = <&usb_1_dwc3_ss>;

This should be connected to the QMP PHY rather than to the USB host.

Also it might be better to squash this patch with the patch 8. Or at
least to get redriver into the picture in this patch (and keep only
display-related parts in that patch).


> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
>         vph_pwr: vph-pwr-regulator {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vph_pwr";
> @@ -476,7 +511,16 @@ &usb_1 {
>  };
>
>  &usb_1_dwc3 {
> -       dr_mode = "peripheral";
> +       dr_mode = "otg";
> +       usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +       remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_1_dwc3_ss {
> +       remote-endpoint = <&pmic_glink_ss_in>;
>  };
>
>  &usb_1_hsphy {
> @@ -491,6 +535,8 @@ &usb_1_qmpphy {
>         vdda-phy-supply = <&vreg_l6b_1p2>;
>         vdda-pll-supply = <&vreg_l1b_0p912>;
>
> +       orientation-switch;
> +
>         status = "okay";
>  };
>
>
> --
> 2.25.1
>


--
With best wishes
Dmitry

