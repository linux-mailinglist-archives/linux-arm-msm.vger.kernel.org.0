Return-Path: <linux-arm-msm+bounces-108025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id swPoJ3mSCWqqgAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 12:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93F5605DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 12:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D90B3009171
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 10:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474A6359703;
	Sun, 17 May 2026 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hnrt663T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BD348866
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012214; cv=none; b=oABSpo8RTLDlOsuOosv8GF6YEq+ikuiqjvI2batREEah2IkU3+nwUJPw8VUudu6tZEfGqCjePmkhU4pAkFH2ztO4twROfasW0Bse9foLSQQswgC++d9XQ90at0ljtCpEasnJUigOMbgWZvS1A4uyZB3smP4LLrWm+m0eVvmqEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012214; c=relaxed/simple;
	bh=wRYzGWjG8dBvrWtvJU/3v9tpJifFQCAuIqQW+hGZzJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+U2OH6YkAnOc/HWOSspupCqL1lefTAud8fntNKabG8lBSIBcnnKO18IPRd2Do/L9H/jjuiTtAFmKhGLLffvGdjulVjxnwTAncon/gQIwdwxCKQ6SYR+Q5MwS3p+lTmykyfms2uHPt1FcVQeGW3+0kuqrCkWv2+T4uEkepTNOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hnrt663T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso6839735e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012211; x=1779617011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApHfTFbhl3QFfnWcwbX+8pHiF4xUgjHFERxKjqe61ao=;
        b=Hnrt663Tpo4iIs+i2bGUz+6N+zLM5Axg+cPCpbkQzpefe1cgS4CihZZzd3/q7DYndI
         +pCTdNvEBwggDt8Be2G/yBz3Na/fxMsdX5LRZ6U5NT069j7YXdo5uV5605QWc4Sc8ajd
         d+aJvnX7ul/89Tw7Qk8ql0AGBcYYcL+tsnC+B54l0U+1JEOLkDRYtHhpk5c4dLwJGtTG
         2fi00BbPw605vCN5kHJO55dJJQjGzsZuTroHXXvLK7aFCMGCLFzUAL/vNMDfHap9NpM5
         rvY0G4OQSJVzbJIQ2p1gmnqPzCZtHQ2dQcITojmEkWDhXtlxb6cVe7+HzqwmxVlMUrSh
         5OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012211; x=1779617011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApHfTFbhl3QFfnWcwbX+8pHiF4xUgjHFERxKjqe61ao=;
        b=GT3JcrEOgrmcejCV10GbVKmvojRolnWyK39HwO9bsGW8SrDGCG0w79av6IE6WoECZL
         L4amB3AwSgP8brrb8WOKHi2oZdi6WuCBvbL8q90pupM80xhi1deLMlxFszk5U3lGORh6
         vVglV3yHX2FKkU3ZKJO8HJJRRAc7S6xOWLZRw/6TCCyweq6gckXR7eZ3IutsisikY5Hp
         Ht6Vruk7mhHYZUX+jEhqqH5hqgQRGTtwLUkWlZo7K49DdlCMMw6E5GP+XysUzl86L4uY
         2Ml1pCJsXgowaxYh0wPaNOjAo15gVMN5lOjTQFSiKkDMv/qXQ+1WEO3BQMJY/pxSfgWx
         EHFw==
X-Gm-Message-State: AOJu0Yzf4VdVka+98qj5ssesfIdT3FPif8jiUp5I0ZkjETI0WIuhmGrQ
	P4p01OP7+SkkGuDXjRBd1he8ICQwWUzIQVmYrylUfTZfOvyUq9+Eyec=
X-Gm-Gg: Acq92OHaJpJ6v3vSgHM2HIy/QmG6jJEI6XRGAKEr1UQ/K68FXSs2kjyGsRgRfOkiomz
	KFDsZkYExQ+QwICZBW/B2W3WthH7qLDDOoAmhMjNY+cqPHuGzpy2eJ7bpraOLDBg9eLeGJ19o6r
	e2BhG1UywvlOieTunV2NntQnJni4NbMF1OLNefo58kGqSOIZ8NAATQKopeXDuNZQ/+jTawrXsPN
	rLyxNvCnWzNHcQwMRVrzR+GBFAwa2C3K9kHCPSIT4IYOj0qkKROYC08bH+WANWZvXzP95kXFsfx
	0C5mwdVF+Us8Y6/6SBQ8nC1NO1oHbtCH7efhhjzjXjLA3WhWhTx1W/FlhfnyfmXt3/6OdrtDHRf
	y346hmgwicScJCP47KZOdajxj+EClPGd5e6SOGOI27347OAssoso1iW41hnJvS0pqkYJ/5by1qq
	OqtA29+zPqJdFVyqtWa26RAdllaqaUgHgc3lBsHeVp72BejDzrKdKI+phIk6RJOPQyJLmdBQMc4
	04kuP4DAreXZQcz2hZsNGaPFENlhx5Eawiv8pO54sxCyrfiwsMxaKy42uNDE7hqhyoAfw==
X-Received: by 2002:a05:600c:a11c:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48fe5fd483amr118437485e9.3.1779012210838;
        Sun, 17 May 2026 03:03:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab773sm193374575e9.3.2026.05.17.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 03:03:30 -0700 (PDT)
Message-ID: <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Date: Sun, 17 May 2026 12:03:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3B93F5605DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.57 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108025-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 6/9/25 22:53, Jens Glathe wrote:
> The usb0 port didn't switch to dp altmode, investigation into DSDT
> UCS0 device resulted into GPIO 100.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Tested:by: Jérome de Bretagne <jerome.debretagne@gmail.com>

The same issue was impacting the other sc8280xp-based model from
Microsoft, which is sharing an almost identical board:

The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
working on the Surface Pro 9 5G (arcata) either.

Switching to GPIO 100 fixed the issue on arcata as well, to finally.
enable external screen when using the left-side top USB-C port. I
will send the fix for the Surface Pro 9 5G as part of a series
fixing various issues and limitations in its initial device tree.

Thank you,
Jérôme


