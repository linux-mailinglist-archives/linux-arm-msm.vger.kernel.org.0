Return-Path: <linux-arm-msm+bounces-51941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B9A68B1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75D8F424BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE077254B05;
	Wed, 19 Mar 2025 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHEP19yA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB68253F24
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382403; cv=none; b=L1dwD8STM0lcif+V7hClReKkR+qsEfoy8IARhoun4JgeD+qWIhq5fDDxFzQh8IBlo5yYYo3OJImJ+07Mrfk9GrlQmrCb5XQBlFRKoOiNwVXK7zRfJtu+Xi0+xxJ+DpZCG+NfHa+8j6twau+rpDtfuwdqshdA2u0Lju/RoFzrf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382403; c=relaxed/simple;
	bh=+6dINfWYNledSDKrXEMCld5larCRcQ2l9XF8anqBVjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2Iut6sUe/fHSLQrciHdCV15yfNocYaLRNuBSj1zjHmzszGF07CH760J6QkChpotPbIB7MCm4+SqVTpGmhOVCVI/CzE1uZ2GvPBqGHo920mEXzznPhrYVY/oWQ6xa9Ywa1M+1kf6JbkOeS3UwJEfsDnX8DYuqrV5PNspQ7w9nPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHEP19yA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhxP020636
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zpsXstT/OPpXfwxen2clafNs
	aafRQUG65nkBT0J8LsY=; b=QHEP19yAAefK9EtYpTBUzF1zrikRg2tIl8LSwLsS
	743G8O6EXY9jdDTCgqz3mXxf7zJ037zHg+MaRzb+EOav9X2pCuP9+Rdk+Fa2HkRk
	4UtXGSzfGYAT88ukdMJQ5MK1WbeunhJKF13WIosb6JMVHASK1aVFEUHtBvp1vMQF
	Wd+ngZvh+XUrwUiY5lL/1lfV0WSLYfhENNKh58Z1d7Iaa1m+5npEUAACQACFLkNx
	n4QTf9EcARzc4s79RfAqYTNDw2KAJPIqZPDYeJKD9ca1UmTgaPG+fez/EDtR1YcZ
	Gv7cBK8ZM7nJzc3vBLTzVClNtMAS4e/PEX5hhaHRRplwiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx353b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:06:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91ee078aaso136032706d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 04:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742382400; x=1742987200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpsXstT/OPpXfwxen2clafNsaafRQUG65nkBT0J8LsY=;
        b=AC7CLiwrelTOBreX1JNftVihjAL40HFUjKE707YrNz/+DAilcCEGWjrmbbbLUz9lji
         g8M+dixoAdKS7rUtJoKMBREgJfsavmirKSgaPK9ICi51aUbUIrP7OF2bxAzSrSWkZP0S
         8FDZWC+nO4yHy2Z88Y2M5G5RpiVVmMmjUJT3ggqTd05o6yY9jziNtkEpPcv0vc+OU3D8
         KNJjSuVzawA0u5ae12JhzrWK41ppyObbfgMNQ0kNeILOl8H7JwBGEXWe1g05dBK+jrRP
         PD2DsiiVa7yGbEMj2VVE/gTUsN71PLsDx1Tx94uLyG1KDg/GJuDHSX8s9wiYOAp3Dg9a
         KwSw==
X-Forwarded-Encrypted: i=1; AJvYcCX5yDHWtkrBujX8+W05xqdMbFz03sl6r1nfED+bUnfMD39Nb6T3cqJKN+Z9mGXkyh1kpAJ+YdoK2ff2Pw7U@vger.kernel.org
X-Gm-Message-State: AOJu0YweSD0ObXXJqgYQKU//71QQa9hKvQcwTELL5OlabyyriSDYaFOu
	zGZIVeR2ewKLQFaI8FYg4VzRI6PDzVQBwYNW3eT94CjKulhufQtgGta8/u9+zkMybu2Ljo8V9od
	wqKR88K9S4K6TO7+veQ+IaSprKnHIh5SEG2QXm0z47hEI5zAxJ7Xh8wNBmL+eqHaJ
X-Gm-Gg: ASbGncvsxt8oCDd1kETxrOTFgMjRkdOGuSJNXtdlIk2qu54Jmfs0qUWrgT0v9odngs+
	4rYyAfJkScEOU+3PteTot7E6zlN+5G4ceRw27JeDh7KJYL7kRD25P2UG8LlpaBhlVuLHgP9nskt
	Qz03tqPBa/P0YF/WPf0yZO/ekXG//m9HzrkUlUr2gwdxNxLjJN+/dXCOnkdrHk7vUzM4aJ67mkn
	s1MY9qjPS3TgN6ziWxBezssRI1KFKTwtHm7qjXzKldp6B5BJCyC7Pf9jVyMTs54O+MzbC4RKHXn
	Y+U6ntX0VKFwnU2tGzIXRGTfNY3zdPOCQrNf4yCtJUhXKssIKU/x1vglWPL9UcXKSrgTXs6j9s3
	O3L8=
X-Received: by 2002:a05:6214:2529:b0:6eb:28e4:8516 with SMTP id 6a1803df08f44-6eb293c733amr37447736d6.33.1742382399865;
        Wed, 19 Mar 2025 04:06:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2t0QGksJArRSWkBCYZvSyReO8b4mt3eWRfhwdfAQcyv4fEjzOnD9kov0aGqtEzwp57TDlNw==
X-Received: by 2002:a05:6214:2529:b0:6eb:28e4:8516 with SMTP id 6a1803df08f44-6eb293c733amr37447326d6.33.1742382399503;
        Wed, 19 Mar 2025 04:06:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88508asm1920760e87.186.2025.03.19.04.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:06:37 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:06:34 +0200
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
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: qcs6490-rb3gen2: Add TC956x
 PCIe switch node
Message-ID: <ip7xacfkpv7gf5w3gdgrweo5z7bqxmkfmvgsjfaurk5j5ac6mp@nqccdhunhwws>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-2-e08633a7bdf8@oss.qualcomm.com>
 <kao2wccsiflgrvq7vj22cffbxeessfz5lc2o2hml54kfuv2mpn@2bf2qkdozzjq>
 <8a2bce29-95dc-53b0-0516-25a380d94532@oss.qualcomm.com>
 <CAO9ioeW6-KgRmFO93Ouhyx9uQcdaPoX3=mjpz_2SPHKiHh3RkQ@mail.gmail.com>
 <16a9ff11-70dc-22e9-bd3c-ed10bf8b4fea@quicinc.com>
 <hkm76yogjp6fjrldkyatekhg7orcd6wkc43d2e7cwzqfrdxjwh@b4f2rilmf6gh>
 <303194d4-d342-ea4c-0bb6-5f5d0297ba23@quicinc.com>
 <xkjozxbchqi6mhstqctejfk7vmwux4kdff2nyrcu5nxqzxv73z@agb7rbapsvx2>
 <f2e67746-853d-8545-133a-13452548d504@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e67746-853d-8545-133a-13452548d504@quicinc.com>
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67daa541 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=YhunDdt0IHZmoyGD5E8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MZSg-H0VQzdew2qWVAEB_ysyA1uzInkE
X-Proofpoint-GUID: MZSg-H0VQzdew2qWVAEB_ysyA1uzInkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190077

On Wed, Mar 19, 2025 at 04:16:33PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/19/2025 3:51 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 19, 2025 at 03:46:00PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 3/19/2025 3:43 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Mar 19, 2025 at 09:14:22AM +0530, Krishna Chaitanya Chundru wrote:
> > > > > 
> > > > > 
> > > > > On 3/18/2025 10:30 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, 18 Mar 2025 at 18:11, Krishna Chaitanya Chundru
> > > > > > <krishna.chundru@oss.qualcomm.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 3/17/2025 4:57 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Tue, Feb 25, 2025 at 03:03:59PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > > > > > Add a node for the TC956x PCIe switch, which has three downstream ports.
> > > > > > > > > Two embedded Ethernet devices are present on one of the downstream ports.
> > > > > > > > > 
> > > > > > > > > Power to the TC956x is supplied through two LDO regulators, controlled by
> > > > > > > > > two GPIOs, which are added as fixed regulators. Configure the TC956x
> > > > > > > > > through I2C.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > > > > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > > > > > > > > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > > > ---
> > > > > > > > >      arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 116 +++++++++++++++++++++++++++
> > > > > > > > >      arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
> > > > > > > > >      2 files changed, 117 insertions(+), 1 deletion(-)
> > > > > > > > > 
> > > > > > > > > @@ -735,6 +760,75 @@ &pcie1_phy {
> > > > > > > > >         status = "okay";
> > > > > > > > >      };
> > > > > > > > > 
> > > > > > > > > +&pcie1_port {
> > > > > > > > > +    pcie@0,0 {
> > > > > > > > > +            compatible = "pci1179,0623", "pciclass,0604";
> > > > > > > > > +            reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > > > > > > > +            #address-cells = <3>;
> > > > > > > > > +            #size-cells = <2>;
> > > > > > > > > +
> > > > > > > > > +            device_type = "pci";
> > > > > > > > > +            ranges;
> > > > > > > > > +            bus-range = <0x2 0xff>;
> > > > > > > > > +
> > > > > > > > > +            vddc-supply = <&vdd_ntn_0p9>;
> > > > > > > > > +            vdd18-supply = <&vdd_ntn_1p8>;
> > > > > > > > > +            vdd09-supply = <&vdd_ntn_0p9>;
> > > > > > > > > +            vddio1-supply = <&vdd_ntn_1p8>;
> > > > > > > > > +            vddio2-supply = <&vdd_ntn_1p8>;
> > > > > > > > > +            vddio18-supply = <&vdd_ntn_1p8>;
> > > > > > > > > +
> > > > > > > > > +            i2c-parent = <&i2c0 0x77>;
> > > > > > > > > +
> > > > > > > > > +            reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
> > > > > > > > > +
> > > > > > > > 
> > > > > > > > I think I've responded here, but I'm not sure where the message went:
> > > > > > > > please add pinctrl entry for this pin.
> > > > > > > > 
> > > > > > > Do we need to also add pinctrl property for this node and refer the
> > > > > > > pinctrl entry for this pin?
> > > > > > 
> > > > > > I think that is what I've asked for, was that not?
> > > > > Currently there is no pincntrl property defined for this.
> > > > 
> > > > Does it need to be defined separately / specially?
> > > > 
> > > yes we need to define this property now.
> > 
> > Could you please point out existing schema files defining those
> > properties?
> sorry I was not able to get which schema file you are requesting for,
> if it is tc956x it is in this series only.
> 
> What I understood from these conversation is we need to define pinctrl
> property and refer the reset gpio pin in next series. If it was wrong
> please correct me.

You claimed that pinctrl properties (there are several of those) are to
be defined in the schema for TC956x. I asked you to point out other
schema files which define those properties for the devices that use
GPIO pins.

-- 
With best wishes
Dmitry

