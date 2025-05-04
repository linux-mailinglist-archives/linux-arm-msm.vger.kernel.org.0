Return-Path: <linux-arm-msm+bounces-56695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE80AA86F6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4D93AA44B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C866F1865EB;
	Sun,  4 May 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku6FPO7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078C71747
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370127; cv=none; b=RNg5Hu9Gw+HbLOD2yHoewb4cTFPB2RDYhaPbpyRXsXu7BMDAWZdr2mR6J2YfjnmhEdtrHqjXgxVz7WjCScD2k340GqIsKfALbf5DkumtpkeB0wvjufRuPbgYmsbkvACgyIqWXwFm3GS+CqDtxnX4ju/p32Vr9ufs8jLTNXjvBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370127; c=relaxed/simple;
	bh=MS/B8ZUUNnsg7IJuWoWCIHTMuL7RXXREXTteuwgvw64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K76HBBx7qM7JxWBzC8cqQ2zEtZXMjXLff3/CA+c2Ak85Elfa3TRoBfzpq5TcrXXCT1knU3FegtADAXDnjrUjcvdDuArj9JBrV/AoRqclPhtrcVrkf4sJh1DMTOD+sOzghR1lvd1wNyBw6mt6D1n89dbg46uCw1uDfppYulDiBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku6FPO7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AQuWS000379
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 14:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nz9orLHhAFXVJJfjTniAzAzW
	Ii/GRqSx8BItJUY++IQ=; b=Ku6FPO7RFhyfiyxPf8xse/PunAF+dhK3Bw7BU2qH
	E9U2DF7x2rHuXvwiOVu151e3cym1E6o463zLJmpioMI0m8u3bIzPus7AIutDKPFm
	hRC4h/OELUts5plSb+jVK/kkM5DB6omkA/n3KKXLMJINo8wbN5Regc10CLiuT7Y8
	NSwyuOrs0HskYS3huRDJ5U2VMrw4dMvSWiyw6ZofQps9pPs3zfbBPXTdmBlxkblJ
	C/OpSyiRRPLuw2z+oJLM47xfsj38Km7fOPzemt1y0Z1vrWOYnean7Sexv0FZcOht
	lq22PTCugNf+/YaDayl9V2af6jyeLV5XQ+q6yLRRFGYFLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsrkjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 14:48:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so57495185a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370117; x=1746974917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz9orLHhAFXVJJfjTniAzAzWIi/GRqSx8BItJUY++IQ=;
        b=s2Cq/8rH4jrlk57GwV+eTPdbcbbOn5WYgiuZ3RZbPbTqVU/5iRsRxACRRXTpK6ICAd
         PCLP2BxmNlSLlF25h485l2lNA5x1Ov2H5PU/CEWXtskjL5CJwyLmN+nJLTeCrXqVwLvr
         wwzb93lZjNBNgNtBMPNkTkEX0XtfVKFe11/mgZO6BGQcmZNPljl3VBHsecooBV0/VQyY
         0Z9F+zfRgt73vkje3PCIcES0Q3mo759G7jgYyDkHyDmud+ndTYUyLp8bHX5Umepog7j4
         dPdwsfRx0dTBtydW/M6Y5wB5hychcYV0El4hufcHcWIzCzcGY4xIQZX5rdG7s14qgtJ8
         e+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Y9UpqiwVEAeJbWMmp1sr/5j2beKRtVqP5jyz+Pdj3ucXb98/2eGyW0d16lvB3XFDj25FqPquCVlO6Ed2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VXzsQsgJwGulx2Awcy7HGtHgzCCSy60qvw2rI5h9guUu5PEk
	ER6m7MV5X1SMuGwYna6fJWFVySuoDDPz/fJxbs59887gb6yO6uimp3ghEAffvsaGHoj94tGP1PM
	1Ff8KAk992aenKAeAnHAWkgJ9dDP5FTTdcLoXwuS9QKzktBlasd/u/LQwbd6lG7Vm
X-Gm-Gg: ASbGnctiyeKBEoRVmkfkCGmH8tYAIzKdefn5u0HaiGEMrsrUinVzhqTD3QUh7fNwdPb
	kRm3XnFYfue5g9lsYcdBjrFGBFge0aUCOozf6uamNArI+BiZbPgJbDfm85jBAogHeGT4WOf+uF2
	Zskxhl57zmeXAGky1xgtkIaSiETgQykR9gIS6rhO8z/3jmFz2Mne+jDfk2UFk2NR5Waw4yzLHkw
	/S5jo7rpSNSFRS4pBqcAMn94JcQrVXGItomcMs8UB+SWnCN+dpfOs+NLeR3aPH+gbTiaVwcapFc
	t1yBVbLaPbArACGXyxHFqmya0HmmeJ1M7zJas4uwe1wBtmMAEfSVqDKB1V0Ks1ToDGUYZqubDLw
	=
X-Received: by 2002:a05:620a:2b91:b0:7c5:5edb:f4d5 with SMTP id af79cd13be357-7cadfd6deacmr738566185a.2.1746370116866;
        Sun, 04 May 2025 07:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Dgpdh6IEqM0qU7DKjeXny5wWp5zIHm1UOfoTiG8Z9nNyeCEmHvi/8i4uuwqAFPEvneWPzQ==
X-Received: by 2002:a05:620a:2b91:b0:7c5:5edb:f4d5 with SMTP id af79cd13be357-7cadfd6deacmr738563885a.2.1746370116555;
        Sun, 04 May 2025 07:48:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e4aesm13074681fa.113.2025.05.04.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:48:35 -0700 (PDT)
Date: Sun, 4 May 2025 17:48:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dang Huynh <danct12@riseup.net>,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm630: Add modem metadata mem
Message-ID: <lapjaf4edsuvnw22khjiuzhtiwrxfyiijcwj6piw5n5yby5ik3@r2jvfgvx2gqt>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
 <20250504115120.1432282-2-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504115120.1432282-2-alexeymin@postmarketos.org>
X-Proofpoint-GUID: VolSJYQecBN0guCgRTMQ2RYCAVuSWlT9
X-Proofpoint-ORIG-GUID: VolSJYQecBN0guCgRTMQ2RYCAVuSWlT9
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68177e45 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8 a=fVfY8HrZJKPJkriw-6cA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDEzOCBTYWx0ZWRfX85FHO9ucPVl4
 hyKW/d2Q1LiNwZA2/54irUpeDng4RYzrY24r6juGlqAg/phZixxus+rtt5Zd//x211rnLhGOWJ6
 DKqePa+m1gf3w8cgM+sIIUe2VmzrePTBqZn8zOWZJTDbCbrVFOw54jiZ1SRU/cJ9c2wQdyl1iiy
 ookxI+Lv+LqQeQHW6A0p+ElKIgOylcJ7zfhkNkAKg+Z6s7lrBuELdHzuvxG3qN4opaCRPR6QAF0
 aqRJmYJpfsjWWD0gD9lFHZKHa9+oKVJKD67gYq3dQ6P3uUmb0E4xd2Q2yNSPsMu+CRb47BdZDXY
 vL0YZSX8auon5e9Y7+9oDKmhrrIrDhbsR1CjN2axULvEPpDNQa47Ad8A8W8j7AFSj+y8klgGudC
 Mv4VUzdx96XxNUbeV8acHGwHUOqsBfx2rAwXjIycgzE0CSoz5e+psRfavjM9oW+hi1AvD9fB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=670 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040138

On Sun, May 04, 2025 at 02:51:18PM +0300, Alexey Minnekhanov wrote:
> Similarly to MSM8998, add and use modem metadata memory region.
> This does not seemingly affect device functionality. But it fixes
> DTBs check warning:
> 
>  remoteproc@4080000: memory-region: [[45], [46]] is too short

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 2d3820536ddf4..8b1a45a4e56ed 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -509,6 +509,12 @@ zap_shader_region: gpu@fed00000 {
>  			reg = <0x0 0xfed00000 0x0 0xa00000>;
>  			no-map;
>  		};
> +
> +		mdata_mem: mpss-metadata {
> +			alloc-ranges = <0x0 0xa0000000 0x0 0x20000000>;
> +			size = <0x0 0x4000>;
> +			no-map;
> +		};
>  	};
>  
>  	smem: smem {
> @@ -1056,7 +1062,7 @@ remoteproc_mss: remoteproc@4080000 {
>  					<&rpmpd SDM660_VDDMX>;
>  			power-domain-names = "cx", "mx";
>  
> -			memory-region = <&mba_region>, <&mpss_region>;
> +			memory-region = <&mba_region>, <&mpss_region>, <&mdata_mem>;
>  
>  			status = "disabled";
>  
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

