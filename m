Return-Path: <linux-arm-msm+bounces-22010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E058FFB6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF031B2266A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 05:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A3314F105;
	Fri,  7 Jun 2024 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFIz5l6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E914EC72
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739342; cv=none; b=M0Ij6ijDUf4rbUUTKhQW4v3VAbZpSaN3paIvnsolHMCjcrvhWpnCLfI0/x9DekkU5H/Vq1DBH8uZuIyDtvsM+Wo993FHZ9XMucfQ6Dhydin8g64a7YZb3i41j919dBKLHITHWGr2TdeTKrJJNYCOWveGAmHd7D84Ya3AbsNA/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739342; c=relaxed/simple;
	bh=utoyZmJ3ad8EAeZqrHVGF5rFBfilwKGnsN7FpZP8jxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q05K8dJawqrGXvkHfuim1qm3mlQC6kV6IZem0mu5Dat2QsdE0V9rwYfqD0vb2ulIkFgbr7Ix8TFlINIICB/T7Sibp3eXF/84pFx32PG6bC95lVcMGF/MK5sNZcCQr8DhJXyBmP7DHp30HKed5jL5PQ2POy8fiIFKaF3uoLIacLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFIz5l6d; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295e488248so2095066e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717739338; x=1718344138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPpS30B8oQddbNIA4e5SgwQLluo/cGUrwr2ygS5Damc=;
        b=hFIz5l6d+MEMEVcgMdzBtM7tePyuW+t27q6n7ZRauwsN3qcybSZZvwKMyiA8clTs3G
         mbU6k09lS68uGhnDGMGe0w7kxLA7PobSsA/cBP5QBVY+x0nlrhlgcZMHEfDny7qWoPtm
         0FoUkAEQsOKEQ1YxN4Gd7sotpLDGptvzXQtd5+fZ4DkFs3HW5UlRDgn0mnBUnwtYwA6A
         E/7MlhTSjADJDJ4lTyXJXJ+9VgqZMdr3BmkKD9UnWjzT3I9XwofBuTl3g+PL8Fjy/CGL
         Oo8n1ubmS//QL/cJcJbbOMNxNZ8ydozDpssq+0u0gU/6O9QzueMaReoXOX6wz9Fc3osw
         FAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739338; x=1718344138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPpS30B8oQddbNIA4e5SgwQLluo/cGUrwr2ygS5Damc=;
        b=VtqsFi9TiPV/sG8opIultz+VmKFhPMptQX/I4cSPQyqTntowKXJbU19BR3+2giMw9j
         FhPefyhnbQ+H1jHc+kSqsZ2pGxL1h/ufZPfLf5CTohoH0P+VcdOR0LM2oCdecNONCnzC
         0/e4MiD96o8VunWOhQTCacPuY23wIWZrEjmEWoy6CH6by6xCyANSvQiUzsHL4KneKISl
         kYdzGf4+YJS90hXd/EySNspmX/5gVuoiJFQMvEAR4fVB/8JWFw0QOgQYf8mJQHmri9IE
         2/syK8VuGykpEfZGWPNP3rQinRfPmzbt3ffpMtSrHlmlVxUvtmUvNkZrAsCvRAGCTqNV
         wQqA==
X-Forwarded-Encrypted: i=1; AJvYcCXIEfU/Pj4ajKm70UPv0hSsCFCgZt2azbeLrbHnAmypGapaSIp1vpyNncuDqeL0C5s1a3Oauyr9fGXDYrKg8V3/MvgtRePFwcSirmsXpw==
X-Gm-Message-State: AOJu0YwLse3vnkQQSyav4GWADPj2Q1/qdrcJpGd2vrLiLu6PxN2CdYd7
	r28b7HN0+jGkPFq5TGiji7mzlz6+pJ56LpQHZoJLBPB1qohbrhTWuCwRNaUpJGw=
X-Google-Smtp-Source: AGHT+IGw0dCYsbVAMVTQVSr/Efue3frMR7uLAH7tvS6pOQ8ict7VhL1BeU2I9MYTimaWhuBQHujsnA==
X-Received: by 2002:a05:6512:39d0:b0:52b:74c4:2731 with SMTP id 2adb3069b0e04-52bb9f17605mr1374676e87.0.1717739338307;
        Thu, 06 Jun 2024 22:48:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bbe91a731sm55425e87.82.2024.06.06.22.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:48:57 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:48:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec-mux: ptn36502: unregister typec switch
 on probe error and remove
Message-ID: <ywpdbvubmgmqebekpj7vzgwicptineathd55725qkrda45sa6n@6zil2klvoj4p>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-1-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-1-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:13PM +0200, Neil Armstrong wrote:
> Add the missing call to typec_switch_put() when probe fails and
> the ptn36502_remove() call is called.
> 
> Fixes: 8e99dc783648 ("usb: typec: add support for PTN36502 redriver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/usb/typec/mux/ptn36502.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

