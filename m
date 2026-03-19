Return-Path: <linux-arm-msm+bounces-98705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D4tJKnOu2mXogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:23:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A782C96B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F84E3168386
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4F13BF694;
	Thu, 19 Mar 2026 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLioZZE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5zUD1rq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052993BFE2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915625; cv=none; b=ed/EQySQ4V4QQ7uM2yFuDfHfdEj7WJHxIdMbBaHevSn1csGVxnYKo/HQq9L5mGTEXXzux9PaLdp/sIxWn2/fhhcqyxvPfPlt7djjL+6a+XXRq1KD/fwhq0EDSbqsYhgW19EaihvYHWYSTGXO/MqbqA7PdzibKRF7Nl1hhpAWY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915625; c=relaxed/simple;
	bh=2jFx/lCFqUCfY3+otPGnB9VZtpOk/1zC/2scijMVNGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOkNGUP6dZBwGP945ZYLcl4G+AknS8Zncjckiw9MQY3q2gg9QeQKyDMP0+4TkAgEcd6htLu6nwmXJCmeP0B7ZYChYaDjOgNNJ7T/3RgeoBdXUEtKC8MxWJCIXU6GwIeG63MgkqNaBk6MRw8FVKd9GRg61CGhKRcwHFuoZb9YheI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLioZZE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5zUD1rq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73vgx1898557
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpIiN+v8TGLqAYQCuL1HRFsq
	2um7nT2fXHuAbL8RWsU=; b=CLioZZE8b+T/E9aa3GDwaPXoRHtUZ4fCUooEDuRM
	YGkAldXBU9jLPRAGN3EPV6mzFEYfhEBTOwHkAAmmM1jNrz3OiMbc8mDnRhjJaiFG
	ihm/mj4VTBlscxL0hX/DmlN3zFJhgGT/ScdfKzAIpA6rmhgmC4UAvHmRug4bDhh0
	2+Njth1IE4fPOYYmztLYd4v9kpoOU0betEEhUH7EyTv2AvSPgZ25XxB8s5+BNCg9
	MpSpKlEImaiLHdOI8Xb9K3YuOdZx4kqncMe4HVyIbunljotuUUlPZaDOtT4hx3mF
	0hPzpZYYmWHawkDR3Ur9freepBwv6UP44escejVx6SeJsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgb1xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:20:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso46464161cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915618; x=1774520418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpIiN+v8TGLqAYQCuL1HRFsq2um7nT2fXHuAbL8RWsU=;
        b=i5zUD1rqDN/BhuMBv+YY5r4Ey26DmELgcy5pUk7ztGtI1krr2jXBA0KGPY4gvnaDF0
         QDdPqo5C24Q4VATV41a1koMHnblPlxUhj1tgP/7KyiqYfaPxiopHNbtbFKr6a8orLjnA
         ne/0NrZJvdAcEhqo1CMjSewmDq35RjQze59DNLdYU7AGIrxBdLDvetUuY+jNXGiL1OlT
         fZVXfv22qOQ5d9cezi+Kc1mF7y6XOAoEaE8snmEV/GeRsR/TQaaY6BoVXxtcc6y7CGss
         BNOvGSfBlm46ByMPf/NouKRLWpC4HQS6eGycL8tXYe66e1V/ZdWgQ4jhxLvLTKbimmrQ
         yW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915618; x=1774520418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpIiN+v8TGLqAYQCuL1HRFsq2um7nT2fXHuAbL8RWsU=;
        b=N2jaCWYGVLXQUKSyhSguFl34acDkYEQMsEOsozL1DtitVR+M8vejRS0gj5DEOV7fcB
         13TebC6e/Dx5sGa1wQkf3L+UKaZYrIPVI/xLOMWpE/0KW5oph8OrUzD9tbZeS82izAWH
         VnRMDxsu4u/o/VT8m3DZEpeitrRYblehCMlaJtavT6v4B/1GtP3Why+msaxFFTZcvTjt
         XmqVWbKq7rttd7M5thRmK5yYxgiykJwkV/rvEsqLZE3KlGcQTT34kJy0ou5H73BcQMns
         LuSq8JLMkKoURoBete+v1CPvhFR5xcGA2WTqjiJXlTasmgEpiBEzDdFgZlCr9culac/E
         1PTw==
X-Forwarded-Encrypted: i=1; AJvYcCXi9pIACj8J2qo+w4eBwHxPjEioMiJKp9CcYoczNic8kThY9VhTcHMUFNwKmkF321GFbcv1jSdL3jmGv1Q4@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSN03fHHMNYPiU1L+GiIlq5Wup2iSImqvnh/E1tIeud91YYf/
	dc56Q1qZH0g6SVyG2TkJCg+vVuP1G1vvzpLoA4/rvJ9myNuqOSIETL0+cYUrXLnipIcbyewdZZt
	V7fxpKSb321xShQYDeDTfBPASOa1vYTWmCYIYb2Bgs7bjstOC6696AynJaRLnN5mBxozK
X-Gm-Gg: ATEYQzxq+/Wz/QVkDVh2Sf0XVf3gQkhMT5e4G8Pynx5HdKGpYzC/6zByaVJ966D0Wz3
	i2Sr0Of66BMGGtAlBdNyCf0hFGiDYfqiyanOeYHTHvUgYplUwYzk+8vQC4HKnexpZF9KhCTPmk9
	VpFFdsyK1M6uazUEB+fRuIDdDq2TQbCyR1GgK53tFByNmK90Pcy8eqXMi9KYwPRGacq6tkXSjPA
	NkfCcMnn+8i/aDF7Pffzlk2iWi49I2TrdV6jO36tquY2YhUcPqcQ+6xI0N4Eq8fW47g80fuCrp2
	my3v3zoVPhej7nzx1/rGo6CUiRhQOB7XsDHU2+h26tEQveDqII7ybMEruBshDKsVmf5OODvaIUK
	a8h0FPt8bFLNEdLcr+eXt9FF8TCE/PuoFmrNRjCiEyWacIcb1MOQt5n0I9/3ubJ3NMmDZdECYUs
	Ux+TTrst5EiVbm0tBUZm8x6YRW9r/iXtBrY5U=
X-Received: by 2002:a05:622a:44d:b0:509:272b:b3ef with SMTP id d75a77b69052e-50b14866c27mr85400941cf.35.1773915617864;
        Thu, 19 Mar 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:272b:b3ef with SMTP id d75a77b69052e-50b14866c27mr85400471cf.35.1773915617324;
        Thu, 19 Mar 2026 03:20:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2fbbfsm1115844e87.30.2026.03.19.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:20:16 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:20:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Message-ID: <xrs2cvg7do2up2tphzhldymtkijcxzxxluncw5zqehgodxcty5@uj3ajneuxpsb>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <20260319-enable_iris_on_purwa-v3-4-bf8f3e9a8c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-enable_iris_on_purwa-v3-4-bf8f3e9a8c9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MiBTYWx0ZWRfX6fxNkmzqlmaF
 gE74y9TQNdqYPuC9P2OImIEfgpNlvwqlnVEIBO7AI86eKNA3O+nBwg16K0+BMSQv19vd55CKZSK
 GwW7tml2wLWANd1NcUltD37LIlbgMNxGAd5+DIDF5jI9LUbKx4IBoKGSWVOivQ7BNyKoPDJyDYq
 4HE5TBHfOj9AsWKYyZ+UDFtd5KEWG503l9xuuB1p/+4wPxR5Hfwk/bONDz+Eqp05aBzH2nzcSJK
 hAcI3wizAqKtQSSAe9rcEMJpzL66KX2cJYH2mIvjbgDzG18biBQ4KqafFQzFteofW+Q9myhnmQJ
 pubtjxuySBUVgj1dBX+7X4Lc3P4aExuJbHm95wld9/cDD+M6pw7P0yxVRh308HHNwUpqRrMVckK
 GZn9JXHtVHbw/HcLQXmUz9RIU38MqhI5yD/fm9AbfxUxBMSpSXqzu1llT/8Gnz9L5S1OH9DlOZu
 p3qoKzLp1qRx8/E2GUw==
X-Proofpoint-ORIG-GUID: mijp0mZzfv6BYTZTEl-ccWern2mxgvak
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbcde2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TF0k-g7kNUyR_OrwjY8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mijp0mZzfv6BYTZTEl-ccWern2mxgvak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98705-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02A782C96B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:23:56PM +0800, Wangao Wang wrote:
> The Iris block on X1P differs from SM8550/X1E in its clock configuration
> and requires a dedicated OPP table. The node inherited from the X1E cannot
> be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
> be applied.
> 
> Override the inherited clocks, clock-names, and operating points, and
> replaces them with the X1P42100-specific definitions. A new OPP table
> is provided to support the correct performance levels on this platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
> index 46ffe5353f3d2fe20e70fa8373c2591863708c61..9db77fc734021ae2986ec6a231b1f6f5461e6688 100644
> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
> @@ -153,6 +153,59 @@ &gpucc {
>  	compatible = "qcom,x1p42100-gpucc";
>  };
>  
> +&iris {
> +	/delete-node/ opp-table;

Use /delete-node/ &iris_opp_table; at the top of the file.

> +};
> +
> +&iris {
> +	compatible = "qcom,x1p42100-iris";
> +
> +	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
> +	clock-names = "iface",
> +		      "core",
> +		      "vcodec0_core",
> +		      "vcodec0_bse";
> +
> +	operating-points-v2 = <&iris_opp_table_x1p42100>;
> +
> +	iris_opp_table_x1p42100: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-210000000 {
> +			opp-hz = /bits/ 64 <210000000 105000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,

rpmhpd_opp_low_svs_d1

> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000 150000000>;
> +			required-opps = <&rpmhpd_opp_svs>,

rpmhpd_opp_low_svs_d1

> +					<&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-335000000 {
> +			opp-hz = /bits/ 64 <335000000 167500000>;
> +			required-opps = <&rpmhpd_opp_svs_l1>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_svs_l1>;
> +		};
> +
> +		opp-424000000 {
> +			opp-hz = /bits/ 64 <424000000 212000000>;
> +			required-opps = <&rpmhpd_opp_nom>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_nom>;
> +		};
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000 250000000>;
> +			required-opps = <&rpmhpd_opp_turbo>,

rpmhpd_opp_svs

> +					<&rpmhpd_opp_turbo>;
> +		};
> +	};
> +};
> +
>  /* PCIe3 has half the lanes compared to X1E80100 */
>  &pcie3 {
>  	num-lanes = <4>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

