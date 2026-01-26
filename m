Return-Path: <linux-arm-msm+bounces-90560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEpTFbVid2n8eQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:48:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EED8B8876D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79FE23008317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAA53321DE;
	Mon, 26 Jan 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYpWi8RU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5512E3376A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431726; cv=pass; b=Wj/tkMWxOaxXCNIq1q3RIu3jrR6/eUbniu+V9pvNELyjrre+wszP0V+OxMZNIietR5/NS0qVFLsD4P3vTRbDbsn7UI2JOxJzYS/iiABeU9EfFXieDA/ZEAF3T6kEsjhFYU+9BqZRtPO10KB36/jsgKHGdJFSS2e9+HAJ9OVu7OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431726; c=relaxed/simple;
	bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y56jWBJOLPiEvHLOUHUlcg2aHoq6JO2liVm+StocA0LGtWDFbhlZMn+41+hHE5esr8cJuyKRypiuIWYinPoDjesSf1YZ9LzK2BPC2PsIVZrqWQPXhK0w5rDeoWKm/hDCBTjU8hgyyTi/g8q9xbAHERz9mq46pFImSqPb1w2FOBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYpWi8RU; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso2970032a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769431725; cv=none;
        d=google.com; s=arc-20240605;
        b=fuxIyGjMNowl8kCGBnQ85vUZZTkJKEz5z+n2c++VKPdQ8NNPUdloxpCtsjwddF5oRT
         vimTj+JfOowgW5Tw5HRJ2om0Yg0NBdaO0/XT5yhI/tgyGXvem3DbfqyTewbQH43wZOih
         QSWije9LmBX4VHmWT8mqmBxk2q03eoCWR0Rh1WTQ9YoDBzx9RvxZq3UHd21coQsn94et
         AY8e2p0sKNCygTlpHMxhC/wZnEwNTYST4mwL2gGD6UQgJqJMC4FJ1z64FdZLPzarufV+
         414J1QTjleWFEKGD/VoDRzl/Brv0BDxY6JWr2RAEUx3p83PiYrDfgZq5YSyQ8aWC4enj
         wH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        fh=3LYbHnKLkZwLL9NBIL+XMeHSZmuB6Glm/z/IyV4t+zk=;
        b=ftDgTP2G9JrHBbwmQ+zY/0hZjndkJXKCrwRyuVpJa73x+NDx1kbrHUZFiie5apLLnH
         cr4+X+yG9FXwETqYDN/dVpNBjQa8RBve10zu2ktin14Cl7095f7udInvPmccPgCpcYNp
         BA0D16F02EPxbK9DIivl4OdyRXmry+7y3Hp3wVBKwXHdZmj/YRtnUv5uC1++Iw1MEFEU
         99aqJG6e8y+SuHAkM/lYyiB90Ia792FaESspTNhRswlSjO0Ssinjdy961GXOkmQe214o
         oieYn0RzXt1EkE+l645vFxAr5Yu0ly/FNoj7ZIAZxUrq22QMVlKv2wF5QODzRCYSS15i
         vu8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769431725; x=1770036525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        b=KYpWi8RUg787QneWLKwB4NlSNNt9xJ/iiwz1p+mhJKvGzpGPQWZv0ZK9Y+2INa7Em4
         c5TD3qBEAEmPVbKHPMqHX1/O4Yye8fU/7W5T0VyC6MsrV3Qx5Q1aMF7wJrVWbqAotDXR
         bVdNMhVnp9sF3al4cN16ilESVGEHeD/ARzo/NqtWEftzaUoN9TWKkSdVbTeSO7eyfJ0u
         pIPVRVC3rPg16vhRs9oFBqWZHs+EdnOOfJQx4gg2QQF5xR6YGmN3Jzv4ICp50kpgJaYc
         AH2rlhJLtL3Pxaqyo65rSHzIGRabdgNnmL222SBTHl/sFkydYPrs3HHL7A1BNZvAYskw
         Mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769431725; x=1770036525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wbUefewEyt+Bxa1epr+p529X5zn/t+qG9ZDeOzVm8Q=;
        b=lHu35S/huEaYjp2U2+o9yX8woCAs2H9owULLW8FAmqlhjuOFY6Mec6NewyUj7GXq9V
         pkmsqRuTmeBqLtsZrbho72yo7MFhH1CSg74MyaG9lMgUfbCFdoDuyL4X+4x8dPPIVT41
         1DTLEVDdnXFP1BduuTz2ap6Ooy7VRTGsqsWH6TRrsDl9nUIBI7KTIn7hRc7b4rNS6uod
         hqKpX1AacExh43x9HRrbOQUIEWGsCF/eCvNZjoHQa8S9PoEM+mW2HSIoGU/1++emvH0N
         iHpg2BqYgwb8i3MobxI7cb5MECy4X9k00zkUcMTqfT0aX+ynCjiiBzUUKo6pkbikXyNT
         1/XA==
X-Forwarded-Encrypted: i=1; AJvYcCUNQwIpHsl+Q3R974ZyL3xmh3sm5x30u+id79u/CSvnp7GYSodxntuFdp/GAy30DpzEqCmjLKIZ8I8xQrAk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhji1LuPci4oJCBMDCHiUaVCZONAz70l//IOJPKNsEz5kNU+ww
	p8uvsjuqw11hza8DrXHl67NCY6+eGwQNNskOSjCkUEg1XeR+IZmpTAWVTW6Z2HfdPg9gXdvtxgR
	KWBtesEynzOJ4FkGuX0kNgM7QbZiHmwk=
X-Gm-Gg: AZuq6aJ4latjTQlKQOTIJK0oLsMwY/jfECxYqyG1acPbBba4f/hQ4LevVLJowCI1cYG
	83bN09BCYLdM2+l3KaOYfDfpZ/d/Zc75tgohV2YbtKczFbXCZa1xZ0y4MmjUSkWzbrGI1fho67+
	DtFTOpdBmchN5Ph1UwhGtPPZw8kbXvnDtoubf09mUSxLs31efNR1bOZ2MYWPngjIYh+XH5eGkGh
	7GgGZgjzV6lvhUOCNdR+pmTbvxqTA1pkiUjom76tXebP5lRDQiVUiVK4lVmP73dcllt8Bg/nGMv
	4jLeQF1bp7niwWoVYqsYsts1mqa0
X-Received: by 2002:a17:90b:558e:b0:34e:808c:95eb with SMTP id
 98e67ed59e1d1-353c41bc40emr3364991a91.32.1769431724676; Mon, 26 Jan 2026
 04:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org> <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org> <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
In-Reply-To: <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 18:18:33 +0530
X-Gm-Features: AZwV_QiImwHoTrhadZXSVk9XMUduYaFg4Doi8X11Lf0vWvPz9vytxnHCfMsQkoM
Message-ID: <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com, 
	vladimir.zapolskiy@linaro.org, hansg@kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90560-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EED8B8876D
X-Rspamd-Action: no action

I used a 2ms delay for the initial reset assertion.

Thanks & Regards,
Saikiran

On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/01/2026 12:24, Saikiran B wrote:
> > Yes, I implemented your suggested sequence in power_on():
> >
> > Assert XSHUTDOWN (Reset GPIO =3D 1)
>
> +5 milliseconds
>
> > Enable Regulators
> > Enable Clock
> > Wait 2ms+
> > Release XSHUTDOWN (Reset GPIO =3D 0)
> >
> > Even with this sequence, the brownout prevents detection if the
> > off-time was ~2.3s (I got this 2.3s number by conducting extensive
> > stress tests on the platform starting from 50ms to 3s. At 2.3s the
> > success rate was 100%. Anything below 2.3s, the sensor entered a
> > brownout state atleast once.)
> >
> > Thanks & Regards,
> > Saikiran
>
> ?
>
> ---
> bod

