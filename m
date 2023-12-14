Return-Path: <linux-arm-msm+bounces-4646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDD8126CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 06:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70EBA1C211B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 05:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF72610B;
	Thu, 14 Dec 2023 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muls9Ixx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A7D114
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:09:50 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ceb2501f1bso6780818b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 21:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702530590; x=1703135390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HRQN/5Gl+E+Y/YwiwR7f4dgjP1vz1MfNF5W9YJDw5ro=;
        b=muls9IxxcvhgabpJnsNRrjQqVmbLHeRx9Z19ijPtLKdd6DTHqLeN9szmdTQFEwpc2o
         XvWXG/Ug7BQ5NCowzMWQXhdGAqdRSQ36nmPSem1r+rFZ6QjmZjkKoTjzblD+7jb/p5uC
         uRil78WewuDF5wHA3/X+olXRHjfQLDe676duAZpmEtBMxC+uigAe0ZAJn4KR78fAvoNQ
         C7Cf4W7AyFuHOJNjS08euBGaoDXQ4HOkNnYB0mxGQPk+NLfLDFxl9rOPAIQ1BCdCqr3c
         SWA2IVRpgQ3eAtZJ0YE+qYtkrdo430yg5lzdw6mGQGnoXhTAI9aCXdi9xelC674BykLY
         TMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702530590; x=1703135390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRQN/5Gl+E+Y/YwiwR7f4dgjP1vz1MfNF5W9YJDw5ro=;
        b=WbGk9X1NgKixpoMyovUopfnuLq9F2cC64pzq9ZVIAHKL3ZTr9FzHvqqz/OGJJJaLQp
         f0LIzc3XK4QIhdMgoXnGrHFXajh1DDFoR+21gAOxPhseQsWwRzFso7V0GFqlrAGxDc0r
         oZol/9Kksm/N/pjpcjDvp1aEuq8A2arraBSeVypcAJxJPALI118DFcf0Fvg494JtXMEJ
         60ykKWsiMsFO0ZJUYWnbP6goO/aFs9lJ4BkagLQuOLU6Ap8gj3ZvlhLo2pBZbzqW1c2l
         IBN2wolBejVdpBE54+CC7IufU+6JRoJQ7Q8KJ5NZNR8Mg3zJ5jljs0xed8j3TcVlMAx7
         Sxjg==
X-Gm-Message-State: AOJu0Yzog/RiV7Uf+p1lEP/eBb5fGJAkhNnrpYueT+mhMaKSyWN1fFLH
	HsGPlkjYJFkScu5awwUUIhX3sLCWBkcBeGadYg==
X-Google-Smtp-Source: AGHT+IFoiD3gBR12SGaJPAivjdmpPvziAoacTLgEk0cWcQakHmt7CoNZ8PQ69964IUM6048brgNieg==
X-Received: by 2002:a05:6a20:1604:b0:190:3b35:5999 with SMTP id l4-20020a056a20160400b001903b355999mr12233369pzj.9.1702530590210;
        Wed, 13 Dec 2023 21:09:50 -0800 (PST)
Received: from thinkpad ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id z17-20020a17090ab11100b0028a69db1f51sm7950911pjq.30.2023.12.13.21.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:09:49 -0800 (PST)
Date: Thu, 14 Dec 2023 10:39:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: martin.petersen@oracle.com, jejb@linux.ibm.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	ahalaney@redhat.com, quic_nitirawa@quicinc.com
Subject: Re: [PATCH v2 00/17] scsi: ufs: qcom: Code cleanups
Message-ID: <20231214050943.GC2938@thinkpad>
References: <20231208065902.11006-1-manivannan.sadhasivam@linaro.org>
 <b2d6853e-2de7-4e12-85f8-c130d9a745a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2d6853e-2de7-4e12-85f8-c130d9a745a4@linaro.org>

On Sat, Dec 09, 2023 at 06:42:31PM +0100, Konrad Dybcio wrote:
> On 8.12.2023 07:58, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This series has code some cleanups to the Qcom UFS driver. No functional
> > change. In this version, I've removed code supporting legacy controllers
> > ver < 2.0, as the respective platforms were never supported in upstream.
> > 
> > Tested on: RB5 development board based on Qcom SM8250 SoC.
> > 
> > - Mani
> > 
> > Changes in v2:
> > 
> > * Collected review tags
> > * Fixed the comments from Andrew
> > * Added a few more patches, most notably one removing the code for old
> >   controllers (ver < v2.0)
> FWIW i found this snipped from a downstream commit from 2014:
> 
> 8084 : 1.1.1
> 8994v1 : 1.2.0
> 8994v2 : 1.3.0
> 
> I'm yet to see any 8994 production device utilizing UFS (it wasn't
> very good or affordable in 2014/15 IIRC), so I think it's gtg.
> 

Thanks for digging! I was told that SoCs based on UFS 1.x controllers were not
widely used in production, though I don't know why.

- Mani

> Konrad

-- 
மணிவண்ணன் சதாசிவம்

