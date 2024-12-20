Return-Path: <linux-arm-msm+bounces-42960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E69F8FFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42AD188DA09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326EC1BFDEC;
	Fri, 20 Dec 2024 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="voET3LR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697851BD9FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689751; cv=none; b=UjxaqTjv0RU1SX3VITOQYuF9oPoSxKyCGOr73WJ3Acvz0cOY6hxEstMux7U2NjXgvkDFi/6Hly2wDC2H6Y3wD0aZjVCk3wxOiKNZJULV4EfXBrNzfB/C+6o08lSPOvIGoN4U8MrR5wWRfYPUaGjS/DjQjPAKOdpO20Rm2/jXA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689751; c=relaxed/simple;
	bh=azqgE6Nq+GvKhd1BTmIRgkn9xndaQhMOmC4bEnQpeQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JuTUtLIJrp75uZNms+oNWzUPP58nKMX1/gD/U+5RAYgQqUpqLNhgGOUiWuhzoIcvGrdQVNYfkqWlrZ6ZYRyGb6YC8YxwFYn0QTEWkjK3m+8LOXqEN69/fKxHMLwPgqaRjH+7NaYaGVpKgBKfAHXLrUunR2qLAQX2vOPxCpnTAhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=voET3LR1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38637614567so869249f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734689748; x=1735294548; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcfGKSA3hn1YG3GtcYe7AtjSIId4RmWqN/7TX7SGkxg=;
        b=voET3LR1sNBndDC8TvfxwWhnRd0b9ioyMXUR1JdIm7q92Ez1bo17qgMh6iNyYkcUPG
         rGUhXyChFybKktT8nbgVft4iog3VFMkKUwnb75lML6ZksFWPho2l2nMm6Jphht4JD8pU
         5yMTEAamUcJL7LucVmpc9ii5xgiXfOiEY7oO//FQWWaAPyomuv6NK4mTHlqiW9n3d8pE
         VqsPQulpErRsW2+LFwoRdZO3X9M27CoUaqzh6gdgng0BSm922+W+Zbv52uabifrZk4Fl
         WQ91JSdXiWehuSHHzD3DIBcqCoR2/GtoXW0WgBmVethKY8u7dw4bD7lgCqpkfnDZUAOD
         FsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689748; x=1735294548;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GcfGKSA3hn1YG3GtcYe7AtjSIId4RmWqN/7TX7SGkxg=;
        b=hlr2aCWW09YjxR+vlRGVSMBUnG8yYC55R1D24+QjLdHVsxNIl+wwGUGRfvN4Vnl/Fp
         sBPlrqG6rZLIUnxJvg8k4/IWt1JWbTQkIb89jX3Cv5IA1FVOlPN40jbWYGUaQsqMu4pO
         HDV+lrYJJyD9Z5oIjh5cXpGHv33369CC3ZDVvJ5qW0yXqy68ZIFoWNZ1TNyXSGurePHC
         MDTxvkLJH83VFRPAyPFkm0vZrrBtyWS0PBsWTvKnl5scCaSnAjOPRtMMA4KsTtEwH/T5
         6AJ0IYQc4d2frRUEvjwxzRsrS+p0CFXXepU0ehwb4fQVKz/WnCGlp+QOXXo1L1+xJgq1
         stsg==
X-Forwarded-Encrypted: i=1; AJvYcCUbtVWtMG/wQ0acj+dX3mHEKLC7NJDb+IN6v/o4PeP5jGOzr1TKBWkUi8rjLCWIFHpwvT5RhqsDns+T2aIz@vger.kernel.org
X-Gm-Message-State: AOJu0YzpTIPRE6r8Uype9P8rQcbIXRX2EI7RH3BjGtRY+vh2l1SHqyaE
	JnlNxsaob5zCpBfKwEULLuwtcDcverrSrvIf8O4MLXws5FnmEr6xXiptgre2qjM=
X-Gm-Gg: ASbGncvGko/cHx6JJELA8U3qH1AvQUhznCJPTOcYSbUaYvxYmkYGQYIZr5fEExR7Uo/
	GT3wfmm8RljzL2lSX7C0CAj4eF73yhLNp+FX9VbW8fmqaXZ+VNIaikVZQ84lZmEYOtKztanYlo/
	k0Qr6DKT+IvrsUuhi+8HNLNtg22YSTU1b/pggSim9u6JrZnD1XhdL1j8lFOZpwrhvqWbWoc4jew
	07gBhUrz3OMcpIONLD4lNluprDXhh35r0CgNtPgklTuNs2HS87c48jN/x4G3cAKSGTbfN3uIV0J
	wBvzJLF/ui17OB+BhyQv7qlMgg==
X-Google-Smtp-Source: AGHT+IHT7Rzag8h2Rs/Aw2fgwF3ehSYhOv09XzJiHLyN4FafzTK5rIXYSFD8pNfiqxAdPRV0Lgx4hQ==
X-Received: by 2002:a5d:6f01:0:b0:385:fc97:9c71 with SMTP id ffacd0b85a97d-38a221f17d7mr1847497f8f.12.1734689747739;
        Fri, 20 Dec 2024 02:15:47 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm3741052f8f.71.2024.12.20.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:15:47 +0100
Message-Id: <D6GG70FQ29ZB.PEJZ4TE4HWQV@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pd_mapper: Add SM7225 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241220-pd-mapper-sm7225-v1-1-68f85a87288d@fairphone.com>
 <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>
In-Reply-To: <2ee51e35-da7d-42c6-a868-bd8f8700d617@oss.qualcomm.com>

On Fri Dec 20, 2024 at 10:39 AM CET, Konrad Dybcio wrote:
> On 20.12.2024 9:39 AM, Luca Weiss wrote:
> > The Qualcomm SM7225 is practically identical to SM6350, so add an entry
> > using that data.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
>
> I think we should instead add the fallback compatible, like
>
> - enum:
>       - asdf,asdf
> - const: qcom,sm7225
> - const: qcom,sm6350
>
> as we've done for speedbin/rename variants of SoCs lately, with separate
> entries being added for "actually different" sillicon.

We also have currently for example sm7325=3Dsc7280=3Dqcm6490, would that
fall into this category as well for you, or are they more different?

But do you think it's worth trying to also change existing platforms
like that? We also have basically the same list in
drivers/cpufreq/cpufreq-dt-platdev.c where we have both sm6350 and
sm7225 right now.

Regards
Luca

>
> Konrad


