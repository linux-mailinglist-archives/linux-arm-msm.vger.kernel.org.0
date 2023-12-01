Return-Path: <linux-arm-msm+bounces-2868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4480096D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 12:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFF41C209FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 11:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0FA210F5;
	Fri,  1 Dec 2023 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4hmhtpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C4710DF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 03:10:47 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1faea6773c9so214335fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701429046; x=1702033846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edpCM+r4M4/R7CxGMXVYffuZgPSvVTUvgVhnl4+XzgQ=;
        b=j4hmhtpwzmbmJ2NftdTgSWUh+c3zsuS0Lm3pkdDmtCWdsWPmmPwTSZ5EM88HYW7GQi
         8HP7B9x2LaRV39PWxMI/OfE4gVwKdzHb3pR4Cl5gr+HSId3SUc9WEb9As/8jbUmgXP0v
         MQXsm39CmMM67lSS+7LCn0H0eKJLGhzMPWXohQnnUroMTSP1laefoeGuoq8ldn2ptN1V
         yOBZ8AX7yWoqnAExM6LsBNeUQoEITe6EwBoxJqgqVG+g+EPp9UxUprLKCojt2+miwsTI
         YCeDSXHFZ64C0gmjBzmAhruNaOqiaGr/fPzkfF7RPyAYvDCSehf1x8SK4XvTRQvy4Dge
         WHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701429046; x=1702033846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edpCM+r4M4/R7CxGMXVYffuZgPSvVTUvgVhnl4+XzgQ=;
        b=EBEU9Sdx81Tmjh8EUTqkS/n+QoRYT3KVYOsMkLI2Qn9j1J1A/3/Ewnxm/2mAjLQO8w
         cT7ct4RydwOgKZnzBvry+upqSG9Lq9JZ3+NCp8TUMHkDa1+XWgZBOYUqA7CIBp5/t/qR
         LY4YMKHvvafvPvtFSsjQfTjc1U4b/X+mSa12Yq+xNaLsAr/NCXCFZHscAyeObI2Fz7To
         AGGYBtgCG4F6V4rT8M7f1vvo87ZDo6hRvhX+bn0n0DK4L5MYTVHj5ff+2tTYv9FTxIHB
         Pr5dT50IHrx1bS/iFmvIhUVGoX+PWYJZlJHBLlPm3xFj63RXjwSrFGGzcyq3gCCXuQTU
         blLw==
X-Gm-Message-State: AOJu0YzM756LMAUkZbx9dNhrAPQo0oZ7ZAVZYuHxzaKeTPh4nGuAnYJO
	auYYzhhdu+JD2b7G5DaLEaR52fUnCXGribHbsA==
X-Google-Smtp-Source: AGHT+IE9hpk7SsuRiq+lhQuZEppdkmL/H6bEvHrCH7Le0ftKkoFdTGYtEmATY9iOeyJwTiuL5WNNmQ==
X-Received: by 2002:a05:6870:e0c9:b0:1f5:b5ca:438d with SMTP id a9-20020a056870e0c900b001f5b5ca438dmr27377051oab.16.1701429046585;
        Fri, 01 Dec 2023 03:10:46 -0800 (PST)
Received: from thinkpad ([117.213.102.92])
        by smtp.gmail.com with ESMTPSA id s5-20020a0cb305000000b0066d12d1351fsm1385912qve.143.2023.12.01.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 03:10:46 -0800 (PST)
Date: Fri, 1 Dec 2023 16:40:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
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
Message-ID: <20231201111033.GL4009@thinkpad>
References: <20231127-refclk_always_on-v3-0-26d969fa8f1d@quicinc.com>
 <20231127-refclk_always_on-v3-1-26d969fa8f1d@quicinc.com>
 <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
 <24fae40a-453b-b14c-923f-88758a246aa7@quicinc.com>
 <20231201060716.GJ4009@thinkpad>
 <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>

On Fri, Dec 01, 2023 at 09:01:43AM +0100, Krzysztof Kozlowski wrote:
> On 01/12/2023 07:07, Manivannan Sadhasivam wrote:
> > On Tue, Nov 28, 2023 at 02:49:18PM +0530, Krishna Chaitanya Chundru wrote:
> >>
> >> On 11/28/2023 2:26 PM, Krzysztof Kozlowski wrote:
> >>> On 27/11/2023 13:13, Krishna chaitanya chundru wrote:
> >>>> Document qcom,refclk-always-on property which is needed in some platforms
> >>>> to supply refclk even in PCIe low power states.
> >>>>
> >>>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >>>> ---
> >>>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +++++++
> >>>>   1 file changed, 7 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> >>>> index 2c3d6553a7ba..c747c9f35795 100644
> >>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> >>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> >>>> @@ -93,6 +93,13 @@ properties:
> >>>>     "#phy-cells":
> >>>>       const: 0
> >>>> +  qcom,refclk-always-on:
> >>>> +    type: boolean
> >>>> +    description: In some platform where PCIe switch is connected, pcie switch due to some design
> >>> You received a comment to use proper wrapping: 80. Please implement it.
> >> I will update this.
> >>>> +      limitation fails to propage clkreq signal to the host and due to that host will not send
> >>>> +      refclk, which  results in linkdown in L1.2 or L1.1 exit initiated by EP.
> >>>> +      This property if set keeps refclk always on even in Low power states.
> >>> The property name suggests that's the state of hardware - refclk is
> >>> always on. Description suggests you want to instruct OS to do something.
> >>>
> >>> Again, third time (once from Bjorn, once from Dmitry), rephrase property
> >>> name and description to describe the hardware issue. I see description
> >>> improved, but not the property name. Again in the end of description you
> >>
> >> Both bjorn and Dmitry gave comments to change the description only, and not
> >> the property name,
> >>
> >> correct if I am wrong.
> >>
> >>> say what Linux should do. Bindings do not describe Linux OS.
> >>
> >> I will remove the last line in the next patch.
> >>
> > 
> > You should name the property as, "qcom,keep-refclk-always-on"
> 
> Keep the clock by who? By driver? Then not, property should describe
> physical phenomena or hardware issue being fixed here, not what driver
> should do.
> 

This property indeed fixes the hardware issue (though in board level) and I see
a plenty of properties similar to this one instructing the OS to keep some
resource ON to workaround hardware issues. So they are all wrong?

- Mani

> 
> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்

