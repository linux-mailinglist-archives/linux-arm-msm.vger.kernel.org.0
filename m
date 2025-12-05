Return-Path: <linux-arm-msm+bounces-84513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBBCA94C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91CC430865DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62EE227599;
	Fri,  5 Dec 2025 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpuPZvPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTR1Omvk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187B1B0439
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967817; cv=none; b=eXI/3SDhAwQgCvrv5GczKi49QaalSn3uCvU3ixWgV4hlC3C3LFnoejSXWjckzXm/0tEVO5I9/Xq1K7tdhvoM3PB9p11rDfuAgM0IJj8fPCcl2exQ+J4QfpCemluOBvs78amckV7JgWkV47mOu12Lx2eo1+3mf4dsmmKKjr7SxwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967817; c=relaxed/simple;
	bh=NxKmqFjtG+Tf/oEBl8T9P6E2Ko5AWG9c1+gwTLHJDXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZAjCBjXw2drkUS9xzkqIPwY6/tg0V58+gFWjpB8EJT8Axxo8WBgPhMgAWTyBsUxlbRRbWPDRSYnlNVVMPKh5nW5LNT3qOh8SZy9oa5UApG66+Epg5ZVVAagzfjDfleAagWJO/6tJE6XcGoaUOfsI9I085gurWTc/4Qu++77Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpuPZvPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTR1Omvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBGKU648666
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gw7CznOoeqy7ZE8WuH6aXklC
	ydGAte0EmNopHFxWFiU=; b=DpuPZvPkjLH39WxsReu1Ewe4XDEE5wIq1w/Etkh8
	43869rcGv+KOk12BCJBlYjmxYQ8vVrYPPisqndmyetGrDdKfS5//ip/znLJLwRA2
	s1mLZ516qxzmplTVZ4A6TBF4McxklD4ROKopE9Fh5VGiHtAt5ccZ7h5Xw8QAdMco
	H7ZoMZyIoa8vFtRIg4nk2bH4AWVKqWef75Dp22LpmxY1eVuLpeW3m7CX+AwiZI7K
	oR5/IWjv44BtQMndN4dwxVNB0UbabGa4pXRxpQzjLKNlxroobO34i1jhtud6P+TY
	q+9+W1Zx0WZFhyninPtQkWscPof/zxe0VsG18+CWS1II1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ka152j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:50:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6963d163eso117347785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967814; x=1765572614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gw7CznOoeqy7ZE8WuH6aXklCydGAte0EmNopHFxWFiU=;
        b=VTR1Omvk4gInGF/QJhtKfIycxEGFUuxdRsYVwXYNboKyL+VtxHtleSwklFe89Lojqd
         YNwJCSFjUttnKsOXzhdvVmZ1TUo0LE0L2jywAcKJU7BC/NosLw8/K3xsBFnflL5QT9eW
         zlFvi/exLMiBgXZdxQ2WeuuEIVqFkuGUblfpNVp8qBp/yk7MzYjyx18VQ0m1A1Ys2uLf
         SkdE1E0RmQYpXoczku9265i6xKYrPKB1QPe7XM2GTgIY6eTGDVgSPF10B4XDEMO9fir5
         1pMGZcmYPpDg02gQ0eqbsAE+9EWNOyJCwc7bKJMvlTXmmm0ARkuaD7thbaCqhmjFvC+l
         QVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967814; x=1765572614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw7CznOoeqy7ZE8WuH6aXklCydGAte0EmNopHFxWFiU=;
        b=X5uEdX4er4PJNmpspguvFZ+ohQZLdas5qEcZtLz+EDkz4y+iMS5JHGTWTiAveITerk
         zjdbqRKrv5vWO7N2ip1J6hlXMhINs4YZoEyT7HsQ2gGXV3uh5qNiyqBWBeeaSvbzDGSt
         TReYtV6TDWgsrqoN8qJnq7Pj24U/Ukc71wR2G82Dd/hvBFk+FTwRtzSKRE4ew4FOrpox
         eLDF+Fb6KUejIzEaQldy9kaktc01BsX2KYZKt6diusxKAqGWgdy6xP3bVQAIlpILIL+u
         JNsPKhFp5zerYul2LogYFUeHGRoyYrkGNaoLz81dfpah7pSSl6Ev15X0H03j7LVx7YLN
         S3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpaCJDDM5Uo4hl9PYFs+I3vXQj3RFzSTh0wtb3yBTJl+xUpZVSoa7KDAAXbB6QXZqMY7Qq88fGCW1pTdTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlQ3rmwG6LCtTTpNiogITXPTAzTxPjY0fjkJ3n1DzfruMF8d4d
	5eWIqeN5g+N8j/Nc99FEVh0AbKTlNG8NC9/l6sJi8kP5sWJ1e8AFTx/u+Wz0nVpgLcFbei/3knX
	BZ+MVk3TaK/0vIi4fuFFxndpCBo85LsRQM6k/pW6MZsLdVT8SNXU6ercSwzG2fC0i6JNt
X-Gm-Gg: ASbGnctGVH8bIzghk5/IyeTBcotZmIk6pwA7J5xc1jo2BcpD4m+abI2DEXTQ0T9SBHF
	odG66afE7OdcC2+Y4YSnLfv06T7vj9byGnn8TrVwn8eLFj2hrV6xv76JDmv1RVXqRaWeJL/h7p8
	rRoF6Rr/PEeHfrQWO34JZmpniFZKmtj2brH4R2w4mUr13Egg/ljQ3iVLiJ3VROgCEmaePXQ7s05
	Q0mH+qsNG2WjlVYdVsiLp0EUypcVActEdZ0C92xyzOzLuq4NiIbRGKbYEv3uR5yWNI22QBtVeRP
	zST3TaxKz3/wLg8cF3HYv6/I8RhGMG8m+yKRe/pI5NZ2BxZ1yV4llXNdMToWsm17HP0ReZj5cKG
	8FtVNF2MnegeB6ayEZNWgk2m1vZ/xnSG5IdOjM8n9WMXxDdubvpNcJKhsW4fUQCLwXYUe9Idfg/
	+djm1f2rJAm9W/RznPlHxrNQ0=
X-Received: by 2002:a05:620a:29d5:b0:892:eeb9:4def with SMTP id af79cd13be357-8b6a256a79dmr55993285a.49.1764967814434;
        Fri, 05 Dec 2025 12:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxQfS5gFXwOoXS1F9lFdXo5Ot/z20q2txyTRwyA/2lJFyTKuqo6sTodobEz4I40L/ZDD545A==
X-Received: by 2002:a05:620a:29d5:b0:892:eeb9:4def with SMTP id af79cd13be357-8b6a256a79dmr55981885a.49.1764967813304;
        Fri, 05 Dec 2025 12:50:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b245b6sm1790426e87.28.2025.12.05.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:50:10 -0800 (PST)
Date: Fri, 5 Dec 2025 22:50:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Message-ID: <uo6qbq5porpdqsne7a7y3wn5tj2jhdqxf7shy5pc22eo6lp7xq@uzpfng4lzz6o>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
X-Proofpoint-GUID: xsGPZeTOhMCb0hDW9drjIb571MnGfBxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NSBTYWx0ZWRfX7KsxNxXkuq2H
 i2GSGAnHlLSm2+rtJaWebFGhhANkinKti9Yn11B5m4I1MjK/yXAD0iuCiqBqoESow9uth32+Ffq
 ny9iUEXTNz6S7c1zw2qcKJUch5eKdx5cqSHxMRFta7qYU9uScnsTSRbOfRjJZYtsibW0LanbuYm
 DQRMlxTnvD4o9BazyRGgVRrxs66TTAySBbCs1H5qwtdgMNf06dFQEGK9+iib9J3MaH7TeYh8V86
 UDXBYeTr/erH8KoFaYVZ0hiOfC/9BV/y1K5G9vIKxEU0b6Ty3Y0GnA48K/w8RhFtjyKeSr2hrE6
 PR+/bVgzKRE4GS0Pt81CsxB+I0qLErBWNHOQC2LypeA43sOvMkqUUsNQosA8SK0kyI3pZtijaFy
 XzLEHysyqkNzHYrEJx+gcmfV3bkGyA==
X-Authority-Analysis: v=2.4 cv=HOjO14tv c=1 sm=1 tr=0 ts=69334587 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VrvhRaur7Q1QZtYE1qIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xsGPZeTOhMCb0hDW9drjIb571MnGfBxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050155

On Thu, Dec 04, 2025 at 06:51:58PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for Talos chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 743c840e496d70133bf82928e9e0c3da9653a5ee..effaff88df83d5e6a0aab45a2732a00cae11e83e 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -647,6 +647,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
>  			reg = <0x0 0x95900000 0x0 0x1e00000>;
>  			no-map;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -1826,6 +1831,111 @@ data-pins {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x40000>,
> +			      <0x0 0x0509e000 0x0 0x1000>,
> +			      <0x0 0x05061000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
> +			clock-names = "core";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			iommus = <&adreno_smmu 0x0 0x401>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +			qcom,gmu = <&gmu>;
> +
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;

JFI, An ongoing discussion in v3 regarding OPP tables and speed bins.

> +				};
> +

-- 
With best wishes
Dmitry

