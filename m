Return-Path: <linux-arm-msm+bounces-102329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aRkEHIBX1mlJEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA643BCD16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 419FC300F7A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB7337BE9A;
	Wed,  8 Apr 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz/BUBTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621A30EF7C;
	Wed,  8 Apr 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654779; cv=none; b=HpTNMPu0lOInjvGfMovUNM13LthBO084A9qn5iyF2RwNqMeCvsvx5F5jnwvTUvd5uQtOp+3R42uxaHgXrSkgkMuP/6gkfXyJKJHjaj9TCsYKMJ2TR4lc9lZvncMRmtQdp0FjWTEpgfNre+35m+XuLzBaaDkVMGmP3emy5DgcIcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654779; c=relaxed/simple;
	bh=GVrGCsYxYO1/MdZJjJeSRrGaIhOdYh3676msyyoaKdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPkcBb0eTa/+3ukTEDkl4v9fd0JDE/7bH9CfAhm6bGGad+5hthNbzDudMc43OOHHWKE6UvveqHLtJR1yA+i7cR0hmaI2j2FzipWek1vWqBfbB1XH2RAS0UU7i8P9XFzdaG12K9IIM7bwhiiBaL4ESETKDJEXCkLSiieThh5Df18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz/BUBTi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A23C19421;
	Wed,  8 Apr 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775654779;
	bh=GVrGCsYxYO1/MdZJjJeSRrGaIhOdYh3676msyyoaKdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz/BUBTiqY8EVcK+XDn2pOFoUt7qP/AUu/OiZMqgfJE+wefnWFQq+rRwz9NxxtDoP
	 Sf8a/FIYIUb0gwlwcRnLHvh678Kzrm9vPtOM/KX6GvSTi/ZKFGizwmL+obmffi4KO2
	 +Zg9vCFsABL4bBf9HF8a492Vt+nAgb4WpFi+72mVPz2lXTZc8ExotjioreezxcvxIS
	 pJNcFlE2y6C6KZZTlQGXCEPlwpbmQ4RhN8RtpF8/ZNi5P5KQ0NTNPEKDWSWSiXuuYT
	 BG5a90YiqFzeW5y4xFtqYoNC7MlVclVPujaakn2ln39J1RDTcx/bkpQTZvemkcc1yd
	 ZZNCmJgOkJ7eg==
Date: Wed, 8 Apr 2026 08:26:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings
 for Hawi
Message-ID: <177565477679.1936972.12358129694919211077.robh@kernel.org>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-1-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-clk-hawi-v1-1-c2a663e1d35b@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102329-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: DEA643BCD16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:34:56 -0700, Vivek Aknurwar wrote:
> Update documentation for the RPMH clock controller on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
>  2 files changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


