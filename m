Return-Path: <linux-arm-msm+bounces-80450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8145C35BCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 13:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16A804F29FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 12:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2907E30AAC2;
	Wed,  5 Nov 2025 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAFMjIBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA1315790
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347469; cv=none; b=icerdOkm9rGI/Y6ddbQkwAt5ZwwPD9eBAkj2P+c24+rPsrqD0tuwX9UQA11WFpUgbtkJCc7GqL3W6WJ0S0MjRNCVnYEETj4+H3+4N/ey71bO4+icGzr/fCzz6JbTrx/3ltg3aXQLk2U5OXxl5NJKFWswUQ+ZvlePSRYteMzp6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347469; c=relaxed/simple;
	bh=0LJFAwG3uKB8EtkB8F3PX6TJWOV2c6OGA4oCsggctMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiyKQf6pfFeqzmRWT3toBrv8tOzPfIa6Vj1/XZxAahn5Y49sCwyL1VSunolb/SH4VAkty5W9Pyuk+N8uyJHnSJD4S1xxAi/R6bMzRhZFCHKyd9YXOxd37eWpJWcejrhs6TD+SJu8pUDgtt3wMR/plvpmucGTK6R352E2SrpA7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAFMjIBt; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340cccf6956so2849466a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 04:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762347467; x=1762952267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr6PsIqaDjxaH/cpBwS9aE8aleV9ylkOxYVPRloXRC0=;
        b=PAFMjIBtG3CZOsJIak9CwLGWs4lLiDb+JQ/CRMXK1dXDmDs9mBGjroil/+yTkmwJkB
         w5H2QOGjmB45r2lfZiDatpiXrMGNV6EDl3oivuszkEGndUqmoWfvXFxjoILlRW0zYQwA
         uSoF6EpAAjorotuVKZU6VYVH36SybW8Af7yb4A9gYJFdzf0vVGC9k6fLx9wmUPJq87RF
         11I/oGUTiZBceIv+cptDmwfIeq9/4LlA0rsq0Xcd9WhnTAAY5B7eqtTI66wYgjCz/ZPB
         WDHMpKziTG9rSboiOmFEtcEjQApO5IOkLJjmebNmYPi0aKlUVPVw7dlLOwFx8Wlau2ap
         hn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347467; x=1762952267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vr6PsIqaDjxaH/cpBwS9aE8aleV9ylkOxYVPRloXRC0=;
        b=uVH7q54b4Q9HG1q+HSHIP5YfRr1XbDzfWf4iBa1XGlcW99sN7s6EimECVopul0Subk
         KONB1me5MkwiJ2PMN6D1lU62sXOG87GBrT7XrJyOufYnMl+xwoWommt3nG6ZQQv88/4d
         /R9g2npEhsUdcAu+z2T9VKANCbZ2Ydg3KtrtYoqt8ZqzIXrlpGZWEDfdUgAq2FE4GjMD
         mgEDAZSleXItnl7GN7UkmgBsGuIqnQC/kj4pdej5eInb/ymwdLPgZ0GTvDh7sMnGjA8i
         ci7LHFSyI+JO50B0vZhyVkpFZY6LbBe5T7ughD/z/2EQoPX0krT27s9+BzYNxmMLs+OQ
         B+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVquZAxIgachtoPE1LbPoLojS1Kj3KmcrkfVq9sTURQ6ET8kFo8MT2boyA/Ccj5k+n69sdeIeDuIfhPr8AB@vger.kernel.org
X-Gm-Message-State: AOJu0YypiYhVYObU9+EPLz8PN+OWyGt3mZsxP/lOgWY/WZG1CGH68mQp
	hV62XjopONCQwmbw5T4O8Y6eCV4HEruZUN/WAg4cGZ8v8vWVS6162sfT
X-Gm-Gg: ASbGncv/ZR5PM6rM7fTusOMY2OJ/jAtUL+F8fqvZ27BOi7Vbx9x6ZmOP7YmxQQf+MwV
	VOvr6UoGMOB89EHxShYoVRXggOfH6zxciFa1CqBxcHrA7L6/8FG3zt8gvAc44afYXRzD3SIDNKg
	lXM2RpzbnRBtCfh5VXFeRm1pBr7MG4jpeeXQKY8q5+PpweUI7mQ1bQNp2eNAXY4t+W2x12MGT0F
	V2MbE58YocfUVc3oe28qT0LDkHKCuhLT4N7bXcL8isn9QM+M0jRX6WLbN6EJuYKMEAm5yZnfePa
	OAYEAwzlfbAJ8H0dOeqqhq2H/ZxE0ZEhKHSuYZ1JwyLqJLTXoEIqvt3Jxw8GjLvgaZ2tbD32yR2
	sdvCtQgMS4u4r60D/E8S1JU08rmJ+rsOuxp4/4f4IT/MtUbUyJoSi3pb+qbkNVnUoGD99DzM/yD
	fjbIOOHYLyOZSYzXBnSvoGpDI=
X-Google-Smtp-Source: AGHT+IF/tAWCYp/lgefsgtHlbqrg/hhGf8vpbe20agZqQuaywYqcLauuHDzVmD/ISXzLYKlDef5s+A==
X-Received: by 2002:a17:90b:590b:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-341a6c2c740mr3688090a91.4.1762347466974;
        Wed, 05 Nov 2025 04:57:46 -0800 (PST)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a689ad7fsm2950374a91.2.2025.11.05.04.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 04:57:46 -0800 (PST)
Message-ID: <58afe57b-68e8-4de3-841a-df3dbf04ee64@gmail.com>
Date: Wed, 5 Nov 2025 18:27:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/11/25 06:35, Dmitry Baryshkov wrote:
> On Tue, Nov 04, 2025 at 06:21:24PM +0530, Sudarshan Shetty wrote:
>> Hi all,
>>
>> This patch series adds device tree binding and board support for the
>> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
>> QCS615 SoC.
>>
>> The first patch introduces the DT binding entry for the Talos EVK
>> SMARC board, and the second patch adds the corresponding DTS
>> files for the platform.
>>
>> Note:
>> USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
>> the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
>> is not connected the switching cannot be handled from SW.
>> Hence from SW Host-only mode is supported on Linux boot up.
>>
>> Changes in v5:
>>  - Updated commit message. (suggested by Krzysztof)
>>  - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
>>    Krzysztof)
>>  - Introduced talos-evk-cb.dtsi, which has common carrier board
>>    interfaces.
> 
> Common between what?

Introduced talos-evk-cb.dtsi to define carrier board–specific interfaces
common to both HDMI and LVDS top-level DTS variants.
> 
>>  - No functional change in bindings file.
>>
>> Changes in v4:
>>  - Updated product name to full form per Krzysztof’s feedback in
>>    dt-binding comment.
>>  - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
>>  - Add DP connector node and MDSS DisplayPort controller.
>>  - Added USB note in the cover letter for maintainers' awareness.
>>
>> Changes in v3:
>>  - Addressed comments from Dmitry regarding USB1 `dr_mode` and 
>>    added a DTS comment.
>>  - No functional change in bindings file.
>>
>> Changes in v2:
>>  - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
>>  - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
>>  - Fixed subject and commit message to use imperative mood.
>>
>> Thanks,
>> Sudarshan
>>
>> Sudarshan Shetty (2):
>>   dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
>>   arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board
>>
>>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi    |  56 +++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 442 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts        |  87 ++++
>>  5 files changed, 587 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> -- 
>> 2.34.1
>>
> 


