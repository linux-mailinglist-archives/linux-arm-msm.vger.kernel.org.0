Return-Path: <linux-arm-msm+bounces-80177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583CC2EE22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1BE189817C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1F423505E;
	Tue,  4 Nov 2025 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edFqSMLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMzm+XSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242E22FE0E
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 01:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221039; cv=none; b=s+tEhoad/u3gMyTjrKF+vz9nfzzKlfwE0AluE779MbGtRUtFLEhJRwJWqSf/byrFSGhCWBLCaCOjFxBpVKvD+RKqTT5rMaQvCuMlYdI+CrH71x7Eho45O5Hmc5ehmBXN2Z10V2H35tSym+wtS+9QoAOVzV7IGOTxg0hAk0nUp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221039; c=relaxed/simple;
	bh=PibFDQ25ugR62we1fK9/nybor8EzFUEB+4IMfRigMNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feIl3p/Q7oBnx8lxnqRgDW7UaWKQHR4JzpYxRn8G+3yGOk93GCOAqcry1EdqiqoOsFelisOToyZxK3ehLWYHsB9S85mBKw02gxKY74Q8WXoXSpnkU9reUzs87XKyUNdcaPsOvlSCuR/sJqK0N1y8sHelJhE6zJ4vIRoh2y+9vAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edFqSMLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMzm+XSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3Gg2hr3684447
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 01:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPYsBBo7fnXXXzJItxQunK6FnbnE6vdOwkJ2g13GBko=; b=edFqSMLYL4iqumzS
	j4ABtpoBJtIxQmPiy+j7fFyfaUT4PU5s9PLb1/PGtAWOmO43OtFkQIl2Sr2g4qkN
	hhKfHvgxQCCjX/3orQ07aN8cGTzQ35S6lQh3+O+gtqsyrNHS6ma2tEQ7ConeXqHv
	gQCSzhGf7OfLpIb/RJD+4K4nJNLgHZbrDq3IFB5igYZiuuQjwF+hLkgYH+B0QRWI
	NHZLqhuO19O5FZqJoxtwk3XcOCwh6ZTUkGzl+K3g4BzzpWkzfiRk0+iPxdH2zaON
	8LzQYjdVGrzPpR5HZ8K+V8aF6y+hRPW1+P1mMiZJZ2zLUteL9NBN4Ih6gENbRBgl
	aKbylw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6tnrjb2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 01:50:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34029cbe2f5so11743386a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 17:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762221036; x=1762825836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPYsBBo7fnXXXzJItxQunK6FnbnE6vdOwkJ2g13GBko=;
        b=XMzm+XSkJeFEhk00DAphHmwhsDp0ytQlf1TDI6F9qPKFqX9DRUtiLlMW9svEcY5aAv
         xyeo7gNmtshXrLbp9RbB+hAW5FHf8TnQDehI9J1yXW3Yk81dtah0OjM12gzn6D7EJn7j
         qo1/Y4BJQ76+LlUUgixvBzhjT6hjyPg+/5YSJaRYVcbhU/zu2APDxBW8HlV3t7Bfowjm
         mmC9bYyoOXKsE84T3r5ctTb1iJDokUbmrBCbE3AwnWS90jS0j13Zp7LRD21Bw8RYfvOH
         forZAmz8zV2OtNZavXtKeDEkWpp3pCAP1IaVYLV5xo4/FHJfwRr+LZ0dKtz5CvMEc3Sa
         QKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762221036; x=1762825836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPYsBBo7fnXXXzJItxQunK6FnbnE6vdOwkJ2g13GBko=;
        b=JZ+26xKPtUDOk/ly/FWlOI3/+oDQ45LMNo+TjSmtvRRFLB70S+sWUiOxRdcN7jI70Y
         fd4BJVWK7nP+NiCJ7RGVI4CafukxUMiuSH4J4Ke961w5k3uOrrSKZQcetqunqmXD4aqb
         y6cYUP/LKCQ7WWxaLBDlUCHxsVhm8w2EmSwgG7oSTl4WUSZ94IiNuS2jfVDzVpYlOWRN
         s4CJ/aozZ98kSkeMZdOMoR5CBM/R/nKO/1qhH1usfksBEtwYW8W4LKmaz5uz7lBruM8i
         xeco51DiWmZ9h61L2sNkbdIbBimYMhJ+Lg7I2G9whnhflLyhLM81drl+lqXG29/xzY93
         JKQQ==
X-Gm-Message-State: AOJu0Ywb+A5s+2oFVhWL80i84H57h93y0gegTRjrVG4t5DDoiihdQzDd
	DIfm8UjNQE0WN/BfCIE0Ui0pVb8xAuGov4vGckCmZ4XgZhQAJ66Afx9EMZd0LmLhMXi30spd4rN
	947Y/EAd/f0YBYryjA4W7HraW1AJSOzTLxlPcqrva6tC5a/yySteLeNn2qtxq+bIS40fY
X-Gm-Gg: ASbGncuLT7/k3BkN1xWjhL5HrlSkIpdCVcMogYPqjMjvhIjL321EazfGpCJmlnp9MuQ
	1lMiSI6zDI0kQMXu3CZr9dgNYeug4PgOvAc75PdXLH1nuR74ug/YmZs0fIbT67GEInq2iUM7Rd5
	KBNLEfqmETuz3gZHyPCzHkjRUdgYsw5I5+dw4kkqi8MoW/5qw+s0qxod9QeQeMDDJ0sEZx/Tihf
	k3MoCN+mj4Ow2uGKYKoQngXDa/+4VyjS3ZIIkD92ck9n4Xz/9cX/JB5yFb7QIF+3WARKMoOHPbB
	zzbszvC21C56qMVRpiJPxd1W9nmRSkt/8Vow2gYhDxUO2sFihZibUoX09jH3AXj+p01411AQur+
	x4i9jhxMlgyklxcdcEXRa2hlc0WV+32cHkKX0tUCqyvgw8+D0eiUCcldUptb3AbYQ
X-Received: by 2002:a17:90b:3f4b:b0:338:3cea:608e with SMTP id 98e67ed59e1d1-3408309b548mr17530415a91.31.1762221035857;
        Mon, 03 Nov 2025 17:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyansn7mgWcP4IJb3o4e3eOY6gRagfuQjf/6eMbS+UTgq1USmHgRvZurhobqtjJlUa7yjUqw==
X-Received: by 2002:a17:90b:3f4b:b0:338:3cea:608e with SMTP id 98e67ed59e1d1-3408309b548mr17530383a91.31.1762221035316;
        Mon, 03 Nov 2025 17:50:35 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bdc53d8sm363780a91.2.2025.11.03.17.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 17:50:35 -0800 (PST)
Message-ID: <133a1f4a-c578-479b-8906-0a70b8a74947@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 09:50:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251103-add-coresight-nodes-for-sc7280-v1-1-13d503123c07@oss.qualcomm.com>
 <114cb239-d0b8-4db3-8972-77ec3a24825b@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <114cb239-d0b8-4db3-8972-77ec3a24825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxMyBTYWx0ZWRfX+Admy72d1A3m
 q6Cb8GJLp3to1ur5UCHfPNc22ajqK4nJCBwJ8PNa4NaBZBcWHez/R8xt7DLkWM/Mg1RqUzPr7Im
 8Xr6NxEf+4rg7/W3tbBKWQ2uPn+udbggygZJfwkTjtsIzneiIOjwxRxt4rbVhQSf5fqERIFPChS
 JkNOO5l9P4esDYI44+Hu7DY7IeBqCYJZ9mUvADkP4LT/oLrDCCclH700ngdnQ1dPx2EtGTIXFRx
 N5h3sQ5Lk5466H/2cnhm+62sRSZoYH3pUJXHNoxyVtjOsyjqMwJqlWvgCVlSyhZiA2X5Y4s+EpQ
 wNx4Gg9ZYXjDWbiSjLTlGrQ4vEmz+hww27nNy9Zz2WERzj/t7pNMWzz8rjs7X1NYpzdUuHM6O4x
 ig6wEWfLf/KoAYul79FJYkg/MQMENg==
X-Proofpoint-GUID: tW21v3SvrV7Mut4X0Qo_LOtzPk4b7EoO
X-Proofpoint-ORIG-GUID: tW21v3SvrV7Mut4X0Qo_LOtzPk4b7EoO
X-Authority-Analysis: v=2.4 cv=BrSQAIX5 c=1 sm=1 tr=0 ts=69095bec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1GZQbPL2OVBrrJn17Q0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040013



On 11/3/2025 9:15 PM, Konrad Dybcio wrote:
> On 11/3/25 9:35 AM, Jie Gan wrote:
>> Add TPDM, TPDA, CTI and funnel coresight devices for AOSS and QDSS
>> blocks.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 290 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 290 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 3ef61af2ed8a..09aba1645408 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3338,6 +3338,85 @@ stm_out: endpoint {
>>   			};
>>   		};
>>   
>> +		tpda@6004000 {
>> +			compatible = "qcom,coresight-tpda", "arm,primecell";
>> +			reg = <0x0 0x06004000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@1c {
>> +					reg = <28>;
> 
> Please use hex in 'reg' (just like you did in the unit address above)
> 
>> +					qdss_tpda_in28: endpoint {
> 
> and leave a \n between the last property and the following subnodes
> 
> [...]
> 

will fix it.


> 
>> +		cti@6010000 {
>> +			compatible = "arm,coresight-cti", "arm,primecell";
>> +			reg = <0x0 0x06010000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
> 
> I see 15 more CTI instances following this one at a 0x1000 stride,
> followed by a TPIU at 0x06040000.
>

I defined this CTI device solely because it manages debug behaviors for 
STM, ETF, and ETR devices, which are already supported in the upstream 
kernel.

For other CTI devices in QDSS block, they are related to other blocks 
which are not included in current patch. May introduce them in the future.

Thanks,
Jie


> Actually a whole lot more debugging hardware. This patchset looks
> tailored for debugging AOSS< as you briefly mentioned in the commit
> message.
> 
> Would it be beneficial or useful to (perhaps in a separate series)
> extend the support for those?
> 
> FWIW the various register bases and field sizes correspond to what I
> can see in the docs, I can't speak for the port numbers. Please just
> fix up the style issues I mentioned above.
> 
> Konrad


