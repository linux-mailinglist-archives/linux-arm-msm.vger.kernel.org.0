Return-Path: <linux-arm-msm+bounces-60158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303AACC97D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77133A4A90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFC923A99E;
	Tue,  3 Jun 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cf0rRyWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C715624B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961994; cv=none; b=nAm1AvXEO4WDSeXwT1cxIqigULApLjPklzLsvbrWPLdCRtfM1bmBycsPKnWXKDyuLDfxtVoBoDt2zH4jKYRA9E5a7/CKQorBQFnljuHpR6LBdPCHICX4Erp4vx7jnSlgFYcF0ZVWOFzdmEmp1M5ay30WczWiDk5WWpBbsMcH/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961994; c=relaxed/simple;
	bh=SRrmvMmAfQ84Yeq4WzNWtCU8EkhCciiw6kJXyYDeUl4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TJqI8qA+nOa4ZvrMWrpLtJFPOq5Eohchdo2S0yRiYHzx9+jnkbXjRK7Vbnwg7hmSl71dvv3UiAd51LWviHPLCAGjS4RM6w9G2VpsZpEGGS52q3oEMLmkYo6xbwrfjSOZIBFEOTRR6i6NRFvXCt6PJYXzkfryCcBVSC1sWwfgEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cf0rRyWh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a51481a598so507473f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961991; x=1749566791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrRmbG4/N2m6vRayn9TmhHXB4wgb2uEtyKQ9Mx3XTkw=;
        b=cf0rRyWh7K7Pl+yc5MBiK8yhGgdhzximhrDHXfLgWxEOVKaqS7b1+e38sNqLbj5j24
         8XI86AJ5k+lj4YU9ry1h4X8/+/YWQWt/mTka2sQnSrlbfiv5cxH4NiexRbPl44s3/Wjk
         eiVSWq08ZHVTIYs/nzFS5VYcX/ob+1vW172H4yrAlW0eTyDxosar8UEY+4xuBm99LeXO
         TBMc9+4iJAvJLoNHOe7UuzVmEPJI7KfFfMCx2TeZxaXtKv/oSJdMqCfbtfSdaYRJrLJZ
         klQdSIaNSK8vSJiGHhurwqC3jFiIhcSsM3BJSzVEsFZwNwfCP1VmrvdHf5nY39bk5oxh
         r5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961991; x=1749566791;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrRmbG4/N2m6vRayn9TmhHXB4wgb2uEtyKQ9Mx3XTkw=;
        b=FIcMe099kKbWq36P7wDgOtyHDf8u59cuOGlB0VXKG5/49QW87AiWtbXcQZhTFEFFS1
         sfHSEXeLrnGFRfbt6MIc5RVLoidhthfATC5w9m7nK7qt9YM56qVELNNKEl3s1VNy1bck
         g5aJCh9N9uRXfr754GUa34CfEfzNc9i5GXVQkB+QnWcCEkk16w+bVgDq1ajMr2Egayuc
         q/jkL4GmChEfJyN7Vycq0IulCyVfVjVJgUJqjgtVrWhY70+Fd1yE7xxYSnP/oLg9GpMh
         3utB6e5CpbStOIH0A7hDlXjjhmBHoc/OUi0ded48I6ojrZY/vuEaFksnfFStc+kPe0kV
         Na1A==
X-Forwarded-Encrypted: i=1; AJvYcCXnaBVA0tgezpTNCuXY9Os/EfOGhFQ05oeh6aiPGnqKL2oB7jWjtIen8nUCLkqDE1gLvL1zP0mf3JN4KlNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCVzB3OqjSlxioJ3TrHvDJm+yqpLaoUWsJRrMpsc5wawnuD/Xn
	GpvJevhj1SRX5osHWOXopFrQeuk9dhBpTNZddYYnktv0fXVjkh7+B4gY0+0tLz2Vb8M=
X-Gm-Gg: ASbGncuyjA2UKDieUEuhCKSAFv0J0zV5V0WFcbzwxMWZAtB2oJY4s+WCovtFY6mtKkp
	y+tJZgVJNQgcxsP/ZQ9MPI1fIZ+O/2/c9Vj5fylA8NONlyRXJiIcbAMryjQJ30c/f/UEpi7W1bh
	8dbWa1aR2oOVQdQxFUO24XLj6EP5bcWx3rQL8YPs+31MncfyLR29WASVtw6iMaQMC93sbGeiCBt
	jurNMo/Z7UpQh5eFTo2C+q0bxspW8SZbus8gth8Cr7Qmi+8E9Tt40N+9TnaY2RpDW7Sui/9Y7/7
	s0xfgbhRzyedJkImoXfSa341ubkUU7QKVkj1di97DSKVO9N2rv4qseSlfAXtGv4zCsK2MQlXCs7
	X1Hu2fD7hg5nXWEfr
X-Google-Smtp-Source: AGHT+IEwDI4aK9ArKoZhrl7cMJOHsOARjxSQuD4nPo7SSj+7IEGKJEEdNhEZIdVtyzFuUtgXO7lmtg==
X-Received: by 2002:a5d:588d:0:b0:3a4:eecf:99af with SMTP id ffacd0b85a97d-3a4fe398ff8mr10830056f8f.44.1748961991228;
        Tue, 03 Jun 2025 07:46:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm18722647f8f.16.2025.06.03.07.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:46:30 -0700 (PDT)
Message-ID: <6b7ca51a-241a-49fc-8aac-da5af96b5e10@linaro.org>
Date: Tue, 3 Jun 2025 15:46:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] serial: qcom-geni: move resource control logic to
 separate functions
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <vTOsjvsB7oSpu2Oe8i1ufoz5C2Hy3EtfDnfBsLag2p-s63J0BLdqbLn44Hds17WR12JGfo7sd52k7uHaXlTTeQ==@protonmail.internalid>
 <20250506180232.1299-6-quic_ptalari@quicinc.com>
 <f912588b-fb54-4257-a4d8-db58e93b8378@linaro.org>
 <y41ikVJ5uSSaGZHmqsvTm9akz3EUUT7X6dTPrfSuIYqGmMdlEfPRWqPA630jmsEzwC-6JSgYRPobg4e933PgxA==@protonmail.internalid>
 <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
Content-Language: en-US
In-Reply-To: <afe41159-00e4-45d1-857f-0a68f6fc6c8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2025 15:29, Bryan O'Donoghue wrote:
> On 03/06/2025 15:28, Bryan O'Donoghue wrote:
>>> 2.17.1
>>>
>>>
>> Assuming you address my points.
> 
> [sic]
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

Oh please fix this in the next version

checkpatch.pl --strict mypatch.patch

CHECK: Alignment should match open parenthesis
#92: FILE: drivers/tty/serial/qcom_geni_serial.c:1675:
+	else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON)

total: 0 errors, 0 warnings, 1 checks, 71 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0005-serial-qcom-geni-move-resource-control-logic-to-sepa.patch has 
style problems, please review.

---
bod

