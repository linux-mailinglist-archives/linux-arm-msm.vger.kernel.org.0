Return-Path: <linux-arm-msm+bounces-84242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FCC9F5D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 516363000752
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07506305970;
	Wed,  3 Dec 2025 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XDNHa9K8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71736305055
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773593; cv=none; b=Q+Ri/qMB1+WmAioTPeiHwApVP/LJZC60+FOSWXt2dUPPlU7BZThKojTTw3IDW1RUUeidBiXZF3ZoAB1TzTpOTK1Fsywu5uUTZHbjC/4uiDYHfIUQQsvxZ+EBaCBJegrUAIKU8vqNmTA4rjw/7RGiK1cDKjpuN6W9FFF29uX/w1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773593; c=relaxed/simple;
	bh=jtuocc51/h8t/wZRuBjaL35U96u5f5lT/9VylZ9vxu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c8X5npPIMFVvmyoJqgKvGkPLHguCG9os/buT4ugXGXKhJrMsF0AxKr+r5sJFx4Pjm/FMncHiCpBjSgRD26PaWgVh5YJDVIbkwIrN/H9EYMPM8OXilMnz8KYoWO5tfNBta5kGrE3i9l+jxoeYgAOQhJNW+KfatmCHlY0TDwOwdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XDNHa9K8; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-65749fe614bso1513779eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764773591; x=1765378391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwNBgMdZ5LvjnOkhly2CXfw1sKpyPR39td9uqnzg65o=;
        b=XDNHa9K8dXawKVk3HqH3nPwcRRFOiYIQHeAip60mTS8WG5HOc2F4lXTum7aNrtmDeD
         +6HNDeLJuX2gsahKbi7VrNoRHJoOAuiVTXWjpKPG2v461QPUe4b6ChUTF3hhaKuLG2NX
         ivIz1WT0+XmVVfJdThnfd1LRLShwK2KeL9Hhb3y1jEWiI+K3lL5/IwZm5vf3FbSwsxHm
         Lwyk3Qh6GAhrxX++fnkZYaBhnG4bJb2xT1YpNYoC4SuQMBAIujaatCrS+7m1EQ0qKk1/
         hLX+KpMw/fApJx8eHcabUL+7qMvmqi3pI0D0LKbQFaBrKstwytWCXVt1EyC6D0ApAJwg
         z2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764773591; x=1765378391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwNBgMdZ5LvjnOkhly2CXfw1sKpyPR39td9uqnzg65o=;
        b=n5KdnvUnWFUVpgb90+EBdLMoRSrPQSlGshWnyuJR8ziMOcHoJU03lc2t3h3qxqCHCy
         LS4/zjqlAcGzLO+LLBvY+mUB3qHBmZs3BtnqsaXMY9zR8rYAgk3+aMAi6LkNRDTta7da
         StRr7YLG+zJHqqC15OglEjT3mvcycVlGSv/g1zsn+MVb/WUgS7K1N8PqDjC1J0oxYlqG
         bKzvuGY+Xqqducim3rdAYsUxoHNcpUX+F9fsfV5qhYfDiSgMvPQZ8Ho3aJh/r7Mql78E
         9dGNyGI57QbG1iu/6Kmf8cSAp80DkdXYRlXX7MnAS5E9jrL3cjGGx8kzmGHao5Bw5Mes
         FRew==
X-Gm-Message-State: AOJu0YzWH6U2v1ABdJfzXpfF/2OD7a1gNoYvaw4ZuZJjhIeE+KufTe+u
	fa+FgQb4BlCCLYylGRw62LpI5UF8cjMEhJMgkMNGcZDk6Y7mVmU2HFzRiLy2do2im+c=
X-Gm-Gg: ASbGnctqEaIrhz6+0tMJO1eXgOecHs+4EAv5nF2bib3912v6/SgHjnJy4TWfjJQ5Z89
	VFvaIr7tOU7+ig70NII2Ro+DkT9Cz+Xm4UbFnaoptdYRm189Dx0qYXBtWM9HmVt6EQg7yqiAlNp
	il0SbYhbumIS+s5Xq10HkUEkp6ZWq46d7/kB6swRLci0wE53dPqR1ksMXjmEAVVpPF3uSOGQ6IQ
	FYZ2399fi9+L8x02kT5R4XuzvOxvhyaCe6viP7LNX4E4J2i6fQMd19Ioz7//Q3zgk4R0aZCmtLY
	hjtCP2UHqHmgoClKSjTqDoHzCa4B43ZqaUSZ2tqxoQTYTLnTHyroz1f80wgYWqht7RmxS/grE5A
	dg+1GVq6HaOXkJj9EpfWYz32GkpvsVYFTFlXXaR5o4Q6VZcrlIRFdJIh3vdKjpvMSxxCpaLdkwR
	S+Mg==
X-Google-Smtp-Source: AGHT+IGX9FYZokhfHs/lgJIZQiuLd04h30UfBxWKsqLgkGdXjaqr1fhjzDqwLN8usJ8dqcVEodZl/w==
X-Received: by 2002:a05:6820:4c15:b0:653:827d:1abb with SMTP id 006d021491bc7-6597264d955mr998702eaf.2.1764773591501;
        Wed, 03 Dec 2025 06:53:11 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65933cc55bfsm5953139eaf.9.2025.12.03.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:53:10 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Daniel Wagner <dwagner@suse.de>, Hannes Reinecke <hare@suse.de>, 
 Ming Lei <ming.lei@redhat.com>, Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, pavan.kondeti@oss.qualcomm.com
In-Reply-To: <20251203-blkmq_skip_waiting-v2-1-aaf38fa5883d@oss.qualcomm.com>
References: <20251203-blkmq_skip_waiting-v2-1-aaf38fa5883d@oss.qualcomm.com>
Subject: Re: [PATCH v2] blk-mq: Abort suspend when wakeup events are
 pending
Message-Id: <176477359034.834078.12163250354684501835.b4-ty@kernel.dk>
Date: Wed, 03 Dec 2025 07:53:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 03 Dec 2025 11:34:21 +0800, Cong Zhang wrote:
> During system suspend, wakeup capable IRQs for block device can be
> delayed, which can cause blk_mq_hctx_notify_offline() to hang
> indefinitely while waiting for pending request to complete.
> Skip the request waiting loop and abort suspend when wakeup events are
> pending to prevent the deadlock.
> 
> 
> [...]

Applied, thanks!

[1/1] blk-mq: Abort suspend when wakeup events are pending
      commit: b1e5c96ab4a011763afac033f6660cf1eb499458

Best regards,
-- 
Jens Axboe




