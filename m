Return-Path: <linux-arm-msm+bounces-73317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B2B54B55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900CD4881FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83C02EFD87;
	Fri, 12 Sep 2025 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLd+2XvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C13246797
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677572; cv=none; b=XShVyRFAcgpzq+CiQn8APz+hoUpSON8pGuE53I8HmX5saJS487BUs23UiEKHiNmRJWWIKaWhs5sAgTQaKjbM1zwxBK0KLU5PbSEQNtfWl5V3+FhekqL4p/wKmOd2KFq7RHdtuRi/yhajocf+D3tTYHqGzuol+omoBSs450n45F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677572; c=relaxed/simple;
	bh=9f7Rt8ZJ2W2atidLryZjEWAbi3srUdougeJJ164aCR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNrU075NMO22Py9RAEQ1iP0WdI7/qNaRq/K8WdXr9iEUvzfLsP35GicuoSF77zgJ+VYTn1Jc61Gvrl2wYDYiqiZohqFXbGRadigV80pPHnQ49CZ7dyUO55shLQHwjBm9uU21au+lFTru1dpKFJ+Kz4wk+ITJYkEeSCNDcXS9O7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLd+2XvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBo4C018883
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9R/kPch3W5Cml6FifUegM7lF
	XoROZHqulO4RRRDKQxA=; b=FLd+2XvCvSN+zewfv4IgufacPZN8XrDTtIGPVMb6
	L+NKOG2DDaKsU3DaTzamqqlGdcZnuEAUkMVzfkttkTIo0o5gEsCm1fv6hiP3xvWh
	W2ViqQ1sNFI6A+wtPdDEaj1oC6rVZrmfDJYWLr02dhmqiNuIO6inWeIi9pH74azs
	eFDUpEEAuTJWBfY6R4iO6IKbwPUpILpPOoN5s+/7kh4LvPfiCF15IZFTrPdGmYjZ
	XSWzcLL5Qp+XNlwjOmQhtJfPVaQrQlPbNN7RJ104Z8gAQjTnOq1MYmqK/TwFpp/Z
	lJjDAN1B20YuM6UkW+B2CcHfaJyKKS3C2UEOtQfZt4iQTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx02yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:46:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b60d5eca3aso46937091cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677569; x=1758282369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R/kPch3W5Cml6FifUegM7lFXoROZHqulO4RRRDKQxA=;
        b=sk8ePmW5ynWCirl7tgwpUZ0OawvcKlwgqmc8CVnG5S7O2TAo6TUhNqGFugFwYRVamb
         mQRVuEc2+oZaKHL3WgdTLLIRBU/xqXsQRoPprcKmPwUc51ZrtA97n1GUa1rINbu1U/yj
         rXYuigBf5NR4Ab3h2pbCLeEzXciEkNmKVF+zYA3Wf9V9dQgO64BpB8KOoCYB6NHn8oAL
         wkWaPNGiXBUoZg0uDQBPdeAhUzXBTvMscOactOyHl1KCL0o3Io9Qagk3QffHqmJ8PlF7
         yHNP3x3nXUr9OjPBYZVBpdUHolZfeCtLZNw+MnqwLCpq5Cfps3Xjo3v5l87gUrqWvAWc
         iBBg==
X-Forwarded-Encrypted: i=1; AJvYcCUg22GO37lDCijeOC9aU8Tkp7jzbcx01xPgKZYQvhohiC+nmuHDQhoz8jMmVAU4jO/BCsZ6GwavfIbT/UVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3H13TXw2lMQnT01PQh6fJAli5cHax58+9eXmK6O3DKKmQTxa
	MVSimfBlhcXGBWx8gy3+OU0dBeR7xmrusyhS7MV6vWF1BY6H3i+ggapLYZE1zGTd1e8JcUiT3jO
	Xrx/8m4pB8rzY7Mnm3f1tkpX0Sjbr6+TifzH+fo28EnR6H5SS3jGV4XA+AtJT8PSzfg5F
X-Gm-Gg: ASbGnctf7D4uetH7z11FjFMGtNwH9fQaGe7AmmUUdzqEQKEJXWO3ehSKZNidZRrgUF2
	d1Rf9enr1+WGB/fXWib1zxo9tLNcUCknihFxbq4b6a4UcKoXze7BLzbpUuE0Mdscav7iVqWaK3A
	dEXf1fYf0fpd7lXhhoMjPorBT+yMqB4siKIauZzel4i/cJ8PyhFFXVmvkpqzpvxzD5no4OjDx23
	Psliy8qixs7ks2TtTUG7U7GD9X6fiDBOo64/M7T1F8/EfohbL6wbd2xGxuWrRRpc4/kIOouT27f
	q0bQFAAVBHpV5XhP/Ewvsue0DlswQG+jbES+NyeTVZ5ZH1I/MmMRxc6oqyPCUXpGKVjlhaXbx7q
	ruKTXwIJnRN/RNBu8ZiCai5pcDCEnRdLUk+UdyYV7oyI88LLaa3KM
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id d75a77b69052e-4b77d17bbe0mr26549631cf.72.1757677569023;
        Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdVs3SKgOxiIfzvO/EkGuSuQowx0IqMmkOv8Q4BBfV0cg+8bLLR4jRDO1o8cJV0pjYZeiqPg==
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id d75a77b69052e-4b77d17bbe0mr26549321cf.72.1757677568463;
        Fri, 12 Sep 2025 04:46:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63d43sm1104326e87.91.2025.09.12.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:46:07 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX6XVEHiTRztHY
 yOSCwkuJm0d7f4pQOX/2zet/vINAr29fNjgvF5Y+LHed0YPL7xiThBExwQVuJOQURDo/PFuoopp
 RFftoxrbQgfEzxuy1MIpWFjPyU0Yca61w89CDR/7/QwSBJo+SxTtyX8biJvtr8GWmdLVUQR8tgT
 ti7jMYo5mc4Lyq/d4CE6NuqhHm2YaSGM7okJ/gNYKVMEyBXhRO7IEWlYqHANkn7nhc0IDThI1aL
 Eq6rEpIdogbdwPYCZLwmtZRt5HmCRkevKDhDZgTTf0RfzQkhu87P21OMQ/SSpIwGrhXr6BeNaAS
 qSVNHl+xr7Bn8MGZE6m9jxQEa+0vV6ZtCEV7yNj8U+Ef4q/Exfaf/bIbRTmkAKvp4ONRKDHXVDo
 81A4unMe
X-Proofpoint-GUID: f1XUvHwd40mgfAQqTcxQ8lIPlNW-0HVQ
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40802 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EjQU334iH38qswJM8_UA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: f1XUvHwd40mgfAQqTcxQ8lIPlNW-0HVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106

On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> SM6150 shares the same configuration as SM8350, its hardware capabilities
> differ about HBR3. Explicitly listing it ensures clarity and avoids
> potential issues if SM8350 support evolves in the future.

The controller is exactly the same as the one present on SM8150. HBR3 is
a property of the PHY.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp
>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> @@ -261,6 +262,7 @@ allOf:
>              enum:
>                - qcom,sc8180x-dp
>                - qcom,sdm845-dp
> +              - qcom,sm6150-dp
>                - qcom,sm8350-dp
>                - qcom,sm8650-dp
>      then:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

