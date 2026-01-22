Return-Path: <linux-arm-msm+bounces-90117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLJAM/3ScWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:34:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC5628B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90CF43E8A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F491329E7B;
	Thu, 22 Jan 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYf6SCw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD0480DC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067054; cv=none; b=twEPGHht9dtE2VEB4wmOo1r6KWdfNtNzLeqTFjh/Mgfk+KyxfVxVfJvTP2vZoivRJSRrq0/N2avQ3yzGrL0O82oFYgbyaEM1A03UhOVGqddtMhw2U14aR9SZFTFZfbeYU9QQ/MLvokS8F68DSxPGpXyStSYIKEijKEJA2mZjzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067054; c=relaxed/simple;
	bh=T5Ypnsa8MDyjO6Qva3bXjXTqLSMQHaoYz1VAssYf91E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqjgGX1dPm0zDAHrxS5FWZtxuHrCgeIyLaXfLYuDWbV7tETPV3AJb3u8r/u6RppvCTp47HLQhLqJVoGkQ474W3LcR3oouu5k4UuISvF3+pe69u3jM18seiaNE3MXnyvHGp850LngSG0G/IZ6M3/NLlduwZEkihQRWcif2CYeExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYf6SCw8; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c633984fbeeso149656a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769067043; x=1769671843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wrrxa96BIhGWswpl4TJ5U5hpH5KQregyz3Avx8gNFGU=;
        b=VYf6SCw8wZVjUwQCfVyiIm3JgGDG6VywiMgoQDQfIJmwJ6fPY3lanmsB4AosRcgRYN
         GlNNNhcsr5vnv1gFFPr0oinuSvDWXkXusZV2/s2zZL0v2/k3EOOehhZC/3je6IpFF7+T
         qsUY3pY2RtP85Ws/NO7ozno4p0pz9Fpao3QybupZBhbzK2iHR8qPt3aEnOlwlrVjIbvm
         SkiC34cdcBBGeB5iURiziQxJ3FMb2acbABt8jby+j7VFYEzEX9K12SkLiJA1wKRBs68i
         5+GPp2/S329gXbb2N2Yac+G1iJq8MIDdRvF2ZDAe6YVsD5OWhL7G8Ymdc9EAH5XbTUhQ
         i54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067043; x=1769671843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrrxa96BIhGWswpl4TJ5U5hpH5KQregyz3Avx8gNFGU=;
        b=TUjlfgrwS80qPuIB5ZeHuRvxLFYlyvAuay2wJevkTlBmot0Hrn+0VlyOq0vttPrB/c
         uZD4RVxT6L3wLBWSBIse6qzEjoR4bQdoOX4cFpLaISiRcDmnHaU/yafWg+fcWhs6fTvt
         Dv4Y572DuyamW9q15yuQ6hpeJvjfjQ42YL9VZx5ubpj8G04zHASOEvReOqFnera7ICIp
         xu+bwtLx8Pf6nVimIq92kmDKOGvDYmIZza0MtPJ/ENAueEZlGys53hHNXgUEHXfN3CEx
         SaR0eKW5hsoaueMi9IapRLEXWKiWLe8skw31JNZpLGIIE05gKv/edQBi2agBfaSSWscN
         YmJg==
X-Forwarded-Encrypted: i=1; AJvYcCWyG5atPlWR9ca2obeNXDeVc6iNuE5v3dkcNWVY/Lz7dEpG/oL6B3vO7MGv+uIf2KQSqR+oX/IvklNgmYKw@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7SEroN8CpJoIooIiTyCBXDOosMLHZmhbooQt42AEH82oBeoB
	BCJzO7RnJFbAOMpN0P8GFYRHzwfGoHZqHrBN9FJmc87lj8vV9nUkiRhyl38Txl6Hmis=
X-Gm-Gg: AZuq6aJEjdldmMR+II+LFRVwza04317wfLdyqA3S9+A2gqZ78m+t6heM6zyEz9yQuhV
	/blKZ36Ts61FGNYBds7iw7eKBcAIqCI3g3APpJOXqrDMw42EyySKst48CAHbsLBO2cCTbjALMSD
	AxeTsGArsZP5H85KFa9GlpFrJjYYq3DasmPpLx/cVqfrlE9wAUJgShyCB18iI1H9nP6jOp+PBf/
	JA3Fxz1wVK/Sb8SWFrKo2d/L/GDStErsqtN2aK1c2z2VfqBGKDi3ucICQyHuI7RM+QEZDXGHW1E
	mW0040HIM2E1dv/3yTjVi8lSxC4vIFHlml055/UxjQ1FnyqoGdpVjNDfV1DJ++I2s7WWxRd0w6H
	r4P9kcsD5PcK2EUOIEpqbcKDjN/qALcHilyvYjC2/mc9CeO5dNcv7h8U7CK6Xqb6sktfXT5jymR
	BBcWA1XLheHI8=
X-Received: by 2002:a17:902:fc85:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a7d2f9861fmr18379145ad.22.1769067042469;
        Wed, 21 Jan 2026 23:30:42 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a76c5f4fb0sm68311145ad.45.2026.01.21.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:41 -0800 (PST)
Date: Thu, 22 Jan 2026 13:00:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, xiaopeitux@foxmail.com
Cc: konrad.dybcio@oss.qualcomm.com, ilia.lin@kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v2] cpufreq: qcom-nvmem: add sentinel to
 qcom_cpufreq_ipq806x_match_list
Message-ID: <6kykizeqega4wsps25katcdhsavr2ktbbcn3clbgkdqgip2k4u@azxr5ryitlkv>
References: <tencent_E072C90BFC84600EC8B529829AFB81CA0105@qq.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E072C90BFC84600EC8B529829AFB81CA0105@qq.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90117-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,foxmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 76BC5628B3
X-Rspamd-Action: no action

On 22-01-26, 09:44, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> The of_device_id table is expected to be NULL-terminated. Without the
> sentinel, the traversal of the array can lead to out-of-bound access,
> causing undefined behavior.
> 
> This adds the missing sentinel to the qcom_cpufreq_ipq806x_match_list
> array.
> 
> Fixes: 58f5d39d5ed8 ("cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
> changlog in v2:
> Remove the extra commas
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 81e16b5a0245..b8081acba928 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -263,6 +263,7 @@ static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] __maybe_unuse
>  	{ .compatible = "qcom,ipq8066", .data = (const void *)QCOM_ID_IPQ8066 },
>  	{ .compatible = "qcom,ipq8068", .data = (const void *)QCOM_ID_IPQ8068 },
>  	{ .compatible = "qcom,ipq8069", .data = (const void *)QCOM_ID_IPQ8069 },
> +	{ /* sentinel */ }
>  };
>  
>  static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Rafael, can you take this directly for rc7 ?

-- 
viresh

