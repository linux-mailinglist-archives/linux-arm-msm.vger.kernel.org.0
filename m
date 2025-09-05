Return-Path: <linux-arm-msm+bounces-72237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B71B4534B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4304158146F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EC526C385;
	Fri,  5 Sep 2025 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DBvEtHxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DF1FE45A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065033; cv=none; b=g5jMDnhwcfVorOhkcom+qW+IJIciirzTYVe8eU1Y+JcsDUCfiVP5drtcQBsZzjSHQEAGgRDUv9KOQIU83ZLBOCnFcU1jZGFKVcCZFqKKdItjxEZIkoxfq6b0DmJ2UWdOmOX32iF/KCkIwt8vSo9Ywk9wkhPGLuhLh/KztaSMbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065033; c=relaxed/simple;
	bh=RTPsdkCFfnLmyInrG49mTTXU5L76Gna1kznw6oY/wDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q3JHjzjdqypohmXkvnKnIdyHAszu+FY0cO/GFZ6egQUsFT0MRQFP7ZfY6rFT1QchCId2GSDIul+JWPHl+9Xs+dZqWrncrz15N08AW8j68oH9nRqaxGzJyAiGQFGurq7FR4BKMTwPe5EHr1tysdBmjgFMfFLUimADcNa/PnpLYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DBvEtHxq; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b043da5a55fso282394366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757065030; x=1757669830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9NnNfOCAMTA83aYrtuoiXCktxRcKZ08QSFQdBsWLtc=;
        b=DBvEtHxqe/7SfICMPVVvIdMFJcBWkwHQ6VEC4z/CxgVaeZCJwlaCxiP5tvLZUvyz9W
         WL3nfJ7q8BGZpign1nDv7KjXzqdS4MvwmTaPNw5U7MzjH5MIke7vTs5Xw8YdJuR5iQiZ
         Fx6WGgNwVVCPgbu02PcfnCPk4sBpIjXYiQHti73ZS6ocDNYZTbRaD1lSmx0Y7ALSUAjO
         +kj6IJSfC7FQ0t2WuBVgT+Xr/DmtmCbqkKQjaAUqSJOWpnKyj0T920cOjR01I71EQuZh
         GkUnQOxENO7fP8ytIMUSABsv396S6MHG5TIgUyr9Nm0qzJj2L/SGMf8w6BUMOSi6tDUC
         vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065030; x=1757669830;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9NnNfOCAMTA83aYrtuoiXCktxRcKZ08QSFQdBsWLtc=;
        b=AB2PamoFcGLvTB9bIKjP63+lRojhe2RkFAE3d2m82iicsJXBhBbQ1CJmwYfJTCAeLw
         QSNP1pFuIcrVDF7qRqnsoi9ORl/hJu5T8MKusF6GIGnVyU+rxyb7VCHtjExpU+hX8hii
         4DZhTQ6iXsAnBIEjIql07py4opopQxLE2t+o2uwpVLpun+198ALf8KBAI/3B/0D4v4Hi
         IPy1WN/ONZR6LOvHhS4vJPSHuoqD+Og8nmD3hmqDfz80kAdzMtiL9fv7wcShpZos4Q5C
         Lx4AeEv2JMRTh64hUwNGuPf4OwkKFKI3sM9f/suNXXxJNg8aOq/GHCAjLrN4mTDZOYhJ
         UVYA==
X-Forwarded-Encrypted: i=1; AJvYcCUj+DDVYWtysvmKD2ULfPzsuRWRo9P3rzDitquYXDHFIhCsd/5NBQ8ZmRzWMg0GUjddgQPG47xg4admZoEZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0lpODZIsoYJC7PZ4lt1c0ynBOnDyWdeDlOMLbINIV/+L9WpV
	JGuFo9XFLZrrdaHaiVlWBdxf0TG0BLT5PM01UkoECaMsw68xHwrIYVLh2VvxWKMyx28=
X-Gm-Gg: ASbGncvkLL9Zx2visRcRiVB8mSj3YDdutEJY7Wi79pRGfHqtgbCvNvRq+J/BllIkwRq
	XJmYMQvqhDMWD09UIcit/4hzwxbHpDV69CsKOuWL+Ga/wm4glGBxkkJQObTtgvbdFScmbm0ZHbs
	GBmFeLwvfS3XQ5+DghR/Labae1vo5MJj7EaUzG3ekqVUMHWhxVjMTCISHokOhkuOUOossWTabeS
	ZdW35s84FkcISoqL5USP17+5GdO1kCItfudAksn2faT90RgTfO/hSNBdr2chOfBTUQM6G2EdLi0
	epghUiIepNREVGzhGNDtn3b1irJjDb+ldjxJm80/Z/nW8YFEP45x+oxILpuNiHLY0apPdV9UMhT
	nC0hPXsWWaP4k/ZI0WJ3W/8zqYxULvBNE5CFEumS2yY4tqHi5MptmJcEv2+v+mdKKGxk4+wDerb
	Cv5IXemYOTC5KtRb1lUn0vCCzCGBNTKOZWOsL/vA+n
X-Google-Smtp-Source: AGHT+IFxXBCnigd6h1KizUdRn6cZoOPa+Q7FC3pfXM5C1+LnIdkZX5aLZZHVlU7YnErzTOtvjkV/nw==
X-Received: by 2002:a17:907:3f95:b0:afe:677e:a61d with SMTP id a640c23a62f3a-b01d8a32731mr2039911966b.6.1757065029590;
        Fri, 05 Sep 2025 02:37:09 -0700 (PDT)
Received: from [172.18.170.139] (ip-185-104-138-158.ptr.icomera.net. [185.104.138.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416842ffasm1361597866b.38.2025.09.05.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:37:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/2] Add support for remoteprocs on Milos SoC
Date: Fri, 05 Sep 2025 11:37:03 +0200
Message-Id: <20250905-sm7635-remoteprocs-v4-0-9e24febcb246@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+vumgC/23QzW7DIAwH8FeJOI/JfJOe9h5TD5CYhUNCBixqV
 fXdR1NNm6Yc/7b8s+wbKZgjFnLqbiTjFktMSwvypSPD5JYPpHFsmXDgCjQHWmajhaIZ51RxzWk
 olMl+dFqCld6SNrhmDPGyo+/nlqdYasrXfcfGHtUfTh1xG6NAjYBRe8UMQ3wLLuZ1Sgu+DmkmD
 3LjfxlzyPDGQHCK2WB90OMRI34ZA/0hIxoz9FJ47I1mFv4z9+fFGT+/2vfq82ziXUHa+nOsp27
 BS6X7kh5Um7h/A0Dd3Yx3AQAA
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757065028; l=1311;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RTPsdkCFfnLmyInrG49mTTXU5L76Gna1kznw6oY/wDk=;
 b=2yh8gNt59VqOsDTFoF5XoFdBlo+xAos8OTUTbeSkPePQUK+SR7VQkDK0odO+wpes3HyfCzQM9
 om3op9hlSZlAS2fzK5kVhnWC787LXOMOojHKVlyX8JOhHuqc/ghOgDp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- Rebase on linux-next to fix conflicts
- Link to v3: https://lore.kernel.org/r/20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com

Changes in v3:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Replace additions to two different bindings by one new binding yaml
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com

Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      remoteproc: qcom: pas: Add Milos remoteproc support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  24 +++
 2 files changed, 225 insertions(+)
---
base-commit: 87a9e300217e33b2388b9c1ffe99ec454eb6e983
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


