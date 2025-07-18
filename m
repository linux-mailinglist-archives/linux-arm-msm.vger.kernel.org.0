Return-Path: <linux-arm-msm+bounces-65582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E1B09B74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 08:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7793C58337B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 06:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C691F4C9F;
	Fri, 18 Jul 2025 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNDBnRIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779E1A315C
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752820439; cv=none; b=aBI02Io8C+fupF+zMcjmZIfu05/rAv3INhuYYaFNVR9uyGV06aCncyZu31KGiDBBjw2dQ9lT8JZRWyzLuxNtKrQJt3PTRLjuA2E5ufDtE1YITcE9u2EI1EHSE79L+Fg3i9RNuLWj90ZRa3ypFt0qJK2WecPQndNbxxGDDRLUGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752820439; c=relaxed/simple;
	bh=Kxlj3P3benQG+2FHABBKDzawQDsEvKMoOxiEZZi77TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKNttdm4abwACToMPgMbYV0M/PGLdBijXVebDhBb/eNPrZ5pjtcQQaL+4uasqB5zLQKUQrRtJk69p7yfnIEjaQjm6nULeFWN5vCEyov2foRrZFfPTl7OT9AY2GH3lg8DyqVZZg21ZfKS4zIeOkSY4dwAXmFUyeGLXilAOyHPO9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNDBnRIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HKnPNU016545
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 06:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YdNKjpaXT688LWeZhfIGj5+PYEMt2+1/go9Rjxhs4k=; b=mNDBnRIyl/SBPF3+
	/3ApWqiUAtS5GrkgEMN3Jf2Q2bYbxo5L+IjZZPY/1ph9m5WuT2n7jQvnE42OWG8F
	h9tDjgGgGP1ZfDdjTrbe1ldjfP/EXvO/VU5QDjvs+ieqTcACNivI2tgXnuF9XYwk
	YlruX7DvzK6jHq8aga4aZepQ4KcGT/nVbLDxJzUa8TWNeDCY9slF+f0ARlEWNId+
	WIjbcnte2AZCtfTdkM7X4iNgE4gePVi8tVV8KjcZzrDi5Ha3Z5BvWwcigrec7kzE
	+L/g4rJQ9lwetTtHkHfSpH0Zu/tap+K2YkNIOyfdE5MH5bqa9yc30Vq6Bq64xlNw
	aLufZA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dywck2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 06:33:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1311939a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752820436; x=1753425236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YdNKjpaXT688LWeZhfIGj5+PYEMt2+1/go9Rjxhs4k=;
        b=SaJ20hvZDyeFayCKZA7vrqYe+nG4RDl8mvGhxyfvQEP5JIX4j+LhMKRf7lN6gJDGev
         FlsMntQSn99kQhjjFpg+qNTHjXtGHOIeX7FPCVbeWtcMgI9mvvYkQ5n+s54HIb1NQ+MX
         WgaIqodHXD2Q5x/Op98030I5AD3mKkP9hXy+aWV7YNlL/yL2JBK95zUNiVHhFP/S36zp
         x3+OZhGltduzJCGE6Juxt2OloaxUmPCouUPvQ0w/Sy5Nqie0QWTds+JYAxIK7gSHGDFs
         eM4r9r/d4HK1OKm5ohjt9KC4kRAgh/wZYdFRsrYgngs5pswCl/xl+D5C4QubklIRgoMT
         SCZA==
X-Forwarded-Encrypted: i=1; AJvYcCXy7LpcbbWl24U9ZOy59l5zTdyCfPcichz6OCm8PaEr+Uurcu2IpBqIq3xRlkDpSzDcz2I+nH4e4PEKUV6m@vger.kernel.org
X-Gm-Message-State: AOJu0YxZL6+U5RgvPNC8T0ew+5DC0HFUGHBtP4PFMQ+K7vMpzi8VHAAy
	BpeeoAYdPtEn7AdYuQvTwzzSYqmyIb99vwUCAYfLBQndVhXLLBLGL0XAm0LIm/5usk3ZlsGH9dZ
	P78XbUcQoTqAUc4vHZXvX7/lTEeqYiYEJo85+ilUbOBizFyC9EFi7/CQqHXIhwj81Gl6Zf0OiqM
	QH
X-Gm-Gg: ASbGncsV5YykKkzl/FOa/bC6SbtUOS0Z6awtuDezN9pQPERVgLadfBKc9+bqBbRExhH
	wUzQI02rStMiOBUwcMSc7JwoZshykc14atyS5QJIC9XlAfkFSvq9RP0nqQ0ZM6G+z4yfZuob1st
	etNYXCS0GL9qncj1DkFaE6jh4j1s1RVzmVyOHt+FZpA6q1WL4vG+Vpsajck2ZIueSxMw/FqFh4g
	sLgeu/xwM1Gf+SzIWYnQ0GR4/ab8l9KWN6+AHNRjRt4oGQNYe2UMdmO17eg77jjg0vcNMGlZaX0
	kcdkPJ7EDVjYYCfAS3SGMZ541NArcyiHg8bCN+vhLbzXbESrtctNPFHRsnRwDOmNGBr02M/2/sY
	Q6BeZ9iN7osMXMUzIVajH0ZJvd7A=
X-Received: by 2002:a05:6a20:7491:b0:215:df3d:d56 with SMTP id adf61e73a8af0-237d7d59f5dmr16155843637.21.1752820435350;
        Thu, 17 Jul 2025 23:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAK/W8gg/yU1O6D3eju/+esy68Zw1apyrzUq36ajkL4EYmGLpPS8QNcWJNk3M0FanCRGAijQ==
X-Received: by 2002:a05:6a20:7491:b0:215:df3d:d56 with SMTP id adf61e73a8af0-237d7d59f5dmr16155808637.21.1752820434908;
        Thu, 17 Jul 2025 23:33:54 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc66679sm563798b3a.134.2025.07.17.23.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:33:54 -0700 (PDT)
Message-ID: <822af9fe-5db0-4620-8f08-9232c608d443@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 14:33:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <b4nxjsx4fu4xmookpxukumw36wlcpzelh6axjucqe4lyswptm4@kczsldalq53n>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <b4nxjsx4fu4xmookpxukumw36wlcpzelh6axjucqe4lyswptm4@kczsldalq53n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GMO_P239pSjeqJcCM-4flM2zAV55z4Jz
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6879ead4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DGOirDVRF9kFrzJQLnUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA1MCBTYWx0ZWRfXx5muREyruPGA
 RhwV54G81Cxz9BPF0VkMJL8v5L5IEodAHC0tkbtgH4hSLRpUI55Cif05axRpF07KBimJbOi+HXS
 +q59YnRlQJPt3UJlCZ0lUxEhushYvxkRPNCDeeDgPXk2i5nNneBeCpn2jKb0bygfd7lbST3x0WW
 bqlNd5gfOIjd84cRexod259zVH03t0zZPb9DXtfIS2WMHP6H9cxVdkgsgP5gSVv8X9vuXJPKjyD
 aAGuyBWMOZhpsgmkBrou4wC/rgPxVCyDu8SgOrAN9MF/ht9kaxuV1+iPsrSFPaH2JP1MDyD1/Rm
 br9jDndPkwKb+NfCT+7gPLz0ImpIyHTWfSoqBFGb4ViS66EErc6qJWfI7fEfWpQVob/A9peswOT
 gLvyS/4Nfv5+vkrLYRlVEiVkTOPktBOmx9Ih6ZEJhi/K7pC4vMxiwINZxP+/PE3sBnwqcSsr
X-Proofpoint-GUID: GMO_P239pSjeqJcCM-4flM2zAV55z4Jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180050



On 2025-07-18 02:52, Dmitry Baryshkov wrote:
> On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1e80100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> This change enables and overlays the following components:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - WLAN, Bluetooth (M.2 interface)
>>
>> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
>> enable WLAN).
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 607 ++++++++++++++++++++++++++++
>>   1 file changed, 607 insertions(+)
>>
> 
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/hamoa-iot/adsp.mbn",
>> +			"qcom/hamoa-iot/adsp_dtb.mbn";
> 
> Is there a significant difference qcom/x1e80100/adsp.mbn ? If not, can
> we use that firmware?

I believe there are differences in firmware between it and the EVK, even 
if they’re minor. Therefore, it's better to maintain a dedicated folder 
for each board and move the code to the carrier board.

> 
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/hamoa-iot/cdsp.mbn",
>> +			"qcom/hamoa-iot/cdsp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
> 

-- 
Best Regards,
Yijie


