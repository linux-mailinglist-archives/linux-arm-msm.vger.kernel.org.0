Return-Path: <linux-arm-msm+bounces-45685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF9A17D70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 938DE7A034B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68161F151B;
	Tue, 21 Jan 2025 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0qkCmXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F61BEF70
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460856; cv=none; b=qHJ7PeD9YwWR5NFLC1isGu4lSPMj3ZTYR82ngY8Eq7dBc0+puT3wQYAOiRH4eo5hma9G7Xr93b/A8NpH6maTjvRw/i/avJdFpFi7I1DU+7VwTZo48ulkW/fVE9wgFPvosdiS/KmeKNd9q1gAd2PQMiC2JYRMSbMwHaDvAGPu8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460856; c=relaxed/simple;
	bh=sFjvkQQSSVZqQAZ1B5Mafi0pc8cfGt8+Eq6BluaI1dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzqbHEjakZjBC6SGSEIuV0ELA57js+P9ZB+U5HewN4Z1PqStHgmx7PUkBaRnkr55ZrHiaTwS6ASdUXywnauif2rBcYf1vBPYrLL32uGkwonkEWgHAnn4aISOEhimGCVgnY8wuavZGnHQtTFrPSdAUgJnc0WYlftVJ8W46WHfU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0qkCmXd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so5387123e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 04:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737460852; x=1738065652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2pc8cCMiKqFOr0JFM8XgX6fpE3iGh6b7fVondyVxQk=;
        b=A0qkCmXdOM39gnw6FMeIzHBUSAcwaTjIqbck2Qym5sFIxyrwJuKIfdOoaqyNajCsjk
         9lRfEsp96/JIxRxm3N/PCUQuvRojTXdITP4C8DyS5ZsgeTRxZX3HCI/BQpVP2jfTfJZJ
         AGe8AN6eyIG62PyMfYSkFUirv+ggqR9Fb7xIhma3Mgq2xfsVd35sugX8p/n2j8PyrIJw
         KlFHuvknt9jqk389pVYXEhJweio5ABkNQZqdS1PARQ3BwOhpruU9DdpJDbdNq5WBxxeP
         J6iTJMVDLzW6cVHAJET/TFhw9XYSAg10bCf0CdJIxxF6W3kQFeRB2ZAu8PfUPlNWz6Ar
         cUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737460852; x=1738065652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2pc8cCMiKqFOr0JFM8XgX6fpE3iGh6b7fVondyVxQk=;
        b=pZPQ+xw+4YDgJvhjugV0Jm5o4uynpCdFVB4elCzhRaKTa9Zjg7XFwB2lKH6HkhwHR/
         JmkPA0OXQIbXZLceLwPakA12PbXXjRjdtBUK1rIJRhNXVYVEoYXN0yJPcyNmo/VWI6qL
         q65ATM676384pSBoKyZ3wgUzxtipCMoKNjqCGex4YKD0mqh1/WajkN8JCrAOl9hiJ9Pd
         j0k6/g8TsieDWeGIDBOsEkACy4dXjMZn8sia6/VJUhj61gBRvyZ0wcqNfdd/JBatalQn
         1snVNoxCpD3Y8fMVd4d87GWSbisfFyq5bOYMpO22qFmUOPp/c2xF3Hg1HT60vacslpmM
         kDvg==
X-Forwarded-Encrypted: i=1; AJvYcCUzVSFJdj4yZ0gcIojXgxzdqOqgZuw1pKQK16WwygBqB84WRJx5lamK2ATq8piQvPiuKkkn9tcH+qe/epz5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4qBLnZANYtQ0dWkgfsmsc7EpR6+Or7gkjDWbDs/FA2+o+PYqf
	4XxxilnTOkkD6l6iuLDepqHrdeFndO/+DKAMnAbK41Nqugu9yXSblBAgqOJ8ALqDStcKJngbAt9
	Csgg=
X-Gm-Gg: ASbGncvQDmRf/4NQItn4N4y1ENd6STM1m30VlqwOjUaxtA0TMfLUW29thNUlkeFJyV9
	mwnMaLPev1UtidBZLBziQTKgG0dZbtick+ZO3uR89l7gn/qSUlx7hhvTPiEv/cuxy5GR7McCZWb
	O4+DiVCw5o6VT1NcxWqplseUVt2SMNl/EnpE6cvqI30RCy3/hAvUyLTfEdOFfsfTXINVVj8mG4y
	LVI0FUbRuQS+TW2Hh29n02OW2gSXBM+JyWvuPT7fjh6bYtlhoHv8pdQt3dk1ynery7iibY4t/Wm
	8m6cZQ6V5QQdenQ4Q3HD7XSSbssybEUK3v0tsmAddVavwPXtqA==
X-Google-Smtp-Source: AGHT+IFdqe5e6EMUv/Ie41SruL0GimNnvf/5eE4TfSZWZolpGPfJ/1kAzDPw4MLYce1WGYSj5rK48g==
X-Received: by 2002:a05:6512:3c99:b0:540:75d3:95c0 with SMTP id 2adb3069b0e04-5439c28080cmr5399153e87.47.1737460852376;
        Tue, 21 Jan 2025 04:00:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af7390dsm1808917e87.200.2025.01.21.04.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:00:51 -0800 (PST)
Date: Tue, 21 Jan 2025 14:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Modify sa8775p.dtsi
Message-ID: <olipbuuyxttdfzrzsznkpwcjse6x3t5hanbdrez2qj57i4iupk@ynicem7cng7i>
References: <cover.1737459414.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737459414.git.quic_lxu5@quicinc.com>

On Tue, Jan 21, 2025 at 05:24:02PM +0530, Ling Xu wrote:
> Delete duplicate fastrpc nodes and remove cdsp compute-cb@10.

- This is useless and incorrect
- Please use correponding prefix for the cover letter too.

> 
> Ling Xu (2):
>   arm64: dts: qcom: sa8775p: Delete duplicate fastrpc nodes
>   arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10
> 
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 246 +++-----------------------
>  1 file changed, 23 insertions(+), 223 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

