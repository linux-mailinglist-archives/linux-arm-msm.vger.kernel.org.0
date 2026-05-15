Return-Path: <linux-arm-msm+bounces-107899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKq9DrESB2rgrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A037154FA41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A2D31CDED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32221EFF8D;
	Fri, 15 May 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glt80ZL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IF6QsB4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61A37C11B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847400; cv=none; b=n0rJfJ/6lJYooryxAdSuOIiDolWjcPWrzHnhXBsIqJt7487lOFUvKyWwlkaR/9XSG7P5F/RIvtpnOJCNpccQ9h8kmMxhTt0ZhH8VsCcIh3OUzUnrCboi9CQQogwuQgmtEu4sgFWZ02yAFna0A7YfJfzDDFZO2Hgh1XSXx92c2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847400; c=relaxed/simple;
	bh=eLTXmZ1JepO9DXZHTUUe5FQ+sKYQYfTLhnkNdqVZ1wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHPwgcCFV5DUIk/Uru8sZLTFoNZmaEJymv4HMk4TUdoDOFm/I4di4Iqvmdi0TZviOa/SRg52afyab1Eh0uy01XsDJ+DmtnIC5Y6+Le5DESCQigdaNodjYJWAFKzJNNrXl+mI7a9zYWOhfCDYYrn4aLmatX8DO6fBOPd1ms/ZFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glt80ZL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IF6QsB4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBVXPU2676215
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RauJCwjNs6c1IAD2cI6+lktF
	AP5npagaxwu7XB6lenA=; b=Glt80ZL8FDYXgbl85O8yyce7deoTVIksn8NpccVY
	KhDXfpSdgcSKAthi7s5/bTj2UvEEArj4Nu+W3AmEEM/0gAagoxfMkW8B+B/2I184
	stW4MhWjz1dS35ynxetCwfklcaxTcq64RsV7OK4AzQK54FGCHqQCxVaoj2GJ35XE
	VqIoUbRxZ0X+8qeieDjEIRb6NMyhRom7DI44abviShv81NTwnD23lkJJubvNeYjH
	mT9vOrJnzYOWUIwjo1rrDZPUune5PjF3ijLm9R0ZNacAHpCpf5mhaPDrPrBHTTM+
	wlFTceCTeyuwojbCDWryBWugTKNHEtgegC2ns/zhGtVezw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu6y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:16:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6327b45f59dso3023387137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847397; x=1779452197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RauJCwjNs6c1IAD2cI6+lktFAP5npagaxwu7XB6lenA=;
        b=IF6QsB4JkOwCO7x0kw6HyjzyyvD92OPyZxSP0sSeK3USoWqz6UbpM1/SM/TbXlRyWG
         Sk89GDSKd+Onei9qCwByWg6lVAVEkg5Zqz7p59WlL8NskhsdJ4BM60hJ7RHOIK/9TGke
         gwnKK7tK3xAfwh6EVoGowQKGPPbSdqvRFKOME4EFeOCf+ZrvscN54NJPlHyVRhgJcudm
         Q+7qg9CEYjM2bWK0soMriXRKdVZTe8dfCTT8T1yqKb/iXmDBxD0cqcC3rgDAHeXAgVgm
         lb82aVPWN7IxvjZ0s5k3J6DWHpvbT2t9lACzxZUupYp7XxK9HChZ6Y0uVPSRPa5mIV8n
         rsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847397; x=1779452197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RauJCwjNs6c1IAD2cI6+lktFAP5npagaxwu7XB6lenA=;
        b=SSyM5fCowU/1HoHUuMhcm4Vv6oH+c42ztgTA5KZr7T/76EXxH+J1gqW9AvT81vwjH/
         JQPzFFype+9ngm1S26XA3GIPrLfL+mS2Z8Tr+4aEZceMTqRWbWmKVKP7szL0wkLtWBjl
         6zNby2ylfMwGfbJhpWr0pPsCt2cqvjsZ29ctZfsoLVwVpcGlkPzuc/zoNOZN9bjTkZuy
         bYrkX1bjnpF7UuUyiyzW/33IrExu+1ifJ091d1a99sbMOiqD3Z9ldNun/4tJtaU78Bn0
         +YnN9Zlmf4Y7uTNJqp4IcMEbRGK8wGHwX+vuWj2Vsf3urj70pC5HE3zR2mZHEuInvjvZ
         b50Q==
X-Forwarded-Encrypted: i=1; AFNElJ89EDYM9783t5ri8m3FbzcyHaod+SIlRAwxKeS0CNWyWlrnl18uVn9yrw017kKo7KhAunEa/UrcJylrwmPV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjhd8VKBI5NU5n6k2MoNTqLrtwVW5P+q4Hya01lXe2s/vXbiZu
	ssaAf37RMDF9MvTQZJtqXhB30/rzga+H9m9kOqBg3wkDtNbryyhVgZWPuyiPeBh7k2IzGmJNIL7
	vWMjhlicBX11mNiKuakf6MY0U8VU7/mD2oCEzzdwaucsjIEakfYulCvqfUOcHvpwliK82
X-Gm-Gg: Acq92OGvNVf55IkQFz4Yhz8fMm/sEpkFQd8RwxThLYVaHxWBkCml518yWYumrcEL8P2
	ZCHdjnBsOO7fOrV4YQ0anyHzdXiOlcXzWGz3xgEd4Qrj4yPAxu0dYNRp3Ze1NzlfMlQli7NnwDq
	uclrDwJQ0wehRw0dlqyCip+BK/b47HKjbrCY2Gt5RCevK/qbXrw7sKpFV0DIaeBPizj28wlqHIg
	kh4B8B70qRlDmWsJIh+I8FaGKzB4e9+GCGm++kA/AOw5//x3UHkeOqj+eK4MHcaM57E21Ka0mCN
	ZzSrMvyl7f6VRHjBvFThr75GLqe/Kwoz5T+x2aNlrBlaBLO85F/oHyuCAWZ7eeOceRO9Xl7HJl9
	9g3kyHt/Z2ucREjNCHtWXtinShcrXUJCE2Moi7YFQI95xzei3YUoX1ShhZRCSVN23Lm3QJJTM2T
	Su8BQJR3AULvnIqOz63LqdakZnss5wSgs7Tbc=
X-Received: by 2002:a05:6102:3053:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63a3f68e6abmr1493549137.21.1778847397493;
        Fri, 15 May 2026 05:16:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3053:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63a3f68e6abmr1493481137.21.1778847396985;
        Fri, 15 May 2026 05:16:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm1306442e87.25.2026.05.15.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:16:35 -0700 (PDT)
Date: Fri, 15 May 2026 15:16:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
Message-ID: <xaz73xozqqcnrxdmxizt7wem36rwqe5ted3mkofuhmr4yqcsdi@3d3tav4pt6ta>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a070ea6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mHUKrEjVT4bwi_mjxIsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX1jBfvB1zesjX
 P218CXBF1JdxPPYA5+jSJa3sFLtG4+U6xF1A3clRKUfoYJmIrES2v68QP+EaIuzzC+SPSE/ZipO
 XRhFW3mLWBQcmtl2pW0kDMmILNqeWjO1PUMJbRs1Djm82KTCwyKi6D8xf/yQNUfk1/N8ECPgD9h
 R0COBO1TUSQfF/HwpOAx1hs2tv3WE3dpsqcPmm5ed3FEYGN4gp0WqsHFjQJE+sZMzvvRN7Aftvh
 KEis4zzrP1LVnLYhw4miOjoEgVuyByRuGKsUauKp8MAxK+ns2ze9EdtaqDwcFzlPk/WClsWi50h
 uIN+SJBJyV5WYIcws4ao5omCyRBPnTHE+w7Vwy9mjjKEhF4JTWfmLpUiNHY9Xufw50+mB5+kWcU
 5JsDNcKw2irsPoDZVpPd2tuRz3qm3E5hIMf7TNMstZowkl351M/bEHng72YNnrG0s5ffLShejWX
 XtaSIqujQLIVQNeColw==
X-Proofpoint-ORIG-GUID: 4QQrbvqYhIU1c3QkgbtYa_CO0I1v4kXf
X-Proofpoint-GUID: 4QQrbvqYhIU1c3QkgbtYa_CO0I1v4kXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124
X-Rspamd-Queue-Id: A037154FA41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107899-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 02:47:01PM +0300, Atanas Filipov wrote:
> Add the required JPEG encoder definitions to the device tree.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..dbfc6cc051f3 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5198,6 +5198,58 @@ port@4 {
>  			};
>  		};
>  
> +		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
> +				cell-index = <0>;
> +				compatible = "qcom,qcm6490-jenc";

Huge, huge NAK. Wrong indentation, wrong name, useless label,
undocumented cell-index, wrong format of other lines, etc.

> +
> +				reg =
> +						<0 0xac4e000 0 0x4000>,

0x0 instead of just 0.

> +						<0 0xac40000 0 0x1000>;
> +
> +				reg-names =
> +						"jpeg_regs",
> +						"cpas_regs";
> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +				clocks =
> +						<&gcc GCC_CAMERA_HF_AXI_CLK>,
> +						<&gcc GCC_CAMERA_SF_AXI_CLK>,
> +						<&camcc CAM_CC_CORE_AHB_CLK>,
> +						<&camcc CAM_CC_CPAS_AHB_CLK>,
> +						<&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +						<&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names =
> +						"gcc_hf_axi_clk",
> +						"gcc_sf_axi_clk",
> +						"core_ahb_clk",
> +						"cpas_ahb_clk",
> +						"camnoc_axi_clk",
> +						"jpeg_clk";
> +
> +				iommus =
> +						<&apps_smmu 0x20C0 0x20>,
> +						<&apps_smmu 0x20E0 0x20>;

lowercase hex

> +
> +				interconnects =
> +						<&gem_noc MASTER_APPSS_PROC 0
> +						&cnoc2 SLAVE_CAMERA_CFG 0>,

Wrong indentation, use defined values instead of just 0.

> +						<&mmss_noc MASTER_CAMNOC_HF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_SF 0
> +						&mc_virt SLAVE_EBI1 0>,
> +						<&mmss_noc MASTER_CAMNOC_ICP 0
> +						&mc_virt SLAVE_EBI1 0>;
> +
> +				interconnect-names =
> +						"cam_ahb",
> +						"cam_hf_0_mnoc",
> +						"cam_sf_0_mnoc",
> +						"cam_sf_icp_mnoc";
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,sc7280-camcc";
>  			reg = <0 0x0ad00000 0 0x10000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

