Return-Path: <linux-arm-msm+bounces-110026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPRnOa9oF2qhEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 23:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406275EA7E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 23:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 620B430DBC35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 21:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634A3B4EA3;
	Wed, 27 May 2026 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDHCWD97"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCD3C379C
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779918967; cv=none; b=b9KsXCIlunJ+W0XhGs58W3tzaZGvxOxVuKZv4jC+CHVi5bELdSbkPVmlXR0EQfNrvxn0Bg/JrogDPiFG9dvUSuflbdpZgJKquyha0OE3saTzecfSd8/xQ7Evk0L2T5Y39APDt5f1ZE8K7bRdYUOr7GZnHWGfLscg1jZIn5PapS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779918967; c=relaxed/simple;
	bh=cGKtD3QmWzMTCMfMKYNFa7orYz8sE6eXPChDz4N75IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSrIUmwTP2vxvC+jzyj6d/9MRM/BxEhLSKWcmK77lrwOdMGumriB8xwvDA4/JvTrzMuYJ3MeUg1L+QnQGUdrpF7FfvRBlDNlNwYbQCus1QXE2dvGRC4CibdmWmpPgdzvUdjFUhcN+oaTaIpDT8b3YojBbYu0HN7SRUSs2wTAcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDHCWD97; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304545f5206so8224545eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779918965; x=1780523765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXg+VJDmtN8gtR2tAPqmElloUoo693bty2sHUHo0J88=;
        b=kDHCWD97AFaM0TwG/LKKBFvGv8ZfsoJby8ur46cvwPMS2jOwKjW3mit0bDkFamtB/N
         qTyCVW+41DzBsXjUyRANmyhLGdxJzh2I1Z+MGEFsNw79DKMHsQZVPa1D090SQEXeOgkQ
         JFisuGkFjYzHcU2wqaVcSyhJG/RoYdNCCZGggvrzSfgXA+OYpJNgGE8Ncwq5pHZlZWff
         ksCY2j/u9nF3GgXcVFnev8mbCMIjmu8oIJfmy3anyjfqWsbGAkF9oaz4S/aJFLZFwzav
         +I3cV69WwqlXLqcXRl543IW+3EKnCeU8KQHjblU52eSjjLWcmwawOgHpS63DIM+Qi9Ns
         iANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779918965; x=1780523765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXg+VJDmtN8gtR2tAPqmElloUoo693bty2sHUHo0J88=;
        b=plrt81aLuYQJVbhCHZr93O9frNzT798vRjMo3jHK7fMh+A/KL4NNJLuWOV1F7OeDbf
         39O4OQ+7ptbDe+iwBCham/KQJObdXy6vetpB/0MfTs+67bfRP4sutLf28/w4PD4zkyd0
         YvLzmL23QPYDGzK+6TDGgyw2R9fDRFl8ALmzUyP4AEiqhf300xclkTmRIqLpFoXYXc3H
         xPEXJQNZruYUTyvyzNjilXigSDgO8/KT15gWUSOYaqcPwe5hVN5vLRmpmPu01xTq241m
         jnhDGsZM+CEolry5IoaW5sCrEL+m+kkQFVA415mjHSs9iU1ba96ToJJtbMvACBVndBvf
         z2QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PoLscuLEU7nilMGtdqX/Cjst3+N+F58jLvUHIjx/6hd9v2hxh0M/IHBe4mpZ80Cs/dcTRZdQruGTOoJUn@vger.kernel.org
X-Gm-Message-State: AOJu0YwU169igOyrrzHBUApusteH9Q002ddqEbJT3a2m9xPtJydVahpz
	u3Mmf/xT6rvEdL0wrbZPpaXwqP8ptXb+YjSSXjWjx+1IFECq0DMCck/8
X-Gm-Gg: Acq92OHL5PIpJIUQVk/Qj/B5vzbfz5ZF307+JTsIEMoiX/zfCSGoboXYCNfejNFU1gK
	gYIImbEuN054PGtQ56dGI28/dNpW1HTEMcyucvtIu7eXuSI5dh0ZwSZclT+NFXvgUJQ01oMNjK3
	qrrTgpYW+0Ft568AMHzIx41k7zAT9KqYX2UzU1nv26Oj+9H+JXBrmHCDrsUaNnuXFBYKh8ssdnT
	z5vYMACYBwoQR/ibEyB0Qya36pmWGw3W15pCureCS7F4q0DIUfKrOrK3urw9rMHdJAm5CqkM5C6
	0Gxe+lJJhDTc36SuVd+qZALMag37MkDvIIe7zfghtw5HdAuqIUGp0OSIkNwNJlGCx60SXawh+85
	UP2/uNmvcerxVgLnb6XUHVUzyRRxyjSoNAlvRKT6UI8YBjbmONpY4ACdnTYDHtNhw1bRvEQzsls
	izKR1MbI+3Ec9cvktG7rmjleUNW0nCgKeVcMvqGMlkwac3ulPHeKA+JbsbBDmhhHS8YRQrjaGcE
	J4=
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr11617618eec.22.1779918964504;
        Wed, 27 May 2026 14:56:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:ca8d:7a6a:7fd3:5948])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245f4e5sm14357429eec.28.2026.05.27.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:56:03 -0700 (PDT)
Date: Wed, 27 May 2026 14:56:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Update
 compatible to include model
Message-ID: <ahdoBl3qCTyvlYJf@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-2-0645122babdc@ixit.cz>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.55:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Queue-Id: 406275EA7E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Sat, May 23, 2026 at 11:45:35AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know the driver is reporting s3706b, introduce the compatible so we
> can more easily introduce quirks for weird touchscreen replacements in
> followup series.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 6b7378cf4d493..148164d456a5a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -475,17 +475,17 @@ bq27441_fg: bq27441-battery@55 {
>  	};
>  };
>  
>  &i2c12 {
>  	status = "okay";
>  	clock-frequency = <400000>;
>  
>  	synaptics-rmi4-i2c@20 {
> -		compatible = "syna,rmi4-i2c";
> +		compatible = "syna,rmi4-s3706b", "syna,rmi4-i2c";

So I believe we established that this device (s3706b) does not in fact
implement rmi4 protocol properly. Why do we have "syna,rmi4-i2c" as a
fallback? Shouldn't it be just "syna,rmi4-s3706b"?

Thanks.

-- 
Dmitry

