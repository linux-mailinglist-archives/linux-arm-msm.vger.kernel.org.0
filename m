Return-Path: <linux-arm-msm+bounces-3664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68B980853E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EC31283F10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC20635889;
	Thu,  7 Dec 2023 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ciHMHUep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5321193
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 02:13:04 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso806151276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701943984; x=1702548784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3B67B1TYSjUdt6Cc8K4XbRIZ1QzqkY0WH6+puDGmn4=;
        b=ciHMHUepSltr4g56V7l6mEs/NQDP3xPGlRjPxmgeIFK9L3OwSp/sA8/mHv8AUxjiYS
         e38OTUXVtymi0rj3uhgT6ZMNS5pLylLhBx+FW4FO75IRJDqh2PAI8rf6k26iJfCAmMsl
         ImCm1tuuvvmeQ9v3D9vBEw1iVv9ZoQ+h5E7X5aGpyB9/kb50VxEK8xILiauHQGXpVGA7
         T9m64BQZp16DqTYhAZZm6ylqgK92grDQZ59BWN+nOi5RW2X75smZM6vf0pwk5ufyGROk
         a3X5ENF7ZA7wwstyrHaT+fAxZsq3JIJUXOVQa2RO0xLMcMduq/X1EUyDcGQqzLUeavSo
         /HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943984; x=1702548784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3B67B1TYSjUdt6Cc8K4XbRIZ1QzqkY0WH6+puDGmn4=;
        b=TTRRRYNxWTnS3Uu9fCzsjyX6Fb1Ww9Kg2LQZ5l4RpF0z555WgHeJkKRz9o1KUjgRmw
         taMSkfnSvZsgJtSF0kUNcdSGHp1beg8gDJ17WL9Yz8Fi/MpEYaUnis+USM2EhHYz+xd7
         s5U3TII10qD75Om4De+b/d2qDsMmb/f7I84mJMDFcHeAAdEBf2aSz29fg6uGo+FndiEK
         KSPZf2JPeDr7PAOiDoQS26DMy0FYm1GPvXtHjl2xiLxyDRKgPJlOnx1nWSNa0RSeXAPt
         D/MdrnaWJn9jN/pMl54E0cw/TTCbfZoaJfpaAX6/F54cmEKa3Y6ArKtgaqjd13ezNLQh
         W8eA==
X-Gm-Message-State: AOJu0YxLTynL2Qy2URsAFUl30r6lOR8IAmZg8QxgMhrgWfzVlEEaaDtd
	ubsuEptoKlDYZkhwB+Gk4s/6
X-Google-Smtp-Source: AGHT+IFNn1HUFDtLCOGTeA3m9Ta/i3bQvpYxwVgKKLYlxLDmi9pfv/W/T/9B2nxE7SkRSL3QSWQJtw==
X-Received: by 2002:a25:243:0:b0:db5:4503:6de5 with SMTP id 64-20020a250243000000b00db545036de5mr1932607ybc.60.1701943983997;
        Thu, 07 Dec 2023 02:13:03 -0800 (PST)
Received: from thinkpad ([117.248.6.133])
        by smtp.gmail.com with ESMTPSA id l13-20020a0cc20d000000b0067a22bb8d57sm373453qvh.56.2023.12.07.02.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:13:03 -0800 (PST)
Date: Thu, 7 Dec 2023 15:42:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Message-ID: <20231207101252.GJ2932@thinkpad>
References: <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
 <24fae40a-453b-b14c-923f-88758a246aa7@quicinc.com>
 <20231201060716.GJ4009@thinkpad>
 <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
 <20231201111033.GL4009@thinkpad>
 <f844cd1e-7e4f-4836-bc9a-2e1ed13f064f@linaro.org>
 <20231201123054.GM4009@thinkpad>
 <3a7376aa-18a2-41cb-a4c9-680e735ce75b@linaro.org>
 <20231206131009.GD12802@thinkpad>
 <ZXGVjY9gYMD6-xFJ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXGVjY9gYMD6-xFJ@hovoldconsulting.com>

On Thu, Dec 07, 2023 at 10:51:09AM +0100, Johan Hovold wrote:
> On Wed, Dec 06, 2023 at 06:40:09PM +0530, Manivannan Sadhasivam wrote:
> 
> > OK. How about, "qcom,broken-refclk"? This reflects the fact that the default
> > refclk operation is broken on this platform, so the OS should be prepared for
> > it (by keeping it always on).
> 
> Shouldn't that be
> 
> 	qcom,broken-clkreq
> 
> since its the CLKREQ# signal used to request REFCLK that is broken, not
> the REFCLK itself?
> 

Darn... You are right. I got carried away by the initial property name. Thanks
for spotting!

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்

