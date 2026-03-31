Return-Path: <linux-arm-msm+bounces-101046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MkXFwezy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:41:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D5368F40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32AD630602E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A013DE441;
	Tue, 31 Mar 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeDrD7/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F13D6CBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956855; cv=pass; b=O+fyr04EC24jfBGOMnKPmG6Km1tLv9fbqe/6+4xTTlKxTa1TUNmI0Plbvlzp73kKYQVnfTkoX/jCN8ATmWRzzP3IPEaOYV7aAZORFQ+JKmYv1ZE8eGt7wNnjzanSvuz0Iu9qjX/6Y/w6kvG++F6vounYlSBdHdQTq/Ti02wLn8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956855; c=relaxed/simple;
	bh=fvcDsk+Dh9LbyHECz4bnznmrSq+OdCpbbeM5YLbTkds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWxmycp4KkqszM/N8SQPNB+9X3tkjCFynZCU+caumrpTC8Vviq19YnJma9j/hIa2kW54uTA4+R35PCbDWAUm3N+hZMHAs1f/C7+L5CUm2h4d3k1QQmsYNYgiJEUobszHcEm/0zlVZztBNb3thpoei/7zXLgUfC9tFd9XXYkAAHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeDrD7/y; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so6364825e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956852; cv=none;
        d=google.com; s=arc-20240605;
        b=MuzegSQhKTtNLMRLT4vpxeoSAYDMvqBGiU2MiLZH9opGJdEf0ox/6QsTD2rch7iQVC
         4Mgwut0j0LpoW20dw+b9FgACzKhP6tAxvyLfoWZYc6+UmMuCW/ZjjKE+X5FmVHdMiJX0
         eBktfi0hkkkUwVCudjrYJEULDHx5KTCqbgmL8PgXHQRebwF6B5/iEOIWtL4TVVKz9E+E
         HAUR+Pi26hXdpnc83FzDzpEsk7CVjWJxz5/qcCxjGPb1Gevtmg1KYBu1Ji7LgAeJJknJ
         XrtFU6/n+ChowzGaIz9e3CrUfG4sv4f9rKXACjQZzFkPuPiHQ9IdVjE7U2xgjPGy84DF
         cOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        fh=xfMKMJF87bruM8LzR31gGT05/V8vX7c4XkNqQTdqsrU=;
        b=Gv03PCNsLNFtqZpWtzQeDQ0aTx+RbHKkH63YXttSxLlfWTq4/HOui39uxgFdAOK4lD
         ynnzTK6oFq9g4Q0TKdnRWZGiJGxYs0H0aqh/LEeDK4sRHt9H2IXxnLtBJVwwBpj/KNqg
         pxhIDgB78tgPO+KMjeNj6tf35nekU/d74XTKY4PZy5I+9Fw1xTAeTQa6qasAyRJ9MANY
         2n49KJ92Stc6a3a5BPMpKb0X/NAVVKnco39eAczoQ3LufcSBYw0bT9iXYZBIFaEcoLV+
         NsuBv/0QvwBOPmjWES2L1Qs3Els+6S+h3vNPuvNkmBNo9xhGcJUwgg9qUeUKOViWyUte
         8JTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774956852; x=1775561652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=KeDrD7/yI3/16ZEeMyZnj78MqSBCa/eNWnPEkeAYhLevO8maetOMhmPI1inSAE0K+j
         PE/CmpJAsbIIGb6mD5jZXCXs6onFAfWtTNpG1XB4E6Db/ppDhoIR0KNIvqC9HW81QAaP
         rJjsi6XhRTS3+eCW0VXhjIK/bj7BEg7wYhkeegw3eu3FNMYiiAKDxpxSFUQwiSRcS6ei
         XfyqZeCSDDVGL9/5nUN81RQpi96adVxov9hulCN/b4xQm2nhzhbE+/jqcXZ5xmEBKXBC
         msWwnM1xSSv53465TfU0cJMV3IutPU1jtY9DKfI1QcygSd2ODudvJc7RIFJ6PEDG8zPR
         bWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956852; x=1775561652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGcYOF43Fmt+IF0mxxl7l+XSr0GQEhq288tkKBbNS6g=;
        b=p0+varQdNq0g/+iYd0sRKgbDNgjRa+fiYsYJ1kG2Fa1DcNN6H6nWBc4R4sPPxUOKr4
         19WVFqIMy8pEsZb6Eyza2LeFNQx877j294CTho9FDztlB08igsqXfD1z176dlIRLCL8l
         YxqpvswJ+FqAQJjCgRhEvSQxPDTokhtl6uG4nCMm1CsL9s/PoRrwlZImwGSH1SQCZsC6
         Fd+TEl5S8UDDMHqNjv0Ok2Mo3Azc549t6xbG3ttSZ0hh1eVlfjSLPZcNnikDxMQNZx1/
         BxDTK8DJ9hVd9O8snJJkvzibISvGQneQ4NhEb5NJz+X2FMD0WBn41F2+HQldNwnGddGM
         iHWA==
X-Forwarded-Encrypted: i=1; AJvYcCWkxaK6chS91Pg4ITVGfdlGQSaTU2hkxm2w2HvtU/vw35tCauIzQmLD9RFnIZ7g5KY/Ob0FuvyvAX52Wn2A@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVuQYpMbk2I4MmdgjmTaYVEzEXhThm4JTlYsbvp6VH/ErB8Bz
	zmGoTDMWjoQ7PBIJb0QRaFlodpGRTzpc/gjt1bSqXMvFexxZZVKENfNZAchNHNxXvPbEg1wHryw
	/iBomqrFFlWQ84vsuSz/nLiBVITIZHDvV/4aEdz+wwg==
X-Gm-Gg: ATEYQzzjQ3nYYhQFLnZCXEX5b3mEm8hWccrctCaoevURI7Z49Zt9SnQrsxnuiQpu38F
	wRP4Vmmd4QrKhB3J9QvhiG+DaIjE6lg4kjxyvCfAx8h5io9Ur/KQsY3QZtT58vzlAsVxD+Jb8lX
	uZ5EAvzBmEUu7lJVHGv5t0iLvvXOLDFrXSe8EAQ6aX5Z63RWZ3gabw/O2iEAckDWXA82gBbqH2Q
	OMRPf2FmWlau/u0QaUM7u38f18veWCU+FOxU5ul5nUKpCUaK69RJQiwhOafX3sVMTqxEL9oPMPH
	52L35BccCLIcCHKM5qk=
X-Received: by 2002:a05:6512:31d6:b0:5a2:bda5:c4a3 with SMTP id
 2adb3069b0e04-5a2bda5c5cfmr730600e87.11.1774956851831; Tue, 31 Mar 2026
 04:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
In-Reply-To: <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 13:33:35 +0200
X-Gm-Features: AQROBzB4ctl2c0yLSalbIIkWrD6Zd2w8t9cdNUGWWq81ZnkBTRFdQQbrOgG2lXI
Message-ID: <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101046-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: AC0D5368F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> >>> On SM8250 most of the video clocks are powered by the MMCX domain, wh=
ile
> >>> the PLL is powered on by the MX domain. Extend the driver to support
> >>> scaling both power domains, while keeping compatibility with the
> >>> existing DTs, which define only the MX domain.
> >>>
> >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM825=
0 SoC")
> >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/=
drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> index df8e6bf9430e..aa71f7f53ee3 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[]=
 =3D {
> >>>
> >>>  static const char * const sm8250_pmdomain_table[] =3D { "venus", "vc=
odec0" };
> >>>
> >>> -static const char * const sm8250_opp_pd_table[] =3D { "mx" };
> >>> +static const char * const sm8250_opp_pd_table[] =3D { "mx", "mmcx" }=
;
> >>>
> >>>  static const struct platform_clk_data sm8250_clk_table[] =3D {
> >>>     {IRIS_AXI_CLK,  "iface"        },
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/=
media/platform/qcom/iris/iris_probe.c
> >>> index 7b612ad37e4f..74ec81e3d622 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_cor=
e *core)
> >>>             return ret;
> >>>
> >>>     ret =3D  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,=
 &core->opp_pmdomain_tbl);
> >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> >>> +   if (ret =3D=3D -ENODEV &&
> >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venu=
s")) {
> >>> +           iris_opp_pd_data.num_pd_names--;
> >>> +           ret =3D devm_pm_domain_attach_list(core->dev, &iris_opp_p=
d_data,
> >>> +                                            &core->opp_pmdomain_tbl)=
;
> >>> +   }
> >>>     if (ret < 0)
> >>>             return ret;
> >>>
> >>>
> >>
> >> Hitting below compilation error on latest kernel
> >>
> >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> >> =E2=80=98iris_init_power_domains=E2=80=99:
> >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement =
of
> >> read-only member =E2=80=98num_pd_names=E2=80=99
> >>    71 |                 iris_opp_pd_data.num_pd_names--;
> >
> > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > dev_pm_domain_attach_data")

The intent was for this patch to be part of v7.0-rc1, but I failed
with my pull-request to Linus.

Instead this will be part of v7.1-rc1, assuming everything goes as expected=
.

Is it possible to drop/defer these changes until v7.2?

Kind regards
Uffe

