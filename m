Return-Path: <linux-arm-msm+bounces-75444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE85BA7DCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A9A3BE1EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 03:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6D51DE2C2;
	Mon, 29 Sep 2025 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+QkdYWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D41D5AC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759116539; cv=none; b=O7GvgZTsvGBXuLMd+llD7jb1Wv+U4k+idzdMUSeON8tjITr+y0c5Q4QzKC9qIg+q1wg933TOwiIDyESORB1a6W9P6ERaJpKYMjoUNUYz06TqL+u7OcjCsL2hHU6olerR/y+Lu5crBoWyLJK7jMe19gNQPEbcWl/ekcEiPuf4XIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759116539; c=relaxed/simple;
	bh=d+oWh3J/8FcYuoWe0/ZRwK5kyq7hn3yhAFbF2sHJPCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tai4OCLKK1DMo7mfh6ZyT2gn5HJFKs1iyHQfbxyHrDiNtXkPF+GFiw5APdP3eMZuUt+iYpKtzrvAECaZApzpIRvAGzcMbv73m9bRWsW3W3UR4lJeYxxr0zdpa0qvClsDsVVm2QNdRWdTzFq2QxcvxJ/ELnPbz/4U5udJzStjcl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+QkdYWQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLNacP005752
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXCM5FcXq8QuKbX49yIS6uSqjr5lzhikG+yLwyTe8JU=; b=a+QkdYWQ5EkEBw9H
	Gu0LM28SZiFyFQXUL8HFZhu8BsedFlrS0kYWBlnHqvopX64wTCL8sQ9YpDPskDHd
	3+w9ts4q1UueKxBGop0Xlilxa5jhH76iDv/pHJ01K25kbXySamDhXPub/rzN1gT3
	2qTbgmZNaNfQ3ktR6M5y+D5vsypoDc+x4zVHzPKiaPORdo0RbwapyOrL9P1Iu2i6
	gy29QUoOnt8S58e85o8v5071+24jYD9NUJSevnKl+Hai0ZWDpTzFi7CPvWO83NMV
	6eRhoVpBvX0I1Tv+mF3Rx6kr5dQH0nmZjJ1SYwCmjIQe3LVMqJs8Eqr73qHul9ex
	5LtS6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdbjcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:28:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-286a252bfc2so9120985ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 20:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759116536; x=1759721336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXCM5FcXq8QuKbX49yIS6uSqjr5lzhikG+yLwyTe8JU=;
        b=Wa2gPyO9FscRbERXTELrJ75uVYgzCjQliDX7tWKHmPLDZfPjiivlBxSF8Vom9i8bCp
         Ir92Fz5Cb+gFrSXLucl0cTD/8xH8LM3B0JhcUnHAueLRzdHKyua8IqICfbExdAt7+gPP
         O2ARR9cUfdXWtXX5tVelGyuD1cXpJEHJvaqlI/G95AEfYSOVCLwc274YhYdWNOx31voW
         m7m9q0ucO4/Q5LEQxRlb9dmIpPSPAwOIoK6kEuVMBVJiRQlzkjw7UaRunD2jZIEpIA72
         e+cQa2AZxx7ylzMnKW9PjQ3sgjxIqhK8cCmmV/EnRoNYx8AlGegeXalGbmuFwqPgAIEB
         i0iw==
X-Forwarded-Encrypted: i=1; AJvYcCXubKIXIB6oN/fmChMMIXM6qbM5q1eNIso8w9TLKJpnf0SG7sktP/Dq/KILnDAuEQmXp3MZ3weRa3pveHXq@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiXpN9tfrwHA17iLBHfQUihjweZnDvp9z/pALM+CcQejgA/ty
	1ho9kFZypgpKBMDUMdzfWS6XACn0U06W5C7ZUPXOClmBlmNCxRUHSeVLzC7kTxTsDv16e0yLH8N
	Q971HeaiDPq2BfjEdERqEUXSWD4SMFzyg+zQiJQ4nA9g9WNql8FtMVKNVhAzaZlLjnXpG
X-Gm-Gg: ASbGncvQVAikUeGBp2XitheYzbHP+oDODjPi1VdDzHwPLxmlIVwpTnoA8mkLAb9vXlA
	vOIm0jxTMZm70XwbzudgcpuPCaHDnds4o4pd62xCe+zgOJRAYhSLL9BgGgwVjJUr6TBmW0Dlp10
	bIWwWQqHhqt60Dr8YO7uOV1LaYuA5fhmS+/lifmBtRbgUK8i1DIg+dsKZc0TECPcEnygDvPCTcp
	QAerJU041sjRGTP17fPiqVI/SBRonhpY+FiYgLJ5eCaZTaPGx0daQvDGIMiEb8izkTERktfEohf
	y4SM49edRaFKxa0Z16lT5JE5rkTI7d21AelR1AjTKrPA0dEcmExvDki9CHJSmle53WlQ1+krjCT
	x8i9RB/wtNA8ilwm5iJacLLfjLiV/9K2vgQ4=
X-Received: by 2002:a17:903:1b2f:b0:272:a847:cabb with SMTP id d9443c01a7336-2818ba15c22mr78998435ad.28.1759116535931;
        Sun, 28 Sep 2025 20:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTMPBj1tCYC1tlWu171y4/7crBZa1AWAZ4SMl5J4neepttiCfPv+lqw8NhHYdwwrWdlvP3Xg==
X-Received: by 2002:a17:903:1b2f:b0:272:a847:cabb with SMTP id d9443c01a7336-2818ba15c22mr78998235ad.28.1759116535509;
        Sun, 28 Sep 2025 20:28:55 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a9668sm112686175ad.112.2025.09.28.20.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 20:28:55 -0700 (PDT)
Message-ID: <c8ecafd4-43a7-4d16-8e18-91ea8a51b92b@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 11:28:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] arm64: dts: qcom: kaanapali-mtp: Enable modem
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
 <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
 <iexa64nrdqmwitvunl3inmgtmhufphl3p4p2kbvhgcsb2y6l7j@5tpt23yd6jzh>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <iexa64nrdqmwitvunl3inmgtmhufphl3p4p2kbvhgcsb2y6l7j@5tpt23yd6jzh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hKEKEHVjXeRabzBoHCoWYm70nBWmVrUY
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68d9fcf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OM6vnnba09aMTPLxVAcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hKEKEHVjXeRabzBoHCoWYm70nBWmVrUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXyoYF9mbUqOhY
 YnBjDr4QXRY7MY+LEBYqJHtkYhqa85GRwqfEbgkCcyqMmXRCplN03JhDCwbYz7eY6TYXTJrwsEd
 +s870M1wxlRa5XSbNekRNopmZ4jz8T0mCnIcY1ZK2e5xk+bjsAY5Dao+XVQ5OoBR7Sx8/BXEHLv
 lgmTZCNN2t3b/4ldW4CbW+bbAT1AK9tvPMcKYkmcyiB9owG9hkRs6G19z1Y9Lfr9NfYu3g7qdBK
 CYUwGA8VCdOOWGmT3JKbiOICbnO9nrmWhyAyDwHTJiGwqpK3xss/Y0SaYfj7jg83/SERAw0hV9H
 7CmhYANUPnAoaTGNVZP8CPgBZkhHUwxtwXj/i4z6LyG5wXWARURz0Rbi+OqhuNW0TrPRNrjUs0C
 Vdvxaf9W7fG7AUBvBTIiXoeXeJCASQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036



On 9/25/2025 10:10 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:32PM -0700, Jingyi Wang wrote:
>> Enable the MODEM on Kaanapali MTP board.
>>
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
> 
> I can't call this 'enable'. Why is it crashing?
> 

We see it crash after running for sometime, it was following what SM8750 do
to mark it failed. 
However, we will follow that Bjorn suggest, omit this patch or enable it in
next version

Thanks,
Jingyi

>> +};
>> +
>>  &remoteproc_soccp {
>>  	firmware-name = "qcom/kaanapali/soccp.mbn",
>>  			"qcom/kaanapali/soccp_dtb.mbn";
>>
>> -- 
>> 2.25.1
>>
> 


