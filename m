Return-Path: <linux-arm-msm+bounces-46654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE9A24A4C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C010B3A7F85
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6CB1C5D5E;
	Sat,  1 Feb 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OX/rt15I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906C2F56
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426978; cv=none; b=GwoZDGekWXXDZcbTPLUkQ2MR7OXTCJHv7T4ZguLSPsEuRd0VmF92laYIw3kjclYKzqCsumUg9NOdCx2U3c0zzVIg7xs4M9nKvR+9Pa6tEzdCoMAJi6qi39NRtCUM3S9YZ82EGfoYqgX+A1YL0cw2H+3SsDhLcARZr3RjaNx8QLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426978; c=relaxed/simple;
	bh=LbDVqPMvfAWfXJowInDbnFGLIDjIttLqtOOQlAS8pGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMz+8zaYfZyi8o9/Ndpe4n9sPCsvrhM+choWj0tmtBjygMcO9A4HQu9MhiCSX5WV39x70sUvccByfxsi/yhINrXq749UGMZq/ga2PlNXj+iNPvbNJPJEgE7RkUoTO1TG1OQYuLoV7IG71U2treWipMjQpzF3QT5C4NbAweYfD5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OX/rt15I; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3080107e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426974; x=1739031774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SB7/q7mnWnKXhmf35fp13ZHl7rRS7BiN5dapcuwGPeA=;
        b=OX/rt15IW29OL+xjayqZh64v6p5R/Z2FGsLEiF4rqPoYksyoTEWzNQ+Qq6WiiqF2R0
         EHocATq1sS7RWNCdaruf7V+3iZieQETslEWNFmvfFbanAPSPeSKc3Tmc3vDfDa7iBkt1
         IOPj5XHSf2Ty0Nt9ql9ekAeFlThafllissmGTWvDmKHdrwvYhk5eYyh5OlpxuHjKzH4K
         6dsQxMUOJMCXYWzs7bFKFfbuyarA2y4okFowqPS8i6PgshBHX3oCX9CAqNKb59dO2uOH
         4AuzQKGkYbK5VxcSKnQIhj9LXEJ3V8vKzM9PVDrx36Nl5bghAuvzJtt51wC8DGpEoJGs
         ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426974; x=1739031774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB7/q7mnWnKXhmf35fp13ZHl7rRS7BiN5dapcuwGPeA=;
        b=BGmH49CJexEpjTt46JY2FVpkixuJSUweY0nQRQkCxuM64wL3lUzkc/LbSWO+Oj54zm
         dWA4TLBNQLRzI15zVCgoXDUMcVkpHncqSl/ebpIDEKqjn6qJWCyhwfOJ3smZms/zShE1
         lWkSYuIVti6Ie8vMQZOjv45p1JtmucLGfeVwgy8MkDf1VlD3IyJ6yqg3RyHYWorU0+NG
         W1LXz6+SeBEV6l30X0rUucEJYROpvnqqqgNOWkmNt/B/exOx2gYyPPMNPmRngKI/54pf
         zrYlHmzVBYl30oxU3noO0G+XvF4cC3N3VjDYMpSh69IwEfeAZFykGp5UhSDPcoqjFw4B
         CrmA==
X-Forwarded-Encrypted: i=1; AJvYcCXb4ujpS/8PpCaH0xpVEkvI6jLVSHQtRGM3w0S1ZYW4BS79Ea0i7ntA4NUCRFN1E1QdRxBYgOJZXYG9r7PI@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCzTWIBmHA7LilgHi7yxcO8mYPKudLm7RZMdkXHaE0Jprc4mK
	yQSq+EQmzinFqEKY9tBGfQh/aTJ3GtMEH4RCUMpsmfJTfhf4UqfumIb3ltO2myg=
X-Gm-Gg: ASbGncu15J2qmNRiq6Rm4fv2Gpa8k2BNkJrjT4lFvh/OW2eStqQkPiN5Xteigql2YsH
	OfNhKC165i985+d16o/t7pdB7bCGp57tXYhJVf+C6gSaxnKs6am8KUywjyd5kBTs0NjUjneDV6u
	67drzs9p19mFhPkiLQtxVyxoxmtfsNuxk7RIQJeesHKjjOtd6+XYrN7ySdM40RqottvU34exMOc
	MQCLJfcHet42iBWuYEkbqZSnvlYkseloIHZt0DMj/e4GNQ8isDTetGLwwWChokNrqWFYLxx7q8y
	GdafJXPcIX2bX8gFxbB2by/92R3F8aeNLvJVe9+UstjHor/W7ditGT5yfw7e7+9rswdaTvM=
X-Google-Smtp-Source: AGHT+IFY/QJCu1OV6j/yI8VCFmTa4eC9LGUKAVzD6ktYAmvjnDqZxme+ljXVZ2YnCurb6YGeEXAzfQ==
X-Received: by 2002:a05:6512:684:b0:542:21f8:d6bd with SMTP id 2adb3069b0e04-543f0f30d1cmr2521222e87.22.1738426974213;
        Sat, 01 Feb 2025 08:22:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebef3fsm765925e87.257.2025.02.01.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:22:52 -0800 (PST)
Date: Sat, 1 Feb 2025 18:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm2290: add UART3 device
Message-ID: <jc5lpkfhlrz3wwfyl4zrsrgsnwiowrxr6dadqf2vsjedxcn55k@yijjjvteuowy>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
 <55195890-b7d2-4df8-b8c5-fa2768e90094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55195890-b7d2-4df8-b8c5-fa2768e90094@oss.qualcomm.com>

On Sat, Feb 01, 2025 at 04:19:01PM +0100, Konrad Dybcio wrote:
> On 1.02.2025 10:18 AM, Dmitry Baryshkov wrote:
> > On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
> > corresponding device node.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f0746123e594d5ce5cc314c956eaca11556a9211..5f92eb16482a0ea5f8436cfa7e55849f171ebd24 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> >  				status = "disabled";
> >  			};
> >  
> > +			uart3: serial@4a8c000 {
> > +				compatible = "qcom,geni-uart";
> > +				reg = <0x0 0x04a8c000 0x0 0x4000>;
> > +				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> > +				clock-names = "se";
> > +				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
> > +						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> > +						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> > +						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
> 
> This path doesn't look quite right.. there'MASTER_APPSS_PROC is only
> on one of these.

Hmm. I should check my c&p source then.

> 
> + RPM_ACTIVE_TAG
> 
> Konrad

-- 
With best wishes
Dmitry

