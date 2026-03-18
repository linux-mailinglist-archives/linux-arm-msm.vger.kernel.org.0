Return-Path: <linux-arm-msm+bounces-98477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BHgCxWuumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:52:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E12BC60E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 085933019458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B7E3DBD5D;
	Wed, 18 Mar 2026 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDQuXKCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7D3DBD50;
	Wed, 18 Mar 2026 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841847; cv=none; b=n2fT/n1UhLMuA0EMEmJY1rqab7CSrYv6ECzH4ksZFJPNdnFhd1UDyTop0xWMGOug5SFUAIXQ8xMJGwHjqTZ0LZd3nQbeeK7qayy3Yeo2eSSwbPk/s9NiHodd2r7+Tx6MCy7kiAUo8aKC857LU7kML8penIrn81+A67RTlvyaF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841847; c=relaxed/simple;
	bh=+o77dB57Gh2wQFuLAV/gFN3oyQbeC/WiSuxWpRSQCLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afWuioFUerjIrqWsH7GvsyaRHdtkoDo5bHiyTu9ETUKCbq6IvjYiylhjHHDOfO0m+nU1mSvS4OwCnPI8dzNIUDGGV6wpaT81Sp3VYIpj3H4iiQEwC/WpcUV/0IGX+OS1TxfSod4rlWQm+ruX6QqIj5+4nLV+UzhlRKzET2VL0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDQuXKCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CCEC19424;
	Wed, 18 Mar 2026 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841847;
	bh=+o77dB57Gh2wQFuLAV/gFN3oyQbeC/WiSuxWpRSQCLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDQuXKCO62njjgltiN11asAPzzXeiTqFUT0sa8HNHprwIX4oiOn8//fg+1Zn+rCL5
	 /RAc3MSlgeqGjC616rYeM6JdffAR0nZZgLYtGZDHr3L/ZX0R2VltkFe9gZB51mtnFV
	 41Ff87wihQP24VmL/BJKy7qpXKRqr3GOCMKsY0w1C4RQ5vqfWAnNmN+TkO5dbc5MIU
	 IsW4kjdAQsSyE94OFdCFlAH9twWld7z7J6wVOtmLURAoIIfspJxKu/TzOPvy7OMslh
	 8xO1WT1AFp5ZP4Zrx92qIpNlzcaGdfvg+KUDY/VxVlyUqBRBDoiZ0xDfaVnEWS4zhm
	 s3K19v8oTW4xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SoC IDs for the IPQ5210 family
Date: Wed, 18 Mar 2026 08:50:08 -0500
Message-ID: <177384182867.14526.6866306623616746710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
References: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-98477-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D01E12BC60E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 21:32:55 +0530, Kathiravan Thirumoorthy wrote:
> SoCs based on IPQ5210 is shipped under 2 different marketing names such
> as Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being
> is F8 parts has the Passive Optical Network(PON) interface which acts as
> the backhaul where as in N8 parts it is ethernet backhaul.
> 
> Add the SoC IDs for the same.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210 family
      commit: 508e58ac65eec4e272f89e39d9b64588f7fe21cc
[2/2] soc: qcom: socinfo: add SoC ID for IPQ5210 family
      commit: 5a679430cf1def009b5c5cb821cad46be450c149

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

