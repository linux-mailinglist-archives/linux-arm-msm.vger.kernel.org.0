Return-Path: <linux-arm-msm+bounces-103718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGsYEVL15Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:43:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ACD428F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43CAC305D156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2723914FD;
	Mon, 20 Apr 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="j+VPntb/";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yML6EmGr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7F388E7C;
	Mon, 20 Apr 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678152; cv=none; b=ToQ8iWV5loJ3kXhbrxMoWEE6/aYMqi7nsU+tkajeWs66xNkuYVWEY4L3eKRw0XN6U9l+wyJuK7HlXw1nuB416rrldDXWJmzA9HG2RHRRJN2nguQdeV0QIEuw9Q6IFlLaTYsdh2/t+64j6mLTBJn/2YULK+1D21ykwQTrMb4FteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678152; c=relaxed/simple;
	bh=7ggz8o1NyD5NbLeVTyxCalNMovmWXlJppVm7RC8CuTo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ShO57TUgimNEx3Tcwy4vQyJcFxq6QKenvJmnEH1gNC9cKSGpcVV9DAv76fu7bk/80zLMdWQ7HfY+H9wPdxt7t+g0r3X0UagiW2aK+r8mAMuKoNzmbd7rYZJ42fN2UFFj5XwChG83O0KuOm1ahvVzHIc19DWqdDUATayM1ynCKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=j+VPntb/; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yML6EmGr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776678137; bh=X30xwmXxKaGfGe6ofAEIINU
	ETrsIr1EVdLkXqIT5Ae4=; b=j+VPntb/txodUk1ILwSB3mo3RxYeBCxhTziljqYvLmC2ZG6oti
	pYnNIHLDFvgMHVFjCp/WPJAH6x0EjNkVKCDELhFwBM+7SN6+GNL6rs7g6qRgAiXLYm0D6wcynYF
	hHb4WVF23MHB8L0JLZoZlAhI3nbP0oSxV7YI2gurF8S+Q5udg7TokuidyhA5e9wD/YA2q5CnYs8
	KSGC01mL8f1q0zSXNug/DZkWUE5/EGHyBk4DKIFlqtbDzHFRb6iaHi4FklcMVx6+squflAVF/A9
	Y8bD+XpMPRukcHOPu+wMPcug6+gpRSnT0uCrP4dIyqVzQ9OpLbjZa6QGZY7uUef2o+g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776678137; bh=X30xwmXxKaGfGe6ofAEIINU
	ETrsIr1EVdLkXqIT5Ae4=; b=yML6EmGrZURCjaCLG92Mjr8GEA76uqRrVfLmGkQd4DzmfI1jX7
	iaDTyDPEOEkXXIPml6vkUQlFIU7UY4ieVVDA==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Mon, 20 Apr 2026 12:42:08 +0300
Message-Id: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPD05WkC/5WOQQ6CMBREr2K69ptSaImuvIdhUdoC30jB/ko0h
 Lvb4gncTPImk5lZGbmAjtjlsLLgFiScfAJxPDAzaN87QJuYCS4UrwoJTzONQHZUioOxNIPO0mm
 KYTZgI0GHb7Dc6FqVgldSs9Q1B5fsfefW/Jhe7d2ZmMtzYkCKU/jsR5Yi5/7dXArgwMu2qmUrz
 lJW11Gjf6BH35+m0LNm27YvyGCaA/EAAAA=
X-Change-ID: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776678136; l=1698;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=7ggz8o1NyD5NbLeVTyxCalNMovmWXlJppVm7RC8CuTo=;
 b=3vP+N7ypi8M/7HrxYU7ZgY7eBZUqQiaNzKAnDu8+eMjRHBiqjKj2PZ3FVgfakFIiPrr5OSIwi
 onbGbK9q1KgBsd1Gp8nRqPamJSBEJeukIr7MLuZXz/CqzpA2CSJ973H
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103718-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,msgid.link:url]
X-Rspamd-Queue-Id: E4ACD428F7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v2:
- Dropped patch that changed adsp_mem to reusable
- Added vmids to fastrpc subnode of adsp (Ekansh Gupta)
- Link to v1: https://patch.msgid.link/20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Nickolay Goppen (3):
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 19 +++++++++++--------
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 2 files changed, 29 insertions(+), 26 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>


