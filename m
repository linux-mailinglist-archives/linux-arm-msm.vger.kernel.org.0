Return-Path: <linux-arm-msm+bounces-95105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FT3Nze7pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:43:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A21ECE03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9A4031218D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788BB39D6D7;
	Tue,  3 Mar 2026 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbS4awTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx5RTu+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4D386437
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534216; cv=none; b=ZGkTU4sOXlNSyVHHBq0zA5fFv9O7yvd6QbuCnGHru1y0dEEuBA/QBugNewYTCD3akOyl4NTjjbP/B9xrItGeHDVgaAWg3AbBQp/RMbm/cqmJv+YXqJ9EpRFd0gJwmGAh4MOZMShaZG2VpKrVlv6RgEqU3uJQXa2pAdimO5XYIZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534216; c=relaxed/simple;
	bh=57VyYJ9veAA/eqKT8waUydt9UuG26LoYl3nrMSnLAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLg3BAKUtg9w+nYtOIYmskvMlEoj+GP9a8QUnVUKXZz2KXnqViLDHsps3sj5dU1KOUJqzOmC/IoOkIebOPZiXJlUltfccy2hc8cY7bj0VfXewB3oGKozcg48Koe4IVfy6OBy013wjKg1jcMYWV9fpZlTFZjnpgJkH9gl3UC87Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbS4awTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bx5RTu+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n6Ic582396
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3wST2dbTeo05QMXXy/34tAy2
	8EoimV642Eodk8HyEbE=; b=fbS4awTNc0EESXyTUP7Mb5J6k5e2U7D7vlhMFDjl
	5FsNKJSGxxqBDZ1wDasmtt8bx9utMfS086TF/HvJinT7ESFVSc/V1638xv7k7qYj
	hxwwNFSL7JHcCeCOYtR4g4vcUc5qz8SHkPeVcHMhVKYChl6OKekvn9aFel/WcWYV
	m0UCJT4WrxX613paXUA7lvDG1DRFMYLP4437zQOg3ux4+hudTBEb3xURGp21/T0u
	9SXEQMD1SlhVrcLAM/9REXrH+/mnZvH0cdwsD9pb9ma4wxrfmCtokHlbdya8UY9M
	sQEmfXfsYI69WyQQ/eRskH3u6H5MXUKYY9O9lTGqq4lN0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6uakr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:36:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so3523205785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534212; x=1773139012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wST2dbTeo05QMXXy/34tAy28EoimV642Eodk8HyEbE=;
        b=Bx5RTu+0VPPua27TB95jVAJewiWgbb6kRLOKUGjzcJy9PAMQrCaILOwyCpqL7IamTk
         mLl67QpJ3Eh4t4bpmVGMuHtnzrQ+xIrUHq8NI9c+a/wApQcp7IDJnLEjqQA3c4X2wGLN
         s8sIcuIs4cslIoK1Y7nCx2exJHPjhMTDnZLQmFDh07PbD0VsilAleEyNm8KuSBCIH/tZ
         5WA31ymIdhSOfZEtup8zKbfBdFQsQYjpgtWYQ1ldzQwBeE4K7ei94X6HQ8aRld6g6BsE
         ASIkhYRaE+Ez+XloTanvkbE01wqDlT6Jh9y1q5GDyg8ARq9oKfUjPNaEBDCf8lzJ7DzC
         6NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534212; x=1773139012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wST2dbTeo05QMXXy/34tAy28EoimV642Eodk8HyEbE=;
        b=ZRNDx2Zhe/1YMQQBgs1LPxe2XOOzustxMI8uO6UMCvkvcqFg9KjSob+whMWe60QbV0
         3so/CO6GiP4KERPibwtclHMqsmordC13+tVImwvuBUtCGPBhQjlNWcTAm9penjJDy0K5
         lcXUPK7RVRbDGyQHvdAC69OzJbPJnIEO5Dw9aNjsF1dBNhFajm/M8cdeJoa9nWZxL2c8
         3whrtyXs5FF/gyVCgYxu6CABjkzxiMXHXbj7KLiGVSh3T2QDssEqU37RXJoYurJLVRal
         /AZHjttvWncYyG1dsz+QVEJ8Ld/h23pfn+s3MJPmqVQiV1ER5KAKXl5PFDdYiPklM8er
         ZFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe7xaJouOWoBDunI5nkJhHAW0G/14PgmUfeHi8YYyK/Fv7rgrfnG8RFxRjBxNAgRjmngWcACisuDGgn/Xj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9zFGFMa8JJuQvosfZoI4MsZg/wgWFuDGqfduq4yoAHVT3OGsX
	SzyIplo4FxSii2B9GGF8Xbl1u5gXYa8EyFA68/LlQavMuJRO8drOXnj59ilLfj6A4B5fLBQNCvo
	gxXuQSOlsjZP/xR5hlFZypmUc/ALbdZSy9o+kT6ErSzGwuMMFAYe7z9RY8UgOF426ShGg
X-Gm-Gg: ATEYQzw1Zsbh2SS5PbwcS2gycU532lhu7mtZb1n03wuIqDhuzl9YsRr1xdJlVAjRYiz
	cx3O1EqJk+27iUkIX3BE/IoXNfNxpZJXFrWcORjO7d4mo2ypXJDtKcng4a6RZSMeFhqUb7w72dr
	A1E/xFBEWGriApcKjSMXobXZdAfrjeCtgLjEHEyIv4mNuDz5YD+fI4U14PY5lp6czycv/Jo2Lpn
	lflQI09eD7yQ0SudUowcFvfa1gZ4rnAlzJzWHuErXxBedy0sAW/7VbJqU1p96FkXe01PCMSWtVI
	L5gpKN5imdvnnrSjWwh417Dr9xGyKc0LsajcTUksuc41P2dqDefpnyJZz2iqn8CE1H56xCnLdIh
	L7ApyLwDj6dO5OMu5KgwBazqT9p7rhs+bg4ro
X-Received: by 2002:a05:620a:3707:b0:8c8:807d:21b1 with SMTP id af79cd13be357-8cbc8e2d329mr1981615385a.70.1772534211960;
        Tue, 03 Mar 2026 02:36:51 -0800 (PST)
X-Received: by 2002:a05:620a:3707:b0:8c8:807d:21b1 with SMTP id af79cd13be357-8cbc8e2d329mr1981611985a.70.1772534211365;
        Tue, 03 Mar 2026 02:36:51 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm517107115e9.5.2026.03.03.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:36:50 -0800 (PST)
Date: Tue, 3 Mar 2026 12:36:49 +0200
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
Subject: Re: [PATCH RFT v3 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
Message-ID: <qqwerobprzxc3lels4u53i5sn2f6nks34ksdsuvfiaq4nvcahq@wldbrbdda7nf>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-3-883eb2691a0d@oss.qualcomm.com>
 <df538e4b-026d-48ef-a50a-7180cef9be84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df538e4b-026d-48ef-a50a-7180cef9be84@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MSBTYWx0ZWRfX5kPFd/OmmKfv
 GDopZEUm8cYC7EcGO7p0P3/En1tSe1B6DUhwVLgLj/DsdkGSjHjMV6ZGM3tx3Yr2LZsdgntoTaa
 yWj+ZLQtR8UciqYkW4x33oF9oYwpJ/+RQJp06GpWH1c9q4xNbjpj84y5ApqnVMm1AWiLcT65TZW
 sYh9ua47UQ6+RI5Al/sD76+WEi4FT6RQNK4ecdhUC9UEq3vbGbK1Rc1LOnmcvJSkoxCoEugQWEj
 fTCeHyvxntnqvPUU0AHF7YSyLdvhQot03mHKeGIem5lfrafTJruh5KttVBhDeuP/6B0ZdVOzMi1
 B8rgr+Eai0Fi68gE9iyVzpO7mb/3FoANWzWxXV1mFWPs9tOYrUMFGTJk+wsSZYSy8T8zzM6Sq/9
 Z2xdN7XiiLswtdHotRG0irNGOEL2y4JU7WXfyiEm7Ikc1WdrE2aVanlCF512zryuXlDRCnveeUZ
 Sk8Os2UwVnJoKwwCP/w==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6b9c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tyHzckWLDJUHuHEa2CwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wiWdBkFvg0VzTXlo6BNmMD3ZnF1pt6kO
X-Proofpoint-GUID: wiWdBkFvg0VzTXlo6BNmMD3ZnF1pt6kO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030081
X-Rspamd-Queue-Id: 2D5A21ECE03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.47:email,oss.qualcomm.com:dkim,0.0.0.43:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 11:25:30, Konrad Dybcio wrote:
> On 3/2/26 6:09 PM, Abel Vesa wrote:
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
> > +	ptn3222_2: redriver@47 {
> 
> I'm not super content with the _2 suffix now, but it's not a big deal

Oups. No, you are correct, this needs to be fixed. Will respin.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for reviewing.

