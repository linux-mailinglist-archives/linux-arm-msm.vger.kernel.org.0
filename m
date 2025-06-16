Return-Path: <linux-arm-msm+bounces-61399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA7ADAB28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776D018928CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133982367B5;
	Mon, 16 Jun 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8oLj4LZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC9111AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063915; cv=none; b=UGEKAf6e4LdvxtedsvuH/7G4o+iUCSGnAuPoV5pj6IcRk3I5nUMOKRJQ6xxO9I7Qq1vQ3g2QVUUxm5EheCHrDq8MT1sEU7j4Vxd5rv0wMKEmyrI99BRpYihfNPXeyjUGUXTGqJg8dyM4pzMgLr45WRKTQAXhliv2UXMdjoImlHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063915; c=relaxed/simple;
	bh=NTlBHep4nziOs09zu2YR+zJGqy3leeh8bhQ6aUCbSck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wvl/OBxY81gMRjw+gJD+hcjRQGg2yrv6zntIiPVPzAu/lON+ClNzWAk/ajL9Jr2k1IfCgHCdX3Uok0p4qBpj7q++p9qLzrVHQaWJaiiQFSnTNVsyyIT+4IkrLfDC7sgWhH676P2UwLJA6fLiiE8rplwaQLQHjF6Qif6QDfHQVac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8oLj4LZ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2360ff7ac1bso28982135ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750063913; x=1750668713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIDFHi4f+218CotcHJ3ei2q7tooAeQV+d1LkFDlncu8=;
        b=C8oLj4LZK6i1w5tlvX/g3K4oxkzLtY2eB/5awm9aZJMQLSJw4UBizBABNmQTONJ7QF
         pyQnqJrOURn+E22Lvn7/pev8gJG702/8G2qQUiPxiytky3/vpYBG2ktMTrLiKtfKuz4p
         C2/MgZj2NW52qcnwu85Gt07l2cSnQiujaMKOHKeRkd67zNKP8Hf+Ag6lPxITS4S+ALYM
         lFAh8xcXZbbeOpWqmtYBqxboox3qJd8uAc1vAP8mQAFzzWv77D6t4uPltmJcadIkm4rl
         FCSyEYWKR0lnAz6+asikix3dkvZ+I26/o/NbEvb2J/tW5OrhQ9zXrY6w6nZxeuZdi91x
         +mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063913; x=1750668713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIDFHi4f+218CotcHJ3ei2q7tooAeQV+d1LkFDlncu8=;
        b=XfSn0wWavIi/mv+nxJovcSMmo66hNUZvmI+umwSPXZt43Rmth+MTyKrpFazz1GFahG
         EKR6JDA1FDwrPrN7LiVMgOcHvqQ8pQXzvanWC2AnFvaTABFOnu5fpuLE691W7f4RUATx
         Eo3Odq+UiFUWKHAvRGLr2a1xuqATfAOPBlofXPR3ad8uoJzwk75zK2VG6kANtO2uRokT
         xAbHqhpjGtg64ENFMDOQKy9/xicSAr7AW9/RHMjG4Q8TgNQQcBwLRNgJMupa0XeEySA3
         SeIWn0eAWgbwpmA9UlFb6qn2xUJLgtDN+7+LBf22FF2pQKFWiCS+tet8EesJS2HaAgmA
         eunw==
X-Gm-Message-State: AOJu0Yx1T1Z7cLSaVzw39VOtT7j8ECMCSzcvw+MnXQ6CHnMaRc6l1uou
	f/GwJECdSXTh2LOKktknx28kNdzzheiDFBWFd8z8ILs5N+3jg6Gu1Y47h0TAC34f6f8=
X-Gm-Gg: ASbGncsagFmEQnXVGRShvzYZTw/KMaIqFDUgBcepOolSdIy6JgKkEqM9AVrr9K0kkyM
	ovIJbi/9nuymJm9z1sh/WmysXVOThgXxpqVcod+HKvGftp6Hu4qLGgeaUx2QKH0trj68QsHxh6h
	hODe9yzTvncom2p+/BbU4sk9wXIyk1sqIa8ZgAz/VwEss4XeQSGC/MDahqtd6s6p/4Jle8pirLS
	L5YACUUdA0e2BNxCtD8rrM1kriIP2WIyKQ+MKZIR4h9aBBVMcRuptca8i5X70LbMCsC7fPponYD
	lDq0SxTU4pEhZVM/MxtWN3se4HJ5gIHQ0CTv1Fs2UNox6uMtULPJuRq984G+Lq0cYhZTP7Vjto2
	E
X-Google-Smtp-Source: AGHT+IEb6AElPGH97nuMqW9PmdORlQqtugco252kLM87XJ/zImQldn4qKPQROcpjFfuCctqvDsGH+A==
X-Received: by 2002:a17:902:f683:b0:234:c8f6:1b11 with SMTP id d9443c01a7336-2366b144efemr137084875ad.44.1750063912657;
        Mon, 16 Jun 2025 01:51:52 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb87ddsm56345465ad.177.2025.06.16.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 01:51:52 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: arm: qcom: document r0q board binding
Date: Mon, 16 Jun 2025 08:51:46 +0000
Message-ID: <20250616085147.34762-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), which is
based on the Snapdragon 8 Gen 1 SoC.

Changes in v3:
- Set r0q to the correct, alphabetical order

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..491409905da4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1090,6 +1090,7 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - samsung,r0q
               - sony,pdx223
               - sony,pdx224
           - const: qcom,sm8450
-- 
2.49.0


