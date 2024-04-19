Return-Path: <linux-arm-msm+bounces-17905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F858AA80C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 07:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCB7B21856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 05:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E358F4A;
	Fri, 19 Apr 2024 05:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="nfL/Ogdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADCEC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713505624; cv=none; b=jVr+wZnvw2FL7bprKSCfqiBerN5Sari4Fy0ASbfjE5GBNuqY+dNP+QIh5tv8C96VvEE2h5gEnrOdfNXcnFP323GXKD/ckJprQJ6+v9SIj/HaRaqdF92tT8wW/qI3qYeVStLfQUjMXuwVB2Jkj2F4ns1rOpPCQlv2Qnm5zL7O0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713505624; c=relaxed/simple;
	bh=DDv5h5HCNwIchwKdYozppsYyGKsrmtNPVNB+kld7Csk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqnPI/fOf2h9Pp/pCWni1OM+t4F2bNszR+TXxsXAawkUt4Xal+BOqdH7lW9svGzP3KASix1NxRlYcjXrm0+2vq+5ZluFc1Jp7umNTK6lClQusaA3yPNqv+9j7uxZtCi55ny9UT2yPVUgrC37cqMjriO4UiyRpBw0vz9oG9+bVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=nfL/Ogdb; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so2039064a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 22:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1713505622; x=1714110422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqAAIaynXWTmCZkKAS87XgyHGXeDGz4/5vtU3XxRi9k=;
        b=nfL/OgdbIoRJnDu60SVDDlmDzVCPjYlzBJHlqCMDFG+gyyc47x2xlL2xPCP/0R7peV
         QMquifNbzIYgvY8AnW1cWcKwVgll8zDhauEpOKwgTbC12Jv7fvKq5BS9p7ACqGSxt7Z6
         UJyb/gDxXkiICBkXrlEAN1V8W1C95FcRAPqc3p43ZYOW7FncmVz0EctmKeoIqFUzUzEE
         cnLuzNVtUiEpKZQ87fi/ffzconXyrScrBlgIfdBq7Znq+NDh4WYtPrjPT9Ra/ewJgbP8
         PF6Daoab3FYKjdkLMTAYL9sPZt2pyxrzxdpP3mBjespiCz8yBy8XeaSuga1l0K7mWunQ
         Cpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713505622; x=1714110422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqAAIaynXWTmCZkKAS87XgyHGXeDGz4/5vtU3XxRi9k=;
        b=Aham263MyPHdQaVX+1fErQwQU9LzM2n2eMP7A7CWzQp37akoZEoOid1T0mqOD6q0zx
         /FbgHZTQ+YoHSVPbng4uJZfkPgHaiCPjykd001WH8LnHv6xxPFuV3BQL2EuiEGOm2Q2i
         VClIY6SZ7/jWYUc9HDWTdIpc4ejlibBXh/e1i05HhIEuAEXJdkErdlZntDnfZo+RgKX6
         VrBfwcwG2pqGFi2QEtMuohAUQ9He/50b3JxHu+WTXocnXnvv4iuAjRU/8ph0ZAUmeayc
         cK78FdBvPjTLVPl9+dbgl+03Uca8wv/+8Xsjg13PeckhijsQ966VIrB+TcK67HtogU1P
         q6pg==
X-Forwarded-Encrypted: i=1; AJvYcCWi0gl0PmF2j95AT2KjcLOvk/TCTa2gZkhBhoo3RJqyIi9Yt/PymtkayGvyTwOfEVo8BnkfvjolLf3pRxcNMII0EOtrTF+BCnknTSVZUg==
X-Gm-Message-State: AOJu0YwtePSGFm0sh5EmosP2hDP2Y30HdppWwS1KmE3zQF/UdWIMdeYN
	dn6sb5C9egq6p1dP+zoTIVdhcekkEib+DK1K6c2eT49Bb2EDwHnWIi+JM6TN2PfiQyatO3kz80g
	Q3zuUoFQEI2/WSuoO9tRjfQUo0td5gaN//LeYEQ==
X-Google-Smtp-Source: AGHT+IHHAfaZ1NZrYxHPy6GwaV4DPbUEBeZyilIDmUO+m3CqYQiH43kN2ZxvrBVG3Ivt8+6yminJOjlWWA8AYfUwV+c=
X-Received: by 2002:a50:c31c:0:b0:56c:2ef7:f3e6 with SMTP id
 a28-20020a50c31c000000b0056c2ef7f3e6mr748584edb.0.1713505621565; Thu, 18 Apr
 2024 22:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240413064225.39643-1-jenneron@postmarketos.org>
 <20240413064225.39643-2-jenneron@postmarketos.org> <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
In-Reply-To: <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 19 Apr 2024 00:46:50 -0500
Message-ID: <CAKXuJqhQssxfTQ+6Bf2JbHjX3f6k4whB1j-G189SNXmkTyvdQw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and below
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Anton Bambura <jenneron@postmarketos.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srini,

On Wed, Apr 17, 2024 at 6:43=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This is not the right fix, this can be determined from codec
> clk_stop_mode1 flag.
>
> can you try this patch:
>
> ----------------------------->cut<-----------------------------
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date: Wed, 17 Apr 2024 12:38:49 +0100
> Subject: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag
>
> WSA881x codecs do not retain the state while clock is stopped, so mark
> this with clk_stop_mode1 flag.
>
> Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wsa881x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index 3c025dabaf7a..1253695bebd8 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -1155,6 +1155,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>         pdev->prop.sink_ports =3D GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>         pdev->prop.sink_dpn_prop =3D wsa_sink_dpn_prop;
>         pdev->prop.scp_int1_mask =3D SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT=
1_PARITY;
> +       pdev->prop.clk_stop_mode1 =3D true;
>         gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
>
>         wsa881x->regmap =3D devm_regmap_init_sdw(pdev, &wsa881x_regmap_co=
nfig);
> --
> 2.21.0
> ----------------------------->cut<-----------------------------
>
>
> thanks,
> Srini
>
> >               if (!found) {
> >                       qcom_swrm_set_slave_dev_num(bus, NULL, i);
> >                       sdw_slave_add(bus, &id, NULL);
>

I tested it here on my c630 and can confirm that your patch does fix
the audio as well.

