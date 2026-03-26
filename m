Return-Path: <linux-arm-msm+bounces-100014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPZCLHymxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:22:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6EC32EBE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17EF53073193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2248139FCC6;
	Thu, 26 Mar 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC6rpezc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84B39F165;
	Thu, 26 Mar 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495190; cv=none; b=M2IuAEB/7G8/eJw8aK0Qge+wfr7VRJtAC6BLtuZLQNEmDZFja9oKkJlHVGTOWAuxlp8nLdgVF9WUKl/H8Z9+uPaiLdKYSOvkVHLzmEeKpf4cnvohQgGIutfaCVHSELSijLDZhbyPJPdxFd96XTNNcxhLIXK+XbhNTBjVYRk3StY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495190; c=relaxed/simple;
	bh=/M7mOqCX1K7TXaJhj2uzZY1b/rLm7BLy/+oKGNGIdhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltlgX4d3mfGi1KNk669dWn2ONIERoVmSP7v/emGlr8HzU4leJj1MV56dv1eLnV7ziH71jl7ql0hPI/k30WqQDC/ypT20pP+kEzdi5zmHOB6jRQYgTjYka8RKa7BM8rqXUZkDxKnxG0+R/LQDhdu5ta6BAvnypI7YldYg57Rk8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC6rpezc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444A2C2BCB1;
	Thu, 26 Mar 2026 03:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495189;
	bh=/M7mOqCX1K7TXaJhj2uzZY1b/rLm7BLy/+oKGNGIdhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dC6rpezcgvWFoKd97ZwiNGADaynI7+0s4k94u2Of0/e+y50zdUAQbeO9wsKaxl0jt
	 mEmr202OmhgHy6F9fCl7yxflo5ZgkRYbEVm1e0J5956zgkdLVMlpxuNekrACeHZ5dA
	 qdo7e14MFmNV6zawlNfAF1wwOhGcP4drjWAfq9LPP2cPt/roCUgP1G/Nt0S0yHmObs
	 Qz0lJvUECPTeSa2mfmhsUnbh/HeNNfaXUhDGvCmrbUmky84aU2yZshirN52GzmXa3A
	 SQGqeAFKHPOhcN/bDIC7p0IAbkstvyF1x8jDy66VuaUs4C2j/bWoy8PCQ7nVuv1ynH
	 kjm0YZFYCwV3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans: Correct QUP interrupt numbers
Date: Wed, 25 Mar 2026 22:19:29 -0500
Message-ID: <177449516592.60308.9671178778300798173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
References: <20260325-lemans-irq-num-v1-1-a470d544966a@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100014-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C6EC32EBE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 18:30:37 +0530, Viken Dadhaniya wrote:
> Fix GIC_SPI interrupt numbers for QUPv3 SE6 nodes on Lemans SoC.
> Using incorrect interrupt lines can prevent IRQs from triggering
> and break I2C, SPI, and UART operation.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans: Correct QUP interrupt numbers
      commit: a8c84db62c97dad3625c08d7aef4311a71fb0d27

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

