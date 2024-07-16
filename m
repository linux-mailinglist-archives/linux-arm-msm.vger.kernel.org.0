Return-Path: <linux-arm-msm+bounces-26358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9C932E79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 18:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05306285926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F7D19F479;
	Tue, 16 Jul 2024 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0S0B9jr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA38819EEA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 16:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721147881; cv=none; b=JP0svT3zonDqzQQqWhU8Yr7RSuvunYlSSpP5ukeDNzAoGlU0WVKGhl07iinD1ahuCFQX8k2jUl45fP2zz6Zz+Z0yVJdOmPQpceKbXnBKLT5EOUYD3sIvzHtIZSYSNuyLy/mINYCLoPIgaDzG/+jQ4QTPv8anEA/UNVGo2w/q7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721147881; c=relaxed/simple;
	bh=q2lkvHitVcy2x8W1nfxNf4cBm3/h+MECP/thPi24Yjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7nlDwa4jVjMml0C5mDggoAc/TIRTTujwXU2voVCMrlw43W1ThbuOdxlPFzwEirIHHgPrffvPcVFeNWEElexh7clFocJxox2jMlqBlbagaJTEzrINrAQr/7HIxk4EI3lTQHC/K1oTs5nNNwl9xUN+9bq4fBj/oRMb/NIpCUTKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0S0B9jr; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64b05fab14eso54888937b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721147879; x=1721752679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Inq9wHo9haYW+I9Tylrr0gohQZyxyP5BU7osayMiXTI=;
        b=u0S0B9jrpAD5E5NdlMZg0Jg109tfH/drWfIk3jSx8UXk1O1Qk2CwHrtnPEnc1dDsmN
         e1jiTPquzkpZjjHvrRh5weuSp9Yyh0PS3WX9TX9eE1nX6P5iLgM2dCSOlPAoObMcFwui
         Z+byRenEMUMbHITxUH3AY61RXg2GoooPqnnzYS4LzvqQGqjxJQlp/NpfkhJME3pq8mHa
         dVLr8+P70hnlGLufm/0fZW0s2T5AgQc+sSBauTbBD37Ea6bIhA8FyjCdM0vIra/DbVvx
         iJB4ewF0nKnIAO2d1qhj2/1OYH+biqtD3Wz/B1DLBTZ0hMd+zY3+3Xo7nYfFZkBP09vy
         IUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721147879; x=1721752679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inq9wHo9haYW+I9Tylrr0gohQZyxyP5BU7osayMiXTI=;
        b=SzjznzfLAp2M55MtNX3LbPRli6ghFNVh8RcBjAJ48X/rR3P1+BYtilLZxRsrrjr41D
         +LJKKSlt+aXglMZqZs4JOaF6cTrD86C/+nfwAFaY4vCb6nbfIktMa0SJS9VI7GjtuoN5
         tUAAsx51et0hTu37pzeGex0Rqg1CSUaGb+ssoAiqNrkSUotNsWSvjR2PN4W+oH0QnswR
         uLfjGIW8dJOOW5PnhLy8QMEu4zzO5GE5BNcT+B67SINz0DtALJCyyf9/btuIzCvxcb32
         xybj8Fi1HFagS9ko+eWLtlwO8y6VgodXsG3i/SpXuo+f/og6pMyLV4ePoDQdx4aWtMXA
         wkKw==
X-Forwarded-Encrypted: i=1; AJvYcCU8CYGE7p0rYlDcG/DG00pC2+NmW9+Z7w398F5Tja69/YuYJFuSTsJFqJCbA92Vi37cMCTROdhK5sSwhGAEHIZFAnJrn5BaR4jd2jkfDg==
X-Gm-Message-State: AOJu0YzjLnVnfZQ2AZoBUELQl+8kBmFCEW3Se/8+ScSHQf6vRk06fsIp
	TAi7YC7mgcQeyKYghNoaG7ttfNArlgfMJBoE98hMjWohWesANeGNHbhOpfJfJv9IhbAURTQG8jk
	DRxoIKGLDlapvU/ZSBE14h8ygZ6ZQ9bFXOofK4A==
X-Google-Smtp-Source: AGHT+IE+6hxj9x884OAMB4VNRlYKsy/S+Y0o45dUnN/039E9rINPR7H3k9hGW0oD/pMtgKJEzaq/W5A/siUNC58eij4=
X-Received: by 2002:a81:b402:0:b0:61b:1f0e:10 with SMTP id 00721157ae682-66380f1304amr31569737b3.4.1721147878623;
 Tue, 16 Jul 2024 09:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr> <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
In-Reply-To: <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 19:37:47 +0300
Message-ID: <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 17:34, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 16/07/2024 15:11, Konrad Dybcio wrote:
>
> > On 27.06.2024 5:54 PM, Marc Gonzalez wrote:
> >
> >>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++-
> >>  1 file changed, 99 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> index ba5e873f0f35f..417c12534823f 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> @@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
> >>                               <&mdss_dsi0_phy 0>,
> >>                               <&mdss_dsi1_phy 1>,
> >>                               <&mdss_dsi1_phy 0>,
> >> -                             <0>,
> >> +                             <&hdmi_phy 0>,
> >>                               <0>,
> >>                               <0>,
> >>                               <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
> >> @@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
> >>                                                      remote-endpoint = <&mdss_dsi1_in>;
> >>                                              };
> >>                                      };
> >> +
> >> +                                    port@2 {
> >> +                                            reg = <2>;
> >> +
> >> +                                            dpu_intf3_out: endpoint {
> >> +                                                    remote-endpoint = <&hdmi_in>;
> >> +                                            };
> >> +                                    };
> >>                              };
> >>                      };
> >>
> >> @@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
> >>
> >>                              status = "disabled";
> >>                      };
> >> +
> >> +                    hdmi: hdmi-tx@c9a0000 {
> >
> > Please prefix the labels (hdmi: and hdmi_phy:) with mdss_
> >
> > Otherwise, this looks good
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >
> >
> > One thing I noticed (testing on the 8998 MTP), enabling MDSS (not necessarily
> > HDMI, mdss and mdp is enough) results in SMMU lockups about 30% of the time..
> >
> > [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.913412] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> > [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.930647] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/display-controller@c901000
> > [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.952338] msm_hdmi_phy c9a0600.hdmi-phy: supply vddio not found, using dummy regulator
> > [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.967917] msm_hdmi_phy c9a0600.hdmi-phy: supply vcca not found, using dummy regulator
> > [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.984122] Bluetooth: hci0: setting up wcn399x
> > [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>
> Interesting. I don't think I've noticed any lock-ups
> across multiple reboots.
>
> FWIW, I get similar warnings about "Fixed dependency cycle(s)" on my custom DT.
>
> [    0.055349] platform 1da4000.ufshc: Fixed dependency cycle(s) with /soc@0/phy@1da7000
> [    0.055525] platform 1da4000.ufshc: Fixed dependency cycle(s) with /soc@0/phy@1da7000
> [    0.055584] platform 1da7000.phy: Fixed dependency cycle(s) with /soc@0/ufshc@1da4000
> [    0.060279] platform c8c0000.clock-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-phy@c9a0600
> [    0.060494] platform c900000.display-subsystem: Fixed dependency cycle(s) with /soc@0/clock-controller@c8c0000
> [    0.062432] platform hdmi-out: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> ...
> [   18.534346] adreno 5000000.gpu: Adding to iommu group 2
> [   18.540215] msm-mdss c900000.display-subsystem: Adding to iommu group 3
> [   18.544695] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.551239] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.562685] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> [   18.574122] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/display-controller@c901000
> [   18.617640] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> [   18.618885] i2c 2-005e: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.627768] tdp158-bridge 2-005e: supply vcc not found, using dummy regulator
> [   18.636853] tdp158-bridge 2-005e: supply vdd not found, using dummy regulator
>
> It looks like some of these warnings were pre-existing,
> but some might have been added by my patches?
>
> Do they need looking into?
> I'm slightly confused.

No, that's fine. It is the SMMU issue that Konrad has been asking you
to take a look at.


-- 
With best wishes
Dmitry

