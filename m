Return-Path: <linux-arm-msm+bounces-104841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILguJtLb72kiHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:57:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5347AFC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B396301AD37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF442F9D85;
	Mon, 27 Apr 2026 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMyQxbao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F7F379EDF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327055; cv=none; b=OhB/ddKPEbfpCo7Ylc33V2GSHtxCR8dB6awKuY6/AEs8mSNXr2oinyaT/SfCEC1JiyJnnOmnvvqHCU36TQC5kgnb1QCNXDDqExvQOV7e5PW1fHXuToE5/dAmbFTXKBPr3P/u+q7ovghOdqt74sgdMnlzlRyGuEE9P6+RcR0NhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327055; c=relaxed/simple;
	bh=OFgtGCn1mfUaoCP8LhdAyM8uQwb3Te8gLBE/Ti+VRMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWz0QjGlhOqNCLYRFxy8PgYNH+1f5TsqFq2TN3zPSGJ7RGGZ8T7xwZdcUevz4LWEfALf6Pn0NL33scRmJ3DLc7Q3fz4F4oxsOVS+TIDOdH74dDY5muYe/tMKiDTfvfcf675Jz5PGNch564z5rcp7SmVrtWYj2rbvi+DAjS8dd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMyQxbao; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so77462505e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777327053; x=1777931853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=sMyQxbaoFGJX/irParUdWhOOocCeUXvxFueNP6tsUkKMDA09z0L27fpY339j5ZCWOJ
         eVzCjDzD7vnD2t2iCuSoLzQnv8USvbSt3L5MxtOEvVMMsKRrHEN7CIJ7Ulxt3yKHD9rU
         ztw18e5W+kSqQHS/HYUdoXTEBfEYL5cNNw50k/MGVAFE2645Bh6ZHm8MLFtuOZPFXKs2
         K8cp10m4Ix5aYnNASAg3qCMpay1gY4706zIWd6QX752KDNbqy1i0ZvFqGRtaPrll93QD
         gr9BHek6wJpEQzL+mHVhiOaVsUl6npQ8cQJpWbOeGOtPrZG87br/DgVk19I4KrDSDGtY
         eTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327053; x=1777931853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=gEgc3LGcmHWvW0RrOx3nWeWHJPwViEy+z0nqrMSCilu188DO9FJh/+goXQHcPOikYL
         Xp4lS/DMuOAk2Qwwv9oRPWBbDVeZY62i0XbYolqSQzYbuyjId51IfFmhjFLrd/785rad
         39XVzreP/RznKZi3nvHd4Yuu/zPgYVwWdL0m3DVyUPxkr1BP+nIOG1iL3q1ZHdau9oxj
         W7jnp2IFgjV3BYch61SzhmooMX0DwxEoePtsTG1xyNrVtnOhj2nrcAxslsgFllrr/3+y
         XUAwnA6DtdjfrJP5t+8isJBzOfex6zh8eYgTSH8MDr1yNmXdCLd4++uR+eGoG/y6ZSP+
         CYcg==
X-Forwarded-Encrypted: i=1; AFNElJ8Z17dF+9oLUG8cuni+Sh/Jm8li+ZlafR2I7Sky219b+GFRmMR+2pbl0L/oivNtfWAca7pmThDSHPizpy6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwEs51pw1Lbj7ucbI1pFpubc8W1BfRVvG2nZc1WXP/WGLDHGRkp
	+kNpDKHge79pvwWfBDenN2g0IjitnhcWN4fKLEliUp+nSxkFtPB5BRAnOFYUXFbbUE4=
X-Gm-Gg: AeBDieuzLcUgP5WPnXqMoSdyI5AMavgzI1Z/CDdLJl4rYczmQL/pvWUnZNagIXs6f5y
	UphFZ77IKYonO06eDm8HPHy1jQxzaQFaKkBEM+QgJfC17RzfpzeixlnFbwVSwr6PquXqcfFxz5n
	QknLSb8KtbtIhQTxlWE+Nz+GPB0srfzDv+HqHUN7Dl/T+Uh0+91hSwdApXXnqGJAJz4p0WpEq+C
	3LAfAuSxOHUZegNf4O7Dq4zddBZl/OXJUMEer18/pWOpZNWEqRK3o+XTIZwaXzJIAPe0WrcxDYi
	cBC1njrrUuwhKZChH3cP7buIAcSeWdP+OiKKFcVhDlSLRYej9GnBbTZJNmouPCb6TU54fVWI+W0
	lMYTo2XDHbVRnwxZcX5Jff+HMmBXhlHMzW7vXRcZF7rwHgnH/Ue5W+9kkk2SmEmvktQLMvZBLyR
	lb+nJzdB/F1cyxo7LZVCDAMP6jgstf4xSJmi1ve1wu9vtAgqR2N0hFsQ==
X-Received: by 2002:a05:600c:4f0b:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a77ae6477mr5384895e9.9.1777327052826;
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Received: from [10.156.67.45] ([89.101.53.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77609a82sm3993585e9.36.2026.04.27.14.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Message-ID: <1b914585-4c27-4f4d-8264-181340c27791@linaro.org>
Date: Mon, 27 Apr 2026 22:57:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EBA5347AFC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104841-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]

On 27/04/2026 13:43, Loic Poulain wrote:
> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

So I published a comprehensive list of these structures a few days ago.

https://lore.kernel.org/linux-media/20260426000418.1158716-1-bryan.odonoghue@linaro.org/T/#u

See:

struct camss_params_wb_gain - White balance gains and offsets

The ICP/HFI structures - at least for the stats I believe are how 
hardware writes data to memory.

OTOH on the way in, the params ought to be pretty uniform as again 
HFI/ICP needs to take that representation and either

- Hand it over to CDM or
- Pass it over HFI so that ICP can hand it over to CDM

The ordering and precision is a resolved thing. I'm ~ sure OPE must 
write and consume in the same format.

---
bod

