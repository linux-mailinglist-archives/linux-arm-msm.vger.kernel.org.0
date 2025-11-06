Return-Path: <linux-arm-msm+bounces-80676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE8C3DDC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 00:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD72B188C0EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 23:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB48A34D911;
	Thu,  6 Nov 2025 23:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="qbHRGXLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4073305E1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762472027; cv=none; b=au8O2tC1Lsy4njhtYbRM65A5l55HPuyxpTBp/FqP5CWJiUStb5cxutnc+PwCY6/OpdGTiONGMi4CPkudDLwCRmB+TNAguKaf14KuHsLg5KK0iBSDVHSm2e3xLF9EuSjRNAU5unPj993hbtn5FMsA4njj9ZRZWpWgoLflsFXv6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762472027; c=relaxed/simple;
	bh=E1ekq6cGetq/EM4Mk8jO06W5nqMewZh3FMKPQXLdf8s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MvkgWot+ANA43iY9nRNAaEqA6FiiBMDwplpOD1q4lg4VRBrmNEDVWwQRdyPRdbSC56xV04jIng0tbCdobnRQEGl0PPJ7jOWzPDyxbxsfmg6xdxh/+CL68K2Y7h9p1DS1LQnVLRKtgry70t3hBm0FzT4iagCg7U2gMTPWS5WKsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=qbHRGXLP; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88044caaa3eso2204956d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 15:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1762472025; x=1763076825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRXXfNY9pyURNKfsdcnYJbg6hRyM80+iEOQucrkOHfk=;
        b=qbHRGXLPGgQ8EMicb4RfotIVWm9S9+3WYzIzq/+qE8cgZsps4FXiLO7ygi20vD1JPu
         OOnu39Pqjh23QNP0zK7MfdIHfYdqEs4aKRTLkP/pw1nB+iiJ704lpqzJ7IxCXAv5yNkp
         k3PUM5yxlT0D+dgJ8Cj5uxqe1TBDhc2Wtw6AX+Ynd7xWOBj9t6zIB6M/va9CvpCh7Xjd
         Sk6yfBSlPDXdBRSpXobeIFRR4u3IZ8mWyk7tsSuN4Q6bWivKHNsCANVPhWczekja/EY9
         dyqoisctGa44l1tVqMGtgRWc/Ke4ez5hTkWsk4ppHPu7Sgg0sF9/OYNGlpgsZMAMgc0e
         3ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762472025; x=1763076825;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRXXfNY9pyURNKfsdcnYJbg6hRyM80+iEOQucrkOHfk=;
        b=s8b7Xkuw1SAubcFyr4S396uKVFHZB3BufNajvwKjsHMXqqJC6nNrBSglhiyyBg2CJb
         n2fBnotSL3ZIhC2P0UEswrineGtuS16G8Ct8H66nG/WQORiRtHfxtGOVkuR3OEOltTvs
         FX7CDSbQE7tln9ZE/vscgVHZlfae7P8bEHk/cr0jN/GVIzZTbsNRXzLj1lBxW1mj6hJW
         qNg357Ov7KUm14+eiPBHilkfwrL2+Vsj1YATeoq5IhVv/cozKFU3SSjVbVz22qTLpgk9
         M4gzl8ZwL4JI7ZiHtc7KESuj1+UNCaumOpnxwzW2g1dmW9ut1ogH649sCiucz/GOQ5yg
         mVUg==
X-Gm-Message-State: AOJu0YxvwD/JLNrVCCWEXKoKg1gynMtly9ZV8DLs7wRHiShkFdLy8xd2
	zL3W9UlOywPy9iZ1oDBu6XdGq7RgyS9FPwZpwofd+PlwW7nq1ewv2OsDESA5HnvyzesSCfk4AEG
	yJMDJ
X-Gm-Gg: ASbGncugXHRb92WZP9r974m/1iqKehrHcU79I3YAofqnxO8P+6My048/hjBEUqYuuRG
	LmZ0jMDsPvKuuUC48qdQRMkH+qQtsjLyTlzzKc39Trzc6siE00fDpJ4BN8zY2ABt2tRw5hOgH1C
	k4oy4YyojWtGPsy//27jXBKqHeoU/s/KvMqGHJQJ3b/ACnr1nNXaqSGKgd6v0+cm4xaHJqhlKZm
	4no4u3Xcm7Kvzq5K0N0sc/tDT6EA77Xk2BXNoTEBSBZtnHHYO5ksnV81D0AhONnmR2hg0lIMkMh
	+4Tcz8WrrZ5kwfJbgRc/4f4GnK0OuRwzI8uAqOOaTo3o0UeJPh8SieM0R7QPnWiCmfRgUa3RIUV
	4E4YS4FRs1oOJY1d9//qJrMyof+fwG7ffpyEMKRRmS3CM/hGpooWyXVSVPazP9ZgEPL1xbfA=
X-Google-Smtp-Source: AGHT+IEa/p1y28PH7vF+rUuXCk73+M+v/UzuRPpQS8qzH/lxCGdYQdwuZfTniyRJTftE0hYC6qkFUw==
X-Received: by 2002:ad4:5cad:0:b0:880:53b3:a9bd with SMTP id 6a1803df08f44-88167afcc3amr18286516d6.5.1762472024851;
        Thu, 06 Nov 2025 15:33:44 -0800 (PST)
Received: from [127.0.0.1] ([216.235.231.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880829c83edsm27627626d6.31.2025.11.06.15.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:33:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Cong Zhang <cong.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pavan.kondeti@oss.qualcomm.com
In-Reply-To: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on
 failed resume
Message-Id: <176247202182.294230.13399520810544725524.b4-ty@kernel.dk>
Date: Thu, 06 Nov 2025 16:33:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 21 Oct 2025 19:07:56 +0800, Cong Zhang wrote:
> The vblk->vqs releases during freeze. If resume fails before vblk->vqs
> is allocated, later freeze/remove may attempt to free vqs again.
> Set vblk->vqs to NULL after freeing to avoid double free.
> 
> 

Applied, thanks!

[1/1] virtio_blk: NULL out vqs to avoid double free on failed resume
      commit: 0739c2c6a015604a7c01506bea28200a2cc2e08c

Best regards,
-- 
Jens Axboe




