Return-Path: <linux-arm-msm+bounces-58872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75500ABF04A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1333A4106
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F59253949;
	Wed, 21 May 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ESC9Cv4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6023506E;
	Wed, 21 May 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820639; cv=none; b=EivzCTP+oqtDyZrGi3MhGjFcPPGhzhxyLrX+k/42LwKpGSkq6zHyTiZbwI6oxnS3APiREntYuQCEV/3mtBk+4vdMjFHb9yiPa134al8oMDlZc6oVaphFEa91mo6BJwLA30qW4zE/8uLqI6aW8GVTCDl3XGwQj025V8BjXM9QiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820639; c=relaxed/simple;
	bh=tuHl5t4vJ4EbREWl6S4WyqZhn/Kf5J3AvUUP9S78vfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dX642U2Z/wPLxvzURaxmRPh+sR67ArozDydeWCUZr8RsD4t7MJgc1ZR6v5FlKYLrJ4SHLYd6GIkZYChu4BRnV4kO8hwWgxNyg2l6ioU4KXPWkx/SbPZIiDzH+H0dOdtAOOwegrKsmeZhApUNqXWxI70muVhMdV34wuH174pwTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ESC9Cv4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XncD016898;
	Wed, 21 May 2025 09:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocjMu4gZswK+gWTtxB60YVC7ABbXC38czOqSiJwXE0s=; b=ESC9Cv4KP47kRPKU
	w5YbjzEsX2BnBtoyDvANVvXIfL5lHTTazzwYWEEoncZ2VGA+TTUBexr+o+8qvaBX
	ASwK/9MzT8MZ3UB+9HT/ceM7C0/HStQCqpS3YGrpXjIUsRTmyECVb9p2uRPwQRnX
	fP9rPS04F8HmNfqUixvOFSY+VTx1aIyOGi4DzeWZhNsffz17IR2ojG+x0MUncSIE
	CEx3FW+h6JQ+hM6wNrKQKZUayw3ldsI8UJ1+TncYAIoYJOpFkPI1CEgB8bR/3lCo
	IZKrbAF13Jw3z3rimEomEqbG3399Q+5YH00sR+kVrQCW3JVSx5ZXT2/rzWfM19kd
	FDpoZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9tehc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:43:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L9hbGn003603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 09:43:37 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 02:43:31 -0700
Message-ID: <25bcfc38-8753-4d7b-a530-a7d0dd69e488@quicinc.com>
Date: Wed, 21 May 2025 15:13:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-6-571c63297d01@quicinc.com>
 <37aeea50-e149-44bc-87a8-9095afe29d42@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <37aeea50-e149-44bc-87a8-9095afe29d42@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682da054 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=gLr6p6iD9n7nESwY9tkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uXrPZITWTe0OVykO1Qc5nU5DOjWmHF8k
X-Proofpoint-GUID: uXrPZITWTe0OVykO1Qc5nU5DOjWmHF8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5NiBTYWx0ZWRfX5g2V/OEESkIN
 DbqoeHRLu7GlUAzv/PJ3ZjAhDlgMCupYP/SMEn4xh2ak8XgYiI1GYBS3xy4D05/L0NoHrok2kjl
 zoavICqgA+0yV80xGEPWIjfSYXgsEQQg0lr/FWAddr26mv8jZiAT+sdwVckFbhkjRrYBCW+m34Q
 Kn7u+zo+TC3TFATGtCvKSNOAXS+BU+XI6wXaWKcQNhdq169gtd2JwkTMqDxs/luGU7mz1pPDUmJ
 3ED94Iwwe6VTMhvfd2bEu9fUfDniijVXeSPNZOmn2X572DIG15eLS1rh1R+ZPvJ19ZLiwel6m6m
 zGTngTuoIkARaAPdweslLPqxcYMAfMJMR+IRxDgZ4YXZqrN051JNFD90TU3psOyW4qJ5uoSOmKn
 2RkAlBM/4fGJrnUHmOQ3siQK3xX1iYGRy+2KFIpxFDZWUNyQRz8QVR7CTjSl1g3X+qWXfP40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210096



On 5/15/2025 12:04 PM, Bryan O'Donoghue wrote:
> On 14/05/2025 20:08, Jagadeesh Kona wrote:
>> +        if (!pll->config || !pll->regs) {
>> +            pr_err("%s: missing pll config or regs\n", init->name);
>> +            continue;
>> +        }
> 
> If you are printing error, why aren't you returning error ?
> 
> I understand that it probably makes platform bringup easier if we print instead of error here.
> 
> I think this should be a failure case with a -EINVAL or some other indicator you prefer.
> 
> Assuming you amend to return an error you may add my
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Sure, will check and return error in case of failure in next series

Thanks,
Jagadeesh

