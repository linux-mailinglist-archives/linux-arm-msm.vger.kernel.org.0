Return-Path: <linux-arm-msm+bounces-106514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMKYBFv6/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:47:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABD4EEEA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1550230C3D6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9F3342173;
	Thu,  7 May 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSBBQvkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C52B33986D;
	Thu,  7 May 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186082; cv=none; b=UVlmPsSppgTLc6doQgZSGvqJgrUufpvzUfd4C1eiX1XcD/xSQ2JVFDIdXarfNWK6tVqA3PsGYaKc9Y76fiScGphJiFNtMvFy4arNdCQEMyC82WvxtWiyx0uYqShlXTwC4LmikMEx7TdhkTIrwIZ8ssfC4ln/mnKsTq4UeJ0UnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186082; c=relaxed/simple;
	bh=Q6Xv6s9UGQO6AaRS97xP2sD0WzJn4cf3Kcpobh903cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+QwS/9XHKWh9fA36IkOne/5jyOXHCW+DA2s8v+wxEfLOXASa9l5R1+UH0xL8DoUnUXx0BHfEqnPWsqN9neo6F/la0Oju34qFh66KDs7eh4oWVJJTuVLeUfQPq5EQdFOHk4f+fkuM5Wofp6gCUUI+rnF4K1v49USk0wYs2DFDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSBBQvkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB640C4AF15;
	Thu,  7 May 2026 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186081;
	bh=Q6Xv6s9UGQO6AaRS97xP2sD0WzJn4cf3Kcpobh903cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSBBQvkqgt2Sko1IRUklWRTj3icJJKVH+FFP+BUK9nLrB/a6gecItsP+9asg0np+d
	 rTrmc+2YOEhQB6uNAZ+0CxpuFsKL8DUSkxpIEuEjgLS0McaJKVbEMNQJ5XxAF92czy
	 DXHxphygQhcsrERXmkZkTlMA3cFASwpTtoh7y+sOMoDsb1QW98CUA2TKMlnIxsB4hu
	 lMxvbzH1kooVw67JyzmLSVPwx3PzdgU5T3sZNAGzgsQsGzR17BKniOzYOQeSQ34R/J
	 j5sy9KGMh1E436U5NL8vaIrl1bv2HSDVXOh+L/tzjLEJG6v9D55cMqfhRXAbnuWA8X
	 9K9b18PtoT+UA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa: Fix OPP tables for all DisplayPort controllers
Date: Thu,  7 May 2026 15:34:12 -0500
Message-ID: <177818606001.73000.15388180971655464091.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-hamoa-fix-dp3-opp-table-v3-1-a823776bd1b0@oss.qualcomm.com>
References: <20260323-hamoa-fix-dp3-opp-table-v3-1-a823776bd1b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7EABD4EEEA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106514-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 23 Mar 2026 12:01:12 +0200, Abel Vesa wrote:
> According to internal documentation, the corners specific for each rate
> from the DP link clock are:
>  - LOWSVS_D1 -> 19.2 MHz
>  - LOWSVS    -> 270 MHz
>  - SVS       -> 540 MHz (594 MHz in case of DP3)
>  - SVS_L1    -> 594 MHz
>  - NOM       -> 810 MHz
>  - NOM_L1    -> 810 MHz
>  - TURBO     -> 810 MHz
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Fix OPP tables for all DisplayPort controllers
      commit: c17e220946675232d383620ed9cff6685735ec48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

