Return-Path: <linux-arm-msm+bounces-52743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D938A74661
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BC7C17CAD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC5213E74;
	Fri, 28 Mar 2025 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1KNts01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6922213E81
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154200; cv=none; b=qwsnIlDZirqPnfwxJgRRXRMqe9nR6c0b6KmK/8TuJxA8knxtLR96U7fflV37bhw2VQAP5EjgcKOJr0SB90vyQ4+gRWrwuhacCbNxzp12rXzzzS79G8Y1/j9XoRnpp4k11eDJAAe9zvHv/wzk6/BZsuOOEJdXWLdDvj+7q2UkRZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154200; c=relaxed/simple;
	bh=8Vu9wccvRJP8ukJq1AmbQm1pxBvfrY2JQJAGM24f+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlVCbrr8a1Zy13Rogv7d1cWx6w36KK5aGiFTvLJR4opOl3zbMM8H4BXYfRPrKTmxxrkrkK91S/PlWVmazQhMNAdd9l0WAEv5hYmE+0Hl35C+cqcAAeXUVQvdNvlBvUGFwIF73r35kqFbF8mmN69ibQaTZ119PmBwcT7MdqX+JWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1KNts01; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so3441927a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743154197; x=1743758997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSShgXJw3PA+4hUdB5QsWQTuvezZ525Q5xMzwXN2rc=;
        b=B1KNts01BRgg0aJXETm7M6ea9egioMTZOIPIYRmp8obe2y+Rtl1ox9bvusii+2cWI5
         HMbh4bl3aimUyn8yB0+Kn2tyKR6qxXDci0DUZS9ccyou4jT+ndhhQKULxSxmKYd8/wXd
         mUnWj1GokpFp2BWgdTbcRz15DVGkb5KEgfdOv5kRLsXuNMtvArhaKpJ85HyfebojAmKp
         Af3+OI3+AqVjV4O0wfB5Nv6NN2+YSJ2x0ntpHQtZNkXZ0EUs+zmxy+Lcsy/pDQAbvJ15
         X1MPVzOAXR0dh+vfMyZLWO2q2WRTjAnCgd3ccinl1LdnbBoDUW6dBBPyauRrA2+b+d8E
         CcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154197; x=1743758997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqSShgXJw3PA+4hUdB5QsWQTuvezZ525Q5xMzwXN2rc=;
        b=cc7WgTSQDDKAGpS/xpxe6hJjrP63J8SFQMY8iCZigtJ1SWGxRUaXC1fUTEt5UvE55x
         5cTI5YRE1FuvYGG0ZGs6AWB7RRuRZApc9thw/qR+7aVlVcDfhf9gmz8FMD1uXnQNHe0e
         FdFBL240gSa3dE8h7BZ0t8nw9cXDTZ0vPN7/HBYnT2pbb6MhvcrXkFypz84e9LqrKiQ/
         UVYNjAdGTasgq847mcIE90Nr9M7471XXojtGQN45sVXWWN0oLhhBwHIOy90cJKvk15uY
         xNUs9i+V1/yYBwBTU0T9PNAQ93YRGKyEnLg5nVUwV6oWIQIOqeCzP6qNM2uuWCjPLkte
         0ZIg==
X-Forwarded-Encrypted: i=1; AJvYcCUCg7sF98XSkl/D593l4qg7E5eMTwEY+EYdSjE47QSi3tkm8pz031sDCwghXmeJwuamiRhdmOw+fPFaOuiB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3KbS3AsPmPCo8XSMZlYrBC9Vw0CXKmYiREsuVf6FFICtOmNv
	BJ0FnSvVTxyUjJp7FkUTXsTuzy8zJird+53Wgq+I9r+2UDhpg7U0bO+UvzDXOuk=
X-Gm-Gg: ASbGncuEqVohEcDNuJFyKWANfSkr3wUcjXIzPe1irL4SzVFD8N6ykv3IyKFOM2OeTzV
	p7MMthcr5rgmCrbY0BMwMFmXHGJ4tTbgNmE9QbXwIKzHIgzpotd6HNbIr6idlCdS0Q6HfSU3cQH
	DWQ27fOIQSbqBdhKndYPLHSp+mx0HP23klXs7GkqmpkeJ/k2PX2/aAILV/jMdOYgk2uZuh1zndd
	Of5IRqfarWQQfxKPtiPjjhIAphnw0vndBmpKRIlymMu61xIjL3DgLZM2WgNXxipMlCEW9ucMTDA
	pv1ka2E+XnWuenIMBEyeJ0Oyf9ogCtQzBGhmyIolHQ==
X-Google-Smtp-Source: AGHT+IHfluKIRr7jH95wATbLlb3zKl9uT5b3dRjhMmF+OXcjSLOy4S6m1p6fE0ADRn8ZZaTWKhlyrQ==
X-Received: by 2002:a05:6402:90a:b0:5e5:e78a:c4d7 with SMTP id 4fb4d7f45d1cf-5ed8e387bbcmr7030250a12.12.1743154197144;
        Fri, 28 Mar 2025 02:29:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc18030afsm1108964a12.81.2025.03.28.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:29:56 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:29:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <Z+ZsE1wm87GfVanE@linaro.org>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327081427.19693-1-johan+linaro@kernel.org>

On 25-03-27 09:14:27, Johan Hovold wrote:
> Enable PCIe5 and the SDX62 modem present on some T14s.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> I don't have a modem in my T14s, but this is based on the work I did to
> enable the modem on the CRD reference design and the T14s schematics.
> 

What happens with T14s variants that do not have the WWAN ?

Is it OK to enable it on those, HW-wise ?

(Hope we don't have to split the devicetree again, like we did for the
panel)

