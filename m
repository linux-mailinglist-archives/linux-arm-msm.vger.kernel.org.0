Return-Path: <linux-arm-msm+bounces-95253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULUTGY67p2nfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:56:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF61FAC7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C39305D2D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF3C37F8B9;
	Wed,  4 Mar 2026 04:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URYdIAzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5C37E2EA
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600201; cv=none; b=I/Ap+78PcMv9uD2pFlmLZEl5BkMaUff7G3jzeYitDmkcsm6HSDqGg5Q9Z9fpMPosM45wfTTKlWyjeC9zIfyG1LVLCFbKq+9Wi+v7g3L0OFJ+ovPA5YC/1LqMYGIuPr9h5ea86lc47eIcUrNE9wE2M/jwDjLsResCxtE2n/NAVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600201; c=relaxed/simple;
	bh=iH6bY3bQDWYTZcVp7FU43vS6MgcMofNwA9FfZQqvXfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FalPdLlVUpd2y5Fk6CyyGskgy25olnAJYkMvGxarQUDVYDflTX1LVH2uG3qySht7txJc1bLoi299/oGjHkPFSfnAp0Hs675oSEF4gyXK+MZQHN+zpE/PwqKzoSx56G1D7q+iotVzZXUbK+bfJ0G9dHS9QkFfavKgCzluaaK0JQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URYdIAzG; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be1d9c356cso3720055eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600199; x=1773204999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7nvtEyu92HttU76y4JGJxjLhcfE8nKk1Gptt9zFfUY4=;
        b=URYdIAzGdRzysA12xWf9IoAk2bU59mCoOD5X1ehLyi02pLlMefrJ49zJeK6ns6j154
         8YYjR4bISCIJT4wSg3/v6/+qtw/zfBDHHGmlbXt1OXmLZTbbWL1rAiGzZJc0L9PTQzZ7
         /T4hSUU+VbsvjR2n1wDKEeRZqiMXrYU51yyacnHAAsKNUx/okudp3ft1xp0y6xRIFwnZ
         Oh3/39n0t9YKv6zqzec+hEYkhJPYoqBJgvdn4N7VWux46rO/KqeGPo8gPY19Z1c41OFr
         DiU5w7gUWZSf/nOykOF60h+DgazySVkCaCVxUavFjP0L4Mv+HHrqw0SjrIjTV36GfxRZ
         jrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600199; x=1773204999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nvtEyu92HttU76y4JGJxjLhcfE8nKk1Gptt9zFfUY4=;
        b=W5SkCoCMWy23WESL1lluM79y3zdNStto6VR1h+HQgsnrx11uUmTqwL3klcFau2nGHb
         0iImv7E8Cbm1xCUmN0u8qYAY21bP3zJrnaFloWlanOqBPtYiUF3gr/ToI/P1MCqtEVRb
         pCXFEGthQnkFmI4KPcyh/ligx5dvuZmUC0FUiRNsb/ZQw3vBpZLCUAASEWFSpGzWmKSf
         O3a2lzF2EkctRtrAx+IyXrtpg+PV5f9f96qxnY6eK+MOpdG29N51Gc3ilJ1ikadMvtuy
         wZq0vVT6UeZAkRiAcwK9xjiDiT97OMJ1RExW7REJNJSYyhTe+1euHFZe0uYE1wHmWtbo
         hB2g==
X-Forwarded-Encrypted: i=1; AJvYcCXd/hLRfhIn6DWhaiJzC3UUBWCeaMtPdn9QI4p6suNbsTCzT8x3MPpwuF5DAGLFGWHEchQtwcpzPQUtSzMC@vger.kernel.org
X-Gm-Message-State: AOJu0Yye8t0G7k4lN+1MMOkrSR10ZtlnhImr0x7fuCeqnTHuwgfopnmo
	tdPJ94vW+hnigofpWhseLcy5sqrxpdIPTz8LGSaMB7c91yZqRrI5dWIL
X-Gm-Gg: ATEYQzwWwC79Uodq8E9iKAT1sYkN2oGqxICLnBSPrl5BwFPQfOGMRlyExyQ1s/zLJCm
	I9z6PQ71JjV3Km4R9S6oRuL2L9KCQsbfzIibBdxTL0K2IEi8BXBzekTUUcoSrpMsGPWojWN3o9P
	52k7zhuOHYVvOltUA0Pa6wvP8LBOOrZlR6olTsS2n19KLon7CYbvZ8TAQctCes93rRH2OFrL3+U
	qsGzIXHVhyHq9DrvSyvAhiUK4bIJTsgH/JgdLUtVJmallhNYdjENmmUdDZnJV1QVqscjg4DCJMY
	PVIxORQ3ZvqdV58OyYQdZ6I4ulMQzV3aTW7h66dn2wWIdB0t+zrl1aSH5PwV/Nmo7/VeyQKrk7G
	+/JsxKJOtVcxxpeSdOmOx6fejX7i4FTVJNbbC9F0d99ppgQ6k9WeSLhuOlWgBe1DXr49ojExg3P
	9RJJAGYzbox6jUAqQUNUBPY7i/5Ob3ySUW87WSx8XUbNk18wpx81b3Y2lbJzgYsBbd
X-Received: by 2002:a05:7300:b90a:b0:2be:2f58:2eef with SMTP id 5a478bee46e88-2be30fc22b0mr343124eec.2.1772600199248;
        Tue, 03 Mar 2026 20:56:39 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2800c89asm1899030eec.31.2026.03.03.20.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:56:38 -0800 (PST)
Date: Tue, 3 Mar 2026 20:56:36 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/4] Input: aw86938 - add driver for Awinic AW86938
Message-ID: <aae7fRYaoDHMptyu@google.com>
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
X-Rspamd-Queue-Id: A3DF61FAC7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95253-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:50:27AM +0100, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86938 LRA haptic driver.
> 
> The AW86938 has a similar but slightly different register layout. In
> particular, the boost mode register values.
> The AW86938 also has some extra features that aren't implemented
> in this driver yet.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Applied, thank you.

-- 
Dmitry

