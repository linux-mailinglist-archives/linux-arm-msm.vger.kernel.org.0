Return-Path: <linux-arm-msm+bounces-68959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26046B246FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778951AA5D4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D972F2F1FFF;
	Wed, 13 Aug 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pexWh4YU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654822777E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080018; cv=none; b=fkc70UoMARNPXobGTvJvRFPjiuIQsljTuz0v0ZXCQmQPTWJbm7YTLmj7kFOKGjxvrcLnSEAnN7k0TTiivQYwFeCf99NHYShbCrYvNkNuZ5XEHEaNPxMKCUjd/FLNSthl2W6RsX0iK/AgGVNEgFRL+95BI+BqLChKFjbCIaR19kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080018; c=relaxed/simple;
	bh=TeUkMHfTuCG2iJH0m8fg4E5rdY8SDzutonFSWF70e9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktOQs7dTiVBoCqnsUaiiZ9bX+DEj5x8nuCqu178PKJQQi9KLcC06dJl/gT5Fyb2dhgT1hU5/NgvkGJhFjdoKxq8WV5ydii4A1owU6WHVbQU0/M0TARDQlJh0X5abYy0xTuWPYl8s3yBdtC61woj5u6WDZRMxg7BmhtTI+cLt9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pexWh4YU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mLjw026024
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mAuvM//7ab8lA7nfM3nsq80Jt7uf9DvaJ1yiWgh/Pc=; b=pexWh4YUuah5KumH
	B2c+f5QsjfPxnqUKQKZ5BeWwH0dVmP+4OHHXZJMOld9kKbCRVrQAIipwJpu9oXLV
	/e/cv/ISsk6YO0IPccz8zZmOie8pFNqCCh6Twe6KgSiP6Td5OjhqU9HXT8GUeaRH
	pRhPNlJC63XmZxZX+MzQemi8Hwkq6/gdRU8pq6XDb87uizcMgAFzMT713MldcH9F
	zrhCY+ruQLG4FREn4yKSDOV7C4N305OBllk5VVdzHamp1coWXYraeKzrsIyk00vf
	olAEPc1LR1bSd7lie4Ccq28iEnl66x3wIs/Ldb6zV2iW2m6O78sWo7pAjF7usoZ4
	7vyFbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sukty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:13:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b071271e3eso16738991cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755080015; x=1755684815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mAuvM//7ab8lA7nfM3nsq80Jt7uf9DvaJ1yiWgh/Pc=;
        b=PXj1gN40I6soz63d6WvuhfzapoktOpsELKneRefoc0cObt+PBN6mpxNJYdwDdWfgjz
         ICHqDlwxS9AQ2xr6xQ6jKtJ5QVhI6T77sUZbqrYgfkM07egOuyXTesA7xKcollpw4MlR
         eJVsmnt/8SaXlurEUDaK5XFLuqU2ytSTwcQxxyo+bsHo8HW8XGIYffMSyTq5N8Ckpp8B
         EQLJ2HtFc5+1n4gRRth5YsPdWPjKCrv1rbZYb+/srJ+OWIDl4u4emw4szTF/5TasB4P6
         5yhZv4A+oFh6Q6TwhnwGRes7acQIaP1+1tetjfWGj9Lr9LYgXgs1UmRC6YuDQRXnc40J
         YCxw==
X-Forwarded-Encrypted: i=1; AJvYcCWtf3l8bN4p/yfphfvnUrfTR/yl/w3a7vheNyGHpgmyK094gsiUcaoctUL+t63NHwgJ75sdp8pp4V7Wxxu+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzmi/VZHbNraXF5Ia8cJPCcTTQlmQl2KiiLk5eDrGAnqAfnvw9
	fqSyc3veiLj691z2C4AKxCYn9kxhWwoiT9tyx+G/Bwa2fOI57fiXXAFgrXcj9KGLqXeIjDiJTvF
	5uueqEWCclwByOIsly4fxR7gJSrnC0PfT2zTCEH75iEN3+AeJQ2/0rQuhwT64Cz/lxcZZ
X-Gm-Gg: ASbGncvLyM4eEH/wQjgSytBChsQl5CsyqIHS0tFV+hSp9OZkbI0TusFMFQkej942XgX
	kDoD8J8gDWUnNJu5TqvT2bR03trrli5+pgV3Gn3njQOlTqPsMUpz4/Xcz8c3QgL/4JZUlJUf1l7
	eMJ8aqhvB9CAeCTOZd0rbqhY2Z2r2w4m7Z/JWyWyxXUfSpdLi0zBkpsCHiu7C+4+4BbVyNAK6fY
	l8FPxyNbgFfUsyaTFR7asSbntqY3ub78ES2VetvIxDLopU5NR9R6B+sObvkv+kYmMhPfxhDysxk
	FUu6NLijJeL/1QpkeaovrSxMlA8k8k1crQcFts0MrLRMwqgRd4UrvMdLSUtC7bHQibX4v9AdWIm
	OTpTwWmfU2zb8F+nbaw==
X-Received: by 2002:a05:620a:2801:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8652e83d9mr189378885a.8.1755080015050;
        Wed, 13 Aug 2025 03:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnL0n2N5ORj4M8S76HtYx3BJiaVcRjdcE5RNKKoer3iqg7jRZChmT8jDI6T4L702H2p7nUmA==
X-Received: by 2002:a05:620a:2801:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8652e83d9mr189376885a.8.1755080014463;
        Wed, 13 Aug 2025 03:13:34 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm2374258966b.86.2025.08.13.03.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:13:33 -0700 (PDT)
Message-ID: <f44beed6-72c3-4e86-834b-ac522c786bc7@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:13:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Fix PHY initialization when powered
 down by firmware
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Wenbin Yao <quic_wenbyao@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c6550 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=t-ghYzj4duJAONndmXwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hsJAGvdscUzT0W8Ibjfn7SwAeQoCwe5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX3jiE9l0B6XCi
 pPwPavwFG5+oUrrdaLIAxNO2ypaYE//C0m99IOd9JZAISAQy8MdkyGskcTBgm6LvkZYk/Gg6hLE
 p/IFhGpVCzXUSwjYmA/PNMA0zGMFLSs7MbcgTnt+mhDYL+IX1xGuuhfdF8fggX0Lr3uRdaA+Ona
 hAYaVXxStPllP5jpKtKxwYfqmaGgCh4P2gga2/M5/Ll0fKXHAwHaxhzMp5nJzSQO587wqX/lQ3Z
 4fvAxK/IhLQqezkRZvuU4XPlB7LSDlPU+qqAddiysOjazlZv+wZiM4Iu3Ni00k00VeFI+KUVblF
 /97ofHOB3s66nA8r8nv0tBzehFyzA6WwLCLdCI3Mkt4dOBFjtlOP9U5RYgWxfU7Up3L6+xZFjQe
 qnTfrclt
X-Proofpoint-GUID: hsJAGvdscUzT0W8Ibjfn7SwAeQoCwe5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On 8/12/25 6:30 PM, Stephan Gerhold wrote:
> Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
> support") added support for using the "no_csr" reset to skip configuration
> of the PHY if the init sequence was already applied by the boot firmware.
> The expectation is that the PHY is only turned on/off by using the "no_csr"
> reset, instead of powering it down and re-programming it after a full
> reset.
> 
> The boot firmware on X1E does not fully conform to this expectation: If the
> PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
> firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
> register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
> the PHY is already initialized and skips the configuration/power up
> sequence. The PHY won't come up again without clearing the
> QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:
> 
>   qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
>   phy phy-1be0000.phy.0: phy poweron failed --> -110
>   qcom-pcie 1bd0000.pcie: cannot initialize host
>   qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110
> 
> This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
> is inserted for PCIe3.
> 
> Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
> to QPHY_START_CTRL. If the PHY is powered down with the register, it
> doesn't conform to the expectations for using the "no_csr" reset, so we
> fully re-initialize with the normal reset sequence.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..6a469a8f5ae7eba6e4d1d702efaae1c658c4321e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4339,10 +4339,12 @@ static int qmp_pcie_init(struct phy *phy)
>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs = qmp->pcs;
> -	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>  	int ret;
>  
> -	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> +	qmp->skip_init = qmp->nocsr_reset &&
> +		readl(pcs + cfg->regs[QPHY_START_CTRL]) &&
> +		readl(pcs + cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]);

I think it would be good to ensure the value matches platform config
expectations, i.e. !(val & cfg->pwrdn_ctrl)

Konrad

