Return-Path: <linux-arm-msm+bounces-86048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2CCD353F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 19:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 327E1300DA72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ED830FC2D;
	Sat, 20 Dec 2025 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIGw/LOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0723536B
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256291; cv=none; b=j7TfmEl9JUr7vhAQZNYNz8RIvPQpo4EbJisLcVp+GjX6d7ON0sHKPARX5Hj/z0iTe1YlFRbFUjnieWknDW0z0x0lfeUL9MxRDTT5Ba+x6VtrEwdLmJR9bgL9blzBarbYvH9uEBpV99Pu/AVecfiZ8wlMdpLUpGS6t7GpsGfqwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256291; c=relaxed/simple;
	bh=0u2OR6+3xMf4RaABwsoKlyiauVyQSZz852Zfxxk7a4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUaJIs0RDCSTCxcbPnCvjE0E1wB/8jVNxqLXBSPnSwhDNwzPwQlLjcqR+o4EjF4KKAKaABK7NBTE/hFbiArAUSEkAeid9jzDNDvy/qd0lSXDy17SxJ3ibI78/Ep/OPXbxmGlixBHhlOKFRiym+fMltJg52wbJl6grDzREldv/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIGw/LOc; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c95936e43cso951415a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766256288; x=1766861088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trzEivKudx03y5CGgz9d9cZqh7fqV05Hs29kec+vigA=;
        b=XIGw/LOcQs0At3cxgGOls8uuMTpcxxwE3ZkZDS9O2krFSnDulveLzSaS+XwaAY5ORI
         Fat2H+DWcrhcPB5+1+ZDv2pHAdg/TCfaH6f1rHOHRFVeq8frtfNFIfiyH6lVUxmRJVr/
         /KN2ychqdgiq7ffPPjrkU+tYxkxOXS1tKIIYjO3t/XFVJKxe8IahzDzwk1Dx14xyn7Jx
         vSirQZ8fEmQqPvUdBWKxZ+q9HaVQVRj9K7tGUvhT39kyHXxnYX00SeIlWwRubu3MdnOn
         /eg2CDgL/OGTDq5OIGaTrU49wtpaW1aN6eUookttsE9IYqwwK/1JsHXutbDR4vWo5L1Z
         tVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766256288; x=1766861088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trzEivKudx03y5CGgz9d9cZqh7fqV05Hs29kec+vigA=;
        b=UYjKpjX6Zfa8HToJ+P5QwRgaTINnFLPW/y12+G7/h3sHGlx0uaJqwLdjXnxYemhKSP
         YPKDQcFNAELT25V5PYr+PJkeqVzAl58pvZEsJzKYebndHBH4ccijSTZ1W/p/ckYSsVB8
         0MDpJuw23JZ1cFURGGD+ukETJX9pqC8ASEx59FZihn1H4shIux8oF4yW6UNF2lKIVT41
         PPuJuZXgoSzhUCfUH0B/KLgl7tzj8Ta4DPgx8198cxYm+dUFVxLBWg6QVAwX7/7jghN9
         vOIlnihn4bUJEbLLIfYfhfGXtqAA5d9LRUeK91oqr5Sl31wpy/kgV9ChQF+ylXlWv49g
         /5Ig==
X-Gm-Message-State: AOJu0YzCcuAmvXOITUYyeD8UlsBtRc4l5k53NQBwb/eLdD/FN55MtQyw
	zUJjcFaqKIgdN2pfBpJCn+wJw69YZUxzKcttGdxQt9R+sVxHxn3beFR7
X-Gm-Gg: AY/fxX6s1NSnzmHpEsCGUtwg6lTVybt4hzxYWlKEOHJwyx4U8+wERi2OkOkFNqcwn37
	OkjEL8gdYBX96v3f26Xv/dSQwduUkJxa/AqYca3NYRG8BQiyxHbE3jg60st3akgZWgRZZWPRoeT
	VvMu9AKETX03FpK8wsfj9njmByQCEeuTBQYZNir9HkmMGW5ssASdEqnQ8/EPURVahpbc90Nkukv
	9PyUSpw9mzSOG9bOuCWAtUOr4mXlWZBgvFFg+ADPyXqLlF5jMtY3R6D//rmK6O8Ze3Zh6dsSQ1b
	b1OVn6w8daIn/JdBrwtngGVMcL9AVeRMCOL5Jvgfvrh5iZKQRTLeDXDRyPbJXdSYS/Tk2PLNRJ8
	OYpU9+/T4Hfp9OChk8eQ/pOiP9uAbXDeHhdHs7ypxhHE7CMVW2XIFjH/ngKOrIMktAIjo+RPzSb
	kpqZdgCvSXh7f7K9wuEo0eGHdE+h2FtC8HdOuJfXxzJb+6d1A5wibZ8y64jzZi82Fndy4uQXj4+
	s6qrbiDOE11S5kJIjaXh90ZqjuK32Q=
X-Google-Smtp-Source: AGHT+IE+0LLix2qQ2hee63jPrCqkAnrGvkh7ErNz8WY0FuIa+u/gxQ3Xhw28APg7ob5GTcztFxFk3w==
X-Received: by 2002:a05:6808:1509:b0:450:44b9:68e0 with SMTP id 5614622812f47-457b20889c0mr3266072b6e.11.1766256288542;
        Sat, 20 Dec 2025 10:44:48 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab5ccb9sm3623838fac.10.2025.12.20.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 10:44:46 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT
 schema
Date: Sat, 20 Dec 2025 12:40:19 -0600
Message-ID: <7075845.DvuYhMxLoT@nukework.gtech>
In-Reply-To: <abec3933-279d-4111-8adf-a2e1280ce0b7@kernel.org>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <abec3933-279d-4111-8adf-a2e1280ce0b7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 19, 2025 8:52:51 AM CST Krzysztof Kozlowski wrote:
> On 19/12/2025 05:34, Alexandru Gagniuc wrote:
> > Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> > schema. The text bindngs incorrectly implied that IPQ8074 needs only
> > one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> > requires both "stop" and "shutdown".
> > 
> > The example is to be added in a subsequent commit that adds the
> > IPQ9574 binding.
> > 
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> > I used my name as a placeholder for the "maintainer" field. Krzysztof
> > mentioned to get the "SOC maintainer" using get_maintainer. I don't
> > know how to do that, and I don't see anyone listed for QCS404,
> > IPQ8074, or IPQ9574. The bindings apply to any of those SOCs.
> 
> the soc DTSI file 

Thank you Krzysztof! That's exactly what I needed to know

Alex





