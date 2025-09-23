Return-Path: <linux-arm-msm+bounces-74530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA940B9683A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 17:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B95654E039A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F160B1E0B9C;
	Tue, 23 Sep 2025 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P44L1ZQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328F199FAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640425; cv=none; b=B2mTTOxmkiEZvY4LAX8KIu57AyeItZgr9LOMGJ6IRnSwHQuO1DMxIf7oBMYTNfeVHChTZBEzFoOyy5d7OU60mAuyOKmuaUrGMcKgB7Ds5INHFhgCcKdXgKGQ2L7y4e+/52HBSxyyiV3hhH0cHd/LvpSHVXit1vDKG7hjwkr/qWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640425; c=relaxed/simple;
	bh=+dxVN03+NxPH90uxGPxmu6JMAYvavCbPcOumQmBHgQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gyv6U+s7Y2U4SIpMoq5q+dsTb0geSY67Hbn9af4HIWT07WtJw2KncblRLvtSxUYCyLeEI7/gGnpALnY3CoUGWWhg9gtlc1+AWxEGKkvfedvdfDeaaVoAafE3hikVdi9GYtXQDHBI3DbescKLT8y7/khVXZpYvyxMz+3NGx4coeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P44L1ZQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H8kk007332
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BZIisvap+FMPTsGCcwwpcVKM
	6ffERfcfiaukHo8ByiQ=; b=P44L1ZQQ86VmGbeAG4spLI6pSWhWk1eU+oqMNxJJ
	1M3/M+9IfaE2wxbTD0fnkUMOvZafERizlFmcHEkJ8n5E2hy+xQF0tYnUq+ssma/z
	obF+5jvceDpDKd3h4VvEyCB/UndIBiNgUSLqfQnHFA+wdeRP3zG5Cjr48tM9SZ7o
	UsCXAxb1NKiXbGU425Rn6krwp0nOQxWrBAKI0HxuhVDLEK2VKCK2ld7ku90Pd9L7
	2+Ay/3Unk1kWfz7+RdIql/BZqaIZMQX052KyoyRXPdAKBS3TAYQyyOSrN7FxmAvP
	FViUz6AcwR5jEYOqz3GPJJvcwOm+cV05pL7wlWoL5IUhtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98h35t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:13:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4cdcff1c0b1so50175371cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640422; x=1759245222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZIisvap+FMPTsGCcwwpcVKM6ffERfcfiaukHo8ByiQ=;
        b=wJN9jfS/oNnuPL+HC6uPDFyfYxzWVMl8QMiGoz1JPYhLeeG7cuAxnwXmujtXRYeRJn
         JxV+yH2vzhGvq8bM3Eafhgvcjs3g7pACXwgeGYuij8cJpo+8OPnv8pdjK/A6RUXhw+wQ
         52rmyNPmn7T46hnllX6umCqOh8ZCz5f+NxR+DLDZ3E5wQ5x4+iaOWe+wdDM00KrES4Nv
         oX3oMIDZz2EOH6BzMiAesqoaSPpans+5EfQE/ZnKCvuwX3n/ewHY8EvkkvalD3opcd1l
         US4N7cutlH+aPmlUepu2RsCYS2ApUZEepc3rOqjwRn474OYvVWvOYND3PFx5twQe/Kwe
         kRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/PtC80upyg+QH9odVeiKl5hFm4BIPRXqCSemZIy64GvbRnLuaVkMhClABA4BX4dZOkdztkLyV6C/u1HR@vger.kernel.org
X-Gm-Message-State: AOJu0YysiZWYjY6mT6cFbiL/UTudH1v+MaG+66WBFFoWYrFalaP2b2eo
	GpFG3+GM5865dT1Ubp6KQdGBcsuIUNGKQy1POAb+vCE9MhY2kOOIOSHSg+CcUhu41+95vgy0y5V
	DVtsAH0NP5pAtHxWOfFbdy/WvDajV7EKa25a4Zi8lhEIMtT+vleDJS397scvjf6+2bhaF
X-Gm-Gg: ASbGncugA6GnL17iwKdO//yux9JtteNazscCMcomgZmZNTqN5Mtt5dEE6XqO9V26LJ+
	RWk/d0460qlT8NJeEyQQd4dFK/876uXIY0OE4FyloKNofSigk33ivzQDk8qfR++yaim8moId+gL
	yDGiuigjDuACXaPZpvqXa8mq8GyfOTCzrabXPOaxywAQE+xNrk2f5uOnkU9jj5tF2/9d9umTg61
	XcU+Dje6YYDzj/RPBantodtonadA/7OGvSis9K5uH2yBk91D58OoEEmlAjJKzcSFPFKEErIuekC
	t3fBtzSPITSlvKlMQyynngsO/sZpUkwfpumXgujHUTcU3qa3HsLpokMyxvUV6+nOb4LAvlZF2fy
	DW/3m+/VWriuPtDUxs+uRNbX7zggP8j2BzzMDKdksKPmVxvALDcDx
X-Received: by 2002:a05:6214:194f:b0:704:a590:196 with SMTP id 6a1803df08f44-7e70381db98mr36059186d6.21.1758640421738;
        Tue, 23 Sep 2025 08:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2M7oZxGMkVEQaCn+SRSpsX5F/BSK5zHO+MDSoD3rPA267omvOKyq/PN7wTc/fndNNH78+Q==
X-Received: by 2002:a05:6214:194f:b0:704:a590:196 with SMTP id 6a1803df08f44-7e70381db98mr36058356d6.21.1758640421084;
        Tue, 23 Sep 2025 08:13:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9573541sm4264921e87.108.2025.09.23.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:13:40 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:13:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, luca.weiss@fairphone.com,
        --cc=mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name
 to QUPv3 nodes
Message-ID: <cr2ehxr4udit6ddzp3pspsdrhtf4rpl5fzo6jakw2uo3gm7r6a@v3hwvkya62hx>
References: <20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-GUID: dYX2o-iH9wxai_zVsr-YdWifDBmifM0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX7y5tj9yRHXio
 05jNSzP8sGmH+sw8K3KQNkTTX5MOB8PBiV+YH3aGv5VYm8WhICdgh4Zw6OK8+lPXXJDecAxD3eu
 fG/cdC0AUF2+d2qlmTT6Ccf5ZTyS7P0nEuWBBOV9c0kwsXSy6P8kshJmGpVLX/s7Cl0/7talWic
 Q3EixoZurdfUfBYg9wVJIzTnATi1IG8MufNOvm02QqF119eaV+6tW1RFYvo9dLvLmNy2+uI5iye
 s9urAnGozBmcrYMQzFyyIUmhQDOj+pJHdMnzN+7uqviAozi9aJjj4Nj8B3phctLRFngmZyB1hcx
 6rrHTxz6A0xghvcbm3YK1hqErwgRBbiV8E5FjWARbF7Ngzgv5j+lQ1IFmu7GfgVj1zqvDzInri2
 3bumsRGK
X-Proofpoint-ORIG-GUID: dYX2o-iH9wxai_zVsr-YdWifDBmifM0K
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d2b926 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8WW2uxIJbwZ2W8HW5oYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Tue, Sep 23, 2025 at 08:04:31PM +0530, Viken Dadhaniya wrote:
> Add firmware-name property to qupv3_id_0 and qupv3_id_1 to specify the
> QUPv3 firmware ELF (qupv3fw.elf).

Please start by describing the problem you are trying to solve.

> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 18cea8812001..4e361580ddf1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1009,10 +1009,12 @@ &qup_uart7_tx {
>  };
>  
>  &qupv3_id_0 {
> +	firmware-name = "qcom/qcs6490/qupv3fw.elf";
>  	status = "okay";
>  };
>  
>  &qupv3_id_1 {
> +	firmware-name = "qcom/qcs6490/qupv3fw.elf";
>  	status = "okay";
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

