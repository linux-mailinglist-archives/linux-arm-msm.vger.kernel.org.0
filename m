Return-Path: <linux-arm-msm+bounces-41308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D849EB139
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD461886E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCDD1A7255;
	Tue, 10 Dec 2024 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7gKtQZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229F1A705C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733835051; cv=none; b=WlaXQb4Xma2jj3PwxBLqxhT9/kTwBekOXf2rC+hzjIdNd6BanmkNWskaNZBHmrnkWt7jibiniXy85QjLAgy+fXcHoNBj3GbJD9e7css1xujUQNl6/4jLrHBSCON8TbTYMDU4SYP5U9UNDTSy3pPH9V08AeXtHf9S+CoT0r1bDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733835051; c=relaxed/simple;
	bh=bY/aA+IWQ3QxQ2sZnjjb5W3DKLhLKSXmN8peYI/pr7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMUjk6g4VCsz1yzj4YDDrRKa4dZVOwGB4kThxFMNr+P7rPF1M9YZJLoTjwotTUj9H4iB7ZecrUEW7Cv6PucIMn6n7GasiHMZfO/qR9bHetAUoZ1ed9gpEIaVx4WOHUL5MrLp6sHDYObXv00FHmvJLKkusuC0P9jdEbytNyRrF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7gKtQZZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6aad76beeso30707466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733835048; x=1734439848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7qRHcucb3bJvZLwoVQ1HjlEAIx4MF32wL8i5hALjhQ=;
        b=c7gKtQZZEwP5pZT1e3RFifBctv/PUanT5oTBJpmb0cnAHLazwA0MwVIeG9noVNbp+2
         zQP29p8WS7rwVhBMsRpb4CVHnKi7chADGfw6Do9GjceB8oW0ErLa/3QT1ulSaKmkviEU
         WGBxMgyjMgqM0oS476OyqVb4vMyaLyKtsoJQKawKzcUqXAUCZ9CgM1jmAdGskMpc/1jc
         AzjR9CDxPoEpkv14KHUPcZGuv/ds4+Tm6Hdi1pyJ58UNA5SJjUAEftUvrFOQ2CJj6vBj
         H96huddPu6PSHN7UIXmHetguWX56iIKNLlo20kKtaS8b7QrHmRtfF6XKmo70TO+oelJ7
         91vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835048; x=1734439848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7qRHcucb3bJvZLwoVQ1HjlEAIx4MF32wL8i5hALjhQ=;
        b=ahVHtQ856UbjD7u1TW1IX4e88rdef/1+KlbrUIMvLSsv/q58X/yhaqIMXaqLQsYO5p
         qbJGklytiqO+dBxVB88quYbtrvKB+JgTkieWE6YIvIzZzs8tq1qeQPobrEazXmSUOcay
         hFScm5h7Rvwh1x+Xlkhgynt4rP26IhD4nmMRO/8fs1TuEbrRuukNmqL7soBSiPpxJQvf
         JWOqtO8ucen/eyTzroGXcRCTggnbJ8FWwKBW6Hq6v9vByt2CQkdISKxLi3PvVk+BI7Sa
         blktCaISDT/bqJ068Op97qadafMQCcpXwsPmvi4piMIqF+vmnZZDNlIVQWKOAswTArg8
         16Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVZcobtdq3nqbw9MtpnzJX86j8ant3sx79Bpt4n0fedYObJgMcW860/40sISbaMea0oObhuWq3wbDAZ8h/l@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWyYrapuXAZtpOwXhRf2mdLhywbDAP1joDqLSJ8FxoM7S52h4
	LrAH9O1ISs4HcaAmlilyIVcakFJK9mOHxBpGTDW4b1gqJ8ob5m+pNs4Gunw40tcINXSSJ7VoZpp
	YOLfr7Fk4Jar1uuuArWsjY30G2PwQc5tjOvAJ2A==
X-Gm-Gg: ASbGncvZQ1F+KXSzr+lghSNZtJph8KgLavIGIO1Jvoleotf0in/HBOR49zn9uQERzUK
	b7FHBSenBtorFbtnu3hy4lNmXbBRnqtc2Bjk=
X-Google-Smtp-Source: AGHT+IGUyenOeDiJ6ElklP7HzZFpKG0ehemH7byFc2hBRRMkI05xaWuzUu/O9qFlx4Kz7Wofw600OMm2prli/4lUsnk=
X-Received: by 2002:a17:906:30d5:b0:aa6:abb2:31f4 with SMTP id
 a640c23a62f3a-aa6abb2322bmr37782966b.25.1733835047677; Tue, 10 Dec 2024
 04:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com> <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 13:50:36 +0100
Message-ID: <CAEvtbuus3scTvcjMuxxrfcqnd61+vqM5G=os-aUuM3+SLp2abQ@mail.gmail.com>
Subject: Re: [PATCH v8 16/28] media: iris: implement vb2 streaming ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

On Tue, 10 Dec 2024 at 12:07, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> +static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
> +{
> +       struct hfi_session_flush_pkt flush_pkt;
> +       struct iris_core *core = inst->core;
> +       struct hfi_session_pkt pkt;
> +       u32 flush_type = 0;
> +       int ret = 0;
> +
> +       if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> +            inst->state == IRIS_INST_INPUT_STREAMING) ||
> +           (V4L2_TYPE_IS_CAPTURE(plane) &&
> +            inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> +           inst->state == IRIS_INST_ERROR) {
> +               reinit_completion(&inst->completion);
> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +               if (!ret)
> +                       ret = iris_wait_for_session_response(inst, false);
> +
> +               reinit_completion(&inst->completion);
> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +               if (!ret)
> +                       ret = iris_wait_for_session_response(inst, false);
> +       } else if (inst->state == IRIS_INST_STREAMING) {
> +               if (V4L2_TYPE_IS_OUTPUT(plane))
> +                       flush_type = HFI_FLUSH_ALL;
> +               else if (V4L2_TYPE_IS_CAPTURE(plane))
> +                       flush_type = HFI_FLUSH_OUTPUT;

Below there is also HFI_FLUSH_OUTPUT2 defined. Do we need to handle
this flush type here as well?

[...]

> +#define HFI_FLUSH_OUTPUT                               0x1000002
> +#define HFI_FLUSH_OUTPUT2                              0x1000003

regards
Stefan Schmidt

