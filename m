Return-Path: <linux-arm-msm+bounces-99314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PIsAcNlwWkzSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:09:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B52F7A24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E6AB3170AED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAE63B38B5;
	Mon, 23 Mar 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF77bKym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996153B0AC3;
	Mon, 23 Mar 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276727; cv=none; b=cT+V3i3YLzI0GgupsWIXHBmDMM+Gcsedmz+osd8kNJLz9EnUZ8pdmNmX8VkclxU6wc1tQiT2Ox2tVWO1SSF4GfHoHur8wsSF/VW5t1m/200T6fmrFgtREZcHrGqNQ5Z7tNzlke3Cgn0hoDK8ag4uyAZ/IWyyD4uA0neRSM5O7Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276727; c=relaxed/simple;
	bh=JxaE39HjMIayZ/X1bMIZ/1rC/oYGDrYhGiAgLFqCCiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbES63ngXr+2I3HjMrfi5vUiBdo0t3TdtwADI+bAZvVe8N4pQ1k2IREPdAWi0zTX/LbKdKo0RgxO9fENtiwhqw6HFMSTEU7j3dh3bJh9Vbt7A9eyya8jg4XxoOLsAhkvy5kasffjyyYpv6sqy+cqO+SYtY/E8qGFJtZJiY/hzNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF77bKym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4089C2BCB4;
	Mon, 23 Mar 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276727;
	bh=JxaE39HjMIayZ/X1bMIZ/1rC/oYGDrYhGiAgLFqCCiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mF77bKymDbspYgN8/c/4wnJmzljsfMkFM8l3HXj6zPIAElLoIMqhDpZce5HAXGyiQ
	 hV3cZnt2MYdsY7eAqarYwan/z3F+y2PoEptMYb+7vw94errR9UIibpWJn8z17rL/oN
	 cCO2uizAnmAcNBEos7NYPUarP/Z5EkuBaXwf7FB8RNUPRqZ4aG1awjLT+5ad6WB9/J
	 1a7t7iD9Ceijg4REgv3+u/atJjYPd+35I2im2t4sXWfJDtcnhH/Clg9v09byq9ntOr
	 FRiA541FZ7hq/SeEfIrwEbeR1GJnFKn65F7sTSPS5xUhuSc+KJ+m/LbZuYAVqRYjqt
	 JkGhdazSAZFdA==
From: Bjorn Andersson <andersson@kernel.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	martin.petersen@oracle.com,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	manivannan.sadhasivam@oss.qualcomm.com,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	nitin.rawat@oss.qualcomm.com
Subject: Re: (subset) [PATCH V5 0/3] Add UFS support for x1e80100 SoC
Date: Mon, 23 Mar 2026 09:38:27 -0500
Message-ID: <177427670519.11515.12330098471987589032.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260211132926.3716716-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99314-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F4B52F7A24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Feb 2026 18:59:23 +0530, Pradeep P V K wrote:
> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
> enablement changes for Qualcomm x1e80100 SoC.
> 
> Changes in V5:
> - Rebased on linux-next (next-20260210) to resolve merge conflicts.
> - Add RB-by for UFSHC dt-binding [Krzysztof]
> - Add AB-by for UFSHC dt-binding [Mani]
> - Add RB-by for SoC dtsi [Konrad, Abel, Taniya, Mani]
> - Add RB-by for board dts [Konrad, Mani]
> - Link to V4:
>   https://lore.kernel.org/all/20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
      commit: 23c6e96c5b60c2725db955b7ba6bf80609a7256d
[3/3] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
      commit: 5b1a4acc08e57712e85f9c8927b96a2843645f08

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

