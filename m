Return-Path: <linux-arm-msm+bounces-90992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNKZGJD5eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:57:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A039CA0ECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A3E23012941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F83834E75E;
	Wed, 28 Jan 2026 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9kdiEhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5734E741;
	Wed, 28 Jan 2026 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600705; cv=none; b=SvCpHej9O4bmUNBvJ/sMKQPqIDdxAZoAHZ+MZ7cnNec4r8J/BQ7oqBR47BNpynSbsme1ABwxUfdXtZx2ZPDtlPncIQ0shwFqWiUAibQI9i8HKgn00OCnSvU0Bj2s/iSq914VT8luYFazFxSXnUDFMdOE33t0iZKR/6CXo8K0H3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600705; c=relaxed/simple;
	bh=GF81oZ8wWsZE3TbWc7tc9ukmWqeZ7sUg8KKtLGvp9VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKDzVdF9dMCDqAyBKN/kC3UkOwOdKiFpCDqj1WaDBk4AITU34A7wZqo/ea45oraCpJNbz/e02x7h4tpOk/Ty2m03oR5kOQZZCEZgroifR05pyp61FEkU/DkGlyf4crOQr8Z7CKxnHxXK+GEwGUewLzXCkxHV3zm33aQWYVKN0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9kdiEhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB8EC4CEF1;
	Wed, 28 Jan 2026 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600704;
	bh=GF81oZ8wWsZE3TbWc7tc9ukmWqeZ7sUg8KKtLGvp9VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9kdiEhIx08qRaEUm6e6UWykeXHbohmngsoyRhaEh7SId1RXirEBakgRGkG5Qn0pN
	 aq598hAF2nhKmNeUoI3SpMUe99zLBadRTKYhQvXam97ga4uSvljQ5f6953uL3yu+Y+
	 mtaH2qPwd+b8z8ie+B1YR+1SmoSFyDu97oSSzsb8FbMlvwHLmnmKJBFLJHUiGmDVer
	 0uOrfNakSNmgTALz6fGcDRQm+fz4G2EnH9BS3V3KhLYUkBBJ3WZEV24T4ZpejYANDJ
	 gLBl+i7sKTAcxvo7lKsaJmIrR4h5YuXDzPatsZ2R1IRsofUVldlTeQ7Dl1BoG0KeSO
	 mJ+p9lc/SZMQg==
Date: Wed, 28 Jan 2026 12:45:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock
 controller
Message-ID: <20260128-vagabond-auk-of-experience-aeaa78@quoll>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-2-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-2-b23de57df5ba@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-90992-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A039CA0ECE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:56:33AM +0530, Jagadeesh Kona wrote:
> Add X1P42100 camera clock controller support and clock bindings
> for camera QDSS debug clocks which are applicable for both
> X1E80100 and X1P42100 platforms.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,x1e80100-camcc.h                  | 3 +++
>  2 files changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


