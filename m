Return-Path: <linux-arm-msm+bounces-103837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZmMQHC6F5mnTxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:57:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6530433783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38B6D300C033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2473C872E;
	Mon, 20 Apr 2026 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XA9HNag0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4024F3C2769
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715051; cv=pass; b=DYv66BNScr7Zw8yddx9ASV5OJHxg9xa2qwKea4911xhyeZJB2XdBgYmE5qpZ1ohLRrq0m1ylbKHbkhc5mrcbc6+PkDYsdItSo909HaxBHA2Dml81l40wlus0eUe6FpoALPk/F6WBtO+/iaszHCqSyh2lTniHHF4TcNWDd3sNIWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715051; c=relaxed/simple;
	bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPv9/rsqktJJD0os8TaY/2J+3uUikKjp7d6w3s1Q7z0iJ2AVVCBr4qNFEQS/f3ARnvjI4Cc/AOx/az+fMfT/M8kBL1r73AxAbOuxaJ4pZCHJeZG8I96Otf346gI4pcqT2FKT6SR5VeoyE2rmPEkGMhNxL9rdvwta1NJw0Ah9Cr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XA9HNag0; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so3791837f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776715049; cv=none;
        d=google.com; s=arc-20240605;
        b=LaXRifC/HL59YlGUKJoo+Jk3Lrdit2oR9L0n2+i8eNqwrVs2pxfeySzJ/sib4uL5DF
         UCX66oYXiNy7cCvf7hf3glC62p9503nT0PhKy9/BwwyP2HgHj50+ss32mu+t+6qNRqcn
         eQpwRnMK/LtOMTJ7/dEeuLRC+p/ykDf6+eHsE5DaW8p5GKrTOalQR5LsgoXD1zcP2VIn
         osaqpbm8GXnbYuLq4BitDVgJ/lMZKV0ZXUFfmeTS7K6YDI8LE43S0vJ/H4g9EFUCD66K
         WdMimYWn6T7tI6zWogk1pbJbVzqMNeIdVelJkR5KTtm3TOV0doj2BJgD7lyC4FPCIHEf
         jZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        fh=G5ruyzMi2DwOJFOBRfm0GkMlSwr0reTethOUs+YxTbM=;
        b=KPrqTjgeDbnzhZOxqWMN9jwpiz3+wpLrJP3ewC8BFqiJ/nu10Ec1qzNOHqLgfYCFO/
         A3o/UhigxRKF24dOgH74K+xX4xMXH006p1XmAXhYc52YANDuxZyosFgecbkkQNKs3Tbm
         3x7IS7dUt5a1rCcePZKsGW9+FnUBc6AJbNhZ8ZSwIMNm9XdCMaItfnNqGP6jd+sXdVO5
         2HZzdfiyZEwQHZbRrz8Lvu+dCAwEqlsb1R6TzuNvT6/Y9683oA7B8fWjESEx0GN+yL5u
         8zupenOhQCsRSP6nO5a0GWk6x2UaZK+YkVVr53InIMYONfWNzlBBAUqZ74YmJpRgSOSo
         mF2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776715049; x=1777319849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        b=XA9HNag0muqVqNomQx94Rg99g7WdBxws2zM4TtDwHnu6LPPIKk2NBcOWO8AuErzNk6
         qpW3HpFkF9hjnTX9ckFuuDdCjfzu1hEkWjtIg168/Yp/znQkPW6dfCScqisNPtKi2/WX
         7h027VMqbF+Zm4cCdnCr255FINRAc+Mow/D0XP94G/p3PDWKpHte7zKm6Y5ZJm1+vsei
         4ht7q7kJavUgUO5I9ziWqDodETy2dV5j5T9e+rz1YUXXaZ0t84VxWxR66SbouCCVuqlj
         dJnapZw707ag9GFqsy0rdj6kVBba/PJcjeHQRi9ADKDJr9NQn4GiHKAoPoa8ASICyMSG
         WP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776715049; x=1777319849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGNyxGaCqqvjGmB1UrjxsyafCLtfON0c7TpLnePzPoU=;
        b=Rg2IA2eIimNBcLcDUknqcP0Egq0zCvj4HzJAFSIvrDCXJBkeYSI6cnHB+b3L/pGpv7
         7KEJuAm/FmViuN7zROjhk/7sjkE08nOehd1cBLidVo/6EYTS0acrAbtoI8hms9eVa0//
         IWnZ3taqwkb8hsjZVD8EPlXEULtFnNuua0GvAxC4SFPkjPzYw36fBucS2Wl90zspshMo
         cY1QiwP5HSaCwkBGKPJpizDjDI3D3IEGlE/QwI5PJJWWt+n8pNoNsXb+qYcbHQ53z5yi
         qZeYcPoD6JIWsME2f+ydOgHHEOMBjsQC2D3FIjgHBJ6TirgSsHn4AXU1YDPInFUdBKrT
         Z/pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yvJ0RfXftUsLMODeWc0EmBlH358FIhqJqmmIITvjsGvTd7nVQEqgg9rZrE+hKSHf7yVbfaT0OqxD+8fS8@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxkGXTTB3//IE5/nSNDEsaXdLtmh4pVIXP9r+GFMi1Tdbkf/4
	ddONDNaBBOKVxcT0cQBxXJVKr9AXw+GDKkK/8dXdylTXQu/H4Ui5w0yIyUWRWjYU6nPTLUxR0kP
	6dvYUb48vKKP/Uiq+iA2zZrtR2ixgxaoDxXRDBBEPmQ==
X-Gm-Gg: AeBDieuF9DrPp4rw3fHgsE8R8W6/HcBc0vjYRFAW4rJGcY1sUjz6lkbrCIj2dP3HWsy
	FeiklDgWxbshaiNym4TbzqWW0H7VGJXUVJDcZxumWPLkIyu1uGPRzrDzDdEML98hk6VRc+oGEQM
	yvmJTLq+yZnYq7iCXdFkNhm0l/UzXkdUQOdhlbkIA7XkCFz64du4LdTVgLotbTy73IOJUEU2Omq
	kXu9VXJIKOnMk0EZ0xplynrwlhVOrCoJ/UWPuHZk1ZxhWgsGKfI0xgezyHEOMpm8TjJbs0OaBJQ
	8yV7h7hCyo15a6iWPauglrMJ1YE=
X-Received: by 2002:a05:6000:184b:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-43fe3e0bd7fmr24060028f8f.28.1776715048203; Mon, 20 Apr 2026
 12:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org> <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
In-Reply-To: <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 20 Apr 2026 20:57:16 +0100
X-Gm-Features: AQROBzACmX0cPvDYkQeJ28spfjSOvMM2oYx-m0UuRXWzp-LCBYUWWjVoVMUQJyo
Message-ID: <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103837-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: E6530433783
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

The background for this was to ensure the firmware is available in a
system image
or copied into the initrd if the driver is built-in. This is done in a
CI environment without
access to the hardware.

Debian's initramfs-tools looks at MODULE_FIRWMARE and copies those
files into the
initrd if the driver is built-in. For now, a workaround for me could
be to just manually copy
the firmware into the initrd and drop this patch.

I didn't get to the bottom of modifying the firmware loading code to
make the driver
defer probe to when the rootfs was ready and instead just threw the
firmware into
the initrd, but that's another story.

On Mon, 20 Apr 2026 at 11:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 19/04/2026 23:39, Christopher Obbard wrote:
> > The driver loads firmware blobs at runtime via request_firmware()
> > but does not currently advertise the possible filenames. Add
> > MODULE_FIRMWARE() entries for all known firmware variants so they are
> > visible via modinfo and can be picked up by user space tooling.
>
> What about the board dtsi files ?

I really am not keen on adding all of the firmware from the board dts files as
MODULE_FIRMWARE entries into the driver, it then becomes two lists to
maintain. What do you think?

BUT talking of two lists to maintain, I am essentially duplicating fwname in
MODULE_FIRMWARE, so perhaps my argument is moot.

For my use-case, it may make sense to "teach" the initrd generator to look at
the firmware-name entries from the dts files I am building for. But that is also
not ideal.


Cheers!

Chris

