Return-Path: <linux-arm-msm+bounces-62686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAC5AEA602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 21:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B189F1C439FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 19:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAF821348;
	Thu, 26 Jun 2025 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBqPUJvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0B1865EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964428; cv=none; b=fHG2mkhMdNtkWpsfs1SiDt73aomYUyJ5Q4htCaxS6+1SE60a0cAod5exxPQrmSnKjUGnFNVTAtmaHNy6m/LiVRJiHXye3Esu+gXPb1iAva0EeT7WX88iXS3Oze4xvfXImRhbyB0Rpn6I4PmTFOUN6CQOf88Z9PscC5SjEs0jzJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964428; c=relaxed/simple;
	bh=cgW2/0GcD+8/Xjq6KPCjePfx9B2N7GArAsp7JHCiCt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwkNvxiyWOiOhJ41uET8aQUN2mqIsApALIxqOa/ssynDHix3AD+wuYMac9zsV57AK6UsAH1WJ+/nEUrQ+IFpuADbrJZMp4QBf9j4rEGlBQkP1dQ3OlRnrn/6GRyQuHuXn63Df26ORSFuQ5O8I6Z0S76Yofd4Zu0NGqY2Qg8m5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBqPUJvB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QALR4S015328
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SS9xc2aX1hgyRpQbo/UFT04KNBAkslTcigFYKQmcTfE=; b=bBqPUJvBbl3v4dPN
	n/ms21tFLtiAK3US+E/Q7+L4Rkw8JG1n87FdwCx11dcfx7vq9jnzBai/0/m7P1os
	0x8fZHpDx4P+ggY3pQl7reLaB9yLbbw5/WpfwX0T50D4CMj4EOTbD3d0VrGRI9OF
	IyNIQq01umLyjRgsQj4c+UktZNZ0iR971xmz2dWIDD3bUZpGT3kxFG6cADoH/3af
	c0jHpaFSZb6VKc5pwseKL9icwiN+OBWCI0/bGpTWRhIRsMpvMqdfVO3Qhc1fWsJa
	R3ToIL10bz2cFBDaMT4QBYWJw1QPgjfCra03JOoT/WDhM7BLJj2vH74+c1VptqvM
	6P0CJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fe46p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 19:00:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso29239885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964418; x=1751569218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS9xc2aX1hgyRpQbo/UFT04KNBAkslTcigFYKQmcTfE=;
        b=XNOizJLtYl8lozfAfdZiDKn05fN0i6hZnqKcOFBRKUYsfp6NZAXb9xXsvY2UBP14Jl
         rbtJ9oUoETPZ+8DRQE0sdGJDYSGjSpfmrYIYiVrB04P3A9RyM7G/xg4IcsBIQwP22bCO
         hDTZZ2aJcs/hUFzE9HRUNkN+edNkA0iKIBkXI/91irwbVUw/Gs+UnVbwzyKza+5STzHD
         d3SCYX5K9nt3IiuIXzdOaHZD25qA892wnUj//jdSCJ7N7pVmaKWIji6seALjyq8zKHi/
         8eCOqyHcEjDTW9E66QT2uWcP/5SPsanE2BGFfeYSwkWBZn/MEhJ1TETtiLD2eRV7QpQA
         YTqw==
X-Gm-Message-State: AOJu0Yys4gwm6bFoGQ7+kFkn6o58d5ipggqJTmyoHVtK+sLf5kqBW5MG
	9sTF+nRF9P93qcs+UpgVdPSusTTv8ZJN3dSYXCjVYucfSwG2hPRnjSRekmD9f0kthfnXaZbIJGu
	MHrs+vv0qdS1vbQRyQIfZrDIo1xp4Qvr6WGzZL72lKEbLxklDsJsUmjQZZ/SmCyPHx61B
X-Gm-Gg: ASbGncvH6owTe3KILPYn4Y5z7zT24tO28M3bKszw6s4YZ+WTmhJmiLdZe6hLcErw4O0
	P75rcdV9oRqplRH1e96HKWPEGsw6eV5jUchAupDraAcnHilTbT7/OOEpjQ3uU2Dg65LqfxnmC8c
	jvtI/cnvM7XzvjcDQcqr1KdJqBfQVd65Ti1sCli2z5AwSBl4aQtqCKq4inc8aU61jSsYh6y8GhR
	r7bIOkrL16/gCYRadqmaOMEjFj/DSRJ0/djNgOQgfpBq+6gZqfc1yNw1pfUSTAgs4dAthx5BBy+
	X73Y12uTbLyahk8vp30Vct0Io3P0E/niycI6xpUyQFXsr+TnsudsoHs+E0YZlsx1qjzeSl5YcIB
	pqaQ=
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr34019785a.0.1750964417675;
        Thu, 26 Jun 2025 12:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxTq00cRCINqzwitl+zzIt72e0Yn8UwFVvdcPcObxnLLYMaqJZWvj2ssieb4NoIKfzFtvNg==
X-Received: by 2002:a05:620a:4251:b0:7d0:9ded:31e0 with SMTP id af79cd13be357-7d44388a2c1mr34014185a.0.1750964416934;
        Thu, 26 Jun 2025 12:00:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae202026e0fsm41259666b.14.2025.06.26.12.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:00:16 -0700 (PDT)
Message-ID: <78b8a1fb-a584-4547-b6cf-1320d40186f5@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
 <20250625-qcs615-v2-2-0f1899647b36@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-2-0f1899647b36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MiBTYWx0ZWRfXxOith9HPoSIY
 cvCU1FxqRRy5d5CIqL8Hy/0rX59mmaVR/o0sNzbKHxWdW7nCRw3eHDrXSmEBshj8pHwmoutmjua
 8YDfrQvfXSFKawIAAiYCGrhhaFnc5P6ZDWCdmZzAjccvM19B+ChQajpEIlOpNVl0qgpFh88okkk
 x9Cv3lL0/DEAAZzDzSURVm1Vy1pHViWG5l4Agr85aVOxPPKL+nK3W9WT1FtAhrSPSSaPNm+pqWe
 nkLeHCRfOd8k5Rx72uh5VN9Ys89IwytClzsBB/2Jdk+Rh36IuyOjeeJquPSh2wLMg7Jxq8Nty/+
 LtWCcvUxxzj8xXWaDuXAMmCF55S7NRORNmUGmjrS3lRAIh/L4TLLu2SkdxOx7nFFdbH0uZ7RO9P
 LwkoudkASO/441nrVQqVJFln3Q2YKLObi+RP7s4KWMmOvwtcdh0LJsuMMeBTAREutIVWpEs+
X-Proofpoint-ORIG-GUID: Oicnb5W8rWFMKcCMKAoStcVaXXcFHnOW
X-Proofpoint-GUID: Oicnb5W8rWFMKcCMKAoStcVaXXcFHnOW
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d98c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=0ryZ_V9OgMW2RYKJuugA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260162

On 6/25/25 9:55 AM, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615 ride
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> ---

[...]

> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;

You're missing some supplies (in a couple nodes), as the bot pointed out 

[...]

> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "QC_QCS615_Ride";

Use 'qcom,calibration-variant' instead

[...]

>  &tlmm {
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-down;

Please put output properties below bias (for consistency)

Konrad

