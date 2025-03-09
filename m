Return-Path: <linux-arm-msm+bounces-50742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A77A582A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C208F189019D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3E61A3178;
	Sun,  9 Mar 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ab6N48KY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB518CBFE
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741512201; cv=none; b=c9Uwoi5bGlBtiOS1zQVxTKlgHi7x4r+xwOZZTF+7FI4tq25I5JBCcOv0jyibxP2zGws90A38YPyugtkbRpdOcZDw5q+7mgaHIJAOm/PglIOoGz0w4WPa4W+BGwOHJ/UL970MtWh4Zoaen4i9Hcwm+wvtJdu1W8Xa6OVoSoZLGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741512201; c=relaxed/simple;
	bh=64WZrmgyPkgy2YnI7U81yn6KSZ4lJ6AYo9WRW6tDuIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpzW4qUKxVOxgch/MQkc+Y/fd1XgpH/XKJ2WciCNu/wmhAGD/MiN87dXm2xKCdPgfgBxWnIt4q41gBAf9JRUhiGf/bmgribEYq++X11r0HiFWvExTJQp2CcOFmisp305Mp7EKrobPHn0B6DAD1YJZJPfqBougiA6HaaPvvY6UTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ab6N48KY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abfe7b5fbe8so472354166b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 01:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741512197; x=1742116997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WquEMt/nHeDbDu+wCTeJFQKwvIymjPr1TDpYSMcRfWU=;
        b=Ab6N48KYUd0NByEI5BB3psqhklj+00GGIuGJaQNZL4IGNMtzOgG0MyCOJsoSf8Ethc
         T40UWinA5DgG9RXZKSVL8k6xvYFl1N0inDBPZpXwpO1E40NhEwxTTlIKm8KOo+JWTSb3
         Pg2VJe82hNpzRLTxKrZBk1y5bsPdjguKP7H7UTGZSXamqAVnLo7EZXOqACSmksIUsDHV
         VPMaKl6FIKarroYDl1A5Pu3z+UgVDX8wxrypoILOSZ6aoVq3AwBx8+xnKUubS+5shycn
         d92qZronz82QiYKsqo2Y4GbVfbSenxKdEdiS6BxLIAXQ5ip04kP3p2QLHd5ZHy7kGrcW
         Tn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741512197; x=1742116997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WquEMt/nHeDbDu+wCTeJFQKwvIymjPr1TDpYSMcRfWU=;
        b=W8G5CLZTi4SfL+9n5tjVhnD2DDuHs60KDyxMXsQFRaB6qh0MjRX8t26WvCNq3gaY61
         H5dhKuhQYkafSyrLw0VmMUJSAMYPqh6lTACkkpoTysSlVgrPyKBaTXlW4P/GhFHJt1fJ
         OfGm3Lb0uiT8yCw9xzQkIF6BP65zpQCrgjuBsLp6jycfazeXVbxBR/MU4M/TKaMh/v2T
         7TLjNVUDCgoM773c87GPTklKXf9el1wpyq1okOSJxmR8Gzqeq7qvs/nt9hb62gJtsoBU
         7wpHAo9u03elhP6KudOi2fsxDRWH59RcKgvnVrYqH81xOeScXHx/E1pgkBMAYNzEvVxh
         TaVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTd+2FRV5p3jD+oZi0KHES9Sy0RKr0hTBifVSvptvejeSyHhqTvm1yb2zAtf8rH3SkIQW1HI+hWO6VioK0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mk0zanVBTMiSlB5JIw3qXOhojKVm+GVm/0E21gcAEioq+lOP
	bvNuqJneQ4vIWWEbrZIxN6nxCXEsuJazEb46O5ZhIGarYuBlt+WlxU0FU5j/i0s=
X-Gm-Gg: ASbGncsuouigg2ABi0DdqiQuUwTlOPaC7nCPj5Gw1vc9mNZeLL+L7I9/PygpvnMAcMs
	eL14r2alSPfpdTa12FNliehX4i2izXY7K8IbWZdCDp7uua5Osf8JpEGfedN98bJWjhWMZWhujHr
	3Ix/zm9pYqUJMWxUU1iRgTj7EPumXu58d/u313bm0Dth+2inQJzHivlXJJLecfUay+scvxK+ZvC
	PhrM5vT9KZFX/XTFMclrHS3HgiifREt3LCKUtazURvCY4RKqKx5QD9RnV0525qW9aKjgkE+YBER
	iETT7+t2V3qziZFhSzaIV1fTpAy+nxOW+5NGJfRD0g==
X-Google-Smtp-Source: AGHT+IETCUltWmQN+zLCmKRFkdNtCxZ4Os14U+jDnEz2nSP339omXsmyTsnb1B+RdPyq0H+r5s5iRw==
X-Received: by 2002:a05:6402:1d4c:b0:5e5:b53:fd49 with SMTP id 4fb4d7f45d1cf-5e5e229e46emr24575900a12.3.1741512196682;
        Sun, 09 Mar 2025 01:23:16 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733fd48sm5071517a12.9.2025.03.09.01.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 01:23:15 -0800 (PST)
Date: Sun, 9 Mar 2025 11:23:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
Message-ID: <Z81eAMoXb9li4lba@linaro.org>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <ea9344b7-6646-4329-b8f6-45d2b51f183b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9344b7-6646-4329-b8f6-45d2b51f183b@gmail.com>

On 25-03-07 23:03:07, Aleksandrs Vinarskis wrote:
> 
> 
> On 2/20/25 18:42, Abel Vesa wrote:
> > Since the driver and dt-bindings have been alread merged, it has been
> > agreed offline that there is no point of holding on to these DT patches
> > even though there are some issues with plug/unplug during suspend in
> > both pmic-glink-altmode and ucsi-glink. These issues are being worked on
> > meanwhile. Merging these means that even though this will provide external DP
> > and USB orientation, plug/unplug during suspend will give some splats
> > and render both the USB orientation and DP broken. But then, other
> > X Elite boards already have these nodes described, so lets bring the crd
> > and t14s to the same level.
> > 
> > These patches are just a resend of the ones found in v5 and dropped in the v6
> > patchset of the driver and dt-bindings.
> > 
> > Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> If you will be respinning, could you please add link-frequencies to
> enable HBR3 speeds, similarly to [1]? Alternatively, I can also send
> fixups once this series lands.


It's already re-spun here:

https://lore.kernel.org/all/20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org/

Waiting to be merged.

Lets make the HBR3 enablement a separate patchset as I'm not able to
test it in time, if we want external DP to be part of 6.15.

> 
> [1]
> https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/
> 
> Thanks,
> Alex
> 
> > ---
> > Abel Vesa (4):
> >        arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
> >        arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
> >        arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
> >        arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> > 
> >   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
> >   arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
> >   2 files changed, 785 insertions(+), 10 deletions(-)
> > ---
> > base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> > change-id: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d
> > 
> > Best regards,
> 

