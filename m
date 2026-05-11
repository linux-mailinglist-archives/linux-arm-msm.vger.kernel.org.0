Return-Path: <linux-arm-msm+bounces-106952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM4NE2PmAWqKmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:23:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6F5100D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2A1D3026EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B83FB7F6;
	Mon, 11 May 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVtudW/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA83F20F0;
	Mon, 11 May 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509055; cv=none; b=fwSkOLY1hDxORjyPPeh587LcfRTKLFiydVELwslrvUcLFQ+KoV45EQt5nTGZXBsU9X0yl/aYUhhVSKCY5lRxMP3LzTmBUpOWvf9jY2y27uVll445a5+YVQXbuel9TK8v5U+KwEAf7mWPO8ebT5DLB7yK6Rohk9tr3zbL/s4ccTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509055; c=relaxed/simple;
	bh=TZVIkTWypVnbl2R7t67+UGjLujcG3Pr5gHQWQnJ0BJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw4PMbvQm63Xurm2KxwMHyAXktONEU68FJPE7h1WwsDpnnvJ48SFAlhs282mQJVsVlbPo4u9IQW5dClhK1pqiOccEwMuHxvvsAfhjBE6MGLm8xOUbP/45k818g2Cfma/3Qnt43gRbPqoatPX2oNMoH2ERFYRNfztIrZ/lpP98W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVtudW/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A35C2BCB0;
	Mon, 11 May 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509055;
	bh=TZVIkTWypVnbl2R7t67+UGjLujcG3Pr5gHQWQnJ0BJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVtudW/fwYikiLYs7HmKWu48phxkvVJQkmMlCEMR9RWbC36Zlyqy19bcbOFLHyS30
	 GLeYoJ5kVZYPDwWT+Zz/WC9Yv2ggVFWSdNr7fXh3IalrySG22DN/0tEsuB2YPvpiTW
	 8tTb81yPUHIIDcV/u7PEz4x8WCGXD/n+cX1E7/XZJ8HkQ/c4PFeTx4PfC2/BlhBZab
	 /qWm5/eQ1WWRS/621tHHH5b0USM0jWa6vjip88NHS+6j//shqNlKjVE3iJ/vdj19TH
	 VWjsY5T1imeCfVMxzT5VJRz93ZvGu93o//NeB/6pdrba5yrNAshG013705Azb7GA/o
	 ibYiy4JwSpU2g==
Date: Mon, 11 May 2026 09:17:28 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org, 
	Eric Biggers <ebiggers@google.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Tengfei Fan <tengfei.fan@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Wronek <davidwronek@gmail.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, Alexander Koskovich <akoskovich@pm.me>, 
	Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Message-ID: <agHkmKq-q7_6m4nl@baldur>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
 <afmuncmBrrvddHTU@gondor.apana.org.au>
 <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
 <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
 <af6MsD1wDs9EZl5q@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af6MsD1wDs9EZl5q@gondor.apana.org.au>
X-Rspamd-Queue-Id: BFD6F5100D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 09:24:00AM +0800, Herbert Xu wrote:
> On Fri, May 08, 2026 at 08:11:45PM +0530, Harshal Dev wrote:
> >
> > Can you please confirm for Bjorn once
> > that you're not picking this up and he
> > can pick it from his tree? 
> 
> Bjorn, please feel free to pick this patch up.
> 

Thanks Herbert, I've picked the binding up.
If you need it, you can find it at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Regards,
Bjorn

> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

