Return-Path: <linux-arm-msm+bounces-61891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC35AE1DDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3268C3ABB17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7672BD5AD;
	Fri, 20 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAJtHpAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D592F291864
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431165; cv=none; b=EIoKRwY3tpkLWLzFucQyAdVTJu+ePOqOPiVMxBTnpw3IWWciDUtDMUM6Jckhgsv7FCdSuvCSS2BV/7dtp2ve2ycw7yQUG60s191nDAHmNUlo7NnslsVjUL251Xs8rVCIIQyhaRmbhQ31gHHUzLomR18EZojFNZMNp1V28+0gdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431165; c=relaxed/simple;
	bh=+81yvo31v7QMHWZeaNt1CEAELQelIHwFryFAymk9iSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aymW7pWbpgo0VGnrCAeYmq/46q6xWDTZOc07o2L/zT/3Qbn7Ys1Y7Y8sCttIWpP6ET8hsQQd9ULaI0ZjlT7fM4McI3WI1NJsVvHjEMO5zZ5zV4sK/TmolZELTD/JlnQhYuxBVLXn+ALgD5Hw0C2cR4gt9oxIMbshoaL+dxatyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAJtHpAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEdqEQ013835
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=ZAJtHpAg5TytFv3W
	kvuEP7MlYXk08pMf7BPEgfge3rI6e1pJiKr99ASdea9Wguhu2WqaLVwo/hjsVtL6
	3dgUGZpz/CmqkHIg007vyaJ7HlUJ6R/Bo/Df7i0zzmZgjH2LHc8yzNCo+GdNTkny
	mn0iLXTk5buYeTmE5nZpfKBmadFdmNILbOOEp8XNX3eEEd1w64JjX5vndaZrlLlV
	UQInlFPbKPV1t+Nc2WT+3Dz7TAjHCoiZpzHzR1tTtT0xetNlcDAPOxVuQG2iJGyk
	RzcHwfFAGdEqnujpE0OrkBPgJQkxfSCd49PTSZwf0l6ZaXuDRJXwaqGntp6tRXIy
	igOgSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdbr44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:52:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so54921785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750431161; x=1751035961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=;
        b=Jwk0ml59rcDZvS3glnEbghSRYjPA9a8SgNeBy8n9n0LIuPhHqsykMZlZFbIv2ElStn
         qjBDT5Ea+Z1kwfXIJTP8lJ+jyzWSmS6sWBZmaptdvSc0b404jGocx8/eizWYdVXk1s0i
         siZJM5M04pjpkOqHBgrdu2KwGTnvBXwEf69X8YAAOuOlI6ea2LoRx3QnIUZn4+C1gcnb
         yG3bSlBti3U6DdYSkq3ts1ISW0zcO48TCux/Adw/UJlcAGWQEXLZG2+xia/6Hyxok3v8
         YIJQTkDuebE8dm2DpLxsyhrdtSKTuo9ozo882oA4aXXee8mOmcUHzG/4ok8eW+3Zn0zx
         Qz2g==
X-Forwarded-Encrypted: i=1; AJvYcCV9MMN3eXtyoqRRowvs33atvtGkIopJQQMS22Toq0+SbcU6uktUlHlPcxsthusIAYlZ9+RiMe5NtkS/qRku@vger.kernel.org
X-Gm-Message-State: AOJu0YwFExX2BPnMRXSsRmPwAWdvasFJXeNbTopn/ucrXhfWwOSQQ97d
	cHEjuktq0gc8olMFRHqk6VDhypqvy7k2sVzHOW//zHKTMZ9NMcYOkBFBwFft3mec/1yAa2KzlOm
	JoKrvgF1VDYyVFEKRl7v31mfvVn+FfJiIdOr5mXv8jHn+vYHuDbFfTPXUbxj4+vtXq8NO
X-Gm-Gg: ASbGncuFDt0BcB7UEzbk4LPvrY7AzXQn9XrOlbWjeAwBu3OqRpGIZUNifxUhgvKT6Z2
	259hbpO6qaPrM3Scsxleqild/M5dvB4eE9Lb9TkkJ5nCGmuvzplSxDXryJj533sQ7x3RCS9UplH
	Ebz0qIPSof5JzsdbcejkNOymcVdcwGBDb5t5ZxJx7yT/sA9pp3ITLJMj5ZA1HQOXMOZuIEMWVtB
	V1CiISpNdodLgZoh12SEKfdhXW7fguefLlwQ+icfBHgmCRatcCrSapkYpp/RNJTEUVdmBfS7n5G
	MSuSDTuTrVj6vrEcb8T1GkXwQejN6/yr1zSJaad+L6klIQgC+BGetto4AjwQUaGVyxeOB5CXI+J
	hzvU=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155713885a.4.1750431161613;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSbj3zLVYKtfz8K+lKDPK0MngK/y7uQ3TDDGuLOc5VoymNZIeGKtQmf1ZbkgF7OimM7IZMA==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155710185a.4.1750431161098;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ccbsm173800966b.70.2025.06.20.07.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:52:40 -0700 (PDT)
Message-ID: <e1b552c1-de9e-4c6d-9340-232427442620@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 16:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX8bFEjkezShvr
 Ss60mLTEtJqtUREGGlXiFl4wnd5VEHgg1iKuvaqMF8bw8MqFW63pzKlUU3VdeijP+Fsaa0t0EyY
 /vnSQkeK3cfhcM1wpuZvSseh2sxMILdOpm/B2QaulMpTyThGMktZg63kkW0RPjm7/JGfa9vF6UD
 9NWXKkCMn1uMjYlFnrWWpkQcC/qPZcWQ4/tgd7llsapUKHs4/Y6CldmR31A4fSATmjhE1A1S5mD
 v0YNcrXGe5YAQ+q8ojQlu/c1OMnF8porBkx8EVr4CozKlyVFnRb5LDJ4SlMsfHBEf9DqZbnfxeQ
 AcTVVTAacGETB55z7vHMuZpiD2t3nUgIu1GSDfsRhEElGX5LCOIOXa1tdXFNvI+IkhGM81rrSHQ
 iNf3OS1FIPyat4C9DdtyAGwzfCAiFrGTOJ8y7lEqq1xkiCUsm3DLzclav8dVbOVSDF12sqHt
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685575ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=5RVeKMBEKdVlAG-YRsMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: z6kZf0uvDeIZiLj3P96M09dl-DmIwXC1
X-Proofpoint-GUID: z6kZf0uvDeIZiLj3P96M09dl-DmIwXC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=759 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104

On 6/20/25 8:54 AM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

