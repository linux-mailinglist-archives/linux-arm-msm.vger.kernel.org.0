Return-Path: <linux-arm-msm+bounces-78689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9FC04C23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F7A9358EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF32E8B79;
	Fri, 24 Oct 2025 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzdvsgVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058A2E8894
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291537; cv=none; b=Y4gUxRQC6iw/uM6gfQYUFAm2XblXUSVf+YcamLggcO0xtURyjh175IDh9NUBk9T+WMc6Gk6d5ExP3QdXkiuubgVsLaFWkSiU2SrSCvNudvYYdmg/RXH+91urjsSl+eVrn4xQztUe8gw2kf+dCLF8gCpHQKq+MEGB7YYU6UZT2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291537; c=relaxed/simple;
	bh=tiNmurCsXGm9dhg4Nmmt2OTRfw3heIDQmN8jUvQXTjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8dVXt51Cr9nxabr4W8pEBe7eYC1efpK5/vzgls7PfLJcFf0vHY2oqSaRZDMjPjmmEmNRtA6V5FqvBfHUqLez0eY+awY8r8S2hMKMRhyr+kOU9SqllJmz1PvOwmrokQrxCOVOaR93+qNPAKfRTSq8BJ5pMAxoZNFeiCEbjZB4oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzdvsgVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FPBj021505
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	my9U8pjQuu0h+9sW6zK2VocRF7KfxfmwPaDP0afFg+o=; b=OzdvsgVchTe29L02
	nCG2o2z+NqzjZo7AT2grwO7uVBpNicYdIr6JNq0gKWrQ5MN7MYJfZBdmk00NlZGZ
	G/qtOM89jw/J7B3F7/t//ES5D0hmixHqxezUR1Jk3cdt1O5lbjDaflKGK8nkoAuR
	qEc86dMRQ+otEV43KgBx6SUzTSFcjnExTJpJBSyVVeEX9KO52KpFBpCjHW5EguFP
	6GRlrlTYrDb4eEeWG7kognhvc0+D1d5Gge+2jpCM3HqsP0hY0Xjhdsp6TK+E/4FZ
	j0jLQW1D//iriR3Ua85RSaK2KVmbINi0AQ/tgJvejwSw/qZA0U5pSXMcdVs9bio+
	Smft3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8b67v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:38:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-873eac0465eso5917506d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291533; x=1761896333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=my9U8pjQuu0h+9sW6zK2VocRF7KfxfmwPaDP0afFg+o=;
        b=KDIyDDXZCwPwjml+H6JxI6sFf1+OqXsby5LSTXwhqvj047BjhMw2bJVDyZxV+m3Mx/
         Q1WHFSvUT18FNZ0Pzq9T23zCNPMJOqPkmEhrqzWMbPr/hwEiLrcvf6lZxW8Gz2StfmF4
         b06wPbOnBwA1h2x6i1JmOvsHJC0vHQCPmoKmzWuM689ilx4lOCnoP11dCjfIJQ9w+IcL
         jD0oNNkeKWpaWtasVAtqCBhNaqYlrKI6P4zy6C914svG5hv+buAUSsftqMR3MsXIbO24
         i0u656TrkoA5hN67Kuj6xYv/J/JJN+sPV8Kuy1hazdURmVrx95b62ZTkRziM1MW2iKAQ
         VIYw==
X-Gm-Message-State: AOJu0YygDv8EmuYgi7ZYC0bSyqYhr/YE0ZxgaR7FvJzy4Kt9X/sdNbAv
	ZtJhsSptyXFHz4Z6bteUR4JRkKfTpafqe9UUlNZNacNidxSnaciV/HrbaZhqfvOwFF8GODJqQxN
	mOxqu4doGW9ARoTMnuejttiRaQbDlNLz1pzw11s8nC6/dKrf37qZyLxKwpzCpW0f/738v
X-Gm-Gg: ASbGncutX0Oy7ShkpPAO0prnmktLX7tJ60XHNrhAsaLXtHxQQ23J/S11K/r3CcJ1alr
	ng98DU43K+OuzDARF5PPQja8Q8XzpxgAG57LcF4SXM8vn2pPmm3UaHo/omQEIzL6FTEmO/UNKNJ
	uQ4Y64micNq0on5YMKVAXSF/mg+Fno4nqtm2wIbSxJ6HqZ9v4QUEKWkBWrRYgqLzbywHjkh0+Go
	bUR0xVfyUohR7g1SLxzaUar3Vtwps5rs4x3vx3cEQMGXICjSIvIenGZhdpATV8QyyOW7dTqKmr/
	YpqlNuqeJbegxRfZici3bMGgOt7MqkUFg7MlJcxadRPdlgDmRR7K1CjELTLYvH+sDN95Qbu/EIV
	P0tOkto7Cn5amHCCaOtU7sJMpMobdArYIXPbC6ZD0VsPnyzByEu7ufM7N
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr116823981cf.4.1761291533352;
        Fri, 24 Oct 2025 00:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlDjQFfq5XQ4d+OpUPfjbFEog9jtTsbbodJUg2QOMqaxjucQIj/Y18kJ9TgRfYF9ST9aSbg==
X-Received: by 2002:ac8:5a05:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ea116d889bmr116823831cf.4.1761291532813;
        Fri, 24 Oct 2025 00:38:52 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d727b4338sm105457166b.52.2025.10.24.00.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:38:52 -0700 (PDT)
Message-ID: <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX48yZfHICbFNN
 k+SVi2f6Wta99UMewLTYmk+OWnBNn6LSld3CFvrMkU9cFT1DXipFdC/mDjT19vsMT58G+o3KI9O
 RJF97T9FTawitsYZS+MVnTPNTdV/uJGKcn2Zymwvf78y2PcwV60lx8GHcYAWc2Kiu3iu79B+woZ
 aY+9nJ36YzaDpLTl+UHp2z/jjlYeK6bpGoHlG/9k3UdU4OAzCdRW6dBQEl2X3gf5K5bh67C5TCi
 CeGgI/XPoP1boxd0IZR31dn4azkCbunta4xt/KusbEDoT0nRl4hB7AzQi1UHDoJOjT8xcWNKMAV
 EGO6Ks2jaLVa6uqGHG9umZrG08wb2paPf0GZYrIFXnoQ4VR2DB2OzMd3qvHEMkpWI3xtaR5Z8Zd
 R9hFWVhUke0qP2xZyUND+kYIsHvhqA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb2d0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X3gyspzaiBKJvtbIpHsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: JZ5PtpQ3pFikz8uLEY_h7U0kSE5I9lwT
X-Proofpoint-ORIG-GUID: JZ5PtpQ3pFikz8uLEY_h7U0kSE5I9lwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/24/25 7:18 AM, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

:(

The subject also needs to be 'gcc': -> 'gcc-qcs615:'

Konrad


