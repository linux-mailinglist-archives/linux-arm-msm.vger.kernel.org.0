Return-Path: <linux-arm-msm+bounces-38800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3C9D5BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 885EA1F2121F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D531DE2D3;
	Fri, 22 Nov 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOeLJ2//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0251DE2A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267275; cv=none; b=UWGfpqEdC/qQpDVIEQwUz9YEz5vbSkLERL3lMKGVTkP+V5GeCgUsI/yz/QX7LbKH6bbl2isdxA79BOAIuqK5UQ/tKNNYuIaUrOg+6Owxaui0q97VDSVigwYVj1+ma/kTlWDqECYGnpWwXK60oTPK8TMqh+xJH0h1L1/Y+mAywE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267275; c=relaxed/simple;
	bh=8IUG6DVp0PjEdVVCknLo6uAG7WB+jRYI+u1RP3EHnrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBruniJ3dEt5nzg9+WLp+IViAryZ6nlDwXFCTzzIjnLP5XYJTUcN1lKe/upzg4hUJqcS7KOA98X8MC0YbxrWkmz6bmt4gOCkvpP+fI9jfvTAFTfIuEJc0gqfqnLS7okfT3EydAdVce/JKLlfCoNoCdAdmFydQzyOMcmzz+UcbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOeLJ2//; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so374400e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732267270; x=1732872070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LO/T9KKXXkkfpYB9cAxNeBeflDg4LqQIxBh3rr4lV2o=;
        b=nOeLJ2//WZxMYdHM2cmGewpPmrU3KmGpmacTWY8oSD+lAVCrYDoBG/qD/e2J5bBN9x
         ElrtFGfGeb9QoUesogo6XRt+2lbTK3s1FbdmVKt1Vz5HkxJztKVCpJw7QwjPhOP4/lWa
         yffqnzdX5wdK8GzyCBR4Q+DXK8O8ScKwhXSbsunU3TgmuO7pm+S2N3K6MkqVCA6mowQ2
         SI6ck18SsFbhcwsguZ0Kbdgrhn5GGcCv11oWCh+G5CXkGIoAsAA0dPQMYGcLcfwWLk3d
         NPcuMlQfhB60JV8R6dxqfTGGBpexn1Ifd6jC7HIKsyjo46Fyr4vzI0t0FhDoksHQ+U87
         islA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267270; x=1732872070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LO/T9KKXXkkfpYB9cAxNeBeflDg4LqQIxBh3rr4lV2o=;
        b=n5CnuXO8VqpWTQqmtt92kKoxlY7/v9tus4zVcgNVbQItGrGeHu8zPcCuMU1RlUhMRq
         7RI+vaQUXhRKAQ4+gBBFDgvRB8uLPBsrCiExS+XsA/CRuYzO8p5PYy7sEnGq3luFhnLM
         Rn9ea4soL5zAGUU0Ijo1mo8rJlP+4RlfU7O5AH/g6eeRLV7xj8xoBk4Md1gm4P49qpI9
         YvZIWD6cggIShr2Evszz0LEGD2la0gA8y9yJivWUFCId1YDNdAGUZ5LBJtNTcmJL+KWB
         1Zde/vSDWwbw0aaJUG9evTRfRWtvYvzJI4QoGhpaCqT/Hm4lrqHKLdnYmoCYVz9+SoxR
         DX7w==
X-Forwarded-Encrypted: i=1; AJvYcCWLxxHZ7WYvwQVzjIPIGM6J0oTR9fqRqVtZfHywBmzYgHeZhggKt9myGOvQt6p08Jk3RdOkSiCMzUm1dC1O@vger.kernel.org
X-Gm-Message-State: AOJu0YxIGeXdyf3MeiuqezW7Bt97mW2Hd4s9zugnY1X0kOu5jnemCJWR
	BtXigdsBcllqv9hNKHUgWn053QSgwVdozJ0NpIZJPagwcpjb57Oh/BzVO+0b1dQ=
X-Gm-Gg: ASbGncuk5vq8rVfQTVVbthxDiL1MvhFBDZX6iHvKRuOjPPbK9Pvbp308V2LzfmvMxQr
	+wbz+aPa1rtoTHz5LoXxSHY6XAytJ7YQzlUnJyPfSnzDJD/gHuZOAHQxJfJhIhidcA5dG6ercVy
	Rn+TmTpifZdS8YpoyDbAs1LDEuVGfwp+y3bRhzVVf325ppr8q1vVNMlyUx3T/wzpEqmp9vtVh14
	uCy2KY+IasT5mwRAIoN+EJBGpwHLk9+YHlxSCF+XhPHnaV8e6sZ1crYJI8Xj2rmNYpdnLkQ9BL+
	+g2na7sJUqF0VF6pf9hbfZJun6ZFOQ==
X-Google-Smtp-Source: AGHT+IFFTnawBn5hQYvJKNcfaecxBmcU/11dXb9HtL1BCFqTi+wvt7hCbGfqNPY2ydrBRo9pZXh1SQ==
X-Received: by 2002:a05:6512:1247:b0:536:56d8:24b4 with SMTP id 2adb3069b0e04-53dd35a4f22mr926317e87.5.1732267270110;
        Fri, 22 Nov 2024 01:21:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2497df2sm299121e87.245.2024.11.22.01.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:21:08 -0800 (PST)
Date: Fri, 22 Nov 2024 11:21:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_tsoni@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v2 2/6] phy: qcom: qmp: Add phy register and clk setting
 for QCS615 PCIe
Message-ID: <xhcly5e5efbarmlfkczyq2qz3ektfggop4qz6qe2oip4cfeiig@5n2uyndasn6v>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
 <20241122023314.1616353-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122023314.1616353-3-quic_ziyuzhan@quicinc.com>

On Fri, Nov 22, 2024 at 10:33:10AM +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add support for GEN3 x1 PCIe PHY found on Qualcomm QCS615 platform.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c   | 105 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h |   1 +
>  2 files changed, 106 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

