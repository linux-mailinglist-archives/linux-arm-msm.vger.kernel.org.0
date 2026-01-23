Return-Path: <linux-arm-msm+bounces-90359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFElC1aGc2krxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:31:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178C77189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 15:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7119C30312EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4350132ABFE;
	Fri, 23 Jan 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVpfOEP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A8329C7D;
	Fri, 23 Jan 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178576; cv=none; b=ULLCZ2F4wRDhqBZhXn9PLwkBMFj8tZ1khRGpjL7TNFkL+Sf+GR9wtRkhUPdkjLqMOZ0C9EYOW+FKPDH5LrvKq6Q9uh+Xunx5+Hc8obKZ3RRB3v9U5cJQgdd84aU+pj0Er1pD++UwxhFzqcfZbsasl6aHmtJ4XRcZ23ATbjJzDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178576; c=relaxed/simple;
	bh=P+ugFIld2IJpYkF/9G+VgUVT0rklbLE22NNvUqHjN0Y=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DY87SgtBjCHZyRJ2i0ZtV68zwCRo5fcEaVvYvJ1zZXsO47t/OjtENEA8mjlM6PpOtfWZ6cVFxPXpHlHMSyj/GLkH+YivGFlCCG0owSmgm1wGcScBJITMzFE5SMyi74EGLkALRt427vacHLy4bHjSJI8t5ilN6VZncdI6mpO04eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVpfOEP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C43C19422;
	Fri, 23 Jan 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178575;
	bh=P+ugFIld2IJpYkF/9G+VgUVT0rklbLE22NNvUqHjN0Y=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=RVpfOEP/nmE2CUPbgdPdFnK3zNx2VJUyKnXm8zFhZVH9sxdRlsVtTzGnD6qqmD53B
	 CT4Esmr2uNhFU42SLK79RY8ZqGdx2CSdQ2DKyQyWTkwflKmPXL3Jfxa9qWrkxX8ykV
	 T/CVgNo/wL4qv5Gn1xssP0eE6Ea2mFSVZrvZP88RO3h4QR5xsCIkbRRusSdoXH55wx
	 6OncInwJx3K0YJV6DUlBnxkExepZytRONX/P3x8lKsMDUWMi+LzzWpTt7vTKwrFQb5
	 GjpxjpaolmC4IIR22oluqKEvFVsBWFngKepZ6HqIerYDFiXuHCV9Nus4OEYHU/hnPh
	 UmWTMJ3r3sqQQ==
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Jan 2026 08:29:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
References: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
Message-Id: <176917840185.2044151.8624555547965761091.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: talos: add ETR device
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90359-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 8178C77189
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 15:10:46 +0800, Jie Gan wrote:
> Add the TMC ETR device to store collected trace data in DDR memory.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml






