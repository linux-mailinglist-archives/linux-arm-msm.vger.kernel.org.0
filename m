Return-Path: <linux-arm-msm+bounces-34184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A0E99B13F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 08:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCDB283ED0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 06:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482A413A899;
	Sat, 12 Oct 2024 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijQlXKcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79413A25F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728713879; cv=none; b=vAmpkH0BwDfU8UrzaT0lxvmTwj5o5BDgeBbdHtRAqEckyt5vs8sTrxqfOG62EG0Z7XjWivNorK6YstQqLX3SXee6i7b36ixbojgJErEhU+Gd3RtB0n0o9a1I0StgvS7fHO6RViHPYIDoIl1rRqltvxE3y6jbWO+MiY75qwX4zqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728713879; c=relaxed/simple;
	bh=35uxd4xytmpWtfl0pjeAVBocR5PQ845hs9VhCdoA424=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rt92faoJYJJaJEWPpwC9+H/gCV0EChYGitw/tkkdtOhBhHvSJOW/w1miFYrHVG+lQWR2qwKPug1CmUktPw/YecI+qZn6gMSfyba5fAyz+yct33CKZvUzrTW0BzzBFfaw68ppKjSHkStjug/RWfplJF5VG0J2ckeXW7x5IBoIulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijQlXKcL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso27127451fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 23:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728713876; x=1729318676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q7VycGiDmbT8NDIEv3VX1atPVNk5kqPI5PABIHipxI=;
        b=ijQlXKcLu//gjp3TlT6408r88GZ0nEd84k16poYjrTfUuAvA5dP7UPinXDsBY7dzpx
         ffHQR8NVvW++Xi4Vf+K/R5YobAZhVPSkiRmXzes4LfTGzrNzRQ4hd7cZLaVpXlUpkZqr
         NVsFb7xm2Cz5ostAr1Ipj5Ilpj/UuzTkW1slopps+cK4zUtVvI9wwvFehNorkC1rsXOc
         ENb1W77E78fAEmnzgBm7vaIVpKOPRKkKLn4xEF0Udfx1AwUwv7feUJnNrx44ijJyUEQk
         eeiB8cu1k8m6nruxsfvindoQOuJk0+qCqndd0K9aMjFUUDTP2Bm9OzRkD4xIkNSD53YD
         GFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728713876; x=1729318676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q7VycGiDmbT8NDIEv3VX1atPVNk5kqPI5PABIHipxI=;
        b=ZbKmRKgCYprLKT9/fnOgfjE89d2THlzR//lLBoZnw3ofTH9E/H/sAqSoFq94iozj2i
         4PbzMUWxXgOZrV8PzjHOOPc4cDA0WVm/Swy+/w31/FlDVr2i8QF1RFBbSHkWx0sRQefL
         WO2P13URRqQouC+DzduZwOj0ptCaKNSwB4mlprQr7XICdxuz8KijdWpcg5wZeKi3qZ7K
         8OI00puTgU7p2wFlQL/4UDW2K6n26ZmyAorygqzN+BSoQ4XX//GCTmqouvewNWH1tJjd
         PtyGSdZjB96TWGsK3mAMuKY4jAvEjL+7BIngoPhTq0zbm0AD04xSZLytGW24RLihfS46
         T2EQ==
X-Gm-Message-State: AOJu0YyrslmC7nLwCPTsMMaKufpmCSXjGNj+GfZAUVHNM+m6gvbVvjH5
	yUTjB+a5N+H+UMVAiHWD5ebHlgu6CMQFt6aQv2SbSWgN9ErkjBTu5iBAN7i3fVo=
X-Google-Smtp-Source: AGHT+IE+lAgJkNquMREXe1TmPbV+3JD5TMKDHxMdgEkU0ZUlRFxtWBhCUVpjtMxSfHO5beBR9qTnQw==
X-Received: by 2002:a2e:a549:0:b0:2fa:e4ae:3388 with SMTP id 38308e7fff4ca-2fb32728039mr22489201fa.15.1728713875647;
        Fri, 11 Oct 2024 23:17:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2474c5b4sm7187341fa.117.2024.10.11.23.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 23:17:54 -0700 (PDT)
Date: Sat, 12 Oct 2024 09:17:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100: enable OTG on USB-C
 controllers
Message-ID: <f3xyjvxnuonzk6adxbbbrhg77bjnvl6xnvddfm2b3dselynwbj@zjtldmkwha3s>
References: <20241011231624.30628-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011231624.30628-1-jonathan@marek.ca>

On Fri, Oct 11, 2024 at 07:16:21PM -0400, Jonathan Marek wrote:
> These 3 controllers support OTG and the driver requires the usb-role-switch
> property to enable OTG. Add the property to enable OTG by default.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

