Return-Path: <linux-arm-msm+bounces-25672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5092BD31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBACA1F25517
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055C319CCED;
	Tue,  9 Jul 2024 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIM2e2h9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AAC1822F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720536062; cv=none; b=tgA8UPIyASrkiYDV7SbfaNlzJGwPliq+eQMgfJ9LDtd0rlPsaWQfPO0nH6V0qDHk01oCA6IUTF7LjwJAoFrxDlc0HlX9GryBIpHwvPH4MrQ2rLa7JpA0YC4flMN5GgfbDfKJHY5dHUcsK1v9SoGVJBn+HUuvBcVEj6vXT6Lt6dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720536062; c=relaxed/simple;
	bh=Jgewn17s9Ey6YUyp0qStVti3zXHXm8kcXfPAYUyBLhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKxlEGbMmEqCMEsKkzx5QxLNsu0+u1a9S6oqUX7cf8fSF7AbImpUKA9aQDeccYqdyFrWBBC9nb2+ofirHVylc8UTJZgwo4nZkxQSoNVvJeELFIVysdVW4ykRvllhyPpKmlpl7pKnM81Pra/Y0qiLzHUAIwS9pxcLQlPjHY6UdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIM2e2h9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720536060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9dNUMlILD/JowgtlDpz/3Xfo0pUbwll0dZL3HCPAgDc=;
	b=bIM2e2h9Pjg7mRDcdEvJM93WhUHb9cu8xDb19p2FZxe7oGA06lyx1BhFGmjswtuapdl8fa
	cSQV+/VxGCF3UGiw0/nzJPNwzX8HeWaN8o3cTEAeuO6Pe3gz/MVsr4A0JlnoYV+xuVQsU8
	WGl79J6AsY3Yvd962u+mjVd5mY66vVQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-fw_pqNZCPhKHHJqIFuMPDA-1; Tue, 09 Jul 2024 10:40:58 -0400
X-MC-Unique: fw_pqNZCPhKHHJqIFuMPDA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79efc957469so556256685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 07:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720536058; x=1721140858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dNUMlILD/JowgtlDpz/3Xfo0pUbwll0dZL3HCPAgDc=;
        b=jtVGLuXGdlTj6G6t4ezxHhy74STcTv6Vk2vCDl9Fy5E1XngrRnf/AdhbsYDXK+hcvi
         juZtMz7qSZ5SiNMo9FIPZ2grOgdGgG/eWND48P+izLiX/qEtULk+dYmz5CZCyFNAg3kn
         VIRxt7/YklpETm8PZuWHVsJNG1JVshCf8rxmh0uB1NfUzgBu1Czu7m95iF7Zfp3iifJ3
         RcYsXF44+3UYxWLijb4VDHLgJirv0Z4+XLfKZItmsquulWpl1VSjk4phj0oscjQl/wAc
         XbPsBDVR6U/lkwf20ywzKIVLYQzBYP1BBimBzUo62RTnPgwFREm9XBKtS0g1SO1wmivn
         GEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC0bGfrXcbIi5JNqoaXGFHmD2XyDTq7CLKk3Un6+w5SGV6zd1H5GgH9ucQ5pA9cXOWWWYYTHNxmGcdBtsxBqy66DWeMOS5y6Dxk/6ztw==
X-Gm-Message-State: AOJu0YweJm/GZseRGGn4iQodCMr/Fp3Cw6tXTYRbynJQwv0wsmJLeGio
	jIL9yE0bQpfbLKOVTDBzgrmAmLg17k2a6cF7hE6O6HNZJWAR09bP13blqh8urkg0ljy/aYXwsDe
	WlCgtJYsZQ193sdJgqzXe5St/pYVBEmSg9xSlHqFoMTyXBQi7bqa5XMTsuUUfbRU=
X-Received: by 2002:a05:620a:1926:b0:79f:68a:4d10 with SMTP id af79cd13be357-79f19a64fafmr349732885a.25.1720536058262;
        Tue, 09 Jul 2024 07:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnyT5xuAnGF3d6+RqcZrSyPI6vPv662QIU9QcvPWdPyiZO1DjY4R2T/cM0JO2WXzwX3CsQiA==
X-Received: by 2002:a05:620a:1926:b0:79f:68a:4d10 with SMTP id af79cd13be357-79f19a64fafmr349730385a.25.1720536057997;
        Tue, 09 Jul 2024 07:40:57 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff834csm102827385a.5.2024.07.09.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 07:40:57 -0700 (PDT)
Date: Tue, 9 Jul 2024 09:40:55 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@quicinc.com, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos: add support for
 emac4 on qcs9100 platforms
Message-ID: <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>

These patches are for netdev, so you need to follow the netdev
rules, i.e. the subject should be have [PATCH net-next] in it, etc as
documented over here:

    https://docs.kernel.org/process/maintainer-netdev.html#tl-dr

On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
> QCS9100 uses EMAC version 4, add the relevant defines, rename the
> has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
> and add the new compatible.

This blurb isn't capturing what's done in this change, please make it
reflect the patch.

Thanks,
Andrew


