Return-Path: <linux-arm-msm+bounces-47695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB42A31EE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 07:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB105168209
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 06:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFD71FBEBE;
	Wed, 12 Feb 2025 06:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="EMAxMEDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998D1FBEA6;
	Wed, 12 Feb 2025 06:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739341624; cv=none; b=XTYW1NT/E8A3AzZHANRpwaerdAF28xWIGsCNClzOaBmmvvpz72VA37dY2e0uu/rf1RWj1AQofAcxpFKrq6jRXSEENyYBKZhds2MJJElVOcY6IQU5ijegH101qAzDOoy1Z+3pmbh2OFB+CYVGaITuYIOnYxRZXeZRRoofnl21bh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739341624; c=relaxed/simple;
	bh=65IGQQyNlGL97eMSscE+Db1rh6uKwtQ4wn+Khd1QG0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oOct6qB3ZseyUhGFiWT/NAefXDD4NTWi+6wS+sY+z9kaIxSAIfBWCU/d34wjo4kaVtaJ+D+x4Yi9k9Xr1Ylv7PU1Dyu50XP9ViJUehkaA47v+QYmtIXfJEL8CVLD27nM4tlofmvGTbH0BZThoctzMOMH2AnDWbFn/THDJaPUTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=EMAxMEDK; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Yt7d86tH4z9tFG;
	Wed, 12 Feb 2025 07:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1739341613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7N+XpMkRRdoh+Bj42XO2iok1EBcqM54SUgrwByemnI=;
	b=EMAxMEDKouOdv9tfDkWZG9Kxvn1mxdnuLb9WNeAiCvYXxc3nVbfTsgU1q415iHfhYwMkt3
	zmElKwAwm9kd1tc9HhilRWGK6l26GIvDEdQrmRDVt4bGZYe9GdOiuy4xQs4hRe6WrQPMU4
	RcmKm8z2Vq1eUAlNA5jGkJq6lZrpGrjOI12C8UNWS0+Cr9PAvkx7oTPy8VA3tGo3zw1JpP
	aS13FsSF/ENWFui/8nYg3htTcVtf8MauFZB0Ecs0Ai81Rzlh0JT+1Igxkp9nCsJgKn/bTm
	NKTlPIkeOMH+7bw99qXZ4Hmjkjphs8qfeznOTf2sOzwRoH7nKC2iQml3GjXbIw==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  Chris Lew <quic_clew@quicinc.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Stephan Gerhold
 <stephan.gerhold@linaro.org>,  Johan Hovold <johan+linaro@kernel.org>,
  Caleb Connolly <caleb.connolly@linaro.org>,  Joel Selvaraj
 <joelselvaraj.oss@gmail.com>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>,  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
In-Reply-To: <9f8cf902-85a3-43db-bce9-4fc9b876c473@kernel.org> (Krzysztof
	Kozlowski's message of "Wed, 12 Feb 2025 06:45:17 +0100")
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
	<9f8cf902-85a3-43db-bce9-4fc9b876c473@kernel.org>
Date: Wed, 12 Feb 2025 07:26:43 +0100
Message-ID: <871pw38yqk.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4Yt7d86tH4z9tFG

Hi Krzysztof,

On 2025-02-12 at 06:45:17 +0100, Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
> On 05/02/2025 22:57, Frank Oltmanns wrote:
>> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused =3D {
>> +	{ .compatible =3D "qcom,sdm845", .data =3D &first_dev_remoteproc3, },
>> +	{},
>> +};
>>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
>>  {
>>  	qcom_pdm_free_domains(data);
>> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
>>  	return ERR_PTR(ret);
>>  }
>>
>> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
>> +{
>> +	const struct of_device_id *match;
>> +	struct device_node *root;
>> +	struct qcom_pdm_probe_first_dev_quirk *first_dev;
>> +
>> +	root =3D of_find_node_by_path("/");
>> +	if (!root)
>> +		return true;
>> +
>> +	match =3D of_match_node(qcom_pdm_defer, root);
>
> Aren't you open-coding machine is compatible?
>

Thanks for pointing out of_machine_is_compatible =E2=80=94 I wasn't aware o=
f it!

The patch was already NACK'ed by Bjorn, but I still learned something
from your feedback.

Thanks,
  Frank

>
>
>
> Best regards,
> Krzysztof

