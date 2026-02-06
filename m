Return-Path: <linux-arm-msm+bounces-91979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFtrIhehhWlKEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:06:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E0FB401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C78713037EFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A9F346AD6;
	Fri,  6 Feb 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE/bTezM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128616DEB1;
	Fri,  6 Feb 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365015; cv=none; b=NvX9WhgkSpPESQPZ2bWFyqPzvDrZC6xki+dVIz+c7ngjJZ4JqHyzkqJqTY1nQTGWMtFILQFdRujZcHBkUJIKPTQ8DBAzzHtZzvzQEset+omKZe1kCfp3RmIrri7o9IlhM34F7NX7CkaK3m1Ok2nymx/UyVOcNfGrKjLkB1s1KTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365015; c=relaxed/simple;
	bh=c6QFWwpCfDSDuqoYDs1+erWqQ5RB5XejkVMjVYpSHMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vbm43LW1qOXIyCuZ7LlWeStCSAA0ZnTbsMt7h8ACJl/QrVmlkfnVufc6xzpvTrkfGFPgCNx3YMx9B9Z/QhM/HXCNKJWsaG6Y/ClMCYa+pDgjT5s1+JLPIM1v41Ykw7rFibvRltb8EX7J5OB7yYOt2jbChTIca1eKEnoZeLlkkxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE/bTezM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA60FC116C6;
	Fri,  6 Feb 2026 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365015;
	bh=c6QFWwpCfDSDuqoYDs1+erWqQ5RB5XejkVMjVYpSHMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VE/bTezMBfL+VglVlZqRcjPcfSoZghe5DSI9izb0Toz4hMRl2CRt+dA1p08F2b3xT
	 PLf0YxqsSmRbX7bIi+9AJDpH/r3D2ny1W+SzKicn5j9lwzaffOv5nGmUSRZlSQTbGw
	 quyJy6ulRRrpPGkRkRYWT5EyWxDp3xYdHrjSbAVZ5NagFSV6Z+EkCDmXTZXFeuEVTI
	 N/DHijCjiM7fRK+TzgMt2mM3DbucOZU/k2tZBgciZOcVUMkJOWONX0p9+x6T9EcVX0
	 T8cm1SQJbQudO3zX0UqgYd6C44MkuP8D441D79oMjxhiA9Y7q4KhkUG+Tk+JXOLYpm
	 KgQdK5b0qORvw==
Date: Fri, 6 Feb 2026 09:03:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <20260206-smoky-owl-of-tempering-9eddbf@quoll>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-91979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C87E0FB401
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback
> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 0febc641f351..715bcf1bccdd 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -150,7 +150,9 @@
>  #define	LPI_MI2S_TX_3		144
>  #define	LPI_MI2S_RX_4		145
>  #define	LPI_MI2S_TX_4		146
> -#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)

You just added it in previous patch. It makes absolutely no sense to
add a line and then change it IMMEDIATELY and then change it again.

It's the same patchset!

And again I cannot send it because of typo in your address and I must
correct it by hand.

NAK

Best regards,
Krzysztof


