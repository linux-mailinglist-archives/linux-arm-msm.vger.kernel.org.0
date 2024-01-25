Return-Path: <linux-arm-msm+bounces-8216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC0183BDF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51CA2B29480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F9D1CA82;
	Thu, 25 Jan 2024 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNTpD/NK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F11C6B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706175920; cv=none; b=RPIrLJc6d6Pt2CRldxifiCtnR2GpFX3XzgiOY9I66kaCsPW77AIcl74xLuv3/If/i4mu5mOfHh8IJdofu8ihHDuHlbKSoFoyXduPtGPUZvsDSON0ZKxNnpJpoXZny6gRFIMNKa5rae4wdpSuHJn/qjVlV6Lq+UYd/N+8dy1cV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706175920; c=relaxed/simple;
	bh=cWPOC7NSGBppl4zfjZkFzAGHP/WbY62dZdXQCjP/xdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XSB2PwGLbfiiYXL6YUk9XF8mk96JKDCLkUNAXx3gOTqF3CDtTm8SH2301XN57wlZrn1rttzECk5rhwqdsqyyrRkZDu9b1bFOv463RknNF3LEnHQcVLTAyzXdSvZ8pt+xUUWa0BIaJR7WbMi26duwfr9SiDAXET9fGON405Bqvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNTpD/NK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50edf4f478eso8546779e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706175916; x=1706780716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIOuj7bR7enUuseulkrPOknNgIfgoOuomvKOHhgQg6I=;
        b=HNTpD/NKQ09l85DOQ3NB4UWYZ8zjnLYQVjeWPA6N3CncDrj/WL428qjpXGnHwjFp1v
         /DpYIiTVrqBrgVISGkp8zwtLAS56Kflqcmajdw9Lk0PHKqRbWakQA2OLrRFNkVMHw9yr
         6tJceIljequMnKWJRofvVIqivBPyQkGmqen7K0iXSbwX/4GytlzKfNn/Og089jcWPg6n
         nwRKJ7zx4MordGn1syhelPPdUVccgOF5qA8sbC4x8NH1sTaSrnMRrdZmyLoULjuDoDIq
         9UiR9aSI2SqhJY7Z0iwwJH+vg8Az/fpKPg/ECGy4oTorkljz2TDduuRdbz63bGtiSaci
         LCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175916; x=1706780716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIOuj7bR7enUuseulkrPOknNgIfgoOuomvKOHhgQg6I=;
        b=QQI8leHkbWeUPjZX4VqWQ0mcXIhGECK2iYQW0ID8Dixd9KkRf++B2cOSqa+3NV4Y7W
         1nQVdivHDMQzVsYICOv257A4gbnXIrqm1TMl8lZKX5li/i1YXSkACT/OZI5f50E+cw7H
         3MwYgy9pVSYsbS5fm1XGIu1BwmMEtG40CY7reKMptxC2GbH6iGkPgQP71nWA9LGwvkDr
         5x3iXGvoYvU5ZoF9JCkWh2lO4LFtHhX8aKppgaSdyT+huDvxuWI04CL8K8NUuEiQng3E
         GUBp3LPRJxbHHu3A/USyt51VlDf/bqXVhhbUinmtqWZCFHRlrhvK/Rfj8/h3RQiiq/eD
         7fKA==
X-Gm-Message-State: AOJu0YwzlwbIrkn7a3q3yx8qMjJHVil1rFlgB+bO1dzdyl+xL0xcNYuD
	UiffliHxfV3NGm9QS3XsOJUllD+KxkFfg4IOUWUt6Vaul8MCr3qlee4Fr3gUZgc=
X-Google-Smtp-Source: AGHT+IFG+yauXBwOK/woS6AE2eb7O0Y/xtBvYSRv33al+j3vbOLwgE19T/bjbbonr4enfPCkmco7kg==
X-Received: by 2002:a2e:a608:0:b0:2cd:fdc1:8e52 with SMTP id v8-20020a2ea608000000b002cdfdc18e52mr415985ljp.71.1706175915573;
        Thu, 25 Jan 2024 01:45:15 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p3-20020a2e8043000000b002cd91d0ceefsm232472ljg.33.2024.01.25.01.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:45:15 -0800 (PST)
Message-ID: <b4a9ad3e-392f-42ff-8fed-dd86b013176b@linaro.org>
Date: Thu, 25 Jan 2024 10:45:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: qcm6490-idp: Add support for
 PM7250B PMIC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Umang Chheda <quic_uchheda@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamal Wadhwa <quic_kamalw@quicinc.com>
References: <20240123102817.2414155-1-quic_uchheda@quicinc.com>
 <CAA8EJppwboaEbKFFACr3LO0OHg4iOJPapKRqoH2EGEYcjV6HfA@mail.gmail.com>
 <735575f5-ee46-4c91-b0bd-e9c6fb97361c@quicinc.com>
 <CAA8EJpr6XrhNp2gdbqmCow7ShXLNXEwGZ-a_Yxr08bcxtORg6A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpr6XrhNp2gdbqmCow7ShXLNXEwGZ-a_Yxr08bcxtORg6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/25/24 09:26, Dmitry Baryshkov wrote:
> On Thu, 25 Jan 2024 at 10:10, Umang Chheda <quic_uchheda@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 1/23/2024 5:48 PM, Dmitry Baryshkov wrote:
>>> On Tue, 23 Jan 2024 at 12:28, Umang Chheda <quic_uchheda@quicinc.com> wrote:
>>>>
>>>> qcm6490-idp platform supports PM7250B PMIC as well.
>>>> Add support for the same.
>>>
>>> The platform can not "support" PMIC. Please fix the commit message.
>> Shall I change the commit message as below in the next patch ?
>> "Add PM7250B PMIC support for qcm6490-idp"
> 
> This is also not accurate. You are not adding support for the PMIC.
> You are describing PMICs present on the board.

Umang, consider one of:

arm64: dts: qcom: qcm6490-idp:

"Include PM7250B"

"Enable PM7250B"

"Configure PM7250B"

Konrad

