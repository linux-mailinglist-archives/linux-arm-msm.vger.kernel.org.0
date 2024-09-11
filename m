Return-Path: <linux-arm-msm+bounces-31530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA68975920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 19:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C46BE1F2755D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 17:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D8E1AED23;
	Wed, 11 Sep 2024 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eO2RmY19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94B6F2E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074943; cv=none; b=BCVzbBLLPyCh/wIKXlIdNIDGQNrLm6lho7sPKj7OVd7Hqo78pezbS26aKSzpHeGj1NpeswM5ZqNhIdxYx8P+f7WzOcWLudA21rpVNkV77OcT3HH1aiJj9UYGdI/XTdRhno/Y1QHUpdaG2cr6ruSJLbq/XR4J5oggo21waqMYREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074943; c=relaxed/simple;
	bh=gKSJcWcx7/FQZ2m0mQH0VM1o1ZdEvOQ4khTHZUPZj0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7tq9KKzl7GnsOZNmfmCRzp2t20HlKpKVj+cNeT/xJRJjcEa73OXTv37r61+kMyoz9gECx1f2qe7IH8V6Qmgp9R9oQabNZSIRgJMRg6b38L3AfGsbOpLth5b8Q3TFyjBNzaJY9pWGlJyaYT+UfAtJ2sPPe6SY8B3LTdOP5c+CDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eO2RmY19; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-371941bbfb0so71437f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726074940; x=1726679740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7hIkqY6yzMI19aPeRgJcYOawca4yCAFYgaDnXopqdZw=;
        b=eO2RmY19Wwb90cmwTy1uXwIv0RIAV+JI5M2nKyExKJbeO3+1ez3Yeud9Y7Wzb+lqeL
         EpPoekWJ+u3RYgddgZ1jZNInA2WZ3gZ1RQQBH/soBW1QMa5F3TLTeorb4NqVewY0Jr1q
         61DWBZ1aIqgXGvvY238nwuOrNdd5FVaE27yAJpjYKpdSpBGwmgMPUPC7yOb2C5dM6Ai4
         iWx2879ACyePrnQI/O9qqQlGiJTwBGXeH4BZa8NrAv98lmleou20jNQ7UMPf5x/sGZcm
         vkXPnM8dt7VFkuZ995GzezZhtPhOzhZ9zZuKfozxulyY2f8M2GEFZoLVo19siCMqdcgt
         zylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726074940; x=1726679740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hIkqY6yzMI19aPeRgJcYOawca4yCAFYgaDnXopqdZw=;
        b=u2sNx4lkk5bEdZwADOCfv1W3yEK4NOIGWnT2k3V0ljqxHgvv4dLOLVSUJFWcFJvnMH
         Qxm2ZKrqfT8uK7KqH55CwmhqRdQV4mJyf6Fw4g2GhBA1jXbeWjY02c/VQ6WaxCg/Hkup
         OpCqkTzw0kiLDFfR3ayACbE7xgX5Ro0ybceMXeN4khJUhy+9Ger9xBict9BL09Z+Vz5s
         AVO/UXLwgHdo3+PK4Bl4Smf3b/AqI8RzAuez1z1uTDj/AzeoOCwa9TZiP5KlWwBb/8/C
         wDZTf2+6E300EW5yCgvzOjpER3wQXKS5T//AAezJXUV3cBROdbyxXLRpIOmhVpD56YJv
         gHVg==
X-Forwarded-Encrypted: i=1; AJvYcCUT5kaiZYOyRAO+trC41hi7vtn1DTrH6D0NRY3/jOmqGn0A/5i2WGKcoPCVe6pknY26tkk/sw0tfoLnP+oK@vger.kernel.org
X-Gm-Message-State: AOJu0YypQF2vukbFeQt0B75hscd1EbQ+sFRRRproGfIUU9xTlBZIgITr
	EPYsGjNYMyHwLkvnibcEfOmQWrVlA+J2BRvj/8gHcOpsbK24xKeWU8kRfF2Ho/o=
X-Google-Smtp-Source: AGHT+IFwsGFDDcYLdQbQDbnH2ecaEuRN6fTPY6e7kQA/Klr6JIoXz9qoW0zDvWsGSBZmy4CX8Oxabg==
X-Received: by 2002:a05:6000:124b:b0:374:c942:a6b4 with SMTP id ffacd0b85a97d-3789268ee7amr8782092f8f.20.1726074940059;
        Wed, 11 Sep 2024 10:15:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a340sm12072218f8f.24.2024.09.11.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 10:15:39 -0700 (PDT)
Date: Wed, 11 Sep 2024 20:15:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	konrad.dybcio@linaro.org, andersson@kernel.org,
	andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, conor+dt@kernel.org, agross@kernel.org,
	devicetree@vger.kernel.org, linux@treblig.org, Frank.Li@nxp.com,
	konradybcio@kernel.org
Subject: Re: [PATCH v2 0/4] Enable shared SE support over I2C
Message-ID: <ddb6143c-1dab-4397-817a-32015984ff55@stanley.mountain>
References: <20240906191410.4104243-1-quic_msavaliy@quicinc.com>
 <ZuHNJl7VvMSv8q8l@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuHNJl7VvMSv8q8l@vaman>

On Wed, Sep 11, 2024 at 10:32:30PM +0530, Vinod Koul wrote:
> On 07-09-24, 00:44, Mukesh Kumar Savaliya wrote:
> > This Series adds support to share QUP (Qualcomm Unified peripheral)
> > based I2C SE (Serial Engine) controller between two subsystems.
> > Each subsystem should have its own dedicated GPII (General Purpose -
> > Interface Instance) acting as pipe between SE and GSI (Generic SW -
> > Interface) DMA HW engine.
> > 
> > Subsystem must acquire Lock over the SE so that it gets uninterrupted
> > control till it unlocks the SE. It also makes sure the commonly shared
> > TLMM GPIOs are not touched which can impact other subsystem or cause
> > any interruption. Generally, GPIOs are being unconfigured during
> > suspend time.
> > 
> > GSI DMA engine is capable to perform requested transfer operations
> > from any of the I2C client in a seamless way and its transparent to
> > the subsystems. Make sure to enable “qcom,shared-se” flag only while
> > enabling this feature. I2C client should add in its respective parent
> > node.
> > 
> > Example : 
> > Two clients from different SS can share an I2C SE for same slave device
> > OR their owned slave devices.
> > Assume I2C Slave EEPROM device connected with I2C controller.
> > Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
> > This gets serialized by lock TRE + DMA Transfers + Unlock TRE at HW level.
> 
> Where is the rest of the series, I see only this cover letter??
> 

Something went wrong sending the series.  Here is the resend:
https://lore.kernel.org/all/20240906191438.4104329-1-quic_msavaliy@quicinc.com/

regards,
dan carpenter


