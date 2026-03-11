Return-Path: <linux-arm-msm+bounces-96881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P04F1cMsWldqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:31:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243825CDD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D63A3034C6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E4826B742;
	Wed, 11 Mar 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJDt0oG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B389A23EAA4;
	Wed, 11 Mar 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210706; cv=none; b=jLDIdMwyy7VtsQ7szBYJgNGKIWO6aw7CW3XJznwRfvQQN5R20g6nu1UhYuJ274bbWLnQPNvsHLSs+bEjxqHtkpYTib9LGacbSEJAGT1x1bhP3bZXFLjTKAg3vu3uYUoYHeKXdqhTBWf2WiaLB0mryXNrR/helBUZBho2RtIiG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210706; c=relaxed/simple;
	bh=7lfEqv6hXtF/LcxKNj3z/yHD6hbB2kWYtFCHeCL7rXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmApERmkbwzv3QKOxBmkCsGBEZIBdz90nIC2NuQwjXWOp6JM0s+zyLrp32nMxfkiXvFD+4/s2ifH5qPZpQg3yyxNBraB6fWSC81fbmC2GY2o6qQtTXPjhKypr6zOWpuFYnV0VHpP6dwKRDzJzFLFr9FMqeRk/XFluoLuYZfCXso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJDt0oG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EF0C4CEF7;
	Wed, 11 Mar 2026 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210706;
	bh=7lfEqv6hXtF/LcxKNj3z/yHD6hbB2kWYtFCHeCL7rXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJDt0oG97oGiyT4+PyJSyAyW1XUamXJy1CZ6R2YpPZLbkwkpq51EwTTDhRxwFKEpK
	 FvzH0O3NpqrYEsr0RvHSwW0oX+WM3x7oD7QEHNpgLXPr4agcKo4eaQD9SfAK1piQ5H
	 FHQ5mYH0n3kT0CVlWWMhaL4t9isnNoW19cE5LHJKq6ig9NFdu5rAPXsnK4hfjZTGas
	 9StXFhIcyrXnXy3nCVBztH4bzzLzn0e96ZzwxSsbBlDsl0FkJLOkhKKGWA1Ltx2mxy
	 3hcrAtnSZ+GLRp9PEx4frk6VPBDTELUoKo5aBAUBRscAfTCkEXmDD43aHJUgzY2RF2
	 yjnr2ibgv6BHw==
Date: Wed, 11 Mar 2026 07:31:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts
 and interrupt-names list out of pas-common
Message-ID: <20260311-shaggy-winged-griffin-ad28ac@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0243825CDD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96881-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:03:18AM -0700, Jingyi Wang wrote:
> Move interrupts and interrupt-names list out of pas-common since they
> will be redefined differently for Kaanapali SoCCP.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
>  .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
>  .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
>  .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
>  14 files changed, 226 insertions(+), 26 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


