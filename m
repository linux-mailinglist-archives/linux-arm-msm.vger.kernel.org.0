Return-Path: <linux-arm-msm+bounces-84431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 518BBCA6F90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CFD31B36EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 09:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7704F315D41;
	Fri,  5 Dec 2025 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hiv7ifi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ3qSePG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF33054E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927802; cv=none; b=TiO0fPMMwKN3IjovVx0t5zD1ZpOrFckPSdrfEz12kZFjQ7hqsGS+hmROCWQPPE5b0q7QeqnpQABvYzOg4IkPRvsQtmVUlPCbuxiJdt93DV+qQbMNbS8u7nQxFCBPxCnqySCbCYj2w41PAmS6VDNKFUHdX1YaNWpZsd7tOfJCMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927802; c=relaxed/simple;
	bh=1Dtjn/s+S6Phy//fdwQyXqaw9wMZ7QcYaRMSJ3fhAbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGbapGK1ke04iCRvKxEu5+UM2YsFreohXk40PnW1Dynn1GLBUQ/4EhxGpUBtInxJGW35idgkKpZQpic5dpoEN5Z/sxIOfodBMSQXY4uhEevedX0eSt9iEMHaTDHxvDJn7k876D7yLWpcFPi78vIQT/0iOptrwKy4HQyW2e5QiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hiv7ifi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ3qSePG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B52ecIh3172933
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 09:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=; b=Hiv7ifi9lGDpNtur
	gq2NlUeAinhoE8WqF2rdgDRthwpdZzK9Rq/sVH5+dhhVrbvNL7ZunBqYxxH+f+pU
	97mRCgoM1EmuMa2Bcc+RBd1D5rD5+AnJGjIN44Gw0fhTd6hh5aLx0bVKm6M7O8Bq
	YqyNPLP4hBlrsNIP0aZ1WT3ZvRzH+qoRWGb8ZW8ay4yWzpiVamW0KbeJpUufnBVV
	2tKr3NcNopQcrOcfqLsNLlCQhs0DV0mTUmI7e3Ni2XuCw+aThxmcYu01jhlHKK70
	Dnjr3fkK0dk5d+IOOOmSxtIBTdFLsgE+xlA8DhaMZpuklslsxbfU0CWghYRxE6X4
	ZVM1NQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auptqs2ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 09:43:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8881eeefd12so4976316d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764927794; x=1765532594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=iQ3qSePGJPXM1OpDctVmQSn8ovN05AY8dSyrluKwBmqQ2pJmRuyZ+zVCqjKtc36pWy
         ocGVdZbyYvigvLQ6M0fSK6t4cPR+36U1gX2jtw4LWB+vT5uc3j7z0iQX7ChJu9WRjX47
         Tj5Bgn8TWVfLzJOcxnpCAVtEMjswv7aVytNT89Pr5XTse/4FPFMC+fUXP+3w/s5YlHOl
         eM3jFlu8idyHv5N3lERXeYIrJNm5PwfCa/+/ARV9GuORW4fnn3UahDfrvXw/YPMQy0L9
         7TtEHHJ5/ixPYfE/Q7C485Z4GlIstdvYA0EFFswDujB0RBGC22Kl2oiStNunnKKn6JL9
         fjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927794; x=1765532594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=wyPgpG1KIg+UnA3AUTaZa6na/BMLZd1C5F7wQfMrqx0m+sQJthU4X2nssnjvcqoWpf
         oe+XXNsfKBMyADtnEaVs7GqrZLDS5nLVOYnOsEUnDvrk27Xdcm8lAsSV56XpAdgT36UP
         kVCtuNHhkm+yI0WhQqyx8XMyewKOrK3Sqy34vH2gA8ghW4aRElOUSKkLxDiagfAqNr1Z
         Wd4nj/HmtCKl65HrtmvVld2vPJxRDFRMnrnAuuzXQ6WQ+ZRDCcuDj7kBQwmGSdRMSD8o
         MDwLO6/XyR0Ykv6khuOFV3sFrnqP6/ZKY/KMssZhuKSkR8RoaJ0YzqhS+nQZMJWk0dAU
         QACA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfi1xsyDYg1WsmuY4PbLk3dnLm5qrGpLQCpJ5kbWuThq/442BfY0cgtaOcef94KRBXzCNUZUtZiQg1rbP@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfQRo7frmTI85mTCwHt0W+VreHXK9Pfh/3phhBkc73EElQ08b
	QKb6T9K8bS5lo6YIeCSwuaty2u3SIAM0XbzaNotIKQ6K0Tn1oVf5R8Xxa9N0psCYvTa/Icq9+MZ
	+NweYle1XVNdQF29xYhbka1FQs53TZlW2Ll8lNBFpw6CNVhiPQCol82gnICyAJMJ6i1cx
X-Gm-Gg: ASbGncvicqODEOi1wDzS580eEn7IUiK1yVobQr6U1ZZWRfbLpG8WBZP4u0SzKH+yig2
	9uAIR7/X9VOFJ5FD+CsabQVMvbHshiRfWuRM6qCNSNqqvF2frJBPTbddyziQj+kI3cYuFkF+uuQ
	Vmy3ECjybIX8QZdyl6OEJEgHnTJwvcWvHSPW72vmG+aolOKFwjjUhhGrIwBK0/++putZZkGgo3m
	K8VHatp3LPpPpzsSed3qyTdEMr+ZqiBNfcWZb3b4QNZbBtAIGaYw739ubjxz3CaaBltbqPXhDlF
	qKI3Y8+1Cwf0e9BW4o7WU7y3VNAB4DGUcmFAur0xLtsgP81B/GMe7gyJgcHJo2QDbGGBGfcTeyI
	xKp2N2C+QbT7wY6MFqOZJ4+mI0hjFLlZhNj6Fn5aucYpGmtFn1tWEgMxZzYOJ3TxEJw==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104391086d6.7.1764927793861;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE00PIHFiV3/tKHkvG/O7NMn8xXqMnCgGo5KoqDYRTk+K+AnVBCSbZOXWXZ68Sp48OzMKygug==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104390936d6.7.1764927793472;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm1350921e87.11.2025.12.05.01.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:43:12 -0800 (PST)
Message-ID: <9af39b45-581b-4e25-8ab9-19015f00d6bc@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:43:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oPeFvdqirzvMAEiAdHfbo4DcIAmOVPK6
X-Proofpoint-ORIG-GUID: oPeFvdqirzvMAEiAdHfbo4DcIAmOVPK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MCBTYWx0ZWRfX4UbwYgX7Ye5r
 NpE7vWOKuI985wmZaWdON31TBJtezgEIE7BZIHcN38lpY9tGVD/Xar134aINp9UmsBY0VPVEgxq
 d67qo1ckKZXlCNZpR9tqpw2sPMMt5AGaUM6KaY150Rg9pzVC1khUyAwuJX3tprCaIADSpwdTv/Q
 3KPcc3KNe8btsRB6JaTIGGcUC71Fk8kvf22IdO1grj3ErFH8qsVMw5uQxagpOuv94y9F4kGyV+U
 0orrpdrYuV7+p/ebTGiwtnIvYjpoOMnWYKagqPYWaaVB//rpg4hig9VTnF6O4i8pb3aockzQ9n+
 baXrSuOqXtERa6V0nRjUyfvWLjXPTtuUe+r8fnZF/7pHssyJPS0YiAtikyr8xz2Vq5YscEisoNa
 w6+hPmKLrI9Msy3Nq/S1wlL9Fss77A==
X-Authority-Analysis: v=2.4 cv=fKQ0HJae c=1 sm=1 tr=0 ts=6932a932 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QkNP4qxLxUHCfFU9Qr0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050070

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>  	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

This field is 1-wide, this would be neater:

if (csid->phy.cphy)
	val |= BIT(CSI2_RX_CFG0_PHY_TYPE_SEL);

Konrad

