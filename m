Return-Path: <linux-arm-msm+bounces-94886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KCGJWNwpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:11:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A91D7427
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6DFB30175FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202413603DE;
	Mon,  2 Mar 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDt4QIf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCC35FF5B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449889; cv=none; b=HIjipN4wuIEZU5pGB6TxxNY4nZJqBtrzSiB97//xVDY5eWj6IyTUSH1njmfjTUEqouXPXjHMrbXozgmCKxE8E/GJJMMPIxU3iQV/NYDF+Ue7UNNv/DZzTdEMZ5qFz1s2M33Utb/qww3nlzdZFPsNG3Cx/9DpREc9mRjZkPQPg0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449889; c=relaxed/simple;
	bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bXHIpfP/308+jULSZFnTo1wHnx+utE2IMWc4UquEr1GTNs9wOLbYbLpxxcuk/pO57//fVb29NRvrPcQxvtVyJBMnLKG2MKy9+3MVobKjEDcmG7w3X8i4czbntXNf2xPqhkHaZLVgAB5Wm5Y8+umAh/fLp1UQfh4rmo2kEt+t7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDt4QIf8; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65f94011dfaso7592388a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449886; x=1773054686; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
        b=SDt4QIf88KTFPb541m9HR5MVpYw7fn6bFQ0ZAHeA0kdWktq+BWVNJViO3HuMwOBsvw
         S9LHS/FVgp82YCQs1sqXIxgvUFBQg4Ufk6bqOr8r7KvkhWCv9wMwCMqfQPrZ7Aza/UdS
         RTyFhBnLiZK0hMi97+tc2QLiPBdYg49pNZct11I7jmlKRmjbqLPNBC8S8eXKwhUF/UdZ
         2K4dLhY1v/oqu/HDYjpnRhvbIn+5mXxdXHwbLxn+O4a8ER8JhEoKhxs5JeEKOxFcqldz
         0VG6hQ/rJdIRlhl768bxFZj1i2HX/s8A0sQ46WrfedRZLonkAvZZK+P6pLKj3SKVWoFx
         ffNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449886; x=1773054686;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGgtlMxxZdZuCnKnB6HC39ylIsRD4qzKVesV+JA1mbY=;
        b=FAFc+wPuP90fwpixT/ihR2m9gTMc6BPNCd5IkKJpVJETyB4RNWKyHVhBWr4XgDq+IY
         OsLAaGMvIS/fQFNEJBDyPgsnNQKYraMowaS4Fej2KvEdEXI8y9KZAXYMOt59Yj7G4Ftu
         GBrUw0vZjeV/ZomO7OobPhGFxyG3PTK0BayJ5N2pHbwcFDVgSdL4f3cpCzkfA7AwQW/x
         8No66zWg5jbmQavQS5xvrLiFALrF/140FVzmHx8+T5WoDPJXDEP7EIqAf2akMLeWW5uo
         Y1pdWCHgzVRtFJ3fU32OGx9NfbesokwtA621hp77KGi6oNNxBI4EfQ6wUT2W1yqdomYL
         cvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnAGY3rJtx8ZyrOZACnMbKFGO5lNH0oEiKd94GsQYt3tJrgzMUMR+vQVLTROaz0E3nlGvvCCRyrQF9A0fQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTg42ovkJenZUb3umyadvpwdSIWNjZyjUAiuPZvXGFirMbep8R
	17ZoLhQ3U9N4yIGA/DZamIlEkElPLQ3q3nJ79x7MswtcoBfr0SYVR04r
X-Gm-Gg: ATEYQzz/RuWYDX+MxJilVh+9tGMNqsPkDTp9SPQAltojyA34yHOAyGYQxtSp51BClag
	i1k8d+IxQFBaHhvUuHUJRB70WZIJOWicttH2DCHe1Hc8R2AqQsIhzLC+/pMKOIBbC16j241lCxt
	ndTh59bYcWEufFBUcEwUvX9h6HcHA1zZYFoJFwUJoZf5SA3xZ4jGaLk2G/HtkNS04ihg5fogd7K
	tRD0ivjBWe2POcAF+sV7a5IEn1/4d9nhoCJbEA8a8L/wB3u9Rzag4BocGSqqObX8quOIG3gr9L4
	DXpyeerjSGNbqxXgo/E5R2DbVTh+zbROGcqe2IYqAiRM/McZxr55rwSXxzfFYcsuPFJeQugo/cs
	zuvQ8vAOJYXJpWbCMHoDWjELXb5ldMOWqXtOW+7pEkDKcVDM8njYbiF6j9jAJt4S5yFud86pMXP
	tU5T8N/feM1xXPGz24oiqLBomsUPPj4w4HWtmf/h2R2qSiWlGPpQHwzw4iRfrhnthi6g4M7pa7q
	83SuHP/pEKMpJ3vFAqQDhHBwz7S2T9WSmja0EgEezAazoQh7PBuhCHr0wwuk8MJ4w==
X-Received: by 2002:a05:6402:1455:b0:64d:2920:ef29 with SMTP id 4fb4d7f45d1cf-65fdd4cc71dmr6935024a12.2.1772449885969;
        Mon, 02 Mar 2026 03:11:25 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e299sm3311350a12.26.2026.03.02.03.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:11:25 -0800 (PST)
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
In-Reply-To: <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:11:14 +0100
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0884ABDD-8FE6-47CE-A8F4-C5F6061E0FE7@gmail.com>
References: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
 <4CA1838F-504D-4EEA-99F4-B3CC5EB10EDA@gmail.com>
 <goqowrvdp4uwbakbp5cztujh5q5z3jroql7m7dumlp64lj4yph@4n3mjqsj5n7i>
 <885a74d4-c61e-414e-92a1-863faad931ce@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94886-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 416A91D7427
X-Rspamd-Action: no action



> Wiadomo=C5=9B=C4=87 napisana przez Vikash Garodia =
<vikash.garodia@oss.qualcomm.com> w dniu 2 mar 2026, o godz. 08:31:
>=20
>=20
> On 3/1/2026 4:05 AM, Dmitry Baryshkov wrote:
>>>=20
>>> br
>> Interesting. So, most likely, H.264 decoder can't cope with it and we
>> need to allow non-NONE fields only for MPEG2. Let's see if Vikash =
will
>> have any other ideas.
>=20
> Venus should already support h264 interlace.
>=20
> Piotr, do you see the same failure without this patch ?
>=20
> Regards,
> Vikash

yes


