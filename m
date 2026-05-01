Return-Path: <linux-arm-msm+bounces-105562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIikIfM89WkIJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 01:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0C4B067C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 01:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54526300440A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 23:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD07937DEAB;
	Fri,  1 May 2026 23:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="racDQXss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201537268C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 23:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679597; cv=none; b=hGKdxTVHkZ+9mHsDJFjik31JjdQWHwOJrTk/2gYb7YYloXUzjDLqZoggxRivkonMxPxN83pO//wu+2v+w0CQF0h/PlrhhsX8lMOFeRbpSLP45xByp92l/ktzIXojVUNHLertZo7GWzUpiZ2hfo4qTE7LragdKSBy275dxKfdUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679597; c=relaxed/simple;
	bh=sTLTPWbkkR+J79wA5XET+FhSZQxeeBxgYYs31m8y0as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHJIMfe/wiNfQaDU9SzALGYP9TInWiLJdd2dFVy+ah2OCQcOXXIjlUuHmrDwVDhyhF86UP7alr7MfOY04Ca430w5AIg9G3YDuZLrCxB4H3uhYs6eFBm9u/fARGywa6c0tn1+FB06GkqQ2PhcT52VN7rKa+rFpjfIganBtmkEtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=racDQXss; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8d736211595so170443985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 16:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777679595; x=1778284395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auq8XZ/n50n6kobbrJwVjj4F1ZYF7RNuGE7nh7nDocM=;
        b=racDQXssdAUjh1mCnK3JhFd2oA65ibXLnTVq8SB3N2nPXCCcZDc6QultUq+SpZheNv
         LumrafoaaZS7oOimJgqoNpepfjG0tC7WlyCb4rxg8jE2lT0qQAmP/7Gj3TJOwE4RBtU6
         CwlN1Wrf8kgNjRL70W83RR8Xm4mEuKvSWy34mxcnd3K4maHG6871LL+nL5f2Rt2QBQk4
         XbSPciH4fTsbvaiWFu/Yt2X4Kmv/vd5q09xOoDtbqcKMkfd2OVrOaVkHNwDzdlAaYkkh
         0xCx0O1rPYwnfpvX/S2ZHodRETG2ZeJ+XLgGmOWH9bK1Ox9a5NpmfkEm5uNxnaadekIy
         3jnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777679595; x=1778284395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auq8XZ/n50n6kobbrJwVjj4F1ZYF7RNuGE7nh7nDocM=;
        b=ZB2MGImD69HmLSIKEmWDPm1Lu7e36qtxeT8uVifspseNrb6loaWtX7zX+77nbp2dXw
         +itU3uBOvTO4VkuFvZnwt7K5PtxS3yP47m38mFLPv/n6GSpW1QUiIJ/9ykl/a29c9HXa
         ia6uQiY578P+5eDYAQ8k21PsLy5h9rxnoRBQyKBy+973PUGepGb5F6ZBGQA/1I5nlbi8
         KzV8uH9/U3n0q6slFOiDtEA6HgQDCYbtpkYNx7BmnxTrhgxDdsFK0rbZWnV2K7UwU9dR
         weaGfwCv+zJgIVnTtMjoop+wGvW80/T+2vqShfRtv75Tq84XYt4mCgA2uKYfJeYhJPes
         M2AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ha0c6wB718Ddi3ONiRFTIRLXfu99J3xABJcHlIPPg/O/bOfjZAdoRxL0AoXgEn5rrME8Y6dvpPLVDS+lP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8VeJ0a6RjmIZPVWcVM4xMU8uMo2I1r2kyB0eRoDxAH/1DFR6
	TZeeTehXUtc/VAsl8/QAjydNJGkH3KtTQLfHI8lwiBDmcL7y5C3QeTMv
X-Gm-Gg: AeBDieuNWwfc8z37RW/ujHZBSiez+f74sMG3/uDGogAXlfdGXzw9aS+mNXb2Yz46/aG
	RZ9aJ+ImujmIXXWgPutMnWCGxxY67yKqo73zG2FazKjweQad5QdYkgLaFAIxgUsWOJwMJVp8PSE
	Fj1UFvmnt6PD5wl1pMbzPq4AxZL9WD7i2/QDAenmfAleZedPwTu0WvzNxbNPNSp7oUZfW7qDswK
	CJtVRn4rvvkpE4Uu3ZjzQg8qv9qK8vSnswBur522lnDt0yK3F16TXp/g448zbR7Yx03swA53geP
	gj3w9OBhzuZOWPt4WcNl50SH2aJxuuuRreVingzoq4n9xFLGvXN4BYxNTPJHXI9xh6XFeL5eBsx
	RfjlZF+4bfUZr56RAGh7ia8S+whbyvYEEA6DANXwov/txeV6e4BVsnIiYsc33+hFyMO5J7l6GyG
	nzEB2abiL5B+wRNJacMj6yGOTUYnWqoZUEUqn4
X-Received: by 2002:a05:622a:17c7:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5104c16c480mr21543551cf.60.1777679595414;
        Fri, 01 May 2026 16:53:15 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b8174csm32094481cf.25.2026.05.01.16.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 16:53:14 -0700 (PDT)
Date: Fri, 1 May 2026 19:53:57 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
Message-ID: <afU9FQnWKgRtV6mW@rdacayan>
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
X-Rspamd-Queue-Id: 74C0C4B067C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105562-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 04:27:57PM +0100, Alexey Klimov wrote:
> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
> > Hi,
> >
> > There seems to be a race condition in q6asm when stopping the stream
> > (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> > driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> > ADSP. If userspace decides to prepare the stream again in
> > q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> > memory-mapped region appears to still be in use and fails to map again.
> >
> > I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> > qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> > need to verify. On sdm670, we are coping downstream by keeping the state
> > as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> 
> Do you have a reproducer or specific steps to test/reproduce the issue?

I don't really have an easy way to reproduce. On a device with a
Qualcomm SoC and q6asm, running postmarketOS with Phosh and without the
workaround, waiting a few hours usually reproduces it.

