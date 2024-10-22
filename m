Return-Path: <linux-arm-msm+bounces-35344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2759A9A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56144B20FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C712146A71;
	Tue, 22 Oct 2024 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Neb/fi2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE221465B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580245; cv=none; b=EI4XdSPVXBTxG7IXWl3XdnV8F/Q4SYcEqp9vP/jl0t6719j0sI7wiq4yI3OMEnQ7B1yTkIKhlSuBiKVzEp1S25b2451JlY5UzWvdePBhvEIKM1lk+bvQcEekKuBlv/zmD+ixK+vtpxUX8lBY4PlyV/89oHJbxlqWsIlpTfSMwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580245; c=relaxed/simple;
	bh=cxGSevfjqIssyM5bsmKvrGQ9UdYKa3i8NiO5ITLhZ40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R95Vwvwi46EByqKHX2bEPxt5n9Nks5g9jQbPjLPH/3Hoijy8bPf6YP/lAlrOYMH8Bz6Q+j8mc923RwjahylGkWF2UtrEgTddvxlgGfa/tuqsrH5E8CT06rTexI5MM1BCI95pBbkhAkKrLa2VxEzX3y6yrmnWNSaWdoEQNuiLDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Neb/fi2y; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e4237da4so48184357b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729580243; x=1730185043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRrFt/KPQCPYuot/0PuPd+VWwguSgMsl8ZS8aWe8ttg=;
        b=Neb/fi2yqncU6qijKcXqw8tAqnolKQypIAMHRAmYYl/4pSKXTPGSs0QJt3PLldEQuk
         PUE+hhsc1udCWop4kLSZMPFpgzpex/969pegPVV5wDWL3jRqDR11UDz1sLrbLbIuPCrF
         cAUh9GDzv8X5zcMGvSl8tEGZv++QxivVpaFAiDKN9RR5OA3dN/ufIF0XF20sTy1c9Gp/
         68juSldxuSiYUfb+YYV2WWUY4bWacm5fr9qG3rVnTdmu6dBIXgRl89oi6hkaYpSHlwq7
         mfu4/5NztwjeBSfCXOR9faj3ywjADXwmIkuydOn+UXa2C0nOqYxiZHu1aW9Ymh1Nc2N8
         VEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580243; x=1730185043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRrFt/KPQCPYuot/0PuPd+VWwguSgMsl8ZS8aWe8ttg=;
        b=eJHfR1NluCk1Th8BQegjKgcmNu/sx154INwH9/pTBGYJTuCnPOTNI4vH5RutX/iSw7
         zxIvOUf/jLXBZoASCIt+/6EBeKEdf4IVA/H63lDClEvTup+ktl1cYhnne6sODNLYcXXf
         aeLTxPdqELbarNeSFUyAScDkPpM+hFRHZ4URG4Q4Xd51GCh/xvMMp2pSKSEQhrIfPk6t
         04IDzIDQbFiVs6Mi+sisrHDQVJ5b1uweuDBBujMnYyyYCffyXZU5eXGPi9XMz/+O008a
         hNDu/t8msbfE7kV8qXDa+/SLE15qO2OghUgrxZVlMqT5yhPuH2Od5U8Keu2giefcObju
         i48g==
X-Forwarded-Encrypted: i=1; AJvYcCXR6whpeRgYeccwQuiVj4VgHe2/hAm3AUttk9zOLHeTHXwNbX7ZuC1urm8PPTCBl9j3zfrYC5Jr+fstADKw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3FvnuWJq8lyNu5mQfSje+0kv8uLQpX1m/eW3Apm9fi8LYg/G
	6SayfnfnzTX1Kxf1uyJYceNZwhK0mrLgRrnqmiSj9gICf7ljJvZ3gnztQwAYfWZ2h50clZrQ9FW
	v0lzGsWfgCi2QjXlZ/AcmwJ7t6o94P18Dj9xLNg==
X-Google-Smtp-Source: AGHT+IGumwlow4+q+ipOXyKpmyqgzRnQiLYo1bfjvDXtBX1Ew+kvKaqJy3bMjv7NqYbIbgNW4CB+3q43o8HgvvAp2K4=
X-Received: by 2002:a05:690c:490b:b0:6e3:d5ac:7d59 with SMTP id
 00721157ae682-6e7d3c17f36mr22941727b3.45.1729580242899; Mon, 21 Oct 2024
 23:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-3-quic_kuldsing@quicinc.com> <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
 <f46a9180-ca71-458e-9693-ed9badc85e72@quicinc.com> <21630547-552b-43e0-906f-840610327876@quicinc.com>
In-Reply-To: <21630547-552b-43e0-906f-840610327876@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 22 Oct 2024 08:57:12 +0200
Message-ID: <CACMJSeuM=xmtvJr_DOZNdsj6FpF50xgXx1VED4OW6cv=s2qW5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Oct 2024 at 07:43, Kuldeep Singh <quic_kuldsing@quicinc.com> wro=
te:
>
>
>
> On 10/16/2024 2:31 PM, Kuldeep Singh wrote:
> >
> > On 10/14/2024 6:38 PM, Bartosz Golaszewski wrote:
> >> On Mon, Oct 14, 2024 at 1:19=E2=80=AFPM Kuldeep Singh <quic_kuldsing@q=
uicinc.com> wrote:
> >>>
> >>> The qcom_tzmem driver currently has exposed APIs that lack validation=
s
> >>> on required input parameters. This oversight can lead to unexpected n=
ull
> >>> pointer dereference crashes.
> >>>
> >>
> >> The commit message is not true. None of the things you changed below
> >> can lead to a NULL-pointer dereference.>
> >>> To address this issue, add sanity for required input parameters.
> >>>
> >>> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> >>> ---
> >>>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qc=
om/qcom_tzmem.c
> >>> index 92b365178235..977e48fec32f 100644
> >>> --- a/drivers/firmware/qcom/qcom_tzmem.c
> >>> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> >>> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_=
config *config)
> >>>
> >>>         might_sleep();
> >>>
> >>> +       if (!config->policy)
> >>> +               return ERR_PTR(-EINVAL);
> >>
> >> This is already handled by the default case of the switch.
> >
> > Ack. Need to drop.
> > https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom=
/qcom_tzmem.c#L218
> >
> > While examining qcom_tzmem_pool_free under the same principle, it
> > appears the following check is unnecessary.
> > https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom=
/qcom_tzmem.c#L268
> >
>
> Bartosz,
> I am thinking to remove below check in next rev like mentioned above.
> https://elixir.bootlin.com/linux/v6.12-rc3/source/drivers/firmware/qcom/q=
com_tzmem.c#L268
>
> Do you have any other opinion here?
> Please let me know.
>

No, let's keep the NULL-pointer check and add it to qcom_tzmem_free(),
I'm not against it. I was just saying that in the latter case it will
already be handled by the radix tree lookup.

Bart

