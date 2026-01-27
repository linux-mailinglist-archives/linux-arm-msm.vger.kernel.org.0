Return-Path: <linux-arm-msm+bounces-90790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEU1DYLLeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:28:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD795A7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DD8B300B479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9334735CB72;
	Tue, 27 Jan 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvFMQJ4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7435C1BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524078; cv=pass; b=jcc3Occ4+QNNBsaO6wr6pLnMEUIwFrcr2zox5I/+RVphat1hyiMIrGb5xqoT3qOn2nsVTFLgCfLYCZY86/L44qecce4T3zV2T6k+T/OFRfT+4cNVnb8MfHcHi7SFs65G53OYwdAYB0hhQbV48ovprxBqTtnglEQ8wH5sRMYaq8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524078; c=relaxed/simple;
	bh=SYsG+RVz9eLQyTlia9fufMVAFPXhbhQ57zjotGeFv0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0zQP3z7SrMXtmzUlr+6BsdRjDKQPzpud+2oDOYezZUCFywKVKafv+Rq6Pz8+pfPgY3qfbcxma0NiKTj0HKxcCnWQZWGYYbvCc/9LvMg37QNnYCW9lm+42xTzozNCr2k25qoAudXA1mlL1iPwdfP3NSb8Uj03ScSMDgTgdMjvrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvFMQJ4g; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382f9930e54so54299341fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524075; cv=none;
        d=google.com; s=arc-20240605;
        b=JGAyG9rlEQgi+3D8laV1OotgQGHEL5kxj/YhrJAtVnkOVGAs52piBl6SVfYWTm7EsF
         kMJ3n/NjkclM1BCz1o7MutCZ7+WGXC84VSpjGrvf1oJxRfcrJMmjEen0QW5ipQQssZbT
         6LXxtYskBZHQO5cOlt0KbTZBStcKDIMRe9aSGL15CRBId2z9Fk4Y3qM10uM9L0JUKxBJ
         5V7JfDGbYS89px/IdQ9tP2X9J4rHltSYP1A6dv5M9Q4Ea75JHX+qBXeC0SvEFLsfyOxS
         ndIfrdeMyBZSXYQM5kB13B1bTP8W4kqy3wguMdKnQggHIJC9OZdR7S3JEx18e7zOdjuj
         vYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bixFc51zHggwjEg6bYco2p0W03PflnDZlTMDYcdiHMM=;
        fh=kHlk6/JrWQCtdvcooh9LngZPa/aqpuNOs9ue+TNjwXA=;
        b=IK7fI0iOpzh3lGHqQ4uKo7vCFlmvptvviOZeQg3QJhEemc2LXYeqbnDccKUfYa0FOt
         baF25eoeyFhDr69rdAQ0eF6VyS6dksfvMoAFzGA7p9mlTxPOIme7FfgqpDQCNJcz1rFa
         fOGvSwdNBBoZCXSEli+9fP39upNbQQH4wpg+m7ugbm9OtmJSpgAmQEW/IhqdBC2Wba9s
         isFZWipks1S9j48CNjwAmVvZubQWfOWB1yQzQQedYS9z/aezxKBS6wemKv07i/qEjBIW
         /kKBKl2e838KJW+o3mvrsnQd0RTD8TCvINiSt8NZnquHxnx/HwIIeBmbO4fr5LLwKQz7
         0oIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524075; x=1770128875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bixFc51zHggwjEg6bYco2p0W03PflnDZlTMDYcdiHMM=;
        b=fvFMQJ4gfGi92gfwUD9WjZ9ub8d3SSmOuIZvWCzHJ0hCvUr6AI3JQHsJ5Esf/wrTzw
         5rAbQBYiKmb2AKNLrGr8SoUyWTUxVG1Bt0LienMEA3Lvm/Qm1YAxCmv4j2ugYHRgZzbY
         xH13Vr8O/s47CBEx8ej5cdjFIm/H/vj09DVJIel8i7n+sj9MmYj+FzRiLJa8dTyfDAKJ
         Eu1uADCvZueHENRA868ZGYffIaaKAXYmhj+zoSPyqIvH2FG3qAND+jciIjziOYUhIl8a
         G21BJkJkJpgSRm6EIHO76O0tmRQdF6d/ZZS5gxp8bIdR+wAXg1EwMTeNc/BNmMo4SYdX
         ssQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524075; x=1770128875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bixFc51zHggwjEg6bYco2p0W03PflnDZlTMDYcdiHMM=;
        b=fJg+aV8pyMdmTfahlqug84AoTPSEZDzCM9WwKn3hKAGQ7JHvgb9MTW7tVM+9DVG8+e
         4BDjuAincjIJUqGqU6NAiILsk8VjkvblP3mQdn6ruIMeciRyMz28HaMaoVRMOAf4FnpP
         +vFiqyZ3k/CxaSNg3M9vp0ApbGOlFMKofXDO2hxrnV3OuFs5PlWUwdlfao3R+kzRukmY
         t5rxPmg2TTVqGPOBYuIpg8wxZ5PBdtzzbMJAOMWFMqyaVv+FFeilXrVp5doYe6pbx5LZ
         HOQ0W/wM4enkVfABSEwi/GmQpnSm6tO/nqZj3rd42hlZznh7v5eq8GaabTeXHaRJ4ThG
         ynVw==
X-Gm-Message-State: AOJu0YwPL1Ms1+lbi2oM9WrPX7aFrItA3GYJuOoNLYwZ+fpe0Jg2gac9
	f+ypURJaKGiDJKhP+kZb87o7mDntv/+OKuoQAeT40d+q5mSVfqN/hg9kv2UNrxKdF+vXOO9X65A
	TJATgYX68l2ITNuxqp7vp4LfXI2dZ0I9felxmm/t199cDJcRJ0GLYicE=
X-Gm-Gg: AZuq6aIVwMy2Y9REWXmeYsyhtfuhX+6pH+HWHVHOaHfhPRsHfhpDAhdQ5bCO+qAG86M
	3s/82jX8bpPmkLMdV17QDmS7DQx9vxuua7PSXxDV3ajrPLvFSqzcsn+M4XvAsK24C1kqjMHgVnD
	H2uutktZ1bLXfPTsbW4ykre23CisDl1zN9XB4Zv9y5UaN3CK0Vx8C8uLoaC7yonqx1KbVo4c9ox
	zB1XExOD+8+p2UmAxZfAI1cx6jzPm9jbRwDiDaEsDpqk6KEYx/rKCAmFOjbw2J2MsFlaU6w
X-Received: by 2002:a05:6512:2312:b0:59c:bf32:26fb with SMTP id
 2adb3069b0e04-59e0401e3c4mr975834e87.2.1769524075019; Tue, 27 Jan 2026
 06:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-qcom-rpmpd-semicolon-v1-1-9bbdd9478ba8@gmail.com>
In-Reply-To: <20260121-qcom-rpmpd-semicolon-v1-1-9bbdd9478ba8@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:19 +0100
X-Gm-Features: AZwV_Qhnx3ee7nXtzcBaurlEhXjdnBHlTXVsUOF4f979GZrgQoW9map96vZbscs
Message-ID: <CAPDyKFpSaaiCwk6wHrygQCbtHaWJ7R8r_xNDpBWZNfbn1z0SCA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmpd: drop stray semicolon
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E9FD795A7B
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 at 17:18, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> Drop the unnecessary semicolon after the rpmpd_send_corner()
> function's declaration.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index f8580ec0f73785544aeb6f686438f39b477d134d..a7b311f966a04210dbb499066cd1105e2c621cd5 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c
> @@ -978,7 +978,7 @@ static int rpmpd_send_corner(struct rpmpd *pd, int state, unsigned int corner)
>
>         return qcom_rpm_smd_write(rpmpd_smd_rpm, state, pd->res_type, pd->res_id,
>                                   &req, sizeof(req));
> -};
> +}
>
>  static void to_active_sleep(struct rpmpd *pd, unsigned int corner,
>                             unsigned int *active, unsigned int *sleep)
>
> ---
> base-commit: 95fad101a21d31b4facd1b9e0713bba1c517db6e
> change-id: 20260121-qcom-rpmpd-semicolon-1f985a101e0b
>
> Best regards,
> --
> Gabor Juhos <j4g8y7@gmail.com>
>

