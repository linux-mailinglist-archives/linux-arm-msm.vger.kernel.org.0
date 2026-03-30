Return-Path: <linux-arm-msm+bounces-100882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFRzFgjFymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FBE35FEBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7020302A554
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7812C3DF017;
	Mon, 30 Mar 2026 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JiBx9eEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6Ut/joI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418483803CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896383; cv=none; b=UZiCUP4hFSeKXdn/H91UX0xQ+5TFgrQ2he9Zppj7+c7xBec28LI4Lg+Nh64SDxD96SyFiFto8JIBe3h3r5mC+oO5SkdAhMXSuzKLkEaZ8IZA66j/63IDtKOKzYnJz0G4xL09y9om9+l0DpSRmslGINtY3KS8W6HdxqBM29dMBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896383; c=relaxed/simple;
	bh=S9lc86k/Y4qFuxBgxCfmBhcIc2Sx+VaWysuoANFpZCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrOz1Ux6iua85Hi58gUGkPGvicNxo50TL85WA3rLiBpOeh9oJAu8C+I5zN9TnUggc6n0L/VW4VVh0O6Fgi5CHRWK8n+OUdzH155MiR+WU9zuijhAnkl3mZWnpLxVr9YYOEK4f1cTtkUcwxIpu7hD8+eup5OOmBM8vvnR9i4KsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JiBx9eEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6Ut/joI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOKtf1557457
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YlM1ScDcIC7T/OBmrEsNdkdT
	nKpBO+7YzO81PCK6Dr8=; b=JiBx9eEGpxQdmtUhtTl5YYOTwFKWij16Of7HUJ8k
	PBC+ue9M779pE/hIEDdY1nESVDTeuPR2odw2yWYW6D1PR1D3Mv9RzpwZ7RsyORsn
	gDHw0iEddFs/cxeWThDWiUVfZUmIFiaOxDmT4NJHn657SBZWzCovyHhatx79YaqX
	K0e4rNmH8G5lYwtWGbmRGkncUeY+AufQCkBXUskyyp5f3XulVpXUSCMNQ+OES5Lu
	DRQQ/D5CmMpKwIx6IHJvfbe7rCA+bp6V+1mCOpLQ3Bn4xRiaSy1bys1kEVqoYSde
	1P5ddDv1K4yrdst6sryfdz85S4f6w3B2N+HNrZJXv54IvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm12de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:46:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so91562461cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896380; x=1775501180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=W6Ut/joIXRxnEd2GrntVHio1oIJNeQryXydOoboV5+FC4GScy/y5sCaJSTRkmUEf+b
         Jmoi/JbQnXrTDYGBwHMKgcq6Bzx767QfSy8gdAY8dZpuDC3Ux7xmHcpfdqWr9ruWz+Nw
         6/nQqi1OTgRCbqci6+kUPwuLbixXCNqV4qV3O1pelSRGQHaoTnie7fd08niMY/foJFfT
         VQ9ex7R3+tQJ3kgOY0THNd35+pBhLCRiMTu9xANlaIpiIDYCl7N3S9SeBIakECBRjNHO
         UgoBqKq5OAl4Z3EUSO4q59ZMTQdobVQRkcKjWSFJXIMz5+TmK6FQBuwxzJhoRhu7K7Vs
         KDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896380; x=1775501180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlM1ScDcIC7T/OBmrEsNdkdTnKpBO+7YzO81PCK6Dr8=;
        b=jb0c/TakD9YLRWIiEI9cpYd808gc41MtUz5vxS5rCviaMobphvFwXfYQrF2mKUWA77
         bxMsS1YSULbx5BemqCsnxlleaXqEuALIF1aHASJN69DbS1YrnL97pKnaSGlYNV7/0cgw
         V+UMylbyH4i+ZdreXVNcCSqYVo9QvB9hNImWTYro1XVYGLdzzJTCyHcFYBOHEBJNy8Cv
         SNHpktN3Ksxo8FXGqk2L/uR5I2yP57chyw1kd5EKB8HsJ3mtuXQFxX36v4fcBCVrfQaw
         CqHwE4qpGdiXxbqq4jmeD6fU+M0vqGqxrJ/cPNUjRgXppO6uAwh5R4papwR4aMq7q9lJ
         SGvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6h+m3eOLEnfcl1DSm/wgnI8pEWST3QTmKl8fpUX6JvV3z6ageUhqsYr8AEbRUiAfoodR9NMHDQrqug3Im@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9SKN+am9zgaFIv/UD+Z4PtOmyOhqxR8kCC3Pnj0hysQ+A2cw
	oC19/cBZGFA3g6cecUocw4Uyn0EOdTsmTnBEJy34boGtGCdOJ8JgpppPTgIR5zDxwQuHS+b3bD3
	nRPXvhk34UCtN5wwVZzq7fYywyg5xiwJNHFEYgkO5ELOsBMSU1sAsyoRub5EuBUB8nEuj0xmly+
	N7
X-Gm-Gg: ATEYQzzEMLu5NfKG/uN4tHM0OGD454GTsZP9vvPtqnYQKAb/7q2+ASAFzZTtbpb+OKS
	hpaom0GsThjrQS//nA7OimEt2/Qz6RApzuMgUBFwIphU3XKWH9BrsYIsSGhdB7wRaZETZTDScys
	20ESsGOE8iN1snG2yZ4JnS0M/B3/YtMQjgMV9XH1I0FsCszMlAFAqqrEYRybz36NpZA3Vmqg0pe
	lCniXF/TP5uJ0x92iiULGZY0WR5lSK92tjWyziJxFPTi7G1tcQsaSPSFQrdlnq/Xt+fxT82V8b1
	dxmyPwMvuBVc3ZWFc6+6rEfTZ27Sl5Yp1lLZZiWg8aBxEXOSxjX/et+HXRMEH01V8Kq4ZmrDp7L
	8DZnroJv14KApFZbwAuL+NeXUmvgM4FRcCSYSJL1NS3f0zWxQ6LIGovMKNJ/TKg3g7YWSk3XwbP
	DuqrCFbc9d1A/lWrM7gSmMrTSRKQftSRo0TqA=
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8895301cf.39.1774896380340;
        Mon, 30 Mar 2026 11:46:20 -0700 (PDT)
X-Received: by 2002:ac8:7f06:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50d2c98a762mr8894871cf.39.1774896379804;
        Mon, 30 Mar 2026 11:46:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444c7dsm1859500e87.52.2026.03.30.11.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:46:18 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
Message-ID: <j2oopd5rmctqh2dpavwhertyllashi5h7gzbxtsfddoy35tpqs@mlxlkbatetj4>
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330164707.87441-6-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cac4fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=vCJQlnQIZA-1Kgvoe8oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Pb5X-oaj1LjN9HsHNOWm3KfNMqSgtpha
X-Proofpoint-ORIG-GUID: Pb5X-oaj1LjN9HsHNOWm3KfNMqSgtpha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NiBTYWx0ZWRfX9slEjW29mz6p
 suwiBnKbCbwGit5UEimDOwa/OtnRhjJQWMNrBy0RdgZTJ62xpUSBGuqeLYEozJWrgOev175mwRl
 a16jbUGn3+IYe13tVcjil6tetzdFTAvRyAdCwlqouJlDqtTFE9faLkv3r1vhFE8UH3m3jCpW8io
 hRJf63887l9jc/mft86Ik7QJayqBcjQEQK8dNyK9RJEK1NJ/wmZ8oSNVOpa7iAo0vAnJpU8ccYs
 WC2aq95q+49xmYL+a1pPwhokkebqpIOP+NRIm4EjAUd9UdAC4qcRfvKHGRN6H9RpGhAFSdGm8F4
 LT4d0o+cjtatK43GUbspX/Sish+xUJZVRQU2fKVVf3n1NkGCdcZiwAxi6RCmx2qmlGUzYCvR2Bg
 A+p4iRHM9JsKhLXDOhjvOCMZPUUhMf6YWVTZwkfEF21jgcXmTnOY/CF2lkxAb3dmXz81dObFKf6
 cdpsUU9Z64+AJVq9DWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100882-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,0.0.0.12:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17FBE35FEBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:47:07PM -0400, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index cf7b130ea0c4..b0da24fd1aee 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -519,6 +519,10 @@ rmi4_f12: rmi4-f12@12 {
>  	};
>  };
>  
> +&lpi_tlmm {
> +	gpio-reserved-ranges = <0 8>, <12 6>;

Could you possibly add a comment, what are these pins used for?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

