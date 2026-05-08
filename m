Return-Path: <linux-arm-msm+bounces-106649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCoSOo+//WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:48:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A44F5434
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DDC03039C95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DF27083C;
	Fri,  8 May 2026 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRJv0tnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A11FDA61
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237163; cv=none; b=iDzFA02TtbNc4UvqXD84+oP7tf8F4WM/DcKII6La1TQSl9vErQN5hhQ49xVKZvG0iiVOgpDL/7Ku9sChCZccPN7hJ2DSr41dhmSKT3d2LAoRZK2mYoXOOE1pjK7rkBGUJSsEcWDS5LGmB8j5QMYNrWKuNcHPyFBqM4yejlWluDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237163; c=relaxed/simple;
	bh=LaqsU+HZ7CHIVovwL8Ig8BXz2wdY0ZmLbnAwBHpQ6qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTICg/f50sPJjXudGBPWvI0x986sQmyj0vToPwxsdj4Sl9ZDdnLmylDD9r+NnBtKZn/ePGqK7MB8vapznwjYm/UfcYrfigrty5aTTLPXo1T7XP1sI849b0l2XrzpB3O+VM7l3zsyrXcqadqlSzhdPxf2BC1OqKNo55tm0rmKDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRJv0tnX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e8232b28dso2117821fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778237161; x=1778841961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XafNOw0YwX+rd6WDZaFCoyodLaJfPwidN6Ns/nppWrU=;
        b=RRJv0tnXU5LSm6EpVZB9R5U124dTrSAVbtIgNcuaj44BcvLwpzUZAvIgVW+dmzKoGy
         kJoc9vVoFgYjDuxSAt5e7f0CiGTDLCit/BqgOnacSO2/aUwBiEOeVfjkFIlaN9sVuWBU
         vGoRYjm665rYOUjxtzgDFtcqlZlZKONncSiQfZrqmOrXViikDFoeXCL0QArZVwbHqA/q
         P0L9kC8VydXzIp/XwICBEdwYZe66yXVfNzw9RZhjHbT2+/e6deq+ly0DwJdmjwYFAc+m
         JckYtfMWGgpx6K+ya9q+/IXzHY/Y11DIcRGt2IR0+LEJxi60s2Qwp+O2RkF0c7NixE9w
         Ynzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237161; x=1778841961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XafNOw0YwX+rd6WDZaFCoyodLaJfPwidN6Ns/nppWrU=;
        b=LtdOburflapAe6j24a42/1iBJNeRtmT+OE08lBjt17x0FVxWFq6rWc0GQsC55MNuO5
         zLcQFttLpS5VCRng8rCubvwBaarfKmBdk/HkJVy7EyhLXZ+AAO5xou48+TKrxQMohehi
         o/lKxsEd2dYCr//UXZp6CSPMNcFdAHluPaQHhZnr2luH08FFqA7AGOTMUD7IMpWN2+S6
         UNpQBtsksZjr1TxMPwi5NBpxOVqpudoSyhsX4+D4cbVLmU9sjSyF+6vCYYhWYupymSEL
         j1o7YOWMEMpuN984isJzoXUfhUfP+MuMX8sIYPhQk97hRJDdtdKdzK0ZRYaugrpOVxDi
         q2lQ==
X-Gm-Message-State: AOJu0Yz5Z5MbvML+xu9CjUggr0X5Kn4Dh65OyGJF+C2WDNy5/aK1s47U
	GVrEKqZ7GUHKw4MjX22vjkyMW4FOSNI88dSJsB+FHfr/ZdI8NB+nXgPvxT3WIyfILbM=
X-Gm-Gg: Acq92OHJIUMz/rrohr8O2oslRw9dxvXzLGFFLBlzTVkb3gwJu9jjKxI8ePrPmIGSXwr
	GDdW4AM8MuCGmFBOTllUzmWmood5mBQT0eQ8Hwn4CpWDGhR63kJIFic4b0Jfag7IQNsy3ZiK8Uy
	/kslKUYDwK+GpRy+qygzGObugjI21/9mN0gux3C4sSsZc4WPpYY+6rXM35i5RwPeN99I5C1C/Ui
	rdAim1KfLec777e0DFZmfvAHJKuQyt1QBDMYrnPGBz1RfVOJHqrDLZt5y2RXVEM2tIRqyGrOnPk
	Mj82CTykeku059yE9ua8iqSRAwpPpRYS2Q9Tqv5Kk1gr2Z3Z4q21KLJ/B+OJ65d40ZRRHkKadoj
	prHBGxVvh+w1kfNfBtgeKQ1syuV9P4Pv6labKS/d7TdbO9axKUUZRvOG/Fd6Cq1acri7W6yXPh/
	PdWrrcfjzHStmVV76jZe4shCjW24T8hZ+pA6faHD0prmpQ7Kym5GNUh5jFJLS+OBkXs7BmRx8ao
	Tf0+w==
X-Received: by 2002:a05:6512:3d93:b0:5a7:4048:af21 with SMTP id 2adb3069b0e04-5a887ced024mr1959239e87.7.1778237160560;
        Fri, 08 May 2026 03:46:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfbfsm409718e87.46.2026.05.08.03.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:46:00 -0700 (PDT)
Message-ID: <12d6054c-5f77-4ae1-b8ee-77cec2038693@linaro.org>
Date: Fri, 8 May 2026 13:45:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add camss node
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 467A44F5434
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106649-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On 5/8/26 11:36, Hangxiang Ma wrote:
> Add node for the Kaanapali camera subsystem.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

