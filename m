Return-Path: <linux-arm-msm+bounces-90579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNPYGOuFd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:19:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0098A07A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B492E307B2F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F56533E35B;
	Mon, 26 Jan 2026 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fE0KikZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC533C50D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440540; cv=none; b=JWdVMlBY0xB04tgQ1BeZ7JCAQGvoB+wjy8XJT10PFVrEDxg8jH0CBSI6CysRGgNxNJ87FwK/wEZQitTFmfxlTokgUUUjiUwu39QkpnSEoqYPZrF0zAwx4Z/Qspj2KjS/lWZ6tEHp9PHB3o41zf0bTNY+Fy2T0R8w89z/kKC4n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440540; c=relaxed/simple;
	bh=FC7X5zPYMI/o32zsBSUmBvAhD6KTKw50hOGSh5dNAj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJwA/aylUbZz4HlzoBYvrKWqq6PrqJomPoh85DWPmtp425ami6Wt4RUor4NL8JcuEf+xkZbEDse33NPrXG1pf6qo05ezWF+J3a7Y45btHKwhDEuRy81aobmetobzZQ0Df+x0OJdaPbwXqy84AoBRIxCq0MWpPvxjyw20bfN/8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fE0KikZp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8860d6251bso442127566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769440533; x=1770045333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t5aplmA3nTqsGBEOpCKNqLj2NzSX0vQ+67pQX8dHuA=;
        b=fE0KikZpBdrFIGm0jCwNgLxXZnvq2yGIQMbGrBjd4XVG0tTigK/8/HrODlOgs0iSSa
         oxviLwRWjVmdSmsBZtWpsSoP2ysCPEubCtx2erBKSwWmVlhLqApKjjG/AxqDwFyy2iet
         Buq5tc+6kqAKE/Ug0GWdGcIYXii5PPaFzD4dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440533; x=1770045333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4t5aplmA3nTqsGBEOpCKNqLj2NzSX0vQ+67pQX8dHuA=;
        b=TGjSCSHcUbX06B4aSsJ7Qz4mrEJlLYfPOHFOZfetmcGklPHjYlglrOLfB/8Gcw2bLI
         lR0kopdyeRLxxvZQ7UG7IsG3KICSKcFA/7OpBFEfq0mFlWdxy6POs+jGqu/MfbJluW01
         ueDq6cGOluFO09od5RyvXYSG5Q5QWZh4UigZdCvqmjIeT1RUX8WER1/QRsvm2qjYMoIZ
         n/m2aZGcrgkSa6U+qcPMorCjImy/iH2P/+rHyjBOAcqutOwwpurEUqHJxZaD48nv+ViB
         2/2OlViD7sMB2YGKyDr0bC4Ed2ELQnjku6VRGFUoIV2tiqqF9y4b//M6kFR61glWKBeX
         Nmxw==
X-Forwarded-Encrypted: i=1; AJvYcCWAQleAXtGMkdaYWzfiAy/0pw5UTsKUMI3ZdF5gI7DQaHPf05T5RdTtpCNdcspDwdcWzRp7hSgX8yIxmozL@vger.kernel.org
X-Gm-Message-State: AOJu0YxkaAcgNA/s2Yg+sPnrdOpITVpVr8UocDvDyHX2PKQXp+ByG1kp
	/keeA5SzU/xClkbvhVABfJ7bJeyUHRuDKmkExWjJ3Q+bJdc5GmPVJH9/BLWvlfuLGryVnEPPsDE
	AaZY=
X-Gm-Gg: AZuq6aI9ipXMV8AW5tR/yer7g1U6R1H69qb7uSIP/6ccFt3Sp2losZjhw1pYErO9/Fq
	Q13XaN1OsV0PE1N91nwslkHjgdA1Y5nCRKLxo8AH9SdV0UVgYZkHia12ZVWgBYo/7tOpg2OaM3D
	0Qc2J6Nn33zJbvPdEsJRwbgbpOqZ3oBYpPc0LeFms1TIp9UG/IDTrIpKOURTPGOElDOTnOQfW5y
	pI6hAUKwXKM/kjRdu9HALMsBsqzCmDfEQQwfqVoAnzDPOz8HZHE+eN3siUfcUdsfx3u9A/Ecroi
	nYcUkqGRqkyg8c18vMFjNiVneGw2n6427GhLagGNqBXgVnhmDcjDhLD3QLO6wx6wYc+BPHM/yP9
	Vm/I2+203xa2zOhnKl32ndEE6VnFsyo+D34xix7of+F3RFe51M/AqhmxJZDxinkiATUbxSTqtUy
	g0ARdMiHlmTs41z19sI19YMsyxqfsjltawxc6Z2+0T7lVsdfKGFw==
X-Received: by 2002:a17:906:730d:b0:b86:f999:15ba with SMTP id a640c23a62f3a-b8d20deae9amr346941766b.18.1769440533270;
        Mon, 26 Jan 2026 07:15:33 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7d7ceasm678325666b.65.2026.01.26.07.15.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:15:32 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so51499985e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 07:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXILzpLJJEWdw1dN4E09W2yCCWw/oKuHmgx9/HSn8M+cHeFFBhF2dvu4LXvlSFWu2Wy6TbsNd0KyXadVcZC@vger.kernel.org
X-Received: by 2002:a05:600c:3e1a:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-4805ce4e55dmr85307405e9.10.1769440530557; Mon, 26 Jan 2026
 07:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Jan 2026 07:15:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XmnJb5_hJ_NvAMMQExZb6r2P8Z4hTSfUiqit+-LYpYKQ@mail.gmail.com>
X-Gm-Features: AZwV_QgSxLFN0B5kCSZpCHaocJhmPgrGrSBW7Fb0Ju5fp6s9Xmzf9QgNaOY6xDU
Message-ID: <CAD=FV=XmnJb5_hJ_NvAMMQExZb6r2P8Z4hTSfUiqit+-LYpYKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sc7280-chrome-common: disable Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 0E0098A07A
X-Rspamd-Action: no action

Hi,

On Sun, Jan 25, 2026 at 6:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
> core. It's expected that the ABI that is going to be used in a long-term
> would be different from the defined venus-firmware subnode.
>
> Granted that the SC7280 Chromebooks were cancelled before reaching wide
> audience and granted the feature ABI changes, drop venus configuration
> for SC7280 ChromeOS devices.
>
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 -----------
>  1 file changed, 11 deletions(-)

As far as I'm aware, anyone still using a sc7280 Chromebook dev
platform doesn't care about the video encoder / decoder working.

Acked-by: Douglas Anderson <dianders@chromium.org>

