Return-Path: <linux-arm-msm+bounces-67758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA71B1B107
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E40189E7CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E242A25F780;
	Tue,  5 Aug 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPJBcL5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DA25A2D2
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386149; cv=none; b=g/OhUvviAKeEKpJFMqwhrJPRtu24wGOn4tbbQP9gKc2qqiFmKdT3Re/IgdB7qeHzlwI1MEGmf7z/Rst0JYOeD4qhXsLIkaf4RO8QZkRhL4LbhyosxYBt/1FjlC/HE2KDYHEeTna9NE3UCaK6TDLfrNvXrUmcbbgZNJRS4hL/X6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386149; c=relaxed/simple;
	bh=Nu/yo03bxwSukuvoXb5drj/qxdTuJgGHnF93xhQ2c5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=getE212FFywPkW84yhwJY34qmfvtrgg6ZioUb43S2vUIO1fCJF+phNdtqBZlclYk2NzhhCd8NWuZPzH6nhmPx8lT9wgmC0drUH5LbmHq/1qhxUKbNuGnEMqQqvrpQkBNXIeJp805w+potkas/pF6JHDepMPeJKrzU5+yI4N9Y74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPJBcL5A; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b792b0b829so4156733f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754386146; x=1754990946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UF5Zt9voQATioY9RRbmU98WhyD6EdNV9XLQAXiUOGfY=;
        b=hPJBcL5AcZ+KxOtM6+HrkeUPZcSRD5dWCApPCvP5moScUD8SP4XuMoJcWs3GCLsAAs
         xxMZPNQuVDQbW+xOiOWElJJsD6gt8S+aNybf09SxI9CYMyI3+J/4X7N/Ji/h+2d0th5V
         d9ktQbFf5LQNzr+EaXhMSgfTbb2rfNI5LvSAKC5J4e3gNfKo0k9MIZ0/W5KypABb2s33
         YbjG6bByWzlV4oUsklP8GI1qN9sGLi8x3sjKcpJv1bIMRL1OSB8oYOi59yVCs2JJAwLu
         /zvdySkSPDGgacdllL2J5Gpry/44y1lXxh8otx/5TgUN1wYy5phQIDdjcJ2+/jjbquAf
         ilXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754386146; x=1754990946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF5Zt9voQATioY9RRbmU98WhyD6EdNV9XLQAXiUOGfY=;
        b=BThyaIrhbeQ/aESR5Ll/z5Tj7Ns7r1inb5MECLT76HOPtNSsHX9fLtRRKVsGcKww/i
         QvyM8/cIkm0NBBc8kcrSxfVlCam2aQuj5PvfAj5FQS/H8r6y1yt5cLnk1zKUszH+r84I
         VCufHl4keiZdM1S2sbcSG5N11q3Iy5U4hneoHEslGUTZwK8D2X4OZU0SIgypGqOzdaNG
         nlsYm8ojlz2rhRiUtenwWd4xa13mdmXBLH4qz0IjXIzvltsAWXlb4MEUYONhia+NpAYg
         ZzBhHmHtWu43bmbIqZ9sz8sEvRIufMimhj0jtMomIQKA27O7jCXppySG5auU1ChX9Nyf
         rMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVD+nLOIrmjsKPDv+UpmGmbY1/QZjBudHKkVp4tZns/mCzW08LC/822OqOWNN2OPW6uLwIFGtv30JWWOK5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUicEL3MNJjz0dQNyMv340rc1BqMJVjLAo+LBT71ivtF77yV45
	T7YCFdL6fDxthmF7TkmW+yvZDJ6Lv/UuUziBnTHlgPMfSiASsMLyiPUS6O9rBeKaTXo=
X-Gm-Gg: ASbGncvrTg9AADMbxvzbfzg8jIxgS4HkljwfcgQg/grSakCWP2Y4+1CIj91JCdDHqHt
	eFjzpvwnlNslMm77FVjHIaM5Xd5wx9yIBqHxHT/BhOg5v3xlLLS3LZu+IBd+PpuIXWCw/ENSg9g
	9hw0DeZ63cI/eHh08w+HGY6mtR4Jh1lidBkWa3VC5rXFbBfOeyBfwdhSIH02dOYxYk2HgsxtP0u
	uW6Pq+7PRUvHi/HKYJ+BoJE8/mG8He3TFq5XAdWGN1bhp+bOcNbqJpsPkZg6OnDjcOoD3iNNgfg
	GyVeWuu2liTmk2q8OiE4K7fVi6a2FN1GkaTJYrlQU5b9UNBrrXXxmD0MRYcTC8A/oZ+7SyErccz
	7R5fcyEjFIKDhq9RIWK7fn/VcCtg=
X-Google-Smtp-Source: AGHT+IG+S8EHXkDixCfKjiD9TLmPOVJSu9nB/gnFswyFBWmlaqpq9SDKhuT/ueldL0WcRP6mU/8Ixw==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:9350:44d4 with SMTP id ffacd0b85a97d-3b8d946b3d7mr10399692f8f.11.1754386146140;
        Tue, 05 Aug 2025 02:29:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c47ae8esm18309695f8f.61.2025.08.05.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 02:29:05 -0700 (PDT)
Date: Tue, 5 Aug 2025 12:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Allow empty section headers in
 mdt_header_valid()
Message-ID: <5d392867c81da4b667f61430d3aa7065f61b7096.1754385120.git.dan.carpenter@linaro.org>
References: <cover.1754385120.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1754385120.git.dan.carpenter@linaro.org>

The mdt_header_valid() function checks all the members for the elf
header to ensure that reading the firmware doesn't lead to a buffer
overflow or an integer overflow.  However it has a bug, in that it
doesn't allow for firmware with no section headers and this prevents
the firmware from loading.

I know from bug reports that there are firmwares which have zero
section headers, but the same logic applies to program headers.  An
empty program header won't lead to a buffer overflow so it's safe to
allow it.

Fixes: 9f35ab0e53cc ("soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()")
Cc: stable@vger.kernel.org
Reported-by: Val Packett <val@packett.cool>
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..d91c5cb325e3 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -32,14 +32,14 @@ static bool mdt_header_valid(const struct firmware *fw)
 	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
 		return false;
 
-	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
+	if (ehdr->e_phentsize && ehdr->e_phentsize != sizeof(struct elf32_phdr))
 		return false;
 
 	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
 	if (phend > fw->size)
 		return false;
 
-	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+	if (ehdr->e_shentsize && ehdr->e_shentsize != sizeof(struct elf32_shdr))
 		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
-- 
2.47.2


