Return-Path: <linux-arm-msm+bounces-99303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJlrIm1TwWkYSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:51:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 219162F54F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6146930333C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3693AD513;
	Mon, 23 Mar 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EarLjfEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624A3ACEED
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276188; cv=pass; b=qYFG7RFyJpBReLbhxHPQtABdfQN7AV0Ziz6E7OzvS/hfIds7b+s5or5XoG9q1VT3unu61/t9F6d0r9/BqzEjejVU4zlFOcTZjxkJjVkp0a0I+AMC6VWRYFZjIkjQNuGNS6tJ5E12owqLbeOxtgoKStoKpAUZfUkU4h3WDlcw7sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276188; c=relaxed/simple;
	bh=+on5q4N8SL0w5EOH9rEDfmQSu2nzNibcQeALQEa6kg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJJ1VDW6dwSU5enXChIL+YnHjeI6Vwf8iukaR63KdFS0w3mEJlQvVO4jrAzzAhbTYcdgRz65xi+LSuXhpVHxV7S4DR2UfXRu4oQI+KX9H9TKhg6fVDc+apkFZ0E4bJb7NjZsHMMcX787cpccpcQn4UPyOUgg5P6izc9/WtjczDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EarLjfEg; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b980785a0bfso36481566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=brGLPxUhPkoo0gdLVxnbNNelRkSN5846Hy6oTPRh898V9DXbV7XLwbOfRru5TABEvG
         ySQIsRNwSXswdHlOsHeFwN55PxO4k5uuD3YIV0rp/wDpG9mwGuUG40nsIQk2ohbi8EsT
         tuOTqXVo8YiYsmMb0NybeNMF7KReUR7OGa7psDyP+iXMLTtLG/beaI5WqsHa40fUgNup
         ziJlgv/U2DEe4GniaaBr33I2+15uV4bBvM1YOPIsNdlz6foKb7GWIMcQrQGMWPxZFCvY
         nNJ2OZfWeHDZ4ipxmF1bF//5Nm8HDz98isq4A2Fr40r0i8ZuLYpIQ0wKqJucF6xPmzjp
         JpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=CcS/0Omoh6EbvC8PEN3S+KTgD2eRf7omGiwgWTSWbNY=;
        b=B8ItGe8eF0O5RGytWuNXIbTIQXfv607qgaj5hqC8B3/DhJz0oez1l8aeu8ZEWjM7Gy
         ekHgqpuQG0RGyhsnNWeCYqUczbo2otRfkLTGbPKiDrTZ+A+8pl/MU4e3oaiUcvHyfYfZ
         m+u4X20n/WHkg6VyBxRDvwtkvXeWu2eqGjodgRXGyBW1GlAdCQdP6Iiw4tnTAEG2aacH
         xON0aHg1E+9QjbuBVCqEIyFbDcQaEANz/mxpH3IizgtNpZb5jt5Kcq9qgA7NTz71QDH9
         xZNLs5Gk/LsEaiDYo9qe+gd3RWx1b1mka7cXbOPAwpTn8/YmOjl8J15x9FUW/Ml/JB/L
         hiKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=EarLjfEgA8q0L+mwlFDSb/Jsya1AqkRGVOEPLdSMAJ77MX5lxnxT+QRFA0oAznGfEF
         2nN+mUJ0plLWWYiAPW/X1kXuZKOVozD0xKj2u2YsNGCv0YXdcpgmH3G00mjovvMWi1u+
         /AxLT5kjY7lPXfaIQ/4EbEPfCluifk1XH3imnJFze0Ftux+Ji82Nxqsb8txMGrYfFaTT
         93M5cbt8/BlNKpA2GbQ09bmrdbHGNBbSE+SKiH5g2ai09kT60GSOlzA7KnUI02sydvxx
         yJ75R0Og09ge7PwUlcRLj5WxOb470X98xhzXrScpCjYJmg7vW8Xl8LaVKgYzEi0ZyGyf
         w/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=q0JxaVx4WW5uqi5rDbagwE0e2ER3PQERr9yMNiCcTER5UvwLeyejDk/2rUJt45FrSA
         lqJ8wCrm+4kRy7pRvHawCpBpwQ2Id7KDyGzgO+EYX8PTSjFbp2mJhQ/7qT2TkZfyJWXL
         Uw/H8QmFT/9fLgwalPgv1pGn1GAUtj4DGNLTpIuzAasG45L0qMjdjrFVY0Gv0Cmfzvo3
         BG/OS80jrc2DBV7rna2gxFxUbryGZiEoBE5DkSa49TvtG2Fb4wIm0MymH+EaWfbuKq39
         xnxE5ofkedppC4h/O6JQ0EcWYVA21Z+X6njIZVoWJ29uxCfFHjEm7UI4rhajblF+DYEo
         1ZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWcD1K1oMKorRc0S7JMlZMBnCjB9PGDlS5EK9GbO/BzQz0CQ/ARSY2NsZFlDbZnOFEQXkOdMZH2imCshvbN@vger.kernel.org
X-Gm-Message-State: AOJu0YyO4gBQzDPz0d3gRYfkTmVg2zx8EnKdjTQ/zYslwvepxDxE3D2/
	GSzscbcMvyFaRYWZlYqPkOMT0Ycto/fXuR2CyZpMT6RW84XYTQn8S1DqZr0JsI1vIx4dtYGYi61
	/3D+U8swe5PErz9xSHyFVnEWTjxuGRwJsMfVH8GxRzA==
X-Gm-Gg: ATEYQzxqHL123ZQyGdFzKTmsn3MpyXIeQXVVnJdkQoHDR7l6clfmy6aPrVGjk9voxpD
	Pvs4LidVTBtX5Y7bUE0CFkrmRTCin7qL5MTQxz2OfQ9FbnM7uRDmaTToQd538gipfjZu80EcKDs
	pC55lnTPSQTngrfp2S3f7FzntME1SLcATLcT5rVwvZqPa5esUSnRr0WOy/8TO6WY5Mg/Rs6djeR
	0ep/wGnc95dOocYMNOrtltPndpb25scXf5//J4dRProd11CHvIjYJvZyDFIKtpK9RFe6Ur0DRLA
	ZkQU+ADsoqwQdjYlahJhsWbGw4AOCmQtZQT8oWmUxQ==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99303-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 219162F54F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

