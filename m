Return-Path: <linux-arm-msm+bounces-75445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 832D5BA7DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397623BE097
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 03:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BD91DE2C2;
	Mon, 29 Sep 2025 03:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+49I59T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA9D19EED3
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759116572; cv=none; b=ng8MgyKsZGkc8dUkA/w4p75KJqIt+PsQBvXNKjDS7WAm/jV10oM8rmLrhJABkusG4NJ8thqnVuAy9ONNEcU9+EAFJ+NbqHqIwW/PdVseM0ddmx2JhKGNNCTOPp4y71l5YuiezTFlL83QgyxrNKhjJdErpd979fE2GYmx7tRIp2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759116572; c=relaxed/simple;
	bh=K8qraHqJNe7HsPyyEq7xTjrGmMVphQmcAw3lwXikDig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3H1pOmCuZbnS74wKHSbxjJ4LlvMwkfpC1oxSQqH1GKKHg4/BptJNu5q7NZ1uej87ldlE/S4SwCuRaEceXj68UpjfkUqt5y5r1rDE5dMH55DyOK5SKaXbUJFkM7DS30gIwoDjNa0a6+0OUJoQho4aR5nvEoRKClHtr13Z9k4kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+49I59T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SM38MZ016192
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tq//cuc7SMTQHHVY0AzFeuDQRLm9oa7w2WnkI/6+LUI=; b=G+49I59TIJkvVCwE
	4/zOHbCem5aEgWSIk3094WTdjHuxKRuqh6+caIPXH/X44Qv7GQMbf1zUhAsCKbCU
	J3OmgQasGQZ+W8VaGYZEhn8jLNvR4D4hjBoDdQ0EclSYPkTxN4vMBzhjHqhUPrK5
	FREJvBDn7wSgBE8RHWV1dKkGUlQmhbo0CCKgDNRdZd8DJZAel0+QDGS7S2PhXzWn
	6ksz9oo8RDNxw63rNW631AQuTXWwvFERc2cflRWdNjcFqnQKkveQ8jMRv3Tcg7GN
	ULuZCIRIOpssDBvpE7DPff3XnyNnGC1jX/4M9pxA+Hjh0sN1wWSn26M8YwejMSdU
	isBOlw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977khe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:29:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ebc0319so42310575ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 20:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759116570; x=1759721370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq//cuc7SMTQHHVY0AzFeuDQRLm9oa7w2WnkI/6+LUI=;
        b=UKQRz1xv8amo9l5SyOqtYj0AClF4h8f2LYssrNhPHMcuPSyRqRh3XK764GBkpcT45g
         sU2W48I5LtcYGxTAdmfMV3FlGLJfvSnbiIYfTR493y7K8vDKjEbPn8YwDbjAy70A/PL0
         wZbISOXCz+p6BjkwM4Hoo67jysw4Ney6csqYNyPu2QV61iruKoRAUCQR8ydyk2B5Tggg
         smZNV9mI8RrphormiAFpEg2GeqEViHzD8G59JQdSgflqVwTzEqBZe15MudE8YyEpgDJx
         FXB83XnVj0GEwiublBumiIl2WIolE4Qv/yllkWUGjkcPzj3cecOdNiTJHXGcaDf26hxq
         u3pw==
X-Forwarded-Encrypted: i=1; AJvYcCWXit8l8peV/gwyvkhSFS447eDzW09PPTeS1cUuqxj3DzeFcaEZybpHRLM+wMef5zIGQ25JPI7rudhxUAn1@vger.kernel.org
X-Gm-Message-State: AOJu0YxnziDhFmKhc0eq/Mgv2XX2RP/pKu5Liu7lUhPRxNB8EKNpn127
	5xaa0rxGweOKKXaOuSxz+tI8SiEv677r9fJOT21oFkUTDWuMdrCR2NQFe2AeTTgfBjTcZiDmot0
	XQ3ePof/y3PmMoQefCG6GNG2E+huUf1cpCHiHiENBzTRuqDiPKISzUL1hpV+1qsyCI7xJ
X-Gm-Gg: ASbGncuaX2ch0fHfUaypHswKDJjhoeCaLeMj61ntjNmhiAfgCfgEgn1OnwiMRMmh/iZ
	JzfE6JGBYAI1Lfpk9wa2LmdbjKzeIf3BXk3vf2miDCXk318ZSkZODqLklsIipLJTYp0RaPpTRM9
	WYj9ojgVL84WzNkGxce5590xlnZF53btxI4Yc34Rbp8EBLejDE8wxRl83/mQWrE/L86cHgMx61R
	49VIsN/fvRtQvwbRIrOH8l8hJk0T5KPFEw8mlTr8EpmBE0ZlOLD4RjRWsRjvqhSxpgDSXCp6/tN
	kly34VN+VtvaLm4vqXsI5EHmKRlRc4lq5dILJ2nviqAz0V+CPAwLwXwVTSYTKQltodphAz7t2oC
	G3qG39reuhFamNfVYVW1hx2SCBH4i8UTHs94=
X-Received: by 2002:a17:903:2304:b0:266:7871:37dc with SMTP id d9443c01a7336-27ed4a7c891mr159681075ad.36.1759116569786;
        Sun, 28 Sep 2025 20:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8MHcv+P4/9S2bmGgri5K2DWPbMAKrUh2NahyouEA2enzL8OQZ6v2JXrX75gRKi4c10r+pLw==
X-Received: by 2002:a17:903:2304:b0:266:7871:37dc with SMTP id d9443c01a7336-27ed4a7c891mr159680855ad.36.1759116569339;
        Sun, 28 Sep 2025 20:29:29 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm117107765ad.91.2025.09.28.20.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 20:29:29 -0700 (PDT)
Message-ID: <dc33ba92-26ab-4e5d-bcec-b04ace0e6764@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 11:29:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] arm64: dts: qcom: kaanapali: Add QRD board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-16-3fdbc4b9e1b1@oss.qualcomm.com>
 <adxbl5cejcng4iukb5xeriyi3e5xzeqn6xvqmro7o3y5f6tlio@qwxwv64uxvfj>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adxbl5cejcng4iukb5xeriyi3e5xzeqn6xvqmro7o3y5f6tlio@qwxwv64uxvfj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M4VZo73JnGy51-kKTVUA8yfEpzk7z0P1
X-Proofpoint-ORIG-GUID: M4VZo73JnGy51-kKTVUA8yfEpzk7z0P1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1paNUYsqKFLN
 KbBpCybJKpbeB3fFh/KRJMIfKH9vRkFjbUiWQ/xrEARBVnL4pnqQvepHa2kcJPwUMPvAF1TaoGF
 EnEiNRmleSbpXs898wwvXifyTSxNlk1saXvexVFmmPuF2fJfs2IQShmQLRVc5vyR6Zy7ZTmsQ53
 vyenLRmxCz/sv+zkwOtQh9vX+VUkt6EXnzbcMMh5ad5Z9So+bz0xlqq4fuQih6TJGjRmiqqjciq
 GnRVaMNEvcK8/2yfYZ2um/smcIOZmG+/FwbJHFavjkzJnaCkSEnZUJzdh9923uvdUNxvqe1Rzvg
 YBPoJrmrQgB7g33XkZbHVIybnB00OreUDWRnnTqw+zBpiHiyu/6/+DAP4UWeSmeLFSbol3QIxbj
 PoDdqnPUwwBhJIbcpuivh29m5EvWFA==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68d9fd1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hcQ5UqVBHLjJEJv-LccA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043



On 9/25/2025 10:15 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:33PM -0700, Jingyi Wang wrote:
>> Add support for Qualcomm Kaanapali QRD board which enables booting to
>> shell with uart console, UFS, PMIC peripherals, bus, SDHCI, remoteprocs,
>> USB, PCIE, WLAN and Bluetooth.
>>
>> Written with help from Jishnu Prakash (added rpmhpd nodes), Nitin Rawat
>> (added ufs), Jyothi Kumar Seerapu(added bus), Ronak Raheja (added USB),
>> Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC), Qiang Yu
>> (added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 1212 ++++++++++++++++++++++++++++
>>  2 files changed, 1213 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 7edfa5fa00fc..da9ef255073c 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>>  
>>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> new file mode 100644
>> index 000000000000..5900812c74a5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> @@ -0,0 +1,1212 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
> 
> Please sort the nodes in the file. You got two entries for tlmm, for
> example.
> 
will fix

Thanks,
Jingyi

>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Is it?
> 
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_hsphy {
>> +	vdd-supply = <&vreg_l4f_0p8>;
>> +	vdda12-supply = <&vreg_l1d_1p2>;
>> +
>> +	phys = <&pmih0108_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l1d_1p2>;
>> +	vdda-pll-supply = <&vreg_l4f_0p8>;
>> +
>> +	status = "okay";
>> +};
>>
>> -- 
>> 2.25.1
>>
> 


