Return-Path: <linux-arm-msm+bounces-96980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJdrEhBosWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:03:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB8264140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057263070159
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB731AA1D2;
	Wed, 11 Mar 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2ltN/R5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMeQUApg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028627CCF0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234080; cv=pass; b=MSNwC9q72vOhW5r7T+QChQspXFGuEbeC4IgeOq5PFqP4IEeEMUchY/K++WT9FkS4ev2AHfgdEb1qDxfNuQ+195NMmgVA+4hKLGhv/XneBlpJQlRDyS16+KU4tEei/YJ32Gk0NN4ERBU+wwnbMNT98PvM7OFwAWAh7TRUu/nVXco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234080; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP/yi+85jwIv70dhqvBKNCDTcjqNQzuKwzLRu+uJCQoMQXIptqyCmg3N/xJSbtHth3CN3OLwdskvYAzpNbMH9X+VmdZKyc0kMWPxHCYuH4S+WCbzDt6EXqNi8RlhtY7tHAxJIme084vzJwCRY+jxrTeZuwtDnPkRgo0QvXatCwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2ltN/R5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMeQUApg; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=V2ltN/R5DomoiTVJscPK02zhS8zVD1jO+xN+BF/5f7/6fWVEZZacZIgx2/RChHWiN3t8/Y
	otilyztiyKbUMd8OULoMwrhcl+1GglOu/mHhosW3VNuzlRH7fRNSGRiX8K3id9o4tg4x11
	ynr22KBPn7uE+liaDIi/YPmVqL6auu8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-owMDxeO_Mvi3obvQHfy2uA-1; Wed, 11 Mar 2026 09:01:16 -0400
X-MC-Unique: owMDxeO_Mvi3obvQHfy2uA-1
X-Mimecast-MFC-AGG-ID: owMDxeO_Mvi3obvQHfy2uA_1773234075
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-662fd150354so1390466a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773234075; cv=none;
        d=google.com; s=arc-20240605;
        b=ToKMPxL7jpKCr3VPFHatv8qiRUGjL+s1rgQVehhMVSwRJIrPI3P8OPYF5NHGfwFczV
         rsLlESzq3BgwaBS44UFkPyF4N+jiTs4LwY8Q4Gnw34oBBzTC38TYvT5DuTUUPGASc/7d
         96uzNWKoG7/+4cBcHCwQpSsZySNTgVTVWUYelUwzlIdrLdTDUoUljBv7XGh26mfmnquM
         p1HhEab2AJYG0BUEshW7f9VKeRrOyqyxteOPHU3ieFsn6HDRsBfV9TslxSUItCmLTbam
         ORbOMPimikvtmpxMckakRBN5nis/V6mfamyRmNoo52mEi7ay347lS1d5wpgi7A+GtGyo
         BZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        fh=6Ssmk5rzBEPMeC9qt2pfR0/oSOUMnlcZL60giy+luZE=;
        b=eqzKW95pUjnMQbdaXbvf4G9hf11cOwbzS4Q7XdH/FucK4BBhP3ouQp4ymrOkECv99I
         uM0QPRKocrmB9keVuOUyNhDC8w4cULP67DvXQrhMT/J6bbOkQSWKki7S8y9+Y7GsVAlD
         0lQwF/tlIpBPVA9tL/RroYtlCyizc0nHAKmDoYUf5vJ2CspINdG9Q8rujK26d65r0djo
         9gL+beyvjM9CRd5bycRIVTWJ2LXJ52cXNbcSH3xaiGXlc6Nvty+7ukkn35NcgpP1S0qx
         T/AEADc9HYJpepLesyBI3drEn5+JeDzYUQq+DuWkF1sqKpl7T/MDvS2u+1UAC8cOfhHm
         wz3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773234075; x=1773838875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=VMeQUApgiTL1BMwmMWLbd8/lAa34fF8CCr7lwzXXgMUO3GO1g5uIhmB7I5pTqfk0gK
         yQMmN9yDX4vgjagejSW7X5479okYG1lk/1qxHFYlJ+M8KYLTm6gAKqR1bf3KonOqhKQl
         i6T9FQzg3+JP2aeLx8y8/48JSe83ISS3AKm+Vx5kwdBm7F9zfu7fx4yNd/ZnyyluDFSJ
         tSiJAZU2lpgdvnMIqXXQzf0mREd0+FdS8Kja7kNaPrPGBuyfwy+kvwcFM1O8c8O89RD4
         ZxYIZmtgz2Qdohq0+zQlOTaI0oPC6SlOlkoCpCgznUgQZv87txiYHJG0ZO/yxKQOD0Yh
         Gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234075; x=1773838875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=nwwf3s+xqpI4WuLbNctFlCTJDMkyleDtivhAxxeijTlPlTGA1hlIRSJ/XjUt2BAjrd
         ixJHJxT7qBfEUwtMU+sineEH/njpOyShWF0HMOh+eCSoWYm6wBFxBwnA7mn9cbYQQukp
         Z2WtJlcM89zAVJl0WVbeb14KrBYwmyyiQwFV8U4z9fa7PfHQ+hWmH9O4B+pGw+CjdUm6
         j/GP+7aGyDX9KnQgY98PEVC7Zh4e+0IXrkiLxCZZnF07Myrc1tNh2RbSza0jOn80mc1P
         29UkU3Bod0yUYn6spAwnk8z7XwvDpCQ+DeOwkB7xmnfIzgh/Fhm64Q65KCDDbWhghQt1
         EA7A==
X-Forwarded-Encrypted: i=1; AJvYcCUvQ9DPipzB6bjbd4+HdBOw3rcI/K87g23ugWsCFULTIdOtxJN8qiDKgqBCyPTAADIqt6z6Hs/IW2438gOv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7aqjEATg3/4G/I4RB7L9N6+7tClmzD7JJfbeDcig4xLl54yW0
	QAIoYOJCf1JnkcqzLw2lfg0/hNY8w9bVzEQTvYksvRvgX3R/GffDPLpPZKhSPOMeagTx49rAzJr
	DZZcdOHOlyMlrpPHzIgU219nMFPp4WhJBqsVczGvGV0WTJ2K4bQhko0X/IBPI0RfwSd+hzmBp3j
	qWoFP0i1nihDmE2cJBNhWN+Rt+amFtTg+UY8WHZQUrdw==
X-Gm-Gg: ATEYQzywIvzyduszoZjAo3unkvxgfGV0KC2HXJeXjS6VYF1G4LJfacb+CaWtlMIuZ6U
	VMNQjX87/D53k+QzovDXmhX1JbGkMQC0uhkr4Uhqr0maeO15XCwEAVLf4GKfTqsOwhhhoLjOBq3
	/clbBk7Cknk2mZEMU4MdktBvKE/MTt+c91It7AgnqvUYMGKaw9HlRw24mo3h8ajrvTQH/0MEHo9
	purvw==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143085166b.48.1773234075165;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E6DB8264140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96980-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian


