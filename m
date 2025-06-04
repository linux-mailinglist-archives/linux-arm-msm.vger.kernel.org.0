Return-Path: <linux-arm-msm+bounces-60228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F9ACDE46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F473A3F9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB4028D8FB;
	Wed,  4 Jun 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ia0N+eAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8B24DCF9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041206; cv=none; b=jRuJKv6i03gc1O0rvZXn8l3O+lPxlqW/uBFp6FGbUo6Xtgiu7oDcCdEMkSQE0YDwxLGAusBxqBnnLHwC7x8t/CcZic0JjK3zUdMZgje4fdcMCnihpz3NCLA2AizrIR6TCPAbgE1pNCEYFjXlZNlghzaA2MpAgYkarUPguZt1NuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041206; c=relaxed/simple;
	bh=kGTwydqDMCIPl1CpZID+y6ccqB84UAx9ACYmkDc7hJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Q9I+ZeCA6AlYaLEmA1gmHyqtUqSnwgb813xoLOYzYXBwmsIIOffasCjJwSF4mrz1Xr9pi14meGu1GcOJ5qqffeq2ym98GJwz2OrNSD3esd+LDeYlbcUVJXkPttnWfpwg6l3g9Ifw5x7qXmKMcM+BaN0qt9tTrO6UIk+P/5GpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ia0N+eAW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad883afdf0cso1287558666b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749041203; x=1749646003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6qdJO3p1x1A/ngwXZAm0UCO5G7hC2bDfKwNoG0neIM=;
        b=Ia0N+eAWw0RMn7qQ2DLnwDjzHtu0CoS6kblI8MC+dHTfNxWtYaB64YEQ5Xz5/DGyWl
         CTCe9R5zlkgZji4NQAs0qi2yTSNoa6/dR8OJl2jwvjG3fTiQIxp+TtmgavvCKsa0Hr8h
         7/33rwjR5oUZCIORhShDNvfk5HWNjxuBxepxQGSsmcVODjWDEOE8Fcjw3UHzGyotYyyR
         ZbjWFNQbqVn/WjC4di0odXWufJFU+snScR61sycc67e7GkOYWfxC2jViZggMA8fX4g0Z
         mZtZqg5E7f5KX4YroXJ8ZkWY1zznmWW1tmMfwmSYsxtr672t0b1f0diyeqVWCY479/Bn
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041203; x=1749646003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6qdJO3p1x1A/ngwXZAm0UCO5G7hC2bDfKwNoG0neIM=;
        b=YXgtGl9siVI+7r1V/ZGvpqHItXObMS7980UACF9Sl3I2e78mkdCEiIBTITvnzC25mQ
         mP732n3Vw/OsJLo6SeoZSMLU0XDtqnWahi3sAIv5Hz0ehxwLXI1lq+DMCURnWGqGGDTl
         aViLnLjJCzKQIuny8VqMubZqPuNfLhwmK0nvtjVwJphiURKqK9nnM49dWqLvPTmmRd/e
         0qZQWysZWF83VGueNC/QKVKXhRhOSB/KGlFz+wJBLdxIRPTaDpyQ7kcHyx3SRYbOZBxk
         dpGYU30UAtymBEQNrVIDYZ1OiMUO+5QeZxWO3xl9dlWoOI3jZnoJilNbDCUEG+lD6En1
         kYPw==
X-Forwarded-Encrypted: i=1; AJvYcCVL6cwI8V/ksGjg8RQerdQIo42CWmZhBGa6oWAGNqN8JxN8zk6BIPpkZQFIF4CofjSwt9jhAo7YRPQ3yDwp@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+OL5AUt0YvCzOTDVtob6felp2kGnB2FwvbyQg+o/ui8gc5G6
	Q0iJldCtZ/pMCNsp/8tR47Fhr7xqppMcO+eUsxnjEy1DE0JDYAxel2dpGDPSwHdiLno=
X-Gm-Gg: ASbGncvutOwWk/jZKgWjU/iyl3aJjpEctqEQuj50vy8NPmBhpSVJkoyQlQZSFa+M8kC
	KJNfFTlzv6Oa4fq5e0cNH6jSrV3I6oQXxznt+8m09iv/KlsG6gIfLeL83w0y8rVTJxyuXloHBMD
	uhRbFiz1UoPFq1BfgSCVwvGokLEEF0hwi6Vit6smmniNrcfNUeR6bHCSF9H5ogNBdFJL7M/Tx9S
	CXz4yTt8a8Uj6NxlBm6gzg8QhOXStY1icboVgh073kRpzGzBPL5IJEgdHkQuNja/A0Bo4rxHJKQ
	qxa9cC9AtGzzVRei8c8ik4h5Nf5KSGsa0UkxbM0azmTE1Hiff51zDb0GiB0=
X-Google-Smtp-Source: AGHT+IH3hjyMtS7nUHzS5hLiFEDH6xWffHB5UpuCedgbYbZsl9L/r1OhGo56kbxkn7IVvP66st9SWg==
X-Received: by 2002:a17:907:1ca1:b0:ad2:2dc9:e3d3 with SMTP id a640c23a62f3a-addf8ffa8d4mr256307466b.57.1749041203137;
        Wed, 04 Jun 2025 05:46:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04551sm1102106966b.93.2025.06.04.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:46:42 -0700 (PDT)
Date: Wed, 4 Jun 2025 15:46:41 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: use per-PHY lockdep keys
Message-ID: <aEBAMUdAVPB+cN78@linaro.org>
References: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>

On 25-05-30 19:08:28, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.
> 

[...]

> 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm OK with this as a temporary workaround, at least until we figure out
a way to have chained PHYs in the generic framework. I think long-term,
the PHY framework should be the one to call the ops of the child PHY on
behalf of the parent.

For now, this LGTM:
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

