Return-Path: <linux-arm-msm+bounces-99663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGMwG8CQwmlEfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:25:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA663309573
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D3F3115905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B30E3EF644;
	Tue, 24 Mar 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqYed+Vi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED99736680F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357894; cv=pass; b=o96OEhO5YZXrbBzOr+v0AvjdR4b94fsyGLRS6BrnPriVhO5RVnZC8eIFftPsLl4IL3lHd4m7sZASnDJrSCJDUj5dyaTsEYbtZwNL8lg6rksfPFMYwo94hVbmIxfVBsuhEqa0IPzACxw+gX3jE+zGtodb32tz/JAZa6bfiBlxjks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357894; c=relaxed/simple;
	bh=7hnWVjysxJQ+llkIpwUpAvaG3bbkSHFMxdZKyrsvBG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBGSUitswf+666NGcoX6umBlj0JybniebSVPy7p4/LdaDnXYU4N6TCi99l3dAAqE3Qjk11c40mcgpA6FhAawD6yXVM5fOUd7anZGXI/CDA/f5ZFVfSrn8WQIhZriXXa8CnK7lp9S3EXqkfmJRw+RM4jcWISnIxlUdN7vXrH42Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqYed+Vi; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94a231b285dso631277241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774357892; cv=none;
        d=google.com; s=arc-20240605;
        b=K0izCwiT9flghHyaDbgiTxulMZyKvjCejpmH0lM8cA5GpImDoU3pJhUWHniBvBfySp
         vWFSY1LCrekvFt7RRS4YRsHlYHizIGlXznXBKyJvoE3i7l9nL6Wq1vxx4kLP4cjbppXv
         MZtq4/Lr6vdsglxCCLf4wiu0gFwBqI7YX6uBzMVuMafjUFFAAWXFfgD3AOpPuNATeWCK
         f4++xpr6UX0nBOzOpxyOxscBSqD6FC/gc+JF+27+9eZbAic2vrni24omkt1qr+pC0ylK
         adWyhHTbC5r9ci3CA95pq76gGRdjG9a/w/jI0JAGt6jBEsbIEAyj08mIU1zq5yt65Tc1
         gwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hnWVjysxJQ+llkIpwUpAvaG3bbkSHFMxdZKyrsvBG4=;
        fh=GeAx+rQHcMhVe0vYKwgKsJV1MdcdZEPEn9HrI66S2g4=;
        b=OmhnN/YSWsvmc4Mw6MyPeTgEq5rpb56CVkAq3Ab7MngrXgOuTJ1sD5dDS8JvK/V8PU
         hdL1Tof/bwX4Vj0YYQ3vaafXMjnYFje/56YcXDm/sHaSNDQA4lVHYXj8ZP2motTw3hpb
         AJXt4U35qh5ZfeLEOno59NJndJP74MjU3BhrDf1gBTkwXWbMLb0MUhHyJO5P4FFwvDMP
         nNK8xkAquG7YAeenZ4d42dMaGOTLdJirKJb/WOh6Mf8J4B5Y0ksX3fvLNC/56xxiRfhc
         Afv9pK2QLxtVXRQXQKd1Zr1uUFrGwTfIGNW4Ub4fK5Z3SSS8tIWLcZocqYAPhNU2/l7u
         39sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774357892; x=1774962692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hnWVjysxJQ+llkIpwUpAvaG3bbkSHFMxdZKyrsvBG4=;
        b=cqYed+VinWeBWAHgKdvjgaT7/MvV/MDCPfj0Nw+6zZDzXtHICzl00ZTk8OSIQI2RRe
         IeBCwKtXU5VcvMDkAy7i2r1M5hD6luePW4P6wU82EsgbrKzqcflPY1on0yMhw6L3cOEy
         We50FGgAOXYP+KRTkmc2SQNiC0zGOVWJ3FgBo8JOd33d7BXvswWHvObGB/n+ew39/bha
         GSsH3+7xOb7bKx4DluqgJ/0rOg4ALPETrx0SqxFU66ZGwKICDUTc+TxhU3HwfkaqYM3c
         2fjy7avyo+dxsPRV1PnLSCuD74iqB+EGRyLYYv/zpP46kJR38rv2JNhgAICHuSOxMK2A
         WTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357892; x=1774962692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hnWVjysxJQ+llkIpwUpAvaG3bbkSHFMxdZKyrsvBG4=;
        b=JgmTuXlVatvvkbgU+lFMTEqDxdmYgc+F2Q9nmgBOD448vUND1SEm85wRMm2+FjPUoc
         LgfwDbHmMSNVMWl2v/ws/tULpOeM9ibGpFn5QlrCbedcT1eDjjUq5wOZOcUssmu6MLJs
         SCjTtbjRiZE9CvLCyml6WEqN6RNajIO3ZLaBKCY33aBfLe4L12v7lc9ZJ4rpYdEEAryi
         0hNIHJU+vHnfn9hiL7NFA3IGvPlaUy0q2hV1aX/IygN9sEF2oIv0dYlg+kC8yy4O1vAr
         ZInZHWGxRd3E4q70U8//MxtkuWSpyWcj5H5MOIrGy5tvUxL776XHe3+esArcv9nf9zcL
         Q9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWPXsrqEsWCPPyk6hCi2q6wMf3nvNOLZp2wdN+3fLMCc3vHLnDM59bYnWBnyflE3ST6G1zmvmFozIp87FW/@vger.kernel.org
X-Gm-Message-State: AOJu0YxvczwW8Yi/rMGzColk96JCOLHMrTPritQVeYbdVkpMvggA2Yof
	Xdm/YlUq29XCIm65/G/Y2lkojXE1zGpwHzbnLz8wBjwoF/PwZmihZPGAT4zKuFkbkzoZ4+sAp7c
	wuAtM64VlAnLx0AkJ3Up+sKRW7p7Yylk=
X-Gm-Gg: ATEYQzxQepoSpyB35zTTYi/OzqF1tpgyjW4gW0Oqu+uD6To6rln++5z5PueSJA9mLM2
	lTFBA9E+GXAUsgKjgsJyfjve0Ybp1lQe4E1FG6272IZrfESlkKBA+/HasFN3cWaM50i6EzndpYf
	RujtaNGpWubZ3Qp5o5AKtuYNM8c7iTMEyIIvxVMvUPKIQ3wGV1WvJCKqIZM7XCtT3Z4NmGhthAs
	TO2fd/xaIhim934wdny+p0imoTwb3eaHZ1OVGUwmVrIwaxrWN4xyiyycjlVxHXL8rUu5xOv1hUF
	BDvB4eo=
X-Received: by 2002:a05:6102:3910:b0:602:8cee:8246 with SMTP id
 ada2fe7eead31-602aeb3db5fmr8903441137.16.1774357891859; Tue, 24 Mar 2026
 06:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
In-Reply-To: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Mar 2026 21:11:03 +0800
X-Gm-Features: AQROBzA-Uf5D5nbMpZdLi_R6pDLsyJrw69YbWtlJy_Jgt4MFR_t_cYHPAAA05S0
Message-ID: <CAH2e8h5mZSYEbQ4Y_EEQnxOKPkyuOF1W-4FQQ4XFqdkib427JA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: calculate data_width like downstream
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CA663309573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 2:48=E2=80=AFAM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
> Derive INTF data_width from dce_bytes_per_line rather than
> timing->width when DSC is enabled. Use DIV_ROUND_UP to avoid
> rounding errors.
>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Tested-by: Pengyu Luo <mitltlatltl@gmail.com> # Lenovo Legion Y700 Gen4 (SM=
8750)

Best wishes,
Pengyu

