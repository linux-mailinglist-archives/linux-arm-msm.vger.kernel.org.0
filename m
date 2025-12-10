Return-Path: <linux-arm-msm+bounces-84826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D006CB1810
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4AB330B5243
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085391ACEDE;
	Wed, 10 Dec 2025 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg+NfP2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06BE19995E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327059; cv=none; b=lEkGtdLm11stCuguSWE2lvC1Ta2JY7t303tbwVaBFkJlPLNQRQaFWec/6F2ygRGESO03/seWzzw+J8HRmUTfyMYY1Ca9VFM78KuthsRd2V6OPWU0vnWFOtZWRYsQqtHYQFcx5zPh7VQx5vYTka0XrmTgHILjKUAledboD+f+0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327059; c=relaxed/simple;
	bh=K7SL4I/jLPDVOaIVbr+yXThL0SdIYhmyS5+E2q11BCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zhf2rdcejLEkXkf6FIp9kMabFgA4S9ZMurHC4EeIQIh1T2HDr7rdq+iQpkOzIiYu1e7bm5DHm1w1cviUgmD0RvIkZirSQ5t5SEIyoCI5pIZxzs4qwqvYiu8xowWnIU4NCk42kQ2pEjejaJI3l8cXpDJzZw6eLZ56ldOFBIUi98U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg+NfP2Q; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so5070017a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765327057; x=1765931857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVce6XDDwdhvebzxe/BKrWVM8PIwQ4nAIr2E3eOzxcI=;
        b=jg+NfP2QoCYdEl966aaeRC5omG8icNcB/QVKRa2aPZsXeonfqsATS+u/kRwEv+5KSL
         vDdaFPg7aU6QxStC4uy2B+EyOtt36+nRbsV9YR3NugAh/l6ClhLmxGkGH6X1X0gl4mtJ
         xJuEPjUSCxh68gY72tM3RTvo43YENpW9yE8zXlm7+8BeYGn+i5AEXjdz0kYzdtIkoqYT
         FyjJqjwOuygLiCjr518dtT/XzyBGmFNlo/XAk3d9J9cVlFwoMcrQ7WPZavkmQjadIScK
         e46N1CmeepapMJ3bzlgyXUHVXwngjUBy6d/VV9G1U/v3XW/nPeOhIZcq4jZkFmO1POyi
         awqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327057; x=1765931857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVce6XDDwdhvebzxe/BKrWVM8PIwQ4nAIr2E3eOzxcI=;
        b=QiHYaVLwIuv6ASbuJy6ar4OOeiPR5sWouyBB2W7VvXI8rbw2JfN0OWBUfSUFg7BrFN
         X1kgVhg0boTbr3i+bOyIRlpfZzt5VZf/KOmUBT0N2s1+b10w4TyIo+Zvvgrr4BYUGM8/
         McPV98TY/biSNDo74C5tOBBfDbJgrvGrjTGkZFqPK+caVFv6kv3Dq/Rl0vUmSfqoR8ya
         KOJ8GwbbI9uQqF62+tnK7Ym5NGGn3w5TjTJkl+Afkpvm/bCX0IiJlpFxFQZAxtrbPfxv
         3bOFprBF26INBbvk0dCz2tmXK5gFARiUKDXpG16YiRn8Er6C6qjvhMk/vRWTwBhhvQEI
         7PYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXux6GMqTStqYAGWVnqSxvbKNyFdE9L0C3AeFBu1cBU+JIBwr6VxcbpC4mllq4HiRKfJ0BaPd5vJRMzN+S6@vger.kernel.org
X-Gm-Message-State: AOJu0YyvY/pC9HSfxtwCKf2QMhw5v8onC8WUsglMzqv6tgKb/5DBPYTP
	sCh0EpoewYrqmy19qqoyKknVC2HWU+IvBKrwrIZc1/tsYGZA2qgFJial
X-Gm-Gg: ASbGncvoot11SfPLVk9TwH+MZiY2UjooYgbqYEP2lGM8Z0uhIOpaYvZzacXSqSIZ+7F
	MKL7Rk0Vy8ZXb6BNCCoMyL+cXJ+lYJukiLi/nxw5xmBZ+B859PhQQaZsfbIIzHVAvmhP42RuVSA
	GowU+mdMbu/aSrHTL7OhKVCUjqhiFcUJsByXSADB7xkUv4j7r4J0smNCsBE6Bimes5VEV+LB1mQ
	4wUErSrrJlrk5uy5ObSce4VRnRJQyO/41+3NHiownFGzVoyJXvjegMHKBxCF1lY7T0iNH8K9Jte
	2DrKP3c2BafJdJQ1X3BJjn0GkE6KvYLznRstG//sORk0/vO5Im4Hg5FVD9fQKzXQyIImMeHZOQe
	3pY2+lbDgTHocFeS6Cfg9p0S46ZEhRXb3QdBP90GbNRrpqIk0+67LwhYPxDtC8IddrkjB4dBzjn
	KIp/A08HYDYrxgUeISTjcbYUvyPK9VgzHn+r1Pzd2k73hrhsQ43N3Z4NFkPh4xKYXZXhEUKkQZ3
	OedadVFIiOKX+PhiKXFvxNbX2Ps5MNECpLkLbE=
X-Google-Smtp-Source: AGHT+IEg65s3h9e8Yp05cjRdQ7oOeApFKAZof7ptzLGUYqrrlMeRO3TUWBgDrWjfg7jGq7tFMiGYeg==
X-Received: by 2002:a05:6820:1845:b0:65b:2795:cb0b with SMTP id 006d021491bc7-65b2abacf7emr471229eaf.1.1765327056774;
        Tue, 09 Dec 2025 16:37:36 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm8588826eaf.0.2025.12.09.16.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:37:36 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH RFC 0/3] remoteproc/qcom,q6v5: introduce IPQ9574
Date: Tue,  9 Dec 2025 18:37:22 -0600
Message-ID: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I want to enable ath11k on IPQ9574 SoCs, which uses the qcom remoteproc
for communication with firmware. It is similar to qcom,ipq8074-wcss-pil,
and I think it makes sense to extend the IP8074 path. The existing bidings
are not yaml. Am I required to convert the bindings to DT schema before
updating them?

Whom do I add as the maintainer for the YAML binding? Do I add my name? Do
I need to find an existing maintainer who is willing to use their name?

I would like to add the remoteproc node to IPQ8074. One of the resets is
missing from "qcom,gcc-ipq8074.h". Can I use a placeholder value with a
comment? Am I expected to enable the reset in code before adding the
devicetree node?

Alex
--- 
Alexandru Gagniuc (3):
  dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
  dt-bindings: remoteproc: qcom: add IPQ9574 image loader
  arm64: dts: qcom: ipq8074: add remoteproc nodes

 .../remoteproc/qcom,ipq9574-wcss-pil.yaml     | 269 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 -------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  79 +++++
 3 files changed, 348 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

-- 
2.45.1


