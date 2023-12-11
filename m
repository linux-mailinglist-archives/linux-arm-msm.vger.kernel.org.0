Return-Path: <linux-arm-msm+bounces-4267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45180DB1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 20:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A4F1C21637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 19:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDCC537ED;
	Mon, 11 Dec 2023 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gq0t0PVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF2BD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 11:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702324321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qq03Jo5f/IYnaWG7QuyK0Yjjv5PibXRKmzmjiucs3YU=;
	b=gq0t0PVlaEqe2ACtgVAHZjgJ0286nA8r9xy6VCRESI+x3ROwWyHNlKwn2sYBswIWZhs2Vk
	Lp0CHA9NuE2IhXeLuvuD/Qg3jtrgD3P0SbEE5BJzjeHIaS30yAfU6XHuJR8t8aMcGIpHUT
	5O470eQ/dSWRr3VCjGnHPiweiFYWrKI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-hlxMlchWOhC4WwTR30OTsQ-1; Mon, 11 Dec 2023 14:51:59 -0500
X-MC-Unique: hlxMlchWOhC4WwTR30OTsQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67a940dcd1aso67481666d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 11:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702324319; x=1702929119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq03Jo5f/IYnaWG7QuyK0Yjjv5PibXRKmzmjiucs3YU=;
        b=XStFNyQgTPBxEXFHdFwLS3LynRY8Qgm0SIkfokXOcI2cocV6Kw2b47Fx/U32QIjxGp
         w5/NXDwiNYUZgcNhOH4ZBnimdieYlvflX1Wd25OitfFEp+tHc/5DpnQa7GtYxoQqbydq
         lnzYuHHZ8oEv96at91YHUfDA8EgnRvwYe86SQdh00nSGLD2euWujm71Fh4/r3k7JYaXG
         EBOBLZJgTSPQQE+kCcCYzJvLeLuuVW4NnotDj/Ac/LtuIa4DWHzkaxwII0A522KW9GP9
         SULomaNtLbzpuvJ7UKsFnIW+ZKEZxJEwy8GeRt+L6aev8BVfLE5W4P7N88qT0U/V5hpv
         hCzQ==
X-Gm-Message-State: AOJu0Yy9614VO1X+lcu95KzSReui7PZviJ0yXR7hXTGCdHIAbUtZsjMp
	HdTXHBzbZ4qXACwKXTLWo7y9L9uSaA4iQKgSlmPr9ItOsQmWW+6RgcjVdmABJJ6qJLaxqV2itAp
	hYipVEVeEzsJvG7Oc7u483OiLuOsQybJdTA==
X-Received: by 2002:ad4:59d0:0:b0:67a:a721:82e8 with SMTP id el16-20020ad459d0000000b0067aa72182e8mr5502190qvb.66.1702324318987;
        Mon, 11 Dec 2023 11:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4+eOMOzP47aZt+EFlhHkf0eUx1qMFM1Dbo85dg2KxXg+o2VYJKcQRK6XmQpPp0Imc+Fr/KA==
X-Received: by 2002:ad4:59d0:0:b0:67a:a721:82e8 with SMTP id el16-20020ad459d0000000b0067aa72182e8mr5502181qvb.66.1702324318771;
        Mon, 11 Dec 2023 11:51:58 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id bo14-20020a05621414ae00b0067aaa7483efsm3533358qvb.6.2023.12.11.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 11:51:58 -0800 (PST)
Date: Mon, 11 Dec 2023 13:51:56 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Yaniv Gardi <ygardi@codeaurora.org>, Dov Levenglick <dovl@codeaurora.org>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Perform read back after writing reset
 bit
Message-ID: <oyjzluv5ldvurqzsqiwxnjtmpvvjavkdxvbetwctq7qentdjbh@r27gvlj62scq>
References: <20231208-ufs-reset-ensure-effect-before-delay-v1-1-8a0f82d7a09e@redhat.com>
 <0d59681d-2d7d-4459-b79c-c5f41f20b7a5@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d59681d-2d7d-4459-b79c-c5f41f20b7a5@acm.org>

On Mon, Dec 11, 2023 at 09:59:25AM -0800, Bart Van Assche wrote:
> 
> On 12/8/23 12:19, Andrew Halaney wrote:
> > The recommendation for ensuring this bit has taken effect on the
> > device is to perform a read back to force it to make it all the way
> > to the device. This is documented in device-io.rst  [... ]
> There are more mb()'s that need to be replaced, namely the mb() calls in
> ufshcd_system_restore() and ufshcd_init().

I'll poke at those in v2 (or in a separate series if this is scooped up
prior).

Thanks,
Andrew


