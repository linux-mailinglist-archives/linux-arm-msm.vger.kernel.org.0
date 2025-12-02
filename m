Return-Path: <linux-arm-msm+bounces-84093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00952C9BD00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792DD3A801F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BC623C4F3;
	Tue,  2 Dec 2025 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="IMzeUtJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2E221F00;
	Tue,  2 Dec 2025 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686336; cv=none; b=fgkYuu3lo9KaT9jCuiWtu0yu2ErZWyJV5WVSESo14Hd6bUcRflZ2y/5DWBLcYmVWKZ5kqWTSwlNLhWtGmbHjVL4rNioXj+oGe28ARXmsHPHeVCbWNN/UKKRiiWPn+0dITnt3G31yHD8XTj1Clhx8TvPSyi/hLbZxlN4TmPWvpiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686336; c=relaxed/simple;
	bh=VDJNQ/PygA1fYTlM9PPSx8w5wfD3rcWEPjPgjEWrqjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTTk6lS2+R+vk4aIvvlFLJg6RmQfNuTSQIRBU5ZTJZCxxISDj+hfpvJkNodmsVcvdnv/+B25B2DCTLi0mK//xrYJOS3hhf3Wa8rCaBFSU3dAjOnq7zUzapowp0UCXN83XHoQhtFPy4mL7iyhxqhkY/cmagqpo4hCz/jI6n4jwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=IMzeUtJT; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 00C612FC0064;
	Tue,  2 Dec 2025 15:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764686332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlEH1Lc66wIsIJBSQm2Tti635d+5hf8I00Ad8+xCEbc=;
	b=IMzeUtJTFpqp+8aLK/0gB5u7H5NqjwgFBHehH8xLgpOUhjO01WiGoosv4f4bPt0tU8TLcG
	EIFxrKylipSG6NlAz6xx2Aa3PWrqFU8Niu98Fs7frqOl6qcqu/zEl4muvaW0jBvHZGAPIQ
	IOeMTHC3S+DEAqIJus/6qrO/iszKFso=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de,
	Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add Medion device
Date: Tue,  2 Dec 2025 15:37:52 +0100
Message-ID: <20251202143757.69817-3-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202143757.69817-1-ggo@tuxedocomputers.com>
References: <20251202143757.69817-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new binding for the Medion SPRCHRGD 14 S1 notebook with
X1E78100 SoC.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..95cc1d00fb1f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,12 @@ properties:
           - const: qcom,x1e78100
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - medion,sprchrgd14s1
+          - const: qcom,x1e78100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15
-- 
2.43.0


