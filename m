Return-Path: <linux-arm-msm+bounces-84591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32DCAAB68
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 18:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45CFE30517DB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 17:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0B62222D2;
	Sat,  6 Dec 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj4UyjLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AFF502BE;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043146; cv=none; b=CryX6faKnNXGoO3L5HD2kmpKVUKa/vJ0XjB/3IXq58C2qMysT7WBF35AXm2lYNbdPmAlyktwDM4SFnAvbSkRyiyu9gileXnUU6ncAEDiTTYD+q9xbs6wErr9OB+A26/79FChAjfe/vcYnaM3rWYbT6vyOh0pw1Tip9Y+kd6JiIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043146; c=relaxed/simple;
	bh=CtDjl9Ll7B/5YngbUltP1j/RQ93MbGy3LfdGklrzF4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RvMXrA8hMyhga6A7fjul4n+bfm15Q2R/WwoykaXFUHIozzXW2M0OHgtCXiijltpjE+ZEvjrkEPLEzjMALeDu/T1jbrAgo0uce8AX2x3j5/+85Wy74l/BX4eH/x1sqVNK1bDntKx9mfNCvxZ4gp7sLy0fZ9z4tnFfez5ncUJf2Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj4UyjLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C836C4CEF5;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765043145;
	bh=CtDjl9Ll7B/5YngbUltP1j/RQ93MbGy3LfdGklrzF4M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hj4UyjLB0pi7Vpi0Ra9d02BGQRajL09/VhMBKx5eqGwuSmAIQVPTW0sefIJOmnaUo
	 jjZNOwDzK3Vt8UkQt49rlADXExrHQTa4/MV7qKurxihjJ7QYyWyIZ8TLjwpqyb9q1u
	 dGAh/kJq+xerKrHBP1jX+MmTURQjFE5iw/Mzhq/+asDiQMB93mupNxksvxSvHbYLTp
	 +tnsJILhdXm8b6cu3YInsGEfW1uw1FwJ4cv0HrR6kkSn7pQuhUJYglceZK8TMOe0wN
	 uMlXKWy30OeWYgMt3aKKRmYEXH4C7W6S2hdzTI9Dp1RrntjqSBo7tmIRoAQ7hO64E5
	 MG8naotj1rvhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEC5D3B7DB;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Introduce framebuffer for Oneplus 6 and 6T
Date: Sat, 06 Dec 2025 18:45:41 +0100
Message-Id: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVrNGkC/x3MwQpAQBCA4VfRnE2x7QivIgfLLFMs7URK3t3m+
 B3+/wHlKKzQZg9EvkRlDwllnsG4DGFmlCkZTGGoNEWFOm21JdwDH+up6B0SW2poJO8qC6k7Inu
 5/2fXv+8HiEz182MAAAA=
X-Change-ID: 20251206-sdm845-oneplus-fb-5e4595c5fb64
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=762; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CtDjl9Ll7B/5YngbUltP1j/RQ93MbGy3LfdGklrzF4M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNGvI+l27B99XrsDAgoE3ZXy+foHpa+RsziqyT
 fR2yS/4SuqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTRryAAKCRBgAj/E00kg
 chMsD/9fiQz06dEn+/w6tyigbkoqUEFZjH3HXlNh4KllDeRf5wRzyeQk7xDysVmNVu6NTolWB6M
 PeVAgCDL+8OdfZCC71K6ih85EAyUQgcEs3j6vobYT5FHHMJPGgOWL3KlspJRBtx6nu3oa8VCw3N
 TlgLpwEPTwNs/Cx2zFYKZbBeh++XjpNdzP9BnyqZe+CX7w3jz4mB44XocwXPGI04Mm/c+otGcP9
 b0uPtLbVgiuJLpwrknRKUj6PipRfKsXBCOtCxSef+5rnwdR7WU8diB4Q+WohME4+ETb6qgyeVMA
 7WSetWoitL3c6ASiBy/APkXpoPbvCJ5INpCxPueC3WcrPs4n6RIJyoS6cGQP1q4/MqNIUUB1hQO
 3JuwtlcI9p8RauU5VIkTnMfElu+/HMQZWVj1NTqp1/oDdy2fvEXV+7o75DxBvFrE0189u0Hb0Es
 UeOfWrvvUAGDXey88f58CvQIVSrLYneQ4sP+uTL1nzSbWvypj41frme1+AKaOw5olAAuv3/AMlR
 CMHg7AFYp1YSg2pDd/ZMbQrTx2xeH6y+U2rxcSjxAH+RFYx5IWZ6VYfYnXhO7iqPfoor10csVwj
 gzLDHorwK4uZy1jsNNA1Ge852HkGteKvqMzVNmjNfmuu0aahlRiekEbo3YyaUcLHyVSMCQzIR9A
 IEi9IIg0/CtSHMg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Unfinished bits of framebuffer support was laying long enough in
downstream forks, let's push it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      arm64: qcom: sdm845-oneplus-enchilada: Sort nodes alphabetically

Sam Day (1):
      arm64: dts: qcom: sdm845-oneplus: Add framebuffer

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  8 ++++++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    |  4 ++++
 3 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: a5841f413dd0173a0648408827719fab7838a1c2
change-id: 20251206-sdm845-oneplus-fb-5e4595c5fb64

Best regards,
-- 
David Heidelberg <david@ixit.cz>



