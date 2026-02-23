Return-Path: <linux-arm-msm+bounces-93813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP0RCcy5nGlHKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:34:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4E17CF48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA2893106100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36F8377541;
	Mon, 23 Feb 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQK9zSQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC511BC46;
	Mon, 23 Feb 2026 20:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878678; cv=none; b=M/olY+z1PlNPzndwkO6zjXaacKkJLd5JVj0OJK7UDwMFkEL07SoYEs9ZRPiS2pNtlxvlXmZss7HilfUcf/7DPTz1+A7Uw7POVHtO5PCR57WEsAiihk02Aqd8k/EaAHV594cia1jyOXmD1xD8ii68ltUKK2OjCVrvHD/gH1l4+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878678; c=relaxed/simple;
	bh=PKRWD88GAeR+tzFUHc8eow89x+CokpUkudl1bAN/zZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEDtpnYpQsX2rlVapLrhKbCwOpFFKIeIirfBQSuhHrXOGzCzV0V5SlJD0ko+knRFsUQVlElfBEvoFg10CYfBRXx/e2rmDC5e3gNSlc2AVOayFxy0W/tAiAqyD/stM9bY5GUI1qnkOEKoljNa60hrSdESuAaPUx3OfgtGcFzis6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQK9zSQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46C8C116C6;
	Mon, 23 Feb 2026 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771878678;
	bh=PKRWD88GAeR+tzFUHc8eow89x+CokpUkudl1bAN/zZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQK9zSQMB9Y2mFb1ugv9kx4ps/5MGm7ou7UO60B8mouLf6pjMugh6tQdCBzjrAF3C
	 Ed2NFUvYtBkyufxebiLLIj+evC+mxZOQcIGS1o2pEVCi2LSSVCokuLIJxbt2yj20cM
	 TrxEEqryGOqlcpffzX65Xsx9Dcm4DHdFEj9FYFxvz9eD4SW+YxT6HtDuFaiue8zry/
	 CK2NEDbuu5utP9E+GFgJu5qo2+jn7p+GdhcJFmvFMw3BB55MRxBvF1RgGaVW9sMkJQ
	 gO7IGy5cePUlW4Aes1t+27cXYVB5ZiF95y8+18l6AOixcxiMcTuj6tSUvulwSEm8Mq
	 eAPvSJ0qqL3iA==
Date: Mon, 23 Feb 2026 14:31:14 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Introduce Glymur SoC
 dtsi and Glymur CRD dts
Message-ID: <eijiiyxjtj6cw25gb3xaaeqitemtmrxeemcb52csoy34vw2wme@y22ajzhyfikm>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <177187657304.166046.16689907944315673624.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177187657304.166046.16689907944315673624.b4-ty@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93813-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7FD4E17CF48
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:56:10PM -0600, Bjorn Andersson wrote:
> 
> On Fri, 19 Dec 2025 20:16:53 +0530, Pankaj Patil wrote:
> > Introduce dt-bindings and initial device tree support for Glymur,
> > Qualcomm's next-generation compute SoC and it's associated
> > Compute Reference Device (CRD) platform.
> > 
> > https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> > https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: arm: qcom: Document Glymur SoC and board
>       commit: 4ed5f35359db5fac587d4fb9f7f61c1c6f0729d7
> [3/4] arm64: dts: qcom: Introduce Glymur base dtsi
>       commit: 41b6e8db400ccba9fc373ac3f0c9ebfd3a22c810
> [4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board support
>       commit: 9314c6ecace1a49aa40f75f72278e14d2feb2cd2
> 

I don't know why b4 generated a ty message for this version, v8 has been
merged.

> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>
> 

