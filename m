Return-Path: <linux-arm-msm+bounces-98500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF4UE2SvumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 079542BC787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDA45306091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B68E3E95A9;
	Wed, 18 Mar 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtlMFYm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388213E95A7;
	Wed, 18 Mar 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841881; cv=none; b=IEsRofPFkg8g60SLPJ7JvGt0a/ZOr0GrUmbCVuNgsAeFXXLnkk1WvmzfozugAaCAGFkSI18tCemCQSeHZcRtOrCzvWy61Ghn8IUWuTDT6xlpyB/bguvo0ed2rEqQvr2lYwFpF32/NfnT44iF+NrmiH+zF/pgSacJL4AdMJbZKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841881; c=relaxed/simple;
	bh=Yz3eASArpzZTvFjiIrKdZzdU5pYbcdKGZI4x3+3vhX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BElraj1W4O1Wa9G4zxVl7/2LakmDe+l6yxOheycwsv+7K3W4mwhCe4HDHch2e6gHrYgWa4HuGQqb2J0lgND4rcCbhvkBYgJjUqfqyNDxq3iC5wPPD9oaz74jhU/TNDoUEzY2qI3cd1ePKMeUwBDXR+jJC5Qh/kj8X4O5zvAYOtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtlMFYm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375BCC19421;
	Wed, 18 Mar 2026 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841881;
	bh=Yz3eASArpzZTvFjiIrKdZzdU5pYbcdKGZI4x3+3vhX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtlMFYm4oDPI/9qdzyegr4PM4OfRzCofr7mGGGnSK5v9wgudhaLkDxcbD7SLKoqPZ
	 SM3iUAB2cKXtCGT6MguIi2oLd1zjO3xA3d75kDr0/pKJ+kx8MGGBrg0iENk2Be64hB
	 kIdGGlTK6MBUOigmH2rsRqmqh2R8jPcQJLzh+xI+tzgyNHO6eecvPV7qRMi4SlhsKT
	 5E9LUUZYTG4CW20rHX/MHXCXUj7awRcRijklfB2Lxp8t6kYvBO/Mu31FUITSBXKnwd
	 DyEBMZ6vQfCgHS/KbW6bAVmnufYa2d/kG3PIjwiIeLOlkL/e8oSf25JXMQ8nc3hfzj
	 tbDefY0LEe8pQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes
Date: Wed, 18 Mar 2026 08:50:31 -0500
Message-ID: <177384182896.14526.3852230362019935952.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212082558.2811953-1-xueyao.an@oss.qualcomm.com>
References: <20260212082558.2811953-1-xueyao.an@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98500-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 079542BC787
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Feb 2026 16:25:57 +0800, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes
      commit: 2f50108a6c04e0a68ee82a54f2d209d9c7551002

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

