Return-Path: <linux-arm-msm+bounces-47260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F238A2D9A6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 00:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D951888960
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 23:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BDE148304;
	Sat,  8 Feb 2025 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLWrlf9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09A24338E
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739056991; cv=none; b=OavcCd6a3cEoyHjGOfjRukmignMzvIgY5FE+y8pnnituN3rno1xUhWe+OzNsjGZMjct/HHgnuEaKOJC2e1vlegeE3HuEtKEst1RJML0PUsYmxJV7wCKLs370GahwDVzoqBhhw+NQfp3WoZt4d1BbT/HQKEwhDqzTNK5QxcMB1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739056991; c=relaxed/simple;
	bh=PLIDnn6usldfw2RsFfecIxrGar99FFVUikArP3YZaB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrilDQkhgkPmSRLY3zvOt1GZikql1u0t8k2POIkBRMOxZfwW0Juecio72UOLaQZGnX5wpR7cOpxrGuoahR8SZPdWI2uj8QtA3ZEzeXFm8sylo3g8jttH910zaT41QLHHPW5mZRZxCxKKgyCN77zD9YZ224Uldg6IqhCRo3Ir//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLWrlf9L; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54504f29000so818881e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 15:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739056987; x=1739661787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykULb9cEiyiSRjZuTpehkeQRCkbvvsFyEn2UQm5iuoU=;
        b=dLWrlf9L1hapsR/1s3qGIvbFzn4oC3YtDwu6JRxxFoCShgjyghBlaRf1zh1dnyyCi8
         1nUdut8ebY7q0JreqanLP2l1PDUgeVkpqfd3qNTYcr/tg8TStYhfKAI1snD7mwyk+jnb
         jhTpU0QYImElTigR7GvdEfcC6eTuSyPPPTkhDzO2INI4tStktGdz7glxteO0Ml0f0SLI
         5sbO2bca5GNYKqucDAOWFGIp4lYgZ/92K8zOHdieWJX2aZ7qwwwJWuRrAv0zd2VYyjZQ
         dM9y3gJhnCbkT5kVx7FTupxtcZK9EUal84A7xwpDig3Y2UhLJsBX6ruvgThHOE/zYM5O
         fBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739056987; x=1739661787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykULb9cEiyiSRjZuTpehkeQRCkbvvsFyEn2UQm5iuoU=;
        b=jua/xYuCtkyPL2hKzzEwU25SMhVzn60jWl0Jq19Ua4NGj1zduR3rIiWlGCSH3h2XWc
         n2LEJQcBVUwaXvVLuNn9Ww1j92ML78Q0MSYD1xJBdskmu4TaH3b6JivNQ2vPMj5pBtUd
         z+sxy3qEMKRsFMlTHYsqXxMhSFZ8EIUYvOpJjh5OefxIN8wgUR97QsC7BfDlCVqcBhlP
         i4OFtAIiJgPg9495zpKUFm3GbCXu8P2stFBn81mVntx1Ij12LRXIpdUd5DSY4McoWuZL
         n031w0XI6aFQQCxm0TkzNQY3WeXJpEiiouuBTrcUgkd/nl0pxhq+cNhNVqkMzcQMz5LI
         Z/sw==
X-Forwarded-Encrypted: i=1; AJvYcCXktUCckY2lnl4+LVldtF+f4kCj/t4PkYD+jt3WysHFUzyD3AhuFnVA/F5RcwrlzO1NqVI3KgPIwekEJuDD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8gSbclH3Rij2l5kolx2lsokevVmj0qXchwvx4smCWkgGh9kfF
	WNrYEDsjZ4xJxTbIUNIGh1QuN8cuUoy+/kJ5fvA2dCEJZlB3VPUeb/GCOMiQ3kA=
X-Gm-Gg: ASbGncsL9wPolXidY+l7AwVp7xLZQQ1qiAaIvPcmWJMF6kge8LwRuyifUInNNIKY6fn
	X9krcdWign2w8bLHqLMXrfZ7Vl2T5tOkZGdHjp4xtwbdd8gn2P0c/gZmEv3elHhbB7O1ilBBeUR
	Uof3/9/Cg2r0dkMHOXUMz4NXW34jEO5vHISU89/wwdD2eUC000FdliSeUdXvYjxp5nl172Q4D71
	OH84wMmW1nFwUc83ohdzAWooq02L2l3OzPFIw4jUDQfqCCo2f4yxyLGwMdsaTQw6TJzVNQPdY49
	K5KUxQ81ueEtRqv/mPnwHb0TQYO8QwAAlSckrPqr8RhW7iD7axEjRkC7fSCsEjRYCCHVhuo=
X-Google-Smtp-Source: AGHT+IF/JBvJkuagJqa26itTPE8jU8/kvFQIMKuDm05aOsyGHWAPDELu87GWmNGqjraF7sL+Cp5yWg==
X-Received: by 2002:a05:6512:3a85:b0:53d:e3a6:ae8b with SMTP id 2adb3069b0e04-54414aa80f7mr2528489e87.26.1739056987259;
        Sat, 08 Feb 2025 15:23:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f2f31sm832127e87.165.2025.02.08.15.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 15:23:05 -0800 (PST)
Date: Sun, 9 Feb 2025 01:23:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/2] media: qcom: camss: Add sc7280 support
Message-ID: <dv6ccohw33gnc42fhjmxaofg5lyip6jked2u26rwkxykcwt6sx@vlgjyjkn7wva>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>

On Sun, Feb 09, 2025 at 04:21:41AM +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor.
> 
> Used following tools for the sanity check of these changes.
> 
> - make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
> qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
> - make DT_CHECKER_FLAGS=-m W=1
> DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
> - make -j32 W=1
> - ./scripts/checkpatch.pl
>  
> Changes in V14:
> - Updated commit text for [PATCH v13 2/2] - Dmitry
> - Removed duplicate Reviewed-by tag for [PATCH v13 1/2] - Dmitry
> - Link to v13:
>   https://lore.kernel.org/linux-arm-msm/20250208165232.2371889-1-quic_vikramsa@quicinc.com/

For the series:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

