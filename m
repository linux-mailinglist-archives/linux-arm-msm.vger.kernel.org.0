Return-Path: <linux-arm-msm+bounces-1359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBE7F3032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 332E4B20EAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFB954F83;
	Tue, 21 Nov 2023 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxINk/VK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E4210CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 06:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700575484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg4k/3dlZcCU56aN6iGyLYrEU5FjTnslfS62KZBVgEc=;
	b=VxINk/VKOA4mLSywpJ6z+oR1lRbR4lN7S0uvrb3CcX6USmuOdCry0bUS9ncDSX2kqS/Ifx
	58cz07kqBjEXEXWR76JipZWlcM/o49+aHy2M4IiF+8foom2wwuwuxURvFRm9a3UhHJlvj3
	jfi+vrIOA8voI1mpZTLsUZojw3iC+Lc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-S3aSH0knOG6yR6oEgpuqrw-1; Tue, 21 Nov 2023 09:04:33 -0500
X-MC-Unique: S3aSH0knOG6yR6oEgpuqrw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-670aa377deeso43439076d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 06:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575458; x=1701180258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg4k/3dlZcCU56aN6iGyLYrEU5FjTnslfS62KZBVgEc=;
        b=wKpboOZC7YfAWklgK0aTYNIHdJEWNEupsDR2Sj4f+eOwO3VirlnJhtxQNEcy1T7C+f
         vGaouuow3HOB+Lez2+n460uTNBmBYyoHwLISqwNPMWuypqXEV5H8cPPWtGrwcYb9KayB
         qZ+JyPQqiKe6Ucfv0vx+useiyAB/F+eqGQyB/u3exzhaCOcjihFZrCysGj0AxjTk14Y8
         r/W95QTWNvEYbbPRf4Gbb192ukLIX2LDShyq1Xsu7TRLVxqdCDaa8pdEivOTAeVwRvRp
         BscTJfK+FEDJJgACKA40gvEiW2XC0yHTeYQJRPoYzu6dKBEWeU8dYO/l4oOvBM80r/Qt
         YJtg==
X-Gm-Message-State: AOJu0YzeQEFlVhHbO4BxeRoHsSudIAgv/5EeQgd3iOuPZVJll68weQO9
	PwNpzngjgiITVM5TDzHlOQTpE9LmgxGji5sha1Ogymv5nVNHljEQTDSzVml4Z4xpzYHdyjU+QqQ
	/OIYc/f7s/MbLzhQefDWgX+RwSA==
X-Received: by 2002:a05:6214:e4f:b0:679:d33e:352a with SMTP id o15-20020a0562140e4f00b00679d33e352amr8633030qvc.1.1700575458632;
        Tue, 21 Nov 2023 06:04:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnLik0eV74HqD/F8NKb24Z8lRgzXhSPmwf6CP38CjCe1HMvqTyw81qfCQiYOQyIHdj/5K0Rw==
X-Received: by 2002:a05:6214:e4f:b0:679:d33e:352a with SMTP id o15-20020a0562140e4f00b00679d33e352amr8632999qvc.1.1700575458385;
        Tue, 21 Nov 2023 06:04:18 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id b9-20020a0cfe69000000b0065b0554ae78sm3930045qvv.100.2023.11.21.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:04:18 -0800 (PST)
Date: Tue, 21 Nov 2023 08:04:15 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] USB: dwc3: qcom: fix wakeup after probe deferral
Message-ID: <syszua6kmso3k4zfvwwsfjaq4ok6gkexhfli34r3dtjhn63vio@dwhhnn5b2s5b>
References: <20231120161607.7405-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120161607.7405-1-johan+linaro@kernel.org>

On Mon, Nov 20, 2023 at 05:16:04PM +0100, Johan Hovold wrote:
> When testing a recent series that addresses resource leaks on probe
> deferral [1] I realised that probe deferral can break wakeup from
> suspend due to how the wakeup interrupts are currently requested.
> 
> I'll send a separate series for the Qualcomm devicetrees that used
> incorrect trigger types for the wakeup interrupts. Included here is just
> a patch fixing the binding example which hopefully will make it less
> likely that more of these gets introduced. Fortunately, there should be
> no dependency between this series and the devicetree one.
> 
> Note also that I decided to include a related trivial cleanup patch.
> 
> Johan
> 
> 
> [1] https://lore.kernel.org/lkml/20231117173650.21161-1-johan+linaro@kernel.org/
> 
> 
> Johan Hovold (3):
>   dt-bindings: usb: qcom,dwc3: fix example wakeup interrupt types
>   USB: dwc3: qcom: fix wakeup after probe deferral
>   USB: dwc3: qcom: simplify wakeup interrupt setup

For the series:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> 
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml |  4 ++--
>  drivers/usb/dwc3/dwc3-qcom.c                         | 12 ++++--------
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> -- 
> 2.41.0
> 
> 


