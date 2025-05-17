Return-Path: <linux-arm-msm+bounces-58285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3696ABABCD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 20:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3098E17E90B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 18:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFF818DB03;
	Sat, 17 May 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeklBNUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D641991CD
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505796; cv=none; b=abSmUUhFxtAqYgCBz3UGMkcrGOH6xrDCe25rXkBJTB3Jng6vxzgjKoAwmES6GxCcEmzRyb3LoMbVpf4DPxdEsFMzN8xkr2RJKzl02RaRjOJNHNskw/HPLbynfkhFX+Xyk0+1S1Xfj+5oCIY/yy1mQvJ2JSP9niE2pvt9HfV/EKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505796; c=relaxed/simple;
	bh=M4m17yyuXbBVV9nswjASUOSO+8084mzbcNw1wJdCEDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0cHQO0gbNw+iXFx1iK7Vk4Ju/lMjtZ6qLvJ0SzXIkNrGHOnGV+kq4kwCAnPjsxM+EgjMPpj5dr/IyWyjFTIfich4V2A3Ggps01pX/QYiES8x3IpajnNEsX5PeZXaHQlqeg7xdLw3iDiYFHjPnaApyMDWw4G3Jf6GiaCTr3ciHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeklBNUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HEvKYv027624
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnBJCA42Fcz95KKCL7XfwOVPDCEaWi9lJaJ6xnj8QNE=; b=MeklBNUOJk+gzfaT
	wZOEtq9X+JzyiZ2sdefk+IEyy0yww3R5/vMXagzzRsh7QTuyzqDatRKqR9YEPWfw
	yX2Yiw9p/4k/pMGfKyXZHeAs6n9oQ+C4ubruy/bCBIZhQupUnTv2FdnELWCw9u7T
	w+LacuW1M0vCQ7mXsPs5cU3nVFiRrs/9GWFb28YnuSbRodLkdLh+ifSECm5K3f9T
	JEnVDzn63WgmHtuyjd586e2v+x076w1uTF+KqacytWqfxHiHPhdKYV4AR7Jmzifr
	UwT2qEJKbDAX52lR6J7xwo48TkrPkQV+SCuEGN1P0V4cWKPdcwf5xzdRPYuQVzT4
	i7Hspw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsryt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 18:16:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8a8883437so4156076d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 11:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747505792; x=1748110592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnBJCA42Fcz95KKCL7XfwOVPDCEaWi9lJaJ6xnj8QNE=;
        b=jzhzOg+CU0efLQxYUvCb3NW3omsp3G/dKHDM/jo0juGHYOG3lbpxs7YEO/Myf13e8v
         qnW48heDrav0JLy4WUzDVZ0wbcwTs/R3XwJiRE8YjPkp+EEVn6/iG7ETPNmp2y8uvQG8
         /fo8m80D8jbeNtzE/qjLLz8ik86NYCiIBTnt6EtnUsMJzgHsE1lA96o2T8HD/0/bKPYt
         Dt6vZmxk+F7Cs3uINEBSv7WD3iiB18HKTM7gXRpB3n0fH5LwFCN/rBM9ppxY8IRHhoKw
         ctlHFhDVvwL01w5jaEs8RM03BDtZCJ0S5QfgPuY5vuoJAMUDWMFsm/JTAv9FQ0ynlvZo
         5VOw==
X-Forwarded-Encrypted: i=1; AJvYcCXMX5Q5mo+X7FsGG3ymkHtW/PHiw1gD4avnu9PtQxeCnNFBQ0hsmUGZpbUiIsBBoD3oojudi9ZCIvh4sORl@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtUJM7UAIBkL5Rr9GOBqNe/CBaY6UunCX9wn00m1KZFkAK1Ff
	v7AffkkcKfWu/giJayFMh+i9hvzaxfmER5c4gWEqeQvAiXXOO/WDBkAggz/bSSB6MjhH6e4UpXL
	JNsWdWrlc80JQEtDSQno9SZpt6FQhjmLVgs8I/6c83mt+ORDl5SLWPtRPvBe5QFfLmZ1N
X-Gm-Gg: ASbGncvn0nA7AtpBKdOSTXopjm3Id2Dlfu9EH93ugYUibgsz3J3CDOGy+vU4tcCwfrc
	LCmvzJOg09rpKvVVmVXX8vTyjQ2f/79EYo2d3tSIRKXi+3N1/HCTEOs78gmmr0LVp323nYEgX3I
	xyh3qaEDWz24uRSZ5pQXDrfXRdaTRn9ji70rG07h28C+kYlys3C8ig5aHowiyRoY4lGc4QnhCHh
	SudAp8L6jloQSCLJUZw/BjLIN0n37xtbVIIxs111Yh7FVaXXiwwfE0I/zxAE/yGwy+3VhOjV+XX
	livWXoclPYCMm1y9dA9kO3Rhzsdr2HeNF42CR5kejDhyifj6fAif6P4zcKLFGewEiA==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id 6a1803df08f44-6f8c773156emr16307686d6.10.1747505792223;
        Sat, 17 May 2025 11:16:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPPQtbYciftNueP6WNh9ccRSDo+w+J7+XKx+nyCa4V5rw6SiuDQB/u7qA1Xq3T2ePW05WFQw==
X-Received: by 2002:a05:6214:e66:b0:6f8:c773:367 with SMTP id 6a1803df08f44-6f8c773156emr16307526d6.10.1747505791887;
        Sat, 17 May 2025 11:16:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fe5sm324919266b.111.2025.05.17.11.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 11:16:31 -0700 (PDT)
Message-ID: <8e900d20-009b-4cc7-ba1d-52582e414402@oss.qualcomm.com>
Date: Sat, 17 May 2025 20:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bKrCL2fQ375tojvzozTaAedbZp_-uTE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE4MCBTYWx0ZWRfX+x+h1OvMNyCe
 qpkwguwJqMmydFrs06LTacK+WzJJ4/7JuumxWztu++blzd7yRSBqkmIYt+nvSRbgbEjKqXsBUuX
 A5GMRKOdi2VGVDQF9+XeGBpzYj1qfjaItdJDuiKkdGNSVwp2Nkur62SoNOgbhjQghcwHm1LBDPQ
 37YOWtQxU63oocJD0B5ll03iF5XMkR8Jt8H6UIOMqE1GRjEHDIj6QF8dzv4Qks+DD6OvqEhq7AG
 NQAlDRKXPDaIkkShXz50FYMmr7gmeKmsNmmgVgwG3KZWhRDbqJZU3w7YN6VPx9+XCePyfIoulBd
 74bjsrifq9ZYpf1wjvtROLa4+UZdijParVH6AO80S/9DX8Kjo0vCXFQODnwtDxSk4ebTg6eZFGg
 2+7rcYKQ2Z8alVjAV5KBI3/gE66+MU+Ta2HFtIDQtRgwZRsroHhSqIs15pBGLAqrhPoQlAIH
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6828d281 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9rkGdShBa9mjovGmxRoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: bKrCL2fQ375tojvzozTaAedbZp_-uTE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=526 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170180

On 5/14/25 1:37 PM, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> Make changes to update the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Add the ln_shrd region for SA8775P, incorporating new register
> writes as specified in the updated Hardware Programming Guide.
> 
> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
> closely related and share same pcs settings.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---

So I took a closer look and please re-validate the changes, I
checked one write randomly and it turned out to be inconsistent

[...]


> -	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
> -	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),

^ this should be 0x0a according to reference v1.19 for RC mode

Konrad

