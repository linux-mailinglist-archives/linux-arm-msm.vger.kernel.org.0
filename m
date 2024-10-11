Return-Path: <linux-arm-msm+bounces-34017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEA999C9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DEAD284BC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981F20124B;
	Fri, 11 Oct 2024 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNLPdkj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9DB2581
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728627948; cv=none; b=U/wGRdxrFXzNGwiB2IURvp4mxA0VMhYUG3265WHth9iYJ2R8tH5FetebnLWHjiPA7Z5JyLJFHhK4dMrJDYyEugiWvCvl7iOX4jftwCJXPaO0Rwt3aWN4CuactteEZ4cqABCem9Jp78IMBsiuwUhOQGgAlpRgH1tYLTehedV9ALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728627948; c=relaxed/simple;
	bh=UJoFkmi3YqkhXLyQVgq25QKcgb3JPFgQ8aUBBPPRUXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbeR6gj3QbR3JEL2p8SjegeIzQdsLtJvEIovxh+E6/RJduOrZ595IzShxsIIGhmgauQ0r88QEVHBHgyRAEvY1R2MJz63uo3B+Zz4bUwWg3nHQ2JPBlJgQeLABK8cObWsTGQx1xd+NlzjAQzbjfJ5irmNCUptkJU8yvPOmEdZVlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNLPdkj5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so2116540e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 23:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627945; x=1729232745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAWWAAZRi5dwUBX2t+OrlMVPdUe4A/Zp86YxWssIhEE=;
        b=QNLPdkj55RtebF0MAYqAfZ4kRHid9ObLzlPLCN9RI/oTtrHZSVQSia3/H2SqgNumW9
         qWDLCu+dxJQLHYbMujIK0vKdP2ZqpCpYsMoRmBhDLnKOODOraQonPiH7ZEX/sSOqAcx4
         XAaHsoisDJB0kg8bohN8MUikfdObWdnYHQo/ftQgOZT/KEdcviOofO91pldsAnrOgo4a
         4lhxROtWOsMkZswGuJOmnJrK1dJnXdUrR37geMzm5/tLLl3rlYbrImr3VTbL5BzGz7zX
         zvVya1ihtS6g6AEZ6GWt3gXTSHcXmTNFxA8ubF6jHbewjAZsWJn5BrvWRFt9kSKCs/n6
         np/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627945; x=1729232745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAWWAAZRi5dwUBX2t+OrlMVPdUe4A/Zp86YxWssIhEE=;
        b=T+BjNPMIzdPyrHnguJ2aPDr4hFakIJbwXK4ZnLBPbLGRHC0PpAVlW4PWcrlrXGDEJR
         dTI6/XWVOANWNB+x2U+mAYjUtgu29k57P0C8hy5X1/VuiRgH381ZNNRtNNz0Fo+SJkEY
         nZM0DKC/B4PSO0pCb8FQArxe8bYdzpMXKuX0U9QkUu66CZeX0KVdEyDDXjnMXuU7eWUN
         ij05/x9gXFUVWBtFIbNNmXhjzBI9qdSecNj+eADKMHkaNZfGuoWF1T31Ga1ZszRZqvTq
         Aj/BC4wiW+LZK0W3G5ASi2NxZk+NaQ0dA2ns0AJ4hejOUQYA81KJaGOAqe5SWSb31MIY
         ACxg==
X-Gm-Message-State: AOJu0YyWAB/oJMLukN2QIk3xP4nspU069mWgFNeaoNTiqccFa8cGGSMp
	1ZFRPPKczTlwF88LovWM4oMaBsenT/9X79nd3N42xY402lnMQ8w2up69M90cVKk=
X-Google-Smtp-Source: AGHT+IEzf03r1Z1fB6lurUUc6qWJa82LhtAXSaLcMJYbciKht7msDN0Dsyh19Ch1AuKML0LDr3EVZw==
X-Received: by 2002:a05:6512:308b:b0:535:d4e9:28c1 with SMTP id 2adb3069b0e04-539da3c6e43mr533170e87.20.1728627944658;
        Thu, 10 Oct 2024 23:25:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539d1b3c72asm269507e87.254.2024.10.10.23.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:25:43 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v7] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <yttw2tici2n53m4rflmkcliwwvlm3v4vass5m7lsgf2ebf75gh@ztnroslejkr7>
References: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011041939.2916179-1-quic_miaoqing@quicinc.com>

On Fri, Oct 11, 2024 at 12:19:39PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> v4:
>   - update 'ath11k-calibration-variant' to "Ride".
> v5:
>   - update 'Ride' to 'QC_SA8775P_Ride'.
> v6:
>   - no code change, fix patch version.
> v7:
>   - update 'Ride' to 'QC_SA8775P_Ride'.

Please consider using b4 for future submissions. It generally saves you
from such troubles.

> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)

3 revisions in 1 hour is a bit off. Though,

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

