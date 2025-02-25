Return-Path: <linux-arm-msm+bounces-49249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8FA43A44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 172247A36AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5310262801;
	Tue, 25 Feb 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8AvmQiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E3262D1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477012; cv=none; b=fIbTBIHJWwubsuvX+sQlIlB1tElN+mBsAAkdc/2+UYLs+9RzcH5Zmqr7lHAdgZBE6uvTqkM0O3PuuuxpvRcSOfYEIbsB19LMHBlXBiTVHSJp8RomDGCiLheWNl8k1kykrlfijA/Rw0F8wSKuPA0yMoODgXuhDilv4XaoRj3FscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477012; c=relaxed/simple;
	bh=YdYi+jldxRySwOYGSHC4IgPILTJajrReelAUFvdPiF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVXg/OY0J3W4OtdUd39QLNmsWz9QOqknwSASz527DV+N77Z+fGJ2coSJ8BmNrPPcrax1SKaUzHw/47zg5cOQk7KDhgl+PEHd46Tyd4/gwTqhebolr/60EcCXDREzlAgtS4KLCwDIdJfVOrPh4s4TzpBWLLs7qslHaJ55Omx6dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8AvmQiz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30737db1aa9so52480621fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477009; x=1741081809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otofrhCMJrvXe4MXmMzw0/uFlwKxINjHvm8fHlxwC3Y=;
        b=r8AvmQizahU6zwlj049X3atHHXm/PY1CdXkHt6keJhhoOjdi3Ow/9LtBtN4POxgVv/
         beaPwBezrnfGbdv8iq9SGvdwitY3Q9cDCYv4uFqd3Ptsv6/k7xUyyCaJHQgG5rqq2CTo
         IkOgugnhFuBvfSeUbFM5mA/f5Tnl9HL/fh7+VhedvKKYgZWlIl6qCaPwaF5gNX+zyuzL
         guhL0Udl3O1WGim97hky/HGm3o2eGPAnEIHOhcPe0Yjh1KCQHXcguSI1uceXv+v7PFy3
         O4HVJQYBUUn12PUIPmyCJpS+o53DpObjGjuc2rmduZx7DpgAtLw6rjxgTLDAgyPsstJX
         LGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477009; x=1741081809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otofrhCMJrvXe4MXmMzw0/uFlwKxINjHvm8fHlxwC3Y=;
        b=JNzjY3blhMHO4NWnQCjOpLvqVXf2nVqY+V65rVwZiJHePmsPu+qf315SNEqREhbWfy
         qy9ZSuuQhAjzbStXfSeinjiKIFPOFCCuCxo42vSxSkSx9yif7p9uO01Hu5o/RYxsY7Zq
         2/vmTxHJMjgxiL0oOT1TUuogGU4Kj1WPRX2NWI2+PEKrLL+nKlkux5m0g+NySUz++2kf
         e4lc/sUXxqhMgd+kAhZTLepKLNmncwN4z0ZiaCUUIC5oUlnSJhegF7CmYs5ovOvW01s6
         UGwWNNkivIa3iBWc8TqWcRSgMshqVb7D/eYHTEXDf1FAtHPcHCwqZwbgNPPpqFFb3vo1
         irHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLC0avz7lEvv35ydYj/qz+1ZaKo66EsUT3I1nbmncpBUp9UbeUNUdr7GWhnZ1mvgoxHCWoonrMJJuk1JLX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ejSjkJ8pFMN0GkDHS4ITlF/bqZ9lsWOEfEphbBjvBbFc9hp3
	s/3SazZjgKFqcn5QInbT7y+0qNCYz0zH27b53YK96uZfLuB4MmuLJBL34opYeuQ=
X-Gm-Gg: ASbGncvw6GMQVGbF8t6i11Ku5Z5rh7hMtvM3AY4DO/9kPdChoLNwfzbZLr35mLWynqo
	LL8eQqujY8GtRWZ7AzeKxYfck+3HQ6Qoi3m3LPXS9sNto8hycGYrDVjtE5medEZmwN9PhEVOcfy
	qDr1CW6tvwT03bs46rxEmE2n4Sb/VchtxfrLPMUM4sO01XR5uusMux3JfBYjDH1WjB+co0bYxqA
	Y9hoC1VS34AwqX8pNpIRvxIpMvHAblHa5kKx99naIQr69Qc8Papf65VXVt+5EIURpu0r0yviBRa
	xUg/ELDWjUIkUZJANX36l8oeM43rzKiYPuTaAkfzSgVy8vBDRk8iJdwhUcephbfiZvPuV4qydDK
	0u3l0WQ==
X-Google-Smtp-Source: AGHT+IEtY9MXnrKuueCiRzVzb7OItS2ebjSxuUsGBPUIBg/R3EahURMlwlNSOkla7VNzEjmEglWcsg==
X-Received: by 2002:a05:651c:21c:b0:308:f3b4:ea66 with SMTP id 38308e7fff4ca-30a59987bc2mr54809491fa.28.1740477008948;
        Tue, 25 Feb 2025 01:50:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae819esm1788281fa.103.2025.02.25.01.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:50:07 -0800 (PST)
Date: Tue, 25 Feb 2025 11:50:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>

On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> There is no such property as qcom,ath12k-calibration-variant: neither in
> the bindings nor in the driver.  See dtbs_check:
> 
>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> 

Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
calibration variant in case it is not running on the ACPI system? I see
that it uses dmi_walk. Does it work in the non-ACPI case?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index a3d53f2ba2c3..9aff5a1f044d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -674,8 +674,6 @@ &pcie4_port0 {
>  	wifi@0 {
>  		compatible = "pci17cb,1107";
>  		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		qcom,ath12k-calibration-variant = "LES790";
>  	};
>  };
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

