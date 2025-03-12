Return-Path: <linux-arm-msm+bounces-51197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42715A5E49F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 20:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB4C3A9A33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 19:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D5A2586E2;
	Wed, 12 Mar 2025 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hK/BSX6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48376253B73
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741808443; cv=none; b=XQZfBVmSHpaf1MEylnUXPTdk+Aa/DuoUwhDHeQOP+fiSVjzfiJYP4vVFms9G8wMUgP9SKp0IJUEY6Oqd6aHZujSaK1Wm7eQlJ2NeqSgO7rwdpwoO0n/v2soAbWd6isbWbPMoSYfhVB7Rhwyn0wwLVWp6EwFYahQBSeYP+yAG+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741808443; c=relaxed/simple;
	bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpJN4LQoRjr2gbhyuu7hqhAnwwcObccMXQd4/I7Auq8kMoGIzdpmZ6Hr/weLUsoBZXK9niwASnqSx56/JbUbEQk3YNUh9PyYJ3QLrtjS+TKglsbhWVLPfsUwltG72vqu+ZIj6ZyfRvN3WU9l/ooQDQUu8snTe3QB6J315ibFkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hK/BSX6B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741808440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=;
	b=hK/BSX6BZdUYHXzsOdv0KHVaydwqWuyfgz8hE7IBuHL7J5ZKc1SOTSuWxyrN3wrdwG99Qs
	eDQJsoGUs0TRQZDL+m84ml62DWy/0ce1qbqDdgFYNdwvGx4Hck73PCO5NkRpPABVU0IRhC
	4mhl5VNbCVNN9/eETspSN9QN66dacMg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-0E94JXTWOcOVMmmDM3e3SA-1; Wed, 12 Mar 2025 15:40:38 -0400
X-MC-Unique: 0E94JXTWOcOVMmmDM3e3SA-1
X-Mimecast-MFC-AGG-ID: 0E94JXTWOcOVMmmDM3e3SA_1741808438
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0c1025adbso31115185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741808438; x=1742413238;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chqaRTqy0/9wIACLkVCZlXVspE39+hFf13nQroISW9Q=;
        b=oHMuvxHLhpSNRTL+BqtKZ8wtGSOZPLqtnjfqxsQi53Zk9OqLcpNaTMBPhtbGY46HsE
         hv5+2dnbKlN9C8xXfhG6AInmSd1q19ajJc/qvpNuwxRvpjIBonS2crZzlaV++vT1eyfF
         Z8BfmUqs1R1igeNSaaZGXCpzEPaVdPh8E3CfIYLyca9EOyCsIjXsUOnGPuOgjMf9IjHm
         DxdzdF5A0Sq1TCp5ggmXhnc9fK8IszfQ0DwWjdveskusVFUbzVqfXWDSKXvHa1sFVABi
         lWBvmE320QdRgfddRs2xWINatgFu0BPXAh5wpGqmsqjS/U8pCgCNjU5S/dzu4/5/W3zT
         EXmg==
X-Forwarded-Encrypted: i=1; AJvYcCVPK9n1aJm/Qf7fw9rlpuQFcdadJoix31OKGhUMekrZvGdKJ7IzogbKdmFsIr9kj1PQW1jYkzUh6Mu9ZQ8N@vger.kernel.org
X-Gm-Message-State: AOJu0YzToPPari+ThDPHQ5MMFkiyiKq/3+R68gBFr9cYp1RSRGiPIyXz
	pACZ0ITwojXu95aZnMEDVvTiMQT/b4H6iwHhRGn7MBeSRWwLfJA+vMFNjf14BPRaud5JcEVjFRV
	QgKehX4+ISIN2IMoU1FJfyjQ82P+CYs/WxiHT2adZiX5KLA+kgcc9FQLDZYGfG8o=
X-Gm-Gg: ASbGncuGzo35m2uButXc82tEFqOCIp49NOBbZGvG7csJoff7e9YCfIMV6OZzXwgXRQZ
	jz+4vw4gXWXhfCFTKsP1i9ap3/xTRfxcE/fQPaAUI3IooZwk2LUMupHDWmb0KANe3Nku3pn+pfp
	fyqEGHmgQBu3ChAVz4HPehxzA330GxmQtiE+EcxTXq9F4qHvCf6VsAbPAiDxYtmVMPci0qpWYLB
	nTRT7JCTD5Pyp3Fq3VtE+7VYnhHEjM8Hx6/UYZZx6mdgad3jEzIn0PH1b0OA3Fg0J4tl+tl8Swv
	noN/UPUXR/4ACJOIihpRziMCYESDRBGn0VNkJI4=
X-Received: by 2002:a05:620a:271c:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5544e2e11mr1931051385a.57.1741808438027;
        Wed, 12 Mar 2025 12:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFtjXSl18V3cVDW3uvVcF7AOwZPDm8P35ziMG/2MMADWgaMpNEr9E4j/T7ipIz220mu+4PBA==
X-Received: by 2002:a05:620a:271c:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5544e2e11mr1931048685a.57.1741808437783;
        Wed, 12 Mar 2025 12:40:37 -0700 (PDT)
Received: from x1 (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5568480d8sm476215785a.91.2025.03.12.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:40:36 -0700 (PDT)
Date: Wed, 12 Mar 2025 15:40:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <Z9HjMyjzE9XlqrEj@x1>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
 <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org>
 <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Christopher,

On Wed, Mar 12, 2025 at 12:10:56PM +0100, Christopher Obbard wrote:
> For reference, I am working on updating initramfs generation tools in
> Debian/Fedora to include the required interconnect modules. Currently
> the interconnect drivers are built as modules in these distros, but
> are not included in the initrd. That is where my confusion initially
> stemmed from.

From a Fedora and centos-stream-9/10 perspective, we have dracut
updated so that the interconnect modules are included in the initramfs
by default.

https://github.com/dracutdevs/dracut/blob/master/modules.d/90kernel-modules/module-setup.sh#L74

Let me know if you are seeing a specific issue with the initramfs on
Fedora and I can help you.

We also configured all of the QC pinctrl drivers to be modules in
Fedora, and this causes a large number of probe deferrals on boot up.
One of the boots I measured was about a half second:

https://lore.kernel.org/linux-embedded/Z6J3WpeJKIKENC81@x13s/

Everything eventually loads and works as expected though. The upstream
defconfig configures most of the pinctrl drivers to be built in for
Qualcomm.

Brian


