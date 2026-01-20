Return-Path: <linux-arm-msm+bounces-89922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHLsL18TcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:44:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B94E090
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E136C9A235D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FDA41B358;
	Tue, 20 Jan 2026 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="G80ppljw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E2A41C2EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952622; cv=none; b=XLYybCk5OoYsc4J9TlkZubqX0D16sxaVhvvyBFOsgNVVvk92dX8zwmQWo34Kjz2diaozL57lV3J/5R6ky5ZTHHFOk5Lo+td1uskgl3NhWHYEncHY2u7O0WqNlD5XAhDjUMNG1IIyiV4CsmssGR0KgylbMn1MVxouu9fVw5Ic6yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952622; c=relaxed/simple;
	bh=OMnxSCOo+XhGkr9+hOhYsa5CIL79m9J5nln9wpamLdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvndvNJuXkWEnTdWEa3FZggtSEYqQ3IMKIf4qZSYGtTfRckqFrJLg6gM5ooip202btr+5+HaTZT2n+0xNxu4UaWQRcqrduVejLnYy9mShzckUdMZB2iZS5bdNbO0w1Q/WBi2x9044WpXY5znsmREte9R6UI0Ehuj7UmVPaDiVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=G80ppljw; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768952617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlM8GW6dNWlsV+KPsCx9fvHYgo0b9tuMTX8d9qhaIoo=;
	b=G80ppljwwQbwRrOvvdbX7s/l7F7uQZ1AvlOc8NOjnRE1novehs/j7vEaLkV2taS9myxUJt
	bwSohKdlSfMAX+fVmRE8iVEtiEj8knuPFeLewiuLku1m0rZZznENd1KLHcqONZXVEvBRYG
	SjBK5nSbqtPG/ScXlnfXluHxMiwAD3xruUAhKdylXKvciv2WE2wpSlBTV8ZBT7k2TUPkDh
	rBwSLP71rv1LlQoRyamxVLrQUbKc1pWdiDGLwr85287oAKl/FrA4Pn45hDI1H/EEdnr5ja
	VSRhApu0EuB3mZaTohRck93WUgeFENpXX48dOXdfRY0ubDfjkwYGzhORRhbVMw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: arm: qcom: Add ECS LIVA QC710
Date: Tue, 20 Jan 2026 20:30:08 -0300
Message-ID: <20260120234029.419825-6-val@packett.cool>
In-Reply-To: <20260120234029.419825-2-val@packett.cool>
References: <20260120234029.419825-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-89922-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_POLICY_ALLOW(0.00)[packett.cool,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,packett.cool:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: 652B94E090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the SC7180 (Snapdragon 7c) based ECS LIVA QC710 mini PC/devkit.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..54750b11895f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -385,6 +385,7 @@ properties:
       - items:
           - enum:
               - acer,aspire1
+              - ecs,liva-qc710
               - qcom,sc7180-idp
           - const: qcom,sc7180
 
-- 
2.51.2


