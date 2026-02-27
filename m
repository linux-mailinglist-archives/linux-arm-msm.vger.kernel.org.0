Return-Path: <linux-arm-msm+bounces-94419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFzdG1ZloWnIsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:35:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC971B56AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CD68307E082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03A53603CA;
	Fri, 27 Feb 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB99tzmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkKV0Rse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539038E10A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184896; cv=none; b=dCBS1UojsZt6GDyVRy6Sh+WOny0GbqpGtK9WAnoRhOrwn2GZEKQwlj3Y/wS6B+XC0ZQiHEHnNL1DW7JqN7QhJY87lUitopDRzndZphS3eXMaG3FcRKWQsZWEDpbRmFly6T8AcDlAtG9JjapH8D9uiGwe3hpC4B3fuMKFjBzV4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184896; c=relaxed/simple;
	bh=h7yhnVHgPNwIjcIUIO6Hvv4cSEJBOU2d+dRlhSV6N3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlsQyd7QvNGPi0HwEwR4oXFylaOQemXxQV966HJ3J13Ak73MDd01qVrPqLokxRyxSTgZnwUjDpAUs586uVeNsYkTKD/0hzDVfvLpUtLZ4DEJtt5mawSioAWMTOfVXznBbfjXYL7Kp2aD4Zh7Mnqndif529ATlD70LSij3BOBxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB99tzmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkKV0Rse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JwVg2982233
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UIcDBr2wve7pKgjAxBAKzoDu
	LV8DKggSrjaVxuAmsK0=; b=nB99tzmi7eYpzGQ2WRHM8MBNGBUCmOcgSKnhch5A
	Cf1Oz7b7oOR0EG8fqdOoq25UoaWGkpXior2+xVHfjLlJqEE564HgbgrU3aMDMwYU
	GFF3CrFZ7gym9zwizcCSq+5KHOvU8zxYBbPC9gme/L9TYz/jO4S+L+1vqUzVMSsJ
	K0c3NWoryVMeAzYKNJCk8d6d76IU8wL8jh3jwGJgC1xn0DWIe14vrW+0OwtuoPdq
	xCnQPxDkTD8WweLrjoAxJYiUeoP1Yw9mS7DpZARW9x4aHLz2fjo6nbRexUTj7saE
	nEyBBHL5+BMcA4/+lLconCVODaBOtdiYiff7k0JHy7lCDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v4jxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:34:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4e37a796so1304562785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 01:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772184891; x=1772789691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIcDBr2wve7pKgjAxBAKzoDuLV8DKggSrjaVxuAmsK0=;
        b=OkKV0RsezzTT4kf+Np/9EbO971TcrXl7SUg9Fu8LiprMWJTZJU+pIQ1Et63w2aQBkX
         DpiIV/0pfLO9+oZsnjbdDAznq5x9AFBrFEaRs1OeAkg7ahPpk32yzfG9bp4qMYtkBPxM
         0vXbDxC47AJh+tzxhp5HMxX7vGB3ds5i1E0BisDCyhLVA5rlnY4lqQb95EG/k1mc4QRR
         bqkUtUSlPtTFl1rTjVed6sC0ZUigjU/emhRSPX30ssZVPWw+XSF4FUPJK0ZL6AGv6p/4
         mKZmCqjfIq5s/KyecZItq4YRa8R6+qGuZGSYHZLXMVJIUQHYM80X7s0oXtde0OA0+djV
         5jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184891; x=1772789691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIcDBr2wve7pKgjAxBAKzoDuLV8DKggSrjaVxuAmsK0=;
        b=EdBroaulcQuYtMmnmVtpkP6mToQWT+1klszMCPQszogVmfi0pI7+o55jdhEcfbQXVB
         JsZSPJBdE+xCzzZxdW3K/czncwj+iGC+AygElwU5OFOZI0H754ZX3WYNBUjMOwA/fTlq
         3pZI5na7OXTi28kZSbe9S5O8j50cnlhTETHQDzy3M1OV8PwxGP6401rwdEz396s5H5rm
         4K8QJEKHarjVEgKFMxzqHGSahKIOtWjEeuukMw+5XY6uYiDlHhzxQjX58YcgUzpbkecW
         NUFZGabJXySlzdhWPp8RNzmEGbqOnbVOPAvHwfE1oh3RYFhezqmmTseUGvm7RJhyxmXY
         z5CA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEO9dAyG8ciMvO7yo9Gq3OE8z9Q4T6GVJlh6myXOTXJANFieRg0U9whdakxyavqESDwslAlFIwga9by6H@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmzkHl0Som89g+o4/zZbUPs+HSm6I76DCuUQWKHeDe1OEi+WJ
	eE0SYbM3D0rtTcjBZvOC8rwU4AxgMH5KcKQc2SuNZDmID45XPqZHiYgdyejR45oiXCKUmjfEQj2
	kMdkx06xRvtmf2L0fEX0uzcgSXYACVQ/trVpOp3G62u6Occkz4rO95jyzb98Imt/dlv69
X-Gm-Gg: ATEYQzzXFcOPtlJP3gk9cEMPJSMlynABBiuA7cjxH85t9igjV5HJVyjwpiGq8pUkI1A
	rSbp2bXu9ZYDNK33hjZwBEnx+PJUIeepaRhXqM19ZfMdk89UbjHB2CgxfTpDQjRaRYnaeS230bC
	oYdKuJ0i9d8C7NUvpAvtDT386TTKQKBimI3voWFJwJwaggcP7tQiF63KA/F5rb7Z6CCm/eqlglQ
	Uwa0mJFJw3OnS3sZxpZVRb66oFA7Cko5m7fdTtqXf1DTY+nYxO1Io6Ai268DkIZVF1xlnhe/EKf
	FNhR3QNQETuVHi5vyqQXnjeCjDbOVLHQCk+QM/BpPn8s26XMHCjl3ay+u2dKqsw4/deWHyr0uoY
	XNUskXxhUqoif4slzHlENv/Nuvc969h7zCEBx
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr248700285a.77.1772184891366;
        Fri, 27 Feb 2026 01:34:51 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr248696385a.77.1772184890733;
        Fri, 27 Feb 2026 01:34:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f8casm9909167f8f.14.2026.02.27.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:34:50 -0800 (PST)
Date: Fri, 27 Feb 2026 11:34:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH RFT v2 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
Message-ID: <tbzc4v7o22ns5gblcr2nlck5gjzqfsb2a2jna5jimslhselsin@7i2fu5wt6g2g>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-3-f4e0f38db21d@oss.qualcomm.com>
 <42716b92-9814-4697-83f8-4983de0ce57e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42716b92-9814-4697-83f8-4983de0ce57e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kKwcmLEpTjDgGnt69k5NUw-jN9MgvfqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4MiBTYWx0ZWRfX+mS0RE44HbwE
 9Ek7+m8yU1tRTq+RchAAwSwm0eT2aqq38Ilq2QM/6sM0xpTVSONeK6LE3TX1PYnWsa3sUkttPGd
 //Fv4PLoZc43zOx9/XOIOCktv79n5hIfu0Czy4ejrse2uHlk9vJBtnut2E9BE+1VTc2l0XyVplu
 CuNj4i2Xp/xk5vqQzpTenYDMcx2yLwhwsd8h4bS2HX1/nMDSJ9+4KwHBiNT4b9qgBdF6sJ9YHyG
 hhw3w3KzNyBdMPfIskVIU54o1GzoNs/j6OkxE/ispmWP6HkzYFDvFM726936A65uBKpeWlc/yJE
 v14dq//G1y65NtMqHSp3Dtj8ljRWJod5hWwiqsDNL+w/evLjP1nMJYITvXJN3nnCl8ldt7KUiwq
 swu9qHNVLta5fRzavOdUgLwKNTuhh2BbC9IAMOafIoNgdLof/JjXOt4VP0p1T8Jg6/ugiQyK/+d
 HTcWBUSncWJkMDtTCWQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a1653c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kKwcmLEpTjDgGnt69k5NUw-jN9MgvfqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94419-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[4f:server fail,sea.lore.kernel.org:server fail,0.0.0.0:server fail,0.0.0.43:server fail,qualcomm.com:server fail,oss.qualcomm.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4f:email,0.0.0.43:email,0.0.0.0:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DC971B56AB
X-Rspamd-Action: no action

On 26-02-25 13:16:23, Konrad Dybcio wrote:
> On 2/23/26 4:37 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> > dedicated NXP PTN3222.
> > 
> > So enable all needed controllers, PHYs and repeaters, while describing
> > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	pmic-glink {
> > +		compatible = "qcom,glymur-pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +
> > +			power-role = "dual";
> 
> there's a newline above here, but not in the corresponding places on
> the nodes of other ports, I think we generally skip the newline here

Will fix.

> 
> [...]
> 
> > +&i2c5 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	ptn3222_0: redriver@43 {
> > +		compatible = "nxp,ptn3222";
> > +		reg = <0x43>;
> > +
> > +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> > +
> > +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> > +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> > +
> > +		#phy-cells = <0>;
> > +	};
> > +
> > +	ptn3222_1: redriver@4f {
> 
> At least on the schematics I have, this one is not present.. but there
> were a lot of variants early on, could you check whether you can 
> communicate with the chip at this address?

Good catch. Only 0x43 and 0x47 exist on the device I have remote access to.

Will drop this one in the next version.

> 
> The rest looks OK

Thanks for reviewing!

