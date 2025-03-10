Return-Path: <linux-arm-msm+bounces-50866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33437A59C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 18:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1CE188509D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9245230BE3;
	Mon, 10 Mar 2025 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bnedYXm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5317CA12;
	Mon, 10 Mar 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741626844; cv=none; b=Oh+R5V5zZxYUxJZ3EAvys9c/ZAXc3/9KtBFyxGwYoxwcae65zBJls+xyvOq8b8D7R+6gI+iO6doZ1/Gts8JlTcbC8Fafwb1JVO8m+p5F1oKZE1qCKjzEMLywaX8zppsHJnlJ3FMtlSpr82jgqtbhHyZ4geEw/48ROdOVdhxN5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741626844; c=relaxed/simple;
	bh=DzuST+tAc1H4SkPJV1eeY+j6xO5QqxQLswRjnYXe5hY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YOFr+hzNG1VBkqD3J65cMBNDOiKlACWtQglsXjq5F7OgpQCHuQwujFLUtklYYApq+A23xy9AG0h0OMEEkrrQQnyZl/yqvPgWdVR8mHRj//E2i4uV5CxKOQfq8V1vw52J2hxtHVAVwelHicADDTpockk/vuTmHzKVixx9rM4Xzkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bnedYXm5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9V3V4030297;
	Mon, 10 Mar 2025 17:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEwlZ3gpqNniHEI3bdWrdB+zU5HM/oQDFAC7kVivyGE=; b=bnedYXm5O5BKIUST
	3wNZQBj0VrTYLItQxcjsFDW9ZnZc6NNEJxxrTBYk3Q9pGV+hU1eIykq3Cmfdz77X
	LrG2GQ+PFS1UZ2yGsSbALMSuuS992Fjk/skgW+mYx2MHXuD4sUlU191Kb3aWsc2d
	0YHwjnCB7rhKw1kD11w06x6qOLqn5sj7+HHNYdcUwrLhGOthDiUOruEGwd4d2Mx5
	j60YQaqDPetTQ41CrScp8oaHopkizUrypffqtHuXfd0B9BMvW3eSmFFSK7JwRDz9
	7RX3o3E9fp3G5vEVwndoA2umi+JAHVYc40J47ucpBeBdOe4BgJqiV25Aw+79jJWe
	7ATcyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyt5j9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 17:13:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AHDpf0009306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 17:13:51 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 10:13:50 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315]) by
 nalasex01a.na.qualcomm.com ([fe80::fc0a:7737:fa2e:7315%4]) with mapi id
 15.02.1544.009; Mon, 10 Mar 2025 10:13:50 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Melody Olvera (QUIC)"
	<quic_molvera@quicinc.com>
CC: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala (QUIC)" <quic_satyap@quicinc.com>,
        "Trilok
 Soni (QUIC)" <quic_tsoni@quicinc.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Gaurav Kashyap (QUIC)"
	<quic_gaurkash@quicinc.com>
Subject: RE: [PATCH 2/6] arm64: dts: qcom: sm8750: Add QCrypto nodes
Thread-Topic: [PATCH 2/6] arm64: dts: qcom: sm8750: Add QCrypto nodes
Thread-Index: AQHbZgBqulxhwD1PeEOf2Oy4z8OuvLMaLA8AgFM8yWA=
Date: Mon, 10 Mar 2025 17:13:50 +0000
Message-ID: <28715695978543f7884357bd7c4153cb@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-2-d8e265729848@quicinc.com>
 <Z4k8kibtnlnpKspN@linaro.org>
In-Reply-To: <Z4k8kibtnlnpKspN@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 91VHT1CWabQnyc5z7TFb_bsnVAS-R14v
X-Authority-Analysis: v=2.4 cv=CupFcm4D c=1 sm=1 tr=0 ts=67cf1dd0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=xqWC_Br6kY4A:10 a=hWaPqv8yfGMA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2aYPDqRTfl-tYw73yZEA:9
 a=CjuIK1q_8ugA:10 a=632RQ6DdpRuuCkNA2XZ6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 91VHT1CWabQnyc5z7TFb_bsnVAS-R14v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=819 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100134

On Thu, Jan 16, 2025 at 9:06 AM PST, Stephan Gerhold wrote:
> On Mon, Jan 13, 2025 at 01:16:22PM -0800, Melody Olvera wrote:
> > From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> >
> > Add the QCE and Crypto BAM DMA nodes.
> >
> > Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8750.dtsi | 30
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > index
> >
> 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..1ddb33ea83885e73bf15244c
> 9cbd
> > 7067ae28cded 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > @@ -1939,6 +1939,36 @@ mmss_noc: interconnect@1780000 {
> >                       #interconnect-cells =3D <2>;
> >               };
> >
> > +             cryptobam: dma-controller@1dc4000 {
> > +                     compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.=
0";
> > +                     reg =3D <0x0 0x01dc4000 0x0 0x28000>;
> > +
> > +                     interrupts =3D <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +                     #dma-cells =3D <1>;
> > +
> > +                     iommus =3D <&apps_smmu 0x480 0>,
> > +                              <&apps_smmu 0x481 0>;
>=20
> Should be equivalent to iommus =3D <&apps_smmu 0x480 0x1>?
>=20

Hello Stephan, we tried this out internally, and the use case was not funct=
ional.
The masks are explicitly mentioned in our hardware documents and we are jus=
t following that.

So, we are looking to keep it the same.

> > +
> > +                     qcom,ee =3D <0>;
> > +                     qcom,controlled-remotely;
>=20
> If you don't have clocks here, you need to provide num-channels and
> qcom,num-ees. Otherwise, there is a risk this will crash if the BAM is no=
t up
> while being probed.
>=20

Ack.

> Thanks,
> Stephan

Regards,
Gaurav

