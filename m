Return-Path: <linux-arm-msm+bounces-95514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMH/HRkvqWmo2wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:22:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7D20C8DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13E9F301CFCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B113191BA;
	Thu,  5 Mar 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSsGeU+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5D191F91;
	Thu,  5 Mar 2026 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695318; cv=none; b=MiKEb2Zi99ji/s2DIbVHExCOQ0psMLPz2Iju+tsLhD+3BbQFGDu44/VhmyIV2B/uy+e4Awu43V1tR69jUKT6WAooApO4nwQlGCjqxKFn34a4CWPSxJLANHX/qOD6O+ksxNy1JePvD/JS1QBzUtOjDIxiTW+jEqCtS6DJWExl97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695318; c=relaxed/simple;
	bh=NMxdTYwa7sd3tg76htdWq5xoHUcPVUBSfcnaT36JYUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EROufL9LAG5MhiohIBhCQR1q8upCSglRGnSMCGpes8OcFMCp22OHIzbKraUfROTS3XFP0NkKWck3wH4V2ygvi2sAHI6pZslu6rYtFelb+fUckLeAOsNdyjXbaX/Nmo9ZZbkhE8qZTfQcjsVGjM14sqM7UkbOqMO3153fu3calU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSsGeU+t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2671FC116C6;
	Thu,  5 Mar 2026 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772695317;
	bh=NMxdTYwa7sd3tg76htdWq5xoHUcPVUBSfcnaT36JYUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSsGeU+tHV4EEzUAIk1hb8n8fuPCe6WzV9zHFvl66a4DxWyyFsJNNPnJpHB7MjSQs
	 aLZC1NM6SwfCark7AxSuibKN5hC/lLbDMgImfFqe4dsy+1Sj8afJUDlBZ5UD1k37/l
	 4RhvewTEPlPl6ZaGDffjrjVNYGiCNJtAf4IQD16sF4MgtJEfcPE6ks0B+LiE9HU8BE
	 p3LCLI1Lcc4fDtrsHrtURdKKmwu18kjB534n2ki47qv6ru1AZ4XfN0jn3DTsFEcATh
	 l4BnNEr5ssG72jjInZhD8M2AAKZcpzHM1IT2JeOSVjwqKCZcje1G/nr94YoxzddunC
	 oT0sKQUt7sJWw==
Date: Thu, 5 Mar 2026 08:21:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srini@kernel.org
Subject: Re: [PATCH v3 06/14] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai
 ids
Message-ID: <20260305-masterful-scrupulous-parakeet-9f84f3@quoll>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260304130712.222246-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304130712.222246-7-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Queue-Id: 09F7D20C8DB
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
	TAGGED_FROM(0.00)[bounces-95514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:07:04PM +0000, Srinivas Kandagatla wrote:
> Add new dai ids entries for LPASS LPI MI2S lines.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


