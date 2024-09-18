Return-Path: <linux-arm-msm+bounces-31958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4108097BC41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 14:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB4B1C21E36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 12:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C1189F41;
	Wed, 18 Sep 2024 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+2GypYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E81188CC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726662748; cv=none; b=hhKCvd9t4nDDWdiqy5Y2HzzDQ8jCLIQccCT+rBoYJ7VcLShv3jRBwkxshUhEfeMSda1/NzwCzWOBNp4DNRkTW7jW304bFcv6xoIc9l2hfTaPVO8PIaTtI1wL/MPuuhb6CLv6fF2dtWVo+GttD9QyjLQ6jADSeXzUbs9xyGdBvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726662748; c=relaxed/simple;
	bh=3gVQ9JaYTaBdvDz5MGdsXx0ayVEISpaMDfcREkdX9c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX3A57QK1dwPNnIf8zwan+FjR7vXsNWhcaBB0IrO9ZGwL52ErokQnXafrD7MPCC3TztkMK06fAmzUFp/yOQ99DnLKs77OE/tuczS/srI4O5cNITDqUqeGSMvmqDydkwzF7IG+JF6zIa8F5r+BQu4bThx51ueuPF6SMjdFYpmiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+2GypYD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53660856a21so4949990e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726662743; x=1727267543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QldvlS8/eJZac6pG0e6NEdXcfsAi5+t2N8DBgSFO8Rk=;
        b=K+2GypYD3gvqB4wezdF1ONJGmiuElFPIW3MxSawSSrNDMxe3f9v/pSSpnkpq6OXX/Y
         aWTS3XIpx9iz5CLBWmoUqqMLgB5nJlSU+z2IowwLG928nhWsgldW0u3qFptNAtAEkXa1
         uqsT6LLb/uVXoypoWodr1Aj3jRT3XuNfXssLoCjPfJ+yq26aWG4Is/lrXbygXj40M7Qs
         bqAkP0Yz5HtnAS+qWbosrohj1+VED2F8RMgCIGsbkjJD6i91jZvMemNZILZcD1fIuscp
         b1bZcsUEeFrRkx/mWf55chIaQskhYvl8ymzbHDkPAIH8wU4Xa+FFsstwChP8Kso04Ecu
         Tb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726662743; x=1727267543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QldvlS8/eJZac6pG0e6NEdXcfsAi5+t2N8DBgSFO8Rk=;
        b=koaOKyZK7GCj0Cj2Fr6ukd5S6m6nrtZQAFVbbu5RX3bz2VWBrTq+rk69m3+ofuxf04
         VF9WFt9ljEwlpwJVqPFNjeJnzFd3wyow+zugmqlvOGM82+dXPN40GevmjL0tcT7i0M00
         daMvDB1R75Rw3tAf6QhYSRRpjCdiyNJ2wVq8cW9BPQuCPWfwyfuWayl3fgFyc3aMsy0i
         SqzVkLZ4bqcia25uYl+H+IQc0Tr13cZ1JO1BBtXD90pPHg69KWS1wJ0eqy9DBjz84ydV
         Dvtk7oHpuS7eEf1sHT3ztuMEMjF3HM50vVizlqvsZsdL11XMtj47RJkVsD5ufw1LzV23
         lcvA==
X-Forwarded-Encrypted: i=1; AJvYcCWiQTJA59f0Ljlg3k/+zpmuwrCL2/k0wBrvKgtl14J9EwEHr4SbZ+d/DnGHBp2mNwUmthntuGw4NST96qGD@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjVrUHlJ3Lm7RFxf2BNS2nrWB3a9azZ15LGH47d5/TxfZNWfQ
	3qbhN0di815j/6HIEdtmxQhnc5GxDEmBI8tLOumZbTl2mFrNvjwtcS4+YpumJO4=
X-Google-Smtp-Source: AGHT+IErvjmxyimyd57IGMkKNpdAXZ02gL2PuI7e7vGw8BlqbmJRMt4iCTe0zO0FnjQKvmbmHIhaUw==
X-Received: by 2002:a05:6512:33d6:b0:536:741a:6bad with SMTP id 2adb3069b0e04-5367feb95bamr9279710e87.12.1726662743277;
        Wed, 18 Sep 2024 05:32:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53698c3dd4esm797163e87.13.2024.09.18.05.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:32:21 -0700 (PDT)
Date: Wed, 18 Sep 2024 15:32:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_mapa@quicinc.com, quic_narepall@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Message-ID: <4g6ao5bbt57wdro6sroq7nodxtgdk5ecdxsdkrfvttfrsm2zmw@jik6og3np75z>
References: <20240917090630.1025-1-quic_sachgupt@quicinc.com>
 <gyasvmb5q3e4pgmfpj7njovclydwhsvsxt4ayfxzbh5njwgwsq@zfhlm6lqfirl>
 <5c0f627b-058d-4213-9c2a-5adb2f174c0d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c0f627b-058d-4213-9c2a-5adb2f174c0d@quicinc.com>

On Wed, Sep 18, 2024 at 03:58:04PM GMT, Sachin Gupta wrote:
> 
> 
> On 9/17/2024 7:08 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 17, 2024 at 02:36:30PM GMT, Sachin Gupta wrote:
> > > Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.
> > 
> > Consider adding mmc0 or mmc2 alias for the sdhc_2 node.
> > 
> Thank you for your input. However, aliases you mentioned already exists in
> the sc7280.dtsi header file.

Ack

> 
> > > Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
> > >   1 file changed, 33 insertions(+)

-- 
With best wishes
Dmitry

