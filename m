Return-Path: <linux-arm-msm+bounces-68329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9DB205F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 854EC7AEEB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2165267B12;
	Mon, 11 Aug 2025 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTjwMIBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF226529E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909040; cv=none; b=KmtbB5tnNn+60Y9V9vnU1GYFBEn7/qxJLC2tZSC+Ax5KDpFp8/fxKtVUcr6d4FKcxxhGhdZNgQt3MI5ck8Yj4Kib1whtYKYmDCYO7b+G8QW7ueSAlkX7KqZsjttYhpfDbsFmXcCW4/bZiZbq+nA7gTeXJhSxbU3qK6pZWjDDhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909040; c=relaxed/simple;
	bh=OrQf5TeKik0aA/FhPSEBXH6grpaJsQKJVsOv7xshB1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWaJWoqUJVwmmRh8nRFWOyM/zIC1EhohrnrH/y8J7XlGX+1F1pYjzRebWuQCVJn+XKXeOCZG9Iqm7G4nrrXnedwbZUM9Gh42Tbl2M4JNW1rPsRhT173k1+i0yzW6pWYYbT6e28NVaWgj3Kt13J/G152+FdYpQ7ExVcEOAiqBo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTjwMIBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dDTh000688
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HhXbP2+tna5Rc97KVm0kgr+C
	8N/2nVWZsJajTcTfHec=; b=RTjwMIBC52U1VjfbSIfzSN1mAUaM2KKVo+Z2O260
	XTreoGsZB/KYV4rhJT+n6PuSeZr873taoyzUfkfxRGL5rDWwn+dCYR8hTtZEdo8E
	+/Zq/8xHh6h9fs/k+hPLMm0bAvlFDlY9QkTm8UYns32DweQEF4sk+bfIscU4ZTYK
	0ONMH/4N/ljyTD9Gxhu2xbDW7J1gT/ykfBtkK4AdBWCo/xJFMuaAq3D1JMdWMJxB
	P0TT+qrgScff8fw5YObUKhrxgIL+bAt+kCFFP1ZTF0YoKQXj6i1CTk0b3QxX4W4F
	vV5uh0Ifb4TXw2tTiRJQBxwsuqUpvjENWDf7ovJ9/KhoZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6v0t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:43:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af18aa7af8so116264221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909037; x=1755513837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhXbP2+tna5Rc97KVm0kgr+C8N/2nVWZsJajTcTfHec=;
        b=qt/1Z16+o8tRfrk3+53q7EfpYiQ6xX59EgFuRWp/RdjA7T0pxB8WDM1rNwmAtmcfB4
         P7gjFmV7Gk9w1yC9QOpHSkEZtMQuBzxJd9z/s8F9jvLZWg5rJMc2fgwqSIdC4ifMzoZd
         LBn0gmkK7jLOudnu95CV881iA4F9F79D9EwoMNDK2zp1iiKjs/pPFdZ2HuRif2FLond5
         e+1UVCnd/BuEpZA//WXwYfuMcOiBfAKfoNjkq2MB0zgNmGZrh5/R16BDUvBUhaiEAqCC
         KVF+cRo7+rXEwTyrxT6Kso/rgFDsPSfJ4MKwH58G6ck276LxyDn1Wi4jLQsoNPlgLk0s
         pJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUyipIHU8rXWl8XPZyRAco1PeZmgNs5U39yTGQ1+KSM2N/W5vfE6Iq1SVLYEN5EXafYGxBDajz1aPLyB3dA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrk/LrurDQ4gv4htuuCh7wlRvhnzOsVJrsJjDPU0UEIivf+VBq
	ruXDHluEUF4jgifUVrFzLbtv6WL3ceVgOqUOg/yYW67hIRcvWjBZQ631VIISXcY/EWfqQ5jh9e1
	gEcSax1O70TzXVXAPKofo/fkqIsZvOZSjPWsKk/SSJ66wk5zTikMDe3WjEtH4XJ5HLFQb
X-Gm-Gg: ASbGncs7b7J0qtjRoJrbvS1mJy8ePS3RUunIhRxXlNh+DKprc4VqDMW/LDJGjCT4wP8
	ROivKVjy3DunItNX1vxgdWvPrAMqi+wKXGB+uX+vKnjeNF9nyM+Drqmx5mCfdJUJvja5ca3M06j
	42iYLClcMxoutJaWZQ2sd5x7ZifbarnoNpm2OszvJP+b2RcYEnUqQFNWlnJeKf8ZkWMh1+niv0o
	ci3DLohZgD8k0ijMDrDMTfM+8tyEXEnScEkSjYpwqrPyv5M5hQqutsqXrpHJxS1xqW4gnLiguGr
	Rv4VAx/zWuyLO4OBEsb3wyOkEsgBrxBdj3RAIVJhnQkKqN+fab00qlHX/JXhGbA2OAC3mpufnET
	OtYr4h3jUr9bAsrZoVBtSZ/m0PLx8nabU22ZCigiQegvhccVX95fZ
X-Received: by 2002:ac8:7f94:0:b0:4b0:8087:b85 with SMTP id d75a77b69052e-4b0aed7c82emr155599491cf.57.1754909036459;
        Mon, 11 Aug 2025 03:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ+2vRNgiTRkhuWDXI9Wct/WD586NSNRCy2C3GvPTxw8ogEqF2gQptR6rB/WMoGGoXT8d+eA==
X-Received: by 2002:ac8:7f94:0:b0:4b0:8087:b85 with SMTP id d75a77b69052e-4b0aed7c82emr155599241cf.57.1754909036028;
        Mon, 11 Aug 2025 03:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabce5sm4279421e87.151.2025.08.11.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:43:55 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:43:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <ucgmkx5fhwf4tc634gexj4usgzdme7aj44qup5qo4fpolnixm3@dgghylexk36y>
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
 <20250701084905.872519-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701084905.872519-2-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfXw9tQGpyrLqJ2
 cGCo2PWhp3hJuOC7VkiKkgRsLyjmQHZkEC4fhzfUTZAsKYmsgsTaUNg8k056n9fXU2wOWLGKg83
 MFtJfp/+jtvSWpFPuoonaSYMwVQrJ+wLljAdNTk7i5syWwFofLWDM23RyXrOPbMtK3esQ7RACrO
 alVOMgBIGHaIU5R0hvINProqdFzjNWi2byew6LMkNCSOKZIW0nOGBoRhWf90Y/4nFjI3jhaQGxj
 OcZKkR92comUORjIjSymF7o1ab0I3CgZENDTS0kpxImjhwJLtGjYY2yEmCU/7veHotdohXrqdUx
 Thsm3WieFCmjJzMIV5Nz2+xj91xZZ+QK7GWzfQjxRZKlxBYbaglp/BtGqsA3Ab1fOGd0W+QoIoq
 axdaRxei
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c96e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=2S0CspHO_B4CzmGuarAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HU1u2yELKiaePPNP2HZrEPjso7uNtvmF
X-Proofpoint-ORIG-GUID: HU1u2yELKiaePPNP2HZrEPjso7uNtvmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On Tue, Jul 01, 2025 at 02:19:04PM +0530, Ling Xu wrote:
> Add reserved memory region and VMIDs for audio PD dynamic loading and
> remote heap memory requirements. This is required in use cases such as
> audio compressed offload. For example, playback of compressed formats
> like MP3 need audio PD support.
> 
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 64a2abd30100..b1def5611764 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -189,6 +189,14 @@ rmtfs_mem: rmtfs@9c900000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x800000>;
> +			alignment = <0x0 0x100000>;
> +			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -3907,6 +3915,9 @@ fastrpc {
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
>  					qcom,non-secure-domain;
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
> +						     <QCOM_SCM_VMID_ADSP_HEAP>;

We should stop defining VMIDs in the DT and use label to determine them
instead.

>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

