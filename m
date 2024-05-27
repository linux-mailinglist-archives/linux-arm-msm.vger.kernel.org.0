Return-Path: <linux-arm-msm+bounces-20583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F848CFCEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7341A1C219F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9461113A40B;
	Mon, 27 May 2024 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4shJbXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6613A3F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802313; cv=none; b=lMW6IKqvKhjelAOsCRLmRPn+9gacPnx9u065AT0gDzl6yjMZAt9/BqWen5UeQbfW2BeGZv4XxdUX5EZ8lhtvasPQhMuZdqzYvJuFFPEMq/ZEgLwp7H9n+hmDwu29hZ8OdM1hAesKpv3E8R75mXaCYyNNvELIa0eKyXZqvZJxTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802313; c=relaxed/simple;
	bh=yQdJN/Dk3owFDIxvxJx2sG5wCVgCZ5ezvplI+HnF96Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq0B9oxtTWK+7upFO/qyK0y8mD6ewiKV+vK83wUFyk5sTPsh7IUgletswsQgZhDvsAIRW/J3cQ7i3eXnlwRlgtDks0bZ+FYJpiSrIhlzXzC8Y3nbPJrrRe+3J/PMDmyZ1PH2LM6y0yJm/l2JSViy1YouZgCU88dCo7PsFQLTrW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4shJbXl; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95abc7259so30287821fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802310; x=1717407110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lOIEDapMQMFTempzCjLBBiczi+5oN0ctNRlc+fPjUE=;
        b=P4shJbXlTtVD0XhrOvdcbHq8YBMoQGynttpg+41T55COJNyPdNKbnB7/JGhL3gwRlx
         NASHH9tV3Ky4LQR4q//o9nnTZzrZJSkEOvMk4zKXZ/exqa+KfZmRZHdXdrYZM0K4Rtva
         I+H3NCs+ZeMVVDbfczg66EBpMN6aI/Kcfrser5bQHU4Kzgobi8Zt0/XmSGDZN52q8cI3
         FnpHTKfNzLG4Y0v6UZpOnUuSBiUwF1edsj7Nkax/t3DmR+GLDUbQbE6GK93IZe6PfPEn
         Khyop9llaPkuxm//l7gJmgDLdYJPFteUGZ3U9v6AKcRn4NZfgLNeBhaM/P5LVgjoPRkM
         0lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802310; x=1717407110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lOIEDapMQMFTempzCjLBBiczi+5oN0ctNRlc+fPjUE=;
        b=mclMw9DC8VBLMOw2XpfyjBFyiKb6+Jb5v/tEiBXORoi5rUSobVmXXxzrsOFlWO43F3
         qHnJzSPbZsjugh5G0IMaKe/gRrwuoQm+B/RvyYPXnfFEa1C2fg31zNy0wLep0PkHolAy
         zTeTbdLiydvZhZNY17F6jR0TF8rsQ49+R4udPYWiOo/UaZeDGFEkoPma6G2aoR0Dms5N
         2B+gRpaZNcFllZ1hAQ/lIYf+sBRBFivqIb3dsL1n43R+KKzpf4bJiHFW/MYPl98qgpk3
         b35X/U37QoAxIl5UOm0Co1iz4QAAFqmjaZ3CYPtytE8difZcj+MvTROhsnGvoFd9rtXv
         +KJA==
X-Forwarded-Encrypted: i=1; AJvYcCXK231ScbvL3laQ2VmFafM+39vc1+CCpImJI73OfJAvYMhp+yoj5CBqSfhYXynsfAx80XqGl+8Rs33G00AduyfIvedt8hhmxJwAbCCjTg==
X-Gm-Message-State: AOJu0YxJ8NQ5DvqrzliVTTRhX++YbULOBmD635MruI+ObwuTVz5PQUrN
	Yb6ILz3sJHmV6wQcCyxtuwwQNFV02CTz2OeLz2xP1UiwIPytKeQZJTyWxZTnVYk=
X-Google-Smtp-Source: AGHT+IEPv7EDp4kePquA7op/6dhZT+drl8Ylsz2niLA2tU/NQtJi/aGWxOm0a7bFtOI7nvkBSVJRJA==
X-Received: by 2002:a2e:3a05:0:b0:2d8:da4c:5909 with SMTP id 38308e7fff4ca-2e95b2cb370mr46039831fa.51.1716802310053;
        Mon, 27 May 2024 02:31:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd14c7sm18590791fa.97.2024.05.27.02.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:31:49 -0700 (PDT)
Date: Mon, 27 May 2024 12:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
Message-ID: <sgrflejmt5btqgruqot3epcs6zdl7wozru66ddqcqgm73gspqy@hjqoo4yqmrdd>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-5-8d24e3409daf@linaro.org>

On Mon, May 27, 2024 at 10:43:52AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable all remoteproc nodes on the sa8775p-ride board and point to the
> appropriate firmware files.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

