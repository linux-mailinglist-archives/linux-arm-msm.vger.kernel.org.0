Return-Path: <linux-arm-msm+bounces-75446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72815BA7DE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3C217F745
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 03:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036DC1F09AC;
	Mon, 29 Sep 2025 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKkHpMzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC52153EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759116606; cv=none; b=I2L0wDECmKBwCm8GDUZM9ArGRyfzpSqClrBtzcBlgxXymI2GXcdByiv5Sx3eItgYzGrENmOtZ2VXg9hYm3xpVoEKGqMwoCFlxALyF3hKiiowFeorGSfvszsZM/F0e08dvH13+SOD8nnU+TkEsfcLVBHP8qlm7ZKSKxX1dMaeOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759116606; c=relaxed/simple;
	bh=qLRQ0j2DuwLbARZJl+YwnBat+DKF9jga3AYZvOGllYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZykGsjSHrnMGh083lu3uK1MHvTaKrWdFILvkrbs3jgQ+Zx+ql/w5zf/3/oCt/Ggl+XVgdYG1BsRJ1FxqrT86M/gDBbWbyBWEbxhXTvySD28LLAF4oEcCeZ8x7kTxRU79jPUkYOLQBNZD6eZ7DQZKmBwT4aySjeGcqe4kMmBUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKkHpMzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNuInS005913
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DwMIGQZOb0C8oGvFUUhsHbg1t7LLLZPDxwcfrbpHQqs=; b=fKkHpMzkYttv3TvY
	ngN5R38cRfc0J+F0vDWViQ7GrFOK+QU5Mck6EgXcaIex4YzaTkU0OTcVRuF6NdEa
	t2VjQvEaZplcKYRz19fmVjE9/Ledckl1e2ar9ClaDXFXxIvw/mpjeaDq/C3jiWLR
	Tb8fdZApMC9eI3aCxfhHx7kldu+GNapD0dCvQoE66ESQrhLWeR5QLA5+esdl7Zdy
	LREYR+LF5XHgeJxqJYH1Yk8t4i+OcHy+p9wNleIvr98SG0KVSVQ4jD8zkEuiPZSz
	YLr0YNPXyaGKOuG8jvuzOhJ+uDbLLy1zrI53RdXvMNpSSlVatgyo5pbVmN17DlSq
	+xgGYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hbhdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:30:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-252afdfafe1so42490865ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 20:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759116603; x=1759721403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DwMIGQZOb0C8oGvFUUhsHbg1t7LLLZPDxwcfrbpHQqs=;
        b=aq6d5RslYNRvE5+iEMtPQ2Eze0WhFlrjAK0/i/YF7hKquGWAgBKWkLn1f8psSUsHpS
         NOhADfJzr60B9k1FmZRn6m2CmIXMLZSP1qXRb/RCQ7suQn1u+OSWKRlFBasuQGH0Qp8A
         fcFkGhav+KijJGW/RaLXw31mrpj9MJBgjxpBNQKzDTs3vwazoOezmLx486GYezqoYpoc
         sJX73PWhaoBHKkV/ZIPEHOsyN/G6CITsBp12239frSqpPjPey3JeA6dU6LlE/cXaBbSZ
         uarM0t7YbeLLZYGwSK/OSJHtfDqfHTRHm5Hrg6dB6ti7z7vxO2VU4Z3WhoRL/HEYD0Fp
         gFUg==
X-Forwarded-Encrypted: i=1; AJvYcCVvLbklUAvIIvJh1U59/cL5JIjGpT8RKCB/2gekoAvwadakzsZHLItohYXjL7TZrygVFMgy+TPaNGbtQ2kD@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJSZkZiISNhkhzu97U2Pde21jDc/BRc+icZkPBlaAdDPb107O
	1IBc1Nu9cfvLxWg76hzsOuYETY0hbJFiuxsVLk19G8c9fJi3ifWNtMHNqI0x21QXC8m+5gVEdVY
	D+Ung3BprPflEH9zAUUe2/8QvzgIjuD71CeRnN74qgI++Mm9ApnUzAfl1EVkjrrS6TXsO
X-Gm-Gg: ASbGncvHmYDzdyasQI0RZupxuvediPt4ThoTyfFCYH/f3dSWQDvdoe6AMTEviiWhZiH
	9MFX1PIaA9n6Suj5YWtvPU0qrkG+ropRji51QsI4B4a/k0bsi4Iu8d+lszM6dma536wALx/PypL
	dc+5Cfm1qGwznLPGWIb1VsBKzfXdtYE67JAsNaDuT1qi90+kcJWn/jaQue107UqH0yjKqzoYh7/
	zIZlEmKP87uQDAEDh3m0AiN28B6JTwhrjBQzegK09gN/GOMwWX0W8NlJKH3/D6VU4ZolYanMxx5
	95A2aZxOIQBeu0LAGVyN1DCFKxdxMIU2BmuvrQjkolv4BnRkJ7icbTD0WI5eyp01h0oZ+4aJzZS
	vFWXnRtE4KIkSe/Fx5HUenOTaVGTuO3u4zT0=
X-Received: by 2002:a17:903:41cf:b0:266:3098:666 with SMTP id d9443c01a7336-27ed4a2d5bamr160999615ad.32.1759116603542;
        Sun, 28 Sep 2025 20:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHGdaKSDixy6JXuYqOTMae15yp/beh9c1CmAdFxDaU5isUgkg8wD4QB/+I2hTNtSRulDpihA==
X-Received: by 2002:a17:903:41cf:b0:266:3098:666 with SMTP id d9443c01a7336-27ed4a2d5bamr160999285ad.32.1759116603094;
        Sun, 28 Sep 2025 20:30:03 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf9desm117154925ad.6.2025.09.28.20.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 20:30:02 -0700 (PDT)
Message-ID: <5b3e2a94-1f2f-46f2-a72a-79a66238b180@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 11:29:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] arm64: dts: qcom: kaanapali-mtp: Enable modem
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
 <pd5zbxclxtrfaukorad6dyld5foa6tcupqeiraj6uxlio6tmdu@gklwmof7n6sd>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <pd5zbxclxtrfaukorad6dyld5foa6tcupqeiraj6uxlio6tmdu@gklwmof7n6sd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXxpj9caxF2198
 5PKLV68sI4ddKevLbR8RA2p3c2Sy1uFLQf0rhWK0MPFzMD8CoiWUaT0wHIEMskZ+U0WXUykLRqx
 yQviGy3tW3TofO/qH11pdzN95S2VpzeVw9LtkU4WmZHes56gdKyeb1abJ9sGYxtuvSMaZF/hMnL
 siwepQ+tEC59osdke5gFf9nxvovKKrfL7yKVCz4LdvS03uhfO5DqAqcEw1d+VHni5xMUL4iGE0B
 8hvT3lPoTaYcO4CLqd3GJzzr0UD88Bbu9lgxf7jGZWHH6XVks6JQUeRCk2jTWEMJRzwHZsDhOlI
 xwYhHNlcFcwyn+wdRvcnOTe7TUkwR1m+XbpU8+zvFwGFB8qNMZS+OGHeVonQ7HNVRnW/k+Q3zHZ
 2Tp9gRxvSFWRluJ9dOMV8FLfbi0A/w==
X-Proofpoint-GUID: XwTjXg_enzmrIJhy2ldgYAH7pPWTwPH3
X-Proofpoint-ORIG-GUID: XwTjXg_enzmrIJhy2ldgYAH7pPWTwPH3
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68d9fd3c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OM6vnnba09aMTPLxVAcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/25/2025 10:06 PM, Bjorn Andersson wrote:
> On Wed, Sep 24, 2025 at 05:17:32PM -0700, Jingyi Wang wrote:
>> Enable the MODEM on Kaanapali MTP board.
>>
> 
> Please omit this until you have gotten it to work, and if that happens
> before resubmitting "arm64: dts: qcom: kaanapali-mtp: Enable more
> features" squash it into that.
> 
> 
> PS. The patch adds a failed node, but the commit message doesn't
> describe that, or mention that it is broken.
> 
> Thanks,
> Bjorn
> 

Well noted.

Thanks,
Jingyi


>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> index 2949579481a9..8d1b3278389e 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> @@ -1263,6 +1263,14 @@ &remoteproc_cdsp {
>>  	status = "okay";
>>  };
>>  
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/kaanapali/modem.mbn",
>> +			"qcom/kaanapali/modem_dtb.mbn";
>> +
>> +	/* Modem crashes after some time for OEMPD load failure */
>> +	status = "fail";
>> +};
>> +
>>  &remoteproc_soccp {
>>  	firmware-name = "qcom/kaanapali/soccp.mbn",
>>  			"qcom/kaanapali/soccp_dtb.mbn";
>>
>> -- 
>> 2.25.1
>>


