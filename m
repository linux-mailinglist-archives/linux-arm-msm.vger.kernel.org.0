Return-Path: <linux-arm-msm+bounces-70229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987DB308A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 23:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF30AC31B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 21:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DB82E92D6;
	Thu, 21 Aug 2025 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8Ah7uDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9310E393DDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755812791; cv=none; b=UU2Ax2C1VgX3TcQ7VpGC9oxq9QI6nt1hcg0FDHm0B6W7a2/nfFHejbh9OYR6emmwTccJgACjkcFrWlY9KV1xyGuA2ROBU10OmuQROPI0vlc0nVkh3C6bPp+an+fMXHPdeKK4cltbGVbnbD5E00bnRoxiuV24XubPFuRrtKs3GMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755812791; c=relaxed/simple;
	bh=WjMsQZzuysaDV6R+P3ZzyoCh1QHeYreJxscNPZJrjvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBD8njso68NagCaeK5I/SBOucr+2H7ZD6WsYKi30HdUst8dxAnxBvdC/bbIXHS1Zv4xA6GRM+i9ITFY8EeRaqhTZMWIiJneD7V5Gk9cFbCSFTx1x93V5JFTeMB0khxD+LE8wPp83whrzB6Kl3IwC/I2rd2s2ftipvLkJ7m40kjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8Ah7uDh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755812788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
	b=K8Ah7uDhCPqerNmb4nVEJWvyZZyKKUflA1cziygM+Ve249/l3ZGLl0TvvteiC9CWnLSe/x
	vE1yJrRTtG2RgqcEjgiY67nZ95glF0HthDVB77wIeXy0mDgUlFPkJQaIfIJmP/+YdAd/P5
	9H53nhE9FSWOgdCF7WLqqo1+UpkJw/c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-oKcV-ATcOuWFyrXMwlIvWg-1; Thu, 21 Aug 2025 17:46:27 -0400
X-MC-Unique: oKcV-ATcOuWFyrXMwlIvWg-1
X-Mimecast-MFC-AGG-ID: oKcV-ATcOuWFyrXMwlIvWg_1755812786
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2955f64b1so44705621cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755812786; x=1756417586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
        b=Yb1OVWkm85PEKIA5xYfjLgKVMFWEXk4Gb6ZkyQlDbRiB7ucoptZDbanYX8fZ7X6UG/
         sHX0Fv5SKCCP/em2rg+4Mf9iliBFIp8cda2HsMLw3cyW22AQMg6Tgjvcj2xRnhxpsFgv
         K2fBEZv4bFehkwuleE27hK1yjrH+320aB+xODhXhDMvYO46tgUCZx4+MvfcIJ69qkDAp
         YxUwVnxQNTzRJUI2kxP4VRn9KumtLZoaT4rA/uu/ZzJ1CAULGailDJUsJRVHj3jCwcSz
         0Uym+6Vz4P9RlSFS+Cxuu+btD7WTyuIsoQxpAq6wZVP25ssrdHwW7uZJ/zoxZmDzcgZr
         kTDA==
X-Forwarded-Encrypted: i=1; AJvYcCWC4cLdUddZq6Un/KwXJCZWLGthhN1Yr1DwVWjv7/gwZ/qx2BP8K/eQD2TnbEo28o9UsOyFQInKZreRqxWV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BDJgE3ZHm2ydvAkkHuNkFnSQWolQgmr9T9MmRe8yang7efeV
	5dahg5woQsNfrma18Spz5SVnfLKerOE/JywGG/5kIzEGZ2zA0oFXuqk5IvnKwPkc5Bw02cTh1cP
	BBN8/lCb8Uktk/geBr/S9XHOjh2xkNOXptEDtsOv5c2CPSDS+MZGx8ZQwEhnl1HeJEc0=
X-Gm-Gg: ASbGncv/Z6f4QoaLPoVNgvbEF12Yf0cBALn7dNse53CRpIBKPhGSp53wgAH5wJpn7ow
	YxO+cBqALCEWllidKBC4jml2qnn+ghw8/Uzgs97BeTExIxxeaTS3g2f5/SVjKXPeCBlXEc6gs6e
	D/3U41ir+cD6GE3XqZLUsM1n3/FuJY19fRSOuYiiRImshylMfxsThyaArNjGvSEN/yTfvlw+EQz
	6j1K/BD2KbMC/W2p1Xr1kNJvcPqEXR1a6su/g1tLdZuVq/0H5FEiBktRszLtv86cdY6+CyAMYkY
	LMIrjSQegJEoP6/c89DK3PYG0PEHDYqA7PLmo7VzIaGWvj4iTJhZXiH/usY8puRVmynweSKooy8
	oIPCKreT+pWNgS5UbchA=
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332631cf.10.1755812786458;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM/f6AWKsD/uiuSUkJzb9jNkg9oqjjxZOXqxlVkr171nvQa2lEbcNla+IOhlEltLwBQr891g==
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332491cf.10.1755812786097;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020514sm1201852885a.17.2025.08.21.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 14:46:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:46:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKeTq1lJ549a2jnQ@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Wolfram,

On Wed, Aug 13, 2025 at 06:14:48PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/clk/actions/owl-common.c  | 1 -
>  drivers/clk/clk-axm5516.c         | 1 -
>  drivers/clk/nxp/clk-lpc32xx.c     | 1 -
>  drivers/clk/qcom/a53-pll.c        | 1 -
>  drivers/clk/qcom/a7-pll.c         | 1 -
>  drivers/clk/qcom/apss-ipq-pll.c   | 1 -
>  drivers/clk/qcom/clk-cbf-8996.c   | 1 -
>  drivers/clk/qcom/clk-cpu-8996.c   | 1 -
>  drivers/clk/qcom/hfpll.c          | 1 -
>  drivers/clk/qcom/ipq-cmn-pll.c    | 1 -
>  drivers/clk/thead/clk-th1520-ap.c | 1 -
>  11 files changed, 11 deletions(-)

These all look good to me.

Reviewed-by: Brian Masney <bmasney@redhat.com>

Should drivers/clk/sprd/common.c also be updated as well?

Brian


