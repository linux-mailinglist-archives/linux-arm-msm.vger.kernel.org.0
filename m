Return-Path: <linux-arm-msm+bounces-67713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8733B1A926
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 20:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D6E0189E087
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 18:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F255328642B;
	Mon,  4 Aug 2025 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw6gbHDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C056224256
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754331812; cv=none; b=GXVFNuLv9ik1T77HGH/3C3p1qg0IkxP9pDaZcfj6P11d8pQ/Xy9XuKisNfOWfkXfTwe4bl6FBzKWdItcbIxN3FNSQAxnRcAXrXmwZeV2HEnbj8mlmWVseBLNFOa2fMKHWbqooMZ5rS95+7ABLBMxeyod5NRddNsy2Hu6teP/Fas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754331812; c=relaxed/simple;
	bh=7ltBgKMR/FXKtfkI/2GQriZny8l37rhY6/xi4aaQris=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCn8zNISwCfyyVye5syFZKJLTQ5NXti+mz9vRGea4O0+dmQyFSNJ5IoHkyz8ciwZD79vMK3DbMwNELH4PViUBQcmXXSpUXM9dp3nx69bL4xIITs7L8SAypQx8Ddl1a3UPk/RZsleyqESw2IZwBJSx0yTLC1TOgRRiTETg2SQcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw6gbHDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574GEF5l023507
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 18:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwAUZbzwPdudDNVv/ZAIuba9HHKqAhFmjC3T88l2J4A=; b=Iw6gbHDxCHYU36ep
	Z1ih82wqrLcJ60Jx1jMfihgJ4t260bvWB8/w+H9aP9rjZdGp16cY3NOYYKeqHlvF
	VbcOA4x34lvTegp2sP3eUPDpuCsLj29f0BmVO8EM0QrZlL/V7yrTuqG4uapeLk+C
	CnW3ZpFgkPfqu4ekxqER7fX5Z912SEEuCYfHVuqHkMd4nPlRNKnCoM8b2DVUgxNF
	vAunVdMw8N6khbL+2wuOvnJZLos6WCVsWAEnRdjNywwCOuIQJhRD/yBv+sPVJR4u
	4+NYvZeE2PTr0kvAvNCWkt39ETdfK97iKa0OWo+gdkrFThGZPMAuzn1nEEijKi2U
	zfCGVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqnwwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 18:23:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31c459ccd56so1468747a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 11:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754331810; x=1754936610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwAUZbzwPdudDNVv/ZAIuba9HHKqAhFmjC3T88l2J4A=;
        b=axiir4p12F+70SMThfT9FtXKQx3d733qZaCZGycQ3ztjFcGWyfGT9+LzrUVzULfExO
         F5btuPlM99Wi8dOmcGXBPw5wxfAaek05u5LXk2JiEOCJGGeO1uBXujoFOb4NlWXXneZC
         gS86LNXUxj5yk941BFF9Tc6eFpYNdF/KspNX/YMObhUXjxRdWACA+Vz0nZVw/KtQhU+l
         b50Aj3QKXLHUopV2hnLACb2YJBpABkvh4gag178vrIMbgrCPpH1kenAdawHrbAlN+Ymh
         b93u9WVLNPO7BZBy5PrdyB3yCQFk2CwXgaKvlwV8+xF3LD0M3AlesQQYDB77FDe4Ytag
         /iEw==
X-Gm-Message-State: AOJu0Ywx6cdlDzIdjilaNOBq3Eq2SpyqndnRSKDGmFOEhd8QJR8v7ncZ
	JXA0kz7/B0Uyhy/EkGXifEOuU18Z/nFQ0gMrVksjyFEXwgjuj38DoVAEC0ai+P9t93FcM5aJkPN
	THKdK/5wQMqFuXpcmLYtkcrUta9Wz7ruKFShabC970McReJohZ/8bO5eh+T6uJ8r/e/FY8eAjP6
	AG
X-Gm-Gg: ASbGnctsQw5Qc0pXWjyvAe8YmU68LABAWeD7pq5CQfJqh45tEAH7Pga6lGMIXymsqTe
	/3m+XR5OXVisHQgrMgusvu5fJjDOWCugyB6zq5ebUiZKPdcxKlH79qNREH1zSbP5NMIiympC0lk
	ftNbyg+AMQRcJ9RslSv/d4uc219ABdCHXTmggSIzYoL08/EtDhAAMneAO9I9Xwi6glScWUvRXwQ
	Cf+OjywLFPJSAPV7ToJh52Goz1aVWtxIkR89tyaJFRzs7sgxA3QbWnO5VDlrRfUYLNIK138sW2U
	5giaIhwOCTAv2iwBU+GjIoEtYLS1Ix8/kd3gH/C9/k9j6X76j6y9EpCc4Dsai4vAmzX7HLy4aiP
	4FyWKGee6m3xFqbn8/Cg3g0m/ZMB9wva6
X-Received: by 2002:a05:6a20:1583:b0:233:38b4:7996 with SMTP id adf61e73a8af0-23df9129b4cmr7083566637.4.1754331809656;
        Mon, 04 Aug 2025 11:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSo4CpGz8MsdmAlTt6d4liC0i3VrBf4Var3mZ6vsWib4H2hyKGAUuPhG5lrgaiiFcSl4jckw==
X-Received: by 2002:a05:6a20:1583:b0:233:38b4:7996 with SMTP id adf61e73a8af0-23df9129b4cmr7083543637.4.1754331809193;
        Mon, 04 Aug 2025 11:23:29 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb5:a9d1:15b3:77df:1800:1497? ([2401:4900:1cb5:a9d1:15b3:77df:1800:1497])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0d14sm9521529a12.41.2025.08.04.11.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 11:23:28 -0700 (PDT)
Message-ID: <b376d130-2816-42b1-a8c1-1962ee0c2cd7@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 23:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] Introduce initial support for Monaco Evaluation
 Kit
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
 <551e85b1-e0aa-4d0b-a532-ec670bd055a2@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <551e85b1-e0aa-4d0b-a532-ec670bd055a2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lyfBetd7vxUg_im5HEsBUIE5hW6M5aH-
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6890faa2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=HCkk8rKoL5zF92MEZlsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEwNCBTYWx0ZWRfX1c5MrqKEValz
 Q5lZSK4FMQzotI7ZLzNlOwYByXWFMagPt+c2Z7cRJlVIutxkHLsUDPCaM4DBZrVRFRrlkStaoT5
 cV4JBuOSplJEtUcfXqQTJQf54iIVEpDTGJc9iJIqz7ZZlahv79oeye0RSt9DvC65/Bk8UcqL6iX
 HMZnlnGKV8DTdGyR30nSI9xk+idEVRoMUbMTXRyO/tpyee3KruYwfNNfEkgjBa6rrbntWVS1VnO
 Qi+97igLsAQ6APP8OK7kHuLZBsacsg70kwjnimtx2V3j0tSWQ6Y0L3gv68FbwLmfc8Uj9J/07L8
 SguL0AcgKbQICCZ4Kk2cxnj8D1uPdyZs8+Luoy2jIK89YBTYBGsnQHKNxWfVsbZEbJbMvbXZDtp
 F/dR2P40mTQX8bhMDvd29tkFMq0G8fRWi8JBP39uUJLjNNXIWcfcqwjJTBJz0wdoO2Wz29dG
X-Proofpoint-ORIG-GUID: lyfBetd7vxUg_im5HEsBUIE5hW6M5aH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040104



On 8/2/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 18:36, Umang Chheda wrote:
>> This series:
>>
>> Add support for Qualcomm's Monaco Evaluation Kit (EVK) without
>> safety monitoring feature of Safety Island(SAIL) subsystem.
>> This board is based on Qualcomm's QCS8300 SoC.
>>
>> Monaco EVK board is a single board computer (SBC) that supports various
>> industrial applications, including factory automation, industrial
>> robots, drones, edge AI boxes, machine vision, autonomous mobile
>> robots (AMRs), and industrial gateways.
>>
>> Below are detailed informations on monaco-evk HW:
>> ------------------------------------------------------
>> monaco-evk is single board supporting these peripherals:
>>   - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>>     eMMC on mezzanine card
>>   - Audio/Video, Camera & Display ports
>>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
>>   - PCIe ports
>>   - USB & UART ports
> 
> This belongs to one of the commit messages, not cover letter.
Ack

> 
> Best regards,
> Krzysztof

Thanks,
Umang


