Return-Path: <linux-arm-msm+bounces-76762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E226BCBDA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 09:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5481B4F4586
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D4024466D;
	Fri, 10 Oct 2025 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPrEUSRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97900635
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079732; cv=none; b=KPkz5NoMdcqG3r6Q7pzBEmKCrmcI/rkK2O57mTAVwS+8GQSBuP3KJQexfE2NSgSXG2BWPy/7TSXSlvdwXcYZLEVZ7wq9oYn23BqntWs+iiPZXIAajzsC89Bd+l+Z+BPYv6yvc5J0MfxOMGAnWlzlPu51g5XwqyWfiz+qwa5J49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079732; c=relaxed/simple;
	bh=4vvvEMb2vuNn8UVT9VIvvwNLOeHP8FoAvPrXeBK9elU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gxi6cSNGmVhT98MZlmXQi5vz9+NWV8IOcUzp1bzJZhjzP6i6KwRCfUXhKu9ckuicXKBNJ1IoectXi5CmAkyn2uZfIWXiHspjU5NVTPyvLcaY7MBxk6RKGzZTAmpCNFCK++NM8BtIaa6XlVhtZ6iBaaw8kiUCSRT271di/YPcNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPrEUSRg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WnJj008193
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dQwvd11Ba4OZZPtdkUFVNZBI
	SyWrAhGDJUfi6nuz7rM=; b=bPrEUSRgzrYc+3qyDhpzEtMX0lGgR34YK/st6XmK
	/hXfeFDPAEpLbIz7Oj6mffsVD4tTsH4UDMQ68xFLSY6V9DGtH+G7BJzCoLaA9Zo+
	bdG8gSiA2AfcdnWS6NCURwD1cJXt2wJuLyHpV3Duui5ZQMDKXtSS4lKgXxHEZ22O
	XdvKxE29Kg1b8zUzYvj4v60/CtcAvXG1iNtiFLCrlMckt93lfNBKsgXS+MKGb6Ky
	vgg5X2EaFZx2eAFj2kAN4dze2eXDXXt2oKi2ODZCORdlC9ZgONUGjuq33eDniGde
	WNHiSjlAQDoqxjDVq8PmD8wHQ6CKX1K0RiOxHvdpoAzPGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kne7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:02:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28bd8b3fa67so28619805ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760079728; x=1760684528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQwvd11Ba4OZZPtdkUFVNZBISyWrAhGDJUfi6nuz7rM=;
        b=RZMK4WHiseRpi0d2T6UGF8DQ+FTRsT75B3JMfkBBaNLeTgv27RtyM5wateHjrfVsil
         1XFDI5TwYbuEjh1Pt/Bt8GDe0fZecvpsDv1ZgqEpxRUCEJNW+z2ag0cgeGsyVbYieGJS
         zI9Xp0Xjjkm9KcjBVSFvH40RpCpTKtn5wqWVKmC9A5vomZHbFDFaCq2ywSjuLT91yR8q
         wDFHqskTFF990ICVF4Gwt+TzyMRxse4F+k7NbKqEZAWqEhBSh6GJ1DzUkCM49LlKojDg
         CbQ1U2GKtLTOnbhCF74lLUVVTSxHGjJ9zt6wpk05uFeM46mMJSglKpegYLMmI5h4gY+5
         3GAA==
X-Forwarded-Encrypted: i=1; AJvYcCXon5XscQnNfkBvg0dqWxilCtSYVRF/at6GIr8lg8ch5xv31UPV4vjefwL+J6WZcUXH65O+dyZTOdeiWPaG@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVeOIZyhNkRiCmeBG+ORSHZrLpcu1GS+Av1ExAmGNITImn0Mu
	+OLBsgFQ/xwyuf0odOVdlgFv+wayMZbtNSpmJcsDB0PSN9vMlIP8TiuNuU+optNinU0lCqp6cDV
	DinF2d2dUd6q5gUfggdcA7/406Z8K1kfHzBtvArlSVBOUtKekxiRbU/STG27gDvlpS+gg
X-Gm-Gg: ASbGncvXhbrnTtC3K8YXd5AyCMzx6vXVI5sWG0giDnSME0SgGqb6aC0aJu73+lybnAZ
	jGiROG45VdXB0sX3EnJ+FjGl2DDLmp8ZzlGMyhD6+pYHgy2MAzWHEdl4cq+V4dCsF+l+0q1ukU9
	c7Z8O0JYyjbqMB7inzn5htWquV6Uzhwjps+nqpByp30P1L8mfMebcCRFdJ8u0iqSL+HWXFKfVSg
	ORCBexWYp2CZ22y2pila7xX/qAzH1HfGpbn/k8P0naVkNNaMAUE8kDDvQuVmANcjmpZ6E6mOJWB
	x4ObMzMHUspI8ep5KgzvYjmAGNtu1Ks+4gkqTDTA/y9Ldc3Vu7UjV9IQ2ZFvTKKYv0vmSjCHIwi
	6lgCg7s8HT3o=
X-Received: by 2002:a17:903:1b4b:b0:26d:353c:75cd with SMTP id d9443c01a7336-290272409c7mr142514935ad.21.1760079728462;
        Fri, 10 Oct 2025 00:02:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXYefKjkw/AY2CktNp8R5G+EiBMLqaA04w5BsZCP6mW9dFQLgjjEQp8WdnscP3rBXH2Ry6Aw==
X-Received: by 2002:a17:903:1b4b:b0:26d:353c:75cd with SMTP id d9443c01a7336-290272409c7mr142514515ad.21.1760079727974;
        Fri, 10 Oct 2025 00:02:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f070ecsm48098155ad.60.2025.10.10.00.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:02:07 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:02:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <aOivbf/U0FluPsZj@hu-qianyu-lv.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
 <75d8cdc7-60c1-44a8-bf6c-0fb1ef38dd70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d8cdc7-60c1-44a8-bf6c-0fb1ef38dd70@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e8af71 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z4uItHPOzOwcMgdkeGIA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CfzVoFUxaMSVNIiTLKg6yHFkZRKx7sm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4PI25vC22o/K
 ETXVUjNLovy2nIdBC2WFTV1dl8QvsRNib38fwaJuVkhaDKROR7hgZ0IxbX5ufQ7mnaFeJex/GPJ
 mKfjdIHirKTG4QXD2+H+5tfKohKa/PvIKbueE5HHI6JJTh0VuA+ZK4e9yA+Poz6cXQvUrZ506fJ
 3LgM6U+CkGiijXHex/ZPNzIR28pFejJJ1VgVvxc0T9THdRWwDDAybV3wTTlRT9QfLl1pcfTlIEg
 VfycxfEdw977/H+awniwFniGaWiT5rdz94I0GBKFRmQNVS3EJ4HjTzr3AKT0W3+D0HXGBx4rg5x
 ocjAJEUL2EoMlMgnJPm2ibhFPGjJBkNPyJowzvBgvTOt8FWr+5pdT6QzKAxZWb1g+AKikoiWXgH
 VsZBD1d4XOc8U7qnMnP8qURbAwPybQ==
X-Proofpoint-ORIG-GUID: CfzVoFUxaMSVNIiTLKg6yHFkZRKx7sm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Sep 25, 2025 at 01:32:04PM +0200, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
> > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > 
> > Describe PCIe5 controller and PHY. Also add required system resources like
> > regulators, clocks, interrupts and registers configuration for PCIe5.
> > 
> > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pcie5: pci@1b40000 {
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01b40000 0x0 0x3000>,
> > +			      <0x7 0xa0000000 0x0 0xf20>,
> > +			      <0x7 0xa0000f40 0x0 0xa8>,
> > +			      <0x7 0xb0000000 0x0 0x4000>,
> > +			      <0x7 0xa0100000 0x0 0x100000>,
> > +			      <0x0 0x01b43000 0x0 0x1000>;
> > +			reg-names = "parf",
> > +				    "dbi",
> > +				    "elbi",
> > +				    "atu",
> > +				    "config",
> > +				    "mhi";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			ranges = <0x02000000 0 0x7a000000 0 0x7a000000 0 0x4000000>;
> 
> No I/O space? We can also add the (presumably prefetchable) 64-bit range 

Will add I/O space and prefetchable mem space since we don't know which
device user may insert.

> 
> 
> > +			pcie5port0: pcie@0 {
> 
> pcie5_port0:
> 
> > +				device_type = "pci";
> > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > +				bus-range = <0x01 0xff>;
> > +
> > +				#address-cells = <3>;
> > +				#size-cells = <2>;
> > +				ranges;
> > +				phys = <&pcie5_phy>;
> 
> same comment as on the other patch
>

Will change the order as you commented for kaanapali patch.

device_type = "pci";
reg = <0x0 0x0 0x0 0x0 0x0>;
bus-range = <0x01 0xff>;

phys = <&pcie0_phy>;

#address-cells = <3>;
#size-cells = <2>;
ranges;

- Qiang Yu
> Konrad

