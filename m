Return-Path: <linux-arm-msm+bounces-31423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC1973C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 17:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 252BA1C24BA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AD319D09F;
	Tue, 10 Sep 2024 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pn/h+4g2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F85191F82;
	Tue, 10 Sep 2024 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725983020; cv=fail; b=RVJNDTsHSVj8/DQef24VQuZJfDy1xLQee4bfwuujuQ4lm+xDckSloXnUPG1CtWMVrsQMGd5uXf8F6iq/lJQztt/U9PI0k2pIqy/SnhFe+xHzooqa/J+wEjvCTspptfo8pylhCwMEXIDF0ARk0b5DQdFU0UhgHjl1zeeb+5USSSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725983020; c=relaxed/simple;
	bh=2f56hlNTGOQl3g9AYUjsIX3IMsxJXvDZ4DwSA/ZTezY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gdEzIq0mtynwMl9dkToHOYAPWGibZgUQpVq04chBteWZ8yfCGf2NMsSOszjf5In4r5L7zU6Q1jh5USfoxhpC64KYAPx0QWi0vTNJmDTOOeVS5f3KdYutZl+cbtuWKr05jNRIURjjCRLA0awVBBk39xgcUzZ7eeKWFvxCPgB1jCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pn/h+4g2; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AE2bie024935;
	Tue, 10 Sep 2024 15:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsHDjhju6KNA1Jr5BJ1dDUh3rqn+TnYP/0h8eRMuvXY=; b=Pn/h+4g2Kbbme8Ui
	qFjRWP3Og2MM7gW+SmaQ0GykuSf10l1Hw/FqB74mzshsAqNr39HO69QROL8dutDP
	cpJ3O0Zxz1XeSQ7tbUeFNnHjnZU35fyCIljO+WA2N7yLpQsl5Q5qvXp/JiS6a0j8
	o3xPLsMGU7E1aPQw/9qVBNKB2wfVjpnlzVH4Mkrjoq0/wlqIIXKT3TMt4nWK6l6r
	rqiKUg3lMnAzxdpFvY5Dsx4GCyYTfqnemaYf7qmFmb6t+LPTLghYmhblpU2DL0TA
	OfVwUwrWnfqqdvLRDD8X6DNsFZIeejTCi7z3eWy06xQbAoB3N6R0dZFSoxW3rKpo
	h5NgIQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy72xg3c-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 15:43:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt2EyVb1k4aZD8NjfqP6kB4kJwH7qekqxn3yjYEYu+yEMJ5gTPiU3qhWsrU0Y8M+/o+8oK7jRe9iaitA12BFj6lO8xaI4A1YDc8sKBCtrl1ViJEIz1odOd7dysyRNPltWL9DzXtNUMD3bzsL/HukufKBJnPgv1aYjJVeu29Hccg4T7spICAysxJRp+qu7SRV7v3+4urzwWSF0cM/UXHzIN1r7pmq8dTFSbG1NG7+lg4SKTzFtxeLwHc/AVKwfp5u8PhaymlQMee4ZBH+x7+Cu+zI7k/EdRHN0IoV7Um/xcIh+4UG3/mqRSmdvTqLbqysTMq2B1dQNqsA0MBiUF0v7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsHDjhju6KNA1Jr5BJ1dDUh3rqn+TnYP/0h8eRMuvXY=;
 b=XYHmvCqfB8VGaNcmdv5b4EEdyWny7aIK5fXImZtfIogpElL2UvuTsF2nZ8OMTUE30UDM8P0mtjPg9WhS2Tf5t+rhGPkFTU5L9qlW9RLTZ9kUlHNsrSQpps+Pc2bPxxFLlQzFIuNs7RTEmrLpLH5vgYcgxGuyj5geJAABjEZZ2+pR7HAYXVXSPnStCxG8FpMDMtJx+Ba+TaHU++qTouAjZd3WkKQtutcpjcKZHJcCF+w99EZvpuhg0mCHWd/hWpXXasIjf6gm/dRgIL8C/kX3RSJQilzsVF+UgScECF8B2RGyAWQEk81+NUe/ZD7GnslzzHtMLRwRESxw+5FaRotFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CYYPR02MB9788.namprd02.prod.outlook.com (2603:10b6:930:b9::10)
 by CH3PR02MB9210.namprd02.prod.outlook.com (2603:10b6:610:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Tue, 10 Sep
 2024 15:43:23 +0000
Received: from CYYPR02MB9788.namprd02.prod.outlook.com
 ([fe80::ec21:28ed:812b:5270]) by CYYPR02MB9788.namprd02.prod.outlook.com
 ([fe80::ec21:28ed:812b:5270%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 15:43:23 +0000
From: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
To: Andrew Halaney <ahalaney@redhat.com>,
        "Suraj Jaiswal (QUIC)"
	<quic_jsuraj@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>,
        "bhupesh.sharma@linaro.org"
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose
 Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>, Rob Herring <robh@kernel.org>,
        kernel
	<kernel@quicinc.com>
Subject: RE: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Thread-Topic: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Thread-Index: AQHa/R4ePGfgKVjZ6Uifzf7R+/RambJGo9cAgAqRnSA=
Date: Tue, 10 Sep 2024 15:43:23 +0000
Message-ID:
 <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
In-Reply-To: <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR02MB9788:EE_|CH3PR02MB9210:EE_
x-ms-office365-filtering-correlation-id: 44da1b14-a37b-4975-5e94-08dcd1af4dcb
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vIhc2FTJeTqbSavpt4BhlQ6kVoTuUoDUuWJg7ha3wvt+3rc1sS0pRBotm4AQ?=
 =?us-ascii?Q?MMhuq7S9xgic0nAWuY/YsTthPfnqKIwWBpZbqG6zCe/2D3dfEzBetOlwUv2J?=
 =?us-ascii?Q?yN6zAoj/rBfn7It+HZgm0Dcs/WlFDPsYBa8Hm+CjMFXwbT38h+LDwJs7thZL?=
 =?us-ascii?Q?WlXaOxIB9d4nIYBcqrCSrXPoN/aNlc7STfoi0RcxRaM+M88N+AUUUyl5wF2m?=
 =?us-ascii?Q?BetpgrJr/BAhpa80R8KgnqQpavPYrF5kJgZT9CudTmHLwM+eCh5N+M2dN8Dn?=
 =?us-ascii?Q?IMHUJnttaH2/G/w1Wf8fsXJkTN3t2s21if0A2EJoee7/Uml4x5KtKbaaEGH6?=
 =?us-ascii?Q?LBXV1kKuoZgIYM+18m+9LtdAbLEk4BqZfNZTB3NZJ9ctQYI65cURus9Q0QId?=
 =?us-ascii?Q?PzJW66lfxJAjG6YQBUccVLx80y1dJtwmmZWeMpLnwMXNuo9QSiMgh3rVPVno?=
 =?us-ascii?Q?kLFP/ZOhHVb4wB3sjDyl6+jyWoqJBd3F9R54ArFBmh6/XTsPbTgqt6UnG4IY?=
 =?us-ascii?Q?1/hVKMpkaSh7KhTrP6AdhwAQ7rLLR3UmQRWJoTmitRoF0ktkjCwR0elVZ51u?=
 =?us-ascii?Q?e1XsuIZK9M3lqzN6CaVURsjbalzAnIXncAXhNHJWSkIbWVEebKgNz25P0GOk?=
 =?us-ascii?Q?6MrH6McYymmLZyqr3d4wFjTM6s21T88SnJQzPKdxYON0ad84lZwALRYMBBG3?=
 =?us-ascii?Q?2VTLP9/7pLj78HsneC5y0n1S5cJp0ZAlV2YggfT7m2hUf7CLbI50i1tEp4HJ?=
 =?us-ascii?Q?zmduTCFKMNHp1LCfLxIaFROOzH42vjcas8qCs72vM/d4N/U5htNofoIt+ptU?=
 =?us-ascii?Q?RRcJBPoJVpMQW8IBzkaFm2CmbN6QhPSeCApE02WdPFp8JMnoJRir1DZbOAQA?=
 =?us-ascii?Q?xA9Iqm0kunc5QKeVwm99kVF6N7GjJj1W+flTZz4vQ7Ghrz7p6O3SZDNY17VA?=
 =?us-ascii?Q?rfPKbwYPaYPAkmYYj0MM68hR28PT93DG7wRPZLOHLdgQRRCMGGa6cAOBgLit?=
 =?us-ascii?Q?eBQiRXTEZ3j+cKLLC9giwN5lTseT24xmtgDEPGH7gBfcHjKNDCc5p4YlsQcm?=
 =?us-ascii?Q?/Zcjwlf38qigKG1FBDfZhhg3ESAbIOtpUHKSsvsIPf76K9OGahoywWvoQ6zH?=
 =?us-ascii?Q?gm3Qyqz8c/vzwM+bn9ZXK7HfZ+pdAf7gsLvNjuKATyjdCYtp+3iZlXuMVySB?=
 =?us-ascii?Q?g9tIndd2xVPgtxG5yJlREX3QRPNBNp47c04p5GUav6x09vio92IjfubqRuzr?=
 =?us-ascii?Q?dOn/k1qRldG6hNJkOUXNwnCK60S05+fvupetuv/yVB67ZiOAJ7g+Jn02aiMZ?=
 =?us-ascii?Q?Y6rMLS+Wjl0+LcnSzzeqRi7AlaHA6bIHup46+wOCDonfnX3xXMMsp0HgKwgj?=
 =?us-ascii?Q?pFdEqZTLF0995cqbU/oIrcw6+zvAWWNaD+/u5IbwLp+ADsME5w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR02MB9788.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3iJYsnij1jYl+Wax9gBtrMOHGsDMXqnwMDfwJwVjO3GRr5MRBtpY3xMyGkeB?=
 =?us-ascii?Q?Wn18pc0DSNAoE/mSmdr9T5CQBnAJnF+L8JnoglCJOT+lYdyR+G2ARMtJEmuT?=
 =?us-ascii?Q?s0fpV1IaqFp0Dn22xaWIpTQYaLcetS3+w2apQpHC9lJ2xbnuW7IAk5H/XJ5h?=
 =?us-ascii?Q?wDFFzmAvLakGXmXDLSNVGLow3pidLd9qtYd/yyTdKqGsF9NimZIEKlc/RwUR?=
 =?us-ascii?Q?Lkn4u+sqQ/kM8bKVR+O45eunfSzggQ6Jf2Xp4Hv4PfFYvrwo8PMVvfOpYEyc?=
 =?us-ascii?Q?cED/XyA4mzMnnc/pxuTWl5dugdOrlQ7z8DCQ/hBQVRTnzMrh8C0T19+Zo+1J?=
 =?us-ascii?Q?MOJLXYQ3kII8oKkgyDXRzc7U+iLrfb55nQB8giphiBU+EYZEqQjWtn95aXma?=
 =?us-ascii?Q?y9BoEScuVfKyqeLC6ua27fHjfv8vp2mIpZmHmsxNVx0huEE2BmvbtvF8YL7g?=
 =?us-ascii?Q?NHtFLcwyUTY8vytKNDHxO3Dc1seHwFoH1BYEaOTexsCRYwNdipASlHuNFEZ1?=
 =?us-ascii?Q?w5JaBCJ8lquPmJMaXCqprHJCKa7IsZWFLOzUUKOUebeVaVODmoKfGwqlu+NG?=
 =?us-ascii?Q?U47vp0IMOcrt6OJtQuJNbKbi2Ki6B8yaYD6dcUNzDG64C03YnlH8mwP2UvXf?=
 =?us-ascii?Q?iEdxUMq3DP0CQcQzE4hJaFXtLVIPdOMQABpKztJHedCP7mlMMqBJxCQLMzNu?=
 =?us-ascii?Q?IjNQd8uVMBPlf+6YcyWRdKST+KJ/v+95k3TWyp+YKaUZhxlZpyztZK/P7UFJ?=
 =?us-ascii?Q?j4wCMv9yyzV0jLQ6scHoiT7Fx5OOL7sUazdLF8ZKBHBuIsu5e5Td0FPWR+HA?=
 =?us-ascii?Q?qTGDNssmvkGI25L4/ZnlOSTCbNRSmoL714sm1dsAiKi6KqBb6gRzdyvThsGO?=
 =?us-ascii?Q?D8mv1RqXJz3bnr9EXhofeJp1HeDLF9U3BjWvgxFNkG8zOmehMsI4Z4OLyNjS?=
 =?us-ascii?Q?/O91zSNKQUYokL3Bi0n7T1qqSFjWoqsBDis6AbRTeSm8q1yTw55THc1be9Ql?=
 =?us-ascii?Q?sSMumIaswMUz1n2ZIXSPMxV++cUYD5lwplhzcyl2H3AbFPqDw9UWkfYDeIPh?=
 =?us-ascii?Q?mE25yG/cPmiJXOb2TEdur8xYHd9+j4chdON9eFU7o/HoVTfN/b4F8Vvw2t3A?=
 =?us-ascii?Q?I2GJnZlSGmqCBJDe//lUrcLGmuM5Zx9ezmTS8xhqKAMPc6A+NManZoeEuOqN?=
 =?us-ascii?Q?HOtqDZZUaBnFOuomEHML5XpLPnnkAO/pJLuXzyZyvKv+i1swEFPKxdkk8iST?=
 =?us-ascii?Q?xkLe/MZjgkRD8XPO0upDl5BijVwNx2sOkJ/TdJLeHpp4GFmbTXBX2kRQ4pPw?=
 =?us-ascii?Q?he2P+bfFd943+9YZy6qsFBhhUfSRXZHI5lWn6Uad6hjyi6iW95dXdcvIFza6?=
 =?us-ascii?Q?64InggRDCGA3EBMVKa/C41T/q7cCf0xcz1ZNbKHWqAA7Zno21MT8z4ATFjkB?=
 =?us-ascii?Q?pkr9rkbm3esubltqpOBpovdcETGikF4U+bVpJq/diorf7OB24wOmxeMV6FCG?=
 =?us-ascii?Q?vInAIQq4hO1a4HahQi56rTfB4ymIUrQY/B2L+SER5omwpVHdVWviyk7Zyk0X?=
 =?us-ascii?Q?TQEBbWLl5JLkC/+kflua9IbDBMZZOtiAa1fUyXke?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hkIDjvgQFqAJezkV0uOd9yBCliJT7IORrXsAzJc5zDxkx7H639HySkwgfKHf6RjoaiItFQqftZ796CHTFboXKj/IKJ1L5CE1SbcQMDfcTgN45orbn5hteLwYu3TEpd9b2DaMqsZnz229+8yBVYzRDUjUGo8403CPX4xEG9qaivf9LxASX7qEURxheywSZn2+4rUwE6Lg36x4YZKYPtbvLIL7euyNYNYbvLcTAQBxJw8QKjRU5IQjBb2IA9V8iWbmJL6qMKG3lVK4bg+yr7AZLUlh9SvKpbwA3pWPuTfxM6xjt1OWdnEnTHwS459Ezq+DQk2GTN2yROC2NLVCWiTdK+NeUA6CEBFKTp6322mMrbV5scuGJqsQIPtKkWa/SXirgdjlm4DBHQAREuOobiDO9xycru1gwnk/Z+txfTWBITScS+qnpnXmGI2Mu7lg6MtUNoi5MQ67fDw7H1AdyXSjf+mVCLdqSZ/NkCh6f5Oq4iQRrsd/5l+jRnO/QtAw5/Atj+jN8M5UVnoBNfGL8u3j4qfHmMFjYCSMf5grYKyo2VnnJjVMCChKd4VdxhOy3sPeLgeK0HoeSB6rCT6YJ8WBcwI+g3o3fkGbvElHp2mMg0O0gN0ctN4vcoNsTjIj5xw8
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR02MB9788.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44da1b14-a37b-4975-5e94-08dcd1af4dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 15:43:23.3847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rh+6GwbV2q6xrFYe4TxQUM8FfiyECHM42UJn1vCQr65bTeU5ovLA2xzCbDNWvQnn0hVQPG/ht6aW8w7C5/zO4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9210
X-Proofpoint-ORIG-GUID: ap_gJ3YMjB3rhix5T2Tn_vDL24_vpwA5
X-Proofpoint-GUID: ap_gJ3YMjB3rhix5T2Tn_vDL24_vpwA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409100116



-----Original Message-----
From: Andrew Halaney <ahalaney@redhat.com>=20
Sent: Wednesday, September 4, 2024 3:47 AM
To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <a=
gross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <k=
onrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumaz=
et <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <ro=
bh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>;=
 Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@fos=
s.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.st=
m32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devi=
cetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mai=
lman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <r=
obh@kernel.org>; kernel <kernel@quicinc.com>
Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for mul=
tiple descriptors

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> Currently same page address is shared
> between multiple buffer addresses and causing smmu fault for other=20
> descriptor if address hold by one descriptor got cleaned.
> Allocate separate buffer address for each descriptor for TSO path so=20
> that if one descriptor cleared it should not clean other descriptor=20
> address.

I think maybe you mean something like:

    Currently in the TSO case a page is mapped with dma_map_single(), and t=
hen
    the resulting dma address is referenced (and offset) by multiple
    descriptors until the whole region is programmed into the descriptors.

    This makes it possible for stmmac_tx_clean() to dma_unmap() the first o=
f the
    already processed descriptors, while the rest are still being processed
    by the DMA engine. This leads to an iommu fault due to the DMA engine u=
sing
    unmapped memory as seen below:

    <insert splat>

    You can reproduce this easily by <reproduction steps>.

    To fix this, let's map each descriptor's memory reference individually.
    This way there's no risk of unmapping a region that's still being
    referenced by the DMA engine in a later descriptor.

That's a bit nitpicky wording wise, but your first sentence is hard for me =
to follow (buffer addresses seems to mean descriptor?). I think showing a s=
plat and mentioning how to reproduce is always a bonus as well.

>
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>

Fixes: ?

At a quick glance I think its f748be531d70 ("stmmac: support new GMAC4")

> ---
>
> Changes since v2:
> - Fixed function description
> - Fixed handling of return value.
>

This is v1 as far as netdev is concerned :)

>
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63=20
> ++++++++++++-------
>  1 file changed, 42 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c=20
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 83b654b7a9fd..5948774c403f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4136,16 +4136,18 @@ static bool stmmac_vlan_insert(struct=20
> stmmac_priv *priv, struct sk_buff *skb,
>  /**
>   *  stmmac_tso_allocator - close entry point of the driver
>   *  @priv: driver private structure
> - *  @des: buffer start address
> + *  @addr: Contains either skb frag address or skb->data address
>   *  @total_len: total length to fill in descriptors
>   *  @last_segment: condition for the last descriptor
>   *  @queue: TX queue index
> + * @is_skb_frag: condition to check whether skb data is part of=20
> + fragment or not
>   *  Description:
>   *  This function fills descriptor and request new descriptors according=
 to
>   *  buffer length to fill
> + *  This function returns 0 on success else -ERRNO on fail
>   */
> -static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t de=
s,
> -                              int total_len, bool last_segment, u32 queu=
e)
> +static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
> +                             int total_len, bool last_segment, u32=20
> +queue, bool is_skb_frag)
>  {
>       struct stmmac_tx_queue *tx_q =3D &priv->dma_conf.tx_queue[queue];
>       struct dma_desc *desc;
> @@ -4153,6 +4155,8 @@ static void stmmac_tso_allocator(struct stmmac_priv=
 *priv, dma_addr_t des,
>       int tmp_len;
>
>       tmp_len =3D total_len;
> +     unsigned int offset =3D 0;
> +     unsigned char *data =3D addr;

Reverse xmas tree order, offset is always set below so you could just decla=
re it, and data really doesn't seem necessary to me vs using addr directly.

https://docs.kernel.org/process/maintainer-netdev.html#local-variable-order=
ing-reverse-xmas-tree-rcs

>
>       while (tmp_len > 0) {
>               dma_addr_t curr_addr;
> @@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_pr=
iv *priv, dma_addr_t des,
>                                               priv->dma_conf.dma_tx_size)=
;
>               WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>
> +             buff_size =3D tmp_len >=3D TSO_MAX_BUFF_SIZE ?=20
> + TSO_MAX_BUFF_SIZE : tmp_len;
> +
>               if (tx_q->tbs & STMMAC_TBS_AVAIL)
>                       desc =3D &tx_q->dma_entx[tx_q->cur_tx].basic;
>               else
>                       desc =3D &tx_q->dma_tx[tx_q->cur_tx];
>
> -             curr_addr =3D des + (total_len - tmp_len);
> +             offset =3D total_len - tmp_len;
> +             if (!is_skb_frag) {
> +                     curr_addr =3D dma_map_single(priv->device, data + o=
ffset, buff_size,
> +                                                DMA_TO_DEVICE);

Instead of defining "data" above, can't you just use "addr" directly here?
<suraj> addr is void point . we are using data to convert into char *=20

> +
> +                     if (dma_mapping_error(priv->device, curr_addr))
> +                             return -ENOMEM;
> +
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D curr_addr=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D buff_size=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D f=
alse;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMM=
AC_TXBUF_T_SKB;
> +             } else {
> +                     curr_addr =3D skb_frag_dma_map(priv->device, addr, =
offset,
> +                                                  buff_size,
> +                                                  DMA_TO_DEVICE);
> +
> +                     if (dma_mapping_error(priv->device, curr_addr))
> +                             return -ENOMEM;
> +
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D curr_addr=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D buff_size=
;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D t=
rue;
> +                     tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMM=
AC_TXBUF_T_SKB;
> +             }
> +
>               if (priv->dma_cap.addr64 <=3D 32)
>                       desc->des0 =3D cpu_to_le32(curr_addr);
>               else
>                       stmmac_set_desc_addr(priv, desc, curr_addr);
>
> -             buff_size =3D tmp_len >=3D TSO_MAX_BUFF_SIZE ?
> -                         TSO_MAX_BUFF_SIZE : tmp_len;
> -
>               stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
>                               0, 1,
>                               (last_segment) && (tmp_len <=3D=20
> TSO_MAX_BUFF_SIZE), @@ -4182,6 +4210,7 @@ static void=20
> stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>
>               tmp_len -=3D TSO_MAX_BUFF_SIZE;
>       }
> +     return 0;

nit: add a newline before return 0

>  }
>
>  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int=20
> queue) @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct =
sk_buff *skb, struct net_device *dev)
>               pay_len =3D 0;
>       }
>
> -     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags =3D=3D 0), que=
ue);
> +     if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
> +                              tmp_pay_len, nfrags =3D=3D 0, queue, false=
))
> +             goto dma_map_err;

Changing the second argument here is subtly changing the dma_cap.addr64 <=
=3D 32 case right before this. Is that intentional?

i.e., prior, pretend des =3D 0 (side note but des is a very confusing varia=
ble name for "dma address" when there's also mentions of desc meaning "desc=
riptor" in the DMA ring). In the <=3D 32 case, we'd call stmmac_tso_allocat=
or(priv, 0) and in the else case we'd call stmmac_tso_allocator(priv, 0 + p=
roto_hdr_len).

With this change in both cases its called with the (not-yet-dma-mapped)
skb->data + proto_hdr_len always (i.e. like the else case).

Honestly, the <=3D 32 case reads weird to me without this patch. It seems s=
ome of the buffer is filled but des is not properly incremented?

I don't know how this hardware is supposed to be programmed (no databook
access) but that seems fishy (and like a separate bug, which would be nice =
to squash if so in its own patch). Would you be able to explain the logic t=
here to me if it does make sense to you?

>
>       /* Prepare fragments */
>       for (i =3D 0; i < nfrags; i++) {
> -             const skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> +             skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
>
> -             des =3D skb_frag_dma_map(priv->device, frag, 0,
> -                                    skb_frag_size(frag),
> -                                    DMA_TO_DEVICE);
> -             if (dma_mapping_error(priv->device, des))
> +             if (stmmac_tso_allocator(priv, frag, skb_frag_size(frag),
> +                                      (i =3D=3D nfrags - 1), queue,=20
> + true))

Personally I think it would be nice to change stmmac_tso_allocator() so you=
 can keep the frag const above... i.e. something like stmmac_tso_allocator(=
..., void *addr, ..., const skb_frag_t *frag) and just check if frag is NUL=
L to determine if you're dealing with a frag or not (instead of passing the=
 boolean in to indicate that).

I'm curious if someone else can think of a cleaner API than that for that f=
unction, even that's not super pretty...

>                       goto dma_map_err;
> -
> -             stmmac_tso_allocator(priv, des, skb_frag_size(frag),
> -                                  (i =3D=3D nfrags - 1), queue);
> -
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].buf =3D des;
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].len =3D skb_frag_size(fra=
g);
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page =3D true;
> -             tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type =3D STMMAC_TXBUF=
_T_SKB;
>       }
>
>       tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment =3D true;
> --
> 2.25.1
>


