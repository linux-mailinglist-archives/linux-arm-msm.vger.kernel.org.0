Return-Path: <linux-arm-msm+bounces-24494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D500791AABD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A29E1F26B0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E4198E78;
	Thu, 27 Jun 2024 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZv4bgoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4039198A1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501102; cv=none; b=nm3wFSYR3OksoB+gNEZeq5TdVTZUXGCM65rplmM4XxwNj+JnEpKs8LT5T2L4i9a2ittiOuFpFs1rD31YBH0/14Ks6K0CO1bSIoExlFSne2+cWJjTlrWkmba6Fh+5+rZfZcwYLjoWUkJEBUvi2rblBoBjjhNdQCAykT6l9e9+WdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501102; c=relaxed/simple;
	bh=pDBuML2E1f5ix9l+LrF/TBBSl3qcVEyxGqQ4XE4J3dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjOeUxbDdt3I4XFW3FCelv09ErxOh9fFid8IpCiwwVMPsLc1qg975VdjSI7rYMIyH/DHw1v95X4M91YPhLlbYonJHUIiI4mRhMIPIQL0vE5J01xM+dI2jV7XxqR56CIBL4v1+VM8+RuTzsE3xtU5Ac99KCIq47jJ1P5NqqMpCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZv4bgoa; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63bce128c70so15721877b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501100; x=1720105900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eKrz5JnDYe7CFRd5tpf8rGwprLDwDWvC7s8h12MoL2Q=;
        b=NZv4bgoaiMF31VOSfa78mzMVx7FPjA1WD0E8D6Dn3+42nqRPomqF2a3BkeTgpjxbbN
         NF22yjXQftftcKxOZKDVXUh5+2xI/TtZ2uZ7YdCGtnutMkZfp5sc6rVf3LilZQ/1/Xpv
         J4JLPykrGrIZEYOMcjC27rBa23TbQONrQHoLiqfMR1bgDzURRKLuoisMt7mn/QH1IXQk
         l2CEk3yxxZfecEpQJrnL+2PavphBTLNn/ylnPNA5xZvuDVtENPdeh7C8m7HTo3nKst+5
         pS11IALcxo5fW/lbTex1czLV9VPhrhoYqahwtfg9beJ0A2JnPq5srZ9jbBkD/qMkwz4s
         mRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501100; x=1720105900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKrz5JnDYe7CFRd5tpf8rGwprLDwDWvC7s8h12MoL2Q=;
        b=HVbCUzsiyCOgvHJExA59il0pBQw7mR8462GGJ1Mqp6IZoQ1WeeiF3SI/ly3JjVHEZY
         ZFdBinl3ZUutUyNXbBaz5L7ohxpJXonwgzpRWVsH8kBe0fHASQ8WDCqG9mNzdbEUpreG
         +GA7nMbEh4yDV8D5ot3pFh7hUbJaNqGk4cceG54TRIqgeNE2ZIK37jCNV9XhANBRHsWA
         Aw1GmxCogPaDeY+HRxN132Oc/ruBAYKsV9jvSCy4oxnQJttgZkCKqVaw9Z+3nJP0wrKN
         G3+OST9M5GSpnCt2iuc8048WTkJCnwtWK95lLjLnCNad/79s+cYB5egFXKUhcB9ek4eR
         7NiA==
X-Forwarded-Encrypted: i=1; AJvYcCUxc3P3Y0oOLAL7Xe2f3bPGvoxh1oWgPSSVEuqO+eFkMA4X2ZQZAfqueszXElH3SW0uBql/srGLAZurVFRKCqCb+jL+jsCuk7ds5NvyhA==
X-Gm-Message-State: AOJu0YyyfUrPUaTfXJa6ba3+UkDMs9E8PbN+SRSvxGQdrunEPwKejVtg
	Mwby1eSdAGuCwkUS+uYBTPJH1AD5SsA6We6U24QBo64+YB+fyzgQAMriu8VqK3VB23OU4QjFfxv
	NqNtcQSP1wiDtKXY6n2a90r7J92Lxtc+UpNmFoQ==
X-Google-Smtp-Source: AGHT+IF+4VnbD/5IKiEA7MzcB8Bhjepz8rzkvxe5mUJa9AmOxnk+Npwkq8GtkrvrJQZDda9LBk+CGA0iDZFfuAQ/anw=
X-Received: by 2002:a05:690c:1c:b0:62f:aa9a:93c6 with SMTP id
 00721157ae682-649a05ce6e6mr13057017b3.8.1719501099578; Thu, 27 Jun 2024
 08:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org> <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
 <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
In-Reply-To: <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:11:28 +0300
Message-ID: <CAA8EJprK8scCfCkZTi1auK16SYM_Y-JntuijYyjkYd5LZYbAXg@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 17:34, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 27/06/2024 14:38, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> >> Add support to parse static master port map information from device tree.
> >> This is required for correct port mapping between soundwire device and
> >> master ports.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/wsa884x.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> >> index a9767ef0e39d..72ff71bfb827 100644
> >> --- a/sound/soc/codecs/wsa884x.c
> >> +++ b/sound/soc/codecs/wsa884x.c
> >> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
> >>      wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
> >>      wsa884x->sconfig.type = SDW_STREAM_PDM;
> >>
> >> +    /**
> >> +     * Port map index starts with 0, however the data port for this codec
> >> +     * are from index 1
> >> +     */
> >> +    if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> >> +                                    WSA884X_MAX_SWR_PORTS))
> >> +            dev_info(dev, "Static Port mapping not specified\n");
> >
> > Same comment. Either dev_warn (if it's something to warn about) or
> > dev_info.
> >
> > Or, as your commit message mentions that it is required, it should be an
> > error if the port mapping is not specified.
>
> This is an optional property for older SoCs which have 1:1 port map
> between device and master.

Then the commit message is inaccurate. Could you please fix it?

>
>
> --srini
> >
> >> +
> >>      pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
> >>      pdev->prop.simple_clk_stop_capable = true;
> >>      pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> >>
> >> --
> >> 2.25.1
> >>
> >



-- 
With best wishes
Dmitry

