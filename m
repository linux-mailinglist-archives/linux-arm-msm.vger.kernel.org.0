Return-Path: <linux-arm-msm+bounces-88429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E71ADD10683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B233C30022F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5DAAD24;
	Mon, 12 Jan 2026 03:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0kj32PN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VoR5HvAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6E1B6D1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768186977; cv=none; b=AXdJvKQpo2S03Kv8hgIZOUHXabIw9Y0+U7VwczZeLSFNGdt2UuvZbF0HzwHoZf2ZKfb2sjsW8WgWyR7/oGmG8k3NUNCUUU7tlpSbZkWC6kG6s/RUjdrB1gZClvubWl18CeMmW6PWMVxLBhNBzaHGcOaP9ra+VRDsrsrj9JxK3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768186977; c=relaxed/simple;
	bh=0EtsCRWb+9VYkoC8uRs4vmBvwK5Pjw7/1v/ULUGwghM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXkEV+A0Flz2aHFE9DDA5Tbsupj4IeiGr+WN5LKr4UMo/5eqCcSWX+oiSCmXIcCp+tEBLfulRzmP8npNQqp314ZhwbLn+YvjYvOqVG3hsrQzV0PxLGGtWjfmFRnUrulx8HxZeRBvZBjZdAP2DYGVpIgNLvU1EADyAlDcjJcHDX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0kj32PN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoR5HvAt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNpjMk3804095
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ov3DcN0hY94lyBqDePsnXi3y/DTfjzLtdxTbWy0C1hw=; b=V0kj32PNi8aJ//KA
	eNTvxB2rL1PM0KiNgz11EJaBhDKEYw7iNSED3bSkhq8dhvXYMwVYBo+EO+rmbPkO
	S+zX1UBosCenFwHvv7C0h0yK2axvwpYY4Uds2NsvmSf/NZwM9fgd66K+p0iPvd9/
	OkbcNQGgByBav/wRFt+LAUBroUKQHGdNKAnCWo6fu4BrDebpxDPNrzrj7i4odlHX
	J2+g6FMdHaXQGr3SNK4CatptkoMjPXi7/dkOqlQsk4MiMHQDJx4dN1PBKz3S8f4q
	lx/sgVt4hOuLnkO+r4/qJqRsi9t85CGBKomcBD5jAjV3qi7CopMOayg9cXwgTlG9
	hVjdwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks25aew3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:02:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so7269392a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768186975; x=1768791775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ov3DcN0hY94lyBqDePsnXi3y/DTfjzLtdxTbWy0C1hw=;
        b=VoR5HvAtHeUDHLcQm1xcWsPczhpS6neAL+v4EZJzg3oOeDmJceIiunSR4jn6J/a9HM
         2RgNh/SEzHBGsWqMMdYhSFD3qVvwRhoY2GvMm2wNCviun9e6Ilcy/7R4Z4Z3o3v3unzG
         hXo1d/U8Q6mwVdt4k3ti7+47+2kJGuUMyuiTVPs3SdpSU4u6ha8Y3ltUi3UFauilgRmW
         HMVQplHLOqwA+ZesodYD+73P/jltdD5v8Hglf0Ids0hW7ILO90QdvOUlJeh63WNiAKzC
         hyMNBB62jQgcpegwkp4brKkPDY33UkpsGKKguUhLgxMUc8ts2yq1CvKror+JjdTTSEP4
         kKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768186975; x=1768791775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov3DcN0hY94lyBqDePsnXi3y/DTfjzLtdxTbWy0C1hw=;
        b=TjR2hiPRfRX0H5MqIH0VGHdjgcsRwx/1b0p4Tk+PBqY8q8AH4isrJPb1HExOIUhqXz
         yD8lGDdC3F2INOauLHza9D1d0UVzY4uhgwfKCZs5tSBXJYcAi1AK+Ba4OeiQ7Vy7RUAb
         bLnKdTYSeMUrKYadcJmNg/nPhbrzVIekn4XF4SoNas3NjlHn4SuwpYkzk6IeMQ2xm6Wk
         hgXmIEKxv5yRvHed5iwuJo4FGdqmPqbV4B/wyYGsb0BJHBmZzRKnvf8yy6BKmwBTtpqK
         etQkC5mooOWsYYhuP5m+POR5WNfusdKh0e0NMvywe/E5f+bGv1MJBHrrBZLPQdqzh5gR
         sBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOG+Uc3DuZnmC86a3jnnzNCSczv5748d5ue56qakxd6CIAqjl9CqxKLVDtQsFpVFXBaanOv2sD5/XMXlyN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WV4tMcX5Kc4oruGcpaYKBuTlZjq8WlEzORzY3TU02Jf7xKO/
	5K8RxqAUuTvDMK3GMN6iWTvMicBEjJSGUXnzFPVr+YSscamSPwq1q55PAZIH0Yv3118RU0EQ/RD
	vM6felfPPsBkJJ9F6tnMGWeu5/YtTcUdYMI8Lfp3weXGSMKMg3j7eQCOZsP7nx0vc1AlB
X-Gm-Gg: AY/fxX7YH9rMrQxuHq254I9MwA3yuOaSn9Xavr6QR3p9gi80fMNrtKCghhax+h2ABjw
	tIYBnkhwiuYfZMyZLQCsXER4ABcA01p3eI9Sn9Z7tDPrqmJKmx99ft10IJyHZyHeu9gHFvxQwYU
	MQyC3BEIo3kbi25pwNUTyAL1JAk/Cu/WaDdlTECakbh4NbJEr8rfUBFkR4InEb6/Cz563wXaa/g
	5Ncmi0qUp9EktCS05DnaoeT2J2/dSpLTZ5pKXEk2iDN4/D9kM89BV0XgkCq4oB/+l/0Baij/LCf
	ZVhLPdyfChTiW1xd4oOJlOaHDrRvb9uDNXyi6fBQbCksrYbI16CE8By5sXDinr1aGTlHVAiTpno
	76ztP+KYu7iVpSeh7Ca6r6iKQsv6ZSMIN964ELaDgShvlJYoo0BzbuGBZFPU0beBuXDSpvbLIGq
	B2Rb4=
X-Received: by 2002:a17:90a:e7c6:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-34f68c91369mr14965842a91.19.1768186975171;
        Sun, 11 Jan 2026 19:02:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgadD09YUzGWco3u8/E79NZQB1hU4xRWzsq1AVfydtSFO9RwL4ObqTuzkv7dLO29ZXnBpSZA==
X-Received: by 2002:a17:90a:e7c6:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-34f68c91369mr14965818a91.19.1768186974650;
        Sun, 11 Jan 2026 19:02:54 -0800 (PST)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c96d762f8sm10781735b3a.64.2026.01.11.19.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 19:02:54 -0800 (PST)
Message-ID: <eb3e393b-5a5f-4694-b269-c84d937175db@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:02:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-3-yijie.yang@oss.qualcomm.com>
 <wkv4sl6hsv3dvqteh5ccliet46l7br5yzsgg27qsopgnldufly@r5vkvk4dyrn3>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <wkv4sl6hsv3dvqteh5ccliet46l7br5yzsgg27qsopgnldufly@r5vkvk4dyrn3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX9FoRYJ2EzsH0
 OL5pw5SL1jaG9kKONF5RcU2+w3Lft8Y7INhPXyJldg28+tTXy06iz717zE4mx3od9ANh9d7phdE
 mA4vghNw/7klCYDPpeI3WkBovVVCCWVkOJwZbXf1EPy+EWQMn3JaaPRKsOTvxBelkQCDmjoyTO0
 Vrn6hZGiehrI9OR72caAXgg1TPD0YkHbQmMYd3uv3GILjITw58TKHRziKHUUbEMWqNUpUZ96GL2
 GL05lAchUq+4Wrh76kkwGcohGDEKYJce+snn8yUWKFy7kSf0A9uK0fF9hDae/YXcseHEoVvkMZL
 AARX9WgVrexeTGME9/lG/ov6Y7VIDVSVcljfPH4XmZtGtgfqT2g8YrKViOMlwKQspM/scnwdewJ
 AIaC3h69BttP4cxoDVPu1Ue86+559hGPnrimLDIID80rJlkE7KJn4Z1IkRQE9zG5wpayGnyqCfn
 4JOe2TztI/R3ImYHzvw==
X-Proofpoint-GUID: ev40WhDR22OwpOwoh8nJ71TFP8IqLqM0
X-Proofpoint-ORIG-GUID: ev40WhDR22OwpOwoh8nJ71TFP8IqLqM0
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6964645f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DGOirDVRF9kFrzJQLnUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024



On 1/9/2026 8:10 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 03:59:53PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> The PURWA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1p42100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> Make the following peripherals on the SOM enabled:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - Graphic
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   .../dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi}   | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>   copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => purwa-iot-som.dtsi} (99%)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> similarity index 99%
>> copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> copy to arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
>> index 4a69852e9176..16f11a81163e 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> 
> I remember, we were told that there are PMIC differences too. Where are
> they handled?

I forgot to remove the unused PMIC node from the SOM file for Purwa.

> 
>> @@ -3,7 +3,7 @@
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> -#include "hamoa.dtsi"
>> +#include "purwa.dtsi"
>>   #include "hamoa-pmics.dtsi"
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> 

-- 
Best Regards,
Yijie


