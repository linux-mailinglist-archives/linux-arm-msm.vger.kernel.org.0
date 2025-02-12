Return-Path: <linux-arm-msm+bounces-47678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A79A31BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538973A89F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8756C12F399;
	Wed, 12 Feb 2025 02:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czNNuFjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C981C5F39;
	Wed, 12 Feb 2025 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325613; cv=none; b=PcGhxZfiOcccno6GpoNG9NjRcdjoDyYSzi9YYuyYozCiExMiUcMnhR+OChUaRA9V88wmukYXVPBQDY5k3SYRmkJwTsrAw7ASny9wE3ruCsFHuULkYyQ2Zxp/i57dTPa9HAyv2PZmfrtiBxxx+ebYEhpw0dicTsDisWjA4xae0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325613; c=relaxed/simple;
	bh=QEGOAOYXFEEhIZfm//ohY8nsq6IZgww9eBHAzdq0y1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3KeO0rqm+YpkDew1nTnR21KxDYKuV8d3qjjG5HBbDMH/tVamEC/ABKHqz6sGGIHXA2oMM4KZO0KYy0TqiDJjDaycebnu3HkHO0w27zyYuDZ7kn8VTpuDHAzWq++8g+WgJwMPn6zNkei31gQM1Vxkn8ZIG+ADxwfazMM5yiFxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czNNuFjW; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dd01781b56so73291286d6.0;
        Tue, 11 Feb 2025 18:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739325610; x=1739930410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VHuRV3JLBd0sDXEd7hwkpdzgjJBnpcclim2XbGuwkA=;
        b=czNNuFjWcAxC4qq9nVLmvzp8qoe+pRcIFzrTvVmekSwC47HBBnmM0I3k7xiBqWRR+i
         XurWiIJTeZi0xp2YkAOOTzMN2uXeHmfndiDAp9To0wMlhT9xuDsXVlR6Q0h1n5CabFTb
         EVRymxgnHk3uzm/ZV/axHqlEKUTgl1uVsybLrFUtyaY5aKIrtVT5uCwCk20Wu3lQ+/cI
         /NDtp9dp/LEZuE/f2oUYC5lNuWlJQyeXYy1DKtwYyfqOBDdcZhmKEkuOoTRwAk+Gmqi2
         RbNQ2BV3A8jAI9pzCN+qEIcKcNUtNjzBDM+3HRs7fEqi2o9IulH6qDt+nhCN2UchWGLI
         0R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739325610; x=1739930410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VHuRV3JLBd0sDXEd7hwkpdzgjJBnpcclim2XbGuwkA=;
        b=IO/Q39a6Q4iWt9ZA3r7avWydnZNoxfm48eBbGu1C9Eq16Bs4fsvfzc5iKnwPgGBeo0
         qUiZ6w+0M9x6PJKgMr+N+PRUpu7H4W4/lg/iZrrqlUFSBTGuXWTDbUOU5baIzWHuP1YX
         3XDS/eZExZhWKhoYr2tWcwan5Qc9KMsy6PuQ0PblqdmqtdWiS7l7EOdlRPrcArSzJZML
         Sxa/Dd2AobXGmPeZA9t3LKapxvlcTwx0D3dry6ycZ8rAi/Qok5Wpg1uswruMc7eApeQr
         UHc1On290IxFnkG2EQ5odXEtGNW1AVXhBnIlJbDwlwfmp/KM3uP6WgdjscKfT1GAxZTc
         xY7g==
X-Forwarded-Encrypted: i=1; AJvYcCVC8PwfzYksJZuXOxQHDcKM2h+qycEL7SsYoonyOLl48Sh/jw47/PZmEscTHqcqis6SMq7R4F6TAm0a@vger.kernel.org, AJvYcCWxMRjCFXxswZP5VEgJLSuVpVl9TZ8kEvR4/XLI/hmSp0bjuKSTKh4/IIlbb9LWrqwCEG5RMU5i0RxOL5ce@vger.kernel.org, AJvYcCWzaO1JB3oLNsljC5Nst5xhvStTsCXKdCYISzqdFQ9mRFySrSfF643ZWQuRqsbFzEIia7g6lNuGTcZ6spkEiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWlkvfRu8HAkvKTCPburANxDRvArVN3P7mkUWxxhdKJ416S80
	R7tiX/Ck018hlzA5EjVi/Ipj04u6P/u4/Gxqtsz424T5FQcKRywXZg39QZGOkNxFVT+QSJRvsoi
	LCuS4tPn4Fv8j9BJNSioVEGzfTNNptVlU9vM=
X-Gm-Gg: ASbGncvzuFT76+l1M8Al5DjSiyVhVBM+7wuNqLde8tGY2l/C4Wo1aHsbKPztnxnFNHp
	bt3efB4ag6G28RUKCdOXG5gZVNynIMSLVyfG50x7au4HbB14L+wBO4kZ5jqhypPWHXkYQMEm0H9
	5mKb19jXdXwYvtXNc5Khfd73w0Blnghg==
X-Google-Smtp-Source: AGHT+IEUFkdtr5qbMiziWtcWyrFIZMakMc2Xt3xf4SJA+jIVIoFYGC3/USIMiDCJSTNGxYXsJYbSafxf7lWIUQsjr3A=
X-Received: by 2002:a05:6214:4019:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6e46ed7f4ccmr26252796d6.17.1739325610034; Tue, 11 Feb 2025
 18:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com> <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com>
In-Reply-To: <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com>
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 11 Feb 2025 17:59:33 -0800
X-Gm-Features: AWEUYZms9PJNdelX24SfB9ouO82cZnB7LH--76l0J_cLW14Q56WNbDTJ3tWa0sI
Message-ID: <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>
Content-Type: text/plain; charset="UTF-8"

> > +             sdcc3bam: dma-controller@12182000 {
> > +                     compatible = "qcom,bam-v1.3.0";
> > +                     reg = <0x12182000 0x2000>;
>
> The BAM controller is 0x4000-long


Seems like my device splats with this requested change:

Diff: https://pastebin.com/AwzHPCLG
Log: https://pastebin.com/WQswkndX



>
> Otherwise, looks good
>
> Konrad

