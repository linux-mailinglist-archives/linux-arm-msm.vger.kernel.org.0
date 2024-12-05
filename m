Return-Path: <linux-arm-msm+bounces-40555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA49E5B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70BAA287261
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292F81DD87C;
	Thu,  5 Dec 2024 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjfHJBMF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B518BC1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416310; cv=none; b=MiqrKemXkWCJxeIvkFW+5vz6uP64CgxbK17XqR1l5A+wVWP27PdRzzk37giO1M+b4zT7/myppwEpXD6oCQQmVFrzJnqOiovvaGnvvU61r0ZWahzshmLYnjiZUntg3ZIIB/D7TwWZYoml1wkCyNe+twbea0Q3Zo+li8gptGCsan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416310; c=relaxed/simple;
	bh=J3ESyanQrh2f4eFh3WJ4pYGGoFIoFUQGqxlSoVenKuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/s1IYGxCt3h9rg50vmAaYqCKpNvrEsSF7d1OVa/+PNZ0/SPiPyxY86noGTqnWVMoqdA9M8WL5ZvmbE79+CZiENANPyYU4H8+2ZXjRqu7STjDSAf//XzdLfyBnvD5Ule8qZ2/WyG4352UNZHL7gi50i3ZN5ulkeAN5iM1n5ZHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjfHJBMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Bt3gl026672
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OO3PETOsyEKUmVhcQ82jscTslmU61XklmW+TguqESPQ=; b=CjfHJBMFUQDYgcWu
	dbdvJhA6QcbkojJBpqdlxbcG+BycUGL7rRj43yoUCi6vDh00vJKL9XRAOee2eC10
	BPJR2HAqaKPhTs7frhroVh9U6rj1WjLex2T2JIEU/pHHb9xd10swNo5Ad2yb1dzN
	NPbEH23Ea8Im7ne+nGwkMTIQlLQwU1rZiB+veQPTFP8MLgGxtHZ1habswNJPInHm
	D7d6QPcey63fWlyzxpEsWEZFu7CoVzFxyUGF2VhEWW059Fsht55IlffnqDyTVrld
	n/C13IbvcNqzEFZjKDRzZ1jQvtReP8odynHXyYnt3zqtZTTsSiW+ahJ/DUrRLLEk
	bfIXmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm0rer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:31:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668a6d41a5so3061981cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416306; x=1734021106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OO3PETOsyEKUmVhcQ82jscTslmU61XklmW+TguqESPQ=;
        b=MQ7mwBUnfQJiYyH3+iljuvBwxD8FGRGE3zx+NR9LhR7lfbn1lknhrPx7Y/GoIRwxRN
         3f76xJjzmVMbL1vyz9+AEkBK6bhuUZ6oQbBYEg+847zDD4IU461cKyvUXtKKYGLQWucb
         ZdVDnZGUCbpR34D9WgMux2tz7CoWmittbHSOa6RCNvmAVj+0UjlFAINjzK0ec3F28q1F
         ZesqcATAeM6sUbAZjkIT9agsEyFvAHN1MrkNMy3UWoEWkCXp/tB+XGArl4zl1PG+9+SS
         VxcA3vrpB2A6ZItmRQy8oGkpsW60alw+ijwnZxi2u52qVMNGLw2YzMq2jlrCRPEvzDrn
         TR6g==
X-Gm-Message-State: AOJu0Ywu4vbArV0raQ0XzlQ/Nubd4doAByhLOZYDwPFpxGoLf/v1H+lx
	8UM4WsJNMP7aSujMEp3+YhvvGxl3XJi71vV9ldPREobu4fJLzeJRvhFrqnI/BhSRzv9uwdAapas
	mziYxRrp/YE9eak2dUHfHXNcd1PuUJOHr5jByGjJ7fB9yyE92EmwKo3URhb2sU2/V
X-Gm-Gg: ASbGncu9JFkCKOU+eI3h2XRL6R0FdrNlqK0ZBAhHCmiljYV7qcT1WwMIbaiiqjhYbzZ
	3YnasRL0hLcM8D/TOQk3BeJ4YTM6bCw8nCTwKM12PFDFNPnUW+pw2KEURDSX8r+0zuhYDL+y/mp
	W35jntUu2FRGybyTwBEUCoTPgoqLZZGcKiCIcX27VqfjQ6Ij505MrrG1z7CZBb46o76A+TJzxjS
	sIdVztOlJmQwXiQQ0LGoKPwGXzEaz+kVN8G+pkjbs0bP5tZFnGSSQ0fADVtJFy5+occgF34neYk
	+hWNIgUvA7Vj2U2R1pTPVu7SgpoFOyU=
X-Received: by 2002:a05:620a:46aa:b0:7af:cd2f:fc16 with SMTP id af79cd13be357-7b6a6ac4315mr640243185a.0.1733416306260;
        Thu, 05 Dec 2024 08:31:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn4mO82urP0n6y4ICtJcZOXowWIRkawjXqvzOlQIsjvcyJPdkawu57/eeRUH0GNZ13RwBadA==
X-Received: by 2002:a05:620a:46aa:b0:7af:cd2f:fc16 with SMTP id af79cd13be357-7b6a6ac4315mr640240785a.0.1733416305903;
        Thu, 05 Dec 2024 08:31:45 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dc68sm115325466b.23.2024.12.05.08.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:31:45 -0800 (PST)
Message-ID: <783bda0f-5d51-43e2-8923-a01577a4296d@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:31:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: qmp-pcie: add current load vote/devote for
 PCIe PHY
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-3-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204105249.3544114-3-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7o3cjgJsSjm9AxvlFE6WjTHKkbdcWXwj
X-Proofpoint-ORIG-GUID: 7o3cjgJsSjm9AxvlFE6WjTHKkbdcWXwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050119

On 4.12.2024 11:52 AM, Ziyue Zhang wrote:
> On some platform (eg.qcs615), the current that phy consumes will exceed
> the maximum current the regulator can provide in LPM mode, leading to
> over current protection and system boot up stuck. Fix this issue by
> setting regulator load to an expected value getting from phy device tree
> node during init so that the regulator can scale up to HPM to allow a
> larger current load.
> This change will also set load to zero during deinit to let regulator
> scale down to LPM mode to reduce itself's power consumptionif PCIe
> suspend.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 35 ++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index c8e39c147ba4..782d51ab5cf1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -39,6 +39,7 @@
>  #include "phy-qcom-qmp-pcie-qhp.h"
>  
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
> +#define MAX_PROP_SIZE		   32
>  
>  /* set of registers with offsets different per-PHY */
>  enum qphy_reg_layout {
> @@ -2905,6 +2906,7 @@ struct qmp_pcie {
>  	struct reset_control_bulk_data *resets;
>  	struct reset_control *nocsr_reset;
>  	struct regulator_bulk_data *vregs;
> +	u32 *max_current_load;
>  
>  	struct phy *phy;
>  	int mode;
> @@ -4087,6 +4089,17 @@ static int qmp_pcie_init(struct phy *phy)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	int ret;
>  
> +	for (int i = 0; i < cfg->num_vregs; i++) {
> +		if (qmp->max_current_load[i]) {
> +			ret = regulator_set_load(qmp->vregs[i].consumer, qmp->max_current_load[i]);

I think it's better if we just put this info in the driver, like with
e.g. the DSI PHY

Konrad

