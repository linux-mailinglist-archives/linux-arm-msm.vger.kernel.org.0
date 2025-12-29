Return-Path: <linux-arm-msm+bounces-86831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D853CE6A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27AF3008FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBD42D6E76;
	Mon, 29 Dec 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK1uKpa6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sjo5wdwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F32BD5A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010634; cv=none; b=TctL1BXAgV3nNcq7kQzKqfOa61qO3aHXk3OOox3i/ppt7GQoo5zr0xXQeNciX95JKTVojQZsJRymue9DMhBOqatQNZKDwapynfrau81W/gLrjcsnyfcP/8tE3fFCCcrFUaz6sIbwxfZGNOqVIpOjlJbx2Dyh1+IXcSGROniiAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010634; c=relaxed/simple;
	bh=59K1BDOrwc8DN4VEuImzU0+sopoS73fprGxjSI+1Qos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FePTKibRGB4TV5mCBdPcIdx2VdT90TTKr995XAGRkxVL4gNHGxoe/Ec5jDO9Dn5eBNo2b5po3huUpZYLrucdPe0QDhNQWMNgz4NlKejfK7F9XmUGgrad65qSEyY6OotyLv+/rLkrK2LIksTMB0eNHKx4GU2GrhQyQFPSpRJR/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK1uKpa6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sjo5wdwm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAAWmx3233565
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOUwAf42MijL3YJM/xZIFeL0xBoPqmYThITGffes7rw=; b=dK1uKpa66g7C7aa5
	V8sLIEBk5/Il/fRr5Wa8Pd/nPrd1I2GDld3IenNkG9JfmOS/pNVWCdKt3Eqg/z7Q
	QJu5lEu3+JP94QM2ZtQFDNjI0fpgyoqKGWOq9P3UKICBdSLTRR4rhYuTfachUH2n
	QRV4EzXW4JF9813uHFHok6g9OowxWYJUMgwZ1LTRp0Pmy9s69qlZsM2RrhaqxkT6
	s29c5lad/x//rUCL+Oh/PWMKK6BUC/Nc9vNUuUuTuNbbu0lNX+T4gvGQ8KcWCeEU
	t4lMPQbH5dJLhjhi9Ec4DbI9VQaF7vwGmnvZjK0kAfQFEMSsnwC/MmNdkifhAMxk
	ZqAmCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6c71a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:17:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34b9ab702so23637871cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767010632; x=1767615432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOUwAf42MijL3YJM/xZIFeL0xBoPqmYThITGffes7rw=;
        b=Sjo5wdwmd12sl4K3z+LfaKUmWZk28WKRFu0zDlisub2kSJDy7HeEWUDGfW4D8FmZ9y
         l/yVfb0bKrYLfiGy9FuvFAnK9iQvFYlhky+eJcvsuAzZcB9GR+RSlhL+9cLJSEAFzwtz
         3Q5IESFsV/s4H7SwNPlIPIhL47963dNH2LM86YqABq6jfXGklj/mkHfOl2ge9PGX82my
         OJfu9XWfQCKlzsP4R1AIUJFuaT2eFmHPjKE6ZF0Hak41CZvnuM+qJZ+lwmbkq8+nMRIx
         bZReSmou70wsU7uxC6Q6kMdaW/f5PFUZNukCuyzqxSgjjeE+Yl50+utpDxc1y/jyX8uH
         H98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010632; x=1767615432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOUwAf42MijL3YJM/xZIFeL0xBoPqmYThITGffes7rw=;
        b=xME4lVPdqascjDpF8zdi/ZTm14POuqOaipa80BlgcDdttiXnTjed1OUAjGYnZ5b7d1
         YV5lH7UFixSVH7T4ywNkhz6xaowyDFis3YmTdjzllDLhBgK2vxdVKS5GF/1IPNmICtg+
         mkaTQPmGh6sCEM7Drwlhfdetv+Y/trs98gN1CfuCBT9+ufB5EqZgaN1hrTWzTvTN4XS/
         ECvIRYnG4qUHMmrZESg9jW8U0x7Cq0fE+dSbrP+1hc/xw1P1UiOJOF+3+z2Rr+6704BQ
         m/hCbYyNteg5HDAEcmin6h6G72KmxCwfJ9ciLeaC+ymh5T6l2jtoC/sts5FKbwEdxRJu
         iVsw==
X-Gm-Message-State: AOJu0YyI1yB7qdB5smoeUir9Fp8aLH0+j7Ie3MG7jUxH57smo/mTQyDU
	QB4ovONF7clmOdq8qXrQHUwzk7AQZcWOZ9W7jYHlaD1rXyFGlwHrIEs24sZr/z754hxnbqnTPV4
	YplTIO9RwimdSI/zWR8rOU30jN4tK3rkmzszHLxpTV0DGWZI2Cmv99wMrtdsdLrrfavNJ
X-Gm-Gg: AY/fxX6aFp1lA4RHav4HYxWIl9dV5t+giua/7fFkn8kjbJFgWdm6CbpLqiOiJ5hY9yZ
	oBbupZo4Kef3pi2XDodK8lNO5IZSl22dwIB9Si8pkrzm8JbgX0eGKMxgkEW/K4M/bflXi7L3G7e
	knF3b3pKu6ZHTWMIjstV2KvhN+6XE1wCELGh8qUQ3Zn4L9kDio7Kb7q54i5WlbteEWgbC4mTOlk
	OHVjgqGkBP23B/s21ABjNpPezyMI5Qeg2XkfaXz73uAzi77Dqj1HcAnIp6AMq/Gs66WqtAVer+R
	oaPHs/hTrCh1AF0khEygUAwzhIU5ZLH1bT61IfIkjwbIDNYrnhTH1fBAxRQlgRlZ7wCjEYzseB8
	9xzQkXfkFcFsZL2q8Zmzgudl1Ec1scINwH/YRmslzWEyRtWttCwf2/3Pz+8DhBqlOpw==
X-Received: by 2002:ac8:5a46:0:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f4abcd86f6mr340173721cf.3.1767010631700;
        Mon, 29 Dec 2025 04:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvd4QH2ZZKAsfGoyIuTWAr/YsK3enb76pfOJPmIZdg0l6Pi41eVmcMWBYYNeGTL9K+dv4qSw==
X-Received: by 2002:ac8:5a46:0:b0:4f1:b580:fba8 with SMTP id d75a77b69052e-4f4abcd86f6mr340173381cf.3.1767010631225;
        Mon, 29 Dec 2025 04:17:11 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3ffbasm3349064866b.61.2025.12.29.04.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:17:10 -0800 (PST)
Message-ID: <a33f5b15-d574-47c7-985d-f181c4784b98@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:17:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-5-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229060642.2807165-5-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69527148 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j7HMW06gTmZkR37ntNYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZPvxDz0h6LGyeeLruJWxn2Mk3P9tQx9s
X-Proofpoint-GUID: ZPvxDz0h6LGyeeLruJWxn2Mk3P9tQx9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExMyBTYWx0ZWRfX1g6m7FtnmkVF
 Hrhhj0+NXTFDcAoK0icLnN0M/Ak2Zs3OqyUTlTGNviis9UvOuIiCmh224teKdF2bPxN4uKApuFB
 O7fEvT+DwfJmAhbN6zZxDxjBBNw1b1dKcbT9vgcCEDStOgXXl8pS2yY3p4zbjhf2tGpvaVRUK6t
 2lW0Qad9ZtEd0qpZVRlo2IaY3OdSLEdYxM7ONTcdx6DEmvbt49etV0JBSgzP3sv2H5HLinjVwfe
 7aodPoASN712LlIsFml9McIHIg19k6O8Usubz6ml0GW78/CHfxoler2K6HHj5c262NWjLlhaNDA
 eKGdGA4knNYIZ555PxNgwG24dSu2l4LoRy2YGZoDKUrMrZRCa7/L8aO0X8OU+wKQ+QbgLsCDZnX
 AFcgf7VLI/+f2R5j1y63atK1k8le96/YKpCBqYwvt8rbRAzahXPosVot5PkSSCCVR02J3Kla0yv
 VyYTn4RwOCMI2yRT+pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290113

On 12/29/25 7:06 AM, Pradeep P V K wrote:
> Enable UFS for HAMOA-IOT-EVK board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

[...]

> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;

I think they should both be 1.2 A peak

Konrad

> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };

