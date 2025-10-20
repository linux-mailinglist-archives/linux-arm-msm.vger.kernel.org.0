Return-Path: <linux-arm-msm+bounces-78014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E9BF17D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E34CF4F50D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED74430595A;
	Mon, 20 Oct 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWfpXYQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660902F8BF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760966062; cv=none; b=fTBhWQ0fYOtayw8nF711gF5jh7psdP7UxJEQ3z7tdsigNGBcdzK8b935nkRRaDcbkOgYrKA1axSa9zYz9wz0VSnC83IJFjrgGDCOtsXe4PbjBcci5iiUkctIiUgRHFQOBeGT97ZGzKJd7Sp/dxts+UwjPSC8RMwOAgPLuSNv43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760966062; c=relaxed/simple;
	bh=K17iZbxErCB7RRdwUDGEfb/50uA3NjulFIzMFcfuHvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quMj5RfxK5epHc3Mj5GT0JzDwNu+G3vUeGXmpWM4YWVG0X3jDXdSb+YCo7v9E5DLMWs+xe0E2qsunuCdZ+nnbfaQ706QIvOJuvVpje924r/5WrWXjjHQ2TqY+zKJDS+0ftBiFe3toC4BT/l91wpCwGKyXvKZBfaFjcLjdwPEJmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWfpXYQ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBkua0011736
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ty6BZbhHGNlaZVw/wohTLndH
	gnCUHm0DYc4+byBpo/M=; b=nWfpXYQ9xcmouPHG1EZo6TIw8VoYILolk9C7y+fw
	WYOIajmfzo07W01QXctM64WaJQOWCnpi4+0n8V2t6V3f49GxZViKtkRq06BIcXtJ
	eML9Z88ORwIN5wo1Zxv4zhUb6YrUMExhHS/F8YhllkWq/qh8HBqSdLGBiS4e5qTX
	5q7M0VUepKsVowEnTmGv0PgegMSpXkw1syvjVYkwb3Y4MYYIXxm5pZmuqWHcc8d2
	fHbNBA5MwwrSpvwvu7fAx2Tz8QNm5JUFAuSJsR5N/K0WhZeZ5DRJ0uQxq16dSKJp
	9EAzYvZi85WnnsxbL98L5VQxZghYrXFm1vik1vzJTbpxRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469crvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:14:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-871614ad3efso1566461885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966059; x=1761570859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty6BZbhHGNlaZVw/wohTLndHgnCUHm0DYc4+byBpo/M=;
        b=KZF1bIG+y+LItrGzaRhZsSk+B7QlWqSXW3l5SiLhlq3hY6/PXvJYb19GKTRGNDLDco
         KkbqUN6ICBP0lZIWhxDHIWecor/jwlNl4tYA4NDWxM5I3hrsUOjmEJ9ibk8UPV220fVT
         /AZtKA9VzndBnn59+4pXK/sVuAcuIGoNrV+solmV1J1RL9Xy5LqOLkLIP6wrB3cJTdu2
         4H6nuf7TxE6iXJpKstLY3AVHDoa9GOa6ELDfSZm6VWhorA6oJYAq+iSZkpAu3wf/NszH
         Cxg+7iOm1P1UUU6m2BozpC59jAjWp7HfwE8m96KGXzwk+l0PuaziBFkdEcYprKvyMV3F
         uM9A==
X-Forwarded-Encrypted: i=1; AJvYcCWeVmNiONfUu1XxoLBcZoeYfI5xwl7S7AfrRQfNmFzQrHtCed1tkS5UwSvg2POcUONLr/cLfMI6Gbpw3fxA@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb/JXhoWSDUGoiRPTW9ckW0CtKlKTg2c2NJTjQOJy8QbI1WQH
	Nxr2CH7eQPTi0wyJ8yqe16qiPTrwxH2he8hlmrT/R47MNTav3i1iyomarlRakQ9RVY6/6SNL6wA
	JF2N+vaog5NIcjIRFN+F0zrRbrO1+m3u7EtChoQJsaqgW2bCrtYuSiKpxVnaUGNUfggUf
X-Gm-Gg: ASbGncsHrogm3hggllZeUGomPdFbN/lH50LJ6E1m0nMSMRjVkieL9SaRMC5atO39m7r
	p3DCCT/P89C5vnkqhEjCEMwxoPDZbg5ZX4iLJnn1+eb4VlDFFjP3Dr/9L0/JSiziZNI9/8kfIw0
	0kAckSBKR4GhPPYseFYPSoGjKd00mZWlXYyjv1spKP68m9zT/g7S3KQI4AHW4vimHQ/ftowE2uv
	GgVMTdWRW9ywYpnLA7cz3/3tsyql9E+7F/k7ImbMxUCuRGhulQcqGo9DZ2T1Vn+5rfqLRWPbJ28
	+RL7865QW4SNQaOSodZeMNh6OIqYlEWY82BTFpHipxQt1OI4cYKqSYCZAcYCkKTd50ES6fuPusG
	f9SNCzIKKwIxLPsE7GLfeSFSB0wrjJhyQ3oapktiPOaxNvsUNTgaBzQgEuSqeEwir9ynQVAOZrg
	wp6QXk95nZ4K4=
X-Received: by 2002:ac8:5d56:0:b0:4e8:9a7d:90eb with SMTP id d75a77b69052e-4e8c1ab2c39mr47384611cf.38.1760966059153;
        Mon, 20 Oct 2025 06:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE22wgdqny0U3010hR/HovVN2cGDutNcfkMuumHOnhrsL6Tx1eruFqbL+4HBBUX3LaGh5Rxtg==
X-Received: by 2002:ac8:5d56:0:b0:4e8:9a7d:90eb with SMTP id d75a77b69052e-4e8c1ab2c39mr47383991cf.38.1760966058521;
        Mon, 20 Oct 2025 06:14:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7086sm21858881fa.12.2025.10.20.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:14:17 -0700 (PDT)
Date: Mon, 20 Oct 2025 16:14:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
Message-ID: <5hbc24lihvau7s2opzcxxgxkzugmbqmdtqwy23m45j4po23lnh@jyjlbgfjaddw>
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
X-Proofpoint-ORIG-GUID: xetT30BjehQW57FXgzNL-elVRBKjCGZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX6UshDnuG/iP1
 laJBDWLL/yl9cj+XNexjw+TXKKc4ckvmlUcZmW0m/deeg648RuD4aa3jXhN0W/N16EYDEkX6P/x
 PktcfSHW6rUOmEtbbkUIlNFL8UyM3ju56aDN/OLkVqj9ydDXSRa5kv4fqyLvlOaJvsISKepSCHM
 uZO35BsU+ynZsXbKkvMm0pEKBtUu1OlZcY7L5v7sP6HfYqyxD+T8fas7Dd1yxNS5Pe/EwDaxgVU
 xuiiLcmt54a3QBNH/fbs79aUrkKOHI9UXyBlJb5fhkSNJ0YRBHcsKBflceD20VRTmhKx6YE0crL
 qv6QtTuUZPhfOU/W6XCDeeg+TT9BLYXxFkJwVSh2mpK2d7UuTlLhoZBYtwelPR5aOnxXHA2yBVM
 UNPE6TWFGZZ0zTOfEooRDIXG+IYjqA==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f635ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8
 a=GtE7y4fGcSms5GSDMiYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: xetT30BjehQW57FXgzNL-elVRBKjCGZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Sun, Oct 19, 2025 at 07:27:06PM +0300, Nickolay Goppen wrote:
> In order to enable CDSP support for SDM660 SoC:
>  * add shared memory p2p nodes for CDSP
>  * add CDSP-specific smmu node
>  * add CDSP peripheral image loader node
> 
> Memory region for CDSP in SDM660 occupies the same spot as
> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
> cdsp_region, which is also larger in size.
> 
> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
> related nodes and add buffer_mem back.
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi |   2 +-
>  arch/arm64/boot/dts/qcom/sdm636.dtsi |  14 ++++
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 152 +++++++++++++++++++++++++++++++++++
>  3 files changed, 167 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8b1a45a4e56e..a6a1933229b9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -563,7 +563,7 @@ modem_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> -	soc@0 {
> +	soc: soc@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0xffffffff>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> index ae15d81fa3f9..41e4e97f7747 100644
> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
> @@ -16,6 +16,20 @@
>   * be addressed when the aforementioned
>   * peripherals will be enabled upstream.
>   */
> +/delete-node/ &cdsp_pil;
> +/delete-node/ &cdsp_smmu;
> +/delete-node/ &cdsp_region;
> +
> +/ {
> +	/delete-node/ smp2p-cdsp;
> +
> +	reserved-memory {
> +		buffer_mem: tzbuffer@94a00000 {
> +			reg = <0x00 0x94a00000 0x00 0x100000>;
> +			no-map;
> +		};
> +	};
> +};

This probably means that we need to invert things and make SDM636
inherit SDM630 and SDM660 inherit SDM636. Would you mind doing that as a
part of this patchset?

>  
>  &adreno_gpu {
>  	compatible = "qcom,adreno-509.0", "qcom,adreno";

-- 
With best wishes
Dmitry

