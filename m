Return-Path: <linux-arm-msm+bounces-54100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2FFA86CFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 14:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4168C6F6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 12:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCE21DB92C;
	Sat, 12 Apr 2025 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMNrTsbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C41E480;
	Sat, 12 Apr 2025 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744461946; cv=none; b=gNFs1MnpFDf6UOn4XVTG5lB7tK8sbaogHs5ttzSAMpXlcetH9u74xAHP9rB301XbUKM/zSyuiJkgejML+2x8x+1zw4pXwvJ4EeFUIJlTPiR8qQtBeaURZsUXRb/lf8jlKPPI5mgFWwI+xPgOGF9sEvs9jbzVKTTD4UucUt6vdRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744461946; c=relaxed/simple;
	bh=oeL5Iwjg1FiygjSXNRjRQhDXKj7+TEJLBW+oZacpWUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoiCq1AT/Mt9xOf9svEojV3YhqMZG6+ckWJ+8qO3bPvVk3PnOvlzYUz+0x+/Hh9AfgZIxj+UOztlHalYPkmqiuCUx2wEbPqgHceaftzo6ihY/I9QvyfY6jOCR1d5JbmZFEsw9MjEDqtk+jbGeLUj2aREPahEswDrErIGv2uqUKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMNrTsbc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39727fe912cso1329579f8f.3;
        Sat, 12 Apr 2025 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744461943; x=1745066743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeL5Iwjg1FiygjSXNRjRQhDXKj7+TEJLBW+oZacpWUg=;
        b=SMNrTsbc07W57FhSzwsXojeEogxfU5JaWIg39zo77beyA90zGg2OzJ1ZdPv4sbi2AX
         Zm0xl3qJhuoZs9zPT/ObZ0wcDH2Wjb2fXZpze0DEc2lHddnC4rqwG7L8hCh9xzf/dx0E
         yF9SO59uEZCSXozOMr93cgjdJUyvlpXAlJXRrtd/qi8HPFlVLozvvjPaCCXAPWb9h14z
         5qQBnRdiBN1n9bIGv0X+FLzAPc/HBTNViarPdNzuVQPNHrjViT2MRK3nxg63ICw6X51s
         QFcwOK/ZUSdFv0bE99PuCaaIVsIZtRj4mEDasIWRpAyvFc7HQouCnydKNOPKjJMiPeDV
         s6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744461943; x=1745066743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeL5Iwjg1FiygjSXNRjRQhDXKj7+TEJLBW+oZacpWUg=;
        b=fj6p9nJyik+GK/kX8ipEsq/HLSGdnglQ8434IYVtX4AF4kxUOOxHhPwsZgWcEIDgZd
         8vLhkbmS9FOQXCUwfKxnxblXMH9UMV9QV2F8tEDXCiGuN/h2h0k10ZaPqHlmKWl3oobZ
         y/umgXizjh8NEuT9D3pGJvCNV9sN4kl5rUZZeoI/QZ3pVkG6xzoJ/hgj8KN8I/P4QPgR
         Varsilpho56WAENorw8jXqklQRm073j89Qz0t+JXlIUsWek+ESqT/KfRtmV3pIOeT3iI
         T65ZPtqwxXlBHqho7iZWVu5JkzVbwe5/mhfU93EMeedAZ3GGnB+rMBj5YR2FRkCcEg9R
         q39Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQnMkuKbU6HNlZZ1dej9E1rbn+4X9TOR1h9O5/RfhLlLinSWlYQ2w/PdwbNDEf8sMT4e6AlbfxInif@vger.kernel.org, AJvYcCUXNw7B3oqVQc179N8LSJexVsVHv64YQ56xS7wN6v1ceSHrW0yvbmjFB8MRTIGiUX5VA9vsxJmVHo5TQb9mJA==@vger.kernel.org, AJvYcCVSB2XDVAmPc/DnxtmwcFmrFK3bStfFPN66moU0kCfHWf3Xyv2lR0kSq2vZjdlB3KeVW6TFIJYsTR+tWf45@vger.kernel.org
X-Gm-Message-State: AOJu0YzMS8Kp+DzhyrU0uXdUKkwDNqx9PHYkfAxYnMGhyKqe83sw9zPD
	vYQ0Y+8u+ccgozPlK7hjoTwYuARWagVcFWLy+pQ8ygnzMlC7jm31VVaCGFBzrecq5K7Uk0hfxox
	pHlaX5LBNzwG73iDjgcemT5QiyAHeNlo=
X-Gm-Gg: ASbGncsb88ciKoU3Upk4oTLlgVmztJ6oi3HBKEeZTIrFYgkER/8clJhxQasdXvFw9x5
	kY5M8r7R9RBx8JzfLH2d1HY+fUXD+un69tFOdR/FI0MQUJ7ZORPc3PFnuq+uv27x6+q9ODrs1Zl
	pTCRFDQaKawEdKD8WSd544JA==
X-Google-Smtp-Source: AGHT+IGWVy3poODVCuN/fPbaGQe4qrbxQ1yxGohGIKT4NlBYIG0iGseWDaLQAMOYBw+2yHzIGa3exQkaSivFefxGhhk=
X-Received: by 2002:a05:6000:18a5:b0:39a:ca0c:fc90 with SMTP id
 ffacd0b85a97d-39ea51f5089mr5267735f8f.14.1744461942417; Sat, 12 Apr 2025
 05:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411155852.4238-1-alex.vinarskis@gmail.com> <e19eddd1-0911-42c6-85e7-a9fbbeea778d@oss.qualcomm.com>
In-Reply-To: <e19eddd1-0911-42c6-85e7-a9fbbeea778d@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sat, 12 Apr 2025 14:45:31 +0200
X-Gm-Features: ATxdqUFuRFVL9o9T0VFgihmm5dR0ORm5NUo3sL5KU7Yg_d1o1LTQYAKedbwxLSc
Message-ID: <CAMcHhXp5A2v2cuWt2pZ-6qeN+D2qZvV-4XCN8s3OonZqD6e4XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 enable MICs LDO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

You are right, this is probably too 'dirty' fix.
I did some more digging, and found the root cause of the problem -
MICs were not configured in audio routings, even though vreg was
already binded to lpass_macro. Will send v2.

Thanks,
Alex


On Fri, 11 Apr 2025 at 21:25, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/11/25 5:54 PM, Aleksandrs Vinarskis wrote:
> > Particular device comes without headset combo jack, hence does not
> > feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
> > Set regulator as always-on to enable microphones.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
>
> Can we bind it to the soundcard or something, so that we're not leaking
> power?
>
> Konrad

