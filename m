Return-Path: <linux-arm-msm+bounces-45937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31FA1A1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56C79188D99C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0595C20CCF2;
	Thu, 23 Jan 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgfeuTP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A7524B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628508; cv=none; b=S/Ry15yiH4awHLn7+elJaJNzaBA//pW9YK6a0r7jQS7dmbg9JbrkXVSLWwGZ/7++WIptQVEFOoc7uhliywcMBa1WcLG1HfHYsJR70eEe/jc4bfiDDZhpZnvhinmkCUMFkxVbIxkCr9rcwE8BgxB7g1Oi+E8M2gRWDTWXd2dCV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628508; c=relaxed/simple;
	bh=iLB+JjUpCoXmMA12EBfv2ZbZt8yDWQew4pPxupt6HAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP4sUS0lkv4eD8j/FD0jsAbdCKakGmJyYEH5fTVB5dRy6nKqvFtdk9hq0m057AELKwixD0kCpiKwxsmG/XEg4In8J4D60wZv1ycl2uIOH5pqV1ZCdSfwQqiBH0I75ssZyk5ud/CyKkaxIZhXgLUjpvxArlj2B7b995YWi4Gmuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgfeuTP0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30762598511so7637671fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 02:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737628505; x=1738233305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=huyGMJi7HRKKQwc/ojDBQ9hmjZBlwNzUQYmYCGXuwpM=;
        b=MgfeuTP0PZm8FXwZsrRI5mITnrQR3i46OANVz2TV8KRTNpj5HbmG9XcF7VGpRHvs+r
         sL+r5PXticulGsaoK+rmojk8Y5fI/Zb8aubYyBsD2czDmP3kZqUKj6tpw2ClOcl6AIAR
         KOYZtn0Ik2kTlknvSksRBnTYaKxknfyVq9qIDg6li6Ar6ioS6kS6ohUhW5euXTV3+/iB
         2rY4vVNMh29bU15nJEzzTuJ7HFQb7Pnlu+vfZdeqds0lQKS7nhaCMGg2tpH/ig/9n+6V
         uZ8tU6T2SlmlgiidRDzza2KmRjaCM6S9MsQ1t1KmMaa2UNJPBy1CIkqeRAg+up3bGMZG
         ekWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628505; x=1738233305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huyGMJi7HRKKQwc/ojDBQ9hmjZBlwNzUQYmYCGXuwpM=;
        b=WD7Dgmw334Nm3FVsO9Ei7Uwj7eR6EPw7ikLeCbqZGFwyYaNKbIUpey2+56kaLvgeF8
         CVZWgzA43w7mSN5XjUjjFNT/IOyrw+EqnjK/SxnhqUS8uhHMiWldq2gnd3gTcthb1PBb
         P12BvKUcqsCljxgGbY3P3eRCzrDRYrdBffu0FbDAR3vRjrRGhOjv2JE3WIu8QmwY4QrC
         Eq9NkFCKhFHDWFfHP0k9VYgyzNKtDx3RYdWyT/K5toQVLjBVr56MOKZKWHGi9qXumDSx
         UBarGhSnd3J5umby1WrVY9W7zqhXQXu62uidtmnaJfq9nxuJcArJYttickQYX50aUmdk
         qAyg==
X-Forwarded-Encrypted: i=1; AJvYcCUo/a+mV7/KssfiaVqK3Jci8kIyHF/m72njFDJvtQ5AU3rCMaq0oZzT5yGz3RZO3mjXPSDRY2C56Br8EE7T@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJlHIoTG8CfjCQqVhQdPchiqLydNFGCVw3cZ3viZ3m6BIRcuS
	4nYV1kCuJibC61XeaICq/ShDBpM3FolU64DZ+g8JSF4Tt1GoT6sfknEjtR3Fbeo=
X-Gm-Gg: ASbGncsOVb0wujd1HMsOalfAVgbuX/c14TG7/0c7i+rm47u3NzOlKk/L5IMzkMBSCj9
	0FIp450J7adOHQevEQczqbd5m/Un1IQeXs8KE9TWUyvRGy0RlnKYfYMzW8NQFHQPPROZjspKzmB
	wlleBXFaGsRZqCovWHC0vTVN7/1z21TUXGk7UIZvsZND6ArcypGOMJ+WmqUo4dir7DJwYJjNlez
	ZhkHIfH4O7Vug22DzZLW3B832iupLns3gxHzL8PqVXhy7CbeoEB+MfNm2H7/hQwgqjH8reT4b9W
	Dj5kNxgB5qSgUaIgTeZYqvX5S14O/yd5RhRp7W0MjUFeLegpSdWT7XOwJuYv
X-Google-Smtp-Source: AGHT+IEuIhZkNKWgXQ784d7amahcajkPqBrbTp4XI+gydjdtQJO8vLS4XEpwquC9SMwWHIjpxdB+hw==
X-Received: by 2002:a05:651c:317:b0:300:5c57:526b with SMTP id 38308e7fff4ca-3072ca89820mr72119061fa.11.1737628505277;
        Thu, 23 Jan 2025 02:35:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330cdcsm30224001fa.11.2025.01.23.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:35:04 -0800 (PST)
Date: Thu, 23 Jan 2025 12:35:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sa8775p: Remove extra entries
 from the iommus property
Message-ID: <we4flrm2kxfvc535ykkmvmfg4f7zkhbu44u7ipjmnc3lvlivrx@smvfuclrm75j>
References: <cover.1737615222.git.quic_lxu5@quicinc.com>
 <71aae0827ded718016c91e3d2b6445f0a0530041.1737615222.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71aae0827ded718016c91e3d2b6445f0a0530041.1737615222.git.quic_lxu5@quicinc.com>

On Thu, Jan 23, 2025 at 02:49:27PM +0530, Ling Xu wrote:
> There are some items come out to be same value if we do SID & ~MASK.
> Remove extra entries from the iommus property for sa8775p to simplify.
> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@kernel.org
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 240 +++-----------------------
>  1 file changed, 24 insertions(+), 216 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

