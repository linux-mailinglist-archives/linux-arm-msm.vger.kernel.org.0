Return-Path: <linux-arm-msm+bounces-19236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA88BCB5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 11:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B111F236F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DBD482E9;
	Mon,  6 May 2024 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bo4aPX6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6655CDD0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714989459; cv=none; b=DWYJ3sjtgUfZ4qqSTnghIT5K9Rga/7iVL6v0lB9YIp3q7xKWAdV/Hz6W9MCsQ8SeH/5DW0QmYOts2bwPcWh6aq+jUpGJlZ+Rin36zYsJnFhN+ak4itNDdN6Pkbdk36ZDgq2kNN0eJmWSueYzcUMzirVaOckIDYHvFYqrTMNO2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714989459; c=relaxed/simple;
	bh=R+RvoC9QKR2iTbew+813V7dr7HnWEw+z6LeJ/nOM7M0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fWAaGkQdngtJG4V2Nv9/qAON8nVZznWZTu2dEoIe5u+BYTJlxGbw9H0s4P4I/HIXAhi9tXyEL/u9kQolpHDkAaEruoYV9xT82aqcbQj97p4d3SZOIKHfTXDlMSRb3w4LGe6YZJdzjB7GMpdcgipQxSmv/AAXFenwRkAi+BNaIgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bo4aPX6V; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41c1b75ca31so12169695e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 02:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714989454; x=1715594254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QtIN9A7R8Fp/n1bWsijegojPl8VTdhoejF5Mq9JFXXU=;
        b=bo4aPX6V62sn5xSnqs1C70FkRtLMZKqoyOug+YJXaZhb98jxkLKxNa2Lq7e9IIj2yZ
         7O1GN1Qqb5TvZfC7wEfDhG8corNXAQgKiKGpgI7a3m+1Pdol5fa1kZ9dVrZmOsV39kki
         +Irjj2mzyRvUPbK/V51qMWu2cht1MyJkmZL5Vc+FaiP3hKPK7dJkAhA7jEIlyzd4hNjJ
         APAoPB73uJAo2SYDZVbWGek108GVUR/RxL2ZBTIX0bkhFC9is1VCjN4GaOwoI4KcLdEW
         BmhJNVRDeKCZEhDH5Yfi+pOnWwikYEAVfHVmD3ydJ6tKoJ5uc4L8Mxir3mKa2WmBYnP+
         MtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989454; x=1715594254;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtIN9A7R8Fp/n1bWsijegojPl8VTdhoejF5Mq9JFXXU=;
        b=i3Jq3gLgO2z1f+xEXBrtx3bk6cwUtXYgh5klS2KuZiNmYoB62LNhQgbcIUsx/1f6J7
         6F+iv9gWX0afRbx2bsfHltWChmODrnJXc9uEi9Jj5gDh8+QxY05h4H2dxZWed7I8MJO1
         gHZbBhFUduao7+J0pflW+0MgK+oe1vf6FtQtDL7EHZXLRCBsFSZMR83WrJ7MedWhpWT2
         B4anr3jcaRhIfir39sOVX3QUDLrAON1Uk8+VhJzQ0TIWxyUMdiyI15zlRLwTE/KtWFP4
         SnY+bNeV/ZUp2lWkFcJ/pQt8jYumAR1CEvw2QlXy0mwudx48u2wYvkcDCuaVfIVXFrJH
         M7GQ==
X-Gm-Message-State: AOJu0YxNofQpeFgttMtKnVqAS9OHPWJ6Z6KoIjKSGZPSW0PYV8nv/aI3
	iwgx7xREEWqb4KWUJ3prMIL4k742Zom8gyKqCiibqy2lB3i3okxd++iLhTLVYMo=
X-Google-Smtp-Source: AGHT+IHLlCNSFgymsuasdkFKTfzL0stoaZgUrmBrNf/nr0c7/f0IkrV2OVcUD3qL3bjVmEkNASw+UA==
X-Received: by 2002:a05:600c:5122:b0:41a:7fc8:a650 with SMTP id o34-20020a05600c512200b0041a7fc8a650mr8184338wms.0.1714989453671;
        Mon, 06 May 2024 02:57:33 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c450900b0041bd920d41csm15411549wmo.1.2024.05.06.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 02:57:33 -0700 (PDT)
Message-ID: <f5b9c8d5-d8ed-4dd1-9cd6-fb016d84cbd5@freebox.fr>
Date: Mon, 6 May 2024 11:57:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Language: en-US
In-Reply-To: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 17:28, Marc Gonzalez wrote:

> Changes in v2
> - Add Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> for patches 2 & 3
> - Replace qcom,msm8998-venus.yaml (copy of qcom,msm8996-venus.yaml) with item in qcom,msm8996-venus.yaml
> 
> Marc Gonzalez (3):
>   dt-bindings: media: add qcom,msm8998-venus
>   arm64: dts: qcom: msm8998: add venus node
>   media: venus: add MSM8998 support
> 
>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.c                        | 42 +++++++++++++++++++++++++
>  3 files changed, 93 insertions(+), 1 deletion(-)

Not sure what's holding up this series?
Can it be merged before the 6.10 merge window opens?
(Whose tree is it supposed to go through?)

Been working on this feature since Feb 19 with
[RFC WIP PATCH] venus: add qcom,no-low-power property
(First try turned out to be incorrect)

Regards


