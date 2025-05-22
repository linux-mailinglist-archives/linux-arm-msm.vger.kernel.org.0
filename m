Return-Path: <linux-arm-msm+bounces-59026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35747AC08C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60339E130F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C6F254873;
	Thu, 22 May 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXsFRHcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C369267F5D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906290; cv=none; b=c0gJTKEz5OgV4bQZYQcR0bD5wDGHbrxQUGuVHywULz8g4YNKKHu0ZvWVAes/tdnfX9i3d26WB2Ko8vMqWVhx3423JK1V9rMJqbwiMujGPLXxPC9JuQ92aKFMph2DXseOCafHSHF9sZ7i3BjB35SYfsKIEuG4qIzTZeMRdm95w74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906290; c=relaxed/simple;
	bh=eulIot54xrSLIqikEp7ew4q+RdW1x6YJs+wIAu8xBK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8WNnBTbW0+CTXwoUYRmmvCG5ohQMkiw2jng7O2uRsGgqn0bApDOee88L8goridEaYC4cRsBfpTKfHi3FRvJ7TRAG3OfhMJVQQsxJUOBIA90TncRzYHpvrboytsKnuFUOa/MEvhsYxdIvdJkNDh3hoUHG14KLbAIPpmdyD8ZG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXsFRHcC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-310ce23a660so176382a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747906288; x=1748511088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McRA8GfhRgehXg8MYkY0+SUsda90hxI698ZskmPnmFw=;
        b=zXsFRHcCTN91YSimgUsuDBURAJKbnwKu9DYAVegr07dLr59TIAtiHsvBGRIJ+VbQNt
         5Qxcfp671rP7E3VLMDMS6f2pFUzsKkQ5MmHFTWeLi7hYXNHt/3F/3pOW8ZPn2OFvd0Oh
         LILY4pb+JHoY6648SYca69EMV/ix9AgreV9ZsAZLYjOU7Ln0VzR3vyRCddTh8E+VbH7J
         xB8R65pWuT614+oM3rvEk2pPsVXZHOshP24s31ogBuUakoS82HWgzzhc2Sv6eV6zaPjb
         cmNb1BUJVFACjDMLkLlwEeBviHKqCDAAJhuH9lKLhkigzpwbtDQA8Xy4kKws+n3BZT9+
         ryLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747906288; x=1748511088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McRA8GfhRgehXg8MYkY0+SUsda90hxI698ZskmPnmFw=;
        b=plOX5qt+WuHIPT5EKAtWHVGr66CXRykOS4Hxfiz8XxHFWHHSty1pN8vIZC/iPf35uC
         WNxVJ2/0rSZQUuTMNQ+S101oMilqvgNymaFRKHf4Mt5resVRDNn8GHWlIXCalU6164r/
         hPnCXqAB05LnzWLV0ArTSBcQ1GBCKZMSmxNkdkBL/v3kV/3EdHOJU/G03IFyAzmfBass
         7jG/34kq5K6nxIcMZi8obJrPj7K4LHeB5Bpp5V13ilr83PAx7xehu6w/idnRSEl603Aj
         BVMOB8eVdcoy/3TA4imnAT23JACTnbdbSyQgkZHZtO9WFGL0lG5XCFIO2Eib+FMVs8CB
         DYTw==
X-Forwarded-Encrypted: i=1; AJvYcCVdEPhviJf9NQHCCaXXKqeqGP5vGFzhunf/fSXSeViu+aUgFYZoxisYGqL4jd8wlRb//m+1+OzxAZXOCrK4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2l5lwT7i6AV67qhI38vs1HEUpSfqYBtQZoeQdFO8ClyrId0jY
	mEBqg/ipjv8FQd+TSVGA7HACbFmdcskqagQSOxgNmEqCs8qTNMNupRDskXjOYtgU3g==
X-Gm-Gg: ASbGncuWXaWscXBgF/N08wESVtEGrG2FM+Dwmcg2R8v63c/e6QJBkipdNw5MVoB8LF9
	9saY7REzvdSQ6/4G/waUEB7ozwERJxUyykhR+1nh4/gmCKJcKCDThVykkopU+uRaP3o8D8K26IP
	GYmRIKq+si05axvScmode+fvLyG5cjbNJa6T/8NV3wxYX1VJNIvjFj5J3ujmTD3z6hxESa8xELG
	RWogBIDkXSKZbXnvFM4gdqjlf1cYld1hNDiuwC8Y8juIGc0K1zJl6dv3j3l1gpZhwMuOqJIgQ14
	w3h2KfSIszZoDrYtg4hZ21c9DvNBzYACfeZPfaVRR6lkejHh0vEEcNokgXmugw==
X-Google-Smtp-Source: AGHT+IEfA9wKFCWLKzq6OJebXZtbQME9Px6iFLhEXecijsMacaFwVvyT0/nc82hwLeVlFppAYaMfXQ==
X-Received: by 2002:a17:90a:fc4c:b0:310:8d9a:ede1 with SMTP id 98e67ed59e1d1-3108d9aee0fmr9234584a91.4.1747906288204;
        Thu, 22 May 2025 02:31:28 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e9338926esm6340266a91.2.2025.05.22.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 02:31:27 -0700 (PDT)
Date: Thu, 22 May 2025 15:01:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
Message-ID: <zelvl7b5ov66lzbgay42ncdbkof3flv7g3gybqexth5hty6mvq@eemod4qy6gqs>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-11-quic_nitirawa@quicinc.com>
 <k37lk3poz6kzrgnby4sikwmz6rg4ysxsticn3opcil4j3njylp@cvmgwiw6nwy5>
 <9092ed42-ef8b-42cc-a423-c5a486d3b998@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9092ed42-ef8b-42cc-a423-c5a486d3b998@quicinc.com>

On Thu, May 22, 2025 at 03:48:29AM +0530, Nitin Rawat wrote:
> 
> 
> On 5/21/2025 7:31 PM, Manivannan Sadhasivam wrote:
> > On Thu, May 15, 2025 at 09:57:21PM +0530, Nitin Rawat wrote:
> > 
> > Subject should mention ufs_qcom_phy_power_{on/off} as phy_power_{on/off} are
> > generic APIs.
> > 
> > > There can be scenarios where phy_power_on is called when PHY is
> > > already on (phy_count=1). For instance, ufs_qcom_power_up_sequence
> > > can be called multiple times from ufshcd_link_startup as part of
> > > ufshcd_hba_enable call for each link startup retries(max retries =3),
> > > causing the PHY reference count to increase and leading to inconsistent
> > > phy behavior.
> > > 
> > > Similarly, there can be scenarios where phy_power_on or phy_power_off
> > > might be called directly from the UFS controller driver when the PHY
> > > is already powered on or off respectiely, causing similar issues.
> > > 
> > > To fix this, introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off
> > > wrappers for phy_power_on and phy_power_off. These wrappers will use an
> > > is_phy_pwr_on flag to check if the PHY is already powered on or off,
> > > avoiding redundant calls. Protect the is_phy_pwr_on flag with a mutex
> > > to ensure safe usage and prevent race conditions.
> > > 
> > 
> > This smells like the phy_power_{on/off} calls are not balanced and you are
> > trying to workaround that in the UFS driver.
> 
> Hi Mani,
> 
> Yes, there can be scenarios that were not previously encountered because
> phy_power_on and phy_power_off were only called during system suspend
> (spm_lvl = 5). However, with phy_power_on now moved to
> ufs_qcom_setup_clocks, there is a slightly more probability of phy_power_on
> being called twice, i.e., phy_power_on being invoked when the PHY is already
> on.
> 
> For instance, if the PHY power is already on and the UFS driver calls
> ufs_qcom_setup_clocks from an error handling context, phy_power_on could be
> called again which may increase phy_count and can cause inconsistent phy
> bheaviour . Therefore, we need to have a flag, is_phy_pwr_on, in the
> controller driver, protected by a mutex, to indicate the state of
> phy_power_on and phy_power_off.
> 

If phy_power_on() is called twice without phy_power_off(), there can be only 2
possibilities:

1. phy_power_off() is not balanced
2. phy_power_on() is called from a wrong place

> This approach is also present in Qualcomm downstream UFS driver and similiar
> solution in mtk ufs driver to have flag in controller indictring phy power
> state in their upstream UFS drivers.
> 

No, having this check in the host driver is clearly a workaround for a broken
behavior. I do not want to carry this mess all along.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

