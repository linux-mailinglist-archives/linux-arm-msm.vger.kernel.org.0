Return-Path: <linux-arm-msm+bounces-7997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63483958E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9518A2930FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EDD81AC3;
	Tue, 23 Jan 2024 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="Y1qzR435"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9953281AB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028745; cv=none; b=MYSzPCLbQUBHbw2YVrn35bACQtMUTmsFkr87aEcn4yTRoQd6hEFemnpjstT/kQpRJW4qDhi60FBcaXVCzGtoj2PHaH7z6HSy1zpRyNaRECCSxYwl05vxPbBCB0oIWJSXI6yztJkTILLy8Dpp03AC6Zzl8vjzb3x/lYUgzfvjaLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028745; c=relaxed/simple;
	bh=FqxuIhOKwqFFkvdg6FWTdDc61t6BPsqD82lPrYLR5iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAMtj0v1hK64AAi3ZUKb90QRVLJMnHBDJeaNKo0Q68iGTLDJ0C/NaKZVf11pooI++EZIgqN6m2vrf3XAdHTdy4Q6MqXY1lcPJLflgDhrVId8RqCdcX3bKdlr5qljmURaavBTAwUWSLIMuOozN5cFGZc9y0Lmfk7SKIeaiBrBUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=Y1qzR435; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e766937ddso5354902e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706028740; x=1706633540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXm+8B2oUV6NHB3wV69TO5cqSgcr9Tcvgdp6j8iimmU=;
        b=Y1qzR4359Eotry6fI+O0r3gbmmP+2AJmM4h2QMFt/spL+8ESbhDRl9uI4UZVH+qfQe
         3nTXfEBYZy0XKBiMhnEpERKpCGO27GDF2wceo/9RE8FHA20FQBZGVKy1dTJJejeLC/gM
         IN01G135vUgcqE+QK7z2KDfjBAxu7jbFubl4WtpsbDPEG/6WjuYfxnVytGxotJp+zDi6
         8P7eXNVcyhgwDDOktbP9tyWak6Dn3D+Fg1bHbyrn2BmcyLEZSkqPLZJmoHFSG3tKr8h/
         bnNL+0GsQC66gqmRQ0elt0jf2p8orllYn4qRC015xUgfwZXi1AMpZpuEWTA7vnE3774i
         /OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028740; x=1706633540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXm+8B2oUV6NHB3wV69TO5cqSgcr9Tcvgdp6j8iimmU=;
        b=hAiRfjUKobr/aAG2X0YSusYYRQnTPLvSshy6As/JpiKrirYR0PCY9gY0QTmMsr/NTQ
         LxcC6YdlVbDoO37oR4UL0GXNI1dM+wXOhcSYOE8PIdvOwB9dcZlLVA3I/flj0zKslo86
         f/d+SlhnJAusF6W+armS5LQ1YbjNHo5+HT4IWOCVn/F27KXP9ArJD7xh6/cKYJJ5Gq7Z
         ZoXSojbhLzUNo0bhwwHFWV4nfplE2h/gAAeb45trHVXNeOBnnE6H3bvB1cxTpJDsFXM9
         ZHbFmReK/dBnYuE8Q37TUigDKLIkJu/ooxhSpQa8M4ZeCvBZ4cPaX6QuXCgN2kjZcQbv
         760Q==
X-Gm-Message-State: AOJu0YysHSER3vziXc+LjbNj6iElz1+K9FaQbsnJHsAUurK3HGbbMpvt
	UUR7cdHiZp9Y9wGP2GJEYb9F9DcoMgT1urb2/WA/nGTy+UMlYvVxRv/tcUPpv58=
X-Google-Smtp-Source: AGHT+IEChfJWs7cJSnwDKWXR/KKorWCddOvN+gTAgT9MMdF8s9TVHEO/yl02oBF4vRBhKurbwB9fIg==
X-Received: by 2002:a05:6512:3050:b0:50e:30a8:4c8e with SMTP id b16-20020a056512305000b0050e30a84c8emr3204334lfb.43.1706028740692;
        Tue, 23 Jan 2024 08:52:20 -0800 (PST)
Received: from [192.168.2.155] (78-62-132-154.static.zebra.lt. [78.62.132.154])
        by smtp.gmail.com with ESMTPSA id g21-20020a19e055000000b0050e94329e7csm2407169lfj.269.2024.01.23.08.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 08:52:20 -0800 (PST)
Message-ID: <57b3be8b-0953-4686-b370-6d395b8124ff@8devices.com>
Date: Tue, 23 Jan 2024 18:52:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom-qmp-usb: fix register offsets for
 ipq8074/ipq6018
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1706026160-17520-1-git-send-email-mantas@8devices.com>
 <1706026160-17520-2-git-send-email-mantas@8devices.com>
 <CAA8EJpqRvLE3pjkALv_hP9UJjFmEhni_vU5RDYovbpmjv-Sy-A@mail.gmail.com>
From: Mantas <mantas@8devices.com>
In-Reply-To: <CAA8EJpqRvLE3pjkALv_hP9UJjFmEhni_vU5RDYovbpmjv-Sy-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-01-23 18:42, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 18:09, Mantas Pucka <mantas@8devices.com> wrote:
>> Commit 2be22aae6b18 ("phy: qcom-qmp-usb: populate offsets configuration")
>> introduced register offsets to the driver but for ipq8074/ipq6018 they do
>> not match what was in the old style device tree. Example from old
>> ipq6018.dtsi:
>>
>> <0x00078200 0x130>,     /* Tx */
>> <0x00078400 0x200>,     /* Rx */
>> <0x00078800 0x1f8>,     /* PCS */
>> <0x00078600 0x044>;     /* PCS misc */
>>
>> which would translate to:
>> {.., .pcs = 0x800, .pcs_misc = 0x600, .tx = 0x200, .rx = 0x400 }
>>
>> but was translated to:
>> {.., .pcs = 0x600, .tx = 0x200, .rx = 0x400 }
> Even worse, it was translated to { ... .pcs = 0xc00, .pcs_misc = 0xa00 ... }
I was referring to qmp_usb_offsets_v3 here as ipq8074/ipq6018 did use
them, not qmp_usb_offsets_v3_qcm2290.
>
> With this fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>> So split usb_offsets and fix USB initialization for IPQ8074 and IPQ6018.
>> Tested only on IPQ6018
>>
>> Fixes: 2be22aae6b18 ("phy: qcom-qmp-usb: populate offsets configuration")
>> Signed-off-by: Mantas Pucka <mantas@8devices.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>

