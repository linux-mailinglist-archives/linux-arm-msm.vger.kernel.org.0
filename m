Return-Path: <linux-arm-msm+bounces-110503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JERfIY4aHWonVwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F910619B99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 511AA30039A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 05:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAC230ACE3;
	Mon,  1 Jun 2026 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="N+gz2llW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A39285058
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292235; cv=pass; b=ZcweHGmwvXA4Gnamj87+vTSXRTNS+a9f8fPfXJNUhKtb9+p18mVYsNJ9ERIrgir0QlFchNSr5pzN9PhHXNzg79NcDtf+mmDUeZAyeZvfeUGyVX22sFgJ8oNAqq68WSCvRVn3qnAd+fkycoZzBZJni/NG8T6S3g+pU04xSPDRXR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292235; c=relaxed/simple;
	bh=pIIb3AuAFWlj1Ypq+IYPVuDFRL9hIbtYc+qS5MGgfH8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hG8ZWlXZL7IddWWgMzKEh9a4rJAGODFKelJGACdMQKynlRzuK/sGJaw/faHSCCTCCLzMlGLua6WfkaEe+3LYF+OouSWvkHcricH1vQ2LknxBkFniJdQyR3iYrgbRcklYwmWaIxZ6E2L3fjg6CS81Hexms5NwKcIfJocxV9KnqSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=N+gz2llW; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf02708e8fso27492505ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 22:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780292234; cv=none;
        d=google.com; s=arc-20240605;
        b=P8/WvVTD4+IIm56PY6XGkLmrW4VffRMbKlfu4r1RPtpKOiP2qb3Pjwiw1UOIqV1Ltd
         MELnEz+BhYYui8yyq/XNmE2uIUpi5l0TNx+ZLZFjVmxNux18gjvYgAr5NioNJPqs7mWh
         KVMsBI1OcK5k8Mam7BPY9yKdBQ2lzb0r1tB9JUYUfu8yJUfk8tVQdzuneHmOxVUYQezf
         PWTA08Uq/5zU6AfcV6H1BjsctBWngD5QYPE1NZ/sAZ7u2Wr41wNY0TQutbXjHzTHAQnc
         a3jnD2ee1dIPTHuR+6Kg/X6P9GQMsx86ckrNqNU8oH9YTFLfUf3tCUxVzD9wexriqSMR
         skKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eslW/HkD5jbBXL8zxtx8xmInlZtajgRjIhBQBw7205o=;
        fh=nDHYiVh2GZdWM+5Vh70jIjTjjmdqu6IaAd7Fe4mU5JM=;
        b=IGo2WZ8pLbaDKTAX6QChVQ5goL9pL5VOGOLH5/0H7YG/6IoOyu1GZukGCmplrorJWa
         H0sQS8L0fVDM+w7gwcKUrDurZ49g/LPi0n/lT4NfPy5UlC6ahXHF/DHY8AAIkerkyBez
         D9jyffeWuMmXL9L2gBq3Bqo8N7UAXvqqHsMBUAMPn+o0tg7g6eP4GpCWFWuR6niK/9M4
         v4hHTE75gx2zmYf90bxLxgKWDI/LSgXz4GV9mKWKEnCUyiLRYUIYocORt8n06HtrwqIi
         MUNd4vYpykznpfiZe76mvrBrxs23ENW/11lxt2J/clcFP3KiRR7/gnnOKEZ9syr0cWZO
         3Y6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780292234; x=1780897034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eslW/HkD5jbBXL8zxtx8xmInlZtajgRjIhBQBw7205o=;
        b=N+gz2llWoMaKZ904+uZ1hVVDH4XmvK8nTFP7hmR6ORm9wbhC7m6UOD34uZP7Mcqmx5
         2TwO1IB7xD3cN/OVi6gkbXz42oxWfoKHTP8fnbBWn5kz0z3OUAVlojlut9II5DVtIYZI
         YG5wMDrn52fePq4MIf4q5pTgLcXKO6kYihuGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292234; x=1780897034;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eslW/HkD5jbBXL8zxtx8xmInlZtajgRjIhBQBw7205o=;
        b=hWHmOPsriksCRKlp880Aj80Nylv/d1vCjntG14n/AHhVYWrJHzQsqrYCbDot2rcHAQ
         1r/+7dtHs2C105V0r9N6hgZpkS3ncIS5oX94vB9K/5ZYiafHCQamV8wwqbNBL6KVzCN+
         yosciseXavIYdqO9z+fC4XbI/j02m+96DhhiU5U6lrUg5c8njAj411Jf8AbZ0aHttd68
         rUxvJH+MRceJUOS42c09HTAnekQN4UIZMLQ7ylKeDtXQ8Fo3P72qZKPECkxyKFj0aU7S
         g7RCABm1oIHM0QoykXK5NUNRgqfwrbY0uLX6CVZMgVf5ALZH4lE+rjwX7WYN4oIHZGmP
         22sA==
X-Gm-Message-State: AOJu0YyuITItx1hgFQB6cPWKj7EzEk0Sib3INU8mp/NmjR+yZrL4ryNq
	a0w/C1/Fc0cIoCXxWrGhZHRh5z1xrZphTyj+IIfAFxCpZwGjcDgLPq5MR/ZW5lszePDwzF46yHq
	oKQp1ZrjKfDvF4qRZe5R1ivDvqIjutqNL/qq/G5XPgUchkJTUXptQNZKkd8dk
X-Gm-Gg: Acq92OHxG5IIwZWn0ZpM52iOBWIPIxNJ+rkqZuQ2xHKr/Aw1evcMXUtEF65+375yk77
	mV5RtF9AYrqwWMKMNEe5Cg5DLck/hD09ZZiDiraF0mxBWSKbrRc9QGd2FOw0C53afpF5zt3e9AN
	zJqaYRcBJKMqmsbdzDlxVO62eYvfY2L3J+F2FPQJ02RLV8oXtxyELzAXdO61lClV/939PGsnJ6i
	/RSDf3/JdWdHFyVsyeIVjOCgwzMVG4uXcfEkh1kPTNZc1xCgNPxQJ/Fs35JZw72iYu8970R114H
	SmQDMuol94vjRVQ5zDFgkj4ZQ0WunHOcURTwpmCRF9t19xCCFfiF0jrMI5OOHZArcwiUEZwXbt+
	+5QbiDkeVylthMrOFcriVapnK/FZHvhIH3G8N4Z7LoYmlSsKHH5FV1y6t5+pXlEvG62OGnnisBS
	YOXtPusDoOWSw6gSX00JgO81m0EIXcBUnc1k5diRkSq/6bXT6f6Ba6BoY7P3s=
X-Received: by 2002:a17:902:e5cf:b0:2c0:d9b7:b7b0 with SMTP id
 d9443c01a7336-2c0d9b7bbb8mr36123795ad.31.1780292233725; Sun, 31 May 2026
 22:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel J Blueman <daniel@quora.org>
Date: Mon, 1 Jun 2026 13:37:01 +0800
X-Gm-Features: AVHnY4IP0HTVY8LRw5LOMcaMhl6NZI623lZ6qA0x2tLfv2WUrSLnXjbQXe9AaTY
Message-ID: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
Subject: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Federico Amedeo Izzo <federico@izzo.pro>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, 
	Val Packett <val@packett.cool>, Steev Klimaszewski <threeway@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110503-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,oss.qualcomm.com,izzo.pro,linutronix.de,infradead.org,vger.kernel.org,packett.cool];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0F910619B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
Ubuntu 26.04), when waking from DPMS-off, palette corruption is
frequently seen; this manifests as purple banding. If GNOME night
light or similar is enabled, the visual impact is greater.

Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
7x (2944x1840), a second INT2 block is used for the right half of the
screen, which may remain totally blank on wake; major usability
impact.

Intuitively, the symptoms feel like the LUT SRAM clock isn't being
driven soon enough during the wakeup, thus state loss may depend on
silicon binning/variation or related. No such symptom is seen in
Windows on the same hardware. I found a workaround supporting this
mechanism is to activate the GNOME night light and adjust the slider
to update the LUT - any black right half of the screen always
reappears.

Please can someone with X1-85 Adreno insight check the Linux clock and
power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
on DPMS wake? Happy to test changes; this is a stunning platform
otherwise.

Thanks,
  Dan

Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89
-- 
Daniel J Blueman

