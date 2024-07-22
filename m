Return-Path: <linux-arm-msm+bounces-26725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A9938B37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C7E1F2194F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD81161326;
	Mon, 22 Jul 2024 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTSaiOTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5357016729D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636771; cv=none; b=F5zqEigWXcEksGIUs+Pgq5EFVGGat5j8c8Wkch7TJMI2hKOi1tGfkCcgoM6bogifuH/+KpG38BfMp+8keivin7cEqBfLc15w79hDYgiO3f4Itdsa+08er/JPlqmlElRMCRi6fuiWen8cwaeqY0bD3TLG6lnJVN+HP+60G2rQy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636771; c=relaxed/simple;
	bh=WDQIfVnLd8fIqE9ri/4/kOqwvCB3ulDotF7mjDnGHyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGJA8fyJO0FIulUFv6RT3c5JG8F5iTyX82bVwcVUGiNSpsfkW9whu9JNZEAVizL+ZfshCJTr4YBQTa4nTtoSttnwlchQ8ReNrbxIfdvOBIKzzaazXtUTOc+GuvnrlAJ/OU6w5vXIXZJIhN7jw3ZLQXYyUc0lMadJ989/fPB5ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTSaiOTJ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ed741fe46so4501446e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721636767; x=1722241567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9i59AQP++/YRGTPfGm6YkbyUGnPVvAGTVEhOYab+5TA=;
        b=lTSaiOTJt2eFjmCNu3BWx/XeomoXPUKFMjNVCCqDR7DPHxABpXO/gPSTpcYopdl3YN
         GQFnUrNpgaSF+rfDZ0r0svBXwtcqTMFmgLbh+KVFGg6Nchd1/mxs/WlEmYXuDZQIxajB
         RJfFa3Ac8ORNsuU6r4iVXZrJ/07wTyFij+BItwvQHiwJgXPko3nGdaWE79AafEifaJ1K
         ALr4SmhVcvnzs6V0MYk0ue0wDx4YmGmZdP3w6q+yIrtDhSibV/W/LyE6OuUbY8tCWl+m
         MLkrD1hx1ZK1Yzsrcrc4DhN2WWquZTLopMaKhJEWkVNW4ajD9KbHjfU3ktsJiVRAKUEy
         v8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636767; x=1722241567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i59AQP++/YRGTPfGm6YkbyUGnPVvAGTVEhOYab+5TA=;
        b=S0xylygBkimq6eiqtXNEH+85VDJx4lvjVYQhmimcnBzbPFf37yETiTofDabzJu8V/y
         VZmuqrrVzgSyCW1Gqe3Rym6YaBv18ORKCOjxLL+qBvIuyXhYYdzWVASSp6mX2+M3DzAI
         jPQ7v76PrX1XS8wj2G67WrMy8kumQ1l4EVjkVW8QmCr4EiEEihoT25Ce4pr3dTW0UCSH
         jnbXbs52tr2vwpf/HgkkbmUp0wvKpngrFS9CM7ckacnHbxj2+Rhhvo9smeF8JTpe5JPD
         +s57gxmpkK3jyYkKYbBOB6pPI4dM/vHsaFVFSd/pd9EiziBQtzRR4IvTTiN682m0AVuV
         5asg==
X-Forwarded-Encrypted: i=1; AJvYcCXQSRNkzXJFwcV+lORMb4st/GoRNbiRs+LnuYmdDb9VpSbSru2UU2RL4JmWa5Jp/ZEkWqv+oSsBVGseW6MSm9ssXgc706+iM0cxGHRUgQ==
X-Gm-Message-State: AOJu0YycQXVUbmKWUb/tZtUNjv02GNllWkuFNNWOejUbVmyq6lJcfLS4
	yacwSMT0Y7aydcFPQhuDFyBvUPWH8BVpdpdyboWCH5xul7y89WEDsb+9BAMGQD0=
X-Google-Smtp-Source: AGHT+IGjp1w8oxUvbHbWkFg1OXnsIAY0YlwajfiBz5xRohJSi7smqlVbkyJAJWclepJZZfm7iVRypw==
X-Received: by 2002:a05:6512:2392:b0:52c:88d7:ae31 with SMTP id 2adb3069b0e04-52efb89cfabmr3853544e87.48.1721636767397;
        Mon, 22 Jul 2024 01:26:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f041e0bd6sm282010e87.198.2024.07.22.01.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:26:07 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v6 0/2] Fix user PD inimem requirements
Message-ID: <bob3pkwyu7g3qf4q546uittggzfywc6o5h7b73isx4lijsfj4j@h3uqpaevawgg>
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>

On Mon, Jul 22, 2024 at 01:31:58PM GMT, Ekansh Gupta wrote:
> This patch series fixes the incorrect initmem size assumptions for
> signed and unsigned user PD.
> Previous single patch[v4]: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/
> 
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> Changes in v3:
>   - Added bound check again with a higher max size definition.
>   - Modified commit text accordingly.
> Changes in v4:
>   - Defined new initmem specific MACROs.
>   - Adding extra memory for unsigned PD.
>   - Added comment suggesting the reason for this change.
>   - Modified commit text.
> Changes in v5:
>   - Splitted the change into separate patches.
> Changes in v6:
>   - Changed Unsigned extra length macro name.
>   - Add comment in proper format.

Please allow reviewers to finish with the previous iteration first. The
usual recommendation is to send new iteration once per 24h timeframe.

> 
> Ekansh Gupta (2):
>   misc: fastrpc: Define a new initmem size for user PD
>   misc: fastrpc: Increase unsigned PD initmem size
> 
>  drivers/misc/fastrpc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

