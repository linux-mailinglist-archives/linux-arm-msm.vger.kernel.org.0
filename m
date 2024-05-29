Return-Path: <linux-arm-msm+bounces-21015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9FF8D4073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C345F285122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 21:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009801C9ED8;
	Wed, 29 May 2024 21:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZHO7n5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A5D27E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717019085; cv=none; b=dlTRn9UHVYd5X/7uBSrzSYiZGD2IpAwJevlG/FZsv2qmXjC5dMdCjJR/HB3MEv+kkX9Q5RaYbiHfG2qJHlJYNyQsIFj4UVf1U/Kbn1x3XNGYN07a5+oITjaHPD3ewaooFRpVoFgHLBHZVL9wf3KUsBpELdFjXkS6+RcAGZrjs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717019085; c=relaxed/simple;
	bh=rwV9a04/damkbwWjfkc/cg9LZ7d8ZxS5hVCSmXnjbaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyqfQgn5qNzj7625GekqaE5ylSIHhVjBfYtt4YapCWdAwIa9ORiltBAE8ozjTkMfLAP7XFbm31REavo45oPzPTVDevQj7g02ejqzM7CaM6+TGp16ZgfyTBZ2Xvaul8u1gLIrkWzAnTNaw3NSykcqygQudlgMEWHAhYrGdz92uJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZHO7n5l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717019082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0hpOX9YOg0pCIp+iiPW9WCgKyleqs+d+4Let2HWBPw=;
	b=BZHO7n5lPZdKSSFSeb0oADmilwD/boBvFlv2alfK7qqvxXfCSuWXY3m8TWyBFQTrMcEa+x
	ipoI651uvP429klzYtNFcldu5yfEeBMHHxmU6SEQSKrbAW5s6R+QR+n0TYCnMlqPwEXXhJ
	obWWNj3ycLNAPomkZEhLRy4b5UnVGjk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-4THND4SaOIyimfuSvbK42A-1; Wed, 29 May 2024 17:44:40 -0400
X-MC-Unique: 4THND4SaOIyimfuSvbK42A-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ae0fd9051eso68136d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019080; x=1717623880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0hpOX9YOg0pCIp+iiPW9WCgKyleqs+d+4Let2HWBPw=;
        b=E3xaxkKR3YBzHSOz2a4ic+3tcDi6zsJ7XfzJniQCdTFNUGibaatZRQFYobn9Xfhd2u
         4RQtdSJSfAh7k7sunLd/bgtk/Nz6KuYJKfco3MyDV8I+zGwT9qfOkprR1Att1zra1Ybo
         tHsPwIjiHYH7purL2Ir+mUuE80Y5F3nwc1FLmJ9+21Zr9JNiVtMLymFZfXNVPWfGqfYw
         qkQDklK3IhEqi3h3smnOYawJRnph7mk2OQ7o2Zk20jnpNgyU3A8B3HSxIYqfCNqdJI6q
         2gq7zFpOOXQKlFi82Z/6EHjz/Gye7Z5EndGMtyVjuNGaPtOPml6KryEbxHg8FsgiK5r1
         W1gg==
X-Forwarded-Encrypted: i=1; AJvYcCWEgiVAyvZEKn8nRPX6kor+tvWGR5idDnskeELW1BcWU92dgR8GHMsRdA4hNfHh9QqPK8KpzyrZz30eDr/oN92ErKTBqaR+G86wrsRNOA==
X-Gm-Message-State: AOJu0YwsbQkRh8jlLIClM/1MZDJiqe7s8Us5TMqX9rtIx5gSsx3ZmLzY
	aGzANOchrv4Mlu1LKNsQlcyzibW6D6s7LXtrlymnOnOY9ylVQHPkvQScoNBpSYHh9qsaGDcjlSj
	Mn3PTzyFshqpnTYJD+b+CTw2lvIzD82ppEhVnHy4cZpbiPKKKcKvACM2/8wFQp8g=
X-Received: by 2002:a05:6214:3904:b0:6ab:8412:d7bf with SMTP id 6a1803df08f44-6ae0ccaf367mr4791856d6.46.1717019079916;
        Wed, 29 May 2024 14:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsFnEGiYlgZOr6BT1kqH8lOCeoyPP2kdowylSkFq9MED4xGC4AoewRV8KgtQLy1zmosdrIKw==
X-Received: by 2002:a05:6214:3904:b0:6ab:8412:d7bf with SMTP id 6a1803df08f44-6ae0ccaf367mr4791586d6.46.1717019079276;
        Wed, 29 May 2024 14:44:39 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac070d8f3dsm57860966d6.33.2024.05.29.14.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 14:44:38 -0700 (PDT)
Date: Wed, 29 May 2024 16:44:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/6] net: stmmac: ethqos: clean up setting
 serdes speed
Message-ID: <3lpjpljgbgig2hgzywnevjixtfuk2pnd4ijscraks6n3gim4i6@ro6a3liims4t>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
 <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>

On Wed, May 29, 2024 at 09:40:59AM GMT, Russell King (Oracle) wrote:
> There are four repititions of the same sequence of code, three of which
> are identical. Pull these out into a separate function to improve
> readability.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>


