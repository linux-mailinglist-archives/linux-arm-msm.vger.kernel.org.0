Return-Path: <linux-arm-msm+bounces-22011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3DA8FFB6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE1B284054
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 05:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1137B14F11B;
	Fri,  7 Jun 2024 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+Kv65ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0C014EC74
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739447; cv=none; b=LRWGP/7/oRtAH+J+2gk9jrc5tCf7JUOR7RD4c1y2qv/i4cRpMyPYg8iDrJblVkD6S+uVgU+LKvz5/Z2acTnjD6UWRkOAepnCXRscJHyqbC1yo+YC8Ah8bB7Pd+EuD+3gY/gt9ABlVTS9QxpIebpKy2J+/S/Xut2f4OKTjlCW8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739447; c=relaxed/simple;
	bh=WWjnJuF2jvrWqXlg80eSCREBoaO3Hy82DlIpXP9JGCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1o8xfSq+Vw5Ts52DZESBEV4VRh+uDHySKbJaeR7akkmj3S6H/SUwcYSTlRsw/N1kedO6jovG92TQLenp/B40Ryy3jOLrdB0UNlwWRh8aTzM1eDejZ8pkf1/5mJ823jVxaW7HcYdpx4R0a5FWM+Dx94L8q+W47QttoreLMi8AG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+Kv65ke; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b919d214cso1682488e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 22:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717739443; x=1718344243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/bqzV5tdPmmU3mHMbEPSLVv1cy1wjxHPrAkA1dFhc+c=;
        b=w+Kv65keYiLfiaP3WdqYU8Q+diZ65p8c/RfgkobhGA6wgaWj0IT8KKYAZkj3xWU9SR
         1AuoSHWgnTrbFLudPWqRtJmFDWsthm04HOVE9nSWD7AIJgpGYe+uSf1DT2Rq3iR9E694
         03ABEf4W9jPwfrilvk8iH+XB29UQDMePciCQMT0TESCRAf1Pmru+lx5PdvqStYejScyu
         WhrUhivQurnRe97qL1vlN6REikaaVoxqIWlSjscvCIwc1s/D7ozArfCHc3YvJ+L1LRZg
         D+zxj7u1mHHNhQwgar1EPiiu16vePudiguVqlvxCyWP6Hc8Q3NT8sWCtm94n7w/R+tG9
         Rbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739443; x=1718344243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bqzV5tdPmmU3mHMbEPSLVv1cy1wjxHPrAkA1dFhc+c=;
        b=RqUiqYN/B4CvB/+XV8nbPthwStnIYkreoevpWMJ0BQi7HynTG7ssArfKj2REWXMzMa
         iufOfnrQnGAIuXSEkoKOZhqEcsitl8Rp2pwx1ihyGqs/PgX2RDLyDiDdsTBlomAm27MH
         1H/WMau7qGq0+bdZXmyjy/a6CdYxunpiyo66mX5konKuilL7DzkjAGgBA+uk+J5wck8D
         qBhqxhyz0ZKwrqgCAEutnhHPVuEgc5eD2l2O9GbzvlCdeq6i6fMHiheiOtCofV4lCVIJ
         xaxYn74YDQQBdoGM/nmGk2nVCEWV7czmBW7JlMF40J0mTgB/ORVB6NZB95FdphK6b+/G
         K3ww==
X-Forwarded-Encrypted: i=1; AJvYcCW5bLEnjUC0OyGgoVl90cfQAHEZDzo6yM/u3oGL9MAVRe5RYKMXeFdXeMeApvaroWqJU69g/8hHGAUh94fh1GWX+DWuFndvC3czzerUmg==
X-Gm-Message-State: AOJu0YwqKVVkcK+v2QQoHZO9QHDjDW19lZrTUyzNrssmtzHvZlU0Rb0V
	+POsfB+ZfczaCr8flVNCEUUYUGudYp+WK8aM5q8/RrML0dZWL+wNlGJYGVGdU/U=
X-Google-Smtp-Source: AGHT+IG//kbk8KInPeK0rOHjQkW4NYLBs9XxNeHD41gR6HKQSJt8UwgYii5ky6wRDQTILzivuiaI7g==
X-Received: by 2002:ac2:5297:0:b0:51b:6296:8d1a with SMTP id 2adb3069b0e04-52bb9f8e1e3mr800372e87.29.1717739443383;
        Thu, 06 Jun 2024 22:50:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423d993sm412332e87.217.2024.06.06.22.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:50:42 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:50:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: typec-mux: nb7vpq904m: unregister typec
 switch on probe error and remove
Message-ID: <cnqpgfjcqqedk3xqkfbjacjikc5jwktev6c3kwmbq7cwut3eyk@xqyhgi5xgzgf>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-2-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-2-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:14PM +0200, Neil Armstrong wrote:
> Add the missing call to typec_switch_put() when probe fails and
> the nb7vpq904m_remove() call is called.
> 
> Fixes: 348359e7c232 ("usb: typec: nb7vpq904m: Add an error handling path in nb7vpq904m_probe()")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I'd say:

Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C Linear Redriver")

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

