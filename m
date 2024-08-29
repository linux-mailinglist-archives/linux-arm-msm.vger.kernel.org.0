Return-Path: <linux-arm-msm+bounces-29885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B249637C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 03:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07354B22173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 01:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFCE199A2;
	Thu, 29 Aug 2024 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8KxruKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE514AA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724895190; cv=none; b=P6h8Zb/0UCWWMF5GEzzyJy5G/Z1cq20/eJdnWilII+llOds0ZpVebRNqID7rJNp8xxfr9dO9/Pyfq9dxXB4IEe83cGnV3BIEf2SWPYrzE+W0MaxsAp/0uMzlaVtMb0+G22+QFNhsecqL2TRjYTLiDLfVWCVB8cVTsRS9ui1SJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724895190; c=relaxed/simple;
	bh=vcV/EtgfSEZkTi7fPPscq2YKKTTxngZO+ZAgKKqLiA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFk/j9DkbOHrgaAWhWo8dTnN0Nf9xkvU0Qi/G7vff+XtZ1X0v/GRtYPr6qc5PaKsaJsBQtVVX3nuJNhz30NCjFIK4IV9P8oWSmVwZ/PN4pNLb4K3gmjt/COZNHH9u0TKRhMV4t1lA/BRiYIK/LPQkTqAnFL8GRlbbnxDbme2YHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8KxruKn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724895187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guVZQ+4Ujpsmei6SykN5ABhiPcX8ndAIleDb2wTj8Os=;
	b=K8KxruKnLwVEcwXdVwXM++lroroIRjkxQmm+l3pTlZDkKz5c+gSOAmr6HA0Jmm2vzOyiwI
	z16zOxkI3wlb4lUQfZOvaoXEHlFn6YKIlYgnGfCOIXAzLiODcpocFICWK/GLdy20lgB84u
	JKXq4sRaVlGMwJ6faljKtN1s2QM5YZ8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-6KdSxCpJMwCbPE1VkRDKEA-1; Wed, 28 Aug 2024 21:33:05 -0400
X-MC-Unique: 6KdSxCpJMwCbPE1VkRDKEA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a867bc4f3c4so25851666b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 18:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724895184; x=1725499984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guVZQ+4Ujpsmei6SykN5ABhiPcX8ndAIleDb2wTj8Os=;
        b=CP1/rVQ/ox5RcdEndRaiEhM2F64hKAXvpZAfAlpHU1MBINKgb6PzFFAztBwtUG02cu
         CGEnHLNSRsusFZLxFvOVBnl0XNFpQci8ONbVMepcR1Nyvr0NIL+qeTJMom6CT5pUNHSG
         tIPbZyyKJFmxFJ7V8dxvQ/pS7D9lnPAMN5wYY8H9fG4Q88RP8zfzuUdE9IFjyr+Muq7v
         OOFX4gnC+HlRXDIMlzUHAwh/nMsqO6OQod3ypY5C+PbbXV5thsM+cpzRDZVbyXZ7Y12M
         KrdIXiREqPY7FZl+WZfxSKf9sRK5O9iWiy+i9/cNSX0NR+rzbqa8kLDNfgRZQ9pXO3f9
         V+6g==
X-Forwarded-Encrypted: i=1; AJvYcCXytQQ1fqSCaM/Ac1s/ss10RDF3T9UTxEwQ0Arj00C1om0lpN7H/vLMn40gRTFK2DWhtSe0aTWJKjX+DONL@vger.kernel.org
X-Gm-Message-State: AOJu0YxLh6s99UecihyfsxXv5IUoa4xdEPKgv6rRAbIWSQJbbkvqdp3C
	CNX3u8oScfkybo9XAYsYi6LrduFo3vM/aU4ksuWFF6dCKfibuxsp/zRCr/m1xjGyRISeEFwJjw9
	VcJFs5l2ezgB2TIR+RXx2Putcu0tRzNNQvjgNe7y2QNZrYhOr3I8zY7CmXYuQlccuFspHHjqijG
	dd1w64SC3kV0P0os9P3RhTKpids0C3h1raANWd7w==
X-Received: by 2002:a17:907:2d88:b0:a86:9e85:2619 with SMTP id a640c23a62f3a-a89827a3c54mr90996766b.25.1724895184578;
        Wed, 28 Aug 2024 18:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVuaa8PpTIB/qvdANkSSPCnKMBiHO0nIuN3ZJLxTk/dFv47bs73X+AN3Ug+YDJbxCeUQQYDVI5CGCDy1eBC10=
X-Received: by 2002:a17:907:2d88:b0:a86:9e85:2619 with SMTP id
 a640c23a62f3a-a89827a3c54mr90994666b.25.1724895184141; Wed, 28 Aug 2024
 18:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829012005.382715-1-bmasney@redhat.com>
In-Reply-To: <20240829012005.382715-1-bmasney@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 Aug 2024 21:32:53 -0400
Message-ID: <CABx5tqKrsVYQ1yHw3Lkt8sT957xLv-jKwpa7VxUSJ9QRXRGbiA@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: qcom-rng: fix support for ACPI-based systems
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net, quic_omprsing@quicinc.com, neil.armstrong@linaro.org, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 9:21=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> The qcom-rng driver supports both ACPI and device tree based systems.
> ACPI support was broken when the hw_random interface support was added.
> This small series gets that working again.
>
> This fix was boot tested on a Qualcomm Amberwing server.
>
> Brian Masney (2):
>   crypto: qcom-rng: rename *_of_data to *_match_data
>   crypto: qcom-rng: fix support for ACPI-based systems
>
>  drivers/crypto/qcom-rng.c | 50 +++++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 23 deletions(-)

Ohh I forgot to add this tag to the series:

Reported-by: Ernesto A. Fern=C3=A1ndez <ernesto.mnd.fernandez@gmail.com>


