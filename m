Return-Path: <linux-arm-msm+bounces-102218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD09LCFS1Wkf4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:51:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754B3B30FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B91E303B4D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B8D33263A;
	Tue,  7 Apr 2026 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMt7okzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75425A321;
	Tue,  7 Apr 2026 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587847; cv=none; b=CKULr77wAX1XMqVLCJ2s2Xd/6lmNMoKBJlPdQsmxRmUwwXa+mcIZLJqZuMx3XuxRxcCWGw94C7myrSiDRc56R22oAuOPaKmNMkcP4I/nFajBtFHfPyBy+zyjS7l7SciGfaOjLkFjCUSWln2L/t37l2PhkWp4pTYm0Ulol0+in1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587847; c=relaxed/simple;
	bh=lSyGAmzu6UC16xB0+kepp/VBFwz1ibd7bi0PWzWoM1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD+tQ4TA9MyEF8elAWIRtH8JuKjBhtfJUbY7VOodxQnTQ40jbykEzJRcrKge9J8tM90rXk0CL92wdXZIR6nipjUEaZXgUstJGngfa6ArOZO7se5VOL8UGH9WRiZsrgrYppoQYv6mVTc1s5WUkL5fN0Jki/Ce+MHTHGypno8gcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMt7okzf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB807C116C6;
	Tue,  7 Apr 2026 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587847;
	bh=lSyGAmzu6UC16xB0+kepp/VBFwz1ibd7bi0PWzWoM1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMt7okzfVSuhdpZqKOfr76qQHXfrzy6Wcm2Z9n/e+zwZsAY2QL8QHCDp8WyE4Ivzn
	 53H/bWDAvk81QnW6+7uF3EvUYYDHPVhm8w1AjWvbYLTh4QASqVAUlCHX3y1ogQ1RmA
	 s5/qvLlizsWVycl99FulOioIHtPYtRqaIu/6dUAYYLCvPwk2zlmJY1AyJZwB4GP33e
	 iMG3AlGBXSBoH8WfZoi8YIqdGO8lunx39+UailukYef9XrzOR5mIvcRCud/EqS4t8m
	 EppTF6ponZ5sg0Y2rT95NpghvQbgeXTjiHTxF5f0dA7Gsk7U6ABlxUv2KycAIbcSCQ
	 foPOkBXp2REsA==
Date: Tue, 7 Apr 2026 13:50:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza
 compatible
Message-ID: <177558784450.3382760.5659184788634521870.robh@kernel.org>
References: <20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102218-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6754B3B30FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 15:44:13 +0200, Abel Vesa wrote:
> Document the compatible for the PMIC GLINK interface found on the
> Qualcomm Eliza SoC.
> 
> It is fully compatible with the one found on SM8550, so use that as
> fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


