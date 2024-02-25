Return-Path: <linux-arm-msm+bounces-12484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD0862CD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354431C210F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFC51B948;
	Sun, 25 Feb 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZYj5Zs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907DD1AADB
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708892753; cv=none; b=hbH/0NeHAJBaAfnmlMixeEuLcNiWkVz4PzdXBpO57vpOLtxkjwUJKniShj2IU1/osxsHHciq8PeS0UHl6iUgKdGUk76y1xnIe32mmaH6pBU/l4bSB2vtbdNFhkefhfaBSooPJsfnExtyPcnQo49itK8qTEZLvSEwG1tYE55L6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708892753; c=relaxed/simple;
	bh=XpB9qOURxMv/2k6RuoLbutR8HNHjB9TIj/by6pcJXQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MS+tYv0VU/tlXyFwsMzyOK3D/UKz2OPaCwqhhgZMt4j3U+TVfq3Rb3u+E6sO+/aMDzZoUrg9h8tSKrwcyHf57NiIjMmwx3ReGugnjo0yDGevcrhAWgiQf8lt3BHl6j5skoTf4Jd7EBq21P5KTTRL0hqp5Xijemc2ikHt/5L3vNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZYj5Zs3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a34c5ca2537so324724166b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708892750; x=1709497550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/1H2TZMCfcpgZMobR8pMaeSMQdVJAknk3y/IiKkNto=;
        b=iZYj5Zs3JeuV2bIv6/1+rhE9ROLaT9KCnllHePBkeyquit8OrVbBZIcg1V3QAUmwGF
         98oobz01mM9lfc68zpbuwqTVWKWq1FzsMoWFREe1+iCKqUkdwIqCbovKRlJZItglKyti
         dK5sk0wbuTUWwMlUGoZz6CEwiEAkZ7/t4yt3f4sgsRBjGuRSYzJPqTMvOHdX0r7TNdHH
         Nv8FcrIYQewMBzC60RkUVYEjNgkGOk8xeKuG9JeS5ktb2eaadenG4Z2vScJ8+vRQPgCz
         c4HPjQzklsS4nB++K6uVT2pcaqrAGrXckrB8cSK7udhDpa29KGaHmrVjSLjqYRYHm5Z1
         VVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708892750; x=1709497550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/1H2TZMCfcpgZMobR8pMaeSMQdVJAknk3y/IiKkNto=;
        b=vAksR0Yrr7SV2dBlM9mXp8M0c9UaQYoTo9TMHbVTrHXSXUs9b6RlyQJgoHnBYNF+Aj
         lAZViJZdifIFc+lUqERXvtimGAtljAgSiaiT9mtf3Xtqi4zC+xJbAQ29fbx8V4JBcTLK
         WZK7eXi3dIbwr8mSFuXVPkP5kdrxPMc4/jf901A7aVmhkh2iSbbRPAI9IwiE8cuFb5MQ
         VMlI4VB+Ld52Z1ucMQqAH9GMtGsAImrhAsv8n047uVUzgDNkj4+w98/xM4vTWq1a1+hu
         Z3XP4lxuPZgo4kUt1OhZXsY1zxX0Ik0tO81qGeOfEhXhORCmwQ59NHwgMr4zXO06SWtZ
         u2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXxkt0CG1bPAPWIBP3q3hvNZyxsGZfrKj/5B+36cfGF1SgB8tNLUJin7e3lR5yEwkCqXRIW9ifnwzJaHuECXncOOE5rsd6ZfdCTgtm2Gg==
X-Gm-Message-State: AOJu0YwJ3OJdgJUGJ5ygWcI9JMFMLSeXgLz08VwrBbkL+kT40T3YOlEP
	bRiHYiHe7GGqo5EsIEf/T0qw5isVUtgLi/HUviL8vf2bnmKWOXVshCZFcQQUMaQ=
X-Google-Smtp-Source: AGHT+IG7WOlhODhQGSzktFMF8CafMRpnrT9DJWkB/pPO5hzhAghh84jR8bEmxPgMioElEbFp2gBC3A==
X-Received: by 2002:a17:907:765b:b0:a43:4a7b:1c7e with SMTP id kj27-20020a170907765b00b00a434a7b1c7emr623461ejc.52.1708892749848;
        Sun, 25 Feb 2024 12:25:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id a26-20020a170906685a00b00a3f0dbdf106sm1741491ejs.105.2024.02.25.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:25:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soc: qcom: aoss: add missing kerneldoc for qmp members
Date: Sun, 25 Feb 2024 21:25:45 +0100
Message-Id: <20240225202545.59113-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org>
References: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing kerneldoc to silence:

  qcom_aoss.c:93: warning: Function parameter or struct member 'debugfs_root' not described in 'qmp'
  qcom_aoss.c:93: warning: Function parameter or struct member 'debugfs_files' not described in 'qmp'

Fixes: d51d984c5525 ("soc: qcom: aoss: Add debugfs interface for sending messages")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index e8ae8aa6391f..ca2f6b7629ce 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -71,6 +71,8 @@ struct qmp_cooling_device {
  * @tx_lock: provides synchronization between multiple callers of qmp_send()
  * @qdss_clk: QDSS clock hw struct
  * @cooling_devs: thermal cooling devices
+ * @debugfs_root: directory for the developer/tester interface
+ * @debugfs_files: array of individual debugfs entries under debugfs_root
  */
 struct qmp {
 	void __iomem *msgram;
-- 
2.34.1


