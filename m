Return-Path: <linux-arm-msm+bounces-23618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C3912A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B90FA284BE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D9D80605;
	Fri, 21 Jun 2024 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvJDzl8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833817554;
	Fri, 21 Jun 2024 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984236; cv=fail; b=m7RzI7Ehd8SxnRxFMH4a55IGofipQqIYTXkfh3dqi9uO7gGke8/5yhEmO3khXfxJQnBNyFu46shyDPeAL61LFViXwIUUTN5/pONO5OS4hb+dn3BKjsF5NjwEpSIIEKV7RhyFmoyjQOulvK6WPUIDFmHqn1522hxoI2kyS1nM6W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984236; c=relaxed/simple;
	bh=1lfIOw48o9/acipHEO+RCaGW7IbQ+ObItU+DrGk3AF8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qf9fPSQyXSKXGRpnA6e1ic4EEh1TWjNdgZOBl0q1vAq5e3KrlUE/etrSEZTxyWNPNyap/dWqsQio26otwmb5he1kz5tHlEF75oYen1qyQJ9J9adc9J8gt0se+dPCzrNoSHZ512W1lFEK0bMRnS8yxfcxcNdH1117dQP+LTvZAnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvJDzl8g; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEQvVl010657;
	Fri, 21 Jun 2024 15:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXJs9pdCiYmZzYybfMNeGdb+K0IYuZKhfjK6iUyAY+s=; b=dvJDzl8gVpYocZOa
	g10vrRgdCStd/yZks4hsTxzhE7TrtJ3z+5YFAEvCkbTZ8krAIDMyVxNMVRz+w/+C
	njCzEyGVx+eLqrt1wMyDhlIAJPGqff21Kw+7tGR0QnNL66xpzGzednZW6X+HW8kL
	0d7i4ReQFFzVhU6QOmXfXfCvSkzMFv7FlOIRzHQTJ0qB+IZgH6mxOTaX/wkRsVxW
	wB3f4wGZVYVU/Wo8bYRUTtEsQLabbf6tqwYmOC9elT7g8a1QgywaxmlxGzeDUIkh
	Vut20sxPy6lmm1Ulwc0GAcj0W2Z+8UPVToDrB5V3SgWavmrcMl631IM4qsSCie68
	pwjgVg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrrcaxf6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 15:35:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO/uFRJLrQQitt7RArDi445/cMnSZjQJverZsy7cgvEiPSXobLuvfjC3Dw+z1gRS3BZ3YFl9DinPP8zvN53Q9TmMlnYw36UM2c++5ARZcDUy6ivCqsTjoEBdg8o8H6mwqWFapLz0Ew3i/tkPhK7hHKKK3PC2MpDi2Tdgm/50xMo6M3POQ0iTIUzbwUBtxWIC1zFRTVWrb2pFze7D6adxRDOgw1ffWgs/sfHbMo1kGsynSzdQV74j13ANLbm1tvvwoLUsqPNGaShc6ZI+EPWMdyYX9LhagADTYnEXXiCQhYIv5KjipLPOG9VPQKBJ6bYCSjq51+cAmakyh0EBje9HOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXJs9pdCiYmZzYybfMNeGdb+K0IYuZKhfjK6iUyAY+s=;
 b=Ddc5GQgT1f4hzXkJCY84jpqhabj+Ef1e8L6m16uXEus8UPKJ0kD1PLcEQPecyY5UmUwZyzt+PVwGROd4dhnBYvqLvTA5IqlECDXDdp/m5Mu0L2dwKG4vHcl7NACJESX2oaDcbC4kYkF6ibZbUbM25MQ5Kej6n26g01lpD29g9q3LuPdDBLxFz+1MLGwfn5Zyr1WR6LyhfK/ejBqE0qitBrt37tAZqO+izmlkMNtOB8SEKamS/sX5jqmrfsywBkMgpbRotB6rXT7Tnup54pDLhLnf9AxUPIQTA/SSeI/Ov5vzK3EUmCVmtyTZOuVUDSTPyUgWXiZZTKV6AKEQuiQGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CY8PR02MB9502.namprd02.prod.outlook.com (2603:10b6:930:74::8)
 by MW4PR02MB7219.namprd02.prod.outlook.com (2603:10b6:303:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 15:35:41 +0000
Received: from CY8PR02MB9502.namprd02.prod.outlook.com
 ([fe80::d4a8:5b38:2a86:131d]) by CY8PR02MB9502.namprd02.prod.outlook.com
 ([fe80::d4a8:5b38:2a86:131d%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 15:35:40 +0000
From: Gaurav Kashyap <gaurkash@qti.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>
CC: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        srinivas.kandagatla
	<srinivas.kandagatla@linaro.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel
	<kernel@quicinc.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Om Prakash Singh (QUIC)"
	<quic_omprsing@quicinc.com>,
        "Bao D. Nguyen (QUIC)"
	<quic_nguyenb@quicinc.com>,
        bartosz.golaszewski
	<bartosz.golaszewski@linaro.org>,
        "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>,
        "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Sonal Gupta <sonalg@quicinc.com>
Subject: RE: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Topic: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Index: 
 AQHawFG6VsCw7PWZMkOzpx/FXAMGsLHLlpSAgAKAiACAAAKgAIABlhgAgADhogCAARo5gIAAsw2A
Date: Fri, 21 Jun 2024 15:35:40 +0000
Message-ID: 
 <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
In-Reply-To: <20240621044747.GC4362@sol.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR02MB9502:EE_|MW4PR02MB7219:EE_
x-ms-office365-filtering-correlation-id: 6b6744f1-1a84-40da-c9dd-08dc9207ce96
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|1800799021|366013|7416011|376011|38070700015;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?5/ISDXGGRZ8Yt/FXiHmygss6+8jTWKfY+6cm+1tvfKdl4XxPwuS6rcD5TZyD?=
 =?us-ascii?Q?uI5KxD73IBBzvGiCoZu/yAW63/ipPErIMQRrs7u/tnva//+IhU0aOTjfmRSN?=
 =?us-ascii?Q?6u36KUFaXKjiIcnjyiJbzrMKv74ywjT5rd+QFzQ5k4pwsVOir+Pr1g50GgGi?=
 =?us-ascii?Q?kP4U2dqTt3j4ycGrIBppoR+vrKK9EWjawzCwlns9gFPcpqc9Vz3bWNIRIbor?=
 =?us-ascii?Q?8souRKMbkWrnagG4zQ6idM2XWQGTCeia073NK1Zmm1fox/y4R0WI/o4Lu6z/?=
 =?us-ascii?Q?zTTgjcSUYtHVwxyJzOp+yU+1GtqyD/vWBkd+oInFqE3EhV1pDHbyBqSH8GQu?=
 =?us-ascii?Q?5+x3tDLJdRFE2XC3UcWP1bQt+yQNZK+JOGHjqonKYUmXifjvur9bguupVn+S?=
 =?us-ascii?Q?0Uh7QjLzplC6mK+T7QIGWQsz5uRzcWf7giL8XuECwuIGng/eaySjzlOqLfS2?=
 =?us-ascii?Q?gxY74VOmYle4ciU8W4TUT1//39mQ4ziIhpnQ+qymPC/mWOBcr0QKtQdBIyQW?=
 =?us-ascii?Q?xhGjbivCqEAoC8gTeptOisT1yw3G0Y1lSLyGN08S/gdmAuGrnzmrEHW4MA3E?=
 =?us-ascii?Q?G8dSi+vomyliarseBPVV4SMJWgAHVeWVo5KhxV7obew52P0yOZB3eAMmVpw/?=
 =?us-ascii?Q?FpRRaC1MVyOhWy7iRw4F2drLt8jhAy1lTur4yAiOtJYsPKuCLsS0zHC4t/Co?=
 =?us-ascii?Q?uxdSrLlniltERjCF18IInwz+4LUSBY+aBCRcNcPWkX22mJ1EyvoZMGsCUWfz?=
 =?us-ascii?Q?figEHU5i76glZD3MCyLLURT2njwTiYJuGwjWfAhnyJQl2LaZg9a4VoiRGb3x?=
 =?us-ascii?Q?A3T2aWjomEGU4T63AIto+9xXPYfHSH66A9FdI42KBl4Mf0SyGsn+BIid20T1?=
 =?us-ascii?Q?u/Fw6QglPHEduzckILXv0EXtTzDjz91CAmMPLh7Ra+KNwSbDsIKoNkPivr0V?=
 =?us-ascii?Q?UDbYIzVPH4A5YCVmBylGRY0puzoDh0kx+ty40k/aMvdSfzCW2YjwLmnwLNHo?=
 =?us-ascii?Q?ixr9AvRMEL6lYM2lSzBeEOFfrW9R0nhg1P3HtNUGICddhkt3r+1DHu0SiL9D?=
 =?us-ascii?Q?d6QlzvshgM6ZeRNZ5VrjL3wjrdArVYYx9BofjEGbV6/HvnmV8mz1n6iS4tOQ?=
 =?us-ascii?Q?fSLcLxDBXZikndOuw4DBHKRbaTkiLv+dtyYhwcQUa8L4oir4o+RfIIub5tBK?=
 =?us-ascii?Q?7PVqJ/xfhC/VLsKujuPlrhA+6UG7Ynff/yfSILtyTlDg9D3LlTA5CX07Q1ti?=
 =?us-ascii?Q?KY74IS9ZM7QJw+CdBHA8s2hmeY/aGnZGobsx04L2ukeD5BfqcsGusvBE+DkP?=
 =?us-ascii?Q?FjvInmFLN7HqAKwvnKCuqwq4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR02MB9502.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Djc4AkeByVxa0egMrhxmQ7QJ47FBxu80a/ckrPpxiuar4kQjmfSN+ePJ3Ove?=
 =?us-ascii?Q?zbES2Y/iOZf7urIef3GDksn+vbqdF+y2zC+fC2NJFqieZdMfPAXeCI5ojGbk?=
 =?us-ascii?Q?1PXt8B46gzLGlcbhQRl5RBWo9CC4yltSl5P0qYm0Ibt09X6eM/BjxNPQh4hQ?=
 =?us-ascii?Q?7gXkUkYtE+RpcoiPN4WpfuZT+Ec4k0STbhNVM9npkDgHC9cuZP08khoiUeIN?=
 =?us-ascii?Q?nbyToH2ycDa3x1dtrU3RBMHt0k+WjNJWpCem0PmaQRvyAkspPib2cQ7q5xph?=
 =?us-ascii?Q?J6966JL4YuCSd/AICgFyQkiaRGk7z/+RxpooNNZ8IRx2eYSkKPKiCCEIuerX?=
 =?us-ascii?Q?GfepQZhUhE5I18YfoP+hHAv0S7Ouo+VXqKnnDCaud+58l6CMRs+NsDAQG8v3?=
 =?us-ascii?Q?83tPqWh8GFWA2vA4m3VFCLdoumpqeqyi+mKczzIHT/XGhSaaGtK/HFvAYC19?=
 =?us-ascii?Q?AE2EBuWKkqjEJb1X+RKOQGDoLUorXE4TGOls5Rbo46pshza4J6nV5sCcjSw2?=
 =?us-ascii?Q?bWyQ+4LZmAPvn8hhAY6PMEpFrPOZGy0NsM6/H4e13lDEd5RTK4tgCT/ZrlyT?=
 =?us-ascii?Q?lL9Ric10+fAb8CcAh5/ah8ftW3TCPA9br335rxQQnPTmk6NhWfxEzQ1Bzek4?=
 =?us-ascii?Q?jq1UFxo4r12afYvrWlwSQJMUi+GdKpwcwS4ejIgkVAkg9HJg/OOJI+xhzcS2?=
 =?us-ascii?Q?g7YF9xllBjlRvtUpDUZo40wUuzNtR4mRHYMlfLHkkzQ0TysTrdGpVJ8NCArb?=
 =?us-ascii?Q?ZNPjh+Yh7tOmxagpqjxJGFpgjuL5Huzi0zXEwJ2yHEsiehxPfCnCaEbf1K50?=
 =?us-ascii?Q?WiLkFP26OTliFlFaBs20wO1ZIdrDiifPbKX7xxa6QkpA0k0K8cmpFVfoMYdL?=
 =?us-ascii?Q?++74P6x7PRDsEbDsFNmtZV1b8GKNgk0Ou+8US1BYYpMHA2mAbn/bzn/Eb9ob?=
 =?us-ascii?Q?npPgvDExMv1syJuCCDe6ESg+ChVJp/4DFvzWdtUR8YI6tlBu8scx9loPy9EW?=
 =?us-ascii?Q?Bwn+/WPLPOcuy5Xem4zPB0D7JYeeeaxaGJjUGefraCGF9PcuD7YzC2KElew0?=
 =?us-ascii?Q?BY4kI/uFHy6XBCfapPx6SCAMoOiysnf3HGKkOCz5lozVUtNJlcJv2wFYqnEG?=
 =?us-ascii?Q?XuAzu/a0FYxIS54LEqVym+voxCqNymPEv140ZbN8JTR9ti7xItCb8A70AUTn?=
 =?us-ascii?Q?PDLEihqmvz6nfXmJX0n3lezyGQLbLtLVB6nfFTIUapho/UlwIYEc8HMjkjTf?=
 =?us-ascii?Q?vyr/nXOZBF1bpOX3kqC8JcCO3R5zLlcOADTsPqWKGTAGPUMg9wFkIr8fpTcX?=
 =?us-ascii?Q?zNWyoTcQp9ImQzY9DJJa1o+C+iQ4hsFKv8odq1JCRDMxhrPej0iqlIfki/YR?=
 =?us-ascii?Q?j5OpKGTvYt8VXDQzLRapkcTAcKpnPXbPZpwWXYVX4VVzYYkwnoaq8eto38SU?=
 =?us-ascii?Q?lrI7EAE4Q+LXohuPjMqfAnuzrQbq2DPQyEJyl57oZN8rkUfgzoS5O1kR0FR4?=
 =?us-ascii?Q?0FwqPoUmQ1ye+/d9b2+nPdguuIyLIz6ot6TazzkzWRfx8SqGDjieraveviYW?=
 =?us-ascii?Q?cVWtIh0axlIfbplaNEHXypeN7oc2JoyhXVRmYMWJ?=
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
	YrJFrvFXORsw3AXBJAuTkHouL6ZlE/P820IEjvHZ/q1DzpUvoByRDba/y7JmYj/gLlADV7aR8Yosyg1yeEGQ0NEE3tf7EO1+OArwmQi2EhwEgVvHPnL4XJqogs5npvYrwTPCa6DOOdL+Ca1r/m3lbo3aXBTpaWYingVtxwbWYvl6asEzr93mw7BNzxOneoqW001h+daCvEFd+NnzMbTVaYf0Luoe08V2Did7FPfrglTJTUQVn5/WlaqNPtaqdaqo0xetUyxNG42QI776f+WiaPtckvNp8y1uzr8yhgDxM6WAopDRUhfO8+ZYkKvseIrl164ZWVLCVHCckfVBrfeFIHovXaO51Vhs8bVSmzzVvGIuePMC0n9QwNaChDms6XEgJTWVPC8aZ+nNdeMaofxe9cC/WCo2iMeN7wvWsTq0tRljUvAVIS8UrhHLJhus4bJcOW+KD8ja7l71kOvnz+s4R4l0oTRw2NtO1lUpdLeLdQIA29penKbWiX2GVSEuCgx2Z9kG3QpEnwp30DHHSYtBtQMmIw0MIiC+43tw2nPG2U65i3Asartu0RgJv+vfy531lW7vimEdZrl7ZTtdQ3KAQIWS2JJFImIEt2a0yVsPUe7pYoj9CqAODWrkInUHxTiZ
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR02MB9502.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6744f1-1a84-40da-c9dd-08dc9207ce96
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 15:35:40.7977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MDUWXZ8MEW9ovs7m1COjhxLpgOAv522sB1YRyhHOHY4a3wfEttkpRBioVyqOkDt6IFWkHlzJ+47tdwGwEMtyNl4HAMC1Qu2gSOvG8KOMJDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7219
X-Proofpoint-GUID: Pbx68F8DHOr-1p2TlkHgx87BphE7aLkN
X-Proofpoint-ORIG-GUID: Pbx68F8DHOr-1p2TlkHgx87BphE7aLkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_07,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406210113

Hello Eric

On 06/20/2024, 9:48 PM PDT, Eric Biggers wrote:
> On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > >
> > > > > > Is it possible to use both kind of keys when working on standar=
d
> mode?
> > > > > > If not, it should be the user who selects what type of keys to =
be
> used.
> > > > > > Enforcing this via DT is not a way to go.
> > > > > >
> > > > >
> > > > > Unfortunately, that support is not there yet. When you say user,
> > > > > do you mean to have it as a filesystem mount option?
> > > >
> > > > During cryptsetup time. When running e.g. cryptsetup I, as a user,
> > > > would like to be able to use either a hardware-wrapped key or a
> standard key.
> > > >
> > >
> > > What we are looking for with these patches is for per-file/folder
> encryption using fscrypt policies.
> > > Cryptsetup to my understanding supports only full-disk , and does
> > > not support FBE (File-Based)
> >
> > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > fscrypt now. Some of my previous comments might not be fully
> > applicable.
> >
> > > Hence the idea here is that we mount an unencrypted device (with the
> > > inlinecrypt option that indicates inline encryption is supported) And
> specify policies (links to keys) for different folders.
> > >
> > > > > The way the UFS/EMMC crypto layer is designed currently is that,
> > > > > this information is needed when the modules are loaded.
> > > > >
> > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kern
> > > > > el.org /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > >
> > > > I see that the driver lists capabilities here. E.g. that it
> > > > supports HW-wrapped keys. But the line doesn't specify that standar=
d
> keys are not supported.
> > > >
> > >
> > > Those are capabilities that are read from the storage controller.
> > > However, wrapped keys Are not a standard in the ICE JEDEC
> > > specification, and in most cases, is a value add coming from the SoC.
> > >
> > > QCOM SOC and firmware currently does not support both kinds of keys i=
n
> the HWKM mode.
> > > That is something we are internally working on, but not available yet=
.
> >
> > I'd say this is a significant obstacle, at least from my point of
> > view. I understand that the default might be to use hw-wrapped keys,
> > but it should be possible for the user to select non-HW keys if the
> > ability to recover the data is considered to be important. Note, I'm
> > really pointing to the user here, not to the system integrator. So
> > using DT property or specifying kernel arguments to switch between
> > these modes is not really an option.
> >
> > But I'd really love to hear some feedback from linux-security and/or
> > linux-fscrypt here.
> >
> > In my humble opinion the user should be able to specify that the key
> > is wrapped using the hardware KMK. Then if the hardware has already
> > started using the other kind of keys, it should be able to respond
> > with -EINVAL / whatever else. Then the user can evict previously
> > programmed key and program a desired one.
> >
> > > > Also, I'd have expected that hw-wrapped keys are handled using
> > > > trusted keys mechanism (see security/keys/trusted-keys/). Could
> > > > you please point out why that's not the case?
> > > >
> > >
> > > I will evaluate this.
> > > But my initial response is that we currently cannot communicate to
> > > our TPM directly from HLOS, but goes through QTEE, and I don't think
> > > our qtee currently interfaces with the open source tee driver. The
> interface is through QCOM SCM driver.
> >
> > Note, this is just an API interface, see how it is implemented for the
> > CAAM hardware.
> >
>=20
> The problem is that this patchset was sent out without the patches that a=
dd
> the block and filesystem-level framework for hardware-wrapped inline
> encryption keys, which it depends on.  So it's lacking context.  The prop=
osed
> framework can be found at https://lore.kernel.org/linux-
> block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
>=20

I have only been adding the fscryp patch link as part of the cover letter -=
 as a dependency.
https://lore.kernel.org/all/20240617005825.1443206-1-quic_gaurkash@quicinc.=
com/
If you would like me to include it in the patch series itself, I can do tha=
t as well.

> As for why "trusted keys" aren't used, they just aren't helpful here.  "T=
rusted
> keys" are based around a model where the kernel can request that keys be
> sealed and unsealed using a trust source, and the kernel gets access to t=
he
> raw unsealed keys.  Hardware-wrapped inline encryption keys use a
> different model where the kernel never gets access to the raw keys.  They
> also have the concept of ephemeral wrapping which does not exist in
> "trusted keys".  And they need to be properly integrated with the inline
> encryption framework in the block layer.
>=20
> - Eric

Regards,
Gaurav

