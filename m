Return-Path: <linux-arm-msm+bounces-56-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E48F47E3A12
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973C8280F9E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94231864A;
	Tue,  7 Nov 2023 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O37E3DG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FD28E06
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:41:18 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D1FB0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:41:17 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4079ed65582so41215195e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699353675; x=1699958475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sieNHgKFMufLfZS/x+ERBd5dxwAS53P7pOyGN5G0KI8=;
        b=O37E3DG6p+HOfARyN97Q/oCOUO/TbybKTCTVACtLgWRVMVkP6EO+tlmGfDPm1ZXQXi
         UclSU9CYexNc2lrUT4gZZnNvucq4odst3tbCUuwJe8kWzUw7z7ZvkjNHdfX/YebHtt4N
         C9/P1gwKRWrP5QITbVE4oyqBhZS1sYaHwrvPS4lHdgVEt4NH4onSoBz9aLeT/s65pp4I
         iLdxPa0ZSTxXLHNIZMpMiNA3lSEXUbSHwwS+b1e+XnfwRaZa6zHaBGgafa7nMY1CMz0Z
         TuSJSPNJJUyFtk9Dpguxjw7BUYujWAGT1Mw/tBimajzB8MJXIqONPIRso5JAdDTeAtQc
         Da0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699353675; x=1699958475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sieNHgKFMufLfZS/x+ERBd5dxwAS53P7pOyGN5G0KI8=;
        b=rH4V+NdKCBMcf/MlauyilikByYVx9ytkGC+fEGhACLg2XXN2UKOgnV8XZEoieTnEHK
         zxVZaX0vtoVbL+618U9zF7ZRBVLBhzHSuZvjj8UuaS2mL3I8grQlg6hJ7WxHvYCu1Uls
         +VzRhtImIkmzfuqyK5u1hcIixW3uiRM0GyKyVtC65FkzHzciLTM/Mt6cjR3MDNMSH4la
         EKrONXqcesi79sYeugkl6O/PryYt20mZlEMQC3RMU21AFmnsk3x7bmLeArkoCKk0h3tq
         TuBgn0dIOu6K9NmNyCcuVG94rPCVWLSvELXevm7o2Gxz3m95ciJpEnQL6SlsFswM3Mx+
         o3dA==
X-Gm-Message-State: AOJu0YxZde8x8uIQuB2viH/clsU3NtF9OXEq8b/J43LLEEDglYsvui4O
	1Z7wVuq6YWofUTopuUpcNHD2bQ==
X-Google-Smtp-Source: AGHT+IHo3GaRGX6QxrETyItSGPni1XwJu7CfTVMiNpshaJEkePhGrzcYQMqz8OP93kQcIVWIOX8Dpw==
X-Received: by 2002:a5d:5846:0:b0:32f:7e2f:4454 with SMTP id i6-20020a5d5846000000b0032f7e2f4454mr22645157wrf.46.1699353675455;
        Tue, 07 Nov 2023 02:41:15 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id o3-20020a056000010300b0032da4f70756sm2010923wrx.5.2023.11.07.02.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:41:14 -0800 (PST)
Message-ID: <f94ca738-476c-4664-a8f1-e3ef3ac8220a@linaro.org>
Date: Tue, 7 Nov 2023 10:41:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/8] usb: dwc3: core: Register vendor hooks for dwc3-qcom
Content-Language: en-US
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
 quic_jackp@quicinc.com, quic_wcheng@quicinc.com,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-3-quic_kriskura@quicinc.com>
 <e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org>
 <5ef66bdc-9645-4bbe-8182-baa7fe4c583a@quicinc.com>
 <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
 <cf553cd8-45f8-4a61-b016-69e7a80eee9f@linaro.org>
 <ea919050-22a8-4d28-ade2-fd16a99876cb@quicinc.com>
 <105d84b6-cbea-4758-9eba-1c104fa7a670@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <105d84b6-cbea-4758-9eba-1c104fa7a670@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/11/2023 08:33, Krishna Kurapati PSSNV wrote:
> 
> 
> On 11/4/2023 10:32 PM, Krishna Kurapati PSSNV wrote:
>>>
>>> Are you saying to you require/rely on both of these series being 
>>> applied first ?
>>>
>>> [1]: 
>>> https://lore.kernel.org/all/af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com/
>>> [2]: 
>>> https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
>>>
>>> Must be, nothing applies for me in this series.
>>
>> The first one is not a patch. It is just a discussion thread I started 
>> to get community's opinion before on disconnect interrupt handling. 
>> The current series is based on top of [2] made by Bjorn (as you 
>> already found out) and as I mentioned in cover letter of my series.
>>
> 
> Hi Bryan,
> 
>    Are you able to apply the series after including Bjorn's patches ? 
> Also can you confirm if the comments provided to your queries on [1] are 
> proper and if you have any other comments w.r.t probe deferral.
> 
> [1]: 
> https://lore.kernel.org/all/e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org/
> 
> Regards,
> Krishna,

I wonder could you give a base SHA to apply the various series on ?

Your referenced precursor doesn't apply to usb-next

deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ b4 shazam 
20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com
Grabbing thread from 
lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 27 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH 1/12] dt-bindings: usb: qcom,dwc3: Add qcom,sc8180x-dwc3
   [PATCH 2/12] usb: dwc3: qcom: Rename dwc3 platform_device reference
     + Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
   [PATCH 3/12] usb: dwc3: qcom: Merge resources from urs_usb device
   [PATCH 4/12] usb: dwc3: Expose core driver as library
   [PATCH 5/12] usb: dwc3: Override end of dwc3 memory resource
     + Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
   [PATCH 6/12] usb: dwc3: qcom: Add dwc3 core reference in driver state
   [PATCH 7/12] usb: dwc3: qcom: Instantiate dwc3 core directly
   [PATCH 8/12] usb: dwc3: qcom: Inline the qscratch constants
     + Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
   [PATCH 9/12] dt-bindings: usb: qcom,dwc3: Rename to "glue"
     + Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
   [PATCH 10/12] dt-bindings: usb: qcom,dwc3: Introduce flattened 
qcom,dwc3 binding
   [PATCH 11/12] usb: dwc3: qcom: Flatten the Qualcomm dwc3 binding and 
implementation
   [PATCH 12/12] arm64: dts: qcom: sc8180x: flatten usb_sec node
   ---
   ✗ No key: ed25519/quic_bjorande@quicinc.com
   ---
   NOTE: install dkimpy for DKIM signature verification
---
Total patches: 12
---
  Base: using specified base-commit 4d0515b235dec789578d135a5db586b25c5870cb
Applying: dt-bindings: usb: qcom,dwc3: Add qcom,sc8180x-dwc3
Patch failed at 0001 dt-bindings: usb: qcom,dwc3: Add qcom,sc8180x-dwc3
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: Documentation/devicetree/bindings/usb/qcom,dwc3.yaml:29
error: Documentation/devicetree/bindings/usb/qcom,dwc3.yaml: patch does 
not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git diff
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --skip
Applying: usb: dwc3: qcom: Rename dwc3 platform_device reference
error: patch failed: drivers/usb/dwc3/dwc3-qcom.c:67
error: drivers/usb/dwc3/dwc3-qcom.c: patch does not apply
Patch failed at 0002 usb: dwc3: qcom: Rename dwc3 platform_device reference
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --skip
Applying: usb: dwc3: qcom: Merge resources from urs_usb device
error: patch failed: drivers/usb/dwc3/dwc3-qcom.c:68
error: drivers/usb/dwc3/dwc3-qcom.c: patch does not apply
Patch failed at 0003 usb: dwc3: qcom: Merge resources from urs_usb device
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --skip
Applying: usb: dwc3: Expose core driver as library
error: patch failed: drivers/usb/dwc3/core.c:1876
error: drivers/usb/dwc3/core.c: patch does not apply
error: patch failed: drivers/usb/dwc3/core.h:1568
error: drivers/usb/dwc3/core.h: patch does not apply
Patch failed at 0004 usb: dwc3: Expose core driver as library
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --skip
Applying: usb: dwc3: Override end of dwc3 memory resource
error: patch failed: drivers/usb/dwc3/core.c:1908
error: drivers/usb/dwc3/core.c: patch does not apply
Patch failed at 0005 usb: dwc3: Override end of dwc3 memory resource
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --skip
Applying: usb: dwc3: qcom: Add dwc3 core reference in driver state
error: patch failed: drivers/usb/dwc3/dwc3-qcom.c:67
error: drivers/usb/dwc3/dwc3-qcom.c: patch does not apply
Patch failed at 0006 usb: dwc3: qcom: Add dwc3 core reference in driver 
state
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ git am --abort

---
bod

