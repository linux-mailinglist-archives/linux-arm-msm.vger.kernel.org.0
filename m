Return-Path: <linux-arm-msm+bounces-77329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDDFBDD411
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FE23A630E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1026A3161A0;
	Wed, 15 Oct 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqNvFOfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA17315D4B;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515038; cv=none; b=N6eYT8vAJASufgmbcbQE6YfNZpFIIwJugLf+RW3D+ZPVfcLOnY4elWGg0B0jh0Y0dQHy8FZ6Em+WbVjLKjZxfDA4Ly/V6D7dF4PdK5wA5O5SOnF6uDvdHfnuQV5yDnQq/de+Gfg5SsSDRbQqjfP2rRsAY2XX6lJKUivGqmlwFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515038; c=relaxed/simple;
	bh=OZ4yVbhrzue3hPaULKUeiq6UlURwI2/N8ha5WjWFm7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnR4Tx2Iyfo/rqTBv8fihxsZcZtNHl2KtD3/K6tVZ/bg2T1eDxRHhQMGjuh69qyhjU5n3mQl2bc5FlwquGzT/l7zKQ/+RywIFmcmEvLqYhapPyJ7iqvxhRqDviUSl4cdUa5pIMijDEH0zDyRDg6mKp+ln5ZqYGrGP2OH9XIidO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqNvFOfE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F63FC4AF17;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515038;
	bh=OZ4yVbhrzue3hPaULKUeiq6UlURwI2/N8ha5WjWFm7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bqNvFOfEYgikhIbkQQAfDngetasFv03S84meoljbIvzuiZrLmN2AveH8nDgua5L35
	 h3CU97NARN+kafC57KRmRDJaUTX2njr8zvJpveSV2qxJt7t1FsyiJfHR0eJb4OdodX
	 7G07a4P9z0Gu65yxNzSEXl4SA9vtR4yrs8ivaCwhcJ5uBDzjt8RHNrAz9bYem/oxE+
	 3yV6ooQctTrhZ+/U8kSMqkAvtzetniEwQVWFdP7EZIKgsxEQmz50IJdGuJi7slcUmf
	 EW9jsN6YIxeEnv8dzyakKKCjm+5Vo8JbkHfFhk2Nu/dbHaTuukwNFCUprntM+nU4wU
	 9SQm+Ehp4cseQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66760CCD195;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Oct 2025 13:27:18 +0530
Subject: [PATCH v3 4/5] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-knp-audio-v2-v3-4-e0e3e4167d87@oss.qualcomm.com>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
In-Reply-To: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760515036; l=969;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=egvs9Cb3aIkw8DtcZE34LZxwWmk9TpONHHIdUNRu10k=;
 b=ZFOm64BEIzqrw8kfN+ozmCkogJq+U/wGtKWimJnh1kIoRsByVYRX3zaCXBlb22ZDaKIcFKNcg
 ImM07Xd1VFZAT6yfnu7oEXKq0yll/KscGJ7dWMgftSYTQufWiTkGxbV
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=I3mn8JNlYnnm7frqMGXms1Rm2H+0gpAfknMlnBYqCzw=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251014 with auth_id=541
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
SoundWire controller versions. This version falls back to
qcom,soundwire-v2.0.0 if not explicitly handled by the driver.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..1c4b0bdbb044 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
+              - qcom,soundwire-v2.2.0
           - const: qcom,soundwire-v2.0.0
 
   reg:

-- 
2.34.1



