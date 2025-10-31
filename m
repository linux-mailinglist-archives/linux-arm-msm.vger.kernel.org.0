Return-Path: <linux-arm-msm+bounces-79910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A7FC25A91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 774741B25108
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CEF34D4CA;
	Fri, 31 Oct 2025 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLPts04a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6/zX40S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365EB34E764
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921808; cv=none; b=UgoR8GciPgIL8t3FOmW23DkeL3sLvcxZO4gSV6SN36MvofXZL/1xN22huFnXa9SlovB/Vpyh+sbttP+w6HPwwMSSTw5EaeC4nLAtp9okOHWT9L5z7TALy7O2X4XAUj6rOcpzt0hL7Z8yih2VDWXL6fbQCLE43wy4wF9e760fx2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921808; c=relaxed/simple;
	bh=5oX84NUeLGDCVUnoaY8enUgJ9uFVY3Jp6pIvf/RX/b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTLAVIhS57Mn1YCkubR9JBwFaGYUX+oCpiF6vSaacIcMakUMUqDnNHHL0ySlCtS1+2Ts4RExCQ8NYgXfGaAHAd0br++f0XsWI0p3bxq6nsz+wwtjIcMKuqPuZwfFePosVfFK8T9M2hD8pwDP3N6FAd6piKIbOKMyyvIOurgDU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLPts04a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6/zX40S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jQLe2471250
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=38cZqr818bP3R3sk/R0K+P7k
	RQE7pffVL4S9mTWl7Ig=; b=JLPts04aopKQrXSmOQTaQkbiDnyAlcJjXeAoyV/D
	HLe90pWkVoCl6cRbodNkDBjdjlLMJT5ginDM7GQrcBc42yP57u4rlPgBBV9gBD3p
	+EPoG4C2u30CZcw2uIpoLeJav6RU4T+t3XR+W8ll2f1BYxc24Z35Tb6i1gAPuJhJ
	n6pJoLw8q6ZeMUZj7gCEE1+GFpqIE7HJgaWWsQfKMctoKnV/Jdxsr95A+vX5qMJU
	r7WVWGCLvUp1Eegy72tKu1no9SCNg4vzEjwaA6XLcsSbSWzKYXjNLoHcqXfADZNI
	Ozvpsmjg4SluCDQ9zVhSvRaPhXJLgWEW/fMN9nogpbq8DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4trv0rky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:43:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a873657698so531924185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921804; x=1762526604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=38cZqr818bP3R3sk/R0K+P7kRQE7pffVL4S9mTWl7Ig=;
        b=M6/zX40SgGIujv251GaBH++jr+Nqn22tIlJO/hBJIyhsW+PPwu6VwLlR3Uwx51Q2Yv
         nYC6qPHQKQFnf7oga/IivG20lwfPpINtREBcvhTLd248SrxCtw0U42P1qvqEztoROXHl
         cnnKbNJJT+saLnGzYRA3NZllkLGnSUVr+19hqgzntm76VWD6BWbTuTy0tHO31bZ5ThkP
         Fn/vJyg4yPnYgvsdIqUVrT751H4Gm1B+9P13xEigPqSZjlI6KD23ROZeeW3LS+wuPaR0
         y3SkV2guotfQE9BHtGWfXNVsWI9Y7Hyow5cJrn/4u3TH9YnOJBaHgKbDQoYqZmfwWnKz
         53QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921804; x=1762526604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38cZqr818bP3R3sk/R0K+P7kRQE7pffVL4S9mTWl7Ig=;
        b=Dd4MQONRN5cSdTo6WpnTwm+WqI87Xx6NbPKR6D1McHmSMe+O6vAXJ+JYMamBE1RJa7
         Yvys/BwBxmcNVqoUSHPlnIRxpP5zI+deZ4NPjR2u/+YEmn5nvdntHVFI2edClZYbXvv1
         WqN8TtyCTn3DKJMhmK0l4qBMtTjsLCdRcmAvoykQ1PPB0RaWPBbW1HWYmeUdlRqJVuL6
         8ijRjCCSfWf/Qj/UdxfctvgR6C9KqcfWLt/6ecf2gLqnN7tGpnO6CtTAnQtDqaWxMLbF
         Cgl8rTg8jClY8SLslBjFFLNZPBaDuy4+RLikFcfuMaf0+Gqeuuei3gLnaEraymOOVE/7
         hRSw==
X-Forwarded-Encrypted: i=1; AJvYcCVA6Td9GnJ+8BXjyHVNc17fzFkUbNCFfotYv7o/G+zrcdX+4sFj+Rlx3XLW12jNFMq5IdHJSbzxYgrFP2Gb@vger.kernel.org
X-Gm-Message-State: AOJu0YwWm75JBGYBSTqIfa1Ev5DQq/77Zmkb/2airRNiDPiECErOchbK
	qK4oNnLqePXz0n2IRd971SU9/M/iyV/Y45qVh7yVg5BI8VhdZ2vs0O3ZRB4fYxNdduPXhbiyqe/
	42Ro+tJm5p55UIEP23LbWBYonoY7kzjxciyYkCn+CF1gtoPJQh8Q5hhkm/ad/8JYOvpz5
X-Gm-Gg: ASbGncsf6qK3nrBigL3wJlBzu2qxaIMkFwBPwHWhccWxeMF4VK5LHYwVrftLNOVfTZH
	fwDOfgBxOjVmu9zfGkorx/dWQApqzkJPtAbunlmnHMuKFa73cZGV+nLy0GEgcwGPLPaAV92bBYS
	sF2BC9uyKuTBCneBzm0GiJwd758T1kO40EWhs7Ioo5KR1lmDu4s8hmwxkZx+/6e9jFtijYVr0M4
	BY5IIAWNuZR+NexHCD5O6/YvrJfFlRidWgLeqYz3057bFONtCBil/fcR24Iv0OMJh6j7EuUyDUu
	CPVh1sAsNUcdo2ECGBskzBg0GZM1kSNbLTYNGwk8CCECWrvS3YLwO06y0382RBqibtwv3xv0p8D
	1cjZmhnSyHRju6vqHilB+eZX+MF8LgicQg1IEfuuh8O2W7E8j5/cCqt6G9Slgie8+qEvw6oOTYh
	FWhisWbxgxNhmE
X-Received: by 2002:a05:622a:418e:b0:4e7:1eb9:605d with SMTP id d75a77b69052e-4ed30d4ef35mr40414301cf.11.1761921804235;
        Fri, 31 Oct 2025 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRqfymtoA7HV6xrx57dAac6CGoayjsZUzza90k4x8oucfsGlZ9mGgHYLl+rCflp4srP5Ygow==
X-Received: by 2002:a05:622a:418e:b0:4e7:1eb9:605d with SMTP id d75a77b69052e-4ed30d4ef35mr40413731cf.11.1761921803611;
        Fri, 31 Oct 2025 07:43:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5b5c64sm533601e87.51.2025.10.31.07.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:43:22 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:43:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Message-ID: <35fup52g3x74fzd3u6irfetikivmuamzcihewaimgdbqnvfz57@56zsehp4sqzq>
References: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
 <20251031123354.542074-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031123354.542074-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dteM0PCNgcoLp3BDv20UwyNyzQgdAOPN
X-Proofpoint-GUID: dteM0PCNgcoLp3BDv20UwyNyzQgdAOPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfXyadDeCz84XNI
 yU+M7iFam+WnzQ4lfmDxxtIF9SJUmK+3up3UTkR/4NhnIXSDJRqUiOvRf8lpanqWI4/PS8BUT4d
 ylHYBxYKuT/7adbnpMWD9VOs0uiHKo9OiOj4/3zApCblMn944c8by9lX1kOUZ+JxE2iWfZuL93Y
 rttlY2RkVDRo2c/4INg3dsLIf0eDEzfo46mRAynNHQNwszb61ar3DtquRcDN+ng3MmKsqZnXXCd
 HoubZfpsVMvhftg7gHvslhsa32gXTPFPGy2B23DwU6uKR93tL7q3U5U4mMakvyPfpBTcSo7pUDB
 bZOjvWfqidtK2dJWzOgnb04CCeIIsMBM1Tjvcgyt5qWJlbxKSamfnMhAtGH7VfKoQMJIYP9gDpy
 tNkmA316lQ+i5dgkqs5S8XXvnR+FXQ==
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=6904cb0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3KAOm77SupsxBO3OpsYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310133

On Fri, Oct 31, 2025 at 06:03:53PM +0530, Krishna Kurapati wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> Enable USB support on SM8750 MTP variant. Add the PMIC glink node with
> connector to enable role switch support.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [Konrad: Provided diff to flatten USB node on MTP]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 73 +++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 45b5f7581567..932aeee70054 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -191,6 +191,51 @@ platform {
>  		};
>  	};
>  
> +	pmic-glink {
> +		compatible = "qcom,sm8750-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  
> @@ -1200,3 +1245,31 @@ &ufs_mem_hc {
>  
>  	status = "okay";
>  };
> +
> +&usb {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l2d_0p88>;
> +	vdda12-supply = <&vreg_l3g_1p2>;
> +
> +	phys = <&pmih0108_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};

usb_dp < usb_hsphy.

> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

