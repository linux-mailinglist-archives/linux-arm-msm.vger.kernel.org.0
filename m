Return-Path: <linux-arm-msm+bounces-49026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A246A4088B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A647188FAF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652DC20B1E5;
	Sat, 22 Feb 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="tC1U3K+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F1E53365;
	Sat, 22 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229275; cv=none; b=uyMEyHJsdXX9MLlAh2lrJg5qE8s6Edl4ZtjChP1EA364l+EGDYDCyaLSi/TQ4aTJMkllE33VErxObh5PFtW4z0s6D8p/99K+aA1QOSW+0lqVy/+wEnq4Kpu3QllC4lP4iyY/+SFa2TLF9BhcpIxQQmG77wXEFZfCxUjqoLR9Rsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229275; c=relaxed/simple;
	bh=+SHI4/xYTay3osIZoggq3aQNWY2pBZiUAPIcUURKDqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d4eFhn81ISui7HHfXjRqfazizFXN3hC4993N2i8bdm/F5lSmQAb5t+ZiJi9fk0n5OumhT0B+t2tA9SfQ5FAw6gRdnKGw8ecjStE+uYGy/mQkBuh00pIsUZIoFtgraSeWPY8HAk6XHuyjYt8mz4vvfLzzyY8A2AfHw6TAM5YU6RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=tC1U3K+L; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740229264; bh=+SHI4/xYTay3osIZoggq3aQNWY2pBZiUAPIcUURKDqU=;
	h=From:Subject:Date:To:Cc;
	b=tC1U3K+Li8BYXErIug63yBkmJ7kM8vgSbH2qSgIE6IbPYJImsfzybY6srhFS3hN3V
	 I/JKV5r+JdGkmzxVegIhvZRpk9BBwGnbKjrICxGzh9iLME5rpdV7usS9a/yT1HvIYL
	 CkiMsAZz5KmaWqlVuuoSbsocpeYpa4TbQUcBCnZw=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/4] Some cleanups for Fairphone 3, set firmware-name,
 enable modem
Date: Sat, 22 Feb 2025 14:00:46 +0100
Message-Id: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7KuWcC/x3MMQqAMAxA0atIZgMaLYhXEYdWU82gLamoIN7d4
 viG/x9IrMIJ+uIB5VOShD2jLguYVrsvjDJnA1VkKiJCHxtU3sLBUcOU0Itul1VGZxvTmXbuyHn
 IeVT2cv/rYXzfD+lF1NJqAAAA
X-Change-ID: 20250222-fp3-remoteprocs-firmware-ba35854d82bf
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=+SHI4/xYTay3osIZoggq3aQNWY2pBZiUAPIcUURKDqU=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnucqIeAM2FXX4AVuW2XPPLZA1g2n903RUgZoc5
 HxAn+rOFDaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7nKiAAKCRBy2EO4nU3X
 VlaMEACjkyh3miHOvr7h6Zf6iWGd6P9EXL3bvvxGL+dAaKz9Cj+vCmu/f1GzmWf/yr++xXMYKiV
 d1Wms122LbAxv+TamoDBkZhIttUADazB11bRZkjvimN5iD6dE3r/6UxcBV3YAH9D5hmzfv/10kl
 yvx09sSKghfaPZ67QSKAdCPvzBO1hko5xsiG8aRVFiOSsLNyWamAucg/sO2E88py7WlkdennVjW
 VlgY5zTWIxqwHrBtmV1BArMA0bVj2lUzX5o5YjNuZoRoQrutdii5GyYD4OdlfQUyG/P0CBgjjLf
 PIqrSKpMf+M/U+ZDm29/ANzV59Bf+HDQUJH2L8JWOY667PlWFL6PLD/9YwDatLn6v1oRT5r39ok
 JAQefC09106C+q+RCXy80Kh2waAL6SAL9dH39QvnrTdnwx0KSWNf9EQusO6dHZlOVPgMbWrVTjZ
 /3ykLPAOTVHZxsuQoxsyCpL7/+uqeE0hO1EPax1k/mHbBgQbsl5tEt0EzUUMViqH0hMrOG1ymYL
 3vGzD8rq+vUvBkcppkwE4uhwq//60ic7QL1hrLfdAAxusrYqrzbjOygTzrP+2drntqQBt5mtQXd
 MhRoZc4/j163GyjJ3bukjZ9shDbWcCJZyBehIY+T9h3KIa8v0Q5VfbSKwh2hV97NXPqztIVdWEG
 PQ5+25DD4FgzHpQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

The main objective is setting firmware-name for the remoteprocs and
enabling the modem.

The first two patches are just some cleanups to align the dts style with
contemporary style.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (4):
      arm64: dts: qcom: sdm632-fairphone-fp3: Move status properties last
      arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines between regulator nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add firmware-name for adsp & wcnss
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem

 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 48 ++++++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)
---
base-commit: 245879bbd9af3559c3b0351ca0d93f324214c9d6
change-id: 20250222-fp3-remoteprocs-firmware-ba35854d82bf

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


