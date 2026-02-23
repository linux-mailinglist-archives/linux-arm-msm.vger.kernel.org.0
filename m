Return-Path: <linux-arm-msm+bounces-93801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBTKLGKxnGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:58:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739C17C9C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1517E308B983
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3B7376477;
	Mon, 23 Feb 2026 19:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5GkR8R1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDA374756;
	Mon, 23 Feb 2026 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876597; cv=none; b=WQANZ+DCn/woTm13Kx49BV1NVu0eIGi8XbSoNTZnDsJRaDswtSEZSahW75J6TCVIVyTzrhDo1cjuoKN8Ru+Iq/joUZz4zGbOw86uKLovR0RC9w6ObavhtOjX4eojZNWc47GrNbUyl0w2FbbRcwfzP/vVcRCm+AyGfTOIoCHpBHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876597; c=relaxed/simple;
	bh=0KW04flCQhi8mgqfcPUeExYhwZ77lQM0tSAWR4N9wzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwYa16ETq2S25gFQJ6ULZ23srfpGSSkRJuw855mO0j+y+FeUhlAEMLUc4sdL04AKrMlwWLnQVAvzSK8HwBKBP7ewG+pd0bVEVkvmBhCzhKD7mNxC95TI7Wy/tJ3mmMX1MMjGH4xLL2IrLO/Kvtm4/I45VfCOl/jVaAo3scmD7Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5GkR8R1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46C3C2BC87;
	Mon, 23 Feb 2026 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876595;
	bh=0KW04flCQhi8mgqfcPUeExYhwZ77lQM0tSAWR4N9wzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L5GkR8R1sLUNGnBvrbtSKLuxZsTuaty/hCVQmCp4dJb6gaO//khC9p+Ri0k+KTF9R
	 roWxddwl1Rh8ZXqf7C9cvSeUzppjYn0sUZ37uXrcYgjON+pQKZ7g5y01vrT76Of3/g
	 4tFd5udentp+OqSeHE+7Sfeb2r+o5In3cjI1mcetSWeq+NR2GUX0VMeJ47MJoIT5zg
	 M5kpkDbxK7WzcOIntgnY4M+0CNz7zzP5ziMSxseaj8Ht+cFGIp13o/n3VjGG7Gx9UA
	 9C4fyi0CUECwnTmwEBDZyZkDlkUUOndBZYVezHhKXdr7VpKYVeaOK7DKapGKyV0l66
	 YRfu7ugYcKEMg==
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
Date: Mon, 23 Feb 2026 13:56:13 -0600
Message-ID: <177187657319.166046.11732196709072261913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93801-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3739C17C9C4
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 12:45:48 +0530, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> The Graphics GX clock controller is a reuse of the Kaanapali SW driver.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: document the Glymur GPU Clock Controller
      commit: 4aff230cf28b5f68a62fcd79de341c58245ea8e2
[2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
      commit: 67e645285dd06944d0ef7ceb07de5c4053829075

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

