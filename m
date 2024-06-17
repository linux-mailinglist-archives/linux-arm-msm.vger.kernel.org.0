Return-Path: <linux-arm-msm+bounces-22837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE890AB23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 12:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB469B2ECD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD99C18C326;
	Mon, 17 Jun 2024 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bn9qNNP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7F190686
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618388; cv=none; b=VYhqYtBPnSVbJxaLovqDOCrB5LhJDFgWYTecjmQUBEDy0s0RXBHWrBkl5UOKAUjK0mNzAQeYL6aaCAwEGx64//s7zRaXDklHXulDU97wjmyV48wpNNI2vOOZhqT7KI1GkVIkDExcA6oMAoDRoTlBxsXylw0spMi7M9j6o9378pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618388; c=relaxed/simple;
	bh=YkQy2wTRZsbKD/4ew/BUj3p85LEw1FBVPUs5rIwP0mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEB0NXzHn/bMJekGJMSjuoaiRGQjsneujCxHQdE3HEYNfc1G+bwJPecZezcqUkkbeE/5S0aWsqBAgsjTiwAFceZBTUWjzDMDVznuc56LzXPk4NcRAK1JNt2bpMtSOwIhHP25wtLGVM1C/ODPhijCXGrlloxgk2TlUbVx8aoBH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bn9qNNP1; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec0f3b9bb8so26182871fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718618385; x=1719223185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVuk4pXbnXqOx38k4X8CXmgXa5i4k02Sgi5On8BtkKs=;
        b=Bn9qNNP15lLpSn9qe6/LFL5Gt2wvO/4YGyP9/X1By8y89TaLRKiN2Ej8fNlQT0fPzf
         3O7Qk/JX1fGlbHC/hOYCaHArstWbC6FamYaiSsrZbrA5BswQ7WLROmRv5gApPB37MhYB
         Eryx9hk4btRXdFVdufZEPHo0gDJag18IZ7Nw4OLxhwcFIE9KH29bVE+BONe0vdg8IJSs
         DLftzNU1MtXCktIVSabP7ZhjVDUdtdbTLWmwBuzgfkgjft7rQSM1201y60VyFA3QqwVC
         tZUyEMRamyu34rJhgWNtdG8nA64fP+4UWgAzD9hxyiFrpLSlH0wLUQWKSF1p4F96roxH
         GrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618385; x=1719223185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVuk4pXbnXqOx38k4X8CXmgXa5i4k02Sgi5On8BtkKs=;
        b=XWEmFzwgAIPIYA66cuNonVTz4XV7pBZG31nmC18iLMUdbkWYPeBbza1vsmqrTFC1Ju
         zYVyUF/Ckrwyib6Xs11RRemRWDfvCVy3LniylgFoJKf0zR6d+gUNcdvRA+jl/oRnPYkz
         Ve2FCW4x2XTWYQZZ+NXwxrz2ubdAbpN7cq2QzW6bnwKxKb11JPHv1vucyfcfFuB5WIVb
         InCybpCqjlCT4S9pEGLfz5JBT9LnKJxFUf+BVWjUTt0JJmZHMKauWFsVEat0JC01DZ35
         co4FXYK0hoLpNHQeYchlAG4sMxY2Ljcwpaeg741MuhM0tfeuhEBt+A8bwj9tkqQKHTPV
         2u0g==
X-Forwarded-Encrypted: i=1; AJvYcCXs1NvdtSw8/nkM778TLmefFBLlR307LqiywbR31zU8j3eS0k6wAA1iTChLahAvtiuKdVeX8ogLQ5+nJJKhlv24nA4PcaU6atY91XAtDw==
X-Gm-Message-State: AOJu0YwK7VSGs8W2cVT7eu2tl89P58g49SEghJc3fG3BFZ4O2njHKxFS
	ZpBo/F98Vbsvme6yuM/2O0xU8SkY+wBgz0TxG5UsECLY3f67hHqM7AOLkppfQuXc+441CAGRJxQ
	NPjE=
X-Google-Smtp-Source: AGHT+IHrGx+n/r1ExKv6HBMKYiG8ynIit+k+jwW6EzWY3ydr62spei+DHKjsc353pM5B+vuMkkolkg==
X-Received: by 2002:a2e:9e15:0:b0:2ea:e98e:4392 with SMTP id 38308e7fff4ca-2ec0e5d1888mr57009701fa.27.1718618385692;
        Mon, 17 Jun 2024 02:59:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec25647ec2sm6142071fa.56.2024.06.17.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:59:45 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: qrb5165-rb5: add the Wifi node
Message-ID: <3iknhgyp7fnfzjwkj4fmo7bszvhokvw6xi53jzqkx73o55xkpd@an6bqrw4432i>
References: <20240605122729.24283-1-brgl@bgdev.pl>
 <20240605122729.24283-5-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605122729.24283-5-brgl@bgdev.pl>

On Wed, Jun 05, 2024 at 02:27:29PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a node for the PMU module of the QCA6391 present on the RB5 board.
> Assign its LDO power outputs to the existing Bluetooth module. Add a
> node for the PCIe port to sm8250.dtsi and define the WLAN node on it in
> the board's .dts and also make it consume the power outputs of the PMU.
> 
> Tested-by: Caleb Connolly <caleb.connolly@linaro.org> # OnePlus 8T
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 103 ++++++++++++++++++++---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |   2 +-
>  2 files changed, 93 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

