Return-Path: <linux-arm-msm+bounces-73100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C9B52F9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94B891636AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C14F158874;
	Thu, 11 Sep 2025 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXDI/OXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A2313553
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588954; cv=none; b=YXjVQ/5Z8YlxiR0vfS0l98SQHc0EtUpLqX8lKWq1Sa3xpeeHUzxBff/v/v69gFvrfTbnusvkpR4P22/pOE7DW+JhRqT94qTVzXhJ/yN7kGmkGLcAENkzEl5zPtTpp4S7ohv024ImdTrIXTruD4pqQskTJQNYF4Xp95EKs7GooUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588954; c=relaxed/simple;
	bh=7fiPv+Ac0qIbvN+XJL3bTlw/OXGpfDXTmYhQ6twZ+Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxmZ1l0/LBFhtHlfPCDdiiqDKAZELbd5e7eXlL7yDMj37xr94iIHVMywKfR6OcVquaxE3ENOsnHUMcSQNr0BRP33eg+zTdrIUBqL3SID0gPw+GSa12U/Kv83saQhgguhBzreC+1XSMFH7dirD+zQs4Vd1Xn3Gd4b9e40noMKDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXDI/OXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB11nW031134
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cKGnPVRnMvhgmxQl1m4aIDa5lnkW4kSybxoSBX28WA=; b=KXDI/OXurfeCzfiT
	pAZeGSqZJBWJCYLlkdfjj202SQncUoNlxH6fND3oA6f/3mcSeBnJq9EMn3CSUHfR
	aRl4BsMD1huNlrMBbEDY2wlqDGWbVVTRSOSUfPPkt+714TsomVQNr+bY6+bH/Xhf
	SxjTz35VDGAW+RPVqk/QgDsKpkm36ce/NmjSQ6pNtj4UqlsK3ohwmv+/E2DfAP7v
	RvU3TXjJtkX+qjzVq29VuSyryneEvhAnW8RCj4HtYPsi/ESWzsfoGoXeHxlqO7g/
	beCMrkdCirrihCkYL7k4/U+zBmXL5fyeuwplXIwgEk5rLSxiTE8RQZB7EzBypMOO
	BJWQDg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg74w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2507ae2fa99so12310135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588951; x=1758193751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cKGnPVRnMvhgmxQl1m4aIDa5lnkW4kSybxoSBX28WA=;
        b=ckrmcOflc64rG0BSSK/O3r8hkMcRdmNGjL/+kSESwrkSWRkc0jaK74IrwLTi7LUDGN
         31aabEk4sGmru4tNXVtX7Q6JcN436bIq5T6cl4/w+Xs7j2hRwpDYd2+8y64GpM/Zexsn
         SB5msyAHVLG04/xNHQUoFfbJAgcU4L0jLsJs4m2slX/Mj+Jcai70Cq7tATKXsjj7kFOD
         JWLZAQMHwdmCLYbD/JBS3pOM7X5U3+knd2tz7bmCO0d1+wokFj+hNqaciL+xdGlMOwjG
         fnZDw/H3qocMlSqFVpUYHnFJgygEfkxr1ORrhdVLH9E5AfEk7Lbd4drci7/XR/3rImlR
         NKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeAv5cK2xus1Pzny1Sixiy7B2h/OLUgsq1WOcum4xal4qla4vNIGH1x/CBSfVbJOPG59RrXCconORDMcKS@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4G/SBpeXCefEdQMp1qPo4an4eOVAfF60B7e+NXfNP1iBP77d
	N7DMBq7grCgvxdlKwab0vYfRQOSlGggemi1LI6jCSLwm2vQdRZXil9Jd+jur2WlEqtypqj/GDqf
	sEY6ccJsbv9/rGgVYNYwjRcxAUrJPQ97mwRGBrrlyirXLBXqJ8Tw/7UkNMZ+lJJW67x++
X-Gm-Gg: ASbGncvhRMXA5Q7AkvOMshbciNkB+ygBRzirfhjWXtzfXQQK8SCqSH3GcszBWQ7Vym9
	/PaZXSE2jz808diuvm3/yuP0aDPSzF5Cda6rUVv+VUeCrPcr84RT5c0cTR+moZs8RqwWieJab02
	vD4uecRZLoBK9YC8Z2qBnx4Ud1PoabJN8cl/iu5zupC6XIRXIAv35l89Hs98q+Ij+X4eGoXJ/Gh
	pTuF1I+0dvBLdiUmeCfz7+y6lzyDeXxVdUe6od0zhaQB/NM+eo1RcpsZgIGy/7vwBCfvqWkdq5z
	jJd6MTNWXFt9WHPx4a8miu+fn7p2OUR9UoTyFfJsysq7qur9BpC17SOxtHOrQTAD/mu+45c=
X-Received: by 2002:a17:902:e542:b0:249:c76:76db with SMTP id d9443c01a7336-2516ec71a4amr294330595ad.21.1757588951044;
        Thu, 11 Sep 2025 04:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELV1uqPskHNtD+xDUEWcfJ097HQ6nqqcRjR3sr2x/h9KyHfRA4L6yogbn5XFF3+ZUIVoot1g==
X-Received: by 2002:a17:902:e542:b0:249:c76:76db with SMTP id d9443c01a7336-2516ec71a4amr294330155ad.21.1757588950621;
        Thu, 11 Sep 2025 04:09:10 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6ae8sm16362305ad.15.2025.09.11.04.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:10 -0700 (PDT)
Message-ID: <3894cff3-97e5-4b7f-bccd-9f733c5af874@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JqJ1oD6z7UdGqFCBT07De8Qq7xxvdVir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX3wH4O3aijBsr
 pJARdyxIErr8IHv6z08yiHsNZHchGpcYmIO0yAht5iovYKathHvX/WUvKKBI7sm1YAA6XnGsGL3
 b6/oZULx25gWzCsACMe0HWFEVJPISMGS80vemjFDll0ySeNBTznIyETvz28MwQBdROtgtLzackL
 BUHpcWgaqXeO8vklkBUL0QZqfWbwOs2fV096pLEEyMApzDdKGLotuGD6CTwvq/iJmieqgTfoHhS
 abRmHursjuMzDoNzH/g2uA9JZXMFLbuP7Spf1LQlz94nTW8aBTOt3q8nnny6zbZrMbay7Rp1tJR
 BHoE9TY6Rc4EIcg+8PbJ1szAXMOngSTykAaUx4nsQFv+MOlbHaFLfD+4OWN2mtYbfoyKz59Q/2c
 wvYFahqB
X-Proofpoint-GUID: JqJ1oD6z7UdGqFCBT07De8Qq7xxvdVir
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2add8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

