Return-Path: <linux-arm-msm+bounces-58078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C7AB8AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2CEC7A9078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B6721882B;
	Thu, 15 May 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E99OL5Kk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9420B7FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323531; cv=none; b=WnWhsqzh61XKUeFB7GVGBJNluZKbVwTp3gt0Yk1ZWwbmoFG9WraYVGH0+0amsTJQwySuA5ikrgCFE90sM+UiRVUCoZax2tQVRMj/1yLPopbKq1a3gCuON9xMwIeNzO/3wPE6Z7QO+mgaEPT+K8hPT2qPk8lWtlv0tjjNFLK7qHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323531; c=relaxed/simple;
	bh=YhjkVdXvtRWQPDDaVu+qCIt2CPoR+SqpafwJoDvxh2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elejPluwci/qWLo4wSjVVPrtQ6tCQDeWxvaeYvR4lka+T9q7qO+hUYdh7F33oUOdXqMaYCb59v4XB+esgePQC/8VmDA/V8b7qJKc4rKj2xBsqUgy2ke+EycMhHUi9jplo+8O0++Ieex9dyefXlGX0dI1KyPgzAE/42yhn7qFkAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E99OL5Kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFW9X007950
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=; b=E99OL5KkvoXjEGVA
	dQVWygwR+q35M6qlbHilW5smNXW7p04WezGoOETsCn2zMLv7f80AK2uiUIydRNdo
	E46/DCW1LYSBpX1WH3EOcBTYoFjyiovgv8Sl19I8PQEwf20Zk9GRPYXzWxzsI3Zz
	6pehrAv9RdORg5Y/bHGRi6LlVUSIkdOsF1Z3TCpUJq3LGgUz1BGlSV3NmyOtsJOw
	YCi9B7NB+k0gvJuvXQ6v/qwiPwcDVNTVhYEUOrGAcC0d0eHXKTnE5b9Y3sYtRxiW
	+6qrtH3b61sn9tqgcKCczwbpM/qTEXVAFWwnUQWmOHC3bSmDffCv87oebIPlKwy0
	W7iVXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxp3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:38:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53d5f85c9so24778285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323526; x=1747928326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pdbEuEDP4tcdmm5ZtqXD3QPjEEiKtDhYgXWKQaq6K4=;
        b=UUP15B1xEn+4Y92V4Rq+8YdKxdYQB3ou65trpule3i3s7WzhzKY1Hj37XZOkNrZrsY
         2W9Ytiw8iyBeZ2Yb9U1NEB1kpC3ZrHayZ/iiQkZNyHNxka1RF+Ja5z5FpZLRp9AtWrPh
         wkEmSHbKC2hIZN3dmKrgm5VlbCGKVrOgQjLv/hLqSZbTW1E94+D8cA41M/D+t9eQ+t3q
         jOvhM7BqilMQCU4SP9PBkAA0aEhSGiclGyfI1tTHglaxurBbQwODLXsAHmi8dUF+JWy3
         D5dXQn4VP3kvWWyZEKWe83do05TL1IpCja6XbKejxDDRRewxxobSc4lnHt4K0w8xJP58
         G/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVoUqaSGwhGVbakQ3PjlTwHfGXwEbya9+bT1CDE76jn4zKQqGhYITMtQmD/DyR87UM9wNE0HZX7e9Y/rPE4@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxW9mc4eTYDE3nFO/GgjQCMDSAEgdMI7KROZ9IvoKUDdCJHGy
	Imm/cagTnkRHGwQSTS6QUPB7VdWNe2tVVK3QDJ0o+g4oSLigvozWU/Ktp+KMTh0SoI8B9JZDaFy
	TLJWX5fBcr1Eg7Usm47cJGSDHXnlHZrEEgELgfNOeZo2YI2fiP7sV+BXzB1n8YYEEwmjp
X-Gm-Gg: ASbGnctxGvtdZVG65h7g85DLgniPP71ponbNpWN50fbuBxN8E4KAmsvSvCzHj0IoOAN
	0ljhUhmpXPj8cSzZbmPDb1A9o6MqdDDXp4xg14GnLijkgQd+L7wCHUGgR7imN9y+Yw6ohAop4oZ
	NpzvZgS4Wiuj80xrufes1tg2vTks+bAHF1siNkBje9r6oGgEeY98BIoUkl9bZf9Q62BhGnswK7c
	WPGj5LHNhfVPCXBNYaSXmvRtKtGgfz8kDByQolPXryxgmLsorU42u4gMY+Ejho3WESukW7jcl5Q
	k3mRkOaMrv2OCyyoLxbx23Zm7JmDBiVY7kVEpGnYZUs1+YdcXblBKO2sL7+blMLovQ==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936726d6.7.1747323526123;
        Thu, 15 May 2025 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHv3PeSvVVZHsqNQh1a6BwEeriW62crZna4w75F08uWKfsdhOTODl+xgVRMR+9uF6E3AiEoA==
X-Received: by 2002:a05:6214:2345:b0:6f5:4259:297c with SMTP id 6a1803df08f44-6f8b08cefecmr936596d6.7.1747323525704;
        Thu, 15 May 2025 08:38:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b824sm2851a12.79.2025.05.15.08.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:38:44 -0700 (PDT)
Message-ID: <51947214-47b7-496c-ac26-8185bcda2312@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] clk: qcom: videocc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-8-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MBfac5NhdbN42gZDwL-DsNu6V4Vcuem5
X-Proofpoint-ORIG-GUID: MBfac5NhdbN42gZDwL-DsNu6V4Vcuem5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX6OiDz/FaN5SD
 j/p54udqu+pooeNg5smu7r8CMoYQ2WicEV2h0JQS7eAupFMeHg4Rr5R9HYH1um7KgP6kmrkEFbA
 hqS2HZBNMAovqM0eygoV7zJCbDsvaAOhmqpMW0jmPCNiHxV48FV00/zXge/3R3BbeBVcXnCCwZA
 pT3BmuR0KAFDbl9P3NWnVT9fDc6vkwfFEIxkfOIrvYfgMASsVUzgXnnihTZVMNOyCEF2/hZr1Ej
 TTRFd5Yqi60ixgrvmBVrjTRZKtZXp2kJhxi/wzwr74B23hHgHST+rlX3cdvfqKDgYAN+iAkYRyU
 E2FEyWRktmZYWXNs3iksiOSWTIkEobaJMDBk3TIIOBRpTslrRUYszOa7wnJFtKwbxkAmjobmy7D
 3VU21HewAGyf6hpe3ekJS/ovxMoU3aLM8Q+spqbmZcf0gG4FvScuFtBw2Fy/7OIXeCnGMRie
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68260a86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CXQnK64LRHhqnx0rWp8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8550/SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> -
> -	pm_runtime_put(&pdev->dev);
> +		/* Sleep clock offset changed to 0x8150 on SM8650 */
> +		video_cc_sm8550_critical_cbcrs[2] = 0x8150;
> +	}

Because we tend to sort these by address, this index will likely break
the next time someone touches this

please introduce a separate array for 8650 instead

Konrad

