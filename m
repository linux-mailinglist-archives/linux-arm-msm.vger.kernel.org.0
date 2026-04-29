Return-Path: <linux-arm-msm+bounces-105114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMjXNR2n8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:37:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBC948FC9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5920D300A30C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EB633A716;
	Wed, 29 Apr 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhcZB74z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6D2E9ED6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444634; cv=pass; b=oY0ZR3m4byYRN1POIOAQ/99cZ/6ZiaVT/+BtEQ7Uh2/vL0OPOhK7YYn1+p8PjHfK3Ti9eFp9PeajzUsRbAWMSMooWIZZnKJaUXKMKuGeh8asU7TC3PDRmhJLB8o70cyGg8c0jGClEaxLH0WvgqHuvv5PivOZcVrLlGeas9HjzZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444634; c=relaxed/simple;
	bh=Q2vxHwF+w1NeyIBy9nFRIS4OBMvwxx+orrKuuS0Quww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6MTy/MetLCgceH/hUf6UxVm1vTzBYvSCUdu+PQSrDsGRyEoeuctJcmi0tShYNfQQcKlDY2awi7SKLzibgZUHcdmj2mbrJkHIYcLZ8oSLq7AYVm6A42gFN/mQegUJxOitYE57cxCN3q5CSs/SuoB45PIPxQ6kyL3DfX75TwKl40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhcZB74z; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso7021318241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777444632; cv=none;
        d=google.com; s=arc-20240605;
        b=Van5BMcLcPSxpZcuUkDX2iYj0P4x/DxY9CrFnfttd6PK7cgp6/AAsSXIPWX5GBjA8i
         0JbfqNrRU/wjzhu1laEdWygdMNnUKNXzjQ4DZ0iuGAPMZK7p4NknAk8XV0ci0fOj4QUf
         zvZvJS/Sec6QJjzExkgzfi9Vvbr3UBlUM80pBtVnShH7Bx/K6MxKUjNOiLZ76cmejkf4
         pw50MB+mZfhSzTJ0kqQvJ6NzluZ6SRxmru8eQEblQkW7Qdvyd3aQ0l2m6oMy7S2gobKt
         AgUImJoO9maQEPzkZ1DAm1CpOjyNqZY+ZXqtInI9ni/fzGesdY2QpVIUnn5Y7ix4o+w5
         tR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        fh=F6nRayZEh5+k1g+QBgHJ5a3TFbNWnJ0QEr0RvGug76g=;
        b=CKIi9dZ4ZunTW1TiNTuXpjpZP0Qmsj95Etk6mQVV3hQB7D143eMnTZun8vQbp2gvVH
         fCUljrleb0sBSl/n4LizGzfAh4clSSD3rocCmyM2RHVD3FEKo8QI9FdMSccSRnw6mSUf
         IXz0TsL/+vrIphYj1s9L4ma1zjbKkblZ6L5nVHP/hD0tSjVMoOfOrTOyuiwsn4zXKSsM
         UZZlIdgaojcIiLR5Kbqme5jSSj+Z3xZ947KMRWG3b6MKU6sDV037deUfkTqJvGUTiRUv
         rYbyGtd7VKJHmM02yvh6eKdwQyLBgSmFVYFjKkl3DkClDSOTH0rtHOkXg3jJVROQSG5y
         clkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777444632; x=1778049432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=IhcZB74z3qTipT2irKKaBm66Sy7n9HXXjdb19VgPXRN/Ot4hktTLvgGDT7Xs4ydD60
         mcmy/OyGLYKg+shxv6SM/hpJffQhE144iHHHZnQS2902ShxD+gUJgXFFrknLIVkxxaSP
         YZAQNbYL4j3w+yB5Izr03sgaw9U7KMw46v7MZFOsjp2poscSTIgYKUFV3Z5R3A6CXsSO
         xgnyHBlYilE1UNR9jhEFojsZUZJLl78/vwZ90rTD8Ho8qaclvdlvAI3Cu1z5fwVgVkG0
         KCedrTMB8jLW2eZ1+8ElMwWH0xAdSH/q+MkSqDL/+rXJbZ2X10utlKCcE1Y4e8eFubBP
         UTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444632; x=1778049432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4JGbabSxe5kDg/hMbP2sAh1Oso0gASiI4ZSnSAcI7Q=;
        b=OY6JHAspWf+p4tGDhBP8JrR4mqKmsYVNhZgMJvOSWeEyqiHbtgpHIBgklT4mFZZLIh
         nWnXpvIrz5ogKivIFbrYdcW/JncjZwbKGPwyUKDr/aW8qD4NUF8+ML48uUkquszgc4z+
         o0HRqXFgCg4DWaG21ltHcz+7A3uF35xOEBuc1BajZeMY0gofTpKNZAaI2FwK8AhsQX8H
         NdUaxIzA5vBgvMd8Zn/9GJovAs4iGxLuMoSwW+L+4rrqJ7cTt3ttB6tdnVyIpqIl2LHU
         DLJQiOalp2BJt7VVnc/4xkShuWoAQoCHo51CHS0fNlc9WNWqf1b7JWtbyL+IHLpi5gpy
         md3A==
X-Forwarded-Encrypted: i=1; AFNElJ9OnZ1Nm0SKqRTBJ+TeSEqcdZyIitXuhNFPLpg5EdJSSPFVkElftkPKPSIZU9o932BuJzMZJChbYMnTaYql@vger.kernel.org
X-Gm-Message-State: AOJu0YylyLZjkxlosHiRYmpzRnb7HSgxfj9VxqJtaLClxB0Jl0FPqqAH
	t48PTAxUfy2KdQBel6SjoIjkHD+4a/iZT35rNirW9Ju2nxZ8GO1TemcbklqOHdSG0hUffmY2mK0
	aSRIwbmgSoko6tdffcmVwuOuFs6zzN7A=
X-Gm-Gg: AeBDieslsNt4w5iTY2eLumtKbp41BTDPZXCZUPVgu1t7iN/V/pFG7QEWYrkyJKBUVOY
	xhib4MYfO7A+8j5QAlwPxjGgEMVTT3d6OXXOHxZucnWE/JrH4lMRaN7pM3FdhaXP3ShfDrdtSox
	YmLWtZcfdp2KV+YttSQj0kgythZb1wynKyCcaIdafx79KslPIgxK3Q8DHxL4afXvNW5or1o+lFr
	+AjYBG9F/K4krzPmuYKGmqBnIkb8f6JsUzGm3owf+ff1IZ4aJpp8WfH8BY6axYKWup+CP+ZS2Qy
	vggkUtykfUZ5Jr9trcdP6h8Kj6m5keAQ/qG0NdenrTW4jbkKqg==
X-Received: by 2002:a05:6102:1609:b0:605:218d:ae0f with SMTP id
 ada2fe7eead31-6280a9b9ae0mr3204992137.18.1777444632395; Tue, 28 Apr 2026
 23:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
In-Reply-To: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 14:36:21 +0800
X-Gm-Features: AVHnY4JomMW4gOBIDoscYuhdxXx5fsSdnFlsuPTfAzSM9S-h5zn83OQeXtICICg
Message-ID: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6BBC948FC9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105114-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> > Hi846 is found on my Gaokun3, descripting it.
> >
> > Note that it seems that only Goakun3(3.0GHz) version is equipped with
> > Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>
> Are there any other noticeable hw differences between the two variants,
> that could warrant the DT to be split?
>

Except for the cameras and cpu, I think no.(But I couldn't tell all
3.0 variants are equipped with hi846) Before camera support, this DT
worked for both of them.

> [...]
>
> > +             orientation =3D <0>;      /* Front facing */
>
> Please either drop the comment or s/tab/space
>

I see.

Best wishes,
Pengyu

> Konrad

