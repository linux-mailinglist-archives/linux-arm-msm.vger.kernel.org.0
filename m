Return-Path: <linux-arm-msm+bounces-74534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4106B96A9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24C419C4E95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032A8264A7F;
	Tue, 23 Sep 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCinNdp0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B664F9C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758642753; cv=none; b=ulSUeHWCmK8jgafWdg+SvTdNfMyaLjt6U46KGPFDRpjpJb+LCDNujNlVctki35EDDIql/9QgxErqWfLBDxQPH6J3JKKgiqSJjmW+fISRrDR+1IDR0R6QxgfiTQvZB0s0rQITK2ocpdryKNLRpzwvB/lrmuq6X9qHEjfj8Jw1sdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758642753; c=relaxed/simple;
	bh=CcpwlYGznwOeaJS/CyloewOqXqfoX9eS8cXkrWgOiE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7x8BxNYU7eGdGOe+h7UdWMyFLOLMO/fhljL/3y22mHg0f0nsCubgXMJ+g6OcdFFB3cEtf49jUvrp/cyYl7KGjwYm2V+zWfdRwRpTxpeler0pkCVFc9AHwza6EM5bmhfc8ybPz7SDvkYTEvMB3tUtm7A2Ik80JmvYRXfnexzs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCinNdp0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF5X8m016041
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnk1sjZqjciZj1NSs1no/CPobCh/tOcCuUO4swDNXRs=; b=pCinNdp0eSGl93PM
	AOAFUXYkdAKh9WWDaXUeMLb4SMbdw713sW+aBMr09W4+PgEL5VP9SQVIieuIQNAz
	EIZX2DkpEO6GRmBhFVS8bc15EpnfRIyztBybvPAjAIye/t7lfNdVRreNOEcXKnhX
	dwvqkbd4Zw8WK8mvsF/33QRMsqnsjWqAf4aEDwF3AqnrF/TxmFzMaiLIFCx893z+
	eNJTxTPRDqIb6iJsGnOJEc9oYihq7kNa92TEqqwJB/wgbcFoWzb5BE96VfGJ+NJl
	4hHugFWbed7E70FYEFXDD8iCA+DEkWmkfchw3IOGD1OXCmnyC8cXhq+zmOmS6RUU
	rYl1pA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdtcpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:52:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24456ebed7bso251395ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642749; x=1759247549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnk1sjZqjciZj1NSs1no/CPobCh/tOcCuUO4swDNXRs=;
        b=wV/HJzsD3ALEEZkJBRZs9Yxs2fIpSYKdWk1IhM/fndstHnEYApq6lc28XDPTqGKdfJ
         ch+FYta7W0S3ymVFaiBuAIMtabuwwvB6TaDAUTy+e7JRigvFCkcvKKJpnmh5gv+krTTi
         wB1nuiTvvPbnnc/VpfhlxC8NjMkZ+9rn9VI66c1b/aLnwHzfoLJGxKVZbfrZ/oS49ldY
         UCyEZrfnWVJp4uTbGGlKJgC5fxNp/lwVYQ6SsnoOS5HQ3aQoa+CJOckOBhxZ5WTaJ0eY
         q1MY0lkENDjnLwVf0j96QTctC2dC+KRC0yRBi6l+aRd+VZLQLv0eSy8+57EIf6KP7x0K
         jvJw==
X-Forwarded-Encrypted: i=1; AJvYcCUIZ//QZNUmwFeyfJhZ/lRlyC3enqPAZI0c52UU5TeKkV3bZ4mFzwrHTFI1RG96rML1DzE55IjdjQJoqwa0@vger.kernel.org
X-Gm-Message-State: AOJu0YylGspCiGTEC8ELObeP8sWrOhC/KnCOjeC/CdOm1FXCp1sAJSeE
	x6QlNLHSku4EtLPmfdOh9Vl9lKyk54NyLUX4S6mSAnzk8+s3NxMDJpjb3e1d0KpBgEDSQtuVDv/
	SHnVZT9Hu0GQ14PfaT/sF2feoLik6fntHCHrULZobBIjo7lFJVdj8ENSat4g+Nvl9Fpwa
X-Gm-Gg: ASbGncv78WFKtstRs6ZqZExGmxzHhK4b7F/PWuNaGBQ5JjXr05+UEZtRdUo4hC6ggdh
	YbHflGDTUSZyVEaHmcCtQAlYvLowJeSrKb9nwXhzXeikmOIeMlIos+nBS7o6tUTCsBm8Tb0VHOO
	z02M2CRtmvKzxwVZWkIV/+h4iDDaUdZ+41eJCMRoov6DA6D52ZACZeP1mlKwM31CR82+qP2VE+I
	/7Qvl4RL+RNkUqi3FRu95estuqmKZ9P7+nylgZlrunNblYasn0GmBAgYxCUSwPqZnULumjSrLAs
	Hsz7fmTm5Ou8wvsVFuK7ZDy1KiT25WrNb9nYlEnYf69JiMHwGtZ80yAzfnnlJQkbcg9Gh6xsphA
	d
X-Received: by 2002:a17:902:ec86:b0:264:8a8d:92e4 with SMTP id d9443c01a7336-27cd63d00cbmr36675865ad.2.1758642748605;
        Tue, 23 Sep 2025 08:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY0gUezkzMH9Q3U378qYMV2WlHC0rAlDu3HjPX3f+WdGE++O8MRSpNyCPTDPF0+I3PqGqDkA==
X-Received: by 2002:a17:902:ec86:b0:264:8a8d:92e4 with SMTP id d9443c01a7336-27cd63d00cbmr36675235ad.2.1758642747958;
        Tue, 23 Sep 2025 08:52:27 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.253.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm161153415ad.131.2025.09.23.08.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 08:52:27 -0700 (PDT)
Message-ID: <23174908-5dc4-f4d2-3f3f-1225f999a227@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 21:22:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name
 to QUPv3 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, luca.weiss@fairphone.com,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com>
 <cr2ehxr4udit6ddzp3pspsdrhtf4rpl5fzo6jakw2uo3gm7r6a@v3hwvkya62hx>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <cr2ehxr4udit6ddzp3pspsdrhtf4rpl5fzo6jakw2uo3gm7r6a@v3hwvkya62hx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B4hatpXcj8vGFuYsjyGtAFpUuet9JwO2
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d2c23e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RtG+38I8ePlRmB+m5sTI6w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DAzQPIN5ulxls2xLjgIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: B4hatpXcj8vGFuYsjyGtAFpUuet9JwO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXyCb5huzYSBUz
 mOYGylYK2IZctrHcQuaL9gTyA3+ZeTNGJLeFghml26eCaMb+6fLTjPiHPgyBuzaHUIkw9hq5eNm
 +8EUgq5LuLkkl5BcgwTy3SMx6IaIQnNoGU3V/zFdaX0lvyd7WAs3r60bQ95ZSrZGtbMPc5Us+US
 Kexi4WjEPIe69F6SIE5ZgUL6KqFkUI+X4bZXXS8d6HNnw2Sm/i9jhiK23jTcUENL2mw6peZ3ERo
 +eqWsh8ff5WPltQ4MFkLB2ob8EMp0Xz38LIUKD5XV7Ch95N9ZFCiU3MxBKg/iardZ4FzqSzfwKN
 eD3Co0PMhCFwVo+4kYOWJBPcckip6/159ZDwOw/t9g//ZZKORQuqzN/cQrAyyKMc/jvIYl4lT5r
 RDYM9rSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020



On 9/23/2025 8:43 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 23, 2025 at 08:04:31PM +0530, Viken Dadhaniya wrote:
>> Add firmware-name property to qupv3_id_0 and qupv3_id_1 to specify the
>> QUPv3 firmware ELF (qupv3fw.elf).
> 
> Please start by describing the problem you are trying to solve.

Sure, I’ll update it and send v2.

> 
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 18cea8812001..4e361580ddf1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1009,10 +1009,12 @@ &qup_uart7_tx {
>>  };
>>  
>>  &qupv3_id_0 {
>> +	firmware-name = "qcom/qcs6490/qupv3fw.elf";
>>  	status = "okay";
>>  };
>>  
>>  &qupv3_id_1 {
>> +	firmware-name = "qcom/qcs6490/qupv3fw.elf";
>>  	status = "okay";
>>  };
>>  
>> -- 
>> 2.34.1
>>
> 

