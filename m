Return-Path: <linux-arm-msm+bounces-73478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC47B56FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C473A3FBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 05:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7B4275B05;
	Mon, 15 Sep 2025 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lle9oRFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5AE61FCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915521; cv=none; b=Orh8PZ+qY1JnLRQyBQmiqmDXM+ooAr+6PcvJ1bwKTfRtTeKUYQxl7oehkpjoi4bI08pF/nnJpgmRuML3GVXYaYAXnV/yZYl3vUDVFi9JUQ23O4lesl+jdtRwBvjXwruKB00NZzEsyXOt0GasU/1kr2wXmXQeLHIsJs/KF6YEvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915521; c=relaxed/simple;
	bh=+OmwbhBwAj/kZFxtuFt6jJjFEcNRsTbyTPdeHDh41MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs8+3wOjFbxcEk/mEgqJjqU/DS0Et9lYAF8KE3huhO3/+xB+N67pIxnjICK+Ic6jb6l0oYIFG1VKnejq0ThQeAaHWF2eekV4fVbPytnPxnCgL0Z+TMGZVn8y9BPrslh2wNdRT0GNqvxuRThL6fVIdDg6GrxiHRAl68kNa29cOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lle9oRFE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77616dce48cso1727881b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757915519; x=1758520319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qye2LPY5LHrCvbMXDQFOPvLnwVK53Fm0yxNdoRHSMt8=;
        b=lle9oRFECuwKFqG4Id231HsoRs4X1X5slP1wiAhVNIY2rTugoeNRXet0qx8fknYKQx
         913U0XSi30aoYpkCGGEUomK3ZQV8JSNKI7ka11vPdqIgGYkxXThU90JE3+uL6ObeJ4Ko
         lxgkZ4Eet/1nubh43lxp58n7xKoie7aGbelXICu/wQrjd8mkXeXFhfhFHfRUrLscxKnt
         P3Gm2RHuQRTbo4HP/Wt0FrNPAq4SXOZsJzjPFc0vUvmzsED6zRI8YAJxcDaAAdtttwu/
         gFgw3GuH2UR1Yfg1bWr10x5+1ngOuWxRos4kWNZsyMK1ZyM5+KbOWKRfOQCafpqyDdkU
         9TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757915519; x=1758520319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qye2LPY5LHrCvbMXDQFOPvLnwVK53Fm0yxNdoRHSMt8=;
        b=cFeV10gt2jkbg5sI3tqYDeMXIY3m7rslrpIFJsJaSlctcv1YdFr8fbhHiRyHMRk98H
         WyBTG1/9EtEZBaPxKqAdkmbEwysjYYnH4oFBwv3qOMDSwYfNfdDYHULrnp2CfKFpnz75
         noi69xkg44M8AdCnBSGvyIHsW17NF++WBcjxR5exPSF/44qTbmApt17RbAxP2UeJm9VT
         4YQnY8xs3SWZkf+8O+x7zdo6qya82qKtFmMzzImM7fNpK87jPf2ActxXl2eHpi2Ybi2i
         ZH80SIf/fA/Rh++HKCOA7lwJM2wxZQYftZT0hbqqH8BJFrUj4d3rDYxFs75nEYKSWak2
         vfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUvyrDSlmUFy+SBRIe88jk2sDfOMZwvzM43p0jYxWO5SW64D2zPQr+OSnSeF5Ln/hJII5d27+AOUa57RuGs@vger.kernel.org
X-Gm-Message-State: AOJu0YzLw4nuKA/10/uFBkg7IXC4ZId8DwI7cWS9ZCjF1Fg+oaMLqQX5
	EM7OpTaZkdt55foY/5iGkWr1AnCEEOX9s5akUF22NKEWhzy8wCEdhcCm
X-Gm-Gg: ASbGncsknFaeay4g+amqXLiRuMmuAMyU+Rn00mu0xJMIz7yJIa8pPAzGtOK8kPcrQWb
	Z3fkHMWIK25ZWyZBDgP8l+K85mlOxBKbjetxNG57lFJ+QjYXTfIGNyYc5Iqqv8u4vtTxlwa7jYB
	os2hP/uUGuSL7pgSHQDeObHTCjS94in7PYRwwFXb4g0sfpzuor/kiMlvM1QMFl7ucfyz/eoc1s9
	xsj0wFrmXAlqLdf8L1sBpK0GDSrUO1QhrpD3OH9+Aq57dxxTCk2rJ8sjuc254tHaGBgYXjaGUGI
	PlyIrBA2UmFzfBR89ZQeDFTB72+MHk5azQkKhIbEyaiw1X0DGu860GLMnVcaBjw0cgT9bVOIZh5
	n6ONYa8FzLt+VW+OKuM1yHBnq1CwIDUfRtn6934860eE=
X-Google-Smtp-Source: AGHT+IEKmSBecZ4BelqxEIPSzjz6N/VEwgCmMS99XLpTk+f8tgPrz4XwnNDEw4iVMCNnUKH2o2yCcQ==
X-Received: by 2002:a05:6a00:4b13:b0:777:800f:9652 with SMTP id d2e1a72fcca58-777801ee27cmr4565149b3a.12.1757915519043;
        Sun, 14 Sep 2025 22:51:59 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761853866bsm8595437b3a.95.2025.09.14.22.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 22:51:58 -0700 (PDT)
Message-ID: <433068b2-f899-4b28-8498-e9672b8c0b69@gmail.com>
Date: Mon, 15 Sep 2025 11:21:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615 talos
 evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <33ldjudketkyledzp473bwal4jmrigozjjwqtqlrmrkjmh5sze@ak4cusfossus>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <33ldjudketkyledzp473bwal4jmrigozjjwqtqlrmrkjmh5sze@ak4cusfossus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/25 19:20, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 06:22:54PM +0530, Sudarshan Shetty wrote:
>> This adds binding support for the QCS615-based talos evk SMARC platform.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 03a7d3c92ecd..a5dbe6af68ac 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -952,6 +952,12 @@ properties:
>>            - const: qcom,qcs615
>>            - const: qcom,sm6150
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs615-iq-615-evk
> 
> Should it follow the recent example and be named "qcom,talos-evk" ?
Yes, I’ll update the board compatible to "qcom,talos-evk" in v2.
Thanks for the suggestion.
> 
>> +          - const: qcom,qcs615
>> +          - const: qcom,sm6150
>> +
>>        - items:
>>            - enum:
>>                - qcom,sa8155p-adp
>> -- 
>> 2.34.1
>>
> 


