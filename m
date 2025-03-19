Return-Path: <linux-arm-msm+bounces-51927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0543A68930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 935BC7A767C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ED6253341;
	Wed, 19 Mar 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7DAHyEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC1252901
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379234; cv=none; b=SRKRo2CTiD6UHeHTsc2DtV5V6NGVDywZ8JSGRMSRS+9G70dsAYFXEVGCa0F9lcURJUtlLoV8s7x/dl21k1ts2egsIZuj7NgNPj10HQ3y4wejx/vVbmW/MFAJNWNFFx+SZbRalg1t8FGu5xVDt3B6bX4MK+TbgfXANbkH8EXgqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379234; c=relaxed/simple;
	bh=y9h27SLWPoVDltB6CIbW/qHjd4Js5SJZr7Tx7UfBrGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF2ZjG75lVcAh6K3J2G5l5zuLTP4sYb9BNrFqqtEfI9FSXjv6OiaFpbc88H11K577Kclhboeas6HZ2W1LPAeXiqe3UiN102iZUCT7sXnpOku7XHQ9YNpTPJzVBp0UjTC+yysxH9sFjJEOQBaaDVq0sojwqv0Sr8y6xwa6ekO4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7DAHyEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lxFR019760
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nCdGea/fniAjYxjTkptR2PXN
	dWdSDj0g0BJrfvxohsA=; b=M7DAHyEzSwjiT5zIwIMh/eTqV6NbrNyibg6Ravij
	2bBr1C5UUdbw/3C3faJj8CNqu/qSoLAVQtiH8zwBGYLiDWhKSHV3qxNhg76enC/w
	+TlPprjEJyKrltohukWZXzJpnHDWNFcGZw1iSCxpI4JPWW8ZfOEjjM7CjOVJ4bRK
	vTE/XXVMboxnxXWwgUD0WN+k3v+qtUZyyCFQXD/2mfRPpnds0130IiieaepTLugv
	LvcyudIsB+pRyubkVBlQsQXUW+jIKLPmUcoU+HtsgRmYRgkOScE8myu8QO15Mq7u
	7u6Es9LX7YF3KoqWg2TLrhxEoVrNZbF4yyGK1/3QvX5JLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu36rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8feea216aso10353466d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379230; x=1742984030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCdGea/fniAjYxjTkptR2PXNdWdSDj0g0BJrfvxohsA=;
        b=pK4rVyZCp0fiQ6QzAf46ip9C73HmBYMBnjnb1L+OzeG27iwk7PbfvTh9e18a08sf3Y
         95MZnndMAupgKdsnz82cLWnKatkKQKjzvORG5wqMfjhNzlJQPeSzwgSuin/i9wOOwt5b
         NHtTTtmkZt/2IedD+ZsDBucxVOWRppgk4RdWJl/ZK7M4NmO1diNhxV+FVVnfM8A10J0U
         G0RjPlqbb4VXMTx85vM+uf2acmvZRIkm+r8xTpdSfI/wmdKzTxRexJ4KhpPHbkDza3kV
         IwW5dTATryob+FHF54BqCXY7YMu6lW9CSN5GIKWEM8r4PnmJBFPLYdFkA9EDauH2eFWK
         AtYA==
X-Forwarded-Encrypted: i=1; AJvYcCVxawMVAftUoHdmAPuHg2hylTpnrrjk4gYT6t2ySVWrGij5eZFZsPPZc+BdH9yLIgacYO7jpF/r3Y7v7f98@vger.kernel.org
X-Gm-Message-State: AOJu0YzOn7Q1ysb88tvRqwMOKFUHcShyk99WOiXpEmPvUgx0wFHwM/CL
	SfHuWaEusOrIejBR4cQsTamiJ7QRl5Eoh+K8hEe95mLYpQlZyBfmxWKCtkMkzqM8ZRU0tW7PNYD
	LhDd15SnLtl/keTXiRgbDz9SAVFBZQx5ayp7ZnpRr98H9znc5xJe85iDQtwRW6arj
X-Gm-Gg: ASbGncvgIkITYjHiy8mfC40O30bf3N34SKTPcVYhMRFhZDtvjhUK8AuBMBo8/Ldu2/o
	mvBppN4cfLCsMGNMGzLk0WAVQUQHZp/f5naA8RTqfszxRNLno4Si3VAWjM23gDg0Pear7Gc/DFR
	HE1WWMmYxA42NUfSRPpXPAXSkD3kkKr3Te0buwEAQFlrVLcT81YodJe0DNZNRUAg5nLjN9nOoLI
	xRnZxOUEfmPDxe9mtjhXx0hGUQ82M1thSyF0Vf7DeP7r00L8GPlq5rjJpKvt4AVT6FqRDPzqEIX
	IDeKWn4LckS1u43urXIjelNyM7UXOyq+ymWZiaP8ffcq8d1M2uzgHKvUx5ppVasY0MyTgQ2BM8C
	qiYw=
X-Received: by 2002:a05:6214:4b0e:b0:6e2:49eb:fb7 with SMTP id 6a1803df08f44-6eb1bba4639mr102881486d6.3.1742379230259;
        Wed, 19 Mar 2025 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeKxKTUxvOd7lS/OAOZc/Z4Qp58eBwPQpZlvy6aoebQ9tHl+QQCrVFpJLLrXFT7oAhwv+f7g==
X-Received: by 2002:a05:6214:4b0e:b0:6e2:49eb:fb7 with SMTP id 6a1803df08f44-6eb1bba4639mr102881226d6.3.1742379229910;
        Wed, 19 Mar 2025 03:13:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ce032a56sm1096024e87.78.2025.03.19.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:13:49 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:13:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
Message-ID: <hkm76yogjp6fjrldkyatekhg7orcd6wkc43d2e7cwzqfrdxjwh@b4f2rilmf6gh>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
 <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
 <8a2bce29-95dc-53b0-0516-25a380d94532@oss.qualcomm.com>
 <CAO9ioeW6-KgRmFO93Ouhyx9uQcdaPoX3=mjpz_2SPHKiHh3RkQ@mail.gmail.com>
 <16a9ff11-70dc-22e9-bd3c-ed10bf8b4fea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16a9ff11-70dc-22e9-bd3c-ed10bf8b4fea@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67da98df cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=GjCQcdzxkWFPqvLgVS4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eWyeZ9et0HHT7uUvBeAPeo6NFvjV-H-X
X-Proofpoint-ORIG-GUID: eWyeZ9et0HHT7uUvBeAPeo6NFvjV-H-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190070

On Wed, Mar 19, 2025 at 09:14:22AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/18/2025 10:30 PM, Dmitry Baryshkov wrote:
> > On Tue, 18 Mar 2025 at 18:11, Krishna Chaitanya Chundru
> > <krishna.chundru@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > 
> > > On 3/17/2025 4:57 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > Add a node for the TC956x PCIe switch, which has three downstream ports.
> > > > > Two embedded Ethernet devices are present on one of the downstream ports.
> > > > > 
> > > > > Power to the TC956x is supplied through two LDO regulators, controlled by
> > > > > two GPIOs, which are added as fixed regulators. Configure the TC956x
> > > > > through I2C.
> > > > > 
> > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > > > > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
> > > > >    arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
> > > > >    2 files changed, 117 insertions(+), 1 deletion(-)
> > > > > 
> > > > > @@ -735,6 +760,75 @@ &pcie1_phy {
> > > > >       status = "okay";
> > > > >    };
> > > > > 
> > > > > +&pcie1_port {
> > > > > +    pcie@0,0 {
> > > > > +            compatible = "pci1179,0623", "pciclass,0604";
> > > > > +            reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > +            #address-cells = <3>;
> > > > > +            #size-cells = <2>;
> > > > > +
> > > > > +            device_type = "pci";
> > > > > +            ranges;
> > > > > +            bus-range = <0x2 0xff>;
> > > > > +
> > > > > +            vddc-supply = <&vdd_ntn_0p9>;
> > > > > +            vdd18-supply = <&vdd_ntn_1p8>;
> > > > > +            vdd09-supply = <&vdd_ntn_0p9>;
> > > > > +            vddio1-supply = <&vdd_ntn_1p8>;
> > > > > +            vddio2-supply = <&vdd_ntn_1p8>;
> > > > > +            vddio18-supply = <&vdd_ntn_1p8>;
> > > > > +
> > > > > +            i2c-parent = <&i2c0 0x77>;
> > > > > +
> > > > > +            reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
> > > > > +
> > > > 
> > > > I think I've responded here, but I'm not sure where the message went:
> > > > please add pinctrl entry for this pin.
> > > > 
> > > Do we need to also add pinctrl property for this node and refer the
> > > pinctrl entry for this pin?
> > 
> > I think that is what I've asked for, was that not?
> Currently there is no pincntrl property defined for this.

Does it need to be defined separately / specially?

-- 
With best wishes
Dmitry

