Return-Path: <linux-arm-msm+bounces-69869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68220B2D3F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47DA34E1480
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0823F21772D;
	Wed, 20 Aug 2025 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPBJM4Ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83685E555
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670675; cv=none; b=DQ6P5U9pT4WpcanUJgo7gzhGTEgJ/qaXTGjnx+vVPOwBinzGhztTgaFe7o/h9/sX5xyFzFuQ5rSbrFfbu253YhnMJVTBaKlAjCr1iQ1Ak4hVkvvWdmnJrl5XzQ4YTfD9lpnfmUPfGRI7czn+kpjFRrGQOx7JMFgdArIIvq4pGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670675; c=relaxed/simple;
	bh=acxMMGd2x/HKWGU/E/B1l2IvWsTnQwauMXyl3r65/5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1giwvb1ZoNRGvzUmKFOVP2FJTSXik3IsdtAi6NqYc2ecqCO1okbUpC22nfWDYWsHzf8a95oBBUwFg4arEYZozfYNVWwFepsud5Nhn0NOUU+jgJ6qVQ+cKPgfGpyTIPtYCJdokeget6dvOmRdSfuFdTkG2OR5I8+wXSSHijcABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPBJM4Ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pq69022612
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bkq+cHdJt1KbvcxQfB2RcSUjegt/SMBaHSxlr5BbPY=; b=pPBJM4IkUCc7AjW7
	5WE+DTBsliH63oe2SkgY7IWE7ea6YBExexcpAEv4g2cxsh5z440YLP5GHikjCcRH
	sP78jWNxVbTnLOJNOYQJhHFwuLhbrNmWlEN3o4P76SDKg60VgeEDWN+6hfzRN9+R
	UDRivJivIbkejr8DpPcpRM4SK9Pg8fE+qJK7K5VCfy4wXVcBiKqZtni0wlqiGL2H
	Vt8SFuYzPGFv/ikxQrF2ToxtUpmv+bwgfSmXUs7hP5efZA9JD/pJTu7BINgSdaTw
	utACXgdJXiUw6cxSSPQZZ7pnZejbW65wLVwVY8c9qt2Di5ZzuokdOyuGxdn+lOQg
	KyXKCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290kvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:17:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582c20e7so70541955ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670673; x=1756275473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bkq+cHdJt1KbvcxQfB2RcSUjegt/SMBaHSxlr5BbPY=;
        b=axcjuJA+aKeGfKKdzD/GXRzuqKR6r3XamuDxt0TFHYSWjDdgGQWIbJNkvjZtzxQjrr
         OBdpQkU6jJQALcBNjgEAJiFJkY6odlGxwxxtjvuC2IGTcjVawB6nBUSrMIi5c/rA2fMj
         JqIn5EGZsLTE7P4DJyTJjZamLjvXnC4hXvCnhze+CdMB+UP2irwnxp/JXO9wJl0HjJD6
         evgw3VN9z02n5O05OLqO9tqEVckhpkf/FB3MUSxPdvQKWq3UmfQrSeFhjvB4H9JdPcWi
         7B5OVRVR3n5pwADf6HDW7cENO9bu8letSyi8fIafbn1WZp7YTbq4hViN/NVLsypDHAM6
         as3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUPAQg0QBoNl9VkDnQMsmRYrOK2kXXMTnxnmkVHUnX5z/FNqyybdvchdxfIBACU136uXeXICpclDWTGJ5L@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbM0gt/HRmGguVM7P1t+3YTsNgJJltKKhqiTrWCYXBS6eonC0
	EY1z6n2f9agjJiXgeCbpwHsijzv2KDdWe7GFr7UcN8cWhC4hyQ1pe5oyXEgL7G/U8d7o9LBZFeW
	7dG5XEIXE9W3nmFbP8656w41x3r+u+P7zbhyRETC89eQWnvdAodBzkYAeh1FWanD3fQ69
X-Gm-Gg: ASbGncuCR32tev5c8OzBugX232vmKsMjXuQnXQKKtXCtiL1Ryy5Hf29lOEw7vfXrRpY
	PrW1RfQuCqg+1h/wGavUhTeDOx+YV9dOYG05co6YvJLjndFLwI0iMN/nG6QEFm7ecfrC+HEp2sD
	uPonY2riHJm4ATl1fIVi73AbmeUn87eSVddnSx1/wpi1GopulEWJAJ0szZjZfXNwd3ETDMea1i0
	r3f4JJqIjfwbEPC/vOdgdwTNVDfvPDFRdVdm1ibyLLlVJdTEFgXzEa9HLC55DWjAmMRFoTBAVT6
	gwSSYnOxhzR7wkgu14UVisDo/t7YwbV+9NFPlYAnI1efEip+kfH18lSVHkqxJmfkmtb4fydqznd
	jmAAVMmBqcARA4O5zbaNvLfIfLYkEEA==
X-Received: by 2002:a17:902:db11:b0:244:99aa:5484 with SMTP id d9443c01a7336-245ef22750bmr21232755ad.33.1755670672763;
        Tue, 19 Aug 2025 23:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsKwESvuXAmKPzOJGduohtMXI7XkJlUbHq5xijCZfUS3+Y+d26WTnyjnHki+tQuTQXR8vTwA==
X-Received: by 2002:a17:902:db11:b0:244:99aa:5484 with SMTP id d9443c01a7336-245ef22750bmr21232595ad.33.1755670672285;
        Tue, 19 Aug 2025 23:17:52 -0700 (PDT)
Received: from [10.249.96.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8ab7b2dfsm2046761b3a.38.2025.08.19.23.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:17:51 -0700 (PDT)
Message-ID: <33468410-69e5-4144-88e0-cc34a736c0e4@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:17:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
References: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
 <20250819-glymur_pcie5-v1-4-2ea09f83cbb0@oss.qualcomm.com>
 <6zlydkdgmowqg7cv5eeoaf7mrpnhzokyvhh5xasvznqaxnhdji@xol3jiz2lzld>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <wenbin.yao@oss.qualcomm.com>
In-Reply-To: <6zlydkdgmowqg7cv5eeoaf7mrpnhzokyvhh5xasvznqaxnhdji@xol3jiz2lzld>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZQS6FE9VJvTOuXZUsIpLIl3n7wO0cGUv
X-Proofpoint-ORIG-GUID: ZQS6FE9VJvTOuXZUsIpLIl3n7wO0cGUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXycIC642sTo2D
 bDg8BH+ejG3kSTn5W8qKfkHovKoi2Bz2VgVSTAMz3dRrcnGfPJoE9zpgljbM+5JeKZObDlq3R0I
 e96xI+1ceKrP+0GO3RT5b01N9eRzQcwks8poaT5GFioAsCXgXsspU+ycLJ5mpTzzHGnCMBuoj78
 8e9AdeQ6PRm5B4zxaOPZbm79YS3BzDWJzgcnVrOVEF3TrXf4Olz4H3Ham3dazY/6wU8U2NVxt8y
 37d4W58ld4qujQQvfgzrbAfhzNrs5+OWJAkH+kxsruyNwcGszA+qCjzVfRG+7X8itBvQJdsuHMU
 6BqfzG+dIfZR4YMlSN0VOJrpS1Pjkb8YE3QxxmDKMlaVWx4Bta/MgNynBdWTJKhPdkKLKYgYh2O
 M/4+lwaK1KMMN3Ra0RXNmxucRfysxA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a56891 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=sH0VmbEyIx9rPeTW6gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On 8/20/2025 2:43 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 02:52:08AM -0700, Wenbin Yao wrote:
>> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
>>
>> Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.
>>
>> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
>> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..e422cf6932d261074ed3419ed8806e9ed212c26c 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -93,6 +93,12 @@ static const unsigned int pciephy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>>   	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
>>   };
>>   
>> +static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
>> +	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
>> +	[QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
>> +};
>> +
>>   static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
>>   	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
>>   	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
>> @@ -3229,6 +3235,10 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
>>   	.ln_shrd	= 0x8000,
>>   };
>>   
>> +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
>> +	.pcs        = 0x9000,
> Even if the driver uses only PCS regs for 8.50 currently, I'd suggest
> describing the whole picture here. Otherwise it might backfire later, if
> we add offsets for other blocks later and they won't match the ones used
> for Glymur.

OK，will add them.

>
>> +};
>> +
>>   static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>>   	.lanes			= 1,
>>   
>> @@ -4258,6 +4268,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
>>   	.phy_status             = PHYSTATUS_4_20,
>>   };
>>   
>> +static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
>> +	.lanes = 4,
>> +
>> +	.offsets        = &qmp_pcie_offsets_v8_50,
>> +
>> +	.reset_list     = sdm845_pciephy_reset_l,
>> +	.num_resets     = ARRAY_SIZE(sdm845_pciephy_reset_l),
>> +	.vreg_list      = sm8550_qmp_phy_vreg_l,
>> +	.num_vregs      = ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
>> +
>> +	.regs           = pciephy_v8_50_regs_layout,
>> +
>> +	.pwrdn_ctrl     = SW_PWRDN | REFCLK_DRV_DSBL,
>> +	.phy_status     = PHYSTATUS_4_20,
>> +};
>> +
>>   static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -5114,6 +5140,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>>   	}, {
>>   		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
>>   		.data = &qmp_v6_gen4x4_pciephy_cfg,
>> +	}, {
>> +		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
>> +		.data = &glymur_qmp_gen5x4_pciephy_cfg,
>>   	},
>>   	{ },
>>   };
>>
>> -- 
>> 2.34.1
>>
-- 
With best wishes
Wenbin


