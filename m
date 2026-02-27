Return-Path: <linux-arm-msm+bounces-94363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GQRaAogToWnKqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5961B25CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06A7530490B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91255335BB4;
	Fri, 27 Feb 2026 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAVFMzzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C93358DB;
	Fri, 27 Feb 2026 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772163970; cv=none; b=MeRPcaBuhNa3d71mp2CDZsfpcT1X6SRSQ50wYI4WAWEFvgZFsJnztmcPcNgl+lFP/Xe22paUDtMjopyAPLvz1bsMB1STOBzlyTq0pHzD9dGhEFrRvPcnUzEyTSrplcgmgcQ6MBLYoxy9/RDb0rejlP7zF+ul/Zp2uT6wX/47p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772163970; c=relaxed/simple;
	bh=X8t6UllxftdI/rphNuAuHAhGq5WsqinzlLh37FOkeVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fj59atX9xK/orPfG51LV94cLSnNZFLSWD+2tWB8UyHP1Mwbw64Cjs2hyeF6mpukZIrpVqTshJmtU0S3fizx6o9dFvURWWra/pMtmiHFCRy4Wm+eoGC2pbJ5WbnAcTAlBRFik0L6NItPTf3KLVzzXKoJwwo2hFx7iBesXoHOkJC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAVFMzzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6E4C19421;
	Fri, 27 Feb 2026 03:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772163970;
	bh=X8t6UllxftdI/rphNuAuHAhGq5WsqinzlLh37FOkeVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vAVFMzzNRT9tRLCxv+4p1z277pSfyU3sWdJH5gF6Zlmt6lqu5Nmf7O8onxiPZOYBy
	 4l97Wa7Zel2wZyFqfJ9ym7xxO0i+gKXxVfUQ/vw99Emg1jlVFker7/0F2RbWOzOqbI
	 3X7gTFUwHDO17TK2c+AQPLPgeIxLPqMm735l3yDf5oM7VdXLZVTTvKS51tHcd6gbNC
	 3Q7hmf8niAh4lVtKr3K+fhkWURvTyDc3BukBeOIlft7WMtiwIaetj61RY00PyK77bC
	 qd0h9Pl4CMC8bmW59dMt/p5NYD16C3oP1TMKrpYFimqCxNs8UJYTvhLozhqWyFf4PQ
	 Dm/wp6sxQi6aQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add AP8096SG variant of DB820c
Date: Thu, 26 Feb 2026 21:46:03 -0600
Message-ID: <177216396216.866892.15131835508786206531.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94363-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C5961B25CE
X-Rspamd-Action: no action


On Tue, 11 Nov 2025 18:02:50 +0200, Dmitry Baryshkov wrote:
> While debugging a crash in the DRM CI setup I noticed that the kernel
> warns about the unsupported hardware in CPU OPP tables. After a small
> research I found that board indeed uses APQ8096SG rather than APQ8096.
> Add DT file for these boards.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
      commit: 2d2b7e724e4ad69055553f3c48cd45fb644f3689
[2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
      commit: db24f1fa263fdb473a23af461f82b4bc97af28b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

