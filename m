Return-Path: <linux-arm-msm+bounces-52588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD4A72AD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A555A18900ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 07:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CE61FF7CA;
	Thu, 27 Mar 2025 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMJ0RddH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1411CA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061916; cv=none; b=MUne3/D64+w2HKm2rw0izjwPQUSynVh8BgN7aOJxy+uam5We0OCvNDjUbzMlMG27k1gCusHUe+336xCucqpy4M4ZiMXilEM4NTbzpjRfSCuTD49g8282VspqOpLVJIeRt6xFNWS9L89A0DnueGeXzqXMf7qD8cNwrImPpKmIyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061916; c=relaxed/simple;
	bh=lj+SRBXnGsvFf1NOFHTmthPnLRUd7U7gHWbfI3QLXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxPZp0oBJhqyMpz1rqx26OQugZFGrVuiLPpaJZX+XUMIT5TjFxkjTeR0KXQ+j1rPNC3h9kzNhgcOdo56Tv6PGXolAwibfAjTMB+TmNZc1n/47aqLUXwRwWSP8oWI2O/rTHReruq82en1Bw9P5D9RtewMUked33lQRA0MlsoovG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMJ0RddH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2c663a3daso125056366b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743061913; x=1743666713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
        b=HMJ0RddH+/NpIkJ12mchDhveiC+QwEQgU+h4kStEpod5PM3WKeCZ9tYfs+018fzovD
         kcDNNo6S8h8yT9wbkt5SI5u6N7bEkyG9Qi3alGB1J0cSjZZNdNOCciO3r2db5t1O8zWU
         6wZYCq2rU1GgWyChIvv1ytrCA7rclRgL6FwIV65gk6rHTTMjxwtkrAvI+wxflDAQgxe8
         w0ruP6ddAlghULef73Y2zHlTPyS0GtEf8ItiXzye8FmFEaUYK/Ah7LcY70ZHn5AGaEiq
         8j8R8oAP0qPRNk5rbNAqvEoOKgaZzKrAmghgkAaOVnvOLWHxVWa/raVrRlgVAVb0Hqcs
         Z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743061913; x=1743666713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkkkpsCZMXpOpBqlhNefevBtrymahUPNIaJzLNjWAFU=;
        b=d5xVkUxT7cSoj14QpBVEfCHujWiZAj0sBhwHc6WJgF1SEyM9Au/FsVv3BXBKpWqTEf
         XH2/9xGPIYYnygcJU5po8A1Jzgb44cYQFKw69Vj5RReUaN7PvyARuhSX+13Si4r+Rf8S
         ly4BdIvwQ25gREwT2ladj0BUHJ0RVE0gv+3+qKvwuoVZUUYJNhSqz70g2oC+k1jiO43S
         Ucn6mMEtbg0MJoutWen0pQPRFL9iD4taY42veGjWVaDWNcTpQi7ivywkpqmkh6s1SUPX
         nppUYEeb7rFVmpXjjT3gY23+ZDwLlH0XKQSXtqIK3dpuh/E/sxqASWTbyBHwP2OEJdVy
         GM5w==
X-Forwarded-Encrypted: i=1; AJvYcCWAN0UNDLKoqu52HIF4x7ppmZy70zjxfE7axJCQuYTlF4iWv3/72d7uDIh+THTZFapG35ngfU/rV91qA9Nz@vger.kernel.org
X-Gm-Message-State: AOJu0YxmG79Fqj97ERvlnh9ckgDwEp+Oq0Q8PnIfd0Zz7BLKUKeHkB47
	9o2li1jjuUnuT/Anm8PE72wN7gfxm0KYbb+NWxItBaxHpJ40m8NQS7CNO5nOIYs=
X-Gm-Gg: ASbGncu0aoRiQpbmMrR4YTuG7vwthj+blv6CHsD89ngOKjk6MA40U0E/tIHGVpYufvs
	TJhcahdKJTDoaN6LQhtkE5KzavT4rs5tcFxNzfLUKsPiDExOV6eI1iLHiZ/Lf7UqydNgqkZet+g
	GiB40JnK/y7SRIIAs4hZW0OnZe8GOQ14Ax9SSv6bJdMX5TMTjqg2QCy1dYuHtWnwavRoyg1h/rV
	+0rRlxqayEsXJfhn8sJyEnTQwg/IsNmfKnXnbvAVFeETbAVMPWt6KdKmeN3ruh4VsOqvy6X/xwg
	ru3mVG3V83i1blUXzh8cf60tN0/nFc3l5OKqNh6u3A==
X-Google-Smtp-Source: AGHT+IFV1UJVhREk9/GsUuOGS9IHZ/MvkBCpSqwJ+EdM05OmvKh/YSMogqljBF93/hELR+0ofu4aZA==
X-Received: by 2002:a17:907:7b8c:b0:ac2:9683:ad2c with SMTP id a640c23a62f3a-ac6fb1d6bdbmr197580166b.57.1743061912747;
        Thu, 27 Mar 2025 00:51:52 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm1166893266b.39.2025.03.27.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 00:51:51 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:51:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
Message-ID: <Z+UDlXFKbmxCECp9@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>

On 25-03-25 19:21:27, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the devicetree.
> 
> Unfortunately I cannot test this on the non-OLED model since I
> only have access to the model with OLED (which also uses the
> HPD GPIO).
> 
> I believe this could be split into two patches; one adding the
> pinctrl node and one adding the hpd gpio to the T14s devicetree.
> But I will wait for your comments on this ;-).

You should definitely drop these two paragraphs entirely from the commit
message. Maybe add them to the cover letter.

