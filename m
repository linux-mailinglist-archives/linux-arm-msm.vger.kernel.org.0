Return-Path: <linux-arm-msm+bounces-50842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25148A5965D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619C7164C15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1072206B2;
	Mon, 10 Mar 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6gaNjDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22879C0;
	Mon, 10 Mar 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613456; cv=none; b=J95Q8QEhe/6CobVdGA9Od4YO3DmjDZCXk4rWnyO3e+a9VZNVnRrqQk0H493bdatwY76eb87uk6QFOlG2ynCAMswVTdbJVjzWZgdR3lTv1xAJ0aJc3jbe3WgcP3hNF56kEwDKBnYDuuSF87kDLC4hV7GJhnPJTVGQFrBSrP92nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613456; c=relaxed/simple;
	bh=7DK+rBnIB6+gK5GprT7obsuYQKNEBuzPpYg+bZU61VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVFbtPCeseo39M2plLenNuJp51gEReGqhByzob4KVwYhX1fpXMia2Az9jTIwK/j2XzEIJcnnykD77Fsg2kKknb/Jrstvd9ZsYzIPmO8I0BiIjuRc7HrM+/wQRx2a9Xfq7Li1rF580a/GKCeIFiB5gyMEeyfK+5cRjKPnmVOHR/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6gaNjDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1705BC4CEFB;
	Mon, 10 Mar 2025 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741613455;
	bh=7DK+rBnIB6+gK5GprT7obsuYQKNEBuzPpYg+bZU61VM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N6gaNjDSopjXklq/smuCritonxIFRZcviors5Z6GWB5x2DpMe9pO4/a1jaWMwCMRO
	 XKM0+fEzSCVucV5ScvQoQ4r3iOQZWQMoaLcQwNYuCYgYOPHTldegww1SII5Cau6QnD
	 Ju03QmZ8EZu0/Et5J9/gLX9NlW2ViKuUxQAbeyiJOzIgHK/EPz0Rs0AsEuTpPIuBkf
	 s7vhEeKFI5S7yvD9DwzksfDuNkTyjBrUjAYlCAPqeey+zdk2sx/hHA0zHc9pJZtbEU
	 VDn34iKB3dun0ff6ieYvPwjaWIEv4a1r+crojlHQkLeNctJcxqWBGH9useMMIp3X/m
	 2Nxnwt4X2GZBw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so5392814a12.1;
        Mon, 10 Mar 2025 06:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFS33wGMEfApjduNqsL36k3VblAj77AQG5Lqi2opsgeugaHEDEV6X5nErsz2XuPw/kHy7OFtemhR8pamikqg==@vger.kernel.org, AJvYcCVIY7lFMreqRSWLgJMkv6fIGRmD2tRmuBjSrtDmNsRoJYYlk5TTVLOBKiLieuH/zSKI0effgcuEgrht@vger.kernel.org, AJvYcCWIVQV9Z3MeFNp9KjD2eWT+RFVzQlEYsEwlRZIAJyolt/HjJthZu9zW/9Er/SHxfanVcwKccwm9T66w5uAD@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCgEdcr/HTm5YwNccdMHN4bGecHRsqXTOG/lxZFSBYu44GWzX
	1k9eqMz6du0pMcJ7GL+joPZrwiKLLaYrBm8JhUafamxb4XUF4a3jZFcfinliMbF+Fnm/UrL79yf
	QtE2fCJ/IejpeeuDGzqNy0ywbow==
X-Google-Smtp-Source: AGHT+IHQqQev9Mt/kBzD3p7JhI6eC5lr1d6ht0exKs8fcQ7bw7GOc5LSSjJJgeGQCo3IH1yYOPaQ4qbZnGMKJ40RyrI=
X-Received: by 2002:a05:6402:4409:b0:5e7:110a:c55 with SMTP id
 4fb4d7f45d1cf-5e7110a0c6dmr3695220a12.18.1741613453358; Mon, 10 Mar 2025
 06:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org> <174140525677.1770282.3232695979994091275.robh@kernel.org>
 <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
In-Reply-To: <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Mar 2025 08:30:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
X-Gm-Features: AQ5f1JqRkP_MsxtbTrRXJIVMatqOMN_D3NTt1ZS-seDKkCW2KxLIXoxniVXXOnU
Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Marek <jonathan@marek.ca>, Maxime Ripard <mripard@kernel.org>, 
	iommu@lists.linux.dev, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 11:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Mar 07, 2025 at 09:40:56PM -0600, Rob Herring (Arm) wrote:
> >
> > On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Describe the Mobile Display SubSystem (MDSS) device present on the
> > > Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> > > system level. SAR2130P features two DSI hosts and single DisplayPort
> > > controller.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++=
++++++++++
> > >  1 file changed, 445 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneO=
f' conditional failed, one must be fixed:
> >       ['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', =
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', =
'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', =
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', '=
qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qco=
m,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,s=
m6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm71=
50-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-=
dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi=
-ctrl']
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290=
', 'qcom,mdss-dsi-ctrl']
> >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-co=
ntroller-main.yaml#
>
> It looks like the patch 2 could not be applied and was skipped. Is the
> bot parsing the dependencies from the cover letter?

No, it's not that smart. I need to move it to using b4 though that has
its own quirks when no dependencies are given.

Rob

