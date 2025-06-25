Return-Path: <linux-arm-msm+bounces-62493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F12AE87F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 17:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 835CD17CEA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9C62D6601;
	Wed, 25 Jun 2025 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVEeVp8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B229B20E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864966; cv=none; b=d+DVkS9V4iFzjiDHbwRHAXQs14VfUpC4yWVv0peuADPYYOsRK/vaMusUbmZVYqE0JJ0apHqYQa1SSWD1PX+8cptQSgv7Wg8Y9j+yWTwzdpfHDaggPH8wqaaLJU43G6xfpJwuSBToDVVmlQsTW4FLtiY79wR8wadmj2b4yqGF9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864966; c=relaxed/simple;
	bh=mQ25qvLYMDyvpv7j/NtUZhUMRsahcY03k4TaRiRkM20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUr9ntG89wcWweLU07webdG2hcRWO+PnmgoghdNy80oLQZkdFZXGVBa5u+UWwJHNLbhCOZznDwHmWaZGk2/3QrDQdhf4S7UI8fT6KO0Vw4kFZUk+6Tz1RfGArMmA/Zr0XUfWXSqOjt9Y3hvliN2Th0Bk63yd+yTYJMyHRlsQvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVEeVp8D; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e9071e3706so30059fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864963; x=1751469763; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=FVEeVp8D7I3eWP/zEEURmhwpJmvCTTmC8Pj5y+FDFPIvzj8Rtl+Zz8DJxTW67fY3Pr
         zPu0e7KC+B7RBgGwZ+pLVa7Ia3Qe/wvNoSP6KDiJICpazSCtJPIQpg9kvV5+X9xlsjAc
         3Zk9nocvX12gjIUO3U3j+CF9s3b/rv+VrE6yVxqQt5jDw2Yca0lLVh512fHpUbr0em+n
         /WnQEcteaEZnKtGLlHuYEvEMb+dRr9gJ3DsT+olDUORWCigLtNCoOISSrxP6dY5P8mLL
         oDBI3iSdisUFIFSCHliuuj+o19uNIg7qQePHcsqcmoWTKqi3q9HYB9/oIz/iGj1HZIVm
         XogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864963; x=1751469763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gV6LKTyimmW9Sx8Hibhbqk80op5pM6YCyNN7CEAKCkM=;
        b=orZy+X1x+GjDjyfhGFPSsEw8g7gc5+NnuLfmgTbRGc2K60D1Cdv744RdlQDeHAklBS
         sH5QhmNDRLvnUr7+mcGAc17MdyHjc1lrk8fyg0NeR/30kQYeod60JmM4w3glW4nTjkxS
         GPoIL/06KhuibWK6EjSw1bosYDOCqtL8Opo/8fz6Bst9W8md4YkI0t+DrRoKD3/qy16H
         MGwSEnCgsjZLM7aSsC2zh1aGmh+Fahrt8+X8lNbCIynsl10e0IgzZwVp0dm+xD1tQFZn
         9okSPzd7gTxMvxs+ss7HXmVJXDTw09SAKbzBI1B+hGeKdSwWraFGgTiM5Se5VA2LAdv6
         1Qtw==
X-Forwarded-Encrypted: i=1; AJvYcCVV1/0cDhdj0CfawXC5ZlelICDgV115HASd93zIQpMWGn3U5NJL9TqcNukOdaJU+YBJ7plJuDQExF0Z4ONI@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGWm/SIA9ReVxP7WDOXfZ4noIFyOuldBNPbrERkEgUuOoexS5
	p+gzZJUfrN3ohSIxy501QHheS4B6gNmAZeRi2b/Q2nW2HvO2u4PBn7smHilwVGMoJsNXutvpgac
	jN801
X-Gm-Gg: ASbGncuE61MvzlaFRhqV7IVVbiviIdBMAD23gM6K3L10NQJUK5lO9HcCWMt4xtC+3Hx
	RpZhLAmF71Lh3DfyS6tupZaAl1l2FCTLoD4Zg+xanQ8mZpBwgamQAIusjodLocYdHZO52kSRC01
	V+S5ur0J1feLbTObnxYe2uVe5uNI4F8+DeWv+cs2GMordHpVqcTYlH6E+WPokvHMprTFEH1AbsW
	gk0Tv2vShrGIch8k8yDohE9ll9k8Ly6l+zAnSZOe2lXxj1RVU7VXrQeV/pENns8uTP+YYmrnDjI
	wqF8Ubgk0nTLFMcolbMSrSJCRBslzbufnJknNDfC1RuWWKu8rjh0ze6BZEs0xh7RRTEqu9uytsq
	2ix7n
X-Google-Smtp-Source: AGHT+IFd6lJtom/4lncQLlKjav5G6+Wsq1AopBqbxlhEagb6rUzpAIrbOCnTOFGol9ueG4rxfQAm6w==
X-Received: by 2002:a05:6870:af88:b0:2c2:c92a:5789 with SMTP id 586e51a60fabf-2efb21346b8mr2671351fac.5.1750864963645;
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ee664ba910sm2562945fac.8.2025.06.25.08.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:43 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
Message-ID: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function is supposed to return true for valid headers and false for
invalid.  In a couple places it returns -EINVAL instead which means the
invalid headers are counted as true.  Change it to return false.

Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 1b4ebae458f3..0ca268bdf1f8 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -33,14 +33,14 @@ static bool mdt_header_valid(const struct firmware *fw)
 		return false;
 
 	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
-		return -EINVAL;
+		return false;
 
 	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
 	if (phend > fw->size)
 		return false;
 
 	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
-		return -EINVAL;
+		return false;
 
 	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
 	if (shend > fw->size)
-- 
2.47.2


