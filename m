Return-Path: <linux-arm-msm+bounces-98484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPzoKkWvumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9C2BC760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9300630603C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2083DF009;
	Wed, 18 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUj7osd1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A9387350;
	Wed, 18 Mar 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841857; cv=none; b=LTpoTbfYEUrjOssJ4lrKCJC1ovBOUliiP82B47W368Fjloi00mIXN8nBR4fUowINSWUD2DfPLKrbWMsshyZUxN2gkZQn6PHLzRuE7f0SKRDXYl949VeRnEvC9h15V4YzR4F9/CS7q5CHQdjNWeiJ31pJ+NQwOloC6AbDQBy2GVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841857; c=relaxed/simple;
	bh=cs52o/O8WcFE3AOYEIveKxBUaq7AsyLloZG0NZz4IhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNt73pws5jNAIlmM7sj4ylXI+M9syy0zdn+mauyJ5OmIxJO/9ReyjBZRHSmgPhjU4eo89q0fdf3HgBK7l8kP6S7nTWTr+igVjmCNlMhMU8UYOZBdAlJeY05cIMxLcBuoFtEUnDS6HdVX2fJXlK/ndh5cxLU31GXY4zFRXpNYihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUj7osd1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F9AC2BCB0;
	Wed, 18 Mar 2026 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841857;
	bh=cs52o/O8WcFE3AOYEIveKxBUaq7AsyLloZG0NZz4IhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kUj7osd118Zb6X4f+fS6aENmp6U+D9IyOzIFRZLlpFFzpY5bQbl7ttFF6ODMRAjf3
	 NYs65RWmLOaNAPYOLcJIecHxohwXWx6e8CrKREW3jn+nqmOaPuXdS8MqYegm3r5UdJ
	 NyLF6yvEQUosB+08YFCeProdk0EdPBwbv0zm/E1JtbNWo8+kD2vLQMTT5jdYxsV8Bv
	 VPI+6PL/B2tZHyBq135akpcdBUhI3ie0QATcYqmypXT7sRmDUV35sfnkZVoNflu1Yx
	 LOz2Rgv88UREPxAq6L+ZbvcTsYTXIjKecSpEZhoTCoCyJ6BEa1EzTtHScXEyoqDCmc
	 HCEiAbHY1Y52g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes
Date: Wed, 18 Mar 2026 08:50:15 -0500
Message-ID: <177384182891.14526.251081724267564917.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98484-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2B9C2BC760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 10 Feb 2026 12:33:21 +0530, Manivannan Sadhasivam wrote:
> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
> '#cooling-cells' property. This will allow the OS to mitigate the CPU
> power dissipation with the help of SCMI DVFS.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes
      commit: 408b79c097d054fac70d041bad117e1a14fb0213

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

