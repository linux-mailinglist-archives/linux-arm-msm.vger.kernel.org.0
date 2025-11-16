Return-Path: <linux-arm-msm+bounces-81953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC3C60E1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 01:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A217C3B8D22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 00:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D3716F0FE;
	Sun, 16 Nov 2025 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AR3pjziA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403315665C
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763253821; cv=none; b=BqZWaFPonrvoxNZf7a2UeqQKZTVaB4FEKYYAJEIa+JK3oz47xhL8jxKb4fWQ8tW/CnPKnbOF/kQn5ldA0clmX7M0/vnxZFpD06BsEyMafg8RY2vEY0qEzgvhja/cOTvrOYMZGBWfAXl7sU2CsYKqfyd7Q/Uy1CqYl5eK4VeaQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763253821; c=relaxed/simple;
	bh=AJB3AUcBgC784obzu9tq5oFUm4havbhs2C7ZT+RX87o=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=YSYjuyvUATbyQ4yvu9m6Ht/4CjJrmfh+CvdoAcSig4w/rSlA25JUvvyL7az64xNuM6Vnk9goWbo4aE6gf58QRMYwEcNLrcT4Kw+/vA0o7vrKj6zSA6gNSaMk5SCALrb+W2wr/Xy4SKgkrNcFZQABEa8J0A7zv4f9QdHcrBEXCpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AR3pjziA; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1763253815; x=1763513015;
	bh=7W5DujvGb1YjsYt2yFT+cg9Ht0m8Sw7YirdwBOKx9qw=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AR3pjziA4tRuV0xDZ7TNx/YkCSAI8QEVCNMVid8ScfSjEATygC9fwxyCE3pj2m0IJ
	 c5OmUOYhRSJtIjqgGny29p6VD6lQxkum/HQV/6/ejC0TO+CGJxemS4r1WYFH2nnb/B
	 vxetQCLon6yS/AZGOKX2pK5Q4s8KUJfOA3cMFW7L7SYWb8H8XUQaOUHO5r/jAPXJWN
	 9SvPtCseUVDoJVzedzFMgxuy12hl7bI60gJ2qI0q+qO34wsAEEkkBoH3MvplM7zOvs
	 Qhy7EVPDFaAK5T/fkMQ/HSdR+Rb/EnORu0kRvnTudtr/ud/3e3PXQ2SJM/o4yuhUzK
	 QqUIc/nI9RwEA==
Date: Sun, 16 Nov 2025 00:43:31 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: philmb3487 <philmb3487@proton.me>
Subject: [PATCH] dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
Message-ID: <9nTdr-7UlyytB3d5Iz0IEGrAAzjPipf4NEiZvLMmpk9OmCmRuL346OxjZgpLkLdG7dFYE_rj-5aibg7bhYHrQmjwo1e096-2IGhfi1rKglE=@proton.me>
Feedback-ID: 109714282:user:proton
X-Pm-Message-ID: 37b87b348a5c21142e55e405679cdb8bfb064bac
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Author: Philippe Michaud-Boudreault <philmb3487@proton.me>
Date:   Sat Nov 15 19:41:12 2025 -0500

    dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family

    Add the SoC ID for the SM8635.

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/q=
com,ids.h
index cb8ce53146f0..b7c4cbb7a2db 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -277,6 +277,7 @@
 #define QCOM_ID_IPQ5302                        595
 #define QCOM_ID_QCS8550                        603
 #define QCOM_ID_QCM8550                        604
+#define QCOM_ID_SM8635                 614
 #define QCOM_ID_SM8750                 618
 #define QCOM_ID_IPQ5300                        624
 #define QCOM_ID_SM7635                 636



