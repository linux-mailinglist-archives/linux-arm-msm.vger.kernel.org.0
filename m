Return-Path: <linux-arm-msm+bounces-107217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI8wGuujA2oW8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 00:04:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B452AB56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 00:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF8E301C8B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067113947B0;
	Tue, 12 May 2026 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLMvcbWS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6NPGzeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2139769A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778623461; cv=none; b=d+Bjqrwjb214Oul8lCDs4Fa5TaMqBrT/YRehvC/TCpNbnU9zNrnKQJ6MGZWQyf9S30+7S0ptam+SoS1RA63L5YfbXy34SRenE4dbgQAlmXu7jLREgKvJx3Z6wX3rfSg1GF+dGFGO6T/M8mEtnoGyJxVEUzT3EfZTKxpQYsQvmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778623461; c=relaxed/simple;
	bh=Wg133cLvrC9lkHoz02DJoErg2izbpbqlU3izh6vwTqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4Tj+ONhxLva7G7Gicgp4p4gREAbgAPQ1lf9tyt2lUtnZFA79YBDvHbtdbUOI6yyPcrm7pKuxY8SrgQ4odFkt4OazGn8ArEmXLL8YS6TSZkFn+OopIuJug5Z9T9ADnBhbqet/Y6rSfvvJ2uC9WJWnlobg46b1XLaFnpxyUlXZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLMvcbWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6NPGzeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CLnQGI2232826
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NqS+CDNQVOX3mhlFDvH3E5VN
	dOpuCFOxzb4Y6GdldLg=; b=WLMvcbWSO7bSETtUn04lb48afvNVQEG72YRwCqRj
	fBQZqdhpIQzrH0lJ3WNH+TGHvDAxtNRVyK7ucH0Ii4vQ5oVKJG/vS0Y/6ixPKZdq
	KnceR6lW7d42PXRit73MXpJFEINRsxb8m3eJAyhvRd8Ahm1BdKVDOt30u4DG/ca4
	cw4YT3R3M+y69jwUePwwa0LO6/TIHPedcfk/lH/kTmG9kqRJDHYMs8TlQkGQC6KF
	WCHVEEYtUIPdDtUqWkUN1o3T3hAX0XaRBZsnpdphgehbcU6lumOO1v1nj8//+bpq
	llvNptYsp6P6KvQrunf+VVRxziEKMw0wzc0wTUoqHfIDWQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhtprx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:04:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63308aa427fso1600393137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778623458; x=1779228258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqS+CDNQVOX3mhlFDvH3E5VNdOpuCFOxzb4Y6GdldLg=;
        b=f6NPGzeNfNZ4JeDdfwkZVbzGIp+D96iIT00kvBcJezu1V9sRtzAgR06nRgdAxtrkbq
         CWS77uITY9VI6aNPKUlxgweSV7Baj9ekS9Ss7jKyiBA8oRqQlShH0TME3g7+MjjkaqXF
         yhE8Cc37MnSoOlZYy/l5CVVZ5b1P4T1HVwwCjE4o/3ONMCK86YmEeRMBc0jOn9Ptl/Dz
         Qha2y/ADa/a7LfzYsLwPz7eEgIUSIzlH0Zc1ThS/LNU/aLaNRQDOJyy0J43gSxtLAHoj
         RP6PJft9VvDANktHVtKD/l409ga6CImO+6JawFF/xIQHebsvBL0OugQmjSONLJeOz2//
         5Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778623458; x=1779228258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqS+CDNQVOX3mhlFDvH3E5VNdOpuCFOxzb4Y6GdldLg=;
        b=i3pj4HqllSOdaAaEWBu3MzZQ+2nD+K7LjEphdYa69SsJey3i3gmOn6M+MVC46oopt6
         htuiBIjEcIcK8fF3e5CHWBElKAhYLI92U4iW0atAsKREFZXKQY6JNkyXzSZb5uxfByFE
         3HAsQRmRYvEZvTxohwWDZ6WtmO0NT4P6sO1Dy95D2O+ruVSirb1+Cu6uEw1zg3p51KFS
         39YRuQTtDaJCMjanZsKxL2VEQQSs/BnHR17WEI3Xgq7WwzrjHWz/UUo99plf9VNpRdSg
         X1WDVIv3xczoSR4JO+TpVuP4XqTVcTM1QtKBMYkKH9S9VjeNPr5cMDlCZ2806PwsDsgB
         0tiA==
X-Forwarded-Encrypted: i=1; AFNElJ8TT7BBkTrVYsC/styMI8p4OxeXlz9uLhDoS43m0S28noV7Pi2OFNdfh0zy0Q9tgTUp5CSNl9RShzsrKklh@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOSPT3hm8zdi8cH+UnR/+bKrAx2lxSyk/3bb8DZkh264NXX7B
	MAEXFeaybmAFUoRwkMY1F1FRUCCUwyOiMY+R598rnMOkompYa2sxo9yOCHdHfkw3hjhw5MZdeJo
	Pmp6a1yJaaKIRG4gde8gNZ85IhAjo/6wsbJmqAvEmeuCH/MFXMN+y0AnOrc6kXgHPeo0Oiwmg+n
	z3
X-Gm-Gg: Acq92OEPQXl0QYPlCOqn0vhfumLofd3e2OPOGi89/pzatPn0VGWivwqrOK/egugAz20
	vGgk1jL2/+c369MWi60tPx//+G6kYWLay+N1YfaEt5KKFTCnx0ABUx/srwwy84xJwcsh8JOxO+G
	NYiSCxMMFfR4Rbgp/fCVTURjm6DaeaDkkbUpaWtIRA2tLDYP2b95ndym0FuhmdaJYt50Jumeu0O
	Ck0sfADniAvtVSn4zlo83ETBdNPONAvvnzxOi8lqhdaR3U0AS5YkqowPh8+/qr0nxuP1XDc3dAi
	nD4e4mOwXGTM7Q/s6/VTBMFnXQ7I/Dbcu6aaNJ0DxPgQDt95vNKL024OR3Qft7/A+eE+fwTt8rw
	3jwpsgNkOw8+aix7su+/9+xn7hZYBxNpO6YVEjUzVU7749Km60kjwVI8XrI9hGX6tp119sRbgD2
	s0eggCuygYWKH0P6xh/SJ/7SZIgEEgbANqEho=
X-Received: by 2002:a05:6102:424a:b0:631:4580:6a42 with SMTP id ada2fe7eead31-6377422fe76mr307913137.22.1778623458453;
        Tue, 12 May 2026 15:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:424a:b0:631:4580:6a42 with SMTP id ada2fe7eead31-6377422fe76mr307883137.22.1778623458013;
        Tue, 12 May 2026 15:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm37023021fa.34.2026.05.12.15.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:04:15 -0700 (PDT)
Date: Wed, 13 May 2026 01:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIyNSBTYWx0ZWRfX8AD6WVH3pidd
 /mGSdpI2Gqr0fcY9OOBk/cw05GOMMdSBqJ167MS4+xuk7BNcRgHykJVTIRfTnli3F80iYT8CONx
 uvPEUiFXLZWMw0iGPvmk7fE6t14AKAWQer1l0ZDWTEf3UPAnkD03r5YzK7EQb+bg0Isb/l0Fsx5
 nZr1O5Qr4HU/GD+yvjpehayDzheZV69Db2jPTastPfOj4dIapZT8GrEqI8t4qKBeq9xw+ytAVma
 Rqz5eJtGLi69R7MsSFxGIK7043PzcsXCiWgo0vzZ3zd9g4/qANP9ptfZpIUtC2xNcj5sn8UIfkX
 VhdEAsdnoA2Q4R120Phpe4WAzyR3AdP5FZy7Vkl4P/ZNW1huJNyac7nTzCnMJguj83T7HOzFu1c
 ZK9M8azcW9ZX9eHsVIj/EDl17VNaIVOhZ5GCr9BW7HOaeBrFmd4slzLJFYtJ+2CSA8omn4gQfb+
 zQHXsKj2U9CX/jF9W2A==
X-Proofpoint-GUID: bkc7NzaGVtwEDXdlrTJgci9rb7QcOpls
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a03a3e3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=erItJiyUAjbEpTEIgrAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: bkc7NzaGVtwEDXdlrTJgci9rb7QcOpls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120225
X-Rspamd-Queue-Id: 687B452AB56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107217-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> 
> Describe the port and repeater, and enable the USB controller and PHYs.
> 
> Also specify the ADSP firmware and enable the remoteproc.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
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

No redrivers?

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  

-- 
With best wishes
Dmitry

