Return-Path: <linux-arm-msm+bounces-73383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FDEB556A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 20:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2913A5C35E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E9A334389;
	Fri, 12 Sep 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U62kabUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568631E10D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757703403; cv=none; b=P8pcWamtD5+LxWqzSBzI37TBPHterqxWvjrcA19oJ5xGr00lFact0TwR5x/BDfp/XmrU98l712oB2vbtN9T6tDZxnyimvVhAcogAuljwPRKLXbzt725rMpUbTIV5PjflXLv0ROxqFyu7zrbZfRvVOBg57yQYCDoM2WDKnKGXBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757703403; c=relaxed/simple;
	bh=He1pvX0XTycz95hAhF51zPdEOZXmBoTL3G+g8UJcZTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cMjGbf9hoT2tQdCPuqt16kNow08x3tJ8/Z79rHOSIBp2bvwytn/XezkidKpfmDBKaY3O/Udtfd546dN0Kv/ett1p51btcCYT0wJ+h8v90FK2J5UfS185eZd+SpdQGPqHZugXK10jtHVqrQcqLRcgQ9CnYt1Lg4ttT/oXmN4jo4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U62kabUv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7ae31caso400312966b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757703400; x=1758308200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=654+40ONPazsA6Sg7ViU5q8Gy7dAoujJn1HW6HC1QyM=;
        b=U62kabUv91QQunti0iYyXMOLzz4K0dFj+xesH0rhfbBXjp5VyaIPYCqN1FuHqjBOpP
         iqPsNTowr5Sp9paAKjH6FHqcLeKaDoog9nIP+1eHIwD9lUg93alvkByoCfDiXKaE9a4i
         nE/8Gd97iWey0a2hYSYuOT7xSXiKdkelbWgq7TSmLlV8yEaDNC4GfbAee1ivmM6Lt4qS
         0VZL+YxN+NdMNvPpPnvas8WwCnNiU5bjDIG8V1O5DcF664/fUeH+6LqgmrNxw14OYlLf
         IcF8WAv2PBacC1nqn79JCN3X2e+5yDY+ovMZ04N509R8CTcdBFB4Qfsh4N7aIQiFv31C
         MMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757703400; x=1758308200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=654+40ONPazsA6Sg7ViU5q8Gy7dAoujJn1HW6HC1QyM=;
        b=lT6pTCUZJq/URPVAGGAhwELbFE57J9swC9b55kXpIowAs8heLJEUR6eT4cLxJYIEQh
         wBl+w3XNDkDpRRkt9Xu6c18LduhTv6UbMigCShJnSczTYRLEOofJXAzE2sTT9+51a+6j
         /QEPl8dx6RtWlg6yKK0NUKmpVmLVt0pdl9MLfpgf0cOF6qz9ucdDEEv9h0OSFGFM1jXt
         3DIJEQJ44uC9YVwz0N6mNgowpj124/lZ4sjlWqjKDEYLE376wJhKJr1/U1JmsHfTDONe
         KGz5frd0JVtVn8GyFNOP5MNHQmQ/jZqWeOTOOnd31rknJ55gatMOQCNcI5CIq6E6Ng8i
         i2Kg==
X-Gm-Message-State: AOJu0Yzwi9W+SHjdxU4PoJxLBoEe4oMUVc0BXdKsWZLN8aYxxElSg8Ke
	BUHfefKN6QKBp5ujEDMWdTb1zJg4/vrn0gaHPRYEGMdgOISu2I+1IS3s
X-Gm-Gg: ASbGncur8ZdY4p+H5ssxUxmMXkE3kzqgz+/7kCixWCB2/NORT5QrPpULT/7lgxD40md
	3RENJRfddFsY48GJNit8LQpUfyJbWWWgs9yPe6zAC1MccfCEcxw9uvf9uUrTHyH/uluiRSEF9cE
	SAeAVAjcWSXTRv21jMLagMpr+j3VbqRbgK02jQVnNgiNGM9II4dUDXcPo/rvuEzXwEpGPjKXbSw
	fA9yNlxTF2SYeXpqV2QHmm5MhsgIiKSPszvOzPW+mb3k3vlAf0xqkj67hhGEGJqqC7SnB/y8CyL
	b9HGr9mZS0pSek886OaEXH8lkro2S+u3iNkri/1/b2KSDKo2H/N1tbMUHmL+KGtyKugqyr6clif
	lku32MirFysKu/3vvh5khTOejl/2WKzs=
X-Google-Smtp-Source: AGHT+IEYJZdStGiv/SbB9JGf4FKCbsts94xXGgPL4PEiVPcfXhw4phJXCET7IR/3PmJ1CAyUCWApFA==
X-Received: by 2002:a17:907:3f23:b0:b07:c290:6d64 with SMTP id a640c23a62f3a-b07c35bb321mr385941066b.22.1757703399891;
        Fri, 12 Sep 2025 11:56:39 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07b30da310sm418184566b.20.2025.09.12.11.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 11:56:39 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sdm845-starqltechn: add support
 for slpi
Date: Fri, 12 Sep 2025 21:56:34 +0300
Message-Id: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJsxGgC/32NQQ7CIBBFr9LMWgxQ24or72Eagzi0k7RQoSGah
 ruLPYDL95L//gYRA2GES7VBwESRvCsgDxWYUbsBGT0Lg+Sy4UoIFlcdXtOKZnT3OC3E2q7j/Gx
 PyFsLZbYEtPTek7e+8Ehx9eGzPyTxs39iSTDOVI0PqxqhVS2vw6xpOho/Q59z/gLkyX2dsAAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757703398; l=849;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=He1pvX0XTycz95hAhF51zPdEOZXmBoTL3G+g8UJcZTE=;
 b=s6RcrOx7dZpLE5BIbPGcN7pve802nwpf4rz56FH0qS6xBTs8yu/eHa0MHR2z6eFtgsNz0fRY0
 x/ZzLHMBRQwDstGUxyevqtLNAmPSMCMpWdastsmcigUgmDZBGdWzIDn
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

This series add support for Qualcomm sensor low power island for Galaxy
S9 (starqltechn).

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v2:
- fix commit messages to be more clear
- use fixed regulator with gpio to enable slpi power
- formatting fixes
- Link to v1: https://lore.kernel.org/r/20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com

---
Dzmitry Sankouski (2):
      arm64: dts: qcom: sdm845-starqltechn: fix slpi reserved mem
      arm64: dts: qcom: sdm845-starqltechn: add slpi support

 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250911-starqltechn_slpi-677008f4e06f

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


