Return-Path: <linux-arm-msm+bounces-42863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D949F876E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2F9189350E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A751D433B;
	Thu, 19 Dec 2024 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNMwny5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEFB1D6DD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645631; cv=none; b=gQgjuqqUIYJpDCwb+YXaKIMzStf8m1fBZPDFvH8mJfNRqJWQGFUr4kf1zRSV1x8qf0T/B5r09FzwEJtMdyH7u3D6nykk0o89cSEibzsqulOWYCFWk94Ug+Z/6R6RcEXqFBYti79YNzibN6ksp4/8+wg+BXC3199ZxaHC1t10sA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645631; c=relaxed/simple;
	bh=RRR7JQZcx7Mi09bMvoXQvQYJ5r9j7KT1CkwF5wmvhpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP+2tE7UrmlqEKI/1HjjSp+Sd3saZ8CghwxciNhy+tjGJmVoBk6MzujKZPubVtf3r4N3FSIvC1YkosdjlwJ4v9kAYfgV34lqVueJNDbDNi+wD5PCeq7ZL4Pkk+buMxaXHER6TMlhBzWLQ01F2xOgI2O4OEcz0VFZaYjsraXMwXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNMwny5m; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401b7f7141so994918e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734645627; x=1735250427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFzGcow9cupWHpIZyQc8735bkdGhLQtdRInVDTKhJy8=;
        b=hNMwny5m2hP7g1/9eu3Pg+H8Ucyb2vzlA4XmHIWyUW7bqCuz6uDrj7Xv9elf/y+PXR
         jN0QQDk9rtViNP42+rwnnH0UtmzEqlkkuVdEXyauDAhfItJnXNEQN7yzdrkqQf16f3kx
         zpWLA0XnuBh1KCAuSesM4KjG7MLdPw+xH7oXLqbvsFvQbSI32VL+QgOZMCjOo/65240S
         2mk1ZAdPSF8b0+xpK7bS42Edh8ohKu4xFIT2CDBB+fO1uaX/x9JeUexv01OVfuWpsjqc
         yXJT0fnrWWvFIsdSWhHJDhGqZaLnhx52gW3ZKq0VU/hmH6/8VpYX2ol7i6aHP97RqE22
         Z5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734645627; x=1735250427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzGcow9cupWHpIZyQc8735bkdGhLQtdRInVDTKhJy8=;
        b=bgQEdWbAp7Nq2kZttzzA8MqTdwYRRenJmNcnrgEYoO/er2fO4j5hy3cbNYAMHWMaUU
         a4AH+1rqbWrZbZ/W6L6oMOWLhmh80CQyx6taJ7BT6NwTQE6bj+lM2SMuDUnlFvBspzfr
         RAwCCZ3lS9FUPw4DgVGhS/ISfiDyI/PHOHMJCiRlPUKjpJwmlBSfoePNkRFBDwbm5HFX
         fiKIgK+a16mURoOfXNEVcZK7XASqyI6JYEyuiNvrne+L4slyNdqBApvlWgsc30lsBMpQ
         KZuti6Pl4acuSY4AOZNf1E/5IMmUUg0rqhtorsstR6pEb3A3nKBBUfejA5InEXq8Xg9O
         ny1g==
X-Forwarded-Encrypted: i=1; AJvYcCW5rJKHSIWLkSMv6zzLjQnUv35em1pyxnyInSdCvc6bWnDE/5veoILkG9dds/YVWs6urJ4PfScHy6x4kF5W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FFIdVIA/lGycaD8kQ7L8KkaSIr5uPeUEdh3ajlxuqAawO5Q0
	l1GStbHuhVYyZmyPzFO4x1ulznBQRs1k7/xSCGn2c/EjNf5Q1BIK9q/i8RE4dvs=
X-Gm-Gg: ASbGncvPxZeaNOPXiXDcjAM5lEXa0x138QY+n9/tCfvY8lyBD5mRffeb9Jytj5pdTWv
	xBNgft3ZI9biUIk21/015AAvcESPi2gOgzYjf7KNXR2VTNyi1yabUk214OUNyuxgp3OnuwSEYQI
	ZQLCjXX4QoxgB6doZDzerORAUr331CxWfyOTQ1ENmLdXGT5o88WFrA4Ul6ItJf+uRjBPtrd+pdf
	T/DtFpMqwUD5vhOeRZfjMEw+xxAp3vx6SO4yMzPZY4LgT+on/QR9t6Nh8ZbshB1mJEbwp124uWI
	3V8Jl6GXODkzyy/O2YIpeA4EGSy7G+Fecqb9
X-Google-Smtp-Source: AGHT+IHQBbZSkaVrRpWCT0IrdJegFxLytVpYTu6EC2PCFOGjuoGMf59MaiCeqFQIHDIIyb9fygWDtQ==
X-Received: by 2002:a05:6512:1150:b0:540:353a:7954 with SMTP id 2adb3069b0e04-5422957af61mr73815e87.54.1734645627457;
        Thu, 19 Dec 2024 14:00:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f654csm286377e87.10.2024.12.19.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:00:26 -0800 (PST)
Date: Fri, 20 Dec 2024 00:00:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: cputype: Add comments about Qualcomm Kryo
 5XX and 6XX cores
Message-ID: <6xubvdnyo4otwanapxersipmae4uuwkvple2jaxyuu5ucepjju@kl6lhbde4ney>
References: <20241219211131.2389091-1-dianders@chromium.org>
 <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>

On Thu, Dec 19, 2024 at 01:11:10PM -0800, Douglas Anderson wrote:
> As tested on one example of a Qualcomm Kryo 5XX CPU [1] and one
> example of a Qualcomm Kryo 6XX CPU [2], we don't need any extra MIDR
> definitions for the cores in those processors. Add comments to make it
> clear that these IDs weren't forgotten and just aren't needed.
> 
> [1] https://lore.kernel.org/r/l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq/
> [2] https://lore.kernel.org/r/tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa/
> 
> 
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

