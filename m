Return-Path: <linux-arm-msm+bounces-101747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE9dG4WF0GkW8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:29:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D18399BE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B622303A840
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 03:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174843218BA;
	Sat,  4 Apr 2026 03:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="jqsBbXoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C26283FCF;
	Sat,  4 Apr 2026 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273208; cv=pass; b=hNFVbY8I+VtWzSb5V8Cd2Br1Sa5WN3nSDRGVUmup70pUhqLgoCu4QerL1JHXIYRLWP77a6DRSM+s/vJBfAiH+Wf48zVXWo2Gkn82dhufJccHuUkzLQd6IBQFC8/7EZb9uUuthORGZldZ6SNdPp/YOvzm+UmL3S7hksdIlWQBj6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273208; c=relaxed/simple;
	bh=1E9VasZ2IQGVmx6ceE65CfzEGp2ECKQjTNIsETs5rmo=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=Gp0fEfGGdWDI1mgAini+FlqATsFmkG1jbIrWf6bRwJKxTbX/PkEsdWiWwNfM1w4PNfyJiatcrkBQLXswfHsZkd2WvMFXllNaVJomAaMez6honcUWLgRh8cPnUEvRnas3zwm3FhyebAy+pR9lBK9gRdNsOe6BvLLcAjPNj4YZ+xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=jqsBbXoG; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8FEA8401E14;
	Sat, 04 Apr 2026 03:26:40 +0000 (UTC)
Received: from fr-int-smtpout23.hostinger.io (100-99-26-167.trex-nlb.outbound.svc.cluster.local [100.99.26.167])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 843BD401DFC;
	Sat, 04 Apr 2026 03:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1775273200;
	b=9hg/kyVPjnEE1MiiG8z/l7Q8G1bVxT+KTK19B2iWybMCzkknKeaB+9WDX+DA1vEt/dwSn7
	CpEjuwEPyTznmbVUaB8mzFxboNIvWHQj8VHkDIwiL1Lkyp8tGlFeKOw9NcUChRMLIdDm3Y
	XuYUC9QnSmCSG/vTdvqlNoYvkGWO/tKNi6+SPra/dnI7qCXWluZZuDSV1cB6G5nEJeMwE7
	MP2ZXNmKXPXuGQ5lU21DgbUNj92DXiPKIZ4K62qc3rXfTLvxgrmVnEEP1XA7pMs6qY+qWm
	DxxqCay4filQMpT6aCuNiUF8JM9uvo2Jn1eB6whyv7OZ409Qkx/mVA0LS5MTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1775273200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=R1SQ7fjo7+ZRuM2rzox3k9F/SpcRYsArVKq/Hhgx5MM=;
	b=iwEBNnD9+zS2ELnF8SD0PP+OYCUbVsGYtKXAgV4IjnG7VNNIl6GcH7csMuB/MJsOHOQDtH
	84XTXvDGrFN9dgzLaM0uuYROokD63tiC0rOWzYf3ZFBHUcYhVQTpPHpyw4srG0CvW12C7D
	+dfX14ZHMt+BBBRmLyWqhZjEskjq6B//nMxHq9UgItV8pwce6X0UDXKU1ApHStkmAK+tBn
	beIAlj3Zj1q58A7lk7iYS3Xm74D3NbJ4zNRhl2PpmySuqlyO3aOeSG0cZFny/Fw9pjZXHv
	gJAALlYSLoCP0QgIrqRjyqolJyi8XRpi+lEhf17VZec5/qAfrpWS2ETMVM0cgA==
ARC-Authentication-Results: i=1;
	rspamd-bd48b9d95-tphdt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Ski-Industry: 53c10f4b7fe8dd5b_1775273200370_2538399836
X-MC-Loop-Signature: 1775273200369:1964789207
X-MC-Ingress-Time: 1775273200369
Received: from fr-int-smtpout23.hostinger.io (fr-int-smtpout23.hostinger.io
 [148.222.54.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.26.167 (trex/7.1.5);
	Sat, 04 Apr 2026 03:26:40 +0000
Received: from [IPV6:2001:448a:502c:15d9:9c4f:9add:4209:3123] (unknown [IPv6:2001:448a:502c:15d9:9c4f:9add:4209:3123])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fngx44rPsz1xnm;
	Sat,  4 Apr 2026 03:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1775273195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1SQ7fjo7+ZRuM2rzox3k9F/SpcRYsArVKq/Hhgx5MM=;
	b=jqsBbXoG1rC99vrEaa8FBhONnFnaAMFprZT8yns7gyEIaUgLvbk88nTIbO5GVTVzZZ29xR
	cEE4VS5YkTsZyz9yGfJH5Ens0K4W8NKt+ok+KZ8JePI0MZARKCoGhMlMMsaXUeTET8dCFM
	uPn7tNIbzao4LhJ54DyI7HF99D0d93m6241lAWFwpYkSk3F/7cdYGDvHAKGs42Zun8RlZG
	LymHPMvhzT5HXgD3UTev7NcuUHEYizCMgnyYiqxp9fmqa1usRtGUvGuIuMo+S69B2m3wT4
	IFeWcjpQOxB4poKZfukIlF/pbhkDmpYgvj6m99txbkYYkXaZ99kKlC2NtQOICQ==
Message-ID: <1b47a581-3a2b-490c-8a39-7a2cd0ddf8f2@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
 <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Sat,  4 Apr 2026 03:26:32 +0000 (UTC)
X-CM-Envelope: MS4xfDFr6qI1yLueSnYLSLZutcUNO4z6ua4xADNS38k/3ticZ91XT9Ns+eGsGeS/1wLwCn9JesiboKqwRgjlhIU+Duy5JptvWVXe8fZgTiy93+ahtmNeGjc7 iKWtt4z0WLQDwiotx+fPLtLBS6hb5dfXdtNC90CaEhKce51VnyycNTzU+NWl9PJjey1dmVLD1aAuisIeRIf/+YJ/StfmwqC818akYwBCWnWtk8AMnT26VQ1n K1QDUV2d0J/cQSPKBxm7c5kxr85NeEcX8mr6vMwMW/AjPOJ/Rw+vXiiFdveMdZMUIURKa3OFIDfK4SpjIQInbD2xqmNtkfODmqlY+WAzUx+3fy3AeHvI7tnU LegwfBWMYFT+YqnICKkxukKvOGYdtARnSsYr/NV7RXyctrt506M4NdTdCpIfZPUuHOhNXciMI5xsGrAqfWnnYpvcEVJ2pxRa12zpKDt2FJO4YFxE6Gaq/xAG M6dK++7v0C/6JVkYevm11fPm6yemq3AqfQ2Cbq12WwNMh4MvuONv8HAGHj0bF9UORo+C6z4WCO41tDKsqpaAFdeaFGup6KxdnLv7emfKuYO0auA5qIvU/vcj GMYtA1J2mKx2bJI0c2WWuWf6VmZpeShUFZq1OMaknYn1GZT6EA9Vf/1aBjRP0gkNkp0UdcgHRjJn1uSXMgEejmKYuEeIie4lBy6nmMG1FzelMFRgW8WoQthR NYfbgxCdovQt0fkQbNs+RdUJ/v2z0ylN1YMO9tgoVNqdqbTPAApzFoKbTp+J9Q+091jnzM0IzeU=
X-CM-Analysis: v=2.4 cv=GMJaEfNK c=1 sm=1 tr=0 ts=69d084eb a=cSRZGm2KIti/amQDCKp9sg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=ehOGM-R9AHx4QcEzjFoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[smankusors.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[smankusors.com:s=hostingermail-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101747-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[smankusors.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:dkim,smankusors.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@smankusors.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89D18399BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/2026 4:54 AM, Dmitry Baryshkov wrote:
> Does it also prevent users from spamming the dmesg?

It should be for no such channel case. The only remaining error logs
from pm8xxx_read_raw are timeout errors, which I don’t think would
result in immediate spamming. Or should we remove the dev_err (at
pm8xxx_read_channel_rsv) on timeout errors too?

-- 
Thanks,
Antony K. S.

