Return-Path: <linux-arm-msm+bounces-96155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K3EJyuArmlfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:09:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDE23550E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F9930698F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 08:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68C36C0B7;
	Mon,  9 Mar 2026 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhR9o5Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5E36B061;
	Mon,  9 Mar 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043449; cv=none; b=RmTjF3yjiLUU2JBfvKTIRz2rZYGILB+pU6m3MQ+DWDbfUXcgOkL4TWES8YmoXerr8Pcze29TrY26cD55dcnbLxf0sY+5SjkZ+FqEO8vGUBzwz65sUeF67Uax2zqfT+RWGHKk3LA/lWTkiSACSABRSBV1eBCdR5L+1HXxyCQZT3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043449; c=relaxed/simple;
	bh=eUlhOzsSXBaLGV80DskXfN4vWHrJrD9Z2pq49tZW4AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGPSixFYm1iDFF+fdMikuVccC+0YdyAv4cKqJauiNhv4NP/U2shBzLYN5SNhZWYpP5wHd6z909T0UW1aDRqAIQafC1KwLL7/aQpXlWv7Ue19zSx89OAblZEm5KE83EsspEV78G9+KSGGFV4w0xHl5IOZ8tjsREM6PN3gPSSY0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhR9o5Qg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4617FC4CEF7;
	Mon,  9 Mar 2026 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043448;
	bh=eUlhOzsSXBaLGV80DskXfN4vWHrJrD9Z2pq49tZW4AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhR9o5QgIerlBGzFmrhPARobbwz2U9uolhqn2Fj5e8+B+CAkNVxdnAjPQVTKJ1nUw
	 JixC9RCo2R05AkY3Cqw6uuy8vVm3QZH3XpBfxKAJP8SBqmTxODugWaoNR9zCNZdGW+
	 PMaiH2nOSVikQ+cxJFJGyTz3IP3vwEf9kIK0hcmGCySEngqQMpx8RYEdTWYkUqdDUa
	 pqGaxQx2AojKe0RCJnfRISNKHYzhG0ulmIMvnDOuTXgjXeal2DSCClPUlwdhK0T0i+
	 mmyeXdffwxpYYGBQG6YdRCQTCKEhs4OLVvVoBiyPpDhWig/zY2fCfc5mAGci5WVXnT
	 6JhYHndHopxKg==
Date: Mon, 9 Mar 2026 09:04:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom,gcc-sc8180x: Add missing
 GDSCs
Message-ID: <20260309-soft-beige-shrimp-28ac6b@quoll>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-2-val@packett.cool>
X-Rspamd-Queue-Id: 59FDE23550E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:00:23PM -0300, Val Packett wrote:
> There are 5 more GDSCs that we were ignoring and not putting to sleep,
> which are listed in downstream DTS. Add them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
> index b9d8438a15ff..9ed7b794aacc 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
> @@ -322,5 +322,10 @@
>  #define USB30_MP_GDSC						8
>  #define USB30_PRIM_GDSC						9
>  #define USB30_SEC_GDSC						10
> +#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		11

s/HLOS1_VOTE_//

> +#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC		12
> +#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC		13
> +#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC			14
> +#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC			15

Best regards,
Krzysztof


