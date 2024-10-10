Return-Path: <linux-arm-msm+bounces-33892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285E998A73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5EC728965E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1091CC89F;
	Thu, 10 Oct 2024 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBrfrGOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23D11CEAB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571255; cv=none; b=Y7AADFRhNkOkBKcowONxnrocJUqgKp2Wnl5cTMpiVIy7NYWel4OGjXuwHizLnVQJuJNw269S/3n9NtBfqYl8KLHtHN+t1KFg7LvX/27FaQbfq+tGObLplWRUCGp/WmbwC9PKYjONbvekPbv7sNdpqKOWNtfbIsjQmFGAxL6EvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571255; c=relaxed/simple;
	bh=fHaTG50T+XNNagn5TCtb74sk7q6Zn6Tnl5l5AASz3rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZbscz1MiIdF9zfhQGjS2cK2bj99xJmn1XSoaXGiFDIDgus3br9EeUeMMBHnjEEMdUnas3dugaaXtldEpfP315dGxFRxWs4kRYovJviypqU6E1JOQC2aKEaPE3tIEbc9HtFABuZIryvEIXWQGHnuhQFHLl12Zc1HQcCf7kMpZsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBrfrGOO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e53ca28so1093475e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728571252; x=1729176052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=IBrfrGOOn6WYdK8I0pcRITxvW73FhdwJN9XxPwuEJtqQVhfMw6y1vq66Jg2Z9dqlNV
         Cd2NXlLfkDlYcyvaVnuPWGWVLK61Nc5897p6eBGzmoNQeEyaApSYOX1zF6P19hoiLVkX
         eBzR8oMgCwxch4J5DSP23+8NopHr5yBV+RlvlmwcDHscL6pl+5y07s5cyVcwjoSD+eSM
         n1qAKQz9Q+OFcBKTue6VBwPM1nfWTpNCSvLlt+xgVVsH1uvYrUE5sDVkxTutELtPVCZ8
         Fph5tk/T9bDI80Xyxm5UEJg4ySOrtyHMZZ7BY5nUNxc11MA8RJ4Nd+Aqv8IlZq6iYp3F
         BfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571252; x=1729176052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=AC3DiAYOJjrhMt3A7RcDdmsh/OnK4SFCgvcYsydKvvhI89C337Y6GEvO/V26S/ROxd
         HBy7U9m/3l4kbcG5W8hba1L71mUlVTxB4tBPNvKlZzSn92E9rGYxqu+kK7cjMYRCapZy
         /hTCYY/wZHNm72N8Sf/drm74Kh0W9kRffEWP0jQONo2RYIhr+n83R6oSzpPrUNx6EUqa
         yo832F3qgdApc0pYsM3sGpvG0vq9MZ8i/fjZ1KNVYNo3oXDUKcyYetbnGMEdNsfIFCf+
         hUFCvkbH4G82/HwkBJOSZOYFPRMv8WAruxOfzzF0pHw/WTV//OM3CTf0f/ZXQXpbYCNZ
         xJlA==
X-Gm-Message-State: AOJu0YzIbMFsq9xKOeLSzjaN8IKPl/2AS5dnYKqyeAoHuqCC5iZmkEhQ
	63L90peLpXNFIrUKSmwaQ51JMbJhIHDRniRJQrf6zmTupGMB8M1NUmHaiAh6DR8=
X-Google-Smtp-Source: AGHT+IFUFKq0lYxlNzsXXq0fVnKrrxCKW8Nx3h/E3Xc0xNLj22cjL5q4txAh0aZwNXPW20/Wr1C2qg==
X-Received: by 2002:a05:6512:2348:b0:52e:9b9e:a6cb with SMTP id 2adb3069b0e04-539c4899755mr4276741e87.15.1728571252194;
        Thu, 10 Oct 2024 07:40:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8a54sm273302e87.115.2024.10.10.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:40:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
 <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
 <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>

On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
> 
> 
> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> > > 
> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> > > ---
> > > v2:
> > >    - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
> > >    - relocate pcieport0 node in alphabetical order.
> > > v3:
> > >    - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> > > v4:
> > >    - update 'ath11k-calibration-variant' to "Ride".
> > 
> > What exactly is Ride? Is there just one Ride board? I thought it's a
> > board family name.
> 
> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
> 'Ride r3' boards are attached with WCN6855 WLAN chip.
> 
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
> qcom,ath11k-calibration-variant = "Fairphone_5";
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
> qcom,ath11k-calibration-variant = "SHIFTphone_8";
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
> qcom,ath11k-calibration-variant = "LE_X13S";

There definitely are other Ride boards. I see patches related to
qcs8300-ride. Does that board use the same BDF file?  If not,
Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.

> > 
> > Also, could you please extend the commit message with messages from the
> > ath11k driver, showing the chip_id / board_id ?
> 
> The board-id is non 0xff, do you still think we need to add
> 'qcom,ath11k-calibration-variant', following is the WLAN chip board data
> info,
> 
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin

I'd ask Kalle / Jeff to answer this question. Are we sure that this
board-id won't be reused by any else device?

-- 
With best wishes
Dmitry

