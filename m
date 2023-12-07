Return-Path: <linux-arm-msm+bounces-3726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86879808980
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414BC282971
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4167440BF9;
	Thu,  7 Dec 2023 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCGUFG24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568EED5E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701957038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6axPfpwmuXoAc+1JQucNBxzliOnKigTAtXbyQTKh0Y=;
	b=jCGUFG24zBkiz9ieUkHD6pAlP3XR976aALo+bBZWbO/x8oNnQ1E73i7ZzDiwSLWGeI7KjS
	TmyT9+czoe0ycULjJp1rNnOqin9ZE97sBug7d+vlqffNoKQm9nGrAUQh4nSaraCnIRe3U9
	q6C0sz1qwT5wwanhH2CX+88CVVj4Jpk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-owcaEnCqOqSNgjs-xDORSQ-1; Thu, 07 Dec 2023 08:50:35 -0500
X-MC-Unique: owcaEnCqOqSNgjs-xDORSQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67a9b15219dso11619216d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701957035; x=1702561835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6axPfpwmuXoAc+1JQucNBxzliOnKigTAtXbyQTKh0Y=;
        b=qN0iSoB7RubdI3P3SIYBHJQnLxdM1TUUyv7JVHCMSjA+YokfOJMotf+J2yjFBE2jvw
         OMPzsM0sRMbH7c12WGfnSXPKbw/C9Ix0NNJwTlhWU7hWEvtHu1WGXpQ+ZTSJObm0iFs4
         DA7NMaYdrUuT16wi0kWxyUB2bh8uJNRVgp6W1KMR7qmz4sTe2Ke6mOvN7mUsxGZ2kMrY
         O5gyM8m0jcwE7YVl5KN7HXkTPs4QPYaRO1oKoWvBX37GAbCeQKLvQ9rq3q6dALErpnCt
         LJTPQTm8cknH69lvhslBLo9JRoTTg25IcWfDaIsSehkG1mfwMabhgrYIn4iurYCn/5M6
         TOpQ==
X-Gm-Message-State: AOJu0Yw8GMjw86GxzsLvGgz3yGwt9OoTPWOo84ZBqgp+3EytIru/Txl1
	9btsFSQ+mJeYFmGJ1zutLag/FrHLR/kdWXFceH3ZCJGmgGw/H/twY8PQnTKGrJLLnIIxvBa160D
	bCoSnW/w84ktFFaDJAll5gu7FtQ==
X-Received: by 2002:a0c:f351:0:b0:67a:b9a0:4319 with SMTP id e17-20020a0cf351000000b0067ab9a04319mr2406185qvm.19.1701957035077;
        Thu, 07 Dec 2023 05:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZBWZcIWJ2MV9pzVQHSh0yyNdjibmYG2gnxP3BG1CcupHTtfFwc+icr33hOoAThDYIiluJHg==
X-Received: by 2002:a0c:f351:0:b0:67a:b9a0:4319 with SMTP id e17-20020a0cf351000000b0067ab9a04319mr2406177qvm.19.1701957034833;
        Thu, 07 Dec 2023 05:50:34 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id d13-20020a0cea8d000000b0067a9d48fdc8sm501435qvp.19.2023.12.07.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:50:34 -0800 (PST)
Date: Thu, 7 Dec 2023 07:50:32 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com
Subject: Re: [PATCH 05/13] scsi: ufs: qcom: Remove the warning message when
 core_reset is not available
Message-ID: <cg46pekffsfj2jwazgbv2y4nk5gqmivnksbczfgxlmdi76tx5o@lickjmmfiahw>
References: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
 <20231201151417.65500-6-manivannan.sadhasivam@linaro.org>
 <ru2zdpls5tx2wjt3oknqndikuc4we7d3haeawzrdyl7cbsycti@clx55b27nzvn>
 <20231207051835.GA2932@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207051835.GA2932@thinkpad>

On Thu, Dec 07, 2023 at 10:48:35AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 06, 2023 at 12:36:41PM -0600, Andrew Halaney wrote:
> > On Fri, Dec 01, 2023 at 08:44:09PM +0530, Manivannan Sadhasivam wrote:
> > > core_reset is optional, so there is no need to warn the user if it is not
> > > available (that too not while doing host reset each time).
> > 
> > What's the bit in the parenthesis mean here? I'm having a hard time
> > following. Otherwise, this looks good to me.
> > 
> 
> I was just mentioning that the core reset can happen multiple times depending on
> the scenario, so it doesn't make sense to print a warning each time if the reset
> was not available.

Ahh gotcha, maybe be a little more verbose in that part on the next
spin? As is I'm struggling to get that from the commit message's text.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> 
> - Mani
> 
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  drivers/ufs/host/ufs-qcom.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > > index dc93b1c5ca74..d474de0739e4 100644
> > > --- a/drivers/ufs/host/ufs-qcom.c
> > > +++ b/drivers/ufs/host/ufs-qcom.c
> > > @@ -296,10 +296,8 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
> > >  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > >  	bool reenable_intr;
> > >  
> > > -	if (!host->core_reset) {
> > > -		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> > > +	if (!host->core_reset)
> > >  		return 0;
> > > -	}
> > >  
> > >  	reenable_intr = hba->is_irq_enabled;
> > >  	disable_irq(hba->irq);
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 


