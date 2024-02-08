Return-Path: <linux-arm-msm+bounces-10232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC21584EBC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 23:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51E69B233CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 22:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C983C50261;
	Thu,  8 Feb 2024 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9Eqzi1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9750252
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432034; cv=none; b=Dg3YXUyrJUnhh6e6b1sZuYSpG16H1VwQ6yk6tSKYlWQkjDBvFVy9PWHI+UGBVX3T/pWgatvMIInabhF4mbHbwovPTsTVqI7uYbPOt3kOaRrU87/PcBhwabhuvwAlxKxz8sIMCj0W3hrQqOFa/vFcAiFNXX4Fp6MXmUBpzeuIj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432034; c=relaxed/simple;
	bh=WgiBKEizJ1Nr9/P0edOywoED0tE3kc/R7lk7Gr4hXN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pysvXFL3TYlNXca5Fx88alBUkpwiH1MVrxWh0H97mMtw2bmtPO1xMF5xIL9//BJvvqszuvWXWJHrFizXBKKZeT3qUzfiTVBIQT8GnC5C1BAS1pLLfo10Bz0PFyQfdipfC/xjQiY7Ui+FUMNPOiUnQ6M/xhTceOaiaEVImkHfWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a9Eqzi1W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707432031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ycEPqZLGpnCnzCxSi4khqVSrV3LcSojgaxf6ZNumZw=;
	b=a9Eqzi1WqkbsqlZuBYyvm/g6bXo/IGSisiVP94Ksz8S2FL+ta3vH6V9lLul8mO7ec/dHY0
	NRGkvZluD7eAxTuX54xUbDL5jiJu0DAqJskWfUcowPaIqF3/ziYrUFG1UUFq1kcFxUG7pX
	/FMRymoVDX4zWHYtVPt2oDSx/ZzSAcc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-THGrriQxNPCKSwUHdqxyag-1; Thu, 08 Feb 2024 17:40:27 -0500
X-MC-Unique: THGrriQxNPCKSwUHdqxyag-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-68c53f2816dso3601006d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 14:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707432027; x=1708036827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ycEPqZLGpnCnzCxSi4khqVSrV3LcSojgaxf6ZNumZw=;
        b=jVaIUBYTzYQmA0mbcfNjqRHEoXESMfkmB3qa9GX6ZvEEEfbrliYDYw1fGuR/cHxD7W
         GtRN+MrVZbXs3fg3WrS+a6C7su+tBAzwCC8ZVI/r8sKqTP6dVtfP1aLHonUL7jDYGo9B
         1EhmeqIsC206+/jL7kqNyXBCsRnMoq/UpLFBvag1w0qZSTAVBJrT1spiGssz/VPEV11c
         FanMbSHg0Qbtb7gEQ+1gftbxJg3ftbsYU/JMTM5S5ERfkZkGxr0Z9IbgWqAo7W1Qr61C
         saSGs5ZUeUK0sKQ5iddoPp7cW46+b5poFlc+Xz+KD82zbpDQpIQPzCSlWAamabck4Gq/
         euPg==
X-Forwarded-Encrypted: i=1; AJvYcCXBkijjDy4sHQc+SRTMGak8fnC9/f8ih53Xc0LhcOWnaK+mufbLl0VHBpCdUQNqJnb7xChhOhUBxFDZki1862ul8EqU/eZPrAdSXUxi1w==
X-Gm-Message-State: AOJu0YyUfmCkfbVRCwTgyJghdZmYrUlse1ZY3iec3L20NPHTSrLMwXnk
	Rr47EnDgPl5kknFyLHYGwOGv0zKPmS6ws98teqoSVqpsRyStZ6w+X++atS2eZzgVJavTCIqPvzX
	Zomc7VrssGZJ4kJLavTU+TnfyvQxBlqyHrIbDqmPRPojmKThzxIUxGY/xw8DFLTA=
X-Received: by 2002:a0c:9d4d:0:b0:68c:5d4d:d823 with SMTP id n13-20020a0c9d4d000000b0068c5d4dd823mr641117qvf.17.1707432027182;
        Thu, 08 Feb 2024 14:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVY9IMW/luM8KccH5a1J718sjNe4/VebAq7wJPEa3L5YO/q6oi3fkBE6P6MyZ/xcQrXdWztA==
X-Received: by 2002:a0c:9d4d:0:b0:68c:5d4d:d823 with SMTP id n13-20020a0c9d4d000000b0068c5d4dd823mr641106qvf.17.1707432026955;
        Thu, 08 Feb 2024 14:40:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcKABkyvg/1h3Ln4j2HcqyFpJCJb0KMDbQu/7iAEzOv6TR/hAltgVR9+04P75FiGBPNQ1uqOqHsoC5dLmP0z5QPbp0XKO+6UehmiGqkPu76K2xWEbOJuS2IF3YQs24EGfSIKqcOBthXTms0UQtUybxl9kYUyDJ1Y0lZmrc66R72o+JH589LgofwkVEQimbYfTMGd29KPSbfKEtxyPnSV+qnulT+tIh2sfTl5AK2QzX/X+4
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id ly10-20020a0562145c0a00b0068cc62f3409sm220698qvb.23.2024.02.08.14.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 14:40:26 -0800 (PST)
Date: Thu, 8 Feb 2024 16:40:24 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] interconnect: qcom: constify things
Message-ID: <fikip5ecdzcsud6jh5rk2kvp372atme4kz47jj47eopzasg73u@ziqlnp7zupu2>
References: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>

On Thu, Feb 08, 2024 at 11:50:50AM +0100, Krzysztof Kozlowski wrote:
> Still some things were left non-const.

These changes all look good to me.

    Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> 
> Krzysztof Kozlowski (6):
>   interconnect: qcom: msm8909: constify pointer to qcom_icc_node
>   interconnect: qcom: sa8775p: constify pointer to qcom_icc_node
>   interconnect: qcom: sm8250: constify pointer to qcom_icc_node
>   interconnect: qcom: sm6115: constify pointer to qcom_icc_node
>   interconnect: qcom: sa8775p: constify pointer to qcom_icc_bcm
>   interconnect: qcom: x1e80100: constify pointer to qcom_icc_bcm
> 
>  drivers/interconnect/qcom/msm8909.c  |  6 +--
>  drivers/interconnect/qcom/sa8775p.c  | 56 ++++++++++++++--------------
>  drivers/interconnect/qcom/sm6115.c   | 12 +++---
>  drivers/interconnect/qcom/sm8250.c   |  2 +-
>  drivers/interconnect/qcom/x1e80100.c | 12 +++---
>  5 files changed, 44 insertions(+), 44 deletions(-)
> 
> -- 
> 2.34.1
> 
> 


