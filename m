Return-Path: <linux-arm-msm+bounces-88864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA58D1AC43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48D2302BD00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0470B393DEB;
	Tue, 13 Jan 2026 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFgqBgri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3G9uTXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB3393DDE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768327130; cv=none; b=cPE+NIJeKZKuwHc60DDu7Gf8VroYvvFVVcQbEIS6D+8sTam69Wp6xyAc3xBH2iJ4j5K8llYdvqfXuuMKN+HJNyHuUO9C+OAL4JAkvLxZw5NEc6Z089S4wigYHHj62pDP2F4P7MiUoZOtazGm5vHJT9JvO1ye3syh/SUwORp7YRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768327130; c=relaxed/simple;
	bh=9MBbhJG4T3kXZlVz1mX/P0WH4d+hX4QQjrBm5FanL5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQF2ku3Q8lq628pZuk4Xgj10W5u+KbcJqLV3tNxUJbWEWuiYiHhfGOBVclu4XvrVHswMi4NEVaCj/1P8BZTibKmE8ysCjiEJlHCe/LLmnKV6pN77bKboe7zHQnLEXoPOSdX6wTikXwXL8WLY7NSTUldp6OcMcnRBlEe2AbkwsSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFgqBgri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3G9uTXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC6Uls2865767
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=StbT6RBQviHpD+ivVUm7MVsA
	Kb8jo1zPIoSdMFEL8Tw=; b=WFgqBgrikHEMVSno/vfAOY/cNNfOSH3ohKq1sbSU
	yYgrEtofVkiPfxhYAw4qiQ9ExKJz5KSqSwdaaYgpv0rlwI5/Z8vmdBsPFxX7xpiN
	FIulvCY3dd+xoW/Fp2ux/ja7EnhKQS73FgCM5cAtBtHKPJ7aT93jeLoZxb7eSuA7
	3GnJyj3Bt10Q2s1DR8Gp/OyXyQ3lyUSiJ2jdtYo8qN7xiMEPlp6QWDzRmU+CqLA5
	OmGUf39245d3TpFkJs9VBuDfvOAv8nIRmfITeSi0rlQjvlPMcs+cpl0ruwsLq/q+
	OxVdfIG2GTT1+w/swq93mcyxQVbvO34hPsIWJp1KW7RD8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjhah1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:58:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so908680885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768327128; x=1768931928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StbT6RBQviHpD+ivVUm7MVsAKb8jo1zPIoSdMFEL8Tw=;
        b=V3G9uTXJuDV4R85RqakM8iKzbxWn7hZdmAC7QHa8sdgq+Eoi1NyWUsqvMymL3JMn1K
         ncP2Lsr+cYKTMpnnYwBNcBwNOoBESdcMUJZraJSKxiXRCHB2PuCEWjDDSYL5hHCID6cf
         ILzrLBLRDPKyjltxxYnTFKqxQRnHkYdIu9Dk4duU/HDcItYMPmixtDngT8YQ+igUzKq0
         4CZks7VLlkf6QVeakKP/BCAtG25pkjgLRShBoxHlBtYW5OuHg1SG+zugz6si2Sqyh9hn
         87nFn2+O/jX0+POFowqZq0jw7JdyRflkd/evqr2ewg6v5VXztxiv6TsWYBOPa/groHjc
         yCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327128; x=1768931928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StbT6RBQviHpD+ivVUm7MVsAKb8jo1zPIoSdMFEL8Tw=;
        b=oeHpmi7RcRp2L2LQ4J93qqrRGLtxUWQStxiyof3ZIgvB6JDSEZiJ4jFDkGVi0ExbNa
         kPOyrSaieMscP2EewlkixYRiDq/jW75/B4HCzZsYN8PMznypFHGxVxCdMhTWUzLe6gzB
         ryRJVmhLxcB+qL5BIt/EQpxOafbYFHUETWbvBAnb/XbsKMplqq3Z0UgWAYdjKw7uyPUv
         XHjrPU6yiL6kd3magvgKvWr0IxsR9tvpu0G65z0Me6wP+zaWUonnJKPJhpcpFmWLGo4A
         VxQ3w6WXxIeS1FYFyN69UOW1DIHOyOGSgBHx1IYK88UaDnx752W7tSv2lKC9gZjx69VI
         U47w==
X-Forwarded-Encrypted: i=1; AJvYcCUSwrL0456pw8wukSPT/+VRe3sYEOymW81L+I/qCNLl27BeXtzI/kf7eT0vE3MhJrbWxVTVep29C1oB5lqZ@vger.kernel.org
X-Gm-Message-State: AOJu0YycxJmzwLGZD+PZJW/Ph2q1w6bGrGA+xlXF7K0ETNOoOm/3sObU
	ZMsDoD54UitDcCMIxRfFsrL8mKDysNSUk/QDWqsZzymp5fdqmxs6FnbBaI/7zgAMoLIOYRw+oUl
	b2W2n4GCL++XfsoY5K5V9fzR/5DVYgCRT1njWErxW0pm3uv5SmPALdMxvxEEl9vRqIXcs
X-Gm-Gg: AY/fxX4B9SOE/O6v6zsDkvlswcfFYzs2oPOmOzIdypEXRVXbunjwNFhX4xyCT3ecy9i
	piPL9N27xinc37UCJtLYT654yRx1P7ZFaZe4M8hR1+ZE/D9Wo+Lri2IYGBiOxSCKWjCI1LmBCQw
	zGadsEsBWbXuxgx7yRP4p1KSC4phoD4Hl0t5K6jXQ+fv4yxLWn/EZsIdsqUt5QW5lyJOeUSMApm
	anlKWCMHRdL+xOylvzGnIIshMOc9dnOxUHS2lNOSlIDhmZTS84uPNN0i4zUt7uzvg1qm7n3u/SC
	kzgZ9lYL2p8ZMz0P1Yov5I0kB9xzbybYhXJzg9Rge8lHMIJxwOFbCvtVCqUptCxcrrxVLm78Q04
	x9ETcyBbwhkv1PFNvS0dK3xHHsiT1sIT/qksYkFHuClzBuTGDsJWBOlIPGElu3FK7Z1+GQkOzdk
	1H2cdxT+GfAWZn8mOludqJlcM=
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr9489485a.14.1768327127909;
        Tue, 13 Jan 2026 09:58:47 -0800 (PST)
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr9485785a.14.1768327127327;
        Tue, 13 Jan 2026 09:58:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b9a425afasm775988e87.30.2026.01.13.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:46 -0800 (PST)
Date: Tue, 13 Jan 2026 19:58:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <gkq7vto2dhles6u4blbvzyhlnit55twjbhhnwz3k24smxb7yx4@gnnq2qbpovc4>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE1MCBTYWx0ZWRfXzysuHZHBpxwu
 9qhI/2eIBD/YUt/KyMv8qVZxfKsTFwART4Gnq3w1OBfj1Lwx9yf8SskYhl0zOwrw+lXucMq7O5v
 K0D+thUcQVqqMMcipLPZHL1qYPg+KjJNOaXl4xzeIVOaL/DuK0W+417x7NO5OB9F2OvyOTtJku6
 eET9tfdX/aSqXi3ya5NQsohfyzGeop3Xur0Hvn7Z6f+PfAfQHdCYhtR2/+PlaKgu8cOsf1uFDiX
 mt9h2uVLbF0rsP7pFQ8n21Y2B+LG554ieh/8NE9vBGhWoCSUpWfg7Xv66uroPUpv6/6CI8CRrhD
 nuAR1dhZoRXyfnp3YPbkL4ViY7fO9mntiTQX0cPq1DwJYiKl9C6tjydS1mBCnQY5uqkigvSdHHL
 sN3wJLZi/AUNoJ84WaHspjC6kQv4jI8HMMDjXrH7sD+1iATBfKOrqV/jVc4Me+b5qgGP6NMlaNR
 vvdnUDZtGQQhJVAgvDg==
X-Proofpoint-GUID: V6q3hWIezkcSWn-B2WPHKMTaFrxNgHqQ
X-Proofpoint-ORIG-GUID: V6q3hWIezkcSWn-B2WPHKMTaFrxNgHqQ
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=696687d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sYW25ZiEPLqq09AedJsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130150

On Tue, Jan 13, 2026 at 02:33:05PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 663 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 658 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index eb042541cfe1..53b8ab7580bd 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -750,11 +750,11 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&usb1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>,
>  				 <0>,
>  				 <0>,
> @@ -2224,6 +2224,249 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		usb_mp_hsphy0: phy@fa1000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0 0x00fa1000 0 0x29c>;

Here and everywhere else, 0x0 instead of just 0 in the reg properties.

> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +

-- 
With best wishes
Dmitry

