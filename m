Return-Path: <linux-arm-msm+bounces-54791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8DA94265
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96CBB8A5F49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607361B85F8;
	Sat, 19 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="dsNP6RHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5478F40;
	Sat, 19 Apr 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053260; cv=none; b=Yt1lsfDG5mfAjLkJPZS9TrlBIrjoaGdWQazwgKYUKcsjemeyNN+ynnBWLj46CTVTMxp9tRiLhRMe5o+OazNMsv0WS649JW6BJH+P++0FK2g+y6cpjkSfgUxEMNvstnBQ1ymHTtaxcfO4OXRHG97f30WCK/BPhpBrxGDU36j3Qvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053260; c=relaxed/simple;
	bh=xNbkUqzCNfW/d74pg3Gfs3yC8dEh1hdbu1bcAwrNlko=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qq9aIwMJVefxgdEDnHm5NISq098eicQv1vQ6zr1/3sAE4YjzscpExZmDX0YKs3gzUaNe7ouxp+UV7956+fMGh7hq6H3sC/cVOUA/rx8cYgmJ5m17CF2keqMs40EfOENGEQxuMqCwAOf8/ukVYOnU1XNpbktyJoDIs77XGZkP2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=dsNP6RHq; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053249; bh=xNbkUqzCNfW/d74pg3Gfs3yC8dEh1hdbu1bcAwrNlko=;
	h=From:Subject:Date:To:Cc;
	b=dsNP6RHqQci/HiZRgwlNbRYTAZyKYCgcED9VVgFRmWyaMsdr7vCuk633RES6Nl9UQ
	 vQ09TdxBuc/4N1TGpWeWHdxscMcE3+lp/83sEQLC82Rj2t43tuw+Fpj9RGbNakvcr8
	 21v5Qht64QsR+NBKs4XepfgzwjkrEbgVeoQ3hhBs=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)
Date: Sat, 19 Apr 2025 11:00:37 +0200
Message-Id: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADVmA2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NL3ZL89MSiTN2k5NRkc0sLI0tjY3MloOKCotS0zAqwQdGxtbUAsI+
 iLlgAAAA=
X-Change-ID: 20250419-togari-bcec79829337
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=xNbkUqzCNfW/d74pg3Gfs3yC8dEh1hdbu1bcAwrNlko=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2Y3mYRrMX6JOWLNz3akM5JWWFhc37/MGmpnt
 NBlBlzorraJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANmNwAKCRBy2EO4nU3X
 VmFSD/9yi6VyIGE1e5Uc+5/9FdTinE1TJqsvhvwZCYRTwK6D3n5CMP5BLYC2ZZYZteNTLrRvFhR
 Sa+/I1RVEMntL/ys1M+KlyDZDDxAW9Wb98jjz916G2G95ETzpdzAmgM59STck4VcE9NMEMAYz2r
 B7XC2/8KUjCLW60AAkO+ycJ5vX11+lEwrfcoIvZJjuTldIFn/TSvPFjaSEgr+I0CtTomkHsLt97
 NFL3larfw8kfJ+rgmWVCqew5hfSeX95kOYHeW3vSXh6KRSYHHqe/22HjuwWXkMAQEHVnrOkjkZC
 +qczX60jF1/cxQLfmg+OfwCG0HIVcqq60uMqIWitIOlK+iC6HrCNCHTOhj2uuCSgZ8QUQ9B1LA6
 Ks2O0o7dbLaaJWHeiJJPUuRlSRkRYwcS0a/VKGGpxKLCMNoF+iPk0H7XwAPAf1z6g5KykqyY4nc
 mjgT/z1Z/+ruUifCi+hxzFfe5hwPfWSIMfC9eg/a3DriS2pabic0xY3SgK0v+TtnfYoJ9MGcwoK
 d5JIGUQmRnqPGZkaXWM5uibQz0LGGIfqlGtqOuodVr7VYcuTeOAPFE68zRPgkRbgcVQincFzwSA
 rt9Mrcbsl1Xihr6RXW4GAy/Jcp7Jn9KYnaWDA73ckH/diZvxdTUqG9koKrBLe7XLDKcBhYz/LfT
 JFz+9t7TaqcZ6Kg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Do some tweaks to the common file for the devices in the 'rhine' family
of Sony devices, and add a dts for togari.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Kevin Widjaja (4):
      ARM: dts: qcom: sony-xperia-rhine: Enable USB charging
      ARM: dts: qcom: sony-xperia-rhine: Move camera buttons to amami & honami
      dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
      ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)

 Documentation/devicetree/bindings/arm/qcom.yaml         |  1 +
 arch/arm/boot/dts/qcom/Makefile                         |  1 +
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts   | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts  | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts  | 16 ++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 17 ++---------------
 6 files changed, 52 insertions(+), 15 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250419-togari-bcec79829337

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


