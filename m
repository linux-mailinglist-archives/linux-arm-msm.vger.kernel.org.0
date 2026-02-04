Return-Path: <linux-arm-msm+bounces-91780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePY8O+QJg2k+hAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 09:57:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0AFE362E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 09:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E5930A94B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 08:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0084D39E176;
	Wed,  4 Feb 2026 08:54:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA83039C65B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195240; cv=none; b=C7aEANH7iwgmuHZe+iWUv2JC9AnlcQs59EMufCcOnguck8UHYuSTZizpTXKuO5dLVb1yvKP1cbEkLv5DtGddAOQuBRUo+BQ7nbEMwOnIzPwCirdeV0vn1KuEacvZ/p5RVRMaRRhesqxKIu59WlRybaDrAdyF/FA8Hgu5hlUXRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195240; c=relaxed/simple;
	bh=QBTIySzQW54jDQMTjiweJUPBtTxPv9w65cNG8qDsU0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzKHZZyaob0VCFn1U1a7aqxjPKrfWR8UMUj+viPgkP0/4Qo+R0GT96Brx8ev6LDXFQVDa2BshHWAZysgt86byOl/TfJ8ZBXtoTwyJRQEGfYjNZ7oO9UVRf79N9nUCbZfGvH08yFO3cBq5j6/WDorH4NGX7ibaE0XuCZMAhylYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79456d5ebf9so65987347b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 00:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770195240; x=1770800040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBTIySzQW54jDQMTjiweJUPBtTxPv9w65cNG8qDsU0w=;
        b=K8F4K7ZaSd3/KBKMtXie7orBtN59AXmyJtXVMPNoP3oTp5XJJJHp54B48wMZ265nRz
         YbVZDuBrq8gpqqhH4MuFHAqzRKCUkGUk9N7PAa3OKE2NW7XZf5X5RWepij7Lm/Vpbj4p
         PW0BtaTwdepYyyp6PKUW5gh20nRm1lr95V+SWY4RceRaxdp66Jx2UV1rtfPctzK279Kg
         32INcjwJAtsREPAeEJUi+dOm/uHogJbrBt6AwiUuCn89qlebK2ug92827nptbOJx9fWf
         ytAp799RoZP1CutsoaXNjpOd/X9jNy+B5nraY6nh7+wyF2UGirmX0coQUIkAALpN/RZu
         MQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWl2meknif/6AvbJx1cBiiumBS794wLlBmXsRXWzKC9vpj+TUmj3lSwkSEcd0CbDYkEW77Whn3AMX7gwihW@vger.kernel.org
X-Gm-Message-State: AOJu0YyWzbc4vdLr61AXBQ2yOnjyfN5Oxsr+SaHJoSRn0DGaGloOufgT
	EIF9m7F9qeO50nQPjwNv9qVWiQiV7dziIuclDMjCEp4ZnFFQQn13g0rPqYbjgA==
X-Gm-Gg: AZuq6aLEtXBMXrGk6ULBpBN1R4ueTvK/XScPNXoP2pN7t+lSccuqcJ7hAAtQcrCCiC1
	R5sgaN+CNmqPTsXFF1UtnGQ0oN1sFD3pxOFaxwPSmOquskuDDuw8XayYAvvlB/T/dybGF2czrN+
	wJvDV/GdeHFKvJY2YPRikcwqTl73R0nYLC9raVw1rm8P2Vw/UTQDMHTDu1TKfPPx5Ox+Gmocc4t
	eTf2sdsB2fTC2XOGhHKrN80fzgMaclDyPeL+7V/JX4/gDACigiud5xFFgmIA3c+cvt/qCBBs4Xw
	RY+MKlSXvuiflNRtCkDdfWoAATEXvf7MnHTW1OKmIlk0Of0iBsJ+APoNPfq6xXENmgv3YW9F50j
	QOrmqVWxndrEV+25OD8c2Qj++AWvshwNHAq6odYVf3Tv/obV5fvQ/mvSJnFFKdye8S3oQi3dJPb
	BfUlYZrLcrBJurN3Er0pYyaTD1/o1QM8yOcaD1qgo2sw==
X-Received: by 2002:a05:690c:13:b0:794:d44c:868d with SMTP id 00721157ae682-794fe692f92mr24428037b3.25.1770195239744;
        Wed, 04 Feb 2026 00:53:59 -0800 (PST)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794fee82932sm16521507b3.7.2026.02.04.00.53.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 00:53:59 -0800 (PST)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649dbff9727so795563d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 00:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWP1mIRWEFPGp4gY6zeHvrKzFg2TlHL0nSTGfDSAGu62c9EfdGM7mWu6aJ3w0eIpqVu2v8VKJQB42LSM3BQ@vger.kernel.org
X-Received: by 2002:a53:e229:0:b0:649:c2a5:c6ee with SMTP id
 956f58d0204a3-649db3331c7mr1579214d50.7.1770195238419; Wed, 04 Feb 2026
 00:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <sjczves57fwsxkaynczcso6h64ucqpppshh7woin5j7iwxtjjg@b6dwmnt42hn5>
In-Reply-To: <sjczves57fwsxkaynczcso6h64ucqpppshh7woin5j7iwxtjjg@b6dwmnt42hn5>
From: Roger Shimizu <rosh@debian.org>
Date: Wed, 4 Feb 2026 00:53:47 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=ZmJVzQPFUHYyg0nssZMpYwx8SZbWhGVJUyozqqF9BSg@mail.gmail.com>
X-Gm-Features: AZwV_QiI3HlbzFw2IIxgdgoWwv3E0HwP7wKXjtcddqgzuXWZ_1ffvG6pXAY1Yv0
Message-ID: <CAEQ9gE=ZmJVzQPFUHYyg0nssZMpYwx8SZbWhGVJUyozqqF9BSg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5E0AFE362E
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jan 31, 2026 at 02:31:25AM -0800, Roger Shimizu wrote:
> > Thundercomm AI MiniPC G1 IoT is single board computer with
> > AI capability based on Qualcomm QCS6490 platform.

Thanks Dmitry for the review!
I will send out the updated v2 by the end of this week.

-Roger

