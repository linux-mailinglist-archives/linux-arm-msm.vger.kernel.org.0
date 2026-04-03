Return-Path: <linux-arm-msm+bounces-101604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fCV0EYNUz2lGvQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 07:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E454391302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 07:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1649303AF2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 05:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CC435AC07;
	Fri,  3 Apr 2026 05:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="gein4Ype"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005AF3590C3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195098; cv=none; b=uK5Azev5dOGdsrXgGTO3yhIsZEMuquPcAwg4zRWwd3P/hYo0VX4RjpqJLuS6OHuE2m0+YeFDy5TfepX8HFpb6D3bgN2PSftClp9Lbu2EhoZox50IFZMp99A8PIQNmWS0fg4Vr/xDd3Gf67YDGvpnUCdJNWFJ9P3tOPepYmIYA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195098; c=relaxed/simple;
	bh=N7hywudL6zjyva2RxgQstzjNTfqkYhq3ISbleHrUEPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJ428ebuQ9+BAVV/yyGKKEC2jgHo0UIBS6OEepryUGOyCeBefLuYwZGnVG7UuWCzbXfgbfdx6yw8gdMymalNihy6ybtAFIp+WloBvfnGBs9S/RWc14cHdG3fvZxJ+QbfoCbCx0LvZNCUadk5/JPQeaXxb8XKkFWEHg0ytx9fQ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=gein4Ype; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1775195085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=66pwrA9dgDiSw/0z2fygVNRM9nXU/lnoGe5zoMWNmhI=;
	b=gein4Ypet+e9rxovtLCkCmLjh273jvNRLRlTH+ah51fsBKezeA5gqH0gu9kT2tyTA5ALLC
	DuFwS0sN1vfY31OyllxHiCAqiZBmAcU1P0I1YctJdkclFfO2hfeRC1H997LozvL2t190nB
	m+FJTHbuVJlXFB9Wh3Xup0WUTwB9NUa6JxSRDNnriJrZcVFB8snJXKnZXfv1qDU/JUr1NG
	MeVu0OBZ2VphFdAOZF5p7fFGjl2pqcn6gSufwnKYbGnJrEg9X3kldzQdj5iAvrNkrVL2gw
	wQKYgWTal1IBxGkSTJ4i97RbINbjvboGwFhJweZ/iACZ99B3/ja7m0KWhDbKkQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
Date: Fri,  3 Apr 2026 02:33:08 -0300
Message-ID: <20260403054417.167917-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7E454391302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Motorola Edge 30 (motorola,dubai) is a smartphone based on the
SM7325 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v2: Pull Acked-by
v1: https://lore.kernel.org/all/20260329103055.96649-1-val@packett.cool/
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..58f1621bb855 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1038,6 +1038,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,dubai
               - nothing,spacewar
           - const: qcom,sm7325
 
-- 
2.53.0


