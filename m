Return-Path: <linux-arm-msm+bounces-30208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4225965D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736CF2857F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B73B172BD0;
	Fri, 30 Aug 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOoOlDL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CAD16D9AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010550; cv=none; b=GNg0MRSzbf4fYq4Jnmu2GtvHCW4n/IFZjkkKWfdpbLV9txPLmvH3hkR5IzQcHKg9noXhrfjII0MD8SAJ4fo36YNjRcGkjJJ4kDNjeaGqdpTAM4IDcxbGpRqpQi6sCN7X+lJFU5+EibWTzVl01Ef2gXvnY9l7pcWRbJpSMmZ8tXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010550; c=relaxed/simple;
	bh=Inx4OY2XgNzkn6u/xBHdrsHKfBoAn1R6Hi6qEbGisjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESgy3rvsY5m+nMLENPjk4fVlCViSQGg6Td0w2ROWBKukdXjvnhJhC5Zz6dqp1d0NJ57F/yTtD9KqHeNJHWd/HKiz/vcd3GVvQG91ZOMxuwmCoMKQarvGpk+HnvGR6ZYpUvhnp6AYGjB6RwHwKxUA7JXG1QXns9Zd5nKGZXbxhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOoOlDL0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53345604960so1633177e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725010546; x=1725615346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1hfXdJVedAyELyA9jfpQAgxhFwMoyGR4WrXAO3c55U=;
        b=AOoOlDL0Dxyu8aTQySmt9eNIBwbajDte6mRpbCYz6w0xFDVI8E038R0VOJ9BiRp7rh
         wzBN69qCl76p1nM3hdnpNatecAZQTftwbSo3pY6iRYK2pb7MqpMRqD/WTumjKft6uh4H
         kFtViIIR3Dvpb/gFzLnNm1Hah9+9SneMT0GHVbbAFL2dO8psLOoTdeUS1Gpa2uGxtm4N
         /jllC4lLgUCy8uPcnbOMybD5+PbOj/k/HTj4ypiiY7L+bdy3cz5KmmQP/con3RNz397u
         FXXIjmj0gghjWVl0YIm7F6JcLyqXDy5m+RbNHWLNq5wx/ge8aAFcu2w0f7WjIqO9CuxC
         EvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010546; x=1725615346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1hfXdJVedAyELyA9jfpQAgxhFwMoyGR4WrXAO3c55U=;
        b=cVOMc7Ais9Ae3La+xQ7J1thLSNElDs65o0/HyimM7HLFy2V/N5iZCNN/h7UWxDDNuP
         PbLnPEaXzE7tKsosrLJ4EJNwJ6NScZa7Lty6KNcvMnRJrKMF5z07i61fIq7HjXSDDYmj
         cMy6MhhgiBPxPxDSuTTyIzjwLUeJj1Kh2NdrH/OoRPrwLOBIv5Mk3utIhYXHo9qzNChr
         ndWzZmoyhmMrptqj7aL0j9Sc/z2VAW2tsurDYY231E8Zu0ICWPu7+b4TVi+1fMJnhJXu
         3y+pKSPoJYEm9TSLcYsJ3A/3k1PR6ZGppqCUOKRtkaBLM4zfKS5j8ZLMdAoC6U9Zluzc
         wwbg==
X-Forwarded-Encrypted: i=1; AJvYcCWBM+6in6UrEzZb+3KutouLc01XWOW+P+1pZvkHQELOjBCLdmx9kE8dzCeqg5yeC2Kbn0QsV1ELXBwG//Ww@vger.kernel.org
X-Gm-Message-State: AOJu0YyM95IBoEf3kDlkn8Lg9xo1O93mePuWE18hU2pUalmsHSrbu36S
	kgtOQXVb5ketkd58z5TQrE2COvN6/URF3kEiu/BgHLAvPhLSB3iAKfkdv4SXaSc=
X-Google-Smtp-Source: AGHT+IEMvYqES7T4dbXVf/cubABFKvL882mK2OO0R+8BwaGctTtZbqenkgc72E6DO6tgV+dQYjBY3Q==
X-Received: by 2002:a05:6512:ba1:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-53546bc97d7mr910433e87.61.1725010545802;
        Fri, 30 Aug 2024 02:35:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084176bsm505372e87.219.2024.08.30.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:35:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:35:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem_state: fix missing of_node_put in error
 path
Message-ID: <7uw3scbgzme46o4dighffxryrlzc3ekc6ghmgymmiixl24jyyx@vjwzil7e2qcn>
References: <20240822164303.227021-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822164303.227021-1-krzysztof.kozlowski@linaro.org>

On Thu, Aug 22, 2024 at 06:43:03PM GMT, Krzysztof Kozlowski wrote:
> If of_parse_phandle_with_args() succeeds, the OF node reference should
> be dropped, regardless of number of phandle arguments.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soc/qcom/smem_state.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

