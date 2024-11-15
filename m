Return-Path: <linux-arm-msm+bounces-37954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D549CD80C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE48728222A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80981885B3;
	Fri, 15 Nov 2024 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8pJrJBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50244186294
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653220; cv=none; b=edv/i5W6oQ2QrtQGgH45fcCZhP/twcdCPR1+wH/cQ4l2RDdRc7/sjGaT16Mw6BWgsONHbUxiipbu00Tz11n3ykyqlV5ZpshggDokl9APVL8sJz0yx48vzOEXp4+fToTmWCPn2gR0hn66PkAzfjbIXNQule969FRXysemYic4GZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653220; c=relaxed/simple;
	bh=6qPHPlugeDCueFbEoNB3un8kv4mr+aZBLbJBD2DhCFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZWw8PK1qvF7oLMCnH9o5ADI7ZByeCTtenCKeBBfQ3/kL7dHKM/6+xhBjFwtVnRli7PuSl/2ZHA6NoP3kHiLOgIbAcpP22e+5xUEPsUvK8CBtHOyJ9NYuzsx2h/Bxr3cZE+Ut9YITNyj6haF2942m+2YrkP1kaUg2W6zbMie8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8pJrJBV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so1140943b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731653218; x=1732258018; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/BfAHb1ZSMqVdqDSvsNC7xvx5+b5HvV8VHYR/A40J0=;
        b=m8pJrJBV9n+AxPJQfIgl0W7E8hqUkNg4pqq12rE9+gL/w7PIxtB/gmZhZ1GMl/vHlQ
         +lJJ/raptPdx/ytjwGOV/dK/weZngEtVVo5XVpcjxuMKM92yvxwj/72nsEq/0XDEFx8A
         jlpWympP9mfj0kac5DkioYx7kA7NtiYr/1CPaHdmBBswNeb7oEc9x27XfEd2iMntBkDp
         LflkZoTGcUAUaPmuDu5kHa/B+LA4jk82my4QI9VxRZRhyA5S41F23SWM87jzERviCrde
         Ur1PXnY9Jr5YSZTtWCc7TWBtEFgNPbFzb+fwtuxXhlECK5QuizIrLZFSt4RSc+K5F1tW
         gOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653218; x=1732258018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/BfAHb1ZSMqVdqDSvsNC7xvx5+b5HvV8VHYR/A40J0=;
        b=YSSduHwp0Xnzl5aDR2r8aPb9ksWdT0wZsBAKgSOVaAtm1ifpb5JtMNaftymyySQ+WJ
         D+AyJ3bWFtXpPuwHgFg4jttZXkv77xnaOkKdQm6iLXQDyxd0FGDHdiM8RcpK0qrxkbQk
         p0t8xY3HJnGLmYq6Ll1KbdKPx81XxGRRzhrw0PCRS1FoQEW3DPzxHwKYbEowOyuslCJS
         EyxdVy6vRCh5ASoBAeUm6ZdO36SerD9T5XpHGEY/OXfPrq00XWSHLhJLxhJcr4772swU
         DSODfDaj4wa4fkHYEYbDDsfB/GzJjqsmarvhOMvVHLFzfXYb3clkylU56JWXaE3VvFC4
         DzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdu0/ksccY0W4ZZPrwGU6wxVIlBvxFOwQoQgfkgc/lShLGtJsuwZvZX3BFCGOS+/tMwXGYMwWHKNuoIZF8@vger.kernel.org
X-Gm-Message-State: AOJu0YyMvRGiP67pcKQ/YnMq+XO9W+p7KCfRgjm0Tg7brOMIgqm3ITrz
	8jz/kIn9lVkeNVR0e7e7y+y8xJ8BS757xBJwYgtup6lQVI2Tpf3pcHJ94VzhJw==
X-Google-Smtp-Source: AGHT+IG7g6V+GncMskJmi31sl11CTfqGguPy66PiWd2w8mZ74T+uGZMa+rDBHSDEHgff9qIU3c4ZGw==
X-Received: by 2002:a05:6a00:2309:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-72476e7b88emr2343975b3a.22.1731653218397;
        Thu, 14 Nov 2024 22:46:58 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770eef26sm661670b3a.33.2024.11.14.22.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:46:58 -0800 (PST)
Date: Fri, 15 Nov 2024 12:16:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, robh+dt@kernel.org, bhelgaas@google.com,
	kw@linux.com, lpieralisi@kernel.org, quic_qianyu@quicinc.com,
	conor+dt@kernel.org, neil.armstrong@linaro.org,
	andersson@kernel.org, konradybcio@kernel.org,
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
	quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
Message-ID: <20241115064648.7ugkijhsobc4gcda@thinkpad>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <a02925d7-2d09-4902-97e4-5e7f09d7ef21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a02925d7-2d09-4902-97e4-5e7f09d7ef21@oss.qualcomm.com>

On Thu, Nov 14, 2024 at 02:02:48PM +0100, Konrad Dybcio wrote:

[...]

> > +
> > +			pcieport0: pcie@0 {
> > +				device_type = "pci";
> > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > +				#address-cells = <3>;
> > +				#size-cells = <2>;
> > +				ranges;
> > +				bus-range = <0x01 0xff>;
> > +			};
> 
> Are you going to use this? If not, please drop
> 

Absolutely not! This describes the IP that is present in the SoC and that IP is
being used. You can however keep it disabled in the soc.dtsi and enable in board
dts when PCIe controller is enabled.

Moreover, I plan to move the slot supplies to this node soon, so it will be
used mostly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

