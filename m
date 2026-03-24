Return-Path: <linux-arm-msm+bounces-99741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEJPGlsAw2nRngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:21:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDA431CCA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D2283039725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC2035E921;
	Tue, 24 Mar 2026 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO23y/td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRApj/Ww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D134C808
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387285; cv=none; b=r4PX7a+L3ZySH88NbbT99LwBSabjamP/LSOSR80l/Px8xxyQj5T6f4aG2NAoaFdM594drtMxvX8NN6qaeJVq6QJrXqPMpwKpqxCe3YsOnXpKxppGlW/OKMeSJT/VfrIbmNH8MyASuVfOXjkQ2amAYtZjf7GuknkphpKABQi+sMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387285; c=relaxed/simple;
	bh=X5TqivP/mzWuCDSR3clNcA6pGI7KNYgeFKAM8z9kWu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqVlkKJTArU72MNn5NH7Fmr3Pqnmwy2k/EMKSUP8uQtfItSDgz4o/7b1Etbn5FGTixjLhSrKn2WvkqIimZs9gzA7/IaYW5Qa555iXJdqQ82gU/bMSP9MxcVYampB3AX8M4szfLkpaoITITohzV7p9xKCCvZGxYPD1o3oKTJNjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO23y/td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRApj/Ww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCiYH907717
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3FlVWLTLrlb7q3MsUEt7+4a
	cg5XbvcZD8bNL6gYowM=; b=UO23y/td6R8s5XAVb3aYpvq0RCAJpjAN+0xiNR0i
	udK2hvHP7x8GtjIz7+P+5vcjxtaBYpQzahKLUWGfJtzXzzUEolA03bdcnTdsZblN
	Hes7aOJy0WqMEI3funjFNjwiSG4I8KVBTR4mTV+sWzZCxu49B4mMV+Ak3Uywd4So
	6HXaOdam4zBGX4S5EU/jxoOgeWL03grrFFCxrMvyVvZh8sw1XN30mop4qYC2HThV
	KAf+7/Zn/JUjuoG3q4Vlcwc4WYGTXZZq4nzRptTHdH0FCj1E9F7xc7kWW7kDGR15
	oGiJMl2lYMP62PGdHWvYZaSnbDQKF+0cYufGs1DqyPqQWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9qv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:21:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso299428981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387283; x=1774992083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3FlVWLTLrlb7q3MsUEt7+4acg5XbvcZD8bNL6gYowM=;
        b=NRApj/WwZ3KHEQXG3dQ1xYTwgeYXePCEark5uHcojhb8F06oSq/P2IovWd8ETq1nRN
         UwwqeIRGf18cP8+nhKGn+iVPwwCg8H/SsvpARvkd3N9RDl+Znadp2Vh4tb4GONHdVfuC
         CSSraRq81MYfHqAJKqVznFI4Grurcc/IrPH/7gaaG3mIxtOeWBhOyeg8b8jPH8YiHgH4
         IoLbf6D2HiY6/er3kadIYAw70bGxn0GeK9zdckzN+2ZVn7y6r2nSxd4JQ7HpnxrFkQfH
         W1paPk9l+y4CeZMkDlKyw8/Y3vBHbmakonvNI6Gtoaa9MUkGyZyd66WAZQS2R3/3sLYS
         JW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387283; x=1774992083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3FlVWLTLrlb7q3MsUEt7+4acg5XbvcZD8bNL6gYowM=;
        b=NGmh1WFI5oEWKKACGfqGYHRGySUCVya3A1MdowX2HKZG75CeCddxEoNUBogq3gJsY1
         HDcuMQZ07veZB9iZKS5yjsA2G9F8evehEJJe9JKuDI83XWED47L7+FiPBTanLuA1ixm0
         lvJMnceudAmag2Dcq3rFRykdGgC0LcEiUbMisRIJR1EUdAop8mwIW9FI8vnPTFIGehjF
         Zy1QddzKB01cIkntS+2qN70SAU1Du2+7mwBOWGQ0lODpSoJ+Uq5XbXDzrmGGVvyldHlM
         jpemI/HN3NfPp7qTvSe72ZxU3M6ot0yPbUlGa2qJQnbpvWIOi9xHVI8ATqN4p13cf0H7
         /A1A==
X-Forwarded-Encrypted: i=1; AJvYcCXsPiRk5zXI/WGLZoAL9+9gIXthTIGmUCzthQeoMQLWgo9eHEm6bElZw0dL/XTgPKSkpsexyWSrDBSMNggy@vger.kernel.org
X-Gm-Message-State: AOJu0YzxASGAgHDBzWxJ8t59y6XIJeT6N4w7KxHD8RVp49NHbnFyMefY
	HT8biZK0d4Ptc7tSMLXkWvQP909TP3UfBNO0xwmazaz9uBzzyqcVK4uEva6N5IMypHcB6xhS2gW
	MRosHXLriuPnJP3nlCMEdOlicF+ikBAlry4jCf3KWYL+bwG6VcaCypejVAUo9bLepUvBn
X-Gm-Gg: ATEYQzzZ1BtahSUclEHtTyVfM4DAZ2UIgVt0CzdaZZ2rLLNPo5HVL2GveBi8ppEU3sZ
	LDuHoXd3NwRbF9EqZ09RiMEG7UKg42Hcozw5s4ywIDDPlRDI8NxPfy2wPIvq9nbxltqMOhJOjBg
	VGExwXl8XxiN7cb8mKlUqbixh9YKauQRhJ1b3znqb/YiQu9OAdYmKVmad3+g2Nuqy546MA+KtrX
	42J+Yn/sFtXi0dpsR++TO1S4o9KeLUmVyKWCKx7giTnCCAkR81dSGaJbzDqidD7ZglOiSgPgKAn
	EpvZjocHiiDUJoOCbVXURDT7b1ZjE/7WP6TIGBfiI8ZsUVOZHKn68rD3tIsuvJyl3gTek8/kutf
	8zT+K5RHHnVaHKKqVylYytDrBZ3DufLQfapo/VErSHeZPNwVxHVCphEU3BXjsbPyFyyjuzAJcWZ
	WbGm3gRNawNZ1lSv37qxKl51EXngtPD3p6Ebo=
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr13854681cf.50.1774387282855;
        Tue, 24 Mar 2026 14:21:22 -0700 (PDT)
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr13854351cf.50.1774387282388;
        Tue, 24 Mar 2026 14:21:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm3469740e87.41.2026.03.24.14.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:21:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:21:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c30053 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Xl-en66mSFc_yb9iBTIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fmU28evgJBBBlSVDXdKb6QT1w-Ox1cji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX0y4rkzsAd50U
 k6sbCGhNdbzKZubtT1gWrpK0chzG3/HKuq6J2uDyVT0XsS+BCt/dkBauQ3p54yDNwb7UddozRa9
 vNzl2A9K+idR3X9nnuz6s4mt42xTL1fBJWgM3lYniDcyVcMlx14+uyRriSLe+Q35rwrO/OhjUv5
 QXyC3yqMx6ZZQfR390MTrdgnH9+AEPJFVwwi0fIkRlPfTr5S3PNviAFj+dKFZfEluxDUykJRPfn
 pV1YdApL+Ql+4PqJtCQmrmtmInOrnvIiPg7YZ7wflmGY7+uAknrGn3MRYIY9INq+nHCiRRc2Boh
 iIqwGu7SfQ1qwegHJBK1AZbkPGWsJ5SQPj2BP/AJ4O4ZF/Ug1DANKGyrjxHoZYHUydMwk9mn/Tz
 tmO7Ih1U0XTj//8V05y26niKSwsxyZFx7CMT5NJGIhFXMdMvVZ4mECVWTh0obRwpE2oLM27WGLS
 A0/HuNZA8WUDG6WEHLQ==
X-Proofpoint-GUID: fmU28evgJBBBlSVDXdKb6QT1w-Ox1cji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240165
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99741-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DDA431CCA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:15:32AM -0700, Qiang Yu wrote:
> Describe PCIe3a controller and PHY. Also add required system resources
> like regulators, clocks, interrupts and registers configuration for PCIe3a.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index bde287f645ee94116a489c55be3b7b80db3815e9..52104607a1713323fdfe2e7de710e38c1e22d06e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
>  				 <0>,				/* USB 2 Phy PIPEGMUX */
>  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> -				 <0>,				/* PCIe 3a */
> +				 <&pcie3a_phy>,			/* PCIe 3a */
>  				 <&pcie3b_phy>,			/* PCIe 3b */
>  				 <&pcie4_phy>,			/* PCIe 4 */
>  				 <&pcie5_phy>,			/* PCIe 5 */
> @@ -2360,6 +2360,318 @@ pcie_west_slv_noc: interconnect@1920000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		pcie3a: pci@1c10000 {

Incorrect placement. 1c10000 > 1bf0000.

> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;

[...]

> +		};
> +
> +		pcie3a_phy: phy@f00000 {

This one too, it should be before PCIe3b PHY.

> +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> +			reg = <0 0x00f00000 0 0x10000>;
> +

[...]

> +		};
> +
>  		pcie4: pci@1bf0000 {
>  			device_type = "pci";
>  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

