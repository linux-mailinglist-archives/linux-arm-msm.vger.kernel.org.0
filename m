Return-Path: <linux-arm-msm+bounces-72624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DBB496BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAE67206C2C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3343126CF;
	Mon,  8 Sep 2025 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwhXHDpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB8303A3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351617; cv=none; b=o0BTUWP8VqDtIWK50062cP2qDa71qlxs+RDNTJgHbkZNhT8c4HM6GxTGVwU3dXk99ScuGa7q/v8XyGMeYeBc7zLRzev4r+9Ng2rB/WeVUG34Bz+xfltYn120HieSOd7GdEQlIFt3JOTqNDj89+QV7rqznNWyU5pTvhkn3cmFJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351617; c=relaxed/simple;
	bh=Ary2qEdINuj3SFVzWL6vHBjiROpx9PRgOxSO6BA+PFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9i5C/lxyE3yWPmv8sQhVD1fG/yx0Q4ziirR9igS0+0UF8jMThnFmKwZs32GxXGFkTYra6TjXt0Yv0k4nxzISV//ew1dtLe4b7n/1ZFLCoEBilLA5NRkNgUzEpb2lJzgTHvAcDfgpSk72mfmsJv3dw+lfqQhwz+y0dnXcDpEwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwhXHDpF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
	b=cwhXHDpFSCOi9Zgu9pf24LHC7o3dn1E1x75o/G6Gm7HHbiaQXipfJpRYg3ppG1FWFoqd4w
	5bBBSOQ/6evyFdUbt202uhXzcZSTDMklqkFl+IswcEICVez05kvL39MBocwUBm53ntdlMN
	t9QV3K/7g9UCIkMBmltfVP/kJzYIwyo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-EH62IWGPNoa01WDyvEGMOQ-1; Mon, 08 Sep 2025 13:13:33 -0400
X-MC-Unique: EH62IWGPNoa01WDyvEGMOQ-1
X-Mimecast-MFC-AGG-ID: EH62IWGPNoa01WDyvEGMOQ_1757351613
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8031e10621aso1225019885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351613; x=1757956413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5u862f+33I0ToIg9z8vAxXZhZpYtuEC4meBODLVdsg=;
        b=srjIGqqd7E4bz+oiDAksSbOCddQ5H3zFBsCxy8k0cwUrEaLAqhAo6uQtwnoO++Pvmv
         KxaO76ay4OyOeOCCzfEo/3GTs/k5rOX6/J31I+OtRN3+VwvVdP7TNHeuN8H68ZFuvVJv
         jJruqkUH+jVgG6HD0/nUNH6+2V4EMc36guFZBp2/vIR8h+NYyNdSNxWOpq3U+t21AK0j
         TLxtbYo/Zu9zdjScauNvcn0OAaVCgb7qDSQP7KK/iW7392QI3kUyHDyfFKEr0OwASeYW
         TfCgXZIfQxAb0+2dAPil9byH8aT0IDXbfQX1m2p6y/HqazJMLUdkk41MXVTWVXgy7ub/
         TQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrkHQGJgdXuE1iu/pBRSK4SB2cQ3MIng9oOLrIUxbRqOS4JZB0iF5Kw54+WH1Vm4Zaz8D/rjgsr1tTyc7+@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgUGO6ckjF6ZPgkTdwdJHfigxpJf4b2F6i/o0tAVN2EVHNhyp
	Cv0zOWRIUzAyz27T371dCI5U39yitKmqHktMNWrD41LE5Z1k+0exG85UxBgPJGAibc9kssfuDz7
	Qf/4vnyhMUuxUwcOQfZvQn/kg9KEM+Uqf3nAzuuR84+sGoW6A+QbJ7UKGN4DxzIkz7rg=
X-Gm-Gg: ASbGncuDYkWQlqVrJ4qwtTtTFJuzjzXnunwLbIpOGddJljMRUqhadISbNcKiqGntwpf
	J1NUoiQZTDN6JfuIhUAOwLnTXuEsIYXGq3qszPL34eE+uPJ1fARRWqH+ohNsnzQJiemZQ4RMCTc
	UgZHWC9EAZsy1cxApz06qI4Dtt4dRuqxq/Zf5R5uoklbWrrGj3/CJIyPr+yoMgaqtO74+9j+CBp
	mPgr2O14QD4XuCQoyYia71nt8hlkPgo/EMiEYQi8ajBqFp0UGqsGiyeg/tEOCjE1BUCOdn4oKlb
	f5Cm5hKxYXCafR7A8G/Gk+3ZRxF/GAzzIuCiBmslWcr+4XZcwkLA+7E9KIY=
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818166485a.30.1757351613085;
        Mon, 08 Sep 2025 10:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjCX6nGjgyfHMIgtZhE/2SgJwH/cNIdfnPyghhVtQtsXFicJtDPEijNhBgIwhV/6KVPSFsmg==
X-Received: by 2002:a05:620a:4589:b0:7e8:1d4b:b00e with SMTP id af79cd13be357-813c31ef062mr818162785a.30.1757351612499;
        Mon, 08 Sep 2025 10:13:32 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm1108360485a.60.2025.09.08.10.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:13:31 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:13:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Message-ID: <aL8OuWjlswr95xcB@x1>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Aug 28, 2025 at 08:38:19PM -0400, Brian Masney wrote:
> Here's a minor v2 to my larger 114 patch series at
> https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
> that only includes 8 patches where a v2 was needed. To reduce the noise
> in everyone's mailboxes I'm not including the other 106 patches that are
> still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
> other cover letter to exclude the patches in this series.
> 
> This series has no dependencies and can be applied in any order.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


