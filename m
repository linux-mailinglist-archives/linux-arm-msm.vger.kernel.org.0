Return-Path: <linux-arm-msm+bounces-61008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11ECAD5A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6366B7ADDC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786A1D95B3;
	Wed, 11 Jun 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxAtWI7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F541AE875
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655894; cv=none; b=p0mitRJjTuShUoojW8e+NxwLYozhLqY9BY4m66yHi9iIwzSmSL3CBMAO7vEcSJwYnxvm3nOLKGKf9N9nLgueqVq/jp58/4ew2YapG88inj2Fdhfd4f39yfsVUTHXLJgDAlyQNYfsJaloeCc+GPl79KiXp+qn2mBPxt6wkyJyI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655894; c=relaxed/simple;
	bh=VZmnhpMNAmXEbbqud23neFBnq7loO8MoNJRWiN7z2uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3I420mpEzfqJGSDUXxXyPjbVcr/u5rCLVo6cwnWV2wqw48PlpkpPUWjseaSbls9bLH2lYex4wK9ypp04vb8XhznUJLZSY8xbRl86g0JFXk46XzojIJKt9e6wh00wsOC7yAfjSxAWqrWbak+14XSp47y+n9HLhDcnGimog19giY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxAtWI7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEEW027727
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	455gzgu0hHWS67hAKzKZb/nm3WenYkc/X441OZiZOVk=; b=hxAtWI7UUjCGmbMV
	ZivBuX7r1oKK1BmJZQUQovu0xLwD+GkbuX03yAVA1Ts73LM1e/7KUe6Kcqq2MKqm
	z5BfqNh4/mJ8CyyhtFDnuU4gnTBjy9Cnbjd5z9hI6SyHdii6gtqvN+icyd2MaGWN
	xuK2QUVQGC4mHBwWx/Gx0hdUFFVFqR0AQstfpmNm4WV4JW17pg+z7JTUSZWTof+X
	f+KVTgFugyNPC4RmBAnJICVDLK1XIjLuBsum3/a0N2Ks8IYiuFCcRn8lGj2iTZRA
	MGnFIL22jbyCDzCGhKUquxTS+flCpWdjWS8pMgwbx8KAdjU3j3Kp0WJYQjDEGM+J
	KdJPEQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhcetk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:31:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb030f541bso38386d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655889; x=1750260689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=455gzgu0hHWS67hAKzKZb/nm3WenYkc/X441OZiZOVk=;
        b=kNR4Z5bx6qyXN15gH0XviL2urYho6x12fDppkm2IYrvh7Lw3+ESD+tgY+x0RVOj37u
         lDmZAOOe92iCiuSpFizH3dAEp6odP7/A2yprxsRK+BEZNfnKoMS+IDs3fGLZT6dz7cmu
         TRTDeNcI2C+Tt7UTk/wT6UTIl1iz/EXQzFV0Vb/eMw+IFTTQAP3ozXdQytIDSFH7MNdR
         cXptISMxRH6PPBKoO4Ad9ztXW8U/CENtthuoEBPN+Uevio7Qlz3+jx0upgA4LevXCwoe
         J+PuExFDQduMbu+YgIhkmpFFEom4VxGiB/OydHUFGaCTk3ybYex4azAKOP++IQQ+j1Fe
         RNAg==
X-Gm-Message-State: AOJu0YyuXV9/iGbB8rtb+TDLZVpy1vOztkE6sYO6Rn8rOQOAIx3DYj/g
	h/FsNUSE7uXziPw5GcFOBAqGevxc3BIEt27Gy4oW4S3FnTp4uUuAIdgzAmtNWy+gkwEdlnZPqFm
	QpvlQZjfwTAV1yIWU9mxPrb2OdKwJRiCoTZr46udNWKnwudGLie9+uUy9oaUY3NYJW3DW
X-Gm-Gg: ASbGncvuZ4R8Ia9zfp5owO8G2fn8lF475rp14AlKv2FGdbninMsgt7VG9cs11aqhFXC
	hrMoPMQJCy7UKIAmO20Hu/VwvapRIKGygC/KLSojDQ2WAidOdY72IAWb3dnt39L4213OvA1MBE+
	7kVAahTBHTMpSJySlbD5jI3NWmYjF8WayJAaT7gkbiALJWMZekXrD5EhLrDIykc0ykuqpEwnzll
	UEcthTTTcRrUTPhl2oct8YR2XweSAo5fLifiU0EOtHBr98H/YviDcg332xipY51xjlR3mtS9dn+
	XehJGMINczr5ePg6y1aZCPApOtmRaxAc2b0UoRWnL1wFKg/JPw4+pvx7DN2YyConloQ3dDlcKu3
	5C1Q=
X-Received: by 2002:a05:620a:43a8:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3a87d34b9mr218667785a.2.1749655889049;
        Wed, 11 Jun 2025 08:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5SyB2UQ9M+HBsZiuY7IxSNchyuOSdndxJp/raWV9Me50SKe7sJUDsLyWN7TOdPxpU9D5OXw==
X-Received: by 2002:a05:620a:43a8:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d3a87d34b9mr218665285a.2.1749655888415;
        Wed, 11 Jun 2025 08:31:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55f6bsm906998066b.51.2025.06.11.08.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:31:25 -0700 (PDT)
Message-ID: <c24314dd-229f-4e26-befb-1491a5ca4037@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI: qcom: Add equalization settings for 8.0 GT/s
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        dmitry.baryshkov@linaro.org, manivannan.sadhasivam@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250611100319.464803-1-quic_ziyuzhan@quicinc.com>
 <20250611100319.464803-2-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611100319.464803-2-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849a151 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=XRhAMW6oQtNP-qC2JosA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 40mLCRKLiDE1sKxeByvmcrh2wYXf2xRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzMCBTYWx0ZWRfX7EWz0HVGLcia
 vwPqA3FspUEbMIb72d7+b6ij6XKzuZs0xoZHEvXMty5ukNwTgitp+BEL80k0U8NP0Oy2n3ZroOm
 nieY+TSWBUmL2Z/KLOHmME6gKKhdtKDmqkGXT5hll6wIoevRYMN1ngAtbdkArHkh5YM1A0DDu5n
 8LMDN+pqdGFlDGuge3pTkpcUj5PVPv7AjSpRriNJ1lhx8SrUMmN+GdobUQWa7oFGW1/AryT6mTC
 qxf10mypNHGBUbk9QV51ipbaDgpfe4biiVF34gkycB2JnfruSXR0fagnYHGlVlkx+95QsZ1oanT
 q5uAKGLadRi1n7FMMCsYMPlbR4JLZ+se3Pojk+AFjoHaURkU77YhRuhTJV7iQ2I4IGookdWnTv+
 F7hGNARdKbDuGUewvsdyyzZY7jk+QNup+aF3EvNw1jq617Ip9z4UgYO3Nrvkb1cWYnElnYaK
X-Proofpoint-GUID: 40mLCRKLiDE1sKxeByvmcrh2wYXf2xRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110130

On 6/11/25 12:03 PM, Ziyue Zhang wrote:
> Adding lane equalization setting for 8.0 GT/s to enhance link stability
> and fix AER correctable errors reported on some platforms (eg. SA8775P).
> 
> 8.0 GT/s and 16.0GT/s require the same equalization setting. This setting
> is programmed into a group of shadow registers, which can be switched to
> configure equalization for different GEN speeds by writing 00b, 01b
> to `RATE_SHADOW_SEL`.
> 
> Hence program equalization registers in a loop using link speed as index,
> so that equalization setting can be programmed for both 8.0 GT/s and
> 16.0 GT/s.
> 
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

[...]

> -void qcom_pcie_common_set_16gt_equalization(struct dw_pcie *pci)
> +void qcom_pcie_common_set_equalization(struct dw_pcie *pci)
>  {
>  	u32 reg;
> +	u16 speed, max_speed = PCIE_SPEED_16_0GT;
> +	struct device *dev = pci->dev;
>  
>  	/*
>  	 * GEN3_RELATED_OFF register is repurposed to apply equalization
> @@ -18,33 +20,43 @@ void qcom_pcie_common_set_16gt_equalization(struct dw_pcie *pci)
>  	 * GEN3_EQ_*. The RATE_SHADOW_SEL bit field of GEN3_RELATED_OFF
>  	 * determines the data rate for which these equalization settings are
>  	 * applied.
> +	 *
> +	 * TODO:
> +	 * EQ settings need to be added for 32.0 T/s in future
>  	 */
> -	reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> -	reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> -	reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> -	reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK,
> -			  GEN3_RELATED_OFF_RATE_SHADOW_SEL_16_0GT);
> -	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
> +	if (pcie_link_speed[pci->max_link_speed] < PCIE_SPEED_32_0GT)
> +		max_speed = pcie_link_speed[pci->max_link_speed];
> +	else
> +		dev_warn(dev, "The target supports 32.0 GT/s, but the EQ setting for 32.0 GT/s is not configured.\n");
>  
> -	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> -	reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> -		GEN3_EQ_FMDC_N_EVALS |
> -		GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> -		GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> -	reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> -		FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> -		FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> -		FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> -	dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> +	for (speed = PCIE_SPEED_8_0GT; speed <= max_speed; ++speed) {
> +		reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> +		reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> +		reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> +		reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK,
> +			  speed - PCIE_SPEED_8_0GT);
> +		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
>  
> -	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> -	reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> -		GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> -		GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> -		GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> -	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> +		reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> +		reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> +			GEN3_EQ_FMDC_N_EVALS |
> +			GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> +			GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> +		reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> +			FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> +			FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> +			FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> +		dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> +
> +		reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> +		reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> +			GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> +			GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> +			GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> +		dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> +	}

this function could receive `speed` as a parameter instead, so that
it's easier to parse

Konrad

