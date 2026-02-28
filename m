Return-Path: <linux-arm-msm+bounces-94641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOCjHTpWo2nW/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:55:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECE1C89DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05838301D95E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF7C3009EE;
	Sat, 28 Feb 2026 20:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr26O0Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134F3002D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772312076; cv=none; b=qiy+gonJTXipaFEzBTVRG1AL1w9LgOgwIWBlULL/ELDhYKz0Vssv+CqUjxYbYJcBwE5iB28BD6rL+3Hv1v5fscZaHhzmrsdK3JocRofd/mKVS7fpCOb+M6KeI2cJyA7w/l9SEnXRmKAgejYpZoc6IqAkRNestDLEtr/RRd22xg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772312076; c=relaxed/simple;
	bh=A54o0fRlYXYiX6f5a1IPgxuDtjkOjMBT1FuckY80TuY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fGdizB6IOmRwf5k3LU8x3C0G6TDurrnXYWwb+517vki51wv/nXwIUj50qOlfNhFTVdVzXqvGVuCCC0k1Pw7rioKqCppySWC+hhoVrn5DFtuaHoDl1h3SmfqgFcaFNNmarOvO9VpGuFkSIaEcj/MiPvtDJKRaUGRR6Vgz37RDUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr26O0Y4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f992167dcso346109966b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772312074; x=1772916874; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN2+88bWo1z1i+3BXW1R0w5iwrpOTleYOh4/PvtS7kQ=;
        b=Sr26O0Y4QHHJWtRdnKGN3IllO4lqd/f5FRQbOzqsbJWkaWvMM4SdvdOY8Js+diW1SE
         eBkfIH9yttgwJOevM4Z+XEvy7K6hZEgejeln/Q7UXl6kIT5M3vl5C2a6QIaXfLPyRQkY
         mtiU8DlVNJVKhwM8LPLXUd8TAv1ufKvwroVAVMbu9xt+99EICif136HbgxOrcuCWQmyH
         Kvy505G+fohxORqNdM7LWxpGJ1S50D6SezGDiXFUgdA/hU9V309EsgUctmv6rW416Hea
         /iTM4ubnCGFV6FlKZJNBeaGfh49VmknD1Q0dqu0vOAGgt1Jd0A0WjpqCwt0zopU81OOM
         lo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772312074; x=1772916874;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN2+88bWo1z1i+3BXW1R0w5iwrpOTleYOh4/PvtS7kQ=;
        b=GYVYeo+WNEv9tHedAO+N6tUiflaNudDNqvYe+6GVkiYbA98uuv+v8JGdLgo5npPJcR
         YkQWMxjoybMpHnC7mj+GPfkBkVu40nfacHtps69sw5Wf+/dUPXV+t0BwGa9Y+Qk+lrB7
         56wVd89q9M1xJ048bWzunSGXL+rFOmN4mHLQwj9ICSCAM9tjxCaS9k6gNyF4gXG+oy9W
         ndZegVao7sqNaESkG6axZKc4kaXi7ZbwGub8eNqlzWG5CA8P1ZqNlBwlV4fbjrzkdsKU
         mhSIYcP8tEcDHtj9g4IgDHro1nI3smlagygZS1jFr6oRO3rxTOCQ9qqwJYRRQruBusAk
         hAkA==
X-Forwarded-Encrypted: i=1; AJvYcCVezOS6J0e9nCUvpd7avZbCopAOqjvm6F9/7HSJrugAcseQA67JfSVICJqAUTBEHq3TmJpMOBmQiehoHfCB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp91Y6RR+xbpO5kP4SzbziOjLQPTvhZnpr0b6PuRkN0enb9Gyp
	LcggrtopOXhHnr8TJ9VZlbjYkS2RfVofkkSKqsNAOb8jmYkBkOlEEFJnuhv0ZA==
X-Gm-Gg: ATEYQzxH2nUGe5X9KfSWqTeTD6Y1bH1Nj/SxhMsBuHaGHScvLLuR5BrqmUzrVIpzXBc
	Uuhx6fAZGD8Au8e3kCcX/LiEQhnQ8VtTvsEK504TzbRFcPV7ugPYDLx7E3isa7FxS5ZWAC60uY9
	sg+Kx0lUil47+4PGbaXYpXl26BdFuS2LkM0JnEHYx0/G2VH0Ga9TgWevL1sIQiZ8BjKLYCnBUVh
	w9V05KN4bbblxDisLY/5U7bVxqnurwRdWquxlAHyfYiqKleKAE4TJnbL8WZoPp/FUMRfdbVDgUM
	GxGZfSi9cQSlkafR//9Yj3izfKozLBEcqivx/bHlF1TWkfiXeWf0nYXl0cnVIvZDdKb7mRBpZVb
	P0uKKcvmjo4dEkHLdIcRd6JCcx4cGMajR1arJ9M4xt+/zXy3Ya/ER6aJC7S0DLudjgccXBnowLL
	ytvhlkQnDeJWrcEek2RdXhv9BUYM20kwn8BRCOHaBCXs899+FfMF/kOcCMBALrg5BXPbyX6VCWS
	iW3d8UpJgBWKGgaBVq6KqdepymSHroiQQRce6Rdnns/Au/4bj/U6BfZcHE2GVYpIQ==
X-Received: by 2002:a17:907:2d2c:b0:b88:713e:7895 with SMTP id a640c23a62f3a-b937636ce1fmr468067366b.3.1772312073608;
        Sat, 28 Feb 2026 12:54:33 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac70b01sm272676466b.23.2026.02.28.12.54.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Feb 2026 12:54:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] media: venus: allow interlaced video streams
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 21:54:20 +0100
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94641-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E1ECE1C89DD
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Dmitry Baryshkov =
<dmitry.baryshkov@oss.qualcomm.com> w dniu 28 lut 2026, o godz. 10:49:
>=20
> Venus driver errors out on the interlaced streams with the 'field =
isn't
> supported' error message, which e.g. prevents decoding of the MPEG2
> video streams. Don't error out if the buffer is set to contain
> interlaced data.
>=20
> Tested with the fluster enabled to handle MPEG2 through Gstreamer:
>=20
> ./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so =
venus-mpeg2.md -j 1
>=20
> GLOBAL SUMMARY
> |TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> |-|-|
> |TOTAL|30/52|
> |TOTAL TIME|75.526s|
> |-|-|
> |Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
> |MAIN|26/32|
> |PROFILE_4_2_2|0/9|
> |SIMPLE|4/11|
> |-|-|
>=20
> Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf =
field")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> drivers/media/platform/qcom/venus/helpers.c | 5 -----
> 1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/helpers.c =
b/drivers/media/platform/qcom/venus/helpers.c
> index 747c388fe25f..71e79093a4c7 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct =
vb2_buffer *vb)
> if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> vbuf->field =3D V4L2_FIELD_NONE;
> - if (vbuf->field !=3D V4L2_FIELD_NONE) {
> - dev_err(inst->core->dev, "%s field isn't supported\n",
> - __func__);
> - return -EINVAL;
> - }
> }
>=20
> if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>=20
> ---
> base-commit: 779cae956c8316aebc1946ef86ca001f99658270
> change-id: 20260228-venus-mpeg2-495f9187a1ec
>=20
> Best regards,
> --=20
> With best wishes
> Dmitry
>=20
>=20


Dmitry,
I applied this on 6.19.4 mainline and give run with interlaced content =
(hd tv) on qcs6490 (radxa dragon sbc).
Playback fails like this: =
https://gist.github.com/warpme/a368983678af0a76af85314808773076
pls see a bootom kernel output showing venus failure.
my sw stack plays ok on e.g rpi4 stateful v4l2m2m so i think root cause =
isn't in my userspace....
pls let me know if anything extra is required to fix venus decoder =
issue.
br=20
  =20=

