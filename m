Return-Path: <linux-arm-msm+bounces-106522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCqoM9b6/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:49:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF84EEF0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C16C31106B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A1C4949FC;
	Thu,  7 May 2026 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1WlmUxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C137998C;
	Thu,  7 May 2026 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186097; cv=none; b=K91OfpIfN5TQB+2gPeLJzlEEtp6B65ZpobLsYBIpdWIMYkLz0+HiQyR6c2pRQImtDqpSFTcHq+5DTf5W+8p899fuMg9MvEauo33SDEcr+w0VrwOfMOcLdpWx+H5HV/7UbyEH9fct3qDteDLW4IevBuVkrklfSzZHUSWqkr42QF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186097; c=relaxed/simple;
	bh=myGggE6B7dyGmTx1LO7UXm/yCcMu36wP6hxhWwG8CPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5eH9n5itnJNw1yBUg1OX7UmQu2gISAiVffkpS0dSlAK4/PSLNjkS4B/YU9bd8Mq8hHjGFvYtlnwq+M+LxJl5xlW2EJIXdSDx41YE0TF0kLuTJUUKkKXr8EHEsqnAQJxA8CP2qCMlOc0nPxI7XARM28QlssTmhOktxdoMZWIsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1WlmUxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7A7C2BCC7;
	Thu,  7 May 2026 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186097;
	bh=myGggE6B7dyGmTx1LO7UXm/yCcMu36wP6hxhWwG8CPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1WlmUxMxJWk9pfB546BQS3OvjLb9vowyJv1jY4iDnF88j8RwXX7wkWm14kiawKT2
	 icp8U1ntcUa+aFrAVdy0LzKfjWejt06zU0xMHSSk2QGFCAgwWQlbk7SoHDVFwgfP9D
	 5FtOq87D0SgYln0i3AMWr2Ln0B3pmk7uPm/3If7SGnaxxU7aoft7ifAyqQsReRBcf4
	 zAFH5o6mOB0tcvyKRg1RctVNVpKJnviAJ56N91iSGXB2odHvFDeiGt8EfNdDtYCwMY
	 wz6PeCs7j1pnQpXw/lYIUF54417cNeloaTe7ciQqLKhFqRR5R0nqVJBBKIm2M0S4Un
	 Iy+OrQNVcoXjw==
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 00/10] Fix up WCN6855 RFA power supply name
Date: Thu,  7 May 2026 15:34:20 -0500
Message-ID: <177818606014.73000.1819336856464002682.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
References: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46FF84EEF0B
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-106522-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,kernel.org,quicinc.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Wed, 25 Feb 2026 13:23:20 +0100, Konrad Dybcio wrote:
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") renamed the supply representing the
> VDD17_PMU_RFA leg to mention "1p8" instead.
> 
> While the supply's voltage is normally 1.8 V, the bindings should
> reflect the actual naming of the pin. Moreover, almost all DTs define
> the output as 1p7, so that ends up looking a little odd..
> 
> [...]

Applied, thanks!

[02/10] arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
        commit: 244e064bc8ce848d40fe13451b6096a66b2bbdb2
[03/10] arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
        commit: d28f68b052780b945c35996d02adf2426ed0bff7
[04/10] arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
        commit: fa99d3af7edb8acd735e861446477afd64007af7
[05/10] arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
        commit: de1a7dc3ccda556bef52185ae1d65ebb900b2925
[06/10] arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
        commit: a25cd984f4078cb772179787cf78790bbcc2c543
[07/10] arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
        commit: 557a49f764306ccf8155ca19970be78d90f8d3de
[08/10] arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
        commit: e5a38ea7633853433295106650d008c1428d4d0e
[09/10] arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
        commit: 8be58b9b8a10ac276d4058c66ebd6b2b9e5aa683
[10/10] arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid
        commit: d859095bcafc4c5e26c551350d2327aeb2e08e59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

