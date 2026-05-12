Return-Path: <linux-arm-msm+bounces-107206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VW4XJfOPA2ru7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:39:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF452969F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8705330B3813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A445E3DD508;
	Tue, 12 May 2026 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRPxVOMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C13DCDBD;
	Tue, 12 May 2026 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617441; cv=none; b=mdqYRGk89GsDGsWZZoF2xAAyzhwWKThW3EUTyShe/UBGnxFNhn8jsS5uijnao+rmh+iwwMiihRfHYwtPBXlzc5yRYHjm7D8pN4s0TKiqHm2WTC220tH2EnTQOtSU0COFWU+IVOn16IRVCswVBIsCtuqNFeYUcJTq39FU96sMUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617441; c=relaxed/simple;
	bh=9Ii9sbQJvSRKxKcfvMpMTW8K0R8jL/WTBTOfCpq/tiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHazswLx3efnuBodx9Uxqv79fzKgIefnziVW5geoZX+MBzIZXDvXeHqCwv6KDymNWOE5FddeP78+MI0c3HnoQWYvmsRHRrayi7WY+LMhfBeGIVO56Tv7jya255NtacyJDZkTE9knWDvWn65A7vlbJL2OaPAI8oUxJY0y6ruyIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRPxVOMQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A936C2BCB0;
	Tue, 12 May 2026 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617441;
	bh=9Ii9sbQJvSRKxKcfvMpMTW8K0R8jL/WTBTOfCpq/tiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRPxVOMQNHbyNNKfnXq0q1rAnrZfYdnkkFkaaiqJn4KxL6Q6LSgD/Iqh5ff1o9TOr
	 kDX3sJM1RKgE5cjMKV/mQCevdEEwhtwflaPCcPgItDFF4r3oz9xYpvSjd4rK4Sz5q/
	 n9PlxiMQCPHK/52n8zCGY2kZ9FzVvtglgh/v4fEnboLca5UjNy2J6kWgseqWthWk9p
	 eG6462lcp0cGhTleZG5Gpg/peaz2JUKSdMlr7M87fWmNU+7vqa2SpZFYsigaz613GE
	 6ao7PXJwGWCWNDCwo+L2bEWbXlJNzuFGSIbRsGT2NgFXwJPA353MVFm+vNB5WPC1vH
	 WvBnCxf3HaGgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/2] clk: qcom: Add clock controller device nodes and enable clocks for Glymur
Date: Tue, 12 May 2026 15:23:13 -0500
Message-ID: <177861739389.1242344.3863881466380645444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
References: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3FF452969F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107206-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 10 Apr 2026 09:19:03 +0530, Taniya Das wrote:
> Add the Video clock controller and GPU/GX clock controllers for Glymur.
> Enable the clock controllers for Glymur CRD boards.
> 
> Changes in v3:
> - Update the GPUCC node with the required power-domain and the
>   require-opps [Akhil].
> - Add RB-by tag [Dmitry] for defconfig.
> - Link to v2: https://lore.kernel.org/r/20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: Add support for MM clock controllers for Glymur
      commit: 675fec65df73b525c12cb7a1c1ef54fcc3296d7c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

