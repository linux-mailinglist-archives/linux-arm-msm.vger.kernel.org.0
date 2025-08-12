Return-Path: <linux-arm-msm+bounces-68650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD7FB21DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA60B188EF61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5331526C3B7;
	Tue, 12 Aug 2025 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiG/uEgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74AB2367DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978198; cv=none; b=Zu2HHa+YgusDEYibvwGSCc+2MquDFVdC0rW/VVdrGYClqhRYebVeztonlliPZBEuUExF2tNGQxSpoEQAzKPtg+LTUol685fXkTbKQ+AAkLKsl90cHi1ozdjCTJEsm7em81+/8kBxf4Kl1AYr52mSdYVvvnbiZHiHob8iQiVg0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978198; c=relaxed/simple;
	bh=N/kGy5+Rvl5NkLVtYUZMJPPcbHTjJ6Zdxnfsjdb3SsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uB/ro8aanfmFO5YhjpeODrT3Hln50v7qEMgOEycK8shvxy2J+EvLf5d4q06dZPGSXaFRthi8MMOnI1FCykSLadacDyYNp9x2wXt6D2dfQ8AffyupllTDP1s6Mz8I5WI5+W+BbpjTiOAn+J0m1VayGc9ISsebX0CvP908OR/GWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiG/uEgG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XLQ1018323
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iO3FGVGfT/Y62Gvgar24D6JfUYtCte/97RHmCrhAXvc=; b=eiG/uEgGVyrbsO3+
	Cv1XZ9Mer3nCiMBO/p61JD6OuBveJMJ4+tj09BN98MHk7OvIHz74bVLWgv5tjNMs
	O5mgMe00qPMNNvVxFvilcWxg5/XThXGzlcfP+DCKRF87Ec+Rtnv72479019NeY5V
	+x3vUhob012fGcMD5ucywKYf2X4smkpgWPC0XlNQO7BuFxc++DrysRWXnU93Hg1x
	Mboc7E1YoDLlGKqr2iQkE5f92WFOyuRwQ1+b/+bxFdNK8FFv4PhQRqkzVztsnyr9
	RaISbD+Enz2ytDG9IKRmWL/KFcBImLVPiGz92y5SToTOjTIKvoEq1hSH2QlYp9FA
	GXw48Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6xds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:56:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f74a64da9so5596817a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978195; x=1755582995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iO3FGVGfT/Y62Gvgar24D6JfUYtCte/97RHmCrhAXvc=;
        b=s1usW9NhkM+kCOqsxAAFJzGCvtTXO4Ri3060SY9NavkLMgl2msEg9u3HR8MaUeFTAi
         W3OABT1J0NIHfaQEBEgdyFusDKXLPZ5VFguu8SggdQwVR9ytjbZBeJAZumHHvI3F4sVW
         d7VKgrGccdeIyybP4UMnbQ7gkOJt4NavnDnzrlbwbiYJYp4e64Z6IxiibvqaqK+fKwPI
         6TwvzXwP1+vFXmSS/MhBZm5R6RWo+95Hy18hUQg73GshX2GUJYzpHfgeOs+rkaFDIVA3
         WM7QooNRYui5140XNnDZjq9IOye6+iR2nudr8lZgcNYVXywk0p0zhyNAK7g263BUHjwJ
         pFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqS10AcbAhZaxhYn259wXd0cgqe5vSrEN+0ahyHSDzeieW0uhm5yZToSruBEZQnW0eXtRvPefQDfmgCREF@vger.kernel.org
X-Gm-Message-State: AOJu0YxL0zaxr418+EBGnPK5Q0b4ggZ9sEPxo7GMYyAYQaOhnAZjEUkQ
	01x/GdRE75TBn++GtZkQmIPMem4b49MFEtxFE+4oO2LrpODnzaRewlOgrPvMJIc8bsJJFxsgywM
	0W+CdnOpqof+iQ9D/UBXfUeCZugsZmJgsM/d3GUx35iW/onfIb6WLAEyF1PXpyiSmzKpB
X-Gm-Gg: ASbGncsm1d1eRX717GLaNc86S0bSIsVZAa4fvo+9dXJ80P8sfA2BvluUXuGKlbhPiXc
	uoZVljbzi8eDmFfYUaxfoccB+rbj+uJz6WVeAaNZtni+bnnVjUP3w9kNH8JcklHF+ZF7YvDRv4g
	u+4oat2vvbsGGWGkKEUzMoznAc7GBmwr9wCNyNFhFWjzXX791mVy6af/35nzSysodo5Q1fsYXwD
	sYvGBMYLbMT4j1oWNtYAvx2qODgD6e6oF3WvFqA2OO0soF6crHkRGp105PrXebJDvh20T0Ic9c2
	jlzwUGMEjI1rQe22ySMNR6pWeNVHLRVdz/xrroyVYEtyIf7A4T+HYjxlay7ICvogOfFbw/Y=
X-Received: by 2002:a17:903:1c2:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-242fc390846mr36339065ad.40.1754978195085;
        Mon, 11 Aug 2025 22:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQs0243cIKK62HPDyRoRpP+MCHl59jbXme4sVvLLXF1a/UdtW7iKiK6yuH3frFPHTDJLThw==
X-Received: by 2002:a17:903:1c2:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-242fc390846mr36338665ad.40.1754978194654;
        Mon, 11 Aug 2025 22:56:34 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975cf9sm292027175ad.110.2025.08.11.22.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:56:34 -0700 (PDT)
Message-ID: <881fe12b-b2b1-4135-b0e8-f8222293871d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:26:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] arm64: dts: qcom: sa8775p: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689ad794 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Ucg9gNHWiGhv-ArepgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX0d0s7vHD8t4Q
 acZEQ1NJzjMoE4L8eT8OsgIUsC3xyqHld1zR0Jnoxj2x/m+oj+WD+xdHjEiiU/pqEnSp7Im1lYX
 OYLfWCbN8wDBnnaZtUDaB2XMZVlIrbmKfLUnIgOSjrapiW00IC7fLzT9yoPBuzd4UA3GBnj0ZqF
 tMj9LMAX7Qd3WCXOL6oIh8EBGDGoPFnUrB+e8PwGSynwOUO6ONAbLrcRsSXQFwnVc2P7oRMdZhA
 nFw89WjZN9ADpWgS1z4SjtxuDu1Fj0np3W7UnVU5Z2K2sndGtO+RQUlJHDUzF9GyBfFdN2tft37
 2Bl+EdLwg6CpOHtcEFvs86Oa4HXcY/13SwUsZNPZ265KSX2ucwgp/HBSSTonsMi2C7jlgzno3yw
 Y/XmHWE5
X-Proofpoint-GUID: gvIsQCw03vsK7VJMPUwjWDIAceo4OUBC
X-Proofpoint-ORIG-GUID: gvIsQCw03vsK7VJMPUwjWDIAceo4OUBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index fed34717460f..5ebc058931ad 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6080,6 +6080,34 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp0";
>  				qcom,remote-pid = <17>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp0";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38a1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38a2 0x0>;
> +						dma-coherent;
> +					};
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38a3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -6123,6 +6151,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp1";
>  				qcom,remote-pid = <18>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp1";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38c1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38c2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38c3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};

You might have to rebase this change onto lemans.dtsi

>  		};
>  


