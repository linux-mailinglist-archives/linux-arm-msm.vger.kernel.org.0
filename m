Return-Path: <linux-arm-msm+bounces-94455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLIHLBWgoWl8ugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:45:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2F1B7D6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 776E0301D574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA643F0773;
	Fri, 27 Feb 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxnQmO6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B133F0765;
	Fri, 27 Feb 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199953; cv=none; b=PIE6PAUaKfq/F8RU1vJSc8wPBoqm93ytkcLBuREoCG5YAQfGa6i9zpxL9nGuJ4+UpTQ9amGyB5AkKXzgKr3DSlmYeUDOEu7MsOoyPhEC8j0UhPdZNiBE/PaO6yf/OTD97EkqrpN/GMAGiEwSFponSL13G+ySl3IvlD4E3vft4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199953; c=relaxed/simple;
	bh=b242g2qNf10eAecZBeoervTpA+wsH+kaSLHINlPH/aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBmemcyG50qr3FYxlGZwd7hu+rIdWoTGnRB9rKWe8Amr+NLJZy7mxOAosuqP111//v02fWAXVdNs+HvzmOeIfJz3uhaJMMKiwXxU7iQvbikK1sp4H/meLFkuMM/S8+HrLcE4+KbwlH3TlCF0JG2zXcLlXV3L7gMtBb5mcvGC4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxnQmO6F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02162C116C6;
	Fri, 27 Feb 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199952;
	bh=b242g2qNf10eAecZBeoervTpA+wsH+kaSLHINlPH/aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxnQmO6FxSK9R8f9ct2N8OQyn1ufXUd6i18deXkxbsu0sXgYwCE5rarxBeew/HF2f
	 UUt420Jcfpt4ij4pGxa91h7L7C4HBJXjfcsMzbXStKwi6GDoLdovUmw0xlpoEGhCz4
	 UvdnnGUTzUhgCDs6y38V0FQnaV61NVcL2tHlcSBlCasBjCqfmWJbvCw+wBtMcvLn+D
	 Ubtb4tLUVTA0oItWJrqTynbPtdSFuCA+7YTajUxfbIxz5OJ/DTUTw4OOCW8W/lgKrf
	 769x3gGF2uw+uMN26XoR+DeGGiBa8oE3aDw5u5uyrAePiT8EVxegJPPFh2xMQUK2RB
	 6Exubf6OBYUqA==
Date: Fri, 27 Feb 2026 19:15:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 7/8] phy: qcom-sgmii-eth: relax order of
 .power_on() vs .set_mode*()
Message-ID: <aaGgDfaOBHNY6xL2@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCcE-0000000ArLT-1COQ@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCcE-0000000ArLT-1COQ@rmk-PC.armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94455-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E7A2F1B7D6F
X-Rspamd-Action: no action

On 25-02-26, 10:59, Russell King (Oracle) wrote:
> Allow any order of the .power_on() and .set_mode*() methods as per the
> recent discussion. This means phy_power_on() with this SerDes will now
> restore the previous setup without requiring a subsequent
> phy_set_mode*() call.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

