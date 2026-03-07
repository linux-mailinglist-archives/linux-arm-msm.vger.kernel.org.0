Return-Path: <linux-arm-msm+bounces-95937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 06UPE9LZq2lWhQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 08:54:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2EF22AA7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 08:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42885302BE92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 07:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D85E374747;
	Sat,  7 Mar 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFq4FHo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31136AB4B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772870094; cv=pass; b=coTeeJfzQ6x5klCRzNIPQN6zV4NQnPlXLemZrZV7KQM6l3LWSvKBOG0jDO3zY6QyTeOm1GrUnUwPuGcexpoZ7Zl5DkwQpMGh0NcpX5E4BCvyiq3k3JzqtQsltToh9HsWUo+6Ymvzv0R6h61YfRri/D4jJjZnJXlT0F/xRBJI9RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772870094; c=relaxed/simple;
	bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxbSZ4bIMwgVFU+XLiSkesO0AL8u9+Mnx/xc3fpp+ASpztq5LU+7zhygOL3Z5vheFYILWlL/Ix/2O9LWSvbcplsXrLL8F5JM4BJRsHcpskyNNSseBAp+SSze6c6JOpSIdsUiZyh8Bdg/SxU4GkNGQsrfmyFP1cxSN2MDEf+xKWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFq4FHo2; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b886fc047d5so1643809466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 23:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772870091; cv=none;
        d=google.com; s=arc-20240605;
        b=ZriGx96LUNmedppa7aks4QvzOeKy81GwjjWuJqtLOdKrCBOhZh9Q/Xyn/QDJ2geD6n
         mMevHbyNqitI2GTyFC6Ki1WmKeHHLY9MKXi7VpklfYMrWwGWoFuzgbBotl1iP5kvSrIa
         2+hzlr3OfRK33J8hD7mqZgCw3yBCykAngIeqkUWS9MWvtGmY0LjFuJysmg+iQ5j88RrS
         0GpL4+fCp5ttn5aI2+8ZE6VU8smtygzf9zzX4qj42y7MSKFe0p4LMl0dabtGwWKlwciC
         QilpTklrXKpFrkJ968h4rNmKEmlkQYBDr3ZFgWHxr0TtXsqW0Saj/F1OpqxoOX4Q1KEH
         qnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        fh=UowBWoZ4c98Nz6KVV4kbXPRXAEZJAd2aC1niII58GsM=;
        b=Z+M4Exv0YybMZaA87EEvfs3WqpDWN/AE2gh6v4g6T4PBqzksDYbIkmvu2vNvYok8O4
         cC8lTS1ZwLE0H4NVt/D3DlQceIC+yd5V+ne66wHQr8tML7cY82XJ3m5dkuejdaPAJ5Dd
         7uqx7doPLJHv+7m19XLqw69cqAl1hSD7+CC1fVHaLhL1BVVXpPIlEXT5VxagBuaMior3
         Z3w9ihkwLr8cOiz2w/9uNhX2bk9jojjal5mhnwe2LTtGEzd1zXnc7rSwWbY4JoVHth02
         vbC2oPP/u2doPcai6fGT+ThA8nWZso+y/rLVmexn8Z4+FjnynHVZJyrQ9L3uNebnUG2U
         cUOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772870091; x=1773474891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        b=SFq4FHo2ONkjWPOn8LhIuP+UTXfYiCVEAjO6SIiOopsN2+Lvctu+hK+JtKSoGwOlaZ
         AH/Xz9BBf/N6Hs2fIJaqvwAsee8PffhfB6OjKHEd2Sqn8icWc9i1IJcyMPwHkk1yN7EV
         /MdzV/4OE623b8Yr9QT9x1nDt6D4ABFlRRkLc0K+vUqhmziN1flDGVmvHcxq80vaVJT+
         Z4XlnjLDvazLrzSBmTujIodvvCMVVVTymPr2NWq62xgsj5BZ3hMyqdLf8PnNxy8HjvYr
         GJOJ+n/9qTjUt4qiAK+0rYdXZvnr+2ANypNiFBzcAKG7iKOm8KDfKtlPkmOyDDQeIj60
         6FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772870091; x=1773474891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        b=LLjWXU8z0WBjIXRBPZ68LUZ7CyOD4jBYYKdEKB7Y3bRpdZc2SprEXXwps3EtBdHWhM
         lIL4dpwbYrqxZHZQ/qpc/NWsxf4/dHsG7yY8K+4xwi6bEAIEJRAK0i8bzNrsSQlOmOrY
         rKJ8klbbrSDFYRrvkE6ntGZ6M7GTkPgC9fBQ0cb0Qe3GGu+pCkkCPUZzQ7/B7gAsjgY2
         4A2PrJ+fNFTIyWV+WZxLLh/Kh3TqmcfBCLX8fWrfj3VZ7/gPmweDLXhTA3u9pevjaSBq
         tFAKvPk887CNwDAysyGoiPDprHY07F3B5BEtjeSy/sawyvuTMTV2XktNTm2ugzs9S/zO
         6S4w==
X-Forwarded-Encrypted: i=1; AJvYcCXv8GaTOwnUMVOZXU1qDYGxrvG54/8C4RHEZhGf/rMWwUaTntkdDeBKOgEnnau62/sMjD6/2XLrMeLobqbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5v4ojwYaVcuLS2l72fiuhVme+d6o3ppvjFoCYo7aJEb8tz1ZJ
	O40j8jRgdFsw2YLjblYPdQe3T68p9uaxYC67AqdtTbyJGOyfXxsccEDeSaUKg3iBprbNF/Ld6JD
	eRFOACc4i0Ze2WhigXY11t1qrXPFTaV8=
X-Gm-Gg: ATEYQzyGCz/v62fPAqayq8hYXzaYOTLze2205tTbbypMc8WNXEi7oyIXgiiw/8xfBe9
	Q2TXguDn+DF9EFxorMme0VJ2GVmqUpZu9iuAVAcq8rXvooGzYpOBh/g/Vl/XLZYsaHNXR7cHXoD
	aIsXgOj45MHlF7s4pUKQ1n9s5Ea9aUrc+lyjvWNmukw9pSg/jXUL5EHBO/xl1YBPZbM/vXKroE1
	c6NCIIMp6W4LBdmbTXafbsevZUhJUfApyTkJinsmmMUXX9upEzAyd1PQyOZgpEW27y57iy17JBE
	9AS3ukPfGbdHqfHdGdcVMA0P5fuPakd+aGkZyfm3wGfxV7hbDXd+50cAhIaWKYOQKzwK
X-Received: by 2002:a17:907:3c96:b0:b8f:abff:9cf2 with SMTP id
 a640c23a62f3a-b942dbce946mr291841866b.4.1772870091056; Fri, 06 Mar 2026
 23:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306222148.8200-1-rosenp@gmail.com> <2026030739-uninstall-blustery-a91f@gregkh>
In-Reply-To: <2026030739-uninstall-blustery-a91f@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 23:54:40 -0800
X-Gm-Features: AaiRm51Yiq9XvlRO7Dr2WzRwUYi6IebGYs75nvZ3r4roy3Tw5wJoxXYuLTPNolk
Message-ID: <CAKxU2N85iE2_zWS0zLa=UcYBvOorqNRAqiwUvur1Q_qKT390NQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8C2EF22AA7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95937-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.872];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 11:21=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:21:48PM -0800, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Shuffle some code in probe to provide a clearer picture.
>
> That's a lot of different things all at once, please do not do that.
> Remember, kernel changes need to be "one patch per logical thing".
Maybe I overstated it. It's not a huge change. By shuffle I mean move
assignments up, which is partially a requirement of __counted_by
>
> thanks,
>
> greg k-h

