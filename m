Return-Path: <linux-arm-msm+bounces-73675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E2B593C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 800B81886CB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7716E307AC6;
	Tue, 16 Sep 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSUqnefp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50D306487
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018582; cv=none; b=IBJlw2fkfr6l/zzYSdk3xmRL7tUHgncEfJqvCYlLWyEdAhzbXlrGG7zwr0QD66ldq8cu1n4o2KW5eQWtI9r4k3GiDqAutB9IPjKlxCjIBNr8YfXAYgi5SzAhQq1/XOKW9sPrR3kW9v398dgFfsRXYNZsiA+2NyOrHtNX5ka6WQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018582; c=relaxed/simple;
	bh=ygtB+EvH4ZQAJq4PlbVuhMBsLl2taMUDDFSXeqxgpe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf0RjAmQ4g+irSja5ffAkRXSmd7uHlw50jaNsyOztlOoxqCMCTlVvUzgbjeAqClwsiSW8ET3Yn4KqvF3BMmwBCWAqlIX/r+XsFXQwj+aQIE4OA03BG95T8fmvU85k4e9wHgfCH2phCwK234QElyUibLmSgtLzBfJ0q8vGWBauTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSUqnefp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1kGf005612
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GU+SrKKCCt7QHKhnQ0Qwpe7d/gooxwsnRu7znj5bEtU=; b=YSUqnefpDpieJ5OB
	jCzjlZvaJUP4u6G1NzieAHCckj+fW/7U3s+flo1Mov0rLDcp74u44eFt263Ku2fP
	W0sNzrhQoGmTh3rWz1yaKC8A4FvmJdFtzG3u9CHrmRcI4FsN8nMejZgHI0GjTVh+
	UJQ6Mh+YiND5CVkJTc3hdvHPEnNgVZNpvII5ksQD4zxz35PZNIBAjhh8cpR/DL+L
	gUzNXNaPm2bT7Ri3CPZ+dudzZETWOnMg9LX+9W8pZCL1vvEyMtsxACjyBrNdL5MI
	EURQD72pkMQcHZh1BS+bli8Xoos7zCUPbvRqQRSAB6ZcsFygS8PXBV/ZmiKU6tyJ
	GVUzRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58f13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b7ad884ac8so2141551cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018578; x=1758623378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU+SrKKCCt7QHKhnQ0Qwpe7d/gooxwsnRu7znj5bEtU=;
        b=mRwoD2Dj688LhnYIXcDBEhiG9OlfdsBfBYYmNChy9JOpACdj7K/XyFm2IdVbYsHUdn
         KGJBPvYZMCSHLYDGcQ0FNsWlZj40FhDgnqQTth/de1T9OeuIouMwV9h6N50PyO3lAR5w
         r+v0utP+iPx4NVL/MF7uhx/uTI48VDlBmV3MrQsEG4cMeYxSs/Kxa5swKiYwwLEDoB6Q
         tDSO9xQwqyvo6JVBRqPzgZk+ewFkn4jNd4gto91h/DN1MRiFMs9+IcYMGWOZQVIp9Up9
         TE/AwO7ANgnk7fERKp1eVd01hEgqqZmM+6clDP4WZwlIA84rDH+Hgdk8n2TZfepUQGyl
         8ybQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSsqskdxeLKNxpe5I3ffJ443tJmDF3PRLhfg2kQ8cBzfLQBvXKXHx+rA06f8469/5KWEiHTbSN+9vclzR+@vger.kernel.org
X-Gm-Message-State: AOJu0YxQD0tIKKHdmHYFtBUuuR6gsY7obcwet0nRv0s1tB1vNAzMmvqI
	qZCy/acgnKdFLMcOwOm+RM+NzHfiO7jKCrXe2Yn8g5dbxovIZEry1IaWMs3Ea8VfQ3v4Lx1k+/z
	4gvVOM3pjIdDMifaW36mtMQOhJhM2mXMttkWbj4ky0sC2OkMwJq6r69oj6SZ0tdBhoKM/
X-Gm-Gg: ASbGnctCSj+hJV1wdB7VHFxhBCKhdpNCPIvfYmr9Z5obUmMvAoAiswzlWHS5zL7qBW1
	9iO25+tysIwdkbY33/u2wy3smq3a2rqlPbSeFb7zneDdn+T7sSRC5APWNVuGNXW548Bw0u27B+w
	H3cAd1CdGTt4zM6m9Qc+Nh/hZg9WT/j8CQYY/dPnPH5UCMPYTQSX7TZZ+Ci6yh8hTtcHXu/PI9z
	aAVEQETN1j0VLWYz9Psh4N+zEDDdF8u16wHJh4mpBBomkoFjPT4aRQnMkP4R7TZMnvW7UYnTOX7
	vpT9+6nso9+4cL/2fgIxucVifoQnpl90nnEh/MnE14AQkWUSoyipezfMDL4tFyHIp7he8tZsiGF
	TzmMi0WXohZmEJTf4zr4INw==
X-Received: by 2002:a05:622a:22a6:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4b794af2d57mr70830061cf.6.1758018578481;
        Tue, 16 Sep 2025 03:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc/Zty3StI1tWgqDi2/Q43n+FRGSKUym0DsgirXM6iKjzPgKG47iW4ZaAI3syn3pqhogsDdQ==
X-Received: by 2002:a05:622a:22a6:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4b794af2d57mr70829761cf.6.1758018577808;
        Tue, 16 Sep 2025 03:29:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f3919e168sm4139507a12.34.2025.09.16.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:29:37 -0700 (PDT)
Message-ID: <40ff4fbb-1495-4374-b8ac-1bd4b2bb7463@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 12:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: x1e80100-crd: Add charge limit
 nvmem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-8-6f6464a41afe@oss.qualcomm.com>
 <vezlbc5onvmg3wd6tdr3cxhlvtmp24ca2e3vp6inqeegjhm7eu@viuurujdofvn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vezlbc5onvmg3wd6tdr3cxhlvtmp24ca2e3vp6inqeegjhm7eu@viuurujdofvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tUZpk0K6E9mBIaa9xhRRMfK99mxnyvfE
X-Proofpoint-ORIG-GUID: tUZpk0K6E9mBIaa9xhRRMfK99mxnyvfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX1H5S4Hz8S84M
 fTQ0nBOkWIllXgZf/NzFYl7eq5PbyzccNKhi/IfWl9j9X6avVDWs3DA4HAM+EgRgrfu8s1DIC0k
 1SJv45KBg6CvJG4HenWJtJvvCLGytu5Gdo+YwCW0OgxkrxR+5lnbqm5UOTBRgnD398EMZZhOtOY
 cPeQemDFx910oVIxAgkPgghRx42I9v5F+5u830S5Dmwv+iTO3qLM4hvP/LzpQvDAMJ3gfd97JrK
 r+gffMkNQ4j8WVMUcca3VsvPA0bDSkXBv0dqg48n51Ici7IO3KrDNy7B/KUjADKIvZDbsfDNnQP
 /bNe8B9t7Ij/zB1WLz/jCR6wQmGIFiGK7btgq1L1T0hPi+fDrAGfMdtLkMFoZ0rpTZ9Z/u07HaA
 gptP2Fxy
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c93c13 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=x0UozUpXlkEbfjVD_VEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On 9/15/25 12:20 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:50:00PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add nvmem cells for getting charge control thresholds if they have
>> been set previously.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi         |  3 +++
>>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 20 ++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> index c9f0d505267081af66b0973fe6c1e33832a2c86b..fee65391653ae9c2ee23f9f3954d9ed018c9aecd 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> @@ -82,6 +82,9 @@ pmic-glink {
>>  				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>>  				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>>  
>> +		nvmem-cells = <&charge_limit_en>, <&charge_limit_end>, <&charge_limit_delta>;
> 
> One item per line, please.
> 
>> +		nvmem-cell-names = "charge_limit_en", "charge_limit_end", "charge_limit_delta";
> 
> And here too.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

