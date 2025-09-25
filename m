Return-Path: <linux-arm-msm+bounces-75059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD06B9EAC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3E6189B263
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AA72EB863;
	Thu, 25 Sep 2025 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hN8krS+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE486359
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796347; cv=none; b=Op3Aq1muZjydkp2Ydt5tXbI7STCa2ZoS/9CsxgHYpNzrMG8zuIFWlEHtqDTHjUvwMgQllyvvnl0K1aOipi/CGApUtF2lNgLef7KAk2VLsJdRToIBV+t+MjyWzsQGxWKVv2sTTvC5WXw9CJVvzwSjpn0GpvaT94x5xOHYfsv5AOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796347; c=relaxed/simple;
	bh=HQTOdtr+qdx/m72wmgNGbMLdeMwcxfr4c+KhH4Yq9Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDeN4eLnkO2AaE3/vCqbmIlhnl/zAyQ6ETLJ1u/po6FWwpB/PssRFDeEKGYx4UDqNZ+HAyNtwssuFvi4Z/fcWqglx3HxP/BZ5cC5DjxLw3ks98zh76FwasaD/G6FWGY20+1lhuunQbKcD95nqAAaTwFRbb2sLUSHLNnbfnuPU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hN8krS+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9YPZU019923
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9EPLkOHQ+nW8B50CQSYf+2qcs/EKYauVlPSbGFcsJ0=; b=hN8krS+j6Q6It3fX
	2yBlB5BwVf0ue8wDEyBE1q13UwrQwf5fixN+AIrnFi3jR5oJCsKp2Cn1UR2ePKYU
	1y/+Q4UNWBT/md9GCbeUFzMZhznD4CNLfs6+UFDeiTpdHL5DCPaRBWr4VsrmFh5N
	a6zCRLJVuDu4NbBntQMWGoCe5h0eDLgJGy402nf+X7Nd89UEWqguXMe5wpLZfySJ
	D24bx6DvlOxC6Te6ghZ+NbEhTr7e0UpukYPnFvO3UX6OjCh7UpCKmDHMct0mIXyv
	r1q+ec+8lFNOZcIQLDvITiiWj+l1qrr/UcdupO5Eo0FhBEjumAfKg18HTxIp1UFa
	OGF8jQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe0yy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:32:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85d43cd080eso11197785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796343; x=1759401143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9EPLkOHQ+nW8B50CQSYf+2qcs/EKYauVlPSbGFcsJ0=;
        b=F5Sw76/+C+TIFwC3145ksVOg73j62JOJV0LYbTt3qUvDM3iQzgjas4UXPgde2r4m/8
         HnF7RcnHjgdu7E/l/yGQXdIvQsoj/rvn2fhHX2TndhFSqCVDjMwpysmY7RxslcrU3jZD
         r2dVFzeVQAnurOg/1GiDqUcGV1hN/1ZwRYDpt7YXq+ftzp5VKavBmnMoRt+iLjkbHxyE
         gcFIguRnMBpY9y+6zy6fisIub2vSaH+af29rypmgCHnqGrHfyZitybOyFMKqUcVOvKM2
         osulFwZ1xvM8bZh9gtqSUGZeB+84r5DtTG2VPOuwQ/QMofXxx80NCQ+P8/xGUKs7oj+l
         /E1w==
X-Gm-Message-State: AOJu0YwBXVFpQtTP1PT4AR2rySHmZwl5+8QvTxBBobAqzMkWjg9JrRH+
	TEIZ+au5js8SkA//R86B9YCD/+Z05Y71O4YlTTrvBNqlpkJtSWhLB5ragUG1ssLlRMqM38ziLlv
	p8UC6Tfxem2bfF20gsLHjhmy6I6ciDnJc9KwGG56iLVfRAORR0QWLOAbv67kx7cKGQ5PuI3N8Fc
	zF
X-Gm-Gg: ASbGncuHf0SSdzc+6jdginzeBE2aSvhnd+2KXgoHSmMDv5Sg+V7SS+YnFAG6QRorIAg
	Gvp9e/9j4IrYm2YZd5glNzltT4ZpwfrrrKgd3uPVLvDeM9p70UyTCd7M7iRS14mmM7uzzvd0kUx
	MZRzYMINDKtbM/CyiDLDAg6YmJ8qqauUw0UFM5rQ6iZafnC5x93sy/6JmvqlmkrW1PsneDxKQwi
	0VY3PFMYcP4MTggFtTbjmWHl+w49KDTk3yOUDculmcWGDEXBFEZzgLkacQTSl++K/ddn6qpQKGk
	LK0zMh27VQS5+xnvcdQGPKz08fMS72NSPTMU1C+YC3QG8ndXBP+3EVxIApp8lRSL67U2h+4zUpv
	z6oafedJwq2xLMmE+QFqCAQ==
X-Received: by 2002:a05:620a:468e:b0:850:75d6:3da8 with SMTP id af79cd13be357-85ae8d1be1fmr217526985a.10.1758796343248;
        Thu, 25 Sep 2025 03:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrfUlNU55bcz4nXz0i0xu/T6mVDI/gqlomCgirM5MRBRQq4GVnXDHqldtsjAxpYhpAFaGLdg==
X-Received: by 2002:a05:620a:468e:b0:850:75d6:3da8 with SMTP id af79cd13be357-85ae8d1be1fmr217524285a.10.1758796342683;
        Thu, 25 Sep 2025 03:32:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7506sm136913966b.52.2025.09.25.03.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:32:22 -0700 (PDT)
Message-ID: <09b2ee28-ee2b-46a8-b273-110fb0b4d8a7@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oCLgXZBDNqG3B90kULFHsh8MNQjO_leM
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d51a39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XhRRIRvm7l31mynVaKEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oCLgXZBDNqG3B90kULFHsh8MNQjO_leM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX7mZnTVPO53LS
 0LHTDp3FAiYPfHEzXQ2c/V9edy/ctNsRnrpJ8ugUrgc6UfnYFTRu8hqy8dBdZNUy7pXUbCLZRlJ
 SKMdBQwZDsaUnDnLXULJZsBg8H/n3Vht61ABVO3Yt7l7RIyVjYNvIjvJqxYMbSvmZCN3Dw/EfTE
 /ev0x3KvjzHec+b7/dgsmA7/gAbpjduLJxZGItl2jjdC+/0AilGPkBL6pGtMb9xD0m/ANsvjHzL
 xh2BnGvlGKSKM3jDfBb6B+RFEhWryIGfXHuQ0Ott7kT80bNufbymvFqhP3WRUhxL95/t5zdVhUl
 ERVKMBSiLI6SRFUI3ECfBhDKf/ptl+R76JFp/+vqhJ8dXBQ7er5FltMDj/IZKi2RdR6IrinVJ3+
 FjlrvqCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add the pmic glink node with connectors.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff182005d67b8b3f84f956a430 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -79,6 +79,34 @@ key-volume-up {
>  			wakeup-source;
>  		};
>  	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink",

You *must* include a glymur compatible

> +			     "qcom,pmic-glink";

Are you sure this is still compatible with 8550 after this
series landed?

https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com/

Konrad

