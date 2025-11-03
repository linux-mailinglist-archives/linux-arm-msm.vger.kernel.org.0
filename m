Return-Path: <linux-arm-msm+bounces-80160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E650C2DB22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 19:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3ECD4F0660
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 18:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054C72848A0;
	Mon,  3 Nov 2025 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NfWqPfNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8043147
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194837; cv=none; b=SJJu4jXqmwo82LxZnEHVWxOof6lMUqnYTW7Z+LaIqDDq+XkDKhb8rQbUJLqP7EwfTODPE6bxIJMHiqQxm/mWSa7PLaZL/biD995VvOFHqZFjTf2b5neGi0t+L+jQPDzGR+Mj+p+/Tz7m8g3Ns/CfnNEFGBbS3yPUwdVMyHLb6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194837; c=relaxed/simple;
	bh=7RFL2JLNfzKTvp1hqb7yXk1A27+KQsMMiKr3EtxmPzE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GV8c6t1PfvD56ujT/sI+XM+l5i4IApAJxl6kmivnoGuqLa9N9VAExncZzXzEBYg3RrTmbW9UNmLHSno51GMp3CSDW5ckCjRvZcubceuEl58sySEKVrNtAOnsjIJa3BNHp9cUuqC86UD7DwC8Ik/+hdAt42/qSEzOZEf9vWEPF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=NfWqPfNL; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ed411e8a29so32782511cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762194834; x=1762799634; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D6IBkTdRfVpO1bCNLk2LNL0B21F0Pxa2e8J5b4QlK6Q=;
        b=NfWqPfNLcnrLKKmICZQvbVUhMtYx7RQ23nZajIdk7huiH+LpCSvpgfXb6+j2rQA+Mb
         Xc00lTdFfGRSmNSBX0ZnX34nDHB6rbc2VhkGmwkcqhZoxbuvqSsWRDEgovRkxEvTT/DY
         HO7TW5/0lgHe5v9sfdbc0bnpLl51hxG3s5J2eVBcmxVFMI/Dnso2NlVJLqk82RokXPJX
         KA+SKHMU6V+jCDCAwDp9cW7BvXEvZq5FD8pLz1tZs2/ikTZcq0WcammScS1HV+83EXm3
         Xg7j4wYh5Dx3Jq2dYWRufds5UHKrnJ2APqwY5jLP6X/r4FZNZfp0XFXRTA3pLdXNCQk4
         JiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194834; x=1762799634;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6IBkTdRfVpO1bCNLk2LNL0B21F0Pxa2e8J5b4QlK6Q=;
        b=u36IHmUSXa5OVKIC7Aw8QOExcsiyUJkxq8r35U841rUWixpotJjoxJvub9ePxpDzAN
         QYiQJJHBdlTFYg+aLJSMdIYhgCjo4xQSt2Rq9hRP9b2QWD9HJlRZoEmNkr5lQPo6EcpX
         9popId9sNWALQkGA95QyCk80ms4JMmGlXYAmABABjiwPX+A7zvFKj5N4+WkJdGnW2sLd
         wVQJa01pPP9ANN3ncfJe3DqoZaGxIeAS+60/Qr+bCq3LE6MPpRQMk9x2TAsc5+wjsAUp
         sMgAE9yD/taobwUFTg0E9g+h96K4N2MHXMOx5VXjDpMwcf90BYsSgcYOFwJ3MwPprm8v
         uKdw==
X-Forwarded-Encrypted: i=1; AJvYcCWlXRl7rSHiqBgUgYdpRwEQR83xoyAobDbfZjB5Fd5KmMAiiH0+PBefnBIVi847RK5qVfYW6NFUhLSBmUc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DOHVbrKn/JoLeA4D62gRs9uZ1e8nxr9p+CrbS+/rl4HHwT6L
	mwRkJ/aVvoWglcmILjqPTbd+2h3mknxNsnEoShqS5QLA0O+x/N+QNtv+Cqg2NnBTpVE=
X-Gm-Gg: ASbGncsytJbG9++dZpWqmlOn7JW8FqoJXcdt2WEUr98siTpjyp7f5ZbGoeo/NB0ck5I
	gq6T5JpZS5uAeWeYKWNIU7LUF2nq0I/yfEyE64pdQnY6fhIvMU0/xZ8yvMAnDqxuXQOURlFjkUx
	/WqLXp7ooQkhaGb/md76/IZZwVrwmtOxxHBOcyuKcxVjyLhIuOsapgJ3v6vJLxy2uA23mTn+pA2
	zZj3B35PYRzNJsW80eGpe4wt3hKLSWXnovJc6Uv1ACO7M5uAJ/SqcYqG5O7gg3gG0UY0lr4HtIp
	U4/CJJlC9AKfuIVCTv43zQ1p871kxRjm0ia2UFsBmq68eht/vV7aAQ3+UwHJSEXSGx9kwRKuCcW
	n3f8GXuWZggVT+EkYZfm0O3K1Wkxs4oK2sVFyx/h1CXXKZSvPrFit0+l4peySEMKCMVwPjCee5o
	j7VMAGX7rG4h5Hns07
X-Google-Smtp-Source: AGHT+IHiLwkkP/T5WfRuyyDGcNUXxAsqql06SKeSmgibPQwsNkXLFhIvFubFnKycp+mU6mAdcvP9fA==
X-Received: by 2002:a05:622a:986:b0:4e7:2844:b5ba with SMTP id d75a77b69052e-4ed30df358amr195696001cf.27.1762194834405;
        Mon, 03 Nov 2025 10:33:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f5413f43sm38727485a.8.2025.11.03.10.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:33:53 -0800 (PST)
Message-ID: <41ef734f56c0168e65e149cabf28d585ee5f2428.camel@ndufresne.ca>
Subject: Re: [PATCH] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Vikash Garodia	
 <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
  Bryan O'Donoghue	 <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil	 <hverkuil@kernel.org>, Stefan Schmidt
 <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Date: Mon, 03 Nov 2025 13:33:52 -0500
In-Reply-To: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
References: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0U7duYWV/opQAYp/tD5t"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0U7duYWV/opQAYp/tD5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 novembre 2025 =C3=A0 16:35 +0530, Dikshita Agarwal a =C3=A9crit=
=C2=A0:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
>=20
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
>=20
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dyn=
amic resolution change")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks for working on this.

> ---
> =C2=A0drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/med=
ia/platform/qcom/iris/iris_common.c
> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25=
c1e5bca0abe501f 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *ins=
t)
> =C2=A0
> =C2=A0int iris_process_streamon_output(struct iris_inst *inst)
> =C2=A0{
> +	bool drain_active =3D false, drc_active =3D false, first_ipsc =3D false=
;
> =C2=A0	const struct iris_hfi_command_ops *hfi_ops =3D inst->core->hfi_ops=
;
> -	bool drain_active =3D false, drc_active =3D false;
> =C2=A0	enum iris_inst_sub_state clear_sub_state =3D 0;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	iris_scale_power(inst);
> =C2=A0
> +	first_ipsc =3D inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
> +
> =C2=A0	drain_active =3D inst->sub_state & IRIS_INST_SUB_DRAIN &&
> =C2=A0		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> =C2=A0
> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *in=
st)
> =C2=A0	else if (drain_active)
> =C2=A0		clear_sub_state =3D IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAS=
T;
> =C2=A0
> -	if (inst->domain =3D=3D DECODER && inst->sub_state & IRIS_INST_SUB_INPU=
T_PAUSE) {
> +	 /* Input internal buffer reconfiguration required incase of resolution=
 change */

There is a spurious space here and also, "incase" -> "in case"

> +	if (first_ipsc || drc_active) {
> =C2=A0		ret =3D iris_alloc_and_queue_input_int_bufs(inst);
> =C2=A0		if (ret)
> =C2=A0			return ret;

cheers,
Nicolas

>=20
> ---
> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
> change-id: 20251103-iris-seek-fix-7a25af22fa52
>=20
> Best regards,

--=-0U7duYWV/opQAYp/tD5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQj1kAAKCRDZQZRRKWBy
9PcZAP0b/914MBOGdLEOJRB5qlfQHO7FmZggakf8Kjv9KEIB+wEAoKCnmEfLLA51
Nr5ICFgwip/3oMGjlaa1EDmEGyBpNAk=
=op9q
-----END PGP SIGNATURE-----

--=-0U7duYWV/opQAYp/tD5t--

