Return-Path: <linux-arm-msm+bounces-92362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO1jGHxoimkHKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 00:06:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDCA11551A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 00:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88BA0302BE10
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 23:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40076326D4A;
	Mon,  9 Feb 2026 23:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujaqc37d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5493254B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678365; cv=pass; b=ZNY+e0cb7Q20MCd3ccp4Mz9+cFy4rhm8dhMVSPwZEV97xM2IfwGw9ANCMznvJHtCjOqdqQ9BIfLq6YI/wFIApd0QlU5fpD7StkIgf4mGJu6AK/c/t6Bu2RmVRUqlQkYOPW1tOUOyaR0yhgsmd2Rl3aZ0a/I9irCOc4H+hV+BDRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678365; c=relaxed/simple;
	bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PGZPi5hfrWWqcrGwOsXeFLFNFUMPsYkQF3If1MpMIjvxiUGiuXGpUBIzcu/KLc+kEYWIzfnCNzDu1SQRvI0pcpucfyGzfo5sibhiAOi33MrxnKuW9T4KkxVR1sw/j7jUj43/L3rcwJux/AQng8RwOPzrzxNtfEfrheEkbbwmojc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujaqc37d; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-662fc35291eso139994eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 15:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770678362; cv=none;
        d=google.com; s=arc-20240605;
        b=fK4F4CxYl1tACjR4jj4GP5dkkI7R1mjQegfVHr4KLTdyPZWhtC8y5pecwM6aB9rt6E
         j0iG8m1k7cQlMVb2MeE+7NXbn2XkYeGkxaggDOMHj9Cxyv95qqDd2FBZGCAdKZSU9bMH
         02iRySXk6GYxvddPkQ6zAkjd5V+kdQYXp+mhmDcgnivIEz/sDn2aRVHDvaTF0DV//CW+
         baUVVUmkGV6ky5otVCcQUrLqTcJk8KHnlp52RlSzz0aBuFP2ydLIvYAr2gqt5b0MqvrH
         gMvyXJU2sWbIRxVXiQzKhpHkmNS3d/Lh/F06k9kuI3pp18h6XD9HnsjHToD5U3Sp7RDn
         PvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        fh=U1megDDNLiH6PThvUZkBGWNxwMT2sPK3cP1Zk3sjKuU=;
        b=d69V2prwP1z/NEi1GPfvRT7vPElD8MmRZwj3iWw/NOaLHlUV3mXjd+y6XD1G9kQMoe
         tv1zwmwPxran/m6YWGjGD48CxUSZZWKbrcUO+VA/aLu9k/ed+lSXorEUBDwyqCcfcSXz
         5w3MHGjNWValN6D/DLTsdhzeQLAfBEQ9Fx/1C+Tf4jNfBK9Uvklkr8cJDtF51EU7cqAd
         bzI8ve4Ho5lcHfbQXREYBCcenldiJPvLBUowezouJ/CsOpDRWgDat4j6kP2zbVLv3uap
         McNeiXBjgMLLQhLgA8LuzVX21/Sc+E4ruHsyXsjr5nMPn0Ay631KqkNopWT+Q5B1DCxm
         y9sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678362; x=1771283162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=Ujaqc37dnQl2R5Yqj26hFvHbjrkkVtvv3gWCjC5Ecr1+WZO3N7g4EBLvZOP54cVaY6
         6x62DGnZb6lzyxmjWD5HXAEoTSCqmxUR5oQgQ3gSJ4wp+EF1bVoAvPyYYAx6zMwz1ixz
         FVbDiYe4M7VG0vFRbcS2WNe3kIAit/yPe6ANQZPeoUl8kIwt4IduA+Ag+HKUk+uWMHjs
         krKywhijR4qDlElkHf1/eTVzbJsb6wvpQ7p1T8Meb943tOCUUQYmzNd8dl6vWhvluWRH
         tHWbMnSeQvIcZ7Bi3NUTVxF3F0tuyULOROVqr138baNClehGQeHbS1OWvu1RfityBPdu
         LHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678362; x=1771283162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=p/wHZrDT7xj75P4HytggRepv0Rh2XAYZJ1Q57mAV14lJkBLANmTOQRQw9kYL0UkDik
         MvBm10U2Bc7XXaI4MVwzaf0Wy+4ruVFrzqJ5Qftfrv2mFWGf327pcq7HvCfTWZldHP46
         htzO43ugCEZ8Ejm4gKFxgTe4a//Di/N6k9OWCFNF7GsfmE6NFxGMRseFyppfrnzqhoob
         7WRWt9D9XWhSPfxi+ORrkV30R01moGPF9BOvTRnPF5P6FdMH9voMa6yZJbSLFwPiBdgN
         rt+SOx2QhndDqgDeRBfZf/XURYvjRaUWeHT4l7GPiHXiw7Pr6xFgeMZqeqAKwRsQvNW4
         a7AA==
X-Forwarded-Encrypted: i=1; AJvYcCXBfvwz8wiW0h1UKOPaZAzuhW6gX1eRX9MZGmkVt29OufuRSg5EcGSbNVGBY9M7XWAI9LaQlcWFkGjwdFxf@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrevp+x63q+urj6/WpjNYTqF5vqKVZi6Xkmo/thHN46oQTtPC
	PpmgqAA8wvpGQnHfRWxedsy6drU/F+fEJYZaV7sXgzD8aBlFT3bN6mnU1tFKOb4ZRlAvQ+Jrkur
	cKgQGGYY0X4DIJjkXBnCjpSHQTxd9LSE=
X-Gm-Gg: AZuq6aISKKK8lEOgjS2/WVVCGdF9ybCQsdxd8SBwDvlQn8bwuMV73T8WYRKifqMN8bE
	7j6IJ/LAHQHG6QqZlFKa9GdFNrzkRlQzBX9i1axP9/bZfHU6Bzs7xyTqEHbKVAIZonklbh/W4SO
	J5CIKhvEg80ONIP3D8Yf9uWYKgGoqeFPfXBSz1JwifTg0unxjQozCNemYbr8zsG5ggsPIpwtdt/
	5PnKHcGFqkocwMA2v5p2HZomB3LL/wBB8k0BaGLsain1nFeDjiCmwx/2JD3t3qwTDhrInRz5Otm
	XcBLWjAKcdtqHP93rXaCdEFtO2s=
X-Received: by 2002:a05:6820:1514:b0:65f:6994:314b with SMTP id
 006d021491bc7-66d0d2fa708mr4985297eaf.76.1770678361869; Mon, 09 Feb 2026
 15:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yoann Lecuyer <yoann.lecuyer@gmail.com>
Date: Tue, 10 Feb 2026 00:05:49 +0100
X-Gm-Features: AZwV_QjCJogYNxSx58S_93uDe6N0OJjkbPA74xddnic2w5pObERjuWLWGj2ZiXo
Message-ID: <CAPZXbJmpAZfxFK9LKaS=wZXX+pez9j5k3gjF+CRPgP6Ru4DuRA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: val@packett.cool
Cc: andersson@kernel.org, barnabas.czeman@mainlining.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	justinstitt@google.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux@mainlining.org, llvm@lists.linux.dev, 
	Luca Weiss <luca@lucaweiss.eu>, mathieu.poirier@linaro.org, matti.lehtimaki@gmail.com, 
	morbo@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, phone-devel@vger.kernel.org, 
	vladimir.lypak@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92362-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yoannlecuyer@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,mainlining.org,vger.kernel.org,oss.qualcomm.com,google.com,lists.linux.dev,lucaweiss.eu,linaro.org,gmail.com,lists.sr.ht];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EBDCA11551A
X-Rspamd-Action: no action

> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
>
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
>
> Signed-off-by: Val Packett <val@packett.cool>

Tested-by: Yoann Lecuyer <yoann.lecuyer@gmail.com>

Yoann

