Return-Path: <linux-arm-msm+bounces-39237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C4E9DA05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 02:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88670B254DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 01:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38A2156CF;
	Wed, 27 Nov 2024 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/bnhy1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0578BFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 01:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671379; cv=none; b=DN8pWjrOM+ApnXaHkdxESLYRvk98f+R3kC9XOOaGbnygdg70cXEdeBMBJNW14Fa3UUSv6DLhKuuy1yS78ccfHO5LBaC2JPub95KftjJRJsElZEHr+Rhon2UcIZIl4dAGi/i9e3UdIcRYSAXr7VqyTymySEnV9S0j5KCyOSkh1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671379; c=relaxed/simple;
	bh=j/9n6Za9yhYCyRQjsfHUclnxN/mvHCeUHXHImWo7hGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs0uueaoPpuF4Ro1LX9ByXRvb2mceqeN5Fzeg4lOlaGizpWGCIPzYICLCPWlJQd+k2SyVI4SuJpe7Ieo8pVRORhZ5AjKDdCBhXzlPr0VcLZKZEdhUwBNFLGSS3FnqNwQ2H/nE5r/g55SlWBSVqFtUq+HxM4cFvT14nBQBGWwgng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/bnhy1F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-382423f4082so4520607f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 17:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732671376; x=1733276176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpOgem4g+ZZv/dbRraYyKDaj/RcJPybY/mGeK3o1lmo=;
        b=q/bnhy1Fla43jdxmLSbLEqb4x3VSf58mzPaMhJqp+qyC7NJnDzW9aM9oQt1dTZeJeM
         /fU0YejTdAJHHkVeCKjoT6P2CCtb5Bz4x3925pWXeiDYVOr3JMRLiflY9PE2HxM/YNdS
         JdCW3iwICtj2yAC1+hAh+7gIBak2kfbpX65TvZFg4eLbAbR38QqS7WKJqh9h1RcQWGcF
         4s5aFBork5AW4i6kjdkd2Cmo+9baabtour5TlZwuHi6+/cIhMCh7sEwYRl5NX0B2hx87
         VD/IVIEOoo3+OZkI1ewxzu4Cu6M7VLHfu3BcY0R/r9rq/ogO2FSPHBZj38+cDVDJzq0/
         SUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671376; x=1733276176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpOgem4g+ZZv/dbRraYyKDaj/RcJPybY/mGeK3o1lmo=;
        b=TAlJzu4C+XOUjxHKoPmuZawddhyYO5VO/UsoSofIh4StJ6pUPwy/epMi224OnEdcU2
         HxlzmXvfPNU163b4+mSelaEnUrKgOSWCRViL5PnXt1TuoCCIeJMZmxnUULbdCSifnjSw
         ROOkMmKi5vmVdt3aG3NdeiYBtr/0ZyjRjbpmiG9k0no1LsbG0rwRRvoiKosmoz8KYrNd
         cjm9WGQFQZ2v7Ehgmzzw7KiMPoeGIxcJW/jWR9uv/jCtntMZ+rggB1IlHjOJQIRznvBn
         GI5bjKGI2EE1T87qYyq7xLpwZHYc571amgq8GUaXw62ML3hrxd5pVWIVPwyEz5XLhtSB
         5eyA==
X-Forwarded-Encrypted: i=1; AJvYcCXUWwe2W6w71qu/oOKPmfvEhe4ud4AvXyuJObNfb1KyQE8U85sYFbZ18OvSTO8UVUe2RpmrZ00phb+0Tcm0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKmJV/q4OpzDFqGDZ/Eob0VYSNG2OGoEnOiIxllA5hql9DQS8
	kxS/mND0kRlHP1SzyZ/0NhK3G0mvYcHcKZU3R566jnHzLep3Vl7uDg7dwpZWbfs=
X-Gm-Gg: ASbGncsn+jotDDF4T0LWN8sOXNiEmXWOmTDtG0UXoDeu13jqCqrSiQ/txby3KPBnGoH
	hlubGxU8wktdgNqfrMLjp8Hb4pelGaJboNhn8EuD5BKwFjycsESa1rAcZrsyupIsh4wOMHxqvJR
	Ep54Seopz+bmotCD20AdOU10iE7i26wUUQI714WPf8SGW9lqcyKLXe/mVu2vTUOQx+saoxcMRSy
	d+O+tpTljpep67PIRABxm9hgsjFriH56lVRSHDKOfacWGs2y8YaIu0VZ6fAlhk=
X-Google-Smtp-Source: AGHT+IEpbHLtWg8lNUOXUaaQS8O82eR9X/UQB+mnwjGo6BbrwjJB9gQXGsQNS+GVkkxaUp5WX319iA==
X-Received: by 2002:a05:6000:440c:b0:382:3f31:f39b with SMTP id ffacd0b85a97d-385c6ebd533mr615614f8f.25.1732671376593;
        Tue, 26 Nov 2024 17:36:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm14712225f8f.91.2024.11.26.17.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 17:36:15 -0800 (PST)
Message-ID: <ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org>
Date: Wed, 27 Nov 2024 01:36:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2024 01:34, Bryan O'Donoghue wrote:
> +		dev_info(dev, "Node %s exists won't create new\n", node_name);

Bah I meant to remove this before sending.

---
bod

