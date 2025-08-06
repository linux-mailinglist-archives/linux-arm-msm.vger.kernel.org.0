Return-Path: <linux-arm-msm+bounces-67838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA3B1BF55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A9818A29A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3EA1DB54C;
	Wed,  6 Aug 2025 03:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIDjR8lF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1419F11F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754451187; cv=none; b=V9OrbIkaK4DcLr3bRBn9/69nS/9Y2bdtMOCj54HCApVLnnsYn566u3Up76MTD86wOg3kLqpjqXwpsy07bu375djbgTLz98TU4YoNrVNfSnABjWffIW6Oo+4RpMLVmCgvQktbWdobxJsyPD5sURmuodjsEdYQB2+VvJLjICDT+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754451187; c=relaxed/simple;
	bh=f7pG9H4432qS9R1r/kzZomzIOKpZCgtoTOoxePgpyUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDgKPuhMIhnqSEs5Rl4QhD77QryskiHwUV+Aet7TszrOVuq2E85XjdhdtKCmiiOTr2xH0fBZ2PNPJ/VrohYf08Aeq5IU7vCRP73lOJVkpJCFLGeodx7G5UJb2qDK1EEAIdiETl44T+QymclEDXhopz3oBWSM49tkyOgq7FQe23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIDjR8lF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761evtn021861
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 03:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E6ZxrCjqBVtepsO7mQAejcOr
	0b+KcgjVHvwf5asrNsQ=; b=XIDjR8lFhqErTT2U2/ak4Yt42dRDv7vBONTj+97u
	HsrGQ3g4IvW4ZSyI0r23vHX6ok1b67UEs45SnOuTSELlmLEGOJlIc/YMpqHcefsV
	u2z6FgrkxFmC2mdHwESRRX5LNZuZumSWaglAwCSUlYpqrUcMUupwSC/KHz8T2ObT
	6KY2xphjdwjuU6WI9mZBXW4h6Sn5lpuATBOa9WzHNPt0SvqSQqVG8/997ltZ/2ax
	KvYufXxdKxDZ45aZjaIyvBDUHSWB+udPrRWXM5pSrygQJTLJElmqi28jmxwuhDKu
	L6fGrpe+tIkbKAfQhSiUzW0ugDSw/uHyMAzDfWiSkG5DNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw318sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:33:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af18aa7af8so80232741cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 20:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754451184; x=1755055984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ZxrCjqBVtepsO7mQAejcOr0b+KcgjVHvwf5asrNsQ=;
        b=ZN5Q+TEvfpHft/TXdBQNlbUHz26ocDFPz3oM8CFTI2uyyhrFM/hBiFCoLKByV5Cn46
         9w4PqCUtHfzdciyLjDslM+0jFIgKoP6XVRXezRsqmGF2bhGzb5N13JY63QaKLgXngx6c
         53vlBgvgQpUPNTDnAjG9whyNn7XQODYa2FyPHVs18Mn7BbIlSPZBUYh4qQmWwusQGtH3
         4HOjm3UAAxt7HePFkV1xcXKh98NkfWzEP1B3lD0QlgdmPA1mDWPJCJJz+dscjnDFGo7C
         F0QfwtMcGpUY//TN8DcJXDAIxEibCHtiLpFE7plUubO8lbL60vPJjaKAVBBojMw8qbtR
         vYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQyWrlaFkfzoEc4exiTELzNMDQ5OK502NsKQl46qwAsRFvwvyuBrI/oVULLDFp+aHN3PZbJqSBFbjNylWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzORcjzzXvbyAQkBXrnqg4Z7XyU+/dc04wmypGh87zjN9jqn4y7
	svXiek7m2INIcUP/jgOqDCoMOpL+GUD5W5ZT+jV5if8/P+00fFvDNu/wfYRPVPGWogyUt4OnHj2
	+v1/+KVt4fZ1r6VKP4T+Og64gjzVFeq3A8ZSPfakrxWVUvyKtO1BMhJUonDGW3bnddQRw
X-Gm-Gg: ASbGnct4rX2UQkBgRC+TeQD739ZSuRDr9vhmeROy+uQpyMY+/ayYINr9LFCqR9dBqmb
	9NEc+sJ80Wnx2p5CLNkWrcS7mieGakh0GqmqQpjDkSnVzt0iBe9Vf7MebZ7UJACdcZb9MAEfwt1
	iIw4N8o6MbK4zjz6oDSs6c6KDVN4CRajvoubFPjjOGPrGoU1x+8r/V5ErR3XNG1ZpV1WW8vYALN
	K3n2BBFXYWcjCsZsEQR0gDatEupm/14d2dmJ7cJlqjH6UNl79dxN36C3Cm//8ORYOe84E8Wb9lk
	UgQIj+2Znz1Q0WkxsswkAi3MwRj4g/UNBGeUuWYt7SB16+ZuVKGo01yeLEaP/+5lE/o/XQ2pqMO
	ofW26GeZ5NyiPvmxr9Y8oc24p0D0SaVdT08o2g+frbHg7MwRg+LBB
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id d75a77b69052e-4b0916256a9mr15640421cf.59.1754451183469;
        Tue, 05 Aug 2025 20:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIwhF9FkF6BS9ElI024cVRv19Q5ymyMG2vkjQdqC5u3HaOqDL9TDsvnsZAVpO/+YTwS4Uowg==
X-Received: by 2002:a05:622a:11d6:b0:4ae:cc29:82a2 with SMTP id d75a77b69052e-4b0916256a9mr15640001cf.59.1754451182812;
        Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bdaesm2164581e87.9.2025.08.05.20.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 20:33:02 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:33:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <akeglwafbtldzbqwudwsogrdw6zsxua7ohzkkjxqrw4d5uwhdt@fdbqudkqwpe3>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-6-dbc17a8b86af@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX0PVvc9VBkmOQ
 iKpvvO3tkv+fihN/sf94m7g4HWK987MDiavgUlqWHa3D/+pTKqc9GhIUo83iAyVeujZvLQswjOZ
 Lya2Kz99tM18Ch8c+ppQ08eyw/6+Sf5qq4Bt+ObkurQcvhQuc05JELWilnXhCc/e0zbYD9ejnRe
 j6KD333c+X6dXsNMpUeSfyoALTtY+4OLS4ZNu9AxuQbxgmYTujVfD2k5BP4R/hOWzaw1GKdRT0e
 aZzWibCppJRzpjzES2e7/Wx3A4m+gp92vfq8iiLJ5+Mm9s0lmiNlLqg/FiNFqnLkfDmX1q6OS/r
 0nVd3fSZ2e/sWmaC2vBTqWj9ZpP5r1Q75lpXp5uR/2ghSc/ayccPVu+7OlySn0jZgsNmyszyxo9
 qT0PXV6G
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6892ccf0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2iKMfItpbZzF_GTDK0UA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jVC5GmQyUkY-RTry5ek1w1KrMI_9e9qk
X-Proofpoint-ORIG-GUID: jVC5GmQyUkY-RTry5ek1w1KrMI_9e9qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On Wed, Aug 06, 2025 at 11:16:50AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

