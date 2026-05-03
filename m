Return-Path: <linux-arm-msm+bounces-105616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMxIDnW892m5lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0953B4B77AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59E293006B12
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B3D37CD20;
	Sun,  3 May 2026 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYe4kJcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538472C21F8
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843313; cv=none; b=tAuImR2XJ1M8BBw/vBOsZ3l+fZE3gh6y09OOKulLzTpOcAeedD1O8VD46gnmVB8Oz85o2J86r/JERI4ON4qAKS/t3LgTRbSLSor80UQd6S/wVceYlKKRzv1k4gHNcD72GArU9lUPAgFQ9KkIBbBbx0Qt6Wr3mt2GjYHc/B52bPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843313; c=relaxed/simple;
	bh=tYupaspFfCJOfKetalRjhlUYhov1a4SvzMQl0DK1eKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMb66LKqP/u6Cyu0uDhCi/1tAOWKPVm2W7DEgW+bj6KB7akczOqKuUsV8nFMg0GF5c2WNJcHbTUVV/be5ZcS22T8GfzGmLT/DZ+SDeXrJ5H5uto3Cndm0Ll3Csc4R26JyauO/Ah6Ss3/lo4dykyv+R3Pd75Ol9RV1SuC8PZ0HKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYe4kJcK; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b4aeddfacaso35830326d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843311; x=1778448111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=hYe4kJcKFsFdUHwnpMqqBdO53ZOw1dL6AofRG/rs02xPmwVsgFwfCw4jjEw7mXle4g
         NNtEh9CHVEYHyiV6RqcRnwl5UH4bVeVbd52Uwf2FrlBSNgmlLJkWFeQyPHMQtepxOZbk
         62XskseUViuwj2O9nNnKHmxTLX8LvINTe2zjDLQ9BjyHHZObPgVppXLJ6vfpIhGLIgSP
         VESxJeJQpWW5bZEw06d1zpt9Q0sH/ldfE9XSUXhmxMr+Jz4NwamDTaqOugGvouoy8PsG
         x+cUs09UEreAFesCuy0STOjaMTYtldkQ4tb/8JNRd/prTpN/2ysWGsOmoRBGCQGswWhL
         9Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843311; x=1778448111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mkg+VtHb7z5VW8iw73r4CHPWNF6Icrx/bYF2pZNP/U=;
        b=Cu6790efgebWTkXkKV2llN4R4W2l42km37p+wJ9oaTstmoGsFBUwZlrRo+tqwN/m2a
         ODx/ekCOJwuQvZwhfXjzd3Yz8deyOrLFsmsODxxrT//pfPsFcAVM07Twctx0HCDxN2a4
         e0X3ElpAHP8oESfr9db65JpUtssgak2YDLSeV9zqqFrBTP3yIt0xsFO+pR9S4vsjbwEK
         6YoSixUZDDAACLLcMrxiFquKpl0jGQvUxUx/zSn8qhav89LBS+n4Knh6MsUgGkHAqgPr
         EeXC2mMwsLg4OdI+iQh4zVJr7cwHq6er+RpVMzpidHJdGPr4h0Fh7K5tI3k+c1ffgluY
         s+jQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yve48DqbGYdH7qyKc1rL4Hi9jDZhfMgVKeUqS1Ud+jT3gNc1QYNBhRHPtimbo38FW1S6eNhpYZg1VSDPI@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1DtkjSdnVgWuy+cv6Xp6PlBWcJYIIcEaMdLutbU0iCIM00RP
	w4XFhyoMCfF9IEzKFuggiRFzvmSFSp0WGXoJ5C9tNsIJFGDz+vZsjw3Zns0P8w==
X-Gm-Gg: AeBDiev58g+Ezi9zK9R1KNZHkKnZKCPQhOAAaTLu7ZsiBkVlO2v5W0nDWzzvjFsdzD7
	BT1U+kCb5cVNyrPr5AX9baE7T4M18Fowbn2RnhHfhKIe4LAe0K1XNPq0XryrlRR28oMCfyye1A4
	CTcWCMnbAdCWPZGF+Q7S26wTNH9kfPvFbiriztZeI6O5AK2oGwjEkuiXKO66aIAIHg88cliTRc9
	yXStR9VsV0Rm3KOvJWGXNRoTYgCFYKJugsn/TzJf4z8wBjxjdCHpmBUD4AkqjwXBm322LJhc+CB
	hOTTnlpEGEcTU3rQF2tBqWt/V65eW2wvV/iHLjQYBflvBxqegE4t+a84EpRANDaJaVBl6ZOV09b
	qDvcRlENaM6s4/++vanTUhR/ns2lJ5IRgmEyGd35wlcIiS70xmwa3EnAawpMsbenGOzlHSOI8fa
	8DB4CoHDZmFH3R0P+QyiMjbdKE8ivmn5zVurYNeellKZs/+BgD809uODRklxnvGeu086jnMyItO
	tRDM/Q4lQpM8jDAZXBr3rnr+YlP3l5sdVed
X-Received: by 2002:ad4:596b:0:b0:899:f0b1:7332 with SMTP id 6a1803df08f44-8b6687360f3mr139026546d6.32.1777843311331;
        Sun, 03 May 2026 14:21:51 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5391e34dasm108625546d6.14.2026.05.03.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:21:50 -0700 (PDT)
Date: Sun, 3 May 2026 17:22:38 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add
 PM660L compatible
Message-ID: <afe8nm9VXytzxyxj@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501153128.8152-5-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 0953B4B77AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105616-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]

On Fri, May 01, 2026 at 11:31:17AM -0400, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> index 15389645a3e8..074a20cda89f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> @@ -14,10 +14,16 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8916-wcd-analog-codec
> -      - qcom,pm8950-wcd-analog-codec
> -      - qcom,pm8953-wcd-analog-codec
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pm660l-wcd-analog-codec
> +          - const: qcom,pm8916-wcd-analog-codec

This should be PM8953, since PM660L has the cajon 2.0 codec.

