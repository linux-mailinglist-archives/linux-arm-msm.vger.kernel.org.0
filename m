Return-Path: <linux-arm-msm+bounces-94782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DF3EH06pWnt5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:21:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F41D3D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 08:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF0D30247D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 07:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301702D59E8;
	Mon,  2 Mar 2026 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KynI8oG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD81D0DEE;
	Mon,  2 Mar 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772435846; cv=none; b=naAVY/yeF5DQ+hHjBwas0CN55K6Qkv/qbnBXIyOo6MfsiSkpPfOSxAvgOI3goncDPNURuqOsP6F1WnTUTIe2zoBNTTOhxzUhMcNqyct2phPMaQFHq860ZQS8o8Zk9bkg6ATRcB0yo4TxfKSUTHK1HNZYy0hobqzf00NXfvErX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772435846; c=relaxed/simple;
	bh=nC9zUAdvD57JDzh2FtofV4kQc/xhANpYc2J4dZGO+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdcJrp+YIykAFSdK0fh/tE5V0mHty/eFUpt/Pjc9qAa7o9rv4goLmPzkI/IMHkp8+370KPtITls/Z7fuSGe12KG6UlZy3YdjTHKJpMrfXLoH2khLJL4BB0t9MXBmOudNaYm2zUrmCOX4Mnb/WSHAJ/3OQ/8HKP3TYsmH2oLgwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KynI8oG7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105E7C19423;
	Mon,  2 Mar 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772435845;
	bh=nC9zUAdvD57JDzh2FtofV4kQc/xhANpYc2J4dZGO+CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KynI8oG7xJDbSIapO2jljCT1/hzpe3eF6EBa1eEVUBnpcxcdGWRDVGTqnIjxtT6xO
	 WY4SSi9PqduFL+qdps6MpwVplRWn/5uQ4yIvja6IU2yzqqjEUnQc/6jV5e6q/k38cL
	 zpqVU4iRvsG0AUF1DmyI/62iLvQpHR0MkgM/WTgwcK+77Tx2ymTpWsUUI3QPsLy6ps
	 weSbhkFkvoaTiTGFK+aias4QdXgfNYMpn97Ua3uZ2VnvOZiLTmpBKBsvGmx7Rd4XBB
	 pnyKRH0sj7e61q5FZfYCh/Gd6HBEZB45EJtsEPdjRiPxCzg226by8HPonVCB7C8/zx
	 LrW3xHZFy01ow==
Date: Mon, 2 Mar 2026 08:17:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce reset GPIO
Message-ID: <20260302-rousing-finch-of-drizzle-af53b9@quoll>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-6-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-6-22c458b9ac68@ixit.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E8F41D3D1D
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:20PM +0100, David Heidelberg wrote:
> FTS may have associated reset GPIO, document it.

Commit msg is wrong. May have or have? Hardware is fixed, unless you add
the GPIO for driver which does not exist in the hardware.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Best regards,
Krzysztof


