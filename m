Return-Path: <linux-arm-msm+bounces-100013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBPcBROmxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:20:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D516232EBAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD455301C579
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70E539EF39;
	Thu, 26 Mar 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibmaoHP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978239A7EC;
	Thu, 26 Mar 2026 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495188; cv=none; b=Sce4D9ZzerHXhdkFN00NsgcBS3LctAV3UD7C9yanvsVzJRjI7SESdS9t5ydE/iUKqAJdG6q51Vs8M2RaJkEY3qxBA5n1INkyMhFkHDD7kolFy8C81Mr1sFEEMCzzU/deG1lhey2gEDkoKljBCsPcstZ3knamoP38isEOfBpGI4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495188; c=relaxed/simple;
	bh=I97y4VSJgKXQTUTItOSekUE7njYBvhdFCTVij6GdgBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQYEpjLNwtwhzJNYra0ILTRBi9FQBg2KHQiB5DJMG0G0UxjVDhpecanFLFp9A/UrTP1jKAfpHVEfYR0IRwFcT8VVDBkxFzVkRqA3AdYI+3HoggLJZeWmtjkrrJomYALOYF6YyvplKryT60INL4/KaBc8B9to8F6Cb89Wm5+xe/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibmaoHP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFDBC2BC9E;
	Thu, 26 Mar 2026 03:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495188;
	bh=I97y4VSJgKXQTUTItOSekUE7njYBvhdFCTVij6GdgBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ibmaoHP/FwSSTBFjNx4cXts3J/qCWaM+TU0mK27nH+LQrpZAePlxRNxOusF/l+5hj
	 gFEU8EK371WL7UnCtVhiKpkqCTx2NKNcxlsAAqOOK796M1Jew2fXzIffHolrBny8iq
	 EyfOuC82/gRW7kvyNMWhib1UR+kFtVar6zhPot8FU9tJubIcAMbtTRNeQynP39yjrb
	 9pQT4/FEXn/RmAxNwZ7KlhR5PKUmx/oz5FNOeE1J3PYS4OGl9FgWoPB6uE9+c9tmt3
	 vd3xQ0OzOfTPaRElGlHImX3kjASmaE8oM4Lk+JUYny96VVhO6F5W3/f2RxbOVz3pKY
	 0FQ+Vrk/iPj2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl definitions
Date: Wed, 25 Mar 2026 22:19:28 -0500
Message-ID: <177449516612.60308.6654202253703462894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323095247.92890-1-val@packett.cool>
References: <20260323095247.92890-1-val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100013-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D516232EBAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 06:40:47 -0300, Val Packett wrote:
> Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
> for I2S output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl definitions
      commit: 5e25296941545e4739bbdec8084185b1a945381f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

