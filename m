Return-Path: <linux-arm-msm+bounces-108310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLUvFNHWC2omPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:19:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E02576C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8566430785F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E0B2877F4;
	Tue, 19 May 2026 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCcMtxd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AB223DD4;
	Tue, 19 May 2026 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160617; cv=none; b=nNu9LL8oImmDnHt7Owc0ScAZVURxRwnJtFJqWVnoYkIdrDY9Hr3tafSjLgKnvFohjiWVTXF0u+fgooI7R5UlfS8GuWpwAov1u5nzKGfgm30eXBv+jYAF3OLm1xNfrxmU8pxUpzSyKR1EE19+UxA7Bu8NS8T1Z1zrIyc07JMJ+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160617; c=relaxed/simple;
	bh=9+xHSqLcLWFgjrwNdcrRZH6X3Q5EB2KTi8jmHfIp2Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUFko6g5wF0DxrOg5N0xDMIw1acD5s0aN83D6b9bbe3WYy7DrRPQVr2N7xtaoIfqGhQJmT7VCQf0n15cw80LlEuDY5M6c4+mEl7su4e0RPMUqhf5WONBFpfeC3pXtTBQk+1vn6eLMvg0z4rdbrK5dvVP7BCzXbj342VENcB9r/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCcMtxd0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C64C2BCC7;
	Tue, 19 May 2026 03:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160615;
	bh=9+xHSqLcLWFgjrwNdcrRZH6X3Q5EB2KTi8jmHfIp2Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dCcMtxd09zThJvqJK8SGfzgLfcMKsaJSaTBNlYGdhwCDcvO5s8usnIambaYQVF+1N
	 eiRUrVrqG8VcRTM2all9WdnzLp2n/FPE1vjSVdiFWoXv7zNQBbMkj5YPBIhqRixKcZ
	 qRw2w2E8qhHTZt558TjKkrpng1QF1NeEUSbVNXcq5IRstN/6pA7+KnAC2YQWhpXr0x
	 Ggp/XYVAEi5o14gXtEn358Q1420aNbc4cY5c0+MQb9BQahHrMAq2Lo8tDE/fynF8z8
	 Kv176DRE+39I7RURr92NfkxlU4Zi9PtUZsRwI/uGwuC8S9uCgzZlwkAv1YDwF3x29n
	 1q23j+RkW7sjg==
From: Bjorn Andersson <andersson@kernel.org>
To: soc@lists.linux.dev,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	konradybcio@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	wenst@chromium.org,
	arnd@arndb.de,
	mani@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable PCI M.2 power sequencing driver
Date: Mon, 18 May 2026 22:16:46 -0500
Message-ID: <177916060483.2063946.17986212754040076604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108310-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A4E02576C80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 14 May 2026 12:20:17 +0530, Manivannan Sadhasivam wrote:
> POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
> connectors and is required on wide variety of ARM64 platforms such as
> Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable PCI M.2 power sequencing driver
      commit: b73953af9bbd5c721c9d92b805a8aea8b0db74b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

