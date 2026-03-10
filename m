Return-Path: <linux-arm-msm+bounces-96456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNuOLe6Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:50:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681D2446B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DD10304F012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856AD3B8932;
	Tue, 10 Mar 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBvG2gIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BAE3AA1AE;
	Tue, 10 Mar 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110895; cv=none; b=N4fTB8j12+qFZUzX+CwVKqVoBHz0Ds/SlEag1AVHLFkMsMLQvtN48oLELs5RfYg1VxRdCQ0FiHSiSEScROpNHY/9HMMAqLFMfuUQMqcL/ISXLQJOUb/o3uSxFRZOgiaMQajRbC/fW++DsZPvcNiPHG67vEO4Y96Jovti1rUfpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110895; c=relaxed/simple;
	bh=0FVemvKQmGMFfZw1zqBTnC3FxWrRcH0A88mjG6eNbqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+DVL4RTDk37F8KpjWeJU9+He2evbuzv1f1Pv2pyCFJOtI8ODnLNj3mnWBfIajut26a+HUlICa6wj8Ju5qGmbGczXcIzJkz5wmIY/K5Uic/B+A77zUqPpL/YLCrwMyVuiz0rgo+Tlem7+eOqoNcAPnljkbkwF8SShaqYbtRZ9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBvG2gIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8413EC19423;
	Tue, 10 Mar 2026 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110895;
	bh=0FVemvKQmGMFfZw1zqBTnC3FxWrRcH0A88mjG6eNbqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBvG2gIaV2Ndu/gto39MoVkywOARi+7/VhGlGGMbu0Jqm8FqiAwP4uhaF2hAZwSdh
	 OFm9qc/i7xHPt4RNyLzpW0H6RNydtYKcJCrqwU1QJHOFIMuKnNzX+OXD8Pou760U4S
	 UYKmawjvPFO6qrda6dndZKqZIx87VCR2qSJo0cet1LcNhIYz83pJEzVB+TQ0RyKzvg
	 PbC7DA/IksvU4OcDfpC23QpxTB5QwIJG41ROzxlPBnyrsZn0jVOQZJNF19X5XdovIU
	 T0B/pC7qcb+eRWh3L2DCvFFs/OX7+ji5rN+TCxSZdyx9SrIEiB5mzcZLnEe5z3MLLl
	 sQENSgky3fxIg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
Date: Mon,  9 Mar 2026 21:45:45 -0500
Message-ID: <177311073314.23763.3809522497061776066.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
References: <20260127062425.1084673-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6681D2446B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 22:24:25 -0800, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the hamoa-evk
> in the Qualcomm DTS Makefile.
> 
> The new hamoa-iot-evk-el2.dtb is generated by combining the base
> hamoa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
      commit: 49ad4ca38c38b7d317cccf0e7f9f18e77b67b20d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

