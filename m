Return-Path: <linux-arm-msm+bounces-12340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288838612F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 14:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D204B1F24C11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32DD83CBD;
	Fri, 23 Feb 2024 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UYnM5gJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDD82D6D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708695584; cv=none; b=t/GP0qfCvQ71EA3LHwgp7rku1BLSUbCY4IJMlihJmi3UBeJNIjH4+egDK1f74qsXoUmnMDmojG3xWcWzg1KUAu4MV8OTnzzvpY7zX8NUGLY0HSzxHMa32y5rFcf2bAkL6hUDnem9QZEb2s6Cm5pN9cHVUoJvPf9ZrvZtbkuITFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708695584; c=relaxed/simple;
	bh=R1NuUyaeVwVoZIwzuPLNIPw/PKBxSpCjUIAi7QjCL0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l38oHI766xwLKm2zbob9GC7qdUIO3uW8TUG+CInGLCOb1UZrnEK3I/A1Gkz8qJ7P9fwMXDFGv7fjYe8c9HvKwqaq7xJMkvYCju3Jl4Vkstmf4f8nhbgnANbX0nhbrskwqJiH5OAgAzOydchZVuzcIcp2MAcBk0a5zWZywuHwXx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UYnM5gJ7; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c788332976so22258539f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 05:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708695582; x=1709300382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gvcLqkFe+gopYfSZR07+vFTVoG9g+I5ZfBO7osdbeo=;
        b=UYnM5gJ7bDRw+VHe7aE04T7ZfdC5mYfQWi9lHOgsHBR04QpxNTaNJalgcU6bWGpaaI
         7MdppIe6eBTwVtv98+7eexyNpBT97Cyb42JtvRUes55YisDLC2w12P7MrQx0b9BQixeU
         YofI4sH2VTOZAsYwGhy7SujQJlrIfPcVhC6UKomVlGa7ze+krKoNP9XIMOu802oJh241
         bf4mRLjA5FXQolJdFOcnzso5Pk4MjBvcXkTFpKEvyz4DLTSh5hS+6KV5B15HQzQX1tK0
         ABoAGvtOJEorIxbE1ogURFfSnyKZbi+Lov3uWpNMjWoLLxQ0bitubBJWklLI/dwmKrdG
         fwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708695582; x=1709300382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gvcLqkFe+gopYfSZR07+vFTVoG9g+I5ZfBO7osdbeo=;
        b=VJM4dsMSJ/Zj5DEh/N2N/oKRXjMyCXk65+VNnHiF2c0dYHmH4F6LfkdBm4K+n5E2nD
         eK7Zh9fiOrH3iGYKKgugpbNUuvagnWm166AIR5ItpQtHfS65axpN3degFmVsx0B6o9Yq
         2V3o9PMYwmvBDYQ6GXyk9mZMidgI2x66eQ1CPUKjm2oW4cMUnyU9Omd/AnJ1nA5UJAUA
         B1bKPyI+ws19lQktTAD7VDlQ7boZu4DifEUuRxHP55V37Or/ASjgiY8cMPoqKru7c8HN
         d5rIcD25uKhwqS3K2YwlAkBPBSdrz5CmQwv1tE9SeMYw/Sg8iWvwTCgZfW8zoFiQExNJ
         MuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8P14AFtU2X63qYxYbNc2ldPbhzNlzDo8iUpK2zZ11y4Z8LPo2fhCvmVcxYvLbVfDngFHorzLC8VPkWbyPanfHTu+YQz0r2FdeAP/sZg==
X-Gm-Message-State: AOJu0YwMNJnAUCqRG9CQIAfRZKvOTWcpO1qoPkKp+swM8RoiriusLbIE
	Y4Di7yMaMRCiNAbtBQpIkT3vh3qAm1yLkVCTS594OLjZOZxY4T7JypA24ApxfXo=
X-Google-Smtp-Source: AGHT+IE/HlJHMChgqnPJEnIEbroCxWOXAm0Jz8sTh1lr/FnApKR5HEYZd0VbmWlq/M4D+Sik0Wc49w==
X-Received: by 2002:a5e:a906:0:b0:7c7:97a0:d2f4 with SMTP id c6-20020a5ea906000000b007c797a0d2f4mr1799853iod.9.1708695582465;
        Fri, 23 Feb 2024 05:39:42 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id p11-20020a6b630b000000b007c76a2d6a98sm1836838iog.53.2024.02.23.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:39:42 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/6] net: ipa: don't bother zeroing an already zero register
Date: Fri, 23 Feb 2024 07:39:30 -0600
Message-Id: <20240223133930.582041-7-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240223133930.582041-1-elder@linaro.org>
References: <20240223133930.582041-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ipa_interrupt_suspend_clear_all(), if the SUSPEND_INFO register
read contains no set bits, there's no interrupt condition to clear.
Skip the write to the clear register in that case.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 501962cc4e90f..4d80bf77a5323 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -59,7 +59,7 @@ static void ipa_interrupt_suspend_clear_all(struct ipa_interrupt *interrupt)
 		val = ioread32(ipa->reg_virt + reg_n_offset(reg, unit));
 
 		/* SUSPEND interrupt status isn't cleared on IPA version 3.0 */
-		if (ipa->version == IPA_VERSION_3_0)
+		if (!val || ipa->version == IPA_VERSION_3_0)
 			continue;
 
 		reg = ipa_reg(ipa, IRQ_SUSPEND_CLR);
-- 
2.40.1


