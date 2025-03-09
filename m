Return-Path: <linux-arm-msm+bounces-50746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30200A582F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 11:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C513169DD9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964861AB50D;
	Sun,  9 Mar 2025 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mw6d6KP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A118C008
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741515588; cv=none; b=iKx5ii+sIATHgqz9JgKKc6qdndBACuzIY5UKpzWDNbpeOPDJcXv7mC2BteKRPA0yIE0bJuOZIuVdIFgP+nVZ2p/LjgFHJNWp/6wbzB30QJ08kiQ41I+YA7q522C0L5MFDJL10TZD+jPLIK1ro64T3xF+BT9XMM2q/9fA2GHbzOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741515588; c=relaxed/simple;
	bh=Rz0dhl+0OSiXEy+n9YrxBnJOx9ffum11zQsQG6UtEok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBWJayxqoAvUmyBv9EZmPH6HiW5n52d6pwpBhH5/Qjp0+CtuRopIHysbYlpEqHhrAtsYv76TsEg8DO0f69pK+6zmGTFp0UEmQ5oxxuxJU8XGhA8JpH2jrci3BTGZPYR/IIDBoz9S4EqTXJIfumjJihDxJOwwq7jPDgelrKktZMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mw6d6KP0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307c13298eeso39004841fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741515585; x=1742120385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
        b=Mw6d6KP0AR4AESDAWb621eIf/0fKTsS4+52EWi4D18r/3LWKydb7Xx21oXk51v5itC
         GNzpdYHVa90GsaDYIDWk/spKUrX0dS7QYgtYIGEl9COgBPAyzXUaPzHPzwb5B2jSIJjS
         BXtVV0DBpe5PCK+6/m/HY5EAQlWTxkd12EfHUZpaa01s8kwzd3E4dlYVNvy22hX0rJzj
         mN3DtFH9dnDo+0GCrHOq9JW9BARGOSBkq+W+jNCBr7lQT4X2vibaR42pQzmcQuVjWh0I
         va/U2s9ovD2+gr+kBDn2oZF584kbhLtKSkVP17AcwlkUgqojNoMbXvidiXUVkG/k1IdD
         hrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741515585; x=1742120385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
        b=lw5uh1lqJQtkc03aXhQWkjqz4h6E5DtZX+S8i/DxCumsEBuLeNzW8QXuG0JVCOiM5L
         DMyjkpBkjXDmgOrwdgrRbvFH8D5fHNydDTnal5R0G2A1JDrCEDjgbJO8IUA6Mw96X9u+
         WPE6pxg6oPpM9Zq4wFMY1IO5CmmangVAaSZPWOfiKZFEioia9OrZeRTFEmBO8IKwjUzL
         P5bxOGZSsSAUJ1D5zpnzL33FSq2myYM06T4UKR/KF4+QvuBvwCk9GQdTLLNPEub/ndDh
         C3EVzWmxB5oluymN29P9uZtEHL6et56yWEnU/stl98EqpoiJRssSWgCX03usq2dE5Iiw
         PdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8G46OsjNmJ4Udyi0qsSHvVGiCbC5gAwa0tAbNdq45BQ1dBLxsfGclHII7akJLX74sZcR4lJqgZ4X6+I9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/00YoDnMVxkcS/di3NpMIJojqaCIkqgEyf10oObXdT9srTbJe
	xnaMovKvPmF9J000CWQxE5cJ6w4euS4COWPu6f+vMwzIWHSRIpqyjmNcp2Km3J0=
X-Gm-Gg: ASbGncuU2MtQ6XtdDfMdlhdTXY6gDGGKQI3nQ158IeMf8TPtfjzFSvEwC6KIKGmkz+l
	tj/iW6la+UeZg5Ngg+ap+rdjNfiXhqxW2mmgNg2YyUWYD1Hre5tdgXD34oyIcHbFBR/i6h4J1bX
	QSL5PsDBJ+DZH8XPDuGG081F4KyJjBplZEyzmk2NCN3gm/9jXhh8p9BSCRyv74YhpdfB3+lUbYj
	xzCYGeu6r7ehm99OZ2eB2H3bAsWFOpR1uWTcelzn3btGfEC6/5yO1VhKNKutYoclV8t0fZb4Glw
	nRg/UtU0FaZ1sTB9cwt9n7CkHqWYcS4rJ6oPG9XEH0yHmLzhfRcF3z6NhqlYPCeSrf9Bi609ou5
	r6Rer80roCZXOofv61BWcxPlZYQqlH/01JuE=
X-Google-Smtp-Source: AGHT+IHlBdJ1qjhe/o7S4dso2ZCEpH6o3JPt/ko/A+fRZieBU37zQ/ClCK+PPXWZo0QJwKYGgx8DEw==
X-Received: by 2002:a2e:a985:0:b0:30b:c36c:ba96 with SMTP id 38308e7fff4ca-30bfe3eeeafmr15772901fa.1.1741515584802;
        Sun, 09 Mar 2025 03:19:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bee0c8565sm11460361fa.53.2025.03.09.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 03:19:43 -0700 (PDT)
Date: Sun, 9 Mar 2025 12:19:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <s3zlxsj6gsmoz3rc5fqopi7etfibaurkz5oo5wgvurebx2z3zt@t3h73v5lcmhi>
References: <20250309095525.7738-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309095525.7738-1-qasdev00@gmail.com>

On Sun, Mar 09, 2025 at 09:55:25AM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
> before the sanity checks which can lead to a NULL pointer dereference if
> phys is NULL.
>  
> Fix this by reordering the dereference after the sanity checks.
>  
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
> v2:
> - Moved Signed-off tag below Fixes tag
> - Moved dpu_enc declaration to the top and initialisation below sanity checks
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

