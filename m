Return-Path: <linux-arm-msm+bounces-79468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84183C1B05C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABC5626FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519CB2517B9;
	Wed, 29 Oct 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We6K6x3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41824DD17
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744542; cv=none; b=f115Dtin4MQJz70YeHmA/4x/MjTJjBOEpn/TjwYEhYx7z81xfzKVdO8qSN6u043Ih4ipoMfbrxynL7aMDvitwqBw9xlBVCAb69HUflD1V4V1cMx3hkTyZ5f1m6kuGPZnwdrK0/v/WPCrnx/tA3r16lskuGPgNKYbZCkF54eAdzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744542; c=relaxed/simple;
	bh=V8J0xvZ85AOyFUwvxTu3obUZitEUBIFVJbjXz+jtx9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuscJJzQ7OyU32Ad7HdVIJv/PgcabtvIKdni7yLjlpJ0CDr8kUkU8r3Z3dIT9kTae15COZqlbkaA4+LMA4y2bAtC5/tNkW2buJ5wasVFuy4zHnVT+OLogCOqaIFlDTkzObzhLv3JFjhpGP7V9uEUf+D63Ss7oyIXwkYKnCRDZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We6K6x3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE029C4CEF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761744541;
	bh=V8J0xvZ85AOyFUwvxTu3obUZitEUBIFVJbjXz+jtx9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=We6K6x3aaF80R//VliizpEYIwZ2spVt1dUwsNp4vVoWylO1HUD7z4ncWBPHCG+JEV
	 xYZdRHN5a2OgFmuZhkaBVhtpk/y8CTjLMt0T+/+QIE2ovam2qOde5dIKnAuO7W7QOr
	 kaIiNZB21X5xGYD7wBhhd14oc0ukkNut7yjRHqdPRzzPXqW3kkvwWjoQ/NmQYhxWeN
	 o+s+rCRJvnHynZ3gY2gSZJShEewi1YWOIXc24plvd+3B9jEHJHDqS3WXbCZH0zQHxw
	 z1MCoXGzkOLwWvB+z94E9mI7YutQVYXju7IOvm+0ihoUasZp2LtTLOzVhcLPxNd9IB
	 0b/sq3wN8qm7Q==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64034284521so2821731a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBzpewQFmKAOkbPRKB4LHiX85vuXvYLSechebZX9zFKnjFN46ZkXbaY2AfwRFNIUC8dXtlK9yJLn4Ic1FX@vger.kernel.org
X-Gm-Message-State: AOJu0YyeV+psaUEREC4e6JhLEXlBD7G7tkcIHYX+aPYFd+w6ReFwNYbW
	Rz/coGaodZ9Ere+RkHZyxzj7xxSEyRcLHQgpxuK4kheCq1ggOFnWRZWYH/Erhv2MN3iU+iyK+mz
	B12aQLn21gz6vGoEs01R5Jn2B3Diy2w==
X-Google-Smtp-Source: AGHT+IHI66z2+Wy1IZFMnUdx5g+GMlZnEl4AgfredAbI3iQtA8d/rgYvCJw+HiU2ycuaI9mOG0aE98R28JLtoJ52E7Y=
X-Received: by 2002:a05:6402:44cd:b0:640:464a:56ce with SMTP id
 4fb4d7f45d1cf-640464a5bf9mr1937220a12.2.1761744540388; Wed, 29 Oct 2025
 06:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com> <20251029132340.GA668444-robh@kernel.org>
In-Reply-To: <20251029132340.GA668444-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Oct 2025 08:28:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJALs2=qAv5OkXzAvteSc0uUza_FMubTdEcrs7fe2r1rg@mail.gmail.com>
X-Gm-Features: AWmQ_bmQUz1cUpz-qP4YsTh-ZRfrLy4fDLLOGOf77uIu22TQpbJbLmGmD_zxXy0
Message-ID: <CAL_JsqJALs2=qAv5OkXzAvteSc0uUza_FMubTdEcrs7fe2r1rg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:23=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Oct 29, 2025 at 01:05:44AM -0700, Jingyi Wang wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >
> > Document compatible for Qualcomm Glymur SoC ADSP which is fully compati=
ble
> > with SM8750 ADSP. Also with the Linux Host running on EL2, the remotepr=
ocs
> > need to be hypervisor independent, the iommu property is mandatory to
> > ensure proper functionality.
> >
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 13 +++++=
++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-p=
as.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index 3b66bd106737..8cb839ba1058 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -29,6 +29,7 @@ properties:
> >            - qcom,x1e80100-cdsp-pas
> >        - items:
> >            - enum:
> > +              - qcom,glymur-adsp-pas
> >                - qcom,kaanapali-adsp-pas
> >                - qcom,sm8750-adsp-pas
> >            - const: qcom,sm8550-adsp-pas
> > @@ -101,6 +102,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,glymur-adsp-pas
> >                - qcom,kaanapali-adsp-pas
> >                - qcom,kaanapali-cdsp-pas
> >                - qcom,sm8750-adsp-pas
> > @@ -247,6 +249,17 @@ allOf:
> >              - const: mxc
> >              - const: nsp
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,glymur-adsp-pas
> > +    then:
> > +      properties:
> > +        iommus:
> > +          maxItems: 1
>
> This doesn't make 'iommus' mandatory as the commit msg says.

Also, 'iommus' needs to be defined at the top-level of the schema.

Rob

