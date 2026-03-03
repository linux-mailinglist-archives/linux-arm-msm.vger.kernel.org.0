Return-Path: <linux-arm-msm+bounces-95174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOU+IV4Lp2kDcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:25:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FE1F3BCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 280A13040224
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8264DB555;
	Tue,  3 Mar 2026 16:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdg81eCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7CF4DA55D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554992; cv=none; b=hnhpZEBkrnfVQMArT26il0rX3tViGHk+G5a9Y5YeDjLY1Jo09mijXkr2UoMsuXZB7giSc1db5JQZnmh/PSVHTD+B/LkvkTwo9XuvtWhJXTtcMmez0Poun4OXDcXB3/1xmQa6vaXrbBeV6mDHVvx8Ls//N8/VpA9Ih81wEfSKUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554992; c=relaxed/simple;
	bh=QnDe6CqK7d7iv5p2X8yN4ClZilCQfBmh+Ih5CDsKBrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFq4OzvyGyx06fbe8kiNSq8qBHn3KGVab3UUU4q3dCWvIG+Zh55F7rj1oyfda5IJhFltofgDzAyS0GaVxSifuM2oku7ud+QHJxpKF/IqX+WuINzDHs/tA2N85GtxhSfvj/Low70hZocMeosaow1jnGlnVaNuwp4cU9593OEogHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdg81eCG; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270adc5121so7309560c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772554987; x=1773159787; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=hdg81eCGlojV7urUqIv3aXLNN8u38KycLiJWH0Pc7D7u3XlpZLxazhzW9b+a919MGj
         RwBeCf+nYNHswNM4u+0eRNhOgZt+guWVv0akwBYmkWtB6YmlntamMMTzrFSqYJ9UeMfq
         fxOEg0BxT+zQ3hVrbPS57CjDcYTyunIQRyzRjU1ePz4yeeGcOiMRsgkHCpzo/rRGzozC
         KbnGM6xUQV9SnWhnL+uIT4E6Xmpg+BL6Y0kFrVhLiN9A0kKXiIMfvXDglzeATUBIkD7f
         FDasTSS20/plWkAnMmcM/Pa8fVQ4WhnQ3inRpgKFiQc7AT9oAG2FzwkorV3rlkjbfhSC
         TXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554987; x=1773159787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=TVLB6NeOG5bQam43HLD5msuPyH3hwsWOUm6h1TerR6Lb1HDWyInkknuM5Cw8CH2bdv
         xo9dtlYBrCzJ1RLiOwhy4/l4L8iZixva901LFXiWEk0Uh6n3e+sP7KWRr7tn+KwtwTz9
         Uo0xNOfFXmyLkfAT5l2wtZFq2cK3f1XWYzypexGx5smpy+IezsXf0N9ay12xdBkN+r00
         QYryO5umfrP5bkWjynwhp9G/AjRcVGrDbMeuksaJ0GdwJtEQ1UKkiOjclyANTklquasM
         ItFd7+i3GEvJfMQMd6hjQzO2AfyQ4vmIja++2d3Q7rX5jGF1V4EMrHJnPIgj/HO0UfYX
         1kBg==
X-Forwarded-Encrypted: i=1; AJvYcCWUpafgpiZ+OtX6QOmaAuh3cDLCqJHwsCUpF3JuYOeQZwzI6ZsGnrtEQUQMcKSqCghK1Y5azONul/IjeOvq@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZuLY/vZhHQeWymKn9O5Co9+/syQP8+2UAwsgeSeVzPl8/Vze
	TgJrYuQ36Z7qKWzPKz53BuHKnJEY6c2DQdFZP6RabeGg4ixLVz9U/6vN
X-Gm-Gg: ATEYQzyzVruRY2936BFbuJXTacC5RjnAOdldFyfYy1FomyWdiyjuJPPghnV9LgzXJxB
	2OF4KejzCuSnCXImV0YFa+dP9gsjfKfs/KfsltSCtmNJGUddMfrQFVpJQnQYM8lh+feG3hUisck
	fQnqooYQlRdRqUEF9xwNOdTFmKcPkl3MTl9Td2M1+joQJgqw+4voF1seUZhy9c/pLzVmLqlFK1M
	26rBbkY9sl6Clx5CrDrEjhZoi5Kq6ZpYm1zL+ClDwhMBtM5Y2lYjk2MVjme9owvgenMdmdzsaGV
	AWb+wr4QXHOJHRPjb92DQaVa4Xz3I1CgmwQKs8qAsw/GBflKJlGBYjJQifpSz3BoJoUSNqrnsfL
	CAePaIk/f9yFZWZuWmrwJx8QA/2nlDLwdO68NzOEMr/4gd0kWSrwcCnX/IrGxTInCCJ5PgnEptn
	AOJMDtjr5w2ZS5/1CqX43yuDPsUCfmenMSSb36R/ByNxgCebk=
X-Received: by 2002:a05:693c:8151:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be2b170190mr181320eec.13.1772554986631;
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cefd7esm14967005eec.9.2026.03.03.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 08:23:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, srini@kernel.org,
	s.nawrocki@samsung.com, nuno.sa@analog.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
Message-ID: <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
X-Rspamd-Queue-Id: 2C6FE1F3BCB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,analog.com:email,roeck-us.net:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
> 
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

