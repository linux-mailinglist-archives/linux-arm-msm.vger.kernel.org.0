Return-Path: <linux-arm-msm+bounces-99305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCj2JIpnwWliSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:17:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F742F7D90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9463D30B54BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3C83ACEED;
	Mon, 23 Mar 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwod0C/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B4396D3D;
	Mon, 23 Mar 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276714; cv=none; b=W5Ke6711CcA7PZhB2x5QeaUSEHZwnHxGmZbpXGExFxrFOfFp2VtjVdOpZlp9Mp5VkCU68txWcmxDVgwfjTav22CWzciaYKlJp8g95XvkIUbiZFMlwUgaIyt/crdQ/uLVhuGKlP+7ornHrT/RN5mRr45Gvwbm6RTKpj7UmwrIPg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276714; c=relaxed/simple;
	bh=yWX5bTJX8oHqeWSL1JHymF7DCuKBLNVrExmoMM3jTIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAVbk0QWszWOFU0V6X7FRvhyQKr6Rn3zXocje/4HnfbI2/OxVMsNAO4hU71RAbZ1UcSVkAbx0y/rYiLLZVScfcV7aTp7H5i6hM9Wbuu9XM51XAvdn624DGfMmdlwC9L3nVQu/x6GzqimWKLj+HE+bJ+umqD2zwaz7lxhhXQLrDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwod0C/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A145C4CEF7;
	Mon, 23 Mar 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276713;
	bh=yWX5bTJX8oHqeWSL1JHymF7DCuKBLNVrExmoMM3jTIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nwod0C/7aEYDf9LOdOjtA8fM8HmK5/3pphfPLcJe+ohSNNq1cAXk0rHH1BHc+n+33
	 MTGLDlI89drIUrF9JZri7KRa8JurUez1ZWWU6ABJkkotul677tjALY0TG7kfZ3qiCv
	 zCBR3Hudsre4vIi0wXzlqr0kAOXz24cxSTQ7AcSnXhrWkyCEz13zOTarxhyxTJT3lN
	 xnoVdxifhoKV9O8wW4SsamFwWxklvTNk7gWFa02AwZae7seqj86wk/r/UTqismuzR3
	 TcdrpXmCwiSWVLOqJSYUXXJpzNnabgHzZMAszCkAsZEgzlnL+aVLJ5z4izVeqkgUkO
	 HX0xGyfmLvE3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v3 0/2] arm64: dts: qcom: glymur: Enable SoC-wise display and eDP panel on CRD
Date: Mon, 23 Mar 2026 09:38:18 -0500
Message-ID: <177427670515.11515.4466568687936210895.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99305-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10F742F7D90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 03 Mar 2026 12:44:07 +0200, Abel Vesa wrote:
> Start by describing the MDSS (Mobile Display SubSystem), the MDP
> (Mobile Display Processor) and the 4 DisplayPort controllers it brings,
> then describe the PHY used for eDP and tie up the PHY provided clocks
> to the Display clock controller.
> 
> Do all this in order to enable the eDP panel the CRD comes with.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Describe display related nodes
      (no commit info)
[2/2] arm64: dts: qcom: glymur-crd: Enable eDP display support
      commit: ec3cf3801e1376d4b4f9ebf93ac39d294d53ec7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

