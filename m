Return-Path: <linux-arm-msm+bounces-61010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7CAD5AC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06E451BC22B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1051DE2A4;
	Wed, 11 Jun 2025 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTLXh2x2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1081CBEAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656080; cv=none; b=k91gf37sFsaXDbmP1CwGTsx6An5aKCIPPVArzKdxYIMcLOdDl4IJqo6n2MhMlsVQxJ4y0kYG5K1jBNJMBUxKv1R3mpV3oa8cRdrza39KtvPl4HMZW8lXrlqBBd/sUoim6w98uTZfQvSdDdN/8j9YuqG9QH6O0zIK/ofqWwmUnUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656080; c=relaxed/simple;
	bh=o3QCcI9l3rgw2lYmIHWf/86KQEbZnbRgtKG06BPEfR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL/bUjw6DY2ZB5Soo5Ghn9Wfp0c9wn4vYnRUnVqDauPNea93o7Pj2GbSTgfpxki8r9YHHP97af8GUNWhmPlUMJelCzg+7IXY5n4z1hQ+RfJzpGFhoYu/biheFro0FY8HH5JUqDUPBi5xW5V6EmAPcezinP9ybcXsSXu9shUXO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTLXh2x2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DCDG027238
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNaG/m5ckjCaNCaR3betd1kEB9RBVitnuO8XEu1xsPw=; b=MTLXh2x2vBoA5M42
	K0m6KQf57LfkC9rvRxdn+ZUlhTcxaFcUYKVg5B3t7ceiNo3MLdKh/FLEWbllcP8o
	i3MiyXxNjWiwAE0XT6UXymkDo7uRpu16raU63odzU3QDst3vDo0XMOknXH7x2VGe
	pXCPcR0Rpn62kvKzjofYhKtjUiXn2fpjOt4PkupXryTjtk5INDG1XGAAUaS1Ve8g
	rnk3Eb+9NShsOXH2+5u//NZVr1/GvAhcLXQxNmHL6HJm9LF3ftuXpEZKzt9ORWiF
	ugcWOXHFk1T0P+InwjVn1Qy41Y4I8Cfz0JuVne7w66zu000ThPJfpLAESTkJoapX
	zpIwDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhcf30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:34:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so15760685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656077; x=1750260877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNaG/m5ckjCaNCaR3betd1kEB9RBVitnuO8XEu1xsPw=;
        b=daFH4j+LmUXbJNSGsKTzklzNGT1ThvQ5kw9oinPZgSYyIM6N5K30l4EKriiK39yuSs
         bhmY42+nueRq4p0PLnWTuyDfxPr3X7CaNkV7T2N7fl7vxx53SXx4AMCuuTERaq0lynD5
         gHdku8X9FNqU0XYiKN1tj/RIC3RPWHtjWIT/Hfi1nOQSODzlzrbHm5caX7v10jF4TFbN
         sUWY5A2ZkT11Ztepq/apt61roIMEeojPoDkdfLqk5873LE7vvZ37RAKiTsjZw8sF/uky
         iyFZL0XBGhxSNkYejIabr4folZRqTsiYbVwvOdV5pbTWYsee0yANVK1OL7j19lbCdoov
         0sNw==
X-Gm-Message-State: AOJu0Yx5N+ICSAq+iRXG2fPQ7DYNfZbCgYHvIRPFUVg5izdTwA8N/9x6
	/9mGrHy4RKTsc5BvwhFFHo1eVPbicxtV73Y8AV7JntxNZuKlIqSyBULSePsXo2Gohb/XWadUrGa
	/GzARGac64z9b1cqpIHmIAUkjB1NokMM9x3bMcfw99lgKqvm5nL/+2VlT8KbUV5yBWhew
X-Gm-Gg: ASbGncvTJA+AdjxTrPHnK2H6dxglhew3R9/3DnH/LuCmCH6JltoFQ6OeoWtnH+0zfON
	R4ew56VzQnWvdA6dhw1+2/AaYNLBD1u3xU+5NT/+fI2oCMB2x/kJvJHaACStlRoDpshrJVId0sj
	8BZsdOQ+P62vWUN4HZzYyAQsfT4hjzP/8hCGIaPXDatwwXvQUL2jAPVW2JMCgRMiFfSVFLb3ZoJ
	BlU/PYxF+ibRUQXImJ86gZi3gi5VppW+CfRq2tbfcur/oThSalI/q66kz/hX0YMLhdgQQ2WQyzR
	I86DCgZ+fexPS2fiVBz7lvo8xXHdHoAb56Z+FbwIbeoIQKgvuiH/zHgthdwxmihuVv6A/hYrO03
	Z3BE=
X-Received: by 2002:a05:620a:2456:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3a8732298mr205847785a.0.1749656076704;
        Wed, 11 Jun 2025 08:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/ouoE52qGE7NcwixeAf1E/9WuVIcED+AzFLeYamXtXx05GWCerQ9yNA/jVMaQIkg69Bj3+Q==
X-Received: by 2002:a05:620a:2456:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3a8732298mr205839285a.0.1749656075131;
        Wed, 11 Jun 2025 08:34:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d75467fsm920990266b.14.2025.06.11.08.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:34:34 -0700 (PDT)
Message-ID: <fcfa77dd-d7a7-4d3e-8e67-6d3f3eb439b4@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:34:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add PCIe lane
 equalization preset properties
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
 <20250611100319.464803-3-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611100319.464803-3-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849a20d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=E4L0-HUXtsqUrGG0iVcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8knKGP6FsIPZ0kQFJzFWWjYnMWFmGfH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzMSBTYWx0ZWRfX7p2LvWf1I9vZ
 w1WyTcl8csZ3iXjqZQoU890uL958BRIrcackP4oyb3RQTLD6tBrSnh9XQDOIy1wiG3MNxfCsM1t
 S11dbhPrq1YyJUdC2BUuCHqGqj11bO45HJ9LgHLNBTLcx11uMP0QHDJZZT3f9WPi7JOqJ0WgbjH
 u2BZsIh9xZ2UnGH+xBZZW0i6aW0JbbaKKfWW8y7j3bJEsoGln1gdDjZmw9IXcVrV2Tn1R9e4IC1
 j4MCNX+slHwI85JVwVOWDywO3sLkW1FP0bszNfUlbUVhhr2aHaflXMqPJezc+O8VJ5d6jNHVbWN
 nLsCbvx+6Kx5jO2wPMIVRhiBHELVM7oBpC2zVHX+NcoUCtSWB5Gf1dAMhhCanz9+IeSKJru5MsO
 +hjjIzZ/PA+Tv0iRMgWNLotFMtVTSCUlu/MUDee59FPgay3oPqzH1+l5fLUyQlySTtk/XHZw
X-Proofpoint-GUID: 8knKGP6FsIPZ0kQFJzFWWjYnMWFmGfH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=806
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110131

On 6/11/25 12:03 PM, Ziyue Zhang wrote:
> Add PCIe lane equalization preset properties with all values set to 5 for
> 8.0 GT/s and 16.0 GT/s data rates to enhance link stability.
> 
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

