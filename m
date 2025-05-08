Return-Path: <linux-arm-msm+bounces-57214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BDAAF411
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56A0B7A5306
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 06:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7473D212F94;
	Thu,  8 May 2025 06:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BfsGDDSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC51DE3C0
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686921; cv=none; b=DF79xsyJOlDA4K2kBwPuHwUtlSjmWMQl1Ta7Mu4I8RbZt8ouMW4Q6zjMJEWaXXusFy99/XDDRSODciuQYH1dF+0fAjCg8cnp4OOpIVrooeTaUb/fcVbhd7d4NLsgbLfbBt+nPlfDTlVDHfP++pIoZeU9w/bqh5ZsY99JgDmkD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686921; c=relaxed/simple;
	bh=J+DaIgmJc2plhSf97aDyRcr9UEcA9j0U/cy24sN24Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXOguASO7hQoQbArGoeQ3GnMXXb/rkA71Ocf+sOJDTjhOHdoiOJQTTjSWCGwYFQ5t6+i7hURa3nBCpGCUQcIqQMOaGgwWtGo6WfqqIykteNaBweN00EsHpWnl4c5xU4zuSRuzuoCxXb5NKT2gQUaSkady1+x2pegS2kE372Cby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BfsGDDSS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so362407f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746686918; x=1747291718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oN/u1yOXlCYt4DjjZZ0j855cjiGoWgslKBLO+dZCp3s=;
        b=BfsGDDSSIvF4sf9pj3wrOBnzwCxvnw4Z3tjuMSabkpzOWXHI7xJz1H+7RxuBOTu795
         CopYY/+ooRfrQOSxqR6teIeUtd+CFhyjym0H3Ia3s16qTd7/8ljwlocQ2KgLFtM4YUyH
         UxPrHXGf6kuyR9vp+7/uYd4+98SsObsJd4J/O7YvuTamezH7IUHue3a0Pqpb90zYbOsP
         OoWVWNgQo78pTaC7nItp631zoG+iXjEczMHIEaYZe+LQiVjt+a8AzPju+qOZ/NFi36Xv
         CbG6hFK44mrrytI5Z1k9cxJerYV2twnxV9GyI4my5zqudFIlsDv/wwtDu39zOoEQTiTm
         jF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686918; x=1747291718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN/u1yOXlCYt4DjjZZ0j855cjiGoWgslKBLO+dZCp3s=;
        b=Ki1Qp2ONfEsASK67NSNREnu2FPund6JPlfvfL3M1x3vSIYu+MKomAzoGMNav1mhUnd
         FBJ7sXGkiVNXBu0MSaqaSO9fFrR3IE/RZyMs9ZyjwAKLH6FdTCr7z9sWIKywgc9N7SWQ
         v0129//yA+S8EBmpUW4jvydqCTje5shmPsXwg039KCxAJrLFBbdCKclOYStxOjk4tZbg
         gakvoX16Ry9PmPynhaac8f08cOWGoLa/xl60ZjjVTD+BHPMvbmCqWR0bTyY+Z8iXHJtW
         WPSMEhrdgxIqGvcUOYont225B7RWj2O2IH+Xd70U3F+LbNBoYv6tEFharonNFattnuCm
         //yA==
X-Forwarded-Encrypted: i=1; AJvYcCWAI6blozBtR105WNXrH8V1vleg5kxb2xg+ePKN+EUrsZJpNZ7QmTtD3IzEaf44/zfnXp8vZUMWZn3ppbyV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmu+1wZI0WPDWGpR26drvV4D6TOhRj+dn1ihvZKrB0aaSg6idk
	FmQtSwfoUuAMo+vDwa2WFpSlFrMWrt8ObX4NmLP0wYjnlh6XSTfFaFRlKMS+6Nc=
X-Gm-Gg: ASbGncuUsdyCd51K3cuuWGG6qv0tftaGqP9vrJm1YdMha0FwVmfQHYANpGlVQ8NxPCK
	lGqWdaYBYz3MpIRcWaPHDcSf+ils1QnSbpdVaKblywKlehMGnnug/IYmQdVJ6VIGWhsxbKJQWHR
	SJ30WDPtqQ5zs3gdhQcw+g4zy+GOUPjVGLSI8uPOFC2Bodaa4VDDh6/zCf5LcyCdpylvW0qJC2Y
	qNVnaJNf5vs0FT/QGCTGCXhO3Su9XjKLVdL9AS3EqXB1tSZpmrfKQMqox0SskPMfeXm9Sfu1WnZ
	yKZOYFvkHvr7xI12pdc7ibxtuMsGvz2z2a7vKmCCgdLh4jqvavXHHzgW
X-Google-Smtp-Source: AGHT+IGABSvZpPx8hobskr6H9QpVVUUq1xHoj+hrZLygN8wQiQyv3UOkrESVz2X/i1IQ9NOEjwb+4w==
X-Received: by 2002:a5d:64e7:0:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-3a0b4a19281mr4086914f8f.21.1746686917754;
        Wed, 07 May 2025 23:48:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd38179csm25448035e9.39.2025.05.07.23.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:48:37 -0700 (PDT)
Date: Thu, 8 May 2025 09:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxTwhiMelFjvrjP@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <aBxR2nnW1GZ7dN__@stanley.mountain>
 <2025050852-refined-clatter-447a@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050852-refined-clatter-447a@gregkh>

On Thu, May 08, 2025 at 08:46:04AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 08, 2025 at 09:40:26AM +0300, Dan Carpenter wrote:
> > Hi Greg,
> > 
> > I'm sorry I forgot to add the:
> > 
> > Cc: stable@vger.kernel.org
> > 
> > to this patch.  Could we backport it to stable, please?
> 
> What is the git id of it in Linus's tree?
> 

77feb17c950e ("rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()")

regards,
dan carpenter


