Return-Path: <linux-arm-msm+bounces-84932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC44CB3DA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A45B73064ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5A0329C5F;
	Wed, 10 Dec 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH+SgwBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtSeIk6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B72319855
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765394531; cv=none; b=OXqxLlW2pyfeJhv2+B/eq+co1I24KDYZjBtqK9YdUfKB+niZW+a9vM9mMDhPVu/kTB73T/T8obPaaj0M1XsRdVfTST9WGmtqYBSm2UMIDX9zTr5wbqetlln2gukhs+tA0NxHTMHB8dEsH9pPCs47FKC7eD6W/JgH/cLNbaN1W2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765394531; c=relaxed/simple;
	bh=oe0ikDlQL5bopTGzWrLt1VG+7xt6JUgMFE7e02yEg4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icanUsiJTjgALu4n3l3XfktNwx2KQUBXdeae9WW8zXWKM8sCxLWoa4BGNjypm6XiGb/+8fBxj6M9JIzkS8Yh4tHKENUvXYqzR/qly+3QW6CFwHF/YPmBKdBWhZgjHDPa+J39ToCRmX396D3LKUVjoXHvQsvpvbxPS23RqitZo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH+SgwBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtSeIk6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRXgv3178227
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ULRL24+CGFWPlPz7XFfWJtJ
	J6lfhUn+g/U4fOUb+O0=; b=UH+SgwBrrGkbCVfU6Q0sryaxb9yjOouEQ/3xnWB1
	qRcwg9STMULjyrezUVms86QZ4JWoRXUPcwDEs1/2ReUbMZcn+CRl4obvD/2SbgUJ
	KbbWUAtwUfWeFtTIEKHh4GdtXdZaltJL/Xn6OQAjnVwcmtNj24kuIqzK3Kmd8HYH
	Y6lyGDu1kcj7BmtWMPYJYXBCCZ6tnUED+8n3gaQXufsSirBEMUY91G5zr3dGyQjc
	jUkACmSIPH+1PndvKAW1B0pzOXpOYW1ACQVtjJLyPtviylXRr8HYdPW45Jq/+zNH
	6QnI3tErufvAL0o948kxUiwRVVk3p2Xm+fBzCMVmaVtFZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp2uj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:22:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6e701d26so2966091cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765394527; x=1765999327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ULRL24+CGFWPlPz7XFfWJtJJ6lfhUn+g/U4fOUb+O0=;
        b=TtSeIk6+wcpYeMOxn4LV90kcmDif7+9rpTz5+YOrTlsaWZo8XrBiHETv2PjizEp8ar
         l5R09qNxrCb4EtIlEaJUsrI3NjX19+or1QIeQmJokNS70x38geG38xfOgRtPJl/8q3hn
         RcxadFD+K7q17p/AulrOs/CRDv7m2LNBwydYVpUq2IVQD4ew8lrsB2VRbu2AZvMPG3Qg
         JmHhO1sceSmXRmidHFys6sd1vQ0oH5GeXZ/OdZfz6F9/ZpmVEMYBQnW/n8CwEzNy9mu3
         hAArU48XvMpZ6ddyJVshYLtfA/cg9N27gBEM5ObYolDiWZ098NiqdVuASpNhG/SaSlfG
         yOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765394527; x=1765999327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ULRL24+CGFWPlPz7XFfWJtJJ6lfhUn+g/U4fOUb+O0=;
        b=AVtLISYWE9GR4kceJOWEILwAdMJGJVHy6YBW8yTbyuiBP4bWew0FsUl5rrTwDbK10t
         YjlnLCgo7CODcKFub5Y5mwikE0D94eaKp99qwo+Q69D/Ou0fMbcT09JEk0aIaFZ//i2d
         S8k3/OFZ8jvJQxvLBGXLk+WU2hRoAQIpLEmkoeafc+Px81O570xf0d+1egPGHATv4bkH
         gwLvR0vAlZs6ahmzCt8FUPyKtb+figTWC5/lnW64kO10nno7F7mBwBlct+2LLaepCsdJ
         eXtFtKb/0pNLPIzGiU9vLlN0k+yXSZBUBNie3/hbCgwKG6poh0n5/yLqHMqGNxglf2k5
         AJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCVR2DR8dwSH/0UgP3K+Q05s3iHq1/Uwuac4XegzeAJoqKG+APPtl33wcMHDPah/uA9ltjAnMa5dpnF72pKp@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4U3HR+8RggUM/ZoORZI30NMJEhMbe0n9V8LjgJrzjrcgWvfg
	vRTEbM9oM979z3+k+9nwrssU30U+TwGoQMEDRmGQ/9kAi6oVDeB0RglP8rpjjTbawv/ZYLB9bHf
	V608oYAu6NRebYvE6uZlZbriBgxdWyLQ6n2AxRe2G8uBk9MNqNDefHi4aVF06NjPf4mD1
X-Gm-Gg: ASbGncvlSoPJjynZkWnIlfPgIBH49PNKoeT8JcperVDcimfUKyl7FTrIRDUV6ZDG8ot
	2OmnXEtAAVyGawTXw3woOmbQ6ihm5/yagYCVtxD2qK0twxriECIYkJQhXIsZ9xMQTJo8EFV5nAN
	+YivcBExqqdXqM7orS+WRzOsHHRHU+6n3ztGfC7VUiX9fXpOfjSGCR6v0iZXUYuiReAn+o2WFRA
	hiFL/Li3ZDBNXfFfQssae6LeIW5T2nBIeCwQeF8Cq3GFZFigDDGhH0d+NbmeouJbn/k7DMDXniD
	nx7+xBRvlNDoGcYBX/AIeAbVopu3CIkOwkHg093GJPbOJfzW9aszsPZc1YOaRoj00l6hdUwbUyY
	dUMImYqgl1OGuoyAr3CfpjKC4Mnps78+Xy90ZCjHD0tK9bIkDPE94Fa/Fj1aZWniAxxhhgPxdO/
	2gCqYulNHODWqrDUingssuVyc=
X-Received: by 2002:a05:622a:316:b0:4ee:bac:e3a9 with SMTP id d75a77b69052e-4f1b1b6cedamr47953781cf.68.1765394526934;
        Wed, 10 Dec 2025 11:22:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0WlKrRbiz1bgd5geeM4IgW8G7fHVtBYUl0TqwUi0xGuXadXsl+K0/jc2lOlX7+ZBfvL6i4w==
X-Received: by 2002:a05:622a:316:b0:4ee:bac:e3a9 with SMTP id d75a77b69052e-4f1b1b6cedamr47953201cf.68.1765394526362;
        Wed, 10 Dec 2025 11:22:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3199e7bsm89696e87.97.2025.12.10.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:22:05 -0800 (PST)
Date: Wed, 10 Dec 2025 21:22:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
Message-ID: <4cuvkuf4tsrt4orx7um5pcscy4ynzc73up4sukoun24eijhoag@4wld35m5rfox>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1OCBTYWx0ZWRfX6BFslYKMa54Z
 UJzew7Q+ng6/uZh/OIpuRyCKnNNlEbrCwK1o3yquSoRgSah1gdFNLXXoC+Pt+R+uJTAyjH3b2lI
 iosVbnOSP9Bs+lewPYbA6b9QZb+KDUZfO2KgThTn3kXmOyLulWWR9Eb+WDhcJbZqbDBQRKwsVcL
 TYF8VJteOpbFu1/f50lgQfVPDy+LQc0+yCLTf63+8+HjsZ16/ZFJOx1+7k/b5RoydKVrJkYibAT
 uNMWXu69wFE53Jg0dsPUCte63w7CKnTB+HJgN+2TfYkuYMSr+UbmMjBCmzbogTPww/yWZueXk2Q
 J+RBnKK/+grvMh/4cmtWHHbca5x/ErgJdWjxx4o7Oj1yPkpmjZbzNqhfb6BZipoRY9ehYh24kVq
 UodgdcuaUCoWALIPo2lUvL74DHI0RA==
X-Proofpoint-ORIG-GUID: L7d87KPhZQKzj7oRCrq27WCLpTTzqoc0
X-Proofpoint-GUID: L7d87KPhZQKzj7oRCrq27WCLpTTzqoc0
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=6939c85f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PptT_Mh96ff8s3TZVEoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100158

On Thu, Dec 11, 2025 at 12:32:24AM +0530, Jagadeesh Kona wrote:
> Add the cpucp mailbox, sram and SCMI nodes required to enable
> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 73 ++++++++++++++++++++++++++++--------
>  1 file changed, 57 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

