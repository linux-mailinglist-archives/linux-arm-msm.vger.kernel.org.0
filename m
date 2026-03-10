Return-Path: <linux-arm-msm+bounces-96437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCRcOZ6Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45466244664
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C0D315ADB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7298E3AA1AE;
	Tue, 10 Mar 2026 02:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/Eu6bQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95A1A3154;
	Tue, 10 Mar 2026 02:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110785; cv=none; b=t83EjGpJEMHxl0LZmB5BgYnJVfnMqeA7I3Z2ZB9oXDXLJRaWO0pOasLCFKLrjbnZeWC16Yz2Uv63+impGKMFOOej9cl5FaEX6GO/ob5Ukte/QbcE4d1s9QWfX0IC/0tk4yepmS+cNaeCvDrxcBPcnALZ7qzgaNCaourju6ln10Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110785; c=relaxed/simple;
	bh=D0EmkBoD+bK9k+uYtlB+NdvhobTsapBK58CaX1er584=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbtvz3M0aAqLybOjEnJYch4sViWED48RzVH0yq85DR+r2RJWiyw2yGv9JqYiubXCF3cJtLyBy7M0c8uTmItkiv4T5ld1ejA6hjuDMxvEevEgZVNid9X0zSsDhRXIpaDkkwZsqFlHCmX4D3BjyBjXoHbTuSsQlCKyRDOy+tR14Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/Eu6bQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58394C4CEF7;
	Tue, 10 Mar 2026 02:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110784;
	bh=D0EmkBoD+bK9k+uYtlB+NdvhobTsapBK58CaX1er584=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L/Eu6bQugcCAe6f2r8U2u1paStbBQVu1p3dlOGpCSjhkEKp14yLOaxm1OpFQaG6fB
	 /FOubUmFBRQ5W3u9B5v/DBOj+mugxLDH0S82s+efTZU9AyAAohnDDq+XYlLtAT7aPj
	 6HbgI5tudPYSEwIT+yt27MWPSPbpXFH+3zjdh9HTNAwybOKzDipKPROLADy//t3Lk5
	 rFmEvECZb/6EEYJpnl7So0jassR7GRi1kKy0/BJQVWdDLC2Jbz7Qa+/mT9JXM/Oi/F
	 ASIXkIqW2hMk3/DkZPT6nHGDVJ5dXBc5X5huqBnYuX0gXzIllL3IqDIXSnBywXBcuc
	 vIp3mHQi0LDmQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: correct RBR opp entry
Date: Mon,  9 Mar 2026 21:45:26 -0500
Message-ID: <177311073325.23763.6264247424821561908.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304-msm-fix-rbr-v1-1-b9eba986eaef@oss.qualcomm.com>
References: <20260304-msm-fix-rbr-v1-1-b9eba986eaef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 45466244664
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96437-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 04 Mar 2026 05:29:47 +0200, Dmitry Baryshkov wrote:
> DisplayPort Reduced Bit Rate uses link rate of 1.62 Gbps, the main link
> clock should be 162 MHz. Having the incorrect frequency (160 MHz) in the
> OPP table will result in selecting wrong link frequency. Correct the
> entry in the OPP table.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: correct RBR opp entry
      commit: a5c21b9bd5f531e50141b0484faabb707b92f1e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

