Return-Path: <linux-arm-msm+bounces-98578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMFxBPNju2lujQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7180F2C51E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F7333156414
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4693876D0;
	Thu, 19 Mar 2026 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXnlC15h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053363876B7;
	Thu, 19 Mar 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888420; cv=none; b=Y9qFyCI1ccHFBA/6sJImGNueXtrF4+w6KpIoJC7QkpR98RxHsA62/iXWLaZ4YbRHlnqdeflKEJz0N1ZDVLvXDerEb5HkBjEeBl7gWVO5yAIPEr2znI+ZGjapcxOchAQKLRk68wq6rgcDwgLmAFDDEomKYTEj8DBisvwckTYDl8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888420; c=relaxed/simple;
	bh=gmEPv0utDUmJSUDXDIXWHhdEDCsXCGAUeB7w35xvpPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=up+DvcVObCY2XjmC6Gm5HyMH+S3W/jAzenzFUrigmyLcZXTo3NFFUrnE5ev8ahpzCNqZfPtIbxazX4zhZxsYP4CQ4d0ly9VVlQBGAQR8SaW7zvEsqAe6J94Q+knCpab1NZZnknT8ejJMQnGwDRNECBWlh/WWASASCEQVLMWzJ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXnlC15h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEBC2BCAF;
	Thu, 19 Mar 2026 02:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888419;
	bh=gmEPv0utDUmJSUDXDIXWHhdEDCsXCGAUeB7w35xvpPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXnlC15hS5QgV4/09joToVrdvAup9x/hd8UzgL8THLLzKrxcMqpyQzQwiNWv1D/jS
	 s0p8EYQejffe3CKvZffpPWRQgg4tt0dphVSKgaJHbX9yDWitLbYF6K26vI3ZDfuTDR
	 XZImlXeV2cPne49RKFzWPaF77XiNRVTSLI9LhZnuAGsKI9AH8+louAwWlChRmhmz/d
	 UxW9FEiRe8O23tgVsv82bVxlJ4pN0YU9DfsXV+7tIYcEpqWwla8sCeFDPIgXf1XiTk
	 4ys5EVuxKZDi4UeJulTqump5BNWWcpyrXTIah/l+BGaScm4Q3dNtOVTyOy2bS43Xps
	 S0rh6EnrLJbbw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	pankaj.patil@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v2 0/3] Mahua SoC and CRD DT support
Date: Wed, 18 Mar 2026 21:46:43 -0500
Message-ID: <177388840379.11529.11270416560154129687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98578-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7180F2C51E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 05:40:57 -0700, Gopikrishna Garmidi wrote:
> The series introduces the DTS bits required for Mahua SoC (A derivative
> of the Glymur SoC) and the CRD based on it.
> 
> Some of the notable differences are the absent CPU cluster, interconnect,
> TLMM, thermal zones and adjusted PCIe west clocks. Everything else should
> work as-is.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Mahua SoC and board
      commit: b4f1283ff3b1eb69de4b6ad549b14ceae437dd3d
[2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
      commit: 768919deb0d02ffc26dabbcccc1ad0917a9d101d
[3/3] arm64: dts: qcom: Add Mahua SoC and CRD
      commit: 598eedb21dddbeb32e9ee0362e9bbed6fe151cd0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

