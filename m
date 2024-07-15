Return-Path: <linux-arm-msm+bounces-26230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CA931A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 20:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446EB1C21F78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A02F61FFC;
	Mon, 15 Jul 2024 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0oLfcub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D054670
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721067280; cv=none; b=GisuNuaPq/U1TzVWRu8Kkd51fjICXPR4JxhvdKLicu4QQWY5tZdYP2tT7BbwzDW1NRUCahDRYJONQGDT0aSj5Va309Q96OOrm2Vacf9X3jB/PeGs90cGK5d1KTTLwHtr/1x+4n0f5UHve5WQjxUGLrMKj6GnKSHkrPe8K4mD8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721067280; c=relaxed/simple;
	bh=kOPIQAFY0C9jKf9GWSFbVnvhzxm8W7Mj1wAmn5+Ju2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oet8UA/nAVKUH/Zx2aj59z2yijr+EeLriWq4wg0brh0z3SAe86Hkt8c2r88w3P2w1lzXSlEHpd+O29W4MajcNkXj4aR6qxb41DqLhV98s09lOhJKV/THJw9Cj2KLVVMOnmZaOPPbf1EZhf+VZepT/gsGie2YM5jzc8x1J8v3rzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V0oLfcub; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721067277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h65hcyq2faj4hpcGQ58xMuNAhidSbVZfT6CrANnVJxc=;
	b=V0oLfcubL8+zXpCUJzWzXlL6mnOLYB/JQPhIagl4KFSHAe8idQVDGQrxaqk+Rcmoyzr7yu
	gppBMrWoUNn3LX1Ns1Pyvs/PFDW2MAHUtepgN1gCEgdEc37K1lzZ85OI4up45z9LdZZMA1
	RpjSPwM5VdrPQhfU0XrTz8iJNfS/xH8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-jdKukvQYPAufmezA21jEEQ-1; Mon, 15 Jul 2024 14:14:36 -0400
X-MC-Unique: jdKukvQYPAufmezA21jEEQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a16375187aso290804285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 11:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721067275; x=1721672075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h65hcyq2faj4hpcGQ58xMuNAhidSbVZfT6CrANnVJxc=;
        b=sL9xlUm6eNF4SP3BmDVz7PMqK5/mL1Hy/12RvsMrXypw37q4zehD97jcY89yeUPBhR
         XBGt5iwqFhCWYbDg350Wf7cykhBk3HQzYUafyi0g7NHqPNO5aeQbTABHLnTJzrMphAqG
         LLVTzPO/3ewe00X6kxQtbqmH/TnuzNr5lYNfdDt9pk+iPBTgAP4hRe0YGB+djPr/LqLn
         OBZT1jJ+kDMeEOvSTvZcc0YG4Sf5zyOFDVZkk46UZYiG7587TiHCuyvgWgC+N6zEskSb
         O+RdrLl4RmXiWwWZm7MQoa+fp3eS7hqk6kl+0fBJ8OT7R3+NQxtCAYpDAQ1FgY6QFyJs
         5zgw==
X-Forwarded-Encrypted: i=1; AJvYcCUt0ecUeHp9ipkCFQmC4XLcRHK11fe4BFzvmROW55ysT4/aXomZ+ICn8Kx+8RHL19vdxgjcBOVVuaWIDaynpa5gzKOlS5Lw0kjhXBjzGw==
X-Gm-Message-State: AOJu0Yy9Gj7Nek6gBS2AqEOJdlJpx0DTwb0sL7XXrwmncQ4vYSR6TQ7z
	Ati5oQtlvNK+d2BPz7uuLzVbcMrRuff8rWhoZ4iZFf8Ji3Ptd1lILTlmHBvtZuMCOFKNUYIt1U3
	/EWd32ELnuTE8jikl12dvFe17JSCmvtZc+kfXf229+R2knkunb7dPML76Vqpo+cg=
X-Received: by 2002:a05:620a:4724:b0:7a1:456b:fd43 with SMTP id af79cd13be357-7a179f424b7mr61727285a.37.1721067275557;
        Mon, 15 Jul 2024 11:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsG+WJZFOfNJsOhrGBT5TVXdo70BHb+PnBtQCyI63G5MKuUpxlC51GnL/HJ/4WDSEQ3Myk0w==
X-Received: by 2002:a05:620a:4724:b0:7a1:456b:fd43 with SMTP id af79cd13be357-7a179f424b7mr61724885a.37.1721067275255;
        Mon, 15 Jul 2024 11:14:35 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160bbe7f9sm222498485a.43.2024.07.15.11.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 11:14:34 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:14:32 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Mark APPS and PCIE SMMUs as
 DMA coherent
Message-ID: <nulprwjd52j2iq7cpx5nq733cbi6ccdpemq6a7ocglv4ep5jmh@jvs6zof5u535>
References: <20240715071649.25738-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715071649.25738-1-quic_qqzhou@quicinc.com>

On Mon, Jul 15, 2024 at 12:46:49PM GMT, Qingqing Zhou wrote:
> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
> mark the APPS and PCIE ones as well.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>

I think this deserves a Fixes tag as well, not treating it as
dma-coherent is a bug and can lead to difficult to debug errors based on
a quick search through lkml.

Thanks,
Andrew


