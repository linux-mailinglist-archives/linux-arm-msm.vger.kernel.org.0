Return-Path: <linux-arm-msm+bounces-19845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D058C5882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 17:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A551C21584
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 15:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9107C17EB8F;
	Tue, 14 May 2024 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T15Ti9z3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1917EB82
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715699503; cv=none; b=lRY+zWgJc6kmm+8tDKLYCYJyzh1RIZwAZ8MO8hjaP+Pr5FikFUzxPlreDo1YSnE9/VW//G9g2CYxeprYcnJZv40zm19WrxJdBz72MJ1+up1FRi2/mDt0Xn5kK7L9XiafbeY5tu3bIjp3mSkL6yjLMU3Q1oSyYKtQ0qBWecrZusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715699503; c=relaxed/simple;
	bh=NL1KHWtYv3QKUfmEMXyKfHmHt/nVGsCsOJA2nvTmHeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPqh+rW8RxX0FjXebd02lZMDEiMZc8zIYUoO7SIe7CEZfYvrTgCYmi4rCkPftGFqfa7UX61uNKZkBuJuqMyLKg+f04Ve7tqLqlHaSkxg5S2/yowNGbJE6RZJnyjhJXWkFM5evWbkuyHs10O2fGQf2UGcFMmIFQQdWdCjLIKzWRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T15Ti9z3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715699500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4cnIUuYkHWIx+FjkGcvXg8Ni+ZK2m6H2U3SaL0bU3Wk=;
	b=T15Ti9z3Tg4ve//nuVtmMMDZulmqh1fmE0TwOXimKtMhsxTudgUmjYvvBeVoHdhvdNHq1U
	gDJyXXx4dcneP+ZJ6JHvs4ScMJiAoNNw0QyacqMeVj+9Ky5XqgOoptIfsQGNftnbf6LGOR
	zJw+DRuYa4j+EX6QqMNMoSHfSTyrZ7k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-P4VW_XaIPxOQDZn2xs0_iQ-1; Tue, 14 May 2024 11:11:39 -0400
X-MC-Unique: P4VW_XaIPxOQDZn2xs0_iQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-792b8d07e71so833362185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 08:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715699499; x=1716304299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cnIUuYkHWIx+FjkGcvXg8Ni+ZK2m6H2U3SaL0bU3Wk=;
        b=lnQ/wsRdm39yELfu9661tCqxv1qaYie2sa4GRCsMOACwgGzvzRCqEvwLnJUMi49Oqn
         5e/Qqecn0+a5TMqnKGItIVdAHSka9DKeLLWrwQyl7EBQE065YtkvePNqASCrEt4z1rL/
         +8Dtq0nlm2QUlZ0w2fzsY41m2npwQyS4WuA3XmBrguY5OiMv3s9IaS18nsvYJS9IPsXt
         Tj9umxs8NfrrZIzxIm8vhAGvED34PXRY6GveEElRQopFxnUJKgi/7H+fOwlsWDXOjEV2
         KjAO7T8vGs4XdgXgR84njcVNxqeDbHMuQJgU3j3LJJ+wS0Jmv1rqPsSfQVmfUGu+XyAj
         W5/g==
X-Forwarded-Encrypted: i=1; AJvYcCW3PU/7PozInO54T/uAcKhqzTp0nxn8PtRe/NrqCShx3H2s1SjUrN+6dxd9hy0Wm39FApKgvTmGc3jLzY5pQGYItZgun5kC4QzZHx4vqQ==
X-Gm-Message-State: AOJu0YwthDzqc7HvLNPdRlAEKHArO5yDaBZDlN2ymUekSkAjcTin2GLS
	9vO5T9ByMlHABNQWvoAa+n4uI4sbkavPuTj+fc1Lh4USj+T3CFln0+w42LjnFxQBQTXOioo7RaD
	ATJuuisQC4dZgjqmFF9rrNGvU7dOv3Gqeo+3A2F7CDpJw9O/F7Yt32zL0qNsktyI=
X-Received: by 2002:a05:620a:1248:b0:792:ba5c:85ea with SMTP id af79cd13be357-792c75a0384mr1329257885a.18.1715699498426;
        Tue, 14 May 2024 08:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4S4VGlqFkjBvHME2OCbJc+xM35zlrwB2nmBbAdAlvnOFUj9Ev1YE2Zow33l3IJrgZpEtiKg==
X-Received: by 2002:a05:620a:1248:b0:792:ba5c:85ea with SMTP id af79cd13be357-792c75a0384mr1329254585a.18.1715699497938;
        Tue, 14 May 2024 08:11:37 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792e4c1076dsm165732485a.130.2024.05.14.08.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 08:11:37 -0700 (PDT)
Date: Tue, 14 May 2024 10:11:35 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
Message-ID: <3werahgyztwoznysqijjk5nz25fexx7r2yas6osw4qqbb4k27c@euv6wu47seuv>
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
 <5z22b7vrugyxqj7h25qevyd5aj5tsofqqyxqn7mfy4dl4wk7zw@fipvp44y4kbb>
 <20240514074142.007261f2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514074142.007261f2@kernel.org>

On Tue, May 14, 2024 at 07:41:42AM GMT, Jakub Kicinski wrote:
> On Tue, 14 May 2024 09:21:08 -0500 Andrew Halaney wrote:
> > I don't know how to figure out who takes this patch in the end based on
> > the output above :)
> 
> bindings/net is usually going via netdev, but my reading of Krzysztof's
> comment was that there will be a v4...
> 

Ahh, I read that differently. I'll ask Sagar to respin with that comment
taken into consideration!

But ignoring that, let me know if there's a good way to know who really
picks things up outside of experience contributing. It's Sagar's first
submission upstream, etc, so I've been fielding some first time
contribution questions and realized I didn't have a good answer to that
other than troll through lkml or the git log and see who picked those up
in the past!

Thanks,
Andrew


