Return-Path: <linux-arm-msm+bounces-98591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECZsMGZuu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:32:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 297782C5860
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91D22318545A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670CD2D0C9C;
	Thu, 19 Mar 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+0iNnye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43007175A7F;
	Thu, 19 Mar 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891094; cv=none; b=J749NnIGii+28DrFayY/5K/CH3gcQ45qKTzyM+J0WH3ZrSrbmqNBzrj97fJtePAUqzgTRVzb+VfFPDhd73A9LiTUFStrGxFIfyjom5wGNOVuM3ypCSshW02pChGzVTaX/JpqGsNDKJ3AqOY5eMD9NVGxA02ymmdQmlx54eUdxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891094; c=relaxed/simple;
	bh=mm9vP7QkjCXsz6bj8MQGhTjeko5+jBWE6IFP6BTRzC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjM1U6qoKhIKsJKuTNQEimPas35kveY+UsPSGIoekPlEWAbbanG2zAEmbIpvA04zaKzjxjUDX400TtZBmI7wrt8nt1l3vyc/h0arsvkiXx3QtQ7v1yC/oiHUuJMTCIkr+FtGdLXL+A6lUtLhAvtg6V3HUp1AJzDPhObZZeIrVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+0iNnye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27419C2BCAF;
	Thu, 19 Mar 2026 03:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891094;
	bh=mm9vP7QkjCXsz6bj8MQGhTjeko5+jBWE6IFP6BTRzC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+0iNnye+dGmppJ0LimSTQbTI71VCTd7R4FjOiafMtQ5QMx491VSZezB23cpDwrfd
	 CxK/pMWB5U2gZiq3c4/t7pxM7hOro6AAL8XhGsg60S7OVpiim/0lNil4bYaDhg3GTf
	 bf0l3dvHqSVgcaz/TGegKX6sgX03m9MNdgbfQFZ1HGz7QL4j+5dmeTA2kQGAaPGUCX
	 GCWHEdqInj0XRFgFUsoelK/+9l4VKaG8YhvAJHsgZ0ReWZK0QHWjkzRpiv8THoiZtI
	 TdyaipSz32HQskPxUiwL3EcxoOSisGbzcRiMg1djukK0Qc+wT3jQWRdJgqR6CJyg3J
	 RoaoUxrlypo3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] Fix up GIC_ITS ranges in QCOM DTs
Date: Wed, 18 Mar 2026 22:31:14 -0500
Message-ID: <177389107874.16612.16678316496938305269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
References: <20260317-topic-its_range_fixup-v1-0-49be8076adb1@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98591-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 297782C5860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 17 Mar 2026 15:41:13 +0100, Konrad Dybcio wrote:
> Platforms with GIC-700 have additional registers (such as GITS_SGIR).
> Checked against the docs and compile-tested only.
> 
> 

Applied, thanks!

[1/6] arm64: dts: qcom: kaanapali: Fix GIC_ITS range length
      commit: b361ec125d847652a2b11b93f1ac083d76d1747e
[2/6] arm64: dts: qcom: milos: Fix GIC_ITS range length
      commit: fd05433d7c043252a4789979d8823351c4b6f56e
[3/6] arm64: dts: qcom: sm8450: Fix GIC_ITS range length
      commit: 5d3b10acd2eb541625bf04d72b0cf7738002e493
[4/6] arm64: dts: qcom: sm8550: Fix GIC_ITS range length
      commit: bd56d3eba56247d9a6d9677811184b82dba433f6
[5/6] arm64: dts: qcom: sm8650: Fix GIC_ITS range length
      commit: 68e63451115af1777aa20551f7dc7c307680e012
[6/6] arm64: dts: qcom: sm8750: Fix GIC_ITS range length
      commit: 3d3da7a4a8c9b5209163888a20746e0193303dfd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

