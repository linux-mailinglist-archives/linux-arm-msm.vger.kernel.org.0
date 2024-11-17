Return-Path: <linux-arm-msm+bounces-38126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A379D03E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 13:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E4F22831C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368EB17BB21;
	Sun, 17 Nov 2024 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpCVL7zd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752B17C224
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731848243; cv=none; b=JV+6D3OooGXWmfHcs/N2No6G11fApK9JuMudlTENBtKlvKdAgF7eUiq2NSeuhki5hdzLJhqUfuZRFLF/sGFqQgm7FVXJIrqYTaU0pDkVBd8PN2sewSWylIxTJaULdnKR/Rwo5qyCQXZBZf3ciDjO33oYJcPIeWb08+AwTk6TrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731848243; c=relaxed/simple;
	bh=6C2Vh6o628jIpNAhtgDsohB1br8pAS8SVtDQf4a9oAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FM/mtEa2FYBjCSTP4CjsXvCZb71N1HK5QAMtkIbcluh+x/LdEZENgnAzhiNZOwGoQZQqNHIYemxBRFBeiAlQL2xpgD2NvAqIUygPTkAnR8Tb72ByjY65Lpbktcxhahlpl9uY9FYEWCOz926mkiD85M+teZ0vRc42SlTT2oX/h/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WpCVL7zd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6eb0e90b729so10417057b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 04:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731848240; x=1732453040; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NodmpFT+qxaaF/PGLm9mRIZsGR/VQH6X8ujv94bXnj0=;
        b=WpCVL7zdHPiD5aSY5K6S7ElNDcKRprQAN3bsExpBtfLlnHjecB64XyEqtoK54GQfyJ
         3vhlRSBCl6g28OQR9zxXf+iSC/aG8URhIAbs06NNuqcIPFvt7QF/jAXMSCqZg0ISU+Lo
         38HVaZs3UuBnAXkLEj8k9u34KOmmwstD4CoLgOTVgLwlbXeybCNmxB+mAMXN5D7wvv+d
         vABuDqzjUC5J1B22MtHDb589hwEGpLX2CYyB6VAo7SRLtGCNpULQV8VkBQyBp9aYdZkj
         2g/PjKyrQH8e7RkUhWM9dbsOC4BmsOlMQHFHZVCiyQ3dPIeHlONcdyvQ21mzkGfEv7uO
         bc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731848240; x=1732453040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NodmpFT+qxaaF/PGLm9mRIZsGR/VQH6X8ujv94bXnj0=;
        b=FGj/cEWkVz2AZmGAdRJk6gLk7DLJVHN/E5RmGNI6i6mFNPKaqhQMZnuKqhzp64BFBZ
         ExS3eiKlVtsOVp82XSMofNfDpKqitJfW88qzWyk5rPGtrdtDUxwrdvh0Hze7xu+pVEGf
         rUj78AxHFXpYGrb9XFpORMfuSWmB5crfX/QzLWTtElaX7714M6rE8BI4O7o9fVpnZXsv
         ASSzrGzbOCVu/Gehcyn0vGS5Glc7KRZnFgXcQ4WrjX1tQaWLsKCxpR+uRi9jN05F0oaG
         uuWjeS+iZ0H5pJN+bhEqJXrPwdPfrStwpka6Ni6jhMF9mbzE9DhE2FDNREFIsEWt057P
         Q5sg==
X-Forwarded-Encrypted: i=1; AJvYcCXT1Zfk5Tn/DoSp+hY6FgQwiJpHr09m3np8QxZGj6pEP9/UQTYfeu5NYtPIN5WDPhOYB+VWi9gutBzcjXPq@vger.kernel.org
X-Gm-Message-State: AOJu0YzA60JIzwRLXoLexh9JN+lNzVxeZaccPpaGnR9lMqQWPUyuj5w9
	S4e1KePfOzzVCLWfOMH8HyBpqzXmjfEt5vCvsNcNRhOys+i75w4MyjK7y8pkdIhJiXBFwdW4Six
	BA6t91OpOGDDHGvh2k35uD9pJEUloRpJyo8Telw==
X-Google-Smtp-Source: AGHT+IGHhP6z6uzaMe/SjD7VuC2yupm/LLWj/hEg1VYAOasj1HmGbygRyNh0RqshUk1xmkg0eGSyb+eZTIFDMSpJNeg=
X-Received: by 2002:a05:690c:4b86:b0:6e3:2361:df8c with SMTP id
 00721157ae682-6ee55f1c99dmr80383367b3.42.1731848240497; Sun, 17 Nov 2024
 04:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115091545.2358156-1-quic_kriskura@quicinc.com>
 <ibh3n7gl5qcawpiyjgxy2yum6jsmfv5lpfefuun3m2ktldcswl@odhjnmkj5jre> <51f7cfa8-3362-46e3-a9e5-e43d585d4ac0@quicinc.com>
In-Reply-To: <51f7cfa8-3362-46e3-a9e5-e43d585d4ac0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 17 Nov 2024 14:57:09 +0200
Message-ID: <CAA8EJpoxzEdJ5d8RtEb7a6=NHvCVhnisK7QLpqpp8EBHAvsBhw@mail.gmail.com>
Subject: Re: [PATCH 5.15.y] phy: qcom: qmp: Fix NULL pointer dereference for
 USB Uni PHYs
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Nov 2024 at 13:51, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 11/15/2024 9:29 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 15, 2024 at 02:45:45PM +0530, Krishna Kurapati wrote:
> >> Commit [1] introduced DP support to QMP driver. While doing so, the
> >> dp and usb configuration structures were added to a combo_phy_cfg
> >> structure. During probe, the match data is used to parse and identify the
> >> dp and usb configs separately. While doing so, the usb_cfg variable
> >> represents the configuration parameters for USB part of the phy (whether
> >> it is DP-Cobo or Uni). during probe, one corner case of parsing usb_cfg
> >> for Uni PHYs is left incomplete and it is left as NULL. This NULL variable
> >> further percolates down to qmp_phy_create() call essentially getting
> >> de-referenced and causing a crash.
> >
> > The UNI PHY platforms don't have usb3-phy subnode. As such the usb_cfg
> > variable should not be used in the for_each_available_child_of_node()
> > loop.
> >
> > Please provide details for the platform on which you observe the crash
> > and the backtrace.
> >
>
> I got this error when I started working on multiport support (begining
> of 2023). Initially I tried testing on my code on 5.15, hence this patch
> was raised on the same.
>
> The 2 qmp phys on sa8195 and sa8295 (based on sc8280xp) are uni phy and
> the following was the DT node that worked out for me on 5.15 codebase:
>
>
>         usb_1_qmpphy: ssphy@88eb000 {
>                 compatible = "qcom,sm8150-qmp-usb3-uni-phy";
>                 reg = <0x088eb000 0x200>;
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
>                 //status = "disabled";
>                 clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
>                          <&rpmhcc RPMH_CXO_CLK>,
>                          <&gcc GCC_USB3_SEC_CLKREF_CLK>,
>                          <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
>                 clock-names = "aux", "ref_clk_src", "ref", "com_aux";
>
>                 resets = <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>,
>                          <&gcc GCC_USB3_UNIPHY_MP0_BCR>;
>                 reset-names = "phy", "common";
>
>                 //vdda-phy-supply = <&L3C>;
>                 vdda-pll-supply = <&L5E>;
>
>                 usb_1_ssphy: usb3-phy@88eb200 {

As this is a UNI PHY and not a combo PHY, the child node should be
just phy@, not usb3-phy@. See
Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml

>                         reg = <0x088eb200 0x200>,
>                               <0x088eb400 0x200>,
>                               <0x088eb800 0x800>,
>                               <0x088eb600 0x200>;
>                         #clock-cells = <0>;
>                         #phy-cells = <0>;
>                         clocks = <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
>                         clock-names = "pipe0";
>                         clock-output-names = "usb3_uni_phy_pipe_clk_src";
>                 };
>         };
>
>
> I was hitting the bug when I write the DT above way on top of 5.15 baseline.
>
> In 5.15.y, the SM8150 usb_2_qmpphy dT is as follows:
>
>                  usb_2_qmpphy: phy@88eb000 {
>                          compatible = "qcom,sm8150-qmp-usb3-uni-phy";
>                          reg = <0 0x088eb000 0 0x200>;
>                          status = "disabled";
>                          #address-cells = <2>;
>                          #size-cells = <2>;
>                          ranges;
>
>                          clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
>                                   <&rpmhcc RPMH_CXO_CLK>,
>                                   <&gcc GCC_USB3_SEC_CLKREF_CLK>,
>                                   <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
>                          clock-names = "aux", "ref_clk_src", "ref",
> "com_aux";
>
>                          resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
>                                   <&gcc GCC_USB3_PHY_SEC_BCR>;
>                          reset-names = "phy", "common";
>
>                          usb_2_ssphy: phy@88eb200 {

Just as I wrote, this one correctly uses phy@

>                                  reg = <0 0x088eb200 0 0x200>,
>                                        <0 0x088eb400 0 0x200>,
>                                        <0 0x088eb800 0 0x800>,
>                                        <0 0x088eb600 0 0x200>;
>                                  #clock-cells = <0>;
>                                  #phy-cells = <0>;
>                                  clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
>                                  clock-names = "pipe0";
>                                  clock-output-names =
> "usb3_uni_phy_pipe_clk_src";
>                          };
>                  };
>
> IIRC, when I tried using the above sm8150 dt on 5.15.y, the phy_create
> was (either not getting called) or crashing. Probably because
> "of_node_name_eq()" didn't find either "dp-phy" or "usb3-phy" and cfg
> variable was NULL.

Unless somebody backported some patch in an incorrect way, the SM8150
DT entry is correct, while SA8xxx is not,

>
> I can try reproducing the issue and get back again in a week.

Yes, please.

>
> Apologies if I have misunderstood something and this patch doesn't make
> sense. Let me know if I have made any mistake anywhere (either in my DT)
> or in understanding.
>
> Regards,
> Krishna,



-- 
With best wishes
Dmitry

