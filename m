Return-Path: <linux-arm-msm+bounces-108297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGbLACWOC2p1IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:09:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 743815744E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 00:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C6FA302D192
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 22:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4713A6F11;
	Mon, 18 May 2026 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eK3sTkB0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9A3A1681
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142173; cv=none; b=SynnEMWuryuL1NHIgHH+1dtS8OGgKSQ0ycKNh70YDLMcItOxHOhS/hxvAdLS13z10qnM2KsyOpvrOz2NNydjyQ/8PFdBD28CH3UlXkIR2TNCnpQttetZPb1h+8jhLq2BtC80fLZOXYd+kmZ7sPA7/KnULf0BpggldOHlgL86BJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142173; c=relaxed/simple;
	bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JNwgD9Hbll2j17lDKU6dsIbpPT8vVG4sXEAMZfUYiTxiTQNJ1TJeD3HAlFvoJdJ19V6r/1YWyemJTJm1w8i1fF5u3pvGNaNI9euLvqB8Ob2Hy20FIHejqgFqXZ78qyrBSE+EkKEYFtl49jDvy5YRPP5+jURTa0enSUFtajeNsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eK3sTkB0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1569153f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142170; x=1779746970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=eK3sTkB0sKSAzuCtT4Z7dWAH5fCV3TYyKfBmnnUCiZtCfy4nNpGEJX3Z3rwBhIhF4n
         /Mzv9ZOmwfAWqiHbBGXRd3RGonI51Vht+OFix6aRPU47gZZgfxYEyRO6ZoWc9osT/OPy
         noLDcT74HnlSm4Cyr+CcwNZJBm+KCLhJl8uVQGkVSs7rwN7O66GTV2oOVBT/FivLqRca
         rty/be4/21VTvr9BpvhoNWud4JwJyRVD0dovjpEcvveIxIMuFwZW3oiu+JNec3crO31P
         e2nCNAxzS6eL2e/Fy1MT835XM9hd36eBNtdZ/hiRLC961nGlYYQCYnZ1ewxtWoarYUQ2
         xijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142170; x=1779746970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=Z9owzYPRMrK+T/CAIBna94WWgeHKsw1HV+X8jUJz3zuoI1Mt8a1omsVDZ8bj0X88Ed
         FrDbDLfF0yXVC5PeRwUkx6rAYAw1U+PTu4ZaVemXq9CCNUvrAtA7f2UkzRwfjPLwHrns
         ltNeAtuk8g3CyKTA766/Hz/hEMfcj+1NdpExVI7SBWjfDLlXEXzlK0M/n/fjSCSPF8ai
         8QgZ9TaEPxQ01Haafz8nWPuervTjvGDkVb6vC3in36DLbtudWrKnOhZFxLA8b6cqRGZc
         BdJ8/+LwXysdwdOqamStty50d/8ptkUhlFSh8mVo8YE8tO7xdQlqFZwxR4iipcu/i2hP
         NnOw==
X-Gm-Message-State: AOJu0YzsSlwAI4e+gpWMdJ4Z4cG1pm0u5zukT6WDRfKvQvrJf3HlUXrY
	B+ERQGtV/Q+9GSTuVh8mBxW88cpyvAP00QOMxYWDAFSgxsHdma4mCqWe2yHESuvbZ0M=
X-Gm-Gg: Acq92OEhIXMB6IYLoDdJ2JstBSfb9p3hI5IYwumWf+ZMz50+SB7lSbuXWEIoEBEOtYv
	neH1icr5gMVo0kKCkmzPGSzlcbOlGz+rvuivBN+Yy+aQT7hQ3n7d0UkOiN7lcEqFOiEaAn75eoB
	sVJv8zkpPZRdA0ya5tRn5GLwpQ+lj2Iuq3USotnBiq1QarXpay3sYqiFlyF8MotzStFNEQD3e52
	re1eAlK8LvKFAo1l4LFWIm2oBL9kB6J61MgGHkxie3DobVquNRrskIe0tQ0fuXh1FFa+CTFuNEJ
	6GugIwqZbr+ogo0dmG8Fh2frE7UVf87WIJmLse4iiUmrt2e1e9YVrnQ+tPt/SuW10QGhfd29dHn
	2N2rkaYLAnRGxPR13e11G2Q9hchZHbDS2TNgF57wLhcAJZTwKQysHApJlzewfT8LCWxGnrLmY2p
	ygGZtOPMC2nyPgDgaY4xDSsauIR4M7ILzij/+3YDHWZn0=
X-Received: by 2002:a05:600c:4e02:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48fe5fdb076mr267945245e9.10.1779142170621;
        Mon, 18 May 2026 15:09:30 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00bbe4sm91333105e9.12.2026.05.18.15.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:09:29 -0700 (PDT)
Message-ID: <c1b0347e-0f90-422a-93d1-eb1122de2292@linaro.org>
Date: Mon, 18 May 2026 23:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
 <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Language: en-US
In-Reply-To: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108297-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org,fairphone.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 743815744E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 23:07, Bryan O'Donoghue wrote:
> along side the pmi8998 logic.

*pm8150b

---
bod

