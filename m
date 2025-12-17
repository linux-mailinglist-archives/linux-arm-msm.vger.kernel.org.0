Return-Path: <linux-arm-msm+bounces-85424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E1CC5AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 02:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7620E300C6EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 01:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8542023B604;
	Wed, 17 Dec 2025 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IW+u+3nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD4D238C0B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933893; cv=none; b=axHizFcGelUawR/AxEwW6JJZP6LAWHX3is1+GsuCjqMYK5c9a3xiw5FByNq5B3T02Et2uLwiVBP3PyhnQ1HgX9v8sTCc/MiWj3hI4486UmZ1KKn9FIqdMSYFuvHMyO8trwbca/G+uVbgZ6UlYhb11U/c189TrxYB6EZRhnyTqoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933893; c=relaxed/simple;
	bh=MXgPKG8iRfkTFawV2oSImacMVNXGvhEiH8MGNITDwA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbYuaesocG47GcJH52AayfIsarHbIX/7CuVTbMLrW+G9CzDT/RkuXeS8SRcJRy5+ulCvdwg1+ca6Zq8nRxxp3415vc17tPpBmnEbUyKCvTCMXS5XgD+AdkpYWQuCy0uIH27GkSdEYXCGQ+L3QwZNXcYvYuC7dmETiO/z00aqOzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IW+u+3nc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69ECC2BCB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933892;
	bh=MXgPKG8iRfkTFawV2oSImacMVNXGvhEiH8MGNITDwA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IW+u+3nczVZaINBAQ1QjfaazCCUDmQRutEBGGT3pC9Y5yFOA0Z9H4psC4Cw7O4cVG
	 srPzV8kw9hqx3UyBALMfmh4NBXsx7zbqI1bdqb4FpWFXa6bgQjW+7sY+WO6YrThJda
	 2gl8xSYEarTxDICvrn9yhXq39U/VIuXZUcJCieh8B2T4PP0UoPn8IjxL0jRPmek4HF
	 iI6WrQSK5qGkth+cAhD14U8jfPH89eaSXdjLysWq67vp/iMBJm9LxfDzeb4H3ol4yL
	 sT1pKzcFUGwvVX9ZdHBuYT41C77jkyRBojSK8PkhS9c9IbaIoQ5AUev/7ukbK5RBIR
	 BC0s5rXJrX6jQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b73a9592fb8so18979966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 17:11:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeSWsNugGIrqEfBNaNSCr4I64YGX+IzUElhYrvTQ6ZR+ArQcQMFSynd6llB+ceNvHbvWU3fIQxI+QPk9ZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7T672BG5b7D1wDev4yhNWPl5rvmTq7oYLZqSUcLiQDioLSMtw
	wAaKLNEm+wM5HYsxUKLjpEFYhv3aWseumczWvyr7U+5V7579iyuiPGL37L34xNDEI6ysg6INCj4
	wbHe11GaQYKBITN39B90/wfgOkuSbHQ==
X-Google-Smtp-Source: AGHT+IH09y1FeXff7WBmHOEaH+Zc84L3PQbeNaF4MwmrKwymOAKuz5AT1JAJzHLecGEAbQVqo5eyKty7glWQNifAwAE=
X-Received: by 2002:a17:907:7ba6:b0:b70:4f7d:24f8 with SMTP id
 a640c23a62f3a-b7d2184b2c0mr1888659466b.22.1765933891233; Tue, 16 Dec 2025
 17:11:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com> <176579137354.1486530.823295322686100207.robh@kernel.org>
 <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
In-Reply-To: <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 19:11:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
X-Gm-Features: AQt7F2qrp-LAixPGVqyvJ3BRA4shV026jLgADH15ncdaEmvmHwSZG96LHZNTP68
Message-ID: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com, 
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	linux-arm-msm@vger.kernel.org, lumag@kernel.org, simona@ffwll.ch, 
	tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 1:14=E2=80=AFAM yuanjiey <yuanjie.yang@oss.qualcomm=
.com> wrote:
>
> On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> >
> > On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > > Kaanapali has significant register changes, making it incompatible
> > > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali=
.
> > >
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++=
++
> > >  1 file changed, 297 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qco=
m,kaanapali-mdss.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-d=
si-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, =
162272512], [0, 1024]] is too long
> >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-ph=
y-7nm.yaml
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.kernel.org/project/devicetree/patch/2025121508385=
4.577-5-yuanjie.yang@oss.qualcomm.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
>
> pip3 install dtschema --upgrade
>
> After update package,
> and use=EF=BC=9A  make dt_binding_check   I see the same issue.
>
> but use single check:
> make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings=
/display/msm/qcom,kaanapali-mdss.yaml
> I don't see any error/warning.

Because DT_SCHEMA_FILES excludes display/msm/dsi-phy-7nm.yaml. Soon
(in the next linux-next tree), you can do:

make display/msm/qcom,kaanapali-mdss.yaml

Which will test the example in the specified schema against all schemas.

Rob

