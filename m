Return-Path: <linux-arm-msm+bounces-1185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5737F1729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD311C21767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10D31D522;
	Mon, 20 Nov 2023 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4nROWAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C22CCF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700493778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxbmrPGylWswXo8aLH4U/JNxik/OiDDURPN0WtCCdCc=;
	b=C4nROWAr2KGnlJPp9FMUz20XjlBa8u2li08DX94FBwrF8RXvlTlJV06zeDzkDlfopm1iqH
	qAOtz+VedgNtQUcyP/VIjCm8Uk5P0sCpUcLZ/hSWfOO91JfHzZk4NmstYUp3KVuMqJc+26
	TPynsKI4X9RnO99EKHbrBcZ5TM7v3D4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-lJvrP7QrMvScjeZ1Os-0aQ-1; Mon, 20 Nov 2023 10:22:57 -0500
X-MC-Unique: lJvrP7QrMvScjeZ1Os-0aQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-421acfe16f6so51062621cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 07:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700493777; x=1701098577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxbmrPGylWswXo8aLH4U/JNxik/OiDDURPN0WtCCdCc=;
        b=BU8njl3j0WVYmqTathAtjd80vSRFdfkLje0KSSqn7OX8fxVZLju0S/XP3in4L8Ez2W
         MX2PyJ8BeF2gMWaRpgvf/n4loxTpU7Dkg2ZrUgGViFOuIpkOORHwPLZPqWkU7AJ/Gh38
         3GUM55bjYD2rcOKO664O8MJsvWzglE6kfCt/aSt1CBRsqcctaFxiXUdS3rzJIjMzeloW
         lw8o7bloDRtylUGCCogVw88IA+NuFABBEjXaND6svo8ZAWUcQOWS/BZqxZXuyDHoYU7Y
         xQhD1/uzJdL6uB50geWVtsYcJFI8iis0SVa/jwbgmwyEd87Od/i9iG8D2FgyBkXSB/Fl
         FAyw==
X-Gm-Message-State: AOJu0YydK0l+AzvMfy7PCrUDwn7F6RAy2I41Kc/SUZi3PCCe3q0e2RSE
	hYcSJ5PalBVdR71VyiKD4g8KtgbyeYwIXnSIc5TFWGYmGYGMEzc9TAseokSDGcMDERK00Fn8kNF
	vaHAduLeMK9qbFIH0FAi8EYpR2Q==
X-Received: by 2002:ac8:5b84:0:b0:41e:1cd3:2ae9 with SMTP id a4-20020ac85b84000000b0041e1cd32ae9mr8941100qta.64.1700493776776;
        Mon, 20 Nov 2023 07:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFywBJRydhvu1dXvc1nv2EDgslOpX/xHYvPFOD5M1Uz1taB2jzWvRwaRdsYzsY10DnCgAtv1A==
X-Received: by 2002:ac8:5b84:0:b0:41e:1cd3:2ae9 with SMTP id a4-20020ac85b84000000b0041e1cd32ae9mr8941086qta.64.1700493776436;
        Mon, 20 Nov 2023 07:22:56 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id jr44-20020a05622a802c00b0041519614354sm2730324qtb.7.2023.11.20.07.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:22:56 -0800 (PST)
Date: Mon, 20 Nov 2023 09:22:54 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Message-ID: <74cswe5tivcctmnty3gfavzsxdvjz5m4rktyj5auzwvrndninm@dah4h2fdj3zv>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <041f239f-7b40-4681-8c6c-2268f9c2c684@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <041f239f-7b40-4681-8c6c-2268f9c2c684@linaro.org>

On Sat, Nov 18, 2023 at 12:47:30AM +0100, Konrad Dybcio wrote:
> On 17.11.2023 18:36, Johan Hovold wrote:
> > When reviewing the recently submitted series which reworks the dwc3 qcom
> > glue implementation [1], I noticed that the driver's tear down handling
> > is currently broken, something which can lead to memory leaks and
> > potentially use-after-free issues on probe deferral and on driver
> > unbind.
> > 
> > Let's get this sorted before reworking driver.
> > 
> > Note that the last patch has only been compile tested as I don't have
> > access to a sdm845 device.
> > 
> > Johan
> I'll sound like a broken record, but:
> 
> is there anyone in the world that is actively benefiting from this failed
> experiment of using the ACPI tables that were shipped with these SoCs?
> 
> There are so so so many shortcomings associated with it due to how Windows
> drivers on these platforms know waaaay too much and largely use ACPI to
> "bind driver x" and I simply think it doesn't make sense to continue
> carrying this code forward given little use and no testing.
> 
> Konrad
> 

For what it is worth, I have agreed with your opinion on this every time
I've read it. I am not the target audience of the question, but I'll at
least give my personal (interpreted: uneducated? undesired?) opinion
that the ACPI support in here adds little value and extra burden.

Of course that topic is a bit independent of this series, but I'd be
curious if a patchset removing the support would be welcomed or not by
maintainers, so I'm stirring the pot by replying here :)

Thanks,
Andrew


