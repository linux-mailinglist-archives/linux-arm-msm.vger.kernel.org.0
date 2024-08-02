Return-Path: <linux-arm-msm+bounces-27800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133F9462D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 20:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0096B282A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 18:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33EC1537C9;
	Fri,  2 Aug 2024 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ek60RuF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC801AE030
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621672; cv=none; b=pO7GvYzjjaZDk2YpS/ZnfORJCVNFcqPhO12vPYfor0ON4MRffpGiIBovbdSSbKJkrUL/b9MhIApiEiE0EmLdkr1YkXdgvH3SOfsxzvxrD6MRy4+Q1PbcmeYwaJ3qaLxzENh/w2rNd6Q+r1rL5+Wn6WAsZLVoIIqyd+XZTV/nxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621672; c=relaxed/simple;
	bh=NwqwjZ1ZkmCR5L3cE68C/lUHncA4QY/rihu4kv5E3Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egV+S6T7kpOPrIMCDaxrJNmEU3s4beX4YBZU+PWbibVn98qDcpJ6W2B6Cq/CAPlcWYTorn0iufS56Hsitp+YMEIF5FrpmoWvYuKwzxDAzZuaNaeZ32KvJZwO/bW0MRHh8Kd6NHXGNZpvnyS9lSI8XJdhYrMACrBZnnBybqE0Ue4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ek60RuF/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722621669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HVTfFpaLZUbOaQ0HJhEjOqrkLc8CExWlF+kJqRyqPAo=;
	b=Ek60RuF/LgWh/BQpNK2GhOr2Jj2aYBjbVE8xweClLQOK8x+UNpuVSpZV+8mVPeNY/tLuYm
	frou8eqsWDCYutwLqBUs+viquVlPle6JZ/Rr/8NhrVa9SqoE2IrYJdDhWdKcwvvcp6ugS/
	coZFKDbemeGsLd4NJAhup/CaUDpGg58=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-lWZTK59eN4CaBhha_SEEzw-1; Fri, 02 Aug 2024 14:01:08 -0400
X-MC-Unique: lWZTK59eN4CaBhha_SEEzw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a1d0b29198so895006985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 11:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722621667; x=1723226467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVTfFpaLZUbOaQ0HJhEjOqrkLc8CExWlF+kJqRyqPAo=;
        b=Ndb0R3v8gL40m5xaBzEbn4D5TUgpVvILkHR6C0cQl4soFYOjXLQjSiCLa7PbkqJY1e
         ieYfP3Lt7UM1fndF5oVLgnj2kemYN0tKRAld/DcRU8eIONxW/U0ttDhrBnzNSZifS50f
         ibssR6TNRP1NRZcV7r4x62h2rEx0VwBjCY7NdkwXiHJvWV4tnzMdTGd7khfEYOd2r0fJ
         qcc76XIZ7qPyxBnzWwEoXGxNtzTRZWHyy96mZPIs93pZVPr7F2Qx69FntmOXidSJw4Up
         GWACdn0Hf8A5hPD8lXXp/VKc15WCKyoInZg5WIv8lMex+1fuYpGB2l0S1jev0T9CBx3t
         3E6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj4HCoS7MXYwIGsGw/GvOw6wRkAs+lR493sOkEofwhg1mInya6A3Ew0Q+X7sJpG7FUU/JQH+runxRO9vlB52MgENGdRHRFwDMnxrs+eg==
X-Gm-Message-State: AOJu0YytAu5AkmM1pqPjF0NHrK4apb6xZBd17v+7Ms+Q64463oCg+6z7
	bdk0vHBGOguoz4zsaBXdWcV7qMvM6lz6N6rPrIrbMO2uq6XGpvK+9yypRN8ghzSPUJBLRwcWm91
	RoXFmf9ohQRHRGDxevBETMvIP0cK7dDQmg5E0aScAnMhA8tXrjzKWJ0FIJL9DXiE=
X-Received: by 2002:a05:620a:46a4:b0:79f:735:4cfd with SMTP id af79cd13be357-7a34efaeea7mr554499085a.50.1722621667646;
        Fri, 02 Aug 2024 11:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJErAfbeHi7Cr/9xQl9lT7goXT1BrY20xVWa1C2WQla2ME5KtsJNYLix6zqIYtiFu1FmZog==
X-Received: by 2002:a05:620a:46a4:b0:79f:735:4cfd with SMTP id af79cd13be357-7a34efaeea7mr554496585a.50.1722621667225;
        Fri, 02 Aug 2024 11:01:07 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6dca50sm107699185a.16.2024.08.02.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:01:06 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:01:04 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 02/14] net: stmmac: replace ioaddr with
 stmmac_priv for pcs_set_ane() method
Message-ID: <idusdyewthu5q4j7awi3rc77ncdolt27ppq2pknrbynaobgztc@3xvnkeqml2bd>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpnw-000eGw-2F@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpnw-000eGw-2F@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:46:36AM GMT, Russell King (Oracle) wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


