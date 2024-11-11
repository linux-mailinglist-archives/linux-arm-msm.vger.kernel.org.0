Return-Path: <linux-arm-msm+bounces-37483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608E9C432E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 18:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0372836F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 17:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18AE1A38E1;
	Mon, 11 Nov 2024 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPLqLaiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419013E022;
	Mon, 11 Nov 2024 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344813; cv=none; b=XqBAkzD19AMvVkbSbt45Z1Ys5qs1eujMDo5PSxwb+kbgBukzr/Y2poGr5zdJpsRoiTB6KxvvxWF4MkaCG5QoAHAjq082yrPE5Ez3XiaEnPzS4ahQ/S/5LQG5qFXK2SfeHQIJDXSz3G48HpjQpuC8vtI/zPJ+0p1dIzD/pZcsYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344813; c=relaxed/simple;
	bh=feWL9fgmmw9QG92svt4ITVSK7A6maEehKtjcSkF0SEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o50wWiiuZsSkF54vsbZ187VQ80I0FV+FR05NtD/mdixIT2PLqBw5tcWaSF8TV9wqs0NbXqalHvdDt7HsNp1jV9/d1MZHAns6XQSvtMBwMsDzF0b953bQTWYdM8Y69vAJ//tS48Zcc+1jg3Jbb30ZPmawECf9bbdhpBcFu2gYrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPLqLaiz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025BBC4CED5;
	Mon, 11 Nov 2024 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731344813;
	bh=feWL9fgmmw9QG92svt4ITVSK7A6maEehKtjcSkF0SEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fPLqLaizjJbk1Iwqs/BZnTbAdagLPzisXvNNbhWyaLKHrvoma1CBBYF7FS2u1c1mP
	 fNo+21tb+XpqWV9rtA1eu3k+EXUI8oVtYBw4VUEqs6oQeP7TqMjRbXi3nmI4MKwl++
	 GqYN0LNBrqpByijyayZtqlTrMS8b2c3aiLsrXo+0m4zDrCjnJ2ylKgbYSKn3AN0L/q
	 RQGf5ZdjWBjOQk9Hk9KZyqPnQDfk6CqEQc/U/LSlvdnN8HzKdCKG321AOFGHWToTIT
	 XefUPtjAP5ftbSDo9XtJ98BzT8jON61E2gHMiFOfTITNSsLHNrVZ8KaylrOobLQNIF
	 zP7ygysk+2nDg==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so4334127276.2;
        Mon, 11 Nov 2024 09:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdmluuRj7S/ab+SU4G+Jcf4dNoH/xmN6vW2zEugmuXV0pEosEPL46fYsGR8H+SzV4k5kbnVM6+R81o@vger.kernel.org, AJvYcCWOlMcC400Wf0DbyjlKkoX5qf7V++ynbPZQcWiOpWEZMvfdOEJ43+PYpJzGeL+oK4yFX+HSf0R3P0EB5Nt+GQ==@vger.kernel.org, AJvYcCXTfACVb3gNRnlGGeaaqd7/ARQqo+YYzrmgDGyovCDxFxPZ5542JF+8REiGnZvL5cHCcVypPplBe3L30Okj@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJizdROnF+gxtwgcprlc1mj/sJYtj4W4pk7tFFZYFpHgruhYi
	DePt2+sm9cW3OC+50A5nSie2lTo/RKqAuO7sLzWDgGJAkv7UasrjtdehPAooOIsZulnLMt+dTj3
	D4oJQM2nDzj4UKJcPEvGNcvcP8g==
X-Google-Smtp-Source: AGHT+IEg+ZdXyhSVjowIdMTiFtczDqq6/O1NAD+xe1ZO9PXm0V/eW6I+PrJSsMZu5rrCYy4oAydNqSZhcQKsejZ/zxs=
X-Received: by 2002:a05:690c:6b11:b0:6e2:ab93:8c68 with SMTP id
 00721157ae682-6eadddaf35cmr116692697b3.25.1731344812198; Mon, 11 Nov 2024
 09:06:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com> <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
In-Reply-To: <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Nov 2024 11:06:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
Message-ID: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalyan Thota <quic_kalyant@quicinc.com>, 
	Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 6:00=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Oct 09, 2024 at 08:02:01PM +0530, Mahadevan wrote:
> > Document the MDSS hardware found on the Qualcomm SA8775P platform.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > ---
> >  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++++=
++++++++
> >  1 file changed, 241 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p=
-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mds=
s.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..37c04ae6876f873c2cddc51=
b5160b1f54e2b5118
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.y=
aml
>
> [...]
>
> > +
> > +        display-controller@ae01000 {
> > +            compatible =3D "qcom,sa8775p-dpu";
> > +            reg =3D <0x0ae01000 0x8f000>,
> > +                  <0x0aeb0000 0x2008>;
> > +            reg-names =3D "mdp", "vbif";
> > +
> > +            clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                     <&dispcc_ahb_clk>,
> > +                     <&dispcc_mdp_lut_clk>,
> > +                     <&dispcc_mdp_clk>,
> > +                     <&dispcc_mdp_vsync_clk>;
> > +            clock-names =3D "bus",
> > +                          "iface",
> > +                          "lut",
> > +                          "core",
> > +                          "vsync";
> > +
>
> It's been more than a week since Rob reported issues with the bindings.
> Any updates? Obviously I can not pick up patches with binding errors.

Well, someone picked up this version rather than v5 which appears to
have fixed it. So, probably need an incremental patch to fix the
warning in linux-next.

Rob

