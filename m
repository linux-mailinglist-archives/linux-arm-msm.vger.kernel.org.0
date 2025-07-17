Return-Path: <linux-arm-msm+bounces-65550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE7B095D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB0E15A155D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B337122541B;
	Thu, 17 Jul 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhQhQ2ET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59970223DC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784929; cv=none; b=m5yM3rP1gLL3da3ICrseeV3vXYSO9tVIHC9mOiHw938PGkx35yhYzaKk50AOMr6eiV4WcK78ThgCWPk4p9pY9c668P5aIcRK4mcZkOrT0lrSC3OuaToh6DK7tUGn1X8iA4QRHwvmGvVh90hOXGQlEkwZbHTNd6zUsNFd5/JK9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784929; c=relaxed/simple;
	bh=rNJhrVaOXBgN447nIGb70CYE7BeWUHH6Lro6HxrOsrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSql7fBpmGsO88+Pn51OJK390UODrlAmSaAwq0L4+NGFnM2kXDAENcinf7GOLhnfU5B3L+dvO83CO+nBPG8cAjIIhMwNc8Mrh5831aNbwG0RGYm3MFFH0n/D18avhlZx3GPBZ00fGRl6znLaJUFrHZ+9rD/oHnOQep0CnbR8djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhQhQ2ET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCOkTY015738
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=; b=FhQhQ2ETqrCc2+y4
	HFVwT1131Db7D+9s4XwC3oIlNrsScBTDWs9VTASF3EX4t8uZ/yISjsuRGBcRa6zs
	qy+oi3CA1Zwn23UH1vLa5d05L56n8CaVyfCMD3kLvjnVJErJSBm5RiislTStFI8M
	7Vph2rnsQTY8rU1WGJ6uY4zUNnBFZqf/brojlUeokI7DuPmEi9S+xR5ETye+2F/D
	ZbvqLezI2i+Yfld1A5Qwh45Osx5U3+wKekfrnR3kgA7L8UbvYxTirWo19hrWXIAB
	ZW0Uf2kPXZck9qz4j/rdpS+s2XL/alH5pw2VDRAU82BsZcE2mBR+VawUaxsvhbrW
	8VRfRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyv420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:42:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab716c33cdso5551151cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784926; x=1753389726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=;
        b=J/ETcDevwf5dEJTsrEqLcRgXzNZ+CWagEsDyxpAezbNnWZVFZiYtExq/+y5HqCcrrV
         /cHFhCTSbbdWxjLKmtu8Ijv4onWGdPPp9z7fJ7yyA3WeN/euv3NgPM7rO31tQZvawbt0
         rERFBIDud7pTymaHl6/VaArl2Ic7YmC8AwZWLm17Mk/3yeRGiBa8PTHp50OVSsnOB+jy
         YUjJ2WjZX44FEJ8NHAyRyNHbo55Lo7j4lrF0lO1NIU7/ffopn5NYa/z7tRPv/y4d2ryC
         hiP4XeE6+rGbhQZZzWhPA9ZihkufMI+sEyGOZZ+HJEsakgxtSqcyOk/dZWIGRCrf6DVC
         LZDw==
X-Gm-Message-State: AOJu0Yx0gVZ+1swvklyWRHr6+zzJABtIJdhBUV/wtCLclrX5XiMuESGK
	IJppxi1chNulntEkPoGTKG+cUPTBheYK6atwj0lz1lueJFV1uiLPMbr5MIvyg14ONG5qZTLMnBL
	CWMBbfvEQfzbRM0Wmy1lyMSaJ00BH22KqHkx27QUrbTDzDCLvBPw7sRzd9GkufkASGIqm
X-Gm-Gg: ASbGncs7UFPklQFWrTCe7WS3dYz4K0KNK8H4cIK47jJXr58ZYs689N5mm0reEN082mz
	iuB8iIfV0bWI3DLg9AKM6b/Vpqd8Nq2eQFQN79kYirs6yzQX3KqIRhJen9xPdVgI0XkFF23QPll
	cNyt91qj6tifwGMEUAyKj04U1v6uXVCPPWLPGeViRwDliyDmNeFDuicQ1/5KVFU//n6el+w/Gm2
	4xQXmbvE58sofNPtHAs0gp5B9oMP5hpN5p890c0MzKE7+7rUD0jx27ZovBQPs8o+9sek9cmJ9iJ
	DFBE8Y7Ufmj2W7QOr7/dkf5qaSkZuhlHqiG2QXoXsVdZupdoSLahqv0+1S917s2Tt9fg/s+nArm
	NVjm0n7fGqCSzb19sEXqv
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55030191cf.7.1752784926050;
        Thu, 17 Jul 2025 13:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRWAhwxvL0YQ5lOLx3J9S62rBalvJHOr8MWbHqXNprUdHSqk24MYX4tdyqOdn3P7ha6yUnvQ==
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55029901cf.7.1752784925586;
        Thu, 17 Jul 2025 13:42:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d04d8347sm10357916a12.42.2025.07.17.13.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:42:04 -0700 (PDT)
Message-ID: <193de865-980d-4fd7-9c43-39ae387a5d0b@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] clock: qcom: gcc-ipq5424: Add gpll0_out_aux
 clock
To: Luo Jie <quic_luoj@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2yza4NocSiOjjN7mDlf0Fbnul8osJ_Oh
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6879601f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qx8TOUd7-QwhcYYS848A:9
 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MiBTYWx0ZWRfX/T/UP0moAgl+
 62X7l1hCGcsvc1iZDvUwEhTjd+9Ng2wcSt8bYkIyoBbRhVL3aKfrC0IezpeYGPM4MLgJT1fY1xL
 L6ZJnHXmuhjureawhTFHkaUgj7fGtmyL7oQlsAMBSMyz7lLjOi4l4gne8s0qrhm7Ixtz5nhRhs/
 n98fdZ7lEDZCEAPUFKFNtF33rAf47rD4B9YfpZz+MEM+EEZwZSkavqCK5Mb/8ZLhGYEZVuiuF6c
 a12muBQSCRbbxna+8C5HWmCuagKwOproXUd1qYt8ARYB3uPEoe6qVKhm0Jfl4MOxQ5B3xxIIkIS
 1eBAcXjXRgGNDX5rg7DiY7XwJqueSjEfaL2ZCBb4uDsdtxp6usdliBnFhYWxONj8v8ORWjI61Bh
 en+QLRaK2ssk054hI487raxqhVBO2tLZS8oqhDAX0hCyge4gDemmG+Uof23eESrPGKmWqQOO
X-Proofpoint-GUID: 2yza4NocSiOjjN7mDlf0Fbnul8osJ_Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=939
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170182

On 7/10/25 2:28 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

nit: subject: "clock:" -> "clk:" to match the other commits to this
subsystem

Konrad

