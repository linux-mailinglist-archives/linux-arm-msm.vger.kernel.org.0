Return-Path: <linux-arm-msm+bounces-106500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC8iLXve/GlFUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E04ED9B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F2D030059AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 18:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5723F23CD;
	Thu,  7 May 2026 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcTlzEIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A4401A22;
	Thu,  7 May 2026 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179702; cv=none; b=uwkcRqrSbRczBsKeTJidyifJxxhqSX65JtqV+xU+DisH7GSPB9RdXJe9cSncknO+n7uEjRjLDWI0oTWvDXMgnUbgYMXUNTQ/hhe5laCaxCWTnspeIsFU7s4zZT75Ea7B/aKkWLrrriXte1BjRQaJtIybbpzh/muQN6UylrnAkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179702; c=relaxed/simple;
	bh=uKezpq6CL6kJnpGgII3VMBkRH52j1uXiQwSRPDSlPDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejmciep4uEjDZzMlZey4PVSkLdwqVrlCt8FD6TqEWNzELEXl+RxvLseRNDZAESyP4HKg6NI9ovluYlffcfUE51HKhw2HrSBei1lz+yzTHE1XQI+azoU1T23J+vlIMypMP3J1xIvdmla0gjvQyPePHNwWA+Zai249tzcgzQxg2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcTlzEIn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BC4C2BCB2;
	Thu,  7 May 2026 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778179702;
	bh=uKezpq6CL6kJnpGgII3VMBkRH52j1uXiQwSRPDSlPDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcTlzEInlPVzYtcAUp6d8CJ+SUuTLIFR/BwsqHCC5iEx57VAyWG7u7FrniQ83VbKf
	 6IO0JF6gM1SAQ0AwRwa9fnAKp33itH1tr4D+u3d0iROmS2HCQeGJEwpHZLpt/4jVWO
	 dNSuSOAE8/6osjI0osRGXdyevok07HxAxAffj5d2Lzx0VGbasuyOguDg+xbvKc7Ih8
	 1ESg38B8/CLp1diUwTGYh28ImNmMp+Olqs420n0vkZ1/KC8Pb7CKjcAsfW7Iu4Ex3s
	 vRhP9ZF1GqLBmM3U3lxwLdkbMkVi8aueP/IO22osAi+9RKfqvpqze2c366ioanv4Ys
	 lE4PMsYlDe5jw==
Date: Thu, 7 May 2026 13:48:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add HONOR
Message-ID: <177817969942.2241345.16070401299319825300.robh@kernel.org>
References: <20260501155612.5490-1-mail@etehtsea.me>
 <20260501155612.5490-2-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155612.5490-2-mail@etehtsea.me>
X-Rspamd-Queue-Id: 655E04ED9B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106500-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Fri, 01 May 2026 22:56:09 +0700, Konstantin Shabanov wrote:
> Add vendor prefix for Honor Device Co., Ltd.
> Link: https://www.honor.com/
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


