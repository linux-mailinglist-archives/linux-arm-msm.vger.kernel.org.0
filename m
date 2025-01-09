Return-Path: <linux-arm-msm+bounces-44505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7FA06D13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446FB1889B51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9035213E96;
	Thu,  9 Jan 2025 04:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nuBlyRML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B32080C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397356; cv=none; b=REmVCzS6DPRGoIicxScJzkmgiwjXIThiRYGC1qC9ngrnaAMGbBCsNNs43UaKzOuXeZBJQe8X64I2C6IRn6n+S4OhXBarHgyXCdzcc7m+4lU9AewyMmoJxbn57LkZnPGH5pI1QG3Hpf8cL/Pdq2qk1o3AvRvcrQpfKqME6rf1vug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397356; c=relaxed/simple;
	bh=28lfeP0elk+tC/FtwJpVo5ll99ssX0YY1tno5A6BThw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXt5ruE0MQboMOjgdGCjZTI7l+Z0IH/UNn2co+ZpfrWw1hTkKinZDvx0djpK8hjTHC2yRDFW5usvJ5EzxiiRaZlbW85OIzfqZ8DKidOhCjVdZljtIwVz7IViCNlOI7jEey7qNIchfuiVbf79+afjuqmWD7Em0idQ7WhetRsa34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nuBlyRML; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540215984f0so543159e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397353; x=1737002153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQ7Ey0366JcxuGYyhKacm3wyhGFkT3OGK/0czjEyhxY=;
        b=nuBlyRMLiarLwassnGCzdJAh+bF7sO3ZQjdH5C+6tpvQ18dH0SlFt61fFqn/Rapk16
         I8+1zVMK3Gl2CuOaR8EmSUnamLbRGRT1Rqg3f25TgFy5BjfvF4qjQgg3h/d6E0KzM7cG
         g5gxbAZkJis2QPe5iHameL2NZP7zY1IiPnG+786wufRaS2T1NBf/00L22z34qj5yzmAJ
         12/CRuJPOCOZtog1if5/kPw2gt/MpJTmKG7LRQJvPpqFyCrYDbM3Hl4/oDaOif4GOehN
         amSTVEub5WQzJl5ANEJDNe69YfhCivaL1OISwvJkk0PuJjA3XgRlNxAc4UBsbuLNKrRB
         DyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397353; x=1737002153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ7Ey0366JcxuGYyhKacm3wyhGFkT3OGK/0czjEyhxY=;
        b=BnSCuX4Y7sOvfuLSertAAbWsqCoS5QksifzC+rJKitzfw0AifPhSNoDQHPYfvFzeTk
         Hj9yBPCT8n+ZuNTCrg6bpvTuRk0ldA+sixhIEfUvRKbAWBhAcW22vzpNIceEgO8E+FZa
         QlAZmhTfQ7iVEws6Z/SF1CxH0c8pJGiSwIqyD9Too0EVhrzRrcR5XimFF4ZfNF6FeFOY
         Dh/KxIIJrALvGxVE/xj1qhZk430CmCstx9slFww8XVQGtuYZ5At3oEe+tv27TdmIwfBF
         21FmVG2vRH5atMBHMNrbnQe28nwSSrQtETHfeX0SPyBA+KPECaRbRCB4fkhd98HhuKGU
         svPA==
X-Forwarded-Encrypted: i=1; AJvYcCV85N+05aj04x0t9M+XeuSc3ZAg0lPqncqZiGp3+0hKLPV7P+RCpT2DN7rDhYITC2/kGp6K5oFSQeOHwhiR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pjXUNLKYy0U6FFPo1ydHxzGK68m8V37BK2Q9JDze2C4V1d50
	qqyuSfaVu1Ia7wcEuMIJ0p22jpJSCHbslBrUjD2xkc33LTpsaPyD4SKHa+8laIQ=
X-Gm-Gg: ASbGncuoGLEFX+zVb2TZ4EeuQ72YY3lN0GtWK4/Y4RtOehGOdzzKFn63nvD8wb6Ad4R
	6D5C9iDthSHFzQNicCPdvjPTCjD9dD4PUXuUiqeXTjRwK1HzyVBtwh6fQEfClzg01sxLsRPZjkJ
	Ie238WjyNyVLzZblBhCnLrBB/ABQj85bcJ8upLV9m2x6YAl+OeA75tpk8HcPtTWaHSAJmMAn6z2
	8VDAP0E+MdI+u0MVZJPRhyvnAoTAUUXRxMBF3STNs/LQSiLqp41aNSZpsuePUpU+btZO+af4NH6
	Ed0VUNKHizuveoiMI6FOomj9
X-Google-Smtp-Source: AGHT+IG9P/BrUEzkdO3YjTFb4jKbXMe/fdiSuMkgWi8w/KxHUDnAYQ26vw2dH69lK6mbTLmORDlxjA==
X-Received: by 2002:a05:6512:3192:b0:53e:335e:7756 with SMTP id 2adb3069b0e04-54284815d10mr1450834e87.46.1736397353005;
        Wed, 08 Jan 2025 20:35:53 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06e1sm73866e87.191.2025.01.08.20.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:35:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 Jan 2025 06:35:45 +0200
Subject: [PATCH v4 1/5] nvmem: core: fix bit offsets of more than one byte
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-sar2130p-nvmem-v4-1-633739fe5f11@linaro.org>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
In-Reply-To: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=28lfeP0elk+tC/FtwJpVo5ll99ssX0YY1tno5A6BThw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnf1IjOYS2hG2FXUXbR7hTDfuUum1vNcR6hSs2u
 0caXs+FDT2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ39SIwAKCRAU23LtvoBl
 uHVeD/9UumRB6poWTUCyfIZtKnmWF+AJy9MH2f3Do2WizXmDzFk4eUe+J4CIiqGvAIC4TXLRkkd
 EhK1+bETRA2IZKUvIjpwVj4j90Ee9DM6PKfH7UMIr3qH7nSibGnDoVeqF0zHs2OOT8fPzPIRkc1
 NazeYfz2O0RsIRUyEkp/ExPbargr2iYPg+rT7/MLa2k52S0OQh+KcjJ2Py5gatggYzBHEC348gx
 eENbyNOmrHC4PqEBzf4eBh1caw8jcDacmQJo/ueWp9NNbIHaR2OX0jkH4JWZ2Z4zkOdXpa9s3Pg
 OFrIcGjW6sOrWVfDw/YtCEwLgrO2B2s+m6AkdrvTMjk9rzIi27FQ3cM9WA5doFyguC5fYCeM4Op
 WLtIbzjNawxE3XUJDfTKpRGQWyKHXuCojiQ5C6T277EbWjC61hwrw6jsedr8nbz0fvsEIH/OymX
 aXdFeGlFQXfqh8uNkYxsGxeyfeBqs+OohHDqmPQbzlySYG22kVKG9P2MEf9l1I+2UB9NbQyRJYA
 hYykNLoMVrIbCi9tR/9wLorq2KeKJbySZvU3sCOp7dWbfZyGgXRNmJgFxGfQaeXO9c7KsjAgc5s
 A5JXCguP2ou5fwaxuZXazHPl48xSkZCgJNT1h0+tqtr54nJz1ZwKyd1luMy+r73xXV909Tl9j4K
 FcoxU8hCJfgWanA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the NVMEM specifies a stride to access data, reading particular cell
might require bit offset that is bigger than one byte. Rework NVMEM core
code to support bit offsets of more than 8 bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d6494dfc20a7324bde6415776dcabbb0bfdd334b..7fa85b0804db360035d7471002dbf79658d5830b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -834,7 +834,9 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
 		if (addr && len == (2 * sizeof(u32))) {
 			info.bit_offset = be32_to_cpup(addr++);
 			info.nbits = be32_to_cpup(addr);
-			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
+			if (info.bit_offset >= BITS_PER_BYTE * info.bytes ||
+			    info.nbits < 1 ||
+			    info.bit_offset + info.nbits > BITS_PER_BYTE * info.bytes) {
 				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
 				of_node_put(child);
 				return -EINVAL;
@@ -1627,21 +1629,29 @@ EXPORT_SYMBOL_GPL(nvmem_cell_put);
 static void nvmem_shift_read_buffer_in_place(struct nvmem_cell_entry *cell, void *buf)
 {
 	u8 *p, *b;
-	int i, extra, bit_offset = cell->bit_offset;
+	int i, extra, bytes_offset;
+	int bit_offset = cell->bit_offset;
 
 	p = b = buf;
-	if (bit_offset) {
+
+	bytes_offset = bit_offset / BITS_PER_BYTE;
+	b += bytes_offset;
+	bit_offset %= BITS_PER_BYTE;
+
+	if (bit_offset % BITS_PER_BYTE) {
 		/* First shift */
-		*b++ >>= bit_offset;
+		*p = *b++ >> bit_offset;
 
 		/* setup rest of the bytes if any */
 		for (i = 1; i < cell->bytes; i++) {
 			/* Get bits from next byte and shift them towards msb */
-			*p |= *b << (BITS_PER_BYTE - bit_offset);
+			*p++ |= *b << (BITS_PER_BYTE - bit_offset);
 
-			p = b;
-			*b++ >>= bit_offset;
+			*p = *b++ >> bit_offset;
 		}
+	} else if (p != b) {
+		memmove(p, b, cell->bytes - bytes_offset);
+		p += cell->bytes - 1;
 	} else {
 		/* point to the msb */
 		p += cell->bytes - 1;

-- 
2.39.5


