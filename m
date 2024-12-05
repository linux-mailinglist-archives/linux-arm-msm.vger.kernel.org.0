Return-Path: <linux-arm-msm+bounces-40427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB839E4C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 03:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929FD16A5A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 02:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2668218DF93;
	Thu,  5 Dec 2024 02:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVtsZenq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230340C03
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 02:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366033; cv=none; b=tK9MvgomMvIAtkJjj1lm8lYzI3JyITdXNfqdoUmHAKDwzm1p/WWRFqPm9S5ZmRCqSQW4ZxuZDAL7njreg1FCeRsxCxT4nYAHxFluVGrsR+xNOo/uLeJsXhU8bw7xiModSqPdYtmEnfQxonufuwdFb5B2lofsP5o73DeNhm87vx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366033; c=relaxed/simple;
	bh=xhvG2NwxZkcFR2qB1vfTSDmCdapS/aAksbx9vqP5zRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EY8qsLmNlo/ywwXL2HG+rF8VwH0BCBgVOx+uGL7MKvvpFvtua2z6t8POO9mlowTrF46jo+qWbVN7EpQHF97wo5SUpNMYqea5mOLGSldWLvABKD6LdVglMjvmjE3K/G6ZEQBehvL6OqTlEGz1Xmg4CbYJiB5oUiompWoYHKBwVHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVtsZenq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so2734525e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 18:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733366028; x=1733970828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw/euE+jaRn8KaVOalk6xiOyoDYKCjli0xV5JRXUqKk=;
        b=HVtsZenqqmf2GIaHaHwMI4CQeBSGrP2f4KYceQoyYlX5igziiZQIR1068CCGOJxWrJ
         8cVYj9tRpbE2d6FNWADYkwUf/mPkTTbs4SMVab4CoNYBaaJRu7Tp/w/ZWCXZSisFLJGI
         yMfZP7szpmPqZ6qP08h9EMDa62W3Sh6/Q7iTwnzVBARES622ltZnwfWm9VzsomO89EWE
         rT/2uI+phns73rwwUEGI5+HUI6f69uUd/kPZD/Bpzh4nNFK5DsYV0gpMnZKTyiiWBCLY
         NuM/xw60tWyrpfns5WAyp9PY+WftTEcFiFso0I3ndYl0S4LwQuci5OgE0/8o+IcMj66f
         2ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733366028; x=1733970828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tw/euE+jaRn8KaVOalk6xiOyoDYKCjli0xV5JRXUqKk=;
        b=WAgbdeuFgwj4ZOk+9fU88J4mMRj8AJUQ2nEA9bkB2YWqaIiDRWNTgsFT/gNWtZeiQw
         hErqe+XS87AjE/Th8m5NsPz/adMUDr8zZnqIMUe8U4/yNerbZuRNJ/bzhMpXt8Gn3RB5
         nYp2zq7NYSOry9Mq6yEAROihlEPc9YSrdEmaocRVU23/3Sd9sgMZ7pTPuXzIcVq75M6Y
         /0qJUeAaOeNlSWhNEWXhwwcBm7leODWc3010n6cM18iUpKkWlofy/y6/y22xITeZn9ZV
         oxTAQxbUcCfWaKyq3sOprH0WIRRfnsnLUHcdIj9Ikm1TenQlRljOswlgn1TzkzPuBqO2
         TJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCVoBl+uVJTDXJONrioIsFDCOsSvQL+nCsETm8Qlq2sdn9DoCVEf4P7tqCPBVjpMDEAhj/KjLo/BjrkVmgF3@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxJq5NJmCFpOyF0PlJuilYmMq4Lm2jiHVYrvJQdqB3XVSQnkT
	U6NMyL4R48G5eJYkskE9MEs0BSuG+kLzizT3PGXa9BSq5Q0LZulDex3nk5/q4xk=
X-Gm-Gg: ASbGncsKhcrYdSSuOxlAaH3h30Va9ybTxGkFi918HR4riRW793EH3fWjjYJWJ3d7v8H
	rv2cZmZYn94IxvXyUHvqvkM/JpmVYZ704iUiPUZzwdp7mlIFAaQS+2LjMlOa9WqSRhlFmzKXHO8
	42k4NdoYf9V0NgGvOZaFgjSxuRae/Gr0XVxM4SCqza7eXJYksZlpABq8am6sycaSrxzP1FGPjn9
	f4zByEB+JfqzcHdjFs2qJ3EBIjmakOob9Csq1WEO9kSvS5hh0cjR0NdDvS42My8EOk2
X-Google-Smtp-Source: AGHT+IGRZIMmR1wcEX/dxzQ8T/nOq0eVnMC5OkJbJ1F2kUPg8auZ3LPl2T+hZ3Yyor0+FmhMD22q3A==
X-Received: by 2002:a05:600c:1388:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-434d09b1575mr75575205e9.4.1733366028411;
        Wed, 04 Dec 2024 18:33:48 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm44444325e9.18.2024.12.04.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:33:47 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] ASoC: qcom: common: set codecless link to be a backend
Date: Thu,  5 Dec 2024 02:33:42 +0000
Message-ID: <20241205023344.2232529-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When codec subnode is missing in DAI link description in DT
the DAI link codec will be set to a dummy codec and link will be
recognised as front end. Any playback attempt will fail since it
will not be able to install hardware parameters. Fix this by
setting codecless link to be a back end.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 928cf5cb5999..e8ae15fcb1a3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -159,6 +159,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			link->nonatomic = 1;
 		}
 
+		/* set codecless link with dummy codec to be a backend */
+		if (platform && !codec && link->codecs == &snd_soc_dummy_dlc)
+			link->no_pcm = 1;
+
 		link->stream_name = link->name;
 		link++;
 
-- 
2.45.2


