Return-Path: <linux-arm-msm+bounces-52873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB15A76532
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 13:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6E2188B185
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737E71E261F;
	Mon, 31 Mar 2025 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="U2/7PLMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108583FFD;
	Mon, 31 Mar 2025 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421868; cv=none; b=V+/tdAjdenoYN5DfuELcUrdsUdI4MVKxlDfuq1UgON2pFCk6ZaACSUIOU4bru9H/Wdk3RIRWrG6nfEWpbb1TSopPv0tIDxLT4SPKAvBimQUPPVwMCze0M58dYWC8pJjEhDJIuZxztbWqrEjYXsoSwC01GFqyEHF9GynlDlH0wxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421868; c=relaxed/simple;
	bh=08Ig/ejtnrWAAxY/gsnODYpQJfHXrmhC4T01cYFxZIQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hLg12djjox22QSkwuN0WaXaaoTtTsvCdQ/XoVeIIHwoIPN/eQGxqQCgKtunVH1VptzVi5YMJnbnkzUxPZssKqZvqqth0r2uWPKx0RXh/qleWNChAvGX0ATWlc7dvhbVe2LxFsKJPDgrMzk6kXwfU4pmG/lYJw4UaJLMW7nej67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=U2/7PLMN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743421837; x=1744026637; i=markus.elfring@web.de;
	bh=TVPznMmgvtOTQGHG9dQFnDWblNXq5SWHs7cRlxqIIBU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=U2/7PLMNWMiVZLnqu+F2Sf/pnzUEuI7Geuuw0K9YAlHpoyQRIqyqo5ZC4k5DFYOX
	 nM3Y8O0VwdZ5dtX05bDLYZK2CBu2VwFcub6Eph7hlvBft/Y7gbNzcsW5BmOrNMfk8
	 zrVxX6bLoUxdCni83DiC9mK6v/6lrAdGG5ucfkc83lyJ3V2UvzX1y3hsNHr78Q8W0
	 we0kLgj1v/V07SyzigLAXj2cvR+c8vesal0C8Db60xgtXR5in4ThQ4JTqWKzBW9cY
	 a97Dn+C55XjxsTQE0uHKhtT2gE5iCWd9uGExq3pU3dv3j4OvFuhdw1iP9Jse8UATq
	 WnQrbw+CZt37Pxsd3w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ma0Pm-1teRhJ1r6q-00LO3i; Mon, 31
 Mar 2025 13:50:37 +0200
Message-ID: <1ec61529-09f2-44d8-9324-b94da82158c4@web.de>
Date: Mon, 31 Mar 2025 13:50:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Thompson
 <danielt@kernel.org>, Daniel Thompson <daniel@riscstar.com>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>
References: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] backlight: qcom-wled: Add NULL check in the
 wled_configure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7SsMn2wJgXRiuoievwieoWQ0ugNrKUFxHLUISgQYGEL/GdYBhn2
 K7mDW8JkYzDHDMR4tahn4hOeh3vuMGcWYhK5N15fPjf8jk9jHVjXHNbwO6lzen945JMJhUi
 Xt7Wz1zwYCzSQthYpiEfOro20w6QF36Z6i9RPc68m9mRNF8nLhokA2ye0A/bNmf+IPBnKZV
 BsSCJ4DfntREhAwDNyRzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TX2hSyP+jTg=;di9CvYZZ/LcOKQJzTwOxYTaVrj7
 H5cwQX0UaVtv0z0YCQwTciZbUxOF8z/ej01KbQFdZ42CU45JdS3yq8NOVi9BJsu8qLda6kwVT
 +AW5eC3GtUqB8THB4qA3XADVz0GPs/+tB/NX4W9GNee4nPodH3CNGQRqDPKdp05clgRQPTR0d
 FXME1sWL8Muzo1+kiuTYr+sqhfOuWOsVj7ZWGRO6P7eqsj/CKQFNJ6t9PLq0OJSsr+9jXls0Z
 csAJsxEqM67AnuPKe5mJ6Jjq2NA72Ta8vKnxe2hFUCFpLwUZbtEGMaZTNekxOAexCheHEbtRw
 KWLnQysIXesHiP6A7yGFV38aDUmtXAlrabGTUWGkWBKJEBvQj4lfRITsR3rZTds5XdCuG6MtV
 VcrFUZKakY5gPTv85sn/x3HhXIbp/EVlx9xvfiCW4kNd7UzPF1D4oGRCjBh5VcfdOq4Le3XJT
 XnJrxeyMy7Ro76msigt27AOS+wEbSdIDpR3r/NuUbJjzE8J2KapfN8+pQyA+lj+WS/Z+Hck15
 nYx8Wmdr3LJGCfe07gnpFqVPtGzqIVkAEmmRsNA5Fpjg2rHuqfhji1NJUmti9VQb94igPWmW+
 nWis8EGwkSsdhPSUKw9a6LlC09vYdTx9ddejYB9xydDnWMOZWGQfBfGrSZTTOKJdAUs+49GFY
 0j8WdS1MZMJ1rJ8sOs43W4ytdF3CHAIb/zb5Kj6/uirOl3Igwt+5tKTPLih4hNjBdWblALz4B
 cIh0X6vvwDMaaKQVWFq+VWYWy1CLupDI9Wr2PIE8KU3OHN0aoOvpcBj0W0fIMmMWnlfs/cDhj
 0D6a7IEVNRH8AewjgDxDw7R14h5DyV6Ur96c7DvP0yuLUf3FSvE/1ULtDg7adlxnHlTEjqFD4
 O0AVxzTpu8X5huFeCwNPo1DJG5CTrawWaj3RpXwx20AgvkMXULrIQFqZs2Ro+Q8ME7e3fDPfQ
 B5N9ZtDwpC5l+E/J+485YQmJdSlxJ+rkNoKXqePhQC3dpl6LpS2XG6mWiwcjNE6dYQdwwGuSu
 MaLvadAuU7KJOVdkmwOT4lpTOmgjbPHJngWf/r4hiorGY3qZ4oRFeJK7Kw/5H7oSV+WLxjfkz
 yCoH0i7HsB4xBYVeh8Vumz/aiBUYP5zNkbwOKTaq/v737QBzBTzzvUITXpDtOBrx79z+e+ELC
 q0DZX2rvV/7HnshQv6RrJy84ljqY8Y1CgQ8BCJWiifgODchmda7YkvoMzCzyIAy2OGbaZfjEK
 SAp/cAlnok2pf2Q02AGk4irOFClvLqCP+BJV9ZcolqG5lQXFahLFtBiTxEPIoe8RxVNUlhBKG
 vrjwleLbEVLhRWWuv1MC74uycJK7Jb9M4V6W/nA57Y5AmjK1y9asEhgPf14tZnEQKm0fNwOHs
 AIxXSDloN7lR0CaNgYuatQ9ZcCBBkfcUCUeVX03pN4x/oIU1weR3zebgnDc0PkwvxCTIbXOeb
 eS07o3LzjXH8Y3HHfqy5sO/1nrY1RB/ou7dNBcWz6HzS/UVwZuJR7ZOjvsc4MZI3nRvVDMg==

> When devm_kasprintf() fails, it returns a NULL pointer. However, this re=
turn value is not properly checked in the function wled_configure.
>
> A NULL check should be added after the devm_kasprintf call to prevent po=
tential NULL pointer dereference error.

* Please adhere to word wrapping preferences around 75 characters per text=
 line.

* How do you think about to choose the imperative mood for an improved cha=
nge description?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94


=E2=80=A6
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr =3D be32_to_cpu(*prop_addr);
>
>  	rc =3D of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name =3D devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node)=
;
> +		if (!wled->name) {
> +			dev_err(dev, "Failed to allocate memory for wled name\n");
> +			return -ENOMEM;
> +		}
> +	}
=E2=80=A6

An extra error messages for a failed memory allocation may occasionally be=
 omitted.

Regards,
Markus

