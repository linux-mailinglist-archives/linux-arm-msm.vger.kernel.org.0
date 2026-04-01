Return-Path: <linux-arm-msm+bounces-101309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP9mBNr4zGkKYwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:52:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7D378CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E94030048CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AB73F20ED;
	Wed,  1 Apr 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="focpdnG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516833A75B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040402; cv=pass; b=ATT/bnXrbf2UzL47V4kVRa0hoilj9x3L91dBhEKqEX6XFZ5nmneHXrwLRA721ACCpRGhVZb2l5tkKRBaa3r5zWvdzopo3ADVL/AfhexVi327uymbButCBAn/QSfQHfn12Ayfl9HsuEiPkOj+GJMmzOzUurcGuZz/KS+WY6/twrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040402; c=relaxed/simple;
	bh=40aqi1I55Vmq2m60iYFNVNuV+Shkhm9O7nHBPNLlR0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlTc4B+LO70AmmGguDFq1g6vUf7AJtqdYlkguo0E0ZTPZVzuYWrZEIvWDiHr4LJidxGoU2tHzGPYSOGEabzBEmKwXaMrCjbAI/eiWq5dNIQO6DmxiuSixbhhU5Htvhm6Luzu89Ej215XmNEqvn+bIwor00kWDLyTX/JaB+3Jcws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=focpdnG0; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59de8155501so7033999e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775040400; cv=none;
        d=google.com; s=arc-20240605;
        b=EZMF86UhKTZDz9lvjYVRSfxnziTuMNIHpBqxvGFjQJG7k0fVEvDtU+W7OxG3JZk/Je
         3d94TD9NsGakjh9XGCO2V/d4cRm98BVUMj5WEaipBLQl+zlgg120fklBDOnROUK61Xxa
         TaxV7vKHJVrbgukYgjjkgjzctTQYel2nX8jSMSeMp9fdNNpH+TrcbbRPm0IiWkuqCxGU
         i2orak3Pdg6PkulWGQbNSP5ZEb3p6G/efwSAYNr7+9N6BWEEyD9aPAbQbqwpaffxYDvE
         Mb3cgM0IFEI3uyXcg7AXScSc88Zhyne+V8/ebkvyespDOgmtK+Svw99xmmwYyyK7jvkO
         JJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        fh=5L2W6FkJMq+MWrF0jVKGOvVYlebiq5vp02t6jhqli0s=;
        b=ZAkQQbwvxQmaZlNY/5HQwdVRVD2mWdbSCwOgqRjdqVhdJ51XvKnpJzM+5EMx680J6B
         VmE1Ggj4PRkp4p8cq2j24cvhs3HY3FLdl5+KFvLDNHF6qcxzRiHMK3sWOB3h8iyCtrbl
         1dpKKADmmZ2x61UHVFGplnv7G2vXgq6Yx6sAl7rx4pobB52RoT6x+Q1WXgM8Oj7lZ2JO
         SwD16XZZorDgp2osftCEy6TDBVY+RWs8qiZsH+8SFsS0hk6R+85hf/zxjqCB8gYTYyce
         hF/SdHZA3lssqbTDvAuxasG2oLBB8QWB84U/PeDIiBUuX1gLCpxJCHi4xbdMMeV0ThLj
         CFkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775040400; x=1775645200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=focpdnG0GNhSC5kPZtsCRM+qqdNyOoozw55topTHlqkT64idlswtImyxxhINAityZZ
         bcEtkg/HPSTytTw7A7MPNY4KkVmXLrzLkLNNTKPj37Twvjaz0onaXbAptuv2B9tBXsAm
         2WmpmwS0pSogb9M4YXD79tOwcd2o4l3CaB+9FpQ6EEUXLJpEW1fTksCZp8+MxDx6LzWn
         /DvY6EnxnogHltjx+1SbFhTNABu/66GEItPQ49kbEvm7oKb30fBNNsEW4HE5wkNotULc
         FLaFedn5Z7OazQsO17FVTAh0EzOKMFAMPfBNzn7W+Usd+sa5n4vjcA/biSE5Ua6XReIz
         Q5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040400; x=1775645200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSozclW0x9vuMSqSBfuRXxbpTpkomr2e0lWVw9uMgPE=;
        b=kNlBBkhco9H/XwISVtC0QVMcLCkmv+NxBEg5ZiId/1oLa57hSh/IxOA92s8ofT393O
         RvaFGTNK8GbpahTE6UwrgsVy2PtkpVzStyWEHpLBFwsbNPx8lIVzqazM5NVu1YtwVeIz
         TNu3Y72gkXgejOwT5wxzPeMn5c0FqxTOybsGptqWW22KezMoYMaEmYwaO3aP2kaU95cG
         sJ4SyQNAOBLF26I0h68xf4NlDJXnzMna2k4viYdXGMoZNkva4Z1u8BgdS48oxYVmk8OT
         ZovDPKp8x0O0+dGfFE+zL3iQ7Ch0ePnhhjvWNi0dabF5rDzIFPpAYX/r1QSo3dsQdY1W
         FCvw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHxtrt24HkD/s83nGOu57+/nH2VmyO901AN2oqw4khwXdXAecTaS5fa3q7zbDu+wpy7UXJ2mxD86Myjjf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWLaCelVmoWyJ1z6gPKJKMPoXb1WjCFAtG60nQlnxRykd0YZe
	HmcmgSL67SKPSB0jZj7MIaxd97fcTJVAn6RWyJeJ6sXQtUTYa5uWlLuHyj/Fxoe6uH6Y1i1M6eS
	c4KeX9BokpBfRm/Y2Jr759koRc+d9YsBucPoK9r2pug==
X-Gm-Gg: ATEYQzxDTB+s3qdGrknnpFAgkZDqQxzpy8JunwtR/ZlaQ7ayBC5DZ9iyftPhjqMuF7V
	Wpyj2FT+ZvjbRarrgYcZCIkEcc9JrfQ8hznuAskoz6h10MPsWQkadhWHPkZ1A5FG7G7s4rBvPSN
	tbglTwt7a+R46+Rrnkcm0a4z6dB416sJttW9yA0CCG9a620c4kYBb6chLwTWsuB2xAoxZ5ZXKwE
	YeQvZ/3nLpdflvZCQ7PoGo0URZEi+6RjMNMiI5Zpy9LPwUVeLXcgtGt5PBDDIMrlwfexGqCJJuN
	LgC66bi1
X-Received: by 2002:a05:6512:1254:b0:5a2:c0b6:729e with SMTP id
 2adb3069b0e04-5a2c1ee82b3mr1132629e87.4.1775040399387; Wed, 01 Apr 2026
 03:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
In-Reply-To: <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 12:46:01 +0200
X-Gm-Features: AQROBzANxupbHHkAqu8GJiUFFGG603SVUVTYVg4H2FBCM1h61nXzlIOx_SK4W6w
Message-ID: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101309-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6CA7D378CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > >
> > >
> > >
> > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > >>
> > > >>
> > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > >>> On SM8250 most of the video clocks are powered by the MMCX domain=
, while
> > > >>> the PLL is powered on by the MX domain. Extend the driver to supp=
ort
> > > >>> scaling both power domains, while keeping compatibility with the
> > > >>> existing DTs, which define only the MX domain.
> > > >>>
> > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of S=
M8250 SoC")
> > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > >>> ---
> > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 ++++++=
+
> > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>>
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.=
c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_d=
ec[] =3D {
> > > >>>
> > > >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus",=
 "vcodec0" };
> > > >>>
> > > >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> > > >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmc=
x" };
> > > >>>
> > > >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/driv=
ers/media/platform/qcom/iris/iris_probe.c
> > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris=
_core *core)
> > > >>>             return ret;
> > > >>>
> > > >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_d=
ata, &core->opp_pmdomain_tbl);
> > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > >>> +   if (ret =3D=3D -ENODEV &&
> > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-=
venus")) {
> > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_o=
pp_pd_data,
> > > >>> +                                            &core->opp_pmdomain_=
tbl);
> > > >>> +   }
> > > >>>     if (ret < 0)
> > > >>>             return ret;
> > > >>>
> > > >>>
> > > >>
> > > >> Hitting below compilation error on latest kernel
> > > >>
> > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > >> =E2=80=98iris_init_power_domains=E2=80=99:
> > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrem=
ent of
> > > >> read-only member =E2=80=98num_pd_names=E2=80=99
> > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > >
> > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > dev_pm_domain_attach_data")
> >
> > The intent was for this patch to be part of v7.0-rc1, but I failed
> > with my pull-request to Linus.
> >
> > Instead this will be part of v7.1-rc1, assuming everything goes as expe=
cted.
> >
> > Is it possible to drop/defer these changes until v7.2?
>
> It would be very sad.

Right.

Since it's my mistake, let me reconsider. If I rebase my branch and
share the necessary commit through an immutable branch that you can
pull in. Would that work for you?

Kind regards
Uffe

