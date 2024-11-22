Return-Path: <linux-arm-msm+bounces-38875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC509D637E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 18:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FEF3288907
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 17:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4601DE4D7;
	Fri, 22 Nov 2024 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZ2YMktj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F71DEFF1;
	Fri, 22 Nov 2024 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732297478; cv=none; b=auVXQFZfFRmmoeQHuSYqgzTXT3qFbXS0oLAeP8TOJC4EXLwet0dwDkoDAN/3j1zmi42xEdQ55u/Y6DOWly9SzgnNpxN7hGPeZUfsWq/b7av/sWUuRV63MrjFFglU2JACEE1w3gOTvehroI/yz2HrKWF7JAIwj2QZdUnl0ezstiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732297478; c=relaxed/simple;
	bh=LTfcF1SnfYbuR6jnNpBsOiXWV1nNwAYPniS82toQRDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QdXDPlu47xgyXBPT5beVknnmY5uSCOpN8+6STA8FT6JmcQ0h3VJCbeoFFu14I8AODHL4ivBOUlignMmxiXbSccwiwcYDiqPU1W+w0MCH+E0cKvbnvCjYnOEM3wPH3WO26MtfD438Rs6IARvrJqHobG1IcZL0tTUMsWREXh0E51k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZ2YMktj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMG8DCS003764;
	Fri, 22 Nov 2024 17:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtL69AN9oMCYjCSYEQSCltA+7HfPoe92ivrgMjlg/F8=; b=fZ2YMktjrcYHMYno
	k/VdDwPGSL96nK4wxQaNviDas4dnpUYSejiuRF6Fp1o5bHxdVVyAOXOnyMIgUhMn
	eBDU6nG8kO1euGMVDYgtaL+d9E0KEGEYEp7k/uMGDJCSzXnSmpfTMXXZIy2bZrR4
	MyNb7Ml4cIi11FX0OBY6INkqgY56ADT+/eRtPNMfV2QHSm9FFBaJZEPoKDZRmDaJ
	nu/c8kZH3kZhFD7Le3OIsCaghNKSaeUrASgYrMkbF8pwlqjdDRWiwnsRVyneX4kO
	38fyeea7UzPqbcXNHsD5A9mrLqV4G9W5RBPrSi9rgfrEyCachH2U/oGzgK1vYjEA
	wNwavA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432w72r72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 17:44:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMHiKVG031094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 17:44:21 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 09:44:20 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Fri, 22 Nov 2024 09:44:20 -0800
From: "Lakshmi Sowjanya D (QUIC)" <quic_laksd@quicinc.com>
To: "Md Sadre Alam (QUIC)" <quic_mdalam@quicinc.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at"
	<richard@nod.at>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Sricharan Ramabadhran (QUIC)" <quic_srichara@quicinc.com>,
        "Varadarajan
 Narayanan (QUIC)" <quic_varada@quicinc.com>,
        "Naina Mehta (QUIC)"
	<quic_nainmeht@quicinc.com>,
        "Lakshmi Sowjanya D (QUIC)"
	<quic_laksd@quicinc.com>
Subject: RE: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Thread-Topic: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Thread-Index: AQHbPLzmOYXrwOalokeDht4Doi7jRLLEGOtQ
Date: Fri, 22 Nov 2024 17:44:20 +0000
Message-ID: <741980c863444f02ad949ff1a36f718f@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-ORIG-GUID: oslOqMu6BXiaXyu2pHflFmTSQxq9f-ML
X-Proofpoint-GUID: oslOqMu6BXiaXyu2pHflFmTSQxq9f-ML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220149



> -----Original Message-----
> From: Md Sadre Alam (QUIC) <quic_mdalam@quicinc.com>
> Sent: Friday, November 22, 2024 2:30 PM
> To: manivannan.sadhasivam@linaro.org; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; bbrezillon@kernel.org; linux-
> mtd@lists.infradead.org; linux-arm-msm@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Sricharan Ramabadhran (QUIC) <quic_srichara@quicinc.com>;
> Varadarajan Narayanan (QUIC) <quic_varada@quicinc.com>; Md Sadre Alam
> (QUIC) <quic_mdalam@quicinc.com>; Naina Mehta (QUIC)
> <quic_nainmeht@quicinc.com>; Lakshmi Sowjanya D (QUIC)
> <quic_laksd@quicinc.com>
> Subject: [PATCH v2 0/3] QPIC v2 fixes for SDX75
>=20
> v2:
>  * Updated commit message
>  * Added stable kernel tag
>  * Added Fixes tag
>  * Renamed the variable from offset_from_qpic to nandc_offset
>  * Set buf_count to 512 in the parameter page read
>  * Replaced the buf_count value of 512 with the len in bytes
>=20
> v1:
>  * These patches will fix the following:
>  * 1) onfi param page read which was broken by exec_op() patch.
>  * 2) Fixed offset passed to BAM from QPIC base
>=20
> Md Sadre Alam (3):
>   mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
>   mtd: rawnand: qcom: Fix onfi param page read
>   mtd: rawnand: qcom: Fix read len for onfi param page
>=20
>  drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> --

Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>     # on SDX75

--=20
Regards
Lakshmi Sowjanya


