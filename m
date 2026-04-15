Return-Path: <linux-arm-msm+bounces-103312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIoPLEUI4GmmbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:51:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C23464084EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CEC13010837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 21:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3B938E119;
	Wed, 15 Apr 2026 21:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+4XFSsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBA2FF657;
	Wed, 15 Apr 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776289853; cv=none; b=I/l02woWxWNwowubVEmpA/JEy2WrcWtQ+wSrKI2nIwma6xBGQFPjKyyHHpuTPcoA2w7HeO0HumBz5wg2KFbx/e9XnCI+8HpQRyBA02k/bvwPs6JFCscRT1+U/JCJAhj09zNdT8YxZwo8fOBL7hAIBL4h+rxjRoqnAYOeWfKYhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776289853; c=relaxed/simple;
	bh=02lsykzopo9u7E3TfGUZHaEVG1az3xZZw+wYJbw2CyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs0wemujTysTnIrBwjquvBhhgPFeg6IuTOApjL7UB8mIef57kq1jcfORRaPooqOZFOF0XMqwr77I0ueXTfjmCNkFrFxfK/FfGn5erWCfu7Vi8vFBlwuQXrUp4NPC257Wc/uTGceOET8RqzE91QyLD29zi64In1FgD9aPgxCBEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+4XFSsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CFAC2BCB3;
	Wed, 15 Apr 2026 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776289853;
	bh=02lsykzopo9u7E3TfGUZHaEVG1az3xZZw+wYJbw2CyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+4XFSsgZ4Gp5Vx/0FJAsY18pGHxnbeudS4LQVUxK3Vm4/+Ro5pnmffMDUorfjL4u
	 fKarBsFg5JFeD+P0fegk+sG6GfGSSKvu3XNOhXvHDTrIdQ4X8rrFML9LJfUTGpCBZg
	 Ss8okeAlkb2UirNQQqqYSFFEWxzthgedw3Uu2xZRMYwkzMVawix4c4S5ZP1bhR8Xk2
	 vDXZYmpS9sBAloat1+vUKpeq+0r6KfXnqRPUoH45bak/l/Dim5oJgEsr2hDc+ajkdU
	 XMQSbZpo4X1P/otBXigJYGVz+v4LtnfpiOG3W99YfezKptdWGseiRialPhlbusaeC8
	 wgsQKNrgkCesQ==
Date: Wed, 15 Apr 2026 16:50:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly
 use additionalProperties
Message-ID: <177628985075.719572.15607564918118997220.robh@kernel.org>
References: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103312-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C23464084EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 04 Apr 2026 12:54:37 +0200, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


