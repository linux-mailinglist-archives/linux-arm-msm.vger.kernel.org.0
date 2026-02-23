Return-Path: <linux-arm-msm+bounces-93806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPmOJXO1nGnsJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:15:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF917CC87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E8053021404
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6163382DE;
	Mon, 23 Feb 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joKpFrct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E1192B7D;
	Mon, 23 Feb 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877745; cv=none; b=gGqwOUGw0aSgVqiw1CukMtv45Gzlu/oyB6BajjQ9wUS9G9xDJIGBxDGpjL4dPD8gIcW1tYvW6++GLsggLcN8cFqzX2ST7+t7O/5wl0V3D5jLpo6ERinQBliPrLvC2JPmU95785BoRaUyVBPbg/RcvcNW9+sxCbZHjnkZiv33FP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877745; c=relaxed/simple;
	bh=ELIr6Zmt9FXKq9k1HBfEFiwvKX00xWRCvbMHIbxdpZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GK5cSLkZlv/LMFQqpsh8YfyMt6fRG5RBCE0E82IdJvi47bifI/cykTpUAdhnUvTN+SUXE9O7GP3hvQ+2dtAH+yLmSbSsePx1hSW7gW5rlEW+/jDMrFzDwuWitSucckdCv5Qdbb00PMcien6w003TqgJUPKXT7lKvzpMeZ4snE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joKpFrct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D48C116C6;
	Mon, 23 Feb 2026 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771877745;
	bh=ELIr6Zmt9FXKq9k1HBfEFiwvKX00xWRCvbMHIbxdpZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=joKpFrcteC61FvfDUwrp6F1mWUZdW03T8d2csQf28NTkDMSOmU5Awqk9PvC0Sf1iz
	 48TzRtLTPRW8CL1cHHB5lc8he7GY3/Id4dSDOzKLpyGiKxRMD9bU4ZBqckzmGZ51jQ
	 93jFUvjP2DUMErFT6luVCh0Jnm/vXF68ETCzY3ruVr4JyXqRDcdL07LjwbPWiPfDAc
	 r+g5ENdr4skJWyqwuYzJFLERJYliAAO/6x8SAZDsNdpnW9Ri7eW5vCTKHyhdfoBTeH
	 utyt0EN26TiXiC8JFaIHIu6WRLhi+yZM4nmv63ee7FUwJU1aCFrEROgsOywE4w9u8A
	 qAZHbvlOq4gZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/9] MDM9607/MSM8917/MSM8937/MSM8940 MSS
Date: Mon, 23 Feb 2026 14:15:39 -0600
Message-ID: <177187773678.170549.7053551984198700522.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93806-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DBF917CC87
X-Rspamd-Action: no action


On Wed, 07 Jan 2026 12:34:00 +0100, Barnabás Czémán wrote:
> This patch series add support for MDM9607/MSM8917/MSM8937/MSM8940 mss.
> 
> 

Applied, thanks!

[1/9] remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup
      commit: f56052f4d87cee246e6dadacac771097343f3eba
[2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MDM9607
      commit: 1edab01aed302577ebcd88a40675d4c94b11fd91
[3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
      commit: 4fe236a1d0243451e942c197cfd917a3b6e5b82c
[4/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8917
      commit: b83f08e0d228b6b57590d00d719f2b481ed08d93
[5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
      commit: be086d05aa032b50d606c38603c59485cee25137
[6/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8937
      commit: aebef677bb6d2b421076a868d3d0f021afbe1170
[7/9] remoteproc: qcom_q6v5_mss: Add MSM8937
      commit: 2c4f52dd8baf62f80987c28040c411500a077066
[8/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8940
      commit: 3c8c90f050e984c21c3b0cc05d8a1843b83b1a64
[9/9] remoteproc: qcom_q6v5_mss: Add MSM8940
      commit: 68b518773213e6c54542171cc12cc821460615e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

