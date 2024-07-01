Return-Path: <linux-arm-msm+bounces-24799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D960291DEA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 14:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176241C2012B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 12:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280EF1552E1;
	Mon,  1 Jul 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V2oJLv+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5915250C;
	Mon,  1 Jul 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719835234; cv=none; b=Z1TrXVd7uzoPl+mrFOsfYcoeM8XYOODAZOOMkbTOSMKRGZvw7laqxuBofIERiCWNlv5Q5m0bystdaH3QL7LBMAT6rys1KxFLvYQ6ipRyETlIcNr3eDufVFhXzb7fORuGU4Y6t4LV09/Xy/eFi3qwVU/NHKz5UykQMLYvV0EjbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719835234; c=relaxed/simple;
	bh=/J7nwEG7G/iCQI62554P/C54kT++JSK1r3VsB7f4G4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkthG1yFdyGgc4YOk+2KbubsF2A2H7M4XwqYnrlu9YgaBYxZ17ti+Jbh8UfZgxbazIXasqE7Ml/H5aRC/r5gYSgflrquc1ZDEcazPCJdWtg4tYPlwsKB1qpZrLB8rYIl5Jhrs9x08zPGHHBgG7v2ViW3sNyEAoV4EKeNDyqjEDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V2oJLv+R; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 581EE4000D;
	Mon,  1 Jul 2024 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUg8N+QU6C4GigySnqcnzizYYV5dL0IssWNRBHYgoR4=;
	b=V2oJLv+RDDvqgpngTUbpB2a6TqKGtzwCGJpaaFDMDfbnge8RAnjGpH1m6ap5z8NWqCS/2W
	IU1MMAw6Ba7+TjoXnpgHbxTuLB+qiRTqiBNp9PuiDOWqb54yDwkx7F09HhUpzb56wjVEpR
	DJoReRIf7jPqHRlz2OmTy0RCnV9vK+Ltu/Gjf/ucBlgZluSn6e/8uiJJS4aQED73zbbqoA
	eKFmmHfh2k22S6YbUD6c7jqPUeF1tX9Ppota+lkv6pAQnO/NXbKHjSV5qatTzmjjW3Cywb
	THYi+GtG0MNmJ1dAwk4+zBwSbpTKOnMfcDKNHWc+Qb1DcoXhMPjFYlKZSCj8cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: qcom,nandc: Define properties at top-level
Date: Mon,  1 Jul 2024 14:00:22 +0200
Message-Id: <20240701120022.525479-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625215605.192260-1-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'31489eac5e4835d4521be320c8e5f4517780572b'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Tue, 2024-06-25 at 21:56:05 UTC, "Rob Herring (Arm)" wrote:
> Convention is DT schemas should define all properties at the top-level
> and not inside of if/then schemas. That minimizes the if/then schemas
> and is more future proof.
> 
> There were 2 "if" schemas for "qcom,ipq806x-nand" and the
> "qcom,boot-partitions: true" unnecessary, so the conditional schemas
> can be simplified a bit.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

