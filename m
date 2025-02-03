Return-Path: <linux-arm-msm+bounces-46779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A5A25D41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CD23AA830
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F0520E709;
	Mon,  3 Feb 2025 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zb+GY5TI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D4213E8A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593086; cv=none; b=FW9V8d2IRQ1qX6ShulD1uO8J7UnLDavkpT9kH+j5bxdBu2FW3H8hibdd80s0wiG40GmTlT+iWHcq609I0aAzPqi931w4N/IoGMYcOJrnQE4rHkNpvIN4XQZvIDB1ILEKYIxebuTNwP09/KMoLNj0qR7S74+cRhJgr5gXAsGeFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593086; c=relaxed/simple;
	bh=DQrineTon4oBDwNOMF4wAf5CmVWaPXA6hctLTPhSRGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeUu2LRRu1Zm0bJ1lNJvwSI0bqo/b9Sy7DVJSntg/oTOXX3UOuSQH6Mb0SIqL+5AOmDlhhC3XYZzAJ5YBFZwKA1GV6/FE/U45BYCJvASix3YqFp6zDipzbnF1c/y6F5t/NGkav55bsz/YFmw974DYZ9uxfKuZ43Qt/iJG+RvNm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zb+GY5TI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401be44b58so4847043e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593083; x=1739197883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVDFcnyLh4wiaaDr8pcIi9tA5w30/ZdPI8YjayS2Hzg=;
        b=zb+GY5TIhM2nbK06gYj/ZNfnr2LTdO2txfz9X/A5chWrBFx2IU1ezNk9jPmQmSTxtv
         R8r9XlKzhmL0FqqVP8KgiDOZ4RLYBz6RTKPYeiaWb4MQ65p43NrBNtWzDB9vZ3um+ISA
         v179MO1PyEWcugimeTGIjyZQUFThabrzPgOpClQRrliD7Nd8xCZ3Yrvvkr9VBdnHjW72
         nNJJpFzuBSqn+TNQ7YfsG6BRHAjiEz6rhXeSWzNWIoL/woNu3puY+Ra10miLTNAwnj8/
         CD+i/kr9EHmNkfWqMre4Ja4JCl5z6jA7CetlwjY1GZr3w1qtdY44jFRrfS605EjY8TaS
         FQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593083; x=1739197883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVDFcnyLh4wiaaDr8pcIi9tA5w30/ZdPI8YjayS2Hzg=;
        b=CCEfuljMB8XwGIDF6IgkR2R6ZjY6Ve+DjHJNjRxF+80XnKGTD+Xxoaa36q7FyeKCj5
         oFh7gNRiMz69GJW+eJLvlSFUXd101jJpv/ZGKRAghUfZUjMjx9TjqVOhoHqFvTDwPrm/
         HOOhydas4GSoR40BctUkWKWjgc2KLqz7yga3z7oYwVuwUtwLxVZZRh9qEL7hdbjGmvQg
         ijd867tadsQmF9VZ+yNOJyz3f2QepjWAH5YtqeHCLWYxZqwj+iKIln6oqDyh6Y8xZeUW
         9kmCXlAsXEGTg8YfVEnS+tM8HJzsHfH6bTkOo0RzVs1jxofWnvwh5r/DocTAlA+Bp49R
         9whA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMWYK0zqgm9p/6k4alHOFx2IHtVfDpWGZMWtdz9uQlAtZnsicyKDxujyoVr7eLIdZDrtBcH1VP3azPAJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFDbTDPLiI+c+3XQMbTKSPw7zYfVbQIbHd2pQ8UozGxkTgxoV
	QXJoHY1LZBJ+tM/PSmn2eUJb+Kaa42/NK2sRt+zcdAFhX8bj2iwTYXyddcGJp2w=
X-Gm-Gg: ASbGnctzlHUxMY82el/J8mBUgYcdCgS79IyC0s/Q/+DogA8oAv1vCKeb8QBd7ZoBuzu
	5geprZv5RiwRmqhilMt4QsOwdWKnXGHoNkTSCDFCR9BAs4JJnVIYPGzC0aun07LjbwXw1xggJrg
	A7Q0BDy1JDyOpPuj+dMEJW1cJByXGKA2XEJzC3+qIhvG2QmBr8G8bmGQngDmc88aWfhl/pHlvih
	QO1YBEUVI9y9hXtqA59EX7zHj0o44sG51jiHkFnDGOo5sn9LOYRLGLr4NyZHCub8ocz9SNT2PPm
	46JwCU7xIynb7CEKXGZLnXX6yyMSqqLus49jtLZQYHcgaa3RgmpD16pFzk048xlbTaEa0iE=
X-Google-Smtp-Source: AGHT+IHUghVJimpcvkNuryRp2QSiMsGJ5k9kaBv83gYo738k+5t/tc8gK88ES/UIqhPDyfIJKtVIKA==
X-Received: by 2002:a05:651c:508:b0:300:33b1:f0cc with SMTP id 38308e7fff4ca-307968fcfb9mr89069701fa.34.1738593082745;
        Mon, 03 Feb 2025 06:31:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7cd2sm14901271fa.65.2025.02.03.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:31:21 -0800 (PST)
Date: Mon, 3 Feb 2025 16:31:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
Message-ID: <ajojztm3jr6iciwqhlbc7xnndlhrq6z7z6bvbbnb7sjlybqjqq@e6sdxcjolmd3>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
 <a6fe746c-c5e2-4c39-afa8-46b225256cb9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6fe746c-c5e2-4c39-afa8-46b225256cb9@oss.qualcomm.com>

On Mon, Feb 03, 2025 at 02:50:52PM +0100, Konrad Dybcio wrote:
> On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
> > Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> > has been merged to linux-firmware and should be available in the next
> > release.
> > 
> > Bluetooth: hci0: setting up wcn399x
> > Bluetooth: hci0: QCA Product ID   :0x0000000f
> > Bluetooth: hci0: QCA SOC Version  :0x40070120
> > Bluetooth: hci0: QCA ROM Version  :0x00000102
> > Bluetooth: hci0: QCA Patch Version:0x00000001
> > Bluetooth: hci0: QCA controller version 0x01200102
> > Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> > Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> > Bluetooth: hci0: QCA setup on UART is completed
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> [...]
> 
> > +&uart3 {
> > +	/delete-property/ interrupts;
> > +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> > +	pinctrl-0 = <&uart3_default>;
> > +	pinctrl-1 = <&uart3_sleep>;
> > +	pinctrl-names = "default", "sleep";
> > +	status = "okay";
> 
> As you're going to resend, please add a newline before status

I thought I added it, but it seems it got lost during the plane landing.
Do you want me to resend it?

-- 
With best wishes
Dmitry

