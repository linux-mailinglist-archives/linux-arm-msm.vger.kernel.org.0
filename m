Return-Path: <linux-arm-msm+bounces-100852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDWoMJOiymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:19:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6C35EA54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B46E330288B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E05F3C9438;
	Mon, 30 Mar 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1mFAXml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4DB37756C;
	Mon, 30 Mar 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886535; cv=none; b=Tl/H6H7m0m/HkVXN3UGRrYk84nVA2wUENk9/YqRIYUnCot8opbOaGirWF3kkBmbFyxN21i8PpJmRMEap6u44FsDYoZG68QgPdCfF+UcqgqPzCZY50pM7/S562FCnK1er7OssZ336d5HpIp9LkU96caLYBZ6RkVLBF4NFj4ycvrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886535; c=relaxed/simple;
	bh=Sue1rI3ml/BRST8ghtDWbb/NTjmMdZ9F13V19Zmd8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ov92+8tlqGUaBWLXD7Cbhtaym/AL4wYn1MWdP8sH4rPpM3HcGjnyN7Uh8Opuh9Rem5ffedPYyjbZFhkezXNRj2TUvU6GsiKFvD7ebYW/peFgOuacByX9WnDVDM/fa4Dvjvx54sLzvOVQpfqDWz7K/ULj7mpEetOCkWlyREzWVCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1mFAXml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04980C2BCB3;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886535;
	bh=Sue1rI3ml/BRST8ghtDWbb/NTjmMdZ9F13V19Zmd8K8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1mFAXmlrTj5X3Ryo2+lxAtDFJvW9bJhnMh6hsbrxUj7Uv5CN3J4ur3XzX7C/98xi
	 jyIIJxKQf3XWRypoSdQl4bjDeFfdNgO01PkSfCBY8Hq8mU5fYaStdIhjgY89VIq7Mp
	 DJoXCe8OR1yv9/Wap1YVhg/BnUMxgFriYM1h7ba8DAb5Ntl7stpVhFVMrbIoUHv1+L
	 GQwY177GMqug+HSEKuEsPQpH2DImGIo8PfYCyYs3uC+SeaI0IpWxt4OMsLGTPxKFGK
	 XF3t1aAi0S5kq8l3gIGARr94aM/CjQSA1g2RDBSqoqAwGePG3e6HZHl4wy0pXq9bEf
	 fEPTb7ofyX2IA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Mon, 30 Mar 2026 11:01:33 -0500
Message-ID: <177488647782.633011.6708959644343560158.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100852-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDF6C35EA54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 05 Mar 2026 16:10:07 +0530, Taniya Das wrote:
> Support the graphics clock controller for SM8750 for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> The Graphics GX clock controller is a reuse of the Kaanapali SW driver.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
      commit: 4aeadf8a18dbbe4fbe2f8e6f03f48f3492c8d1d1
[2/3] clk: qcom: Add a driver for SM8750 GPU clocks
      commit: 5af11acae6608d3b1175aea86bac06f267c6db14

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

