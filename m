Return-Path: <linux-arm-msm+bounces-108539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO5+EER8DGoSiQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:05:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3641581160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44CE9304733D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7B132F770;
	Tue, 19 May 2026 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLJJB2nH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BF32ED27
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202714; cv=pass; b=A/v8+1CJ8xSWQFiueQwQIzt7dK9QBvU3itdPkNZwtH+1s/Doh2zTcsAe8ftwbdqoVqcWZ5bA+xv9+t+2Kxo6Xwv2gjdTnU4GllEej5NNbR+3h3dSFbatnuYbYmnXaRIoYt+ry+pk+UEab4r6NDs/7t9E3gfTeld1u5Ew3xXNsvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202714; c=relaxed/simple;
	bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ay+K1SQDyzutof6yCSn1CjlxxZjyPx3+Lk1GQ3WVoUxuMYUWS8B2NOQfWCAFDx7ZOMfH6Jg1CFIubR6Va7LbiQpLSXZjeitA3y7+cATs1s4GEPZIANKe3Mr+xOw1qj8j50ccUbR/Yg2QOD1F6MSCr8TqnPpl7Kh64EQg5TwZ+Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLJJB2nH; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c396d3b36so3712571d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779202712; cv=none;
        d=google.com; s=arc-20240605;
        b=QJWKgoC3K9rAWjroGsifmyCOqYfpavzTzWabj8swulKuKgexoxPRAD/Dv1XDVq8u/W
         Xg9UoVGcf81t1dZmYBWT4NmwlTJtjy/+BQnYTehZ2+QKZjJ8TwluOgT59kKj0iXmY/7F
         4XhzpUIoLePAFdvGf5gtwWGfRfMyKpJ4hpdNmpg7x1gRI8pvx7k4MSEiIZUmaRRsugH4
         rV0tf5pgrhLM6Ov8UbHSAJchiAUTT4k7qi4kdljNiEINhsFg7l7V5591qxxsmvCJBg99
         k9ittD1coqaaK1aX1mwvwTmHwaihmyUieMtBCFJsUNGdzmk0HRfTO3V8MlOrcsu9aXmB
         na3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        fh=gZc9NdA+ImNSvMvZXvzIKaUkPJ/jDqheCh/YMEX9IaY=;
        b=SBySBgPo8xLKe56RU0MAMxMZEsyIlQh8Wxs+I4+3Z9rRSMhjZURPQ5z04GdI2CldQx
         SfJsHoLHsPtEMoIkziUmO6JfITFECmkl8enGEO3hOCq2lrmRTkbAZVgrlf3sJNDKBNA+
         QD2uY+Y32jpBLolfCGUHLwvatg9SELO5KrWblNJxKkVU+9siKbOLTjfkJsXpDsqKo5x7
         v8qaz1RmlEoceODAokkEHpKP8MZy1PC+HrPNfbAFBJ+mWVj9FzjrXXvlkS3mxnGCXU3G
         Mque+RfjjQ3NZyci5MOz3hrK+Lt6xeRviG6O8yIOoynOXQesHBMCmGyFm57kAEt27KyQ
         Ltzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779202712; x=1779807512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        b=jLJJB2nHdKyk8j285ZLJgRp7NAsHuR9QKltGwfzFvJ5Nq487ndBN5o49nU0oJLA+KL
         cT0rJjAN2x6eRIB3ZsQxtbzYBwpOfVPCxIigPzu9A+xyUtElP8jPC8TeH2cx0CWNNihq
         RrBJlu5rRmruK0XyPRl0K179xTw1uDzmGpieirplcSv2s0Bux7EmDbJQJ82hcwVBLZdW
         FGjRJdorjK6AoUtntOzlY9HZhuwM8R6FqoVIJ4e/X0LUr19sSiPNV24TrQ02BzTWFA+M
         p08Y/PKaNdrISPXucG7ZSU06FiYS8JTkIuGqfrIiEoo+t7zhcx11l7SZTVL4WaqYNVFx
         TDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202712; x=1779807512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3p4hlk9sS7opuOA7VO5OZHIfIWDFrtovs18Io6gwXA=;
        b=HNryjmK4dokVJDzQMXJVwhgkYn0wc0ldAkTFiyyOrD9jGN6gFooAm4XJ4Up7887jZF
         fya3IeUlqZ5Tf5eHytCn5z7C3tMvXlbAyABOWb3OVzRqt8/i2KQ8z5UML4+pnDz5McZo
         b22r3CxFIehAO954IYybDIZ3N2MLWUcM7xrFsj3CypVcAEeympHneUfN2G5re4eTzJcq
         /Q/mVjgjNH7pvlYTdK5B8Sl0ghR1YiCQFfCJJ9ADsT6eeLu7/niLno3GQoahK4nDmk2C
         Hhd7jsLxpVgbbCog694bLQcAmo0TKzdBYtpGafgYhXiVZ/uPd3VeKRm/SZ978sQ7ErX6
         CipA==
X-Forwarded-Encrypted: i=1; AFNElJ+Lie0y0xzOin2Spdw5wH40VAD39NlJ/KVU5wx5tCaT8taEiIvONIIaJWNCeQNEeCTitinUVl2jMuPJ+Mo4@vger.kernel.org
X-Gm-Message-State: AOJu0YyLz9aTZaxpdhyRjKPSRr/dPvWDt5NAdVoLPrMNOCDAwWJPVsJT
	RF4phppre2uQE+Rs0XIYCIz1KaDBKcJsfcvhl7a8QuEnyG20wYoVz9BF5rmKimB1YI2IqRArCNy
	6R9OoD2LJ41jKPnM3gjoK/wNG5tGYdyY=
X-Gm-Gg: Acq92OGvBS79Tm5vGRoLRmr8IiGbTXeMqmZrPoxkTrs/toBMJzWmtnolWw8/NWYhF2q
	eDfJyVSt3jlQGLOEMlzLu/yf5Kk2UmWI48JmT0cLm1bqdL3e3k3vtoGMMIHUOyOcmqkP47Hvczq
	RHNUZ82/V5rQDEfuXbWqkhMfTehJOE2lnWqgNi+Z9vLUA/cWfBTRyMgLtQKlaCgDrw1BEgGIMnQ
	7X15ArppRfOsZBlE2NVA+8BUPUk84iDlqUB6ngV2ZrHZkZdDEAgPCRHBJkm2jprDZIYniq70nUy
	Zex7vESF
X-Received: by 2002:a05:690e:168c:b0:65e:44a3:ac3 with SMTP id
 956f58d0204a3-65e44a31552mr11608408d50.50.1779202712253; Tue, 19 May 2026
 07:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com> <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
In-Reply-To: <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 22:58:17 +0800
X-Gm-Features: AVHnY4JwsTmHAUbPCIVWMj17cj7fD57M9j_aXkbsWKunhN7KuiYmuC8VOXegwz4
Message-ID: <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108539-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D3641581160
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> Yes I take your point.
>
> So what you are describing is an error in the software contract from
> video_register_device() - if we look throughout the usage of that
> function we see either the pattern we already have - not checking for
> NULL or checking for NULL - not the double free case you are addressing.
>
> So really the fix - the place to litigate this is not in Venus or Iris
> but in video_register_device's cleanup path.
>
> ---
> bod

Thanks, I agree.

This should probably be handled in the video_register_device() failure
path rather than in each individual driver.

I do not have a good idea yet for how to fix that cleanly in the v4l2
core. Do you have any suggestion?

