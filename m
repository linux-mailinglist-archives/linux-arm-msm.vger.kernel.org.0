Return-Path: <linux-arm-msm+bounces-36910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F3F9BB23E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D2A71C20C66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D3A1DBB3A;
	Mon,  4 Nov 2024 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvPR5Jgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F61DAC90
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717665; cv=none; b=R8m9X8jUdG5isEudzN/S0aPOXuDrEs/HRb69ryUMB/EQCWSi1oLxWRM5UMxQIjYYGxOIdICWK92FipYCO90QlLkhHU4qV6CbAGngLR9YryDMV5glf7iAvZ9F/Ow6LB3o/8UDWjH4zvAYqkrN7adIXILqWrtbmRC2Hamjqi+Yk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717665; c=relaxed/simple;
	bh=aUV0IondjJOlifc/AFBrmGbiFRVeHn6X+5Oa2ZmFrEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkX1w95pUK9CELI+9JJApMXTYSufCHLFzSqL00K0J/awQ0luSAdyIEGOWLyJ8MC5FDiuklYriMdAG0qCACaCbfUrp+kCdWYWzCw3tlUzX8iBUenxUBX6y0Sdse0bSuBp5p27s77fzbZPFJDhC54jIBslHZnUgkbpz2mhtDjz0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvPR5Jgy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so3762469e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717661; x=1731322461; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GY9AgZx69IB/wIQj6/wa+fQjfQnAMQkYUKbBgmf+Z34=;
        b=GvPR5Jgy/GKzcMI41LgrbsTX1UBvg27QUwBYE1Y146HvcLgtMFeOC9lt88CFcc+8yY
         O4AMgxWYhdLBVIsL1dSnAXgYzC6egrDpthx5D5yXT2uR6oxYwhqUQR2HWUdYPY9xhoX+
         brkjnLoPmQF03D3BHpZIlTXAAjrd0xSZM9V+TFW8U9NsU/6MdrpKONBL+GOgIHYIRDy1
         1bri28RgbXRS4qo01zznz5QRgWUE20Rn07z+ze/KiReRC9/AlQBm1WScQrEz5AuNXoLp
         2ktKLjJLcenqtBkrBa2YQ1LHyfyZmL+GhlwCU+dN5X96gkYla406V2X2LOl6RyM8yK7K
         CRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717661; x=1731322461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY9AgZx69IB/wIQj6/wa+fQjfQnAMQkYUKbBgmf+Z34=;
        b=D1b8qR8bvksvrkZjm/0pq7iGuHkBxChf6GRkGfQZb7/f2VoKybVgzcOBNNBTxA6k/B
         3aSnu2J4Vsxi0qwEfsycClgP0JEr2eDv0LlMEWkxZcvJY7xn2lOxsoV4kUhAhYJDBkZH
         KsQpRAnRkps+qn7WvHhsKrxXjqre47LACcgGdL30FKDvHVt73QG7XMROY8z8y75pwdvv
         wV9zzkJnB7oGWd+bT62mpV9ee2QS3ZYA6Zi8hO2Z1HjIkf1eqsU4dXCxrOMFtvSVlESY
         yE25B4nYte//ChV1O1sA4bY7KNE//6y2vAyH0qouCZzrdFNid4w93+0C7YBmAQVaQ6A5
         h1rw==
X-Forwarded-Encrypted: i=1; AJvYcCXCIkKVhhFEI78BID3Iq0zOkKUAh7SABubJ+t+2xllPug3+c1ZbaEFPv7jOgMnRtmWQ6mXSwV4EFRQkWmeH@vger.kernel.org
X-Gm-Message-State: AOJu0YxDvmTMvUn7LtU7SKrE9V/rQazWjUp4q1ithlfM2nz00UuNuwVd
	ikgJKzNPZ59XiDFqjbWu0Vv+hATQxcyxQTog+FONdStcFeU+OfmBIA5MF6gws4A=
X-Google-Smtp-Source: AGHT+IGqkDRFxaICpNkxHcdIF4Gwos3fTDVpvDhXDkvrsCCP7zR+hSMSBAkfTFXT+bl/YZGqQ4m97A==
X-Received: by 2002:a05:6512:4024:b0:536:53c2:8179 with SMTP id 2adb3069b0e04-53b34a19102mr15696007e87.37.1730717661423;
        Mon, 04 Nov 2024 02:54:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9ce70sm1637885e87.117.2024.11.04.02.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:54:20 -0800 (PST)
Date: Mon, 4 Nov 2024 12:54:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add the SCM node
Message-ID: <yzpvee7xzbdni5ueroktbogqlbakhi555i3zm25twfd2vuytnc@mecdt3l45qxr>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-4-quic_qqzhou@quicinc.com>
 <flk7n534gfqyivlbl72qco4k5d3c6ravevumjfoh6464pe3qg4@r7ns6zr2i3bv>
 <645c9887-4df2-4ab2-a048-ba79a97b8d2f@quicinc.com>
 <vuz5mvmi4srbwdopivu543cdndybjy5cswc3zmukztldyv22ql@27les6xz7r74>
 <234d5fba-928d-480c-a9bf-1a8c5fc6f58d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <234d5fba-928d-480c-a9bf-1a8c5fc6f58d@quicinc.com>

On Mon, Nov 04, 2024 at 03:36:37PM +0800, Qingqing Zhou wrote:
> 
> 
> 在 11/1/2024 2:59 AM, Dmitry Baryshkov 写道:
> > On Wed, Oct 30, 2024 at 04:42:19PM +0800, Qingqing Zhou wrote:
> >>
> >>
> >> 在 10/25/2024 2:02 PM, Dmitry Baryshkov 写道:
> >>> On Fri, Oct 25, 2024 at 08:37:31AM +0530, Qingqing Zhou wrote:
> >>>> Add the SCM node for QCS615 platform. It is an interface to
> >>>> communicate to the secure firmware.
> >>>>
> >>>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 7 +++++++
> >>>>  1 file changed, 7 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>>> index ac4c4c751da1..027c5125f36b 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>>> @@ -278,6 +278,13 @@
> >>>>  		reg = <0 0x80000000 0 0>;
> >>>>  	};
> >>>>  
> >>>> +	firmware {
> >>>> +		scm {
> >>>> +			compatible = "qcom,scm-qcs615", "qcom,scm";
> >>>> +			qcom,dload-mode = <&tcsr 0x13000>;
> >>>
> >>> No CRYPTO clock?
> >> NO, response from Qualcomm clock team is "the current QCS615 RPMH code does not have the clock support for CE clock", so we don't configure clocks here.
> > 
> > Is this going to change in future?
> NO, from Qualcomm clock team, the clock/BW is handled internally in our trustzone and do not see any requirement change going forward to move the clocks/BW vote to HLOS driver.

Nit: please wrap your replies at some sensible line length (72-75
chars). Normal email clients do that for you.

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> > 
> >>>
> >>>> +		};
> >>>> +	};
> >>>> +
> >>>>  	camnoc_virt: interconnect-0 {
> >>>>  		compatible = "qcom,qcs615-camnoc-virt";
> >>>>  		#interconnect-cells = <2>;
> >>>> -- 
> >>>> 2.17.1
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry

