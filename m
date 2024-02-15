Return-Path: <linux-arm-msm+bounces-11158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84526855DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D7C1C2361C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD9D18037;
	Thu, 15 Feb 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cTWhiq3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE917984
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989145; cv=none; b=A0BT3J24sKsQDR0mC42trWXG6xeNCe6dUhdcyQkhjuR90o3NIVIaYZFivdH1VUy7lsv+qUesYuMhu+HxuY59nVjQOMkaUvW9FtHUZwSdYoJdvthRjLxoizE0hO0dKXP4dDQ9mqlakvq325ahQtND/9jQfQ4Y47BIFpDItBy1Liw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989145; c=relaxed/simple;
	bh=4Q+M+8Un7Pv2mnj/m8t23ALRK0Q9SuLZmTW9NokE94I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjNwYWEZYlI3dvJxARcX34T218KGV5x07xngVHquuNG0pJLzsUhsoJTK06yedsRKUpUpheJgPm7FJQQ59VUXJWsmq3FN4oX6kAJhLmmsZLtF/ne4MP2H4U+/vSTZkK0j4qRxCHOKICdUvN4nrh4v1YtSXhnaf97Jl7pLL5q+jEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cTWhiq3z; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3da5bf7f9cso24221366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989141; x=1708593941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xmg4GyqE2bkdR/9vhzop5Jgy/Ivyzo3N8XAugZKeJTI=;
        b=cTWhiq3zpDGZmadB7TAlWIuLUWSkdzWIpK7CfkLv7yxie28eA1yJ6jGKwDYiQb9aO6
         gudTIyu2X49tR2uFUoHc0kZKn3zvQ0PWiGYBXpi7Ojrk+nwmGrRVxLA8ICxmiSPOXrz2
         xE85JGK50Dv+OBO7AkMLeyFcpaZ1PsERoS9EN3vHf4kHveuEUp+ukqjU2tg2d6MgZh5e
         lqGrDLY0sHLFpdFLz4zvygq9dwojjYgsq5DCN0GTzTB+Xzy/xFbEULfosAzl1ODd5DUW
         RigWOY1Ep9bDMpn/SiBvoDkm9wIhNcUfOE+X3derwzcGlO+GyUElMQNywwzzeQnY2t2h
         ZTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989141; x=1708593941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmg4GyqE2bkdR/9vhzop5Jgy/Ivyzo3N8XAugZKeJTI=;
        b=V8ZpVxyfLi6LzVsXNe/86BUCf7jZU3sqb+ZfrcI2gwiQONqOzUVoSx7xT27muJqj5G
         f+2TxVMjmPTkb3odoWr8fXO+fS5eE0Qb5/K6yo7ErWtGCUQC/IXr4z6wUCiiBPHtPxr9
         9JvVDHzQF8cLqV+jjj9BH7n/SUnwE2SDhq69j/f90oVVTdNci4YRrTCXVOoxCCbufryE
         dByd7d9KRhTe7mTaoiCxrDwWZ+oaxrICeHZgUqNPb2jCpGOFGJzCEIDJz82KYsaoL/QS
         tGzekKXx2vbE2nh9nIqdv1c5jktdWJYjF1pIoxwkk/llad8cGHnW7ZWe123wKDmhbJDm
         kE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHRW7stJ8KCexRlpB1NFVCEcrd4E40N/NRMqiQmUaBFqtYqiTXDpT8DrUjtnpOYjENl2vubm0+aa0BwaNrxKyb7sZbGe2QAOaC3CS8nw==
X-Gm-Message-State: AOJu0YzzXBbCBOKrwl9FlkH5vrRcQvCth3R5Gghzrnx2sUHvpqoBASyD
	E8P6qkIYx4e6ACWkKoqCbbg5+xuC5wlljP6dmywOzOHSwbr7tz6QJETqCzgSFQM=
X-Google-Smtp-Source: AGHT+IFZx7QXYqNf+ovTF4psE466cIvMPkky9JfvKHFlSZz7hccBdnIOqgiC2SA4zAAW7qdtAbVNXw==
X-Received: by 2002:a17:906:d28b:b0:a3d:9f8e:8821 with SMTP id ay11-20020a170906d28b00b00a3d9f8e8821mr562492ejb.20.1707989140973;
        Thu, 15 Feb 2024 01:25:40 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ss26-20020a170907c01a00b00a3da9857e46sm80390ejc.99.2024.02.15.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 01:25:40 -0800 (PST)
Date: Thu, 15 Feb 2024 11:25:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 1/4] dt-bindings: spmi: Add PMIC ARB v7 schema
Message-ID: <Zc3YkgrkauRcZfNB@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-1-0bae0ef04faf@linaro.org>
 <ea9d31c4-e5c4-4869-8bf9-caef3dd32829@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9d31c4-e5c4-4869-8bf9-caef3dd32829@kernel.org>

On 24-02-15 09:54:37, Krzysztof Kozlowski wrote:
> On 14/02/2024 22:13, Abel Vesa wrote:
> > Add dedicated schema for PMIC ARB v7 as it allows multiple
> > buses by declaring them as child nodes. These child nodes
> > will follow the generic spmi bus bindings.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 

Forgot to run "b4 prep --auto-to-cc" AFTER I added the bindings patch.
Sorry about that. Will do it for the next version.

> 
> Best regards,
> Krzysztof
> 

