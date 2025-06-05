Return-Path: <linux-arm-msm+bounces-60343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E627ACF38D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D41516A5C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6571E834B;
	Thu,  5 Jun 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="Yogg4UR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1F1E25E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139091; cv=none; b=qLGS1e8mY6Gs17Ht8QIvnxAWgM9ysRYIuvGvHMYT8k/omCKroN7gJovqMUsSnJEaIcXArzWuBuZ5IvYf8pmpzEdYJU7EXOqL1kE4Yzdo5b+sN8uNGufw1TQGIJ7DJ62Ocadg+VfkH5tXN0pOleaeBOp93DlfuJLiXvMkwgXR/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139091; c=relaxed/simple;
	bh=vvxsdQUfbACEHt/eKBX1FbZkUxMW64PwCAQm1kKd1aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVYcvD7pOLHvk9Zzwnt8T+GD7XcWJY1I+MRiEDbfJm7Fj6edHzP+hfRyS4Fk4GB7esZFIIOnbKeEeTwjC0eAjmtAWwDUglgOvWd9vTZAyBRx/zdZvFpeZJT14cf7iH9xwy8yjzHcWzQKMNkNteujtoW5WBlRowJpbjFLmYis7Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=Yogg4UR9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-552206ac67aso1328892e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139087; x=1749743887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=Yogg4UR9qXNQnQXykkygTXAAwxWobGNHOHPlm0CcF1Y5PaewbzNNS1uOyM4Wr9pSLt
         noRL59WF148p0TeScTzDsmcx3ngys2nVfUyj+l5bIaOFrCQ9sdhsY39hUslxFWw3K3iF
         oc4oeA4RDciQ5RwDti9H26qL4aWWdzZaWh+VAmz74CEPu78dsw7CjZllDhP3tBtfJrkX
         88XLTUUUJOKprfCN+DXy/gfvB5eDOGnPKL1k8sPu76o6s9Ne0Qo39GexQi1TLJjyExe3
         AXHT+iR1zid0Qg5RrP/q45hNi0NdaBc2jUifChK9BDSfJ6Nb6NlYLSjmsexNsAELRgHz
         4D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139087; x=1749743887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=tNtpAS/vdq7YNiInOO28n90lQfbLx9KnX6pSoUwSpEaFM8Qf2SNG9oS+z+JKws5z20
         sZiIgxEnWQ8ubcUS8GO/LijtODAOuaC1BQ9BSU3QO8rLm0rnkhv/fS5xoQvKDDQEQZAS
         iXsloIKlVW80RmGRxbL4eqo7NMBLgwcNilS89hdVxGRUdcEzvyHx4T65zB5FSQOMD35e
         tQ5LFjh7CRUICwvLLwCZJjmCTKT7ZOkhv8ci7oDX/1p1x1RCl2jOOsQdnyICPIiQYC7S
         a58JYqbfcID4/Wo6hJ/XLhXHJIuA8BmOF4TKLDMkzSv8LUwZGJXni1+ri9zWd/9Cajdx
         PlWg==
X-Forwarded-Encrypted: i=1; AJvYcCVml9uBLMa8YIEIB0pAkxsB9HmUxsHepb43FCuiA4iL57HcUlshmPEEMPQjOuFbSIsaYxkyKg6ZG2owYBPq@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDyKNHmiAefkEMG+X2i8dJrVwWWqr6En9s4rqAMsccdHfb7sz
	CCq7+kCmmhrJC7TQJ1iuiYq6R82EQRsS/4ozzdbg14T3clFFgUormIj9DflYX4Pz4/xW9PswhGt
	juX2DNE/Wxg==
X-Gm-Gg: ASbGnctEdjT43v1x1C8NJudpHHeYZO0G/xU43ZaEbOpw+84/JQafWpCB98kH18vcldo
	66YZhGDVGMWBeBeiJa4Pp/qu2Pne+zqVbvLBfJxB21mi4j4ArS6VdABWORnQ75UldOCeNZORTBq
	Bh0nETwc7Hz6aT8zMFBjp3keafZ40m/rIzjLzf/DDi3NU9tD8z3KV+j9ERSa/7lMtHcTmLTTQiG
	dBHMV8M43Jmi0BrRgjVijixxSXg09i5Ghb0BFZyEQt/R0gf8LGE5GEVNePhJmxftdsEk00iFxv0
	IpnJJpW6PprP0Y/6CafnBshRKdsV5beMPfb9tvaPkaRukX0LEsBSZr5OZUYQiZw6AzqOAkYOlb4
	1y7nYjC6jcIe/QEDO2OYxXExMad5YpGAHiZFJFCjRVzpX
X-Google-Smtp-Source: AGHT+IHjllPDbBesbytdFFuw49H9HPzHUpGX6GEe0oIbdOiIF9gTADeGFDpUFlmOhHLdYd5ybMcj7Q==
X-Received: by 2002:a05:6512:1195:b0:553:2633:8a63 with SMTP id 2adb3069b0e04-55356bf0810mr2501601e87.17.1749139087260;
        Thu, 05 Jun 2025 08:58:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55365174a43sm69173e87.6.2025.06.05.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:06 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Message-ID: <uomne25xskd3iswn7htoqbwvyws4fivogfkhhl5tz4t3uydsrv@sfiivkwxmfsd>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:01AM -0500, Bjorn Andersson wrote:
> The function checks if a program header refers to a PT_LOAD segment,
> that isn't a hash segment (which should be PT_LOAD in the first place),
> andwith non-zero size. That's not the definition of "valid", but rather
> if it's "loadable".
> 
> Rename the function to reflect what it does.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

