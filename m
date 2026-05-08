Return-Path: <linux-arm-msm+bounces-106637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEdQEsC9/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A05B4F51FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E7D93010822
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145443D333D;
	Fri,  8 May 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXP8nR4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD43D3337
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236856; cv=none; b=t2v1Ngr4tcdiaKATGdss5egOU0hD4yZAEr9sX2Xqq74trmGXJqggqLAEp1bMLvtNEDVr7JP7BHNe5wb25rJ0G2bJxtxDPEsupbWnQpHBqajgYr/qZc2Q237fMYrLrrvit6yhohIQWUbY7A1ozPPBAVBpyU6qzUbfPZSi7W997CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236856; c=relaxed/simple;
	bh=a3lizhhXI1MG3yfM1RiHnRP8myZIypv9M2m67o913yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et5JRdvoz+pSqmUEaSsYYsQNmh3tP7JTtpBLdSZR9+a6SoHDEpZEorkxZzWdsWDRkxXKKVmOmjM5n9rQkl+o6PKpX+cjvSCr0R6qrunE/XSWnCo2hJNHI9dYfOmUxXk8t9gvWsF4jA2P7U2orWFk9VlLVBOqM+RFjawYaLuNDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXP8nR4H; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a875ca312eso68325e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778236851; x=1778841651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEkF3pc9bhfhCarf9YxEykAlIQMDnou3BooF7anlTP8=;
        b=KXP8nR4HJOK+h0PfJrwU2lJVPMGIhwrcZehGSmceJrktvSzO68PRNahBuufWl3X3sw
         BGq6xhqRc5c4bF6J9QOf7Vs0syLf+/a1KKuvUuytpN/f4GegsPtOVKBq12ZQFJYdsww4
         +IuE8bShCBFiY+bb9mbNOKqWRT7CJ92xw9jFjIsS6BCFEd9/bczSYANk8MhFn4X2vPPK
         cSNL/0QRcjNYSf6VggNoD5ghyMI7k5V3n19MUgRpOOfYbnHObls4SyQeCuZh6Lk3QgpB
         h0kew+w3w9TyDwl99SaIzvgKgV0SYZ0C84ft7O2FhxMSWZB2J8NCK52IVTZJ1Q6mQBeP
         /45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236851; x=1778841651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEkF3pc9bhfhCarf9YxEykAlIQMDnou3BooF7anlTP8=;
        b=EWp3eep7R8pmdypYT2Z0BWXN2sIeS2o9Nks3Li1PvDhAipZTYdQsIjZguT5L7y+T0L
         BDnJ9uJFO1H7e5Gb5c3N/gBFMA8GxIISIyuLcFtYWHcRcr+o+9OuUmgf2PQKHaKMKhCE
         b1Y+A54sfF1ybfLJR0Esu1UOfJN1ChzxOYH5KQGVjjf/qjV2zfp0lD7OO9XChVhs1oRU
         dsPvVEpVQLbTCMhqK+NwHCG5yS//U2fgtRm5A8JGy0iauQ0qTrFDO5ssfbKf/yEGgleB
         6qkhCqK+eBWjHk8PhAaNx2ULZBNULrKzDmiy7JIkMAWjZ7g//WgBp4I2BL1yqplTOb9v
         NP9w==
X-Gm-Message-State: AOJu0YzEl8aw1mwFBfYz6xsSfq+25kUKF2MZWrZPIBOv40MPqQpPGMSN
	kH+McKqK3YHobGnEr3H1Xm6gVB8NM/B4nVB7J6aKk/mx6YCeKkVX4MJfx+HWRGC6dCY=
X-Gm-Gg: Acq92OGd0W5rIMAo2e1gSbJTyr10LxQRrrLJzWfIsQmn23tiO51hU4CVPcUR363V44Y
	d2FmD+vqWRrUJfXmtAQKx4t3bY9aQA6cXG5bhRgVur/+qOTyAghQeGvxCe0ssWsjCRpZWM5mSpi
	j1OXMniB0mkQ2sS2UDts6Y0yqznKZ3C9gQDq5vjTyHZDxC3vJQDefYUInuWffWu72ugPZMUoP3a
	mL7y0EERQNZrXgwdllZo8xXx3TO0K7SFHjGJm1jKuwER4CQjs0qQ+vAwmPkMNPJrfALg1SFfIjG
	06d+ze3O5znF6i1bivsNN0WanIMXb85WnYLiaMnOX5XoS/sLnmX2FFf/3sq4TgFiSM3IOnJiwgz
	EKJd0UCvK4Wd8sgA9wb0NKfn8wIkJmyG9l267XiLrPk054u+/fjHA/vUpUB4xaNGSU46/NwMx6d
	1CCcr41YgBtNwr5tVF31yQBAM2YpVXIz5sEkH2/YHH4thhEHmBJFSFHyQIdW+lAU4WOJ2UYxaBI
	KTGng==
X-Received: by 2002:a05:6512:3e0a:b0:5a4:a67:fb6c with SMTP id 2adb3069b0e04-5a88853f56cmr2037006e87.5.1778236851277;
        Fri, 08 May 2026 03:40:51 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm418262e87.25.2026.05.08.03.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:40:50 -0700 (PDT)
Message-ID: <4c6dc418-a778-4e14-a57c-249c8350875c@linaro.org>
Date: Fri, 8 May 2026 13:40:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4A05B4F51FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106637-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/26 11:36, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

