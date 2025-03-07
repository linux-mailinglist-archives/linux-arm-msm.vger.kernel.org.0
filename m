Return-Path: <linux-arm-msm+bounces-50659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F0A575E1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289B9189A8A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 23:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02EB258CDF;
	Fri,  7 Mar 2025 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lgclJSLt";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OjHJENHo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gU5QJpat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61771F03D2;
	Fri,  7 Mar 2025 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741389399; cv=fail; b=kDFj/Srf77aFuPP9MuR/li0bB9d8wA1Lek78M2R620pv+o7t6zEWrRqgYaIPqEHbfzpx4eZ6dDY/XOmYNbrXt1+xsj6MhNcbzJw/zvwiMRmzaoiw/ZwhW4aA1qy8fA7C72w/bgCsTqomkmsNEl1wB+HJ2edcyBEQnqXDrsQyfvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741389399; c=relaxed/simple;
	bh=oZZLNm/EMeQjOz/oQGXUQ+PFRLGEOp+5FQSdYdIQzsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DGfweM0qpZ/UfJA0GrrUK5gxXtOT1uaENPvGbLmIpUeE6506OODOCr/+pRK4SQLNqKLoumPJpbxvlOpdqRtjuY9HO2D+m3s8f/dGYYZAd+LPePvSSXTzSH8E96nyflIIrKtNaDfx68g/gS/jqZNXAdjgZBo2yUUSGnZEAsjnspY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lgclJSLt; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OjHJENHo; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gU5QJpat reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527J7s37013758;
	Fri, 7 Mar 2025 15:16:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=oZZLNm/EMeQjOz/oQGXUQ+PFRLGEOp+5FQSdYdIQzsg=; b=
	lgclJSLtVvtLnt88II5Kq2d8/Vg7iLuWg2hxH7lXCnmFrz+rzVDioP0QRy9wjxHf
	sxDtXldisJAn2tTvMgxdTxe/a47yoDDJOuzSnyTWPydW4yb38Mtc2VfmDAMR3ah3
	+ff2h/W3aEpb5xQWpoLtokbfV/FlBrrd5LeCN+cZyN5II8PUe1J8D0jwodN+fvfb
	OCVxp3PN0NGwGfiYpO+Wg4rtk28dytY+0tN1u4vIxkE/pNa9fv0RZFhCkUhstE3Y
	ir9zQSbG0AeIsuY+KbAonUJRy4sp0p8Rj3x0F+o52lr2M33s0pyuPdHzz8W2Lqbj
	TcOnQ6dZTF3WJPeabu+TEA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 454220ng4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1741389372; bh=oZZLNm/EMeQjOz/oQGXUQ+PFRLGEOp+5FQSdYdIQzsg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OjHJENHoZOd9AOx806pQv0Fh4tOmbqA9rcAGzM0jgKpoWAamUfjUdBxEe5b95fjxE
	 +NUOcMgjNr6zJhS3x4lL3njQXbWdz5oOU1v5sGeKLmtFoiz4ZjyAr3mDazZRm/E74Z
	 ttdwsAaSUT0/eCENHlwA9po/HwwBwEYtinUQS1VhMU6MfxvE+he6U5VYPy2T0Ld/n7
	 XaO86lLwzofph4DuKKc4NZ7uEiV61KmVnuPpnSW2Q4fBPW2ww8MWFRrEv7G/aS+lLw
	 +4BpELyv7NHrUbwzjjhaxyexMAInHEYnsvQ8wYr6n/Oepk/YVcz+XSxEMxSbTqYhCJ
	 mY+kROkpgUkRA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 58E8A4034A;
	Fri,  7 Mar 2025 23:16:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 614BBA0100;
	Fri,  7 Mar 2025 23:16:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gU5QJpat;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6C44E401F7;
	Fri,  7 Mar 2025 23:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyzhzDZAjK0G1fi0VwwSD5Uysc3twq2dxLUSLzV2nLnh3mLxHMzYGCx8ga8wqeEdT2THptHUB5j9rgvs+byfAYKdh8LaWYMkg7s+AnUp+4OfipK8kiiwv4baUwBi6U24Mg/qnWQ4PRL70hPTFsVcQFefYAly0wNPFDbdBZOXPGcWL/WHDPYfecOvR+vTXtXWlBdENEnzcFtEBXsn9LGPCRpBslCKJLmv1xqaUPHgLbkhQ0py3Rk5vxAsKdVjRrY3nAkxbCjGBpfgb5dV4wss+2t3HEQWzR075W0CKk4ItztolqCwG0PGB6kv2KqY/9Md8+3OzODRjVqBVuvQOLb1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZZLNm/EMeQjOz/oQGXUQ+PFRLGEOp+5FQSdYdIQzsg=;
 b=sHXDOnOQfcY2WD32Gcd7MeCow/Qk+EV3r2euVx6l0/ccYFEjAaXAbADg8S/ClAHGYrlaOv76POnnwmF5d3RQbx47AMkhDn7VKVzvJFWsLZxo3zq9U6eoWADemeS074DNyvB+jCzpyKbD64//KL1wwMEels1p4QHEXfhMrYZmqTUwSJ9sXBIiQDhmfYKhOztBnb24VCk2fdVgWudgkQlcx67yWmItcWfPaHjUIgVhdO+MqDAO/63qIxuOHotZEbWvTmg/htT6KU6vNT4i6ot+SHj2zq7OKjSLK6O3AQJ1KVcTGwLvcUYrXDMuXQsLg0TqfssOsbl3RzDl/cSzdPcTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZZLNm/EMeQjOz/oQGXUQ+PFRLGEOp+5FQSdYdIQzsg=;
 b=gU5QJpatgRjRLylAWzx3SuAKZYWxmtdOKSRSkSksKnq+TdMAx07xUzK2NzIP/JP8RU4KqjuYlKVHwz5/RJt/vijWgnn714/eeLVq8yABJj+E0ayWeX3moag7H+PWuqXaNhhkw4u8PI78EoXpk27ZxmIZWaRbktyUQbt2Q6m6J98=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 23:16:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 23:16:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe
 Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana
 Kannan <saravanak@google.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad
 Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Topic: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Thread-Index:
 AQHbiKw5KJl/2rSglECIEFO5G8n187NiIOyAgAAJb4CAACsKAIABZTgAgAMIEgCAAZVhAIAABGMA
Date: Fri, 7 Mar 2025 23:16:07 +0000
Message-ID: <20250307231604.rxetcy7nx67vqmhq@synopsys.com>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
 <20250305003148.mahxupphkaiizpbh@synopsys.com>
 <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
 <20250307230022.w6fignlsmzcg6k4e@synopsys.com>
In-Reply-To: <20250307230022.w6fignlsmzcg6k4e@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV8PR12MB9690:EE_
x-ms-office365-filtering-correlation-id: 130d2136-9544-4bdf-0358-08dd5dce0a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWJQbHZQV3l5N0ZWUXk5dlJQYXZ5eVNuaVZ0ejZuTkJCbkJ4ZWFqWjN4aGw4?=
 =?utf-8?B?a09oTEFsY2NoS0N3UnBicHZsREhnenhsbHZxQ0ZzOE4wWlU2enFqbEVPL2Fh?=
 =?utf-8?B?R0JTTGFxb0JhQTBYdytDbkNVZVNQd1V0R3VzcVV2aGptZDdLTjR4TyszRVFB?=
 =?utf-8?B?VHR5Q3RWd0JWUmM0ajFWMkxTSHdiNUVBTktQQVY0dXVCLzY1dGNHYUwvR2ZF?=
 =?utf-8?B?RWNBUFY2TytJZW5CMExuaEI3OFU1WitJRk1zbXJxNkNib1F5ZTZNcWNWamli?=
 =?utf-8?B?V1NwYzFSVUExMTd6TkpMVEVqZjc0RUQrS2JZTTNMWkJ0d1F5ZUttUHdGMVZC?=
 =?utf-8?B?UjAzc2NYcXpSOVpJdElWUmxjRnViTW5ibFNxU29lSFlrRy8zR1JvcVdGS2RE?=
 =?utf-8?B?RVVXWEFySUYxdEdvcWp6T2RjUmtjMUJPaVY5L0Urb2piTnNxNzhBUzNIVUdu?=
 =?utf-8?B?NVRhYitHWDVjRGZkOWUyaVcrZCtSK0lRUk5MQmkvVUFYS3ozWWFDMExTQlly?=
 =?utf-8?B?Nk1JenA1ZHF6eWY4NW8rdmNtWGh3SnptdG44alQ3Vy9TN1liSjdRNmhMbEZJ?=
 =?utf-8?B?QmhFSDR4dEpZWWQ0SWlET2V1UlhQSUdOUWgxVU5mRDdESGgya0g1Wmc2SG12?=
 =?utf-8?B?Q1EzalllZkhSY0lXSEhLREQzczdPMFlPOXdIdzRicFVXQTJ1Q09vbWtJQkt6?=
 =?utf-8?B?bWNiSWlPQUJudkVWeXdiVEx4QkNoMlI3Ymw4QWp5VmdHNXYxU0g1dTRJbUpW?=
 =?utf-8?B?L1RYaUJBRDgvbjNLYVZlSE0reHRKVEcxWlFNUEdveUpvWkxxQ3RjZ1ljM3Nt?=
 =?utf-8?B?dVV0S1p0VmUxSEdhUUdsQ0xxTElXUjFBYUFieTNjV1AvNUI5QjNlc0xHOTA3?=
 =?utf-8?B?YWFteDRrZlMxS1JPdEUrUmVzRlRxK0h2clRCVzBlSVUzQjJyb2VxdjdWTisx?=
 =?utf-8?B?d1ZTcUdPeDM0amFUV2YwM0tIa2RJWmtYR3N3RlV2Z252d1BRTTVwc3NtdTh4?=
 =?utf-8?B?Zis3VmJ1dDZmMjdrdlUwVmdDTklGQjhHYU1XN1NpWE1zNGE5NDFiV05wcEpU?=
 =?utf-8?B?cFNpQlBYdVZkRkRjRFYrdnlSQmZ3NDVkZytBclpxZlEyWjhpbzFoMDlndFVR?=
 =?utf-8?B?bkkrV29kL3NJTnVHekVsWExjaVpSQ3MzcGV0Vzl3VnVRRFdod3RaS3BYd0p2?=
 =?utf-8?B?cWMveVBWUXBWZEQ4Y1cvbVd5ZDZnRkVVcVhwYUhXbDBlTFRUOGxxY1RaN3ZR?=
 =?utf-8?B?NXdCUDZzMlRkdysyWUZSa1A3Y2lra3ppSHZxMzJGSWYwSjczb2xLR1d4NS9U?=
 =?utf-8?B?dlJjQndKUEdwblMzUUNmZEJMR3lLRHVmeitvQmdpWkE0bllHb2UxWVVWNGNF?=
 =?utf-8?B?aWkzYjJGL2hBREFmOXNUOTN0RFM0WVJQamxtSDNtcFZRVDI3SnE0d0R2Ymw2?=
 =?utf-8?B?eFY3Vk5yMkg1eGhBVjF3N1FkYVltNUR0VllUVEU5L2FVajJqc2llU2NkSTVl?=
 =?utf-8?B?amZhaDVCVmVtQnZtaGpFbmFER1JadkhxaXVsemJnRGQ5ZFB2K0NvZEIyZis4?=
 =?utf-8?B?QjFLWEt2bXBxY2dzYUZCY2RqdVViM3lZS2hKUzBKR2o0UEUxa0ZKVlBRdTlh?=
 =?utf-8?B?cmVQMUlrNUZEeWZIWnF6VE1ibXl4RW5JUkppZUVDamEwY0s5Rjkzd1pQcGF3?=
 =?utf-8?B?OVVMTzVFOFlMUEZIRVMwS0xiTUJqL0xseWZxVmNMOWw3U2svS21iM3d0K0NK?=
 =?utf-8?B?QzNPbi9zZXg0SThOUWVmamFSbFYzQ1JiNWFKSDNxNDRPUkhiOGJ1dXlONG1M?=
 =?utf-8?B?YmdHY3g1bmxKMy9TVW1ESmtKaVNlMitxQXFCZGVkM1B6Uy9KVUV5amlEVlZq?=
 =?utf-8?B?WTNyWFkwREVWekRRSUZlRWVmN2Q0Szlkc25yV2dvVWlyQWxKVUdmdDVBVW9O?=
 =?utf-8?Q?DmYxODxlZvSqxP2sZqa04iBUUtNFyCTT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkpVR0dleFYzTm01Njc4ZnpIUTdDaVU3TGF6RnJPdi84S3RMRFdZYzlzQkt0?=
 =?utf-8?B?ZURYamdZb0tnWnU1STQrcW1zNncyRkFhaFYwYURNWm9yTnkyaGFvKzNQUE1k?=
 =?utf-8?B?MFdQSHcxbFJTTTNlaHBXRmYvVERFSXpJSHljWitZMW1xcExpRzg4YlNQT3J4?=
 =?utf-8?B?ZzZLTm9ZTnp0c1RraW5wVmgrZlAvT2lqTit3SHZQU214NGlZazUyS1hEVTVL?=
 =?utf-8?B?aXNBT1JmTTNNUGhTWEpzdVBNeEJ2b0taQ0NHQ0dhNVJoL3FSL2RyWVlKay9m?=
 =?utf-8?B?dndZN01jcnhHWW8yRW5NRk5FcC9JZVFZQ1gvVFZsaGloQXNMV0FRbytEc0R2?=
 =?utf-8?B?WWJEWG1hTFBuMXd3a1ZlQnBlRHN4STdZOERvQWRjMGlDMFNaVy9aelJMLzh0?=
 =?utf-8?B?UnRKT0kzcyt6dlluK1NOOFpDbEJMeVh1NFQzZThVdGkyaFRTU3YvTmlYQ2NW?=
 =?utf-8?B?dG81ZDR6RVdoL0o0RVFIREhTREJwMHQraWFYb2hXNktqbUt3L2E1OGNLT2RU?=
 =?utf-8?B?NHdCRGlieXdlZXJXcXhrenZTQ3lkZTN0SzNGNkJGYnliWVBzbFRxd3dnR0VN?=
 =?utf-8?B?a2tjdTVkek56WnFhWlRTSGVaWlN1SCtoWUhrUHNBV1U4ZnQyYW5ZcjdQNWxo?=
 =?utf-8?B?RzZXSGhBZXdiUUR5dUpkaTU3eC9xamRGa25zeXZFMVNHWStjRGlLdDJ5aWxP?=
 =?utf-8?B?S0FpbG5EeEhJRm91aVltTjRuWTNKSVlNNUlCL2JCRWduamd3K2FtRWo2cUx2?=
 =?utf-8?B?N2VXdmxkZVNSL1dLZ01vdGk2a0VCTEJQekdzK1BMT29nSEJHUWxTNGZQcUxn?=
 =?utf-8?B?d3hQdUVRalpIMnBkOCtLQ3Z6bTVCOFJTSVpOUGo1MUhrbEZFSFAvd2Y0aVpq?=
 =?utf-8?B?WmFTVmdkbmZSa1k3aTlKYzMxbThEZTdITmJFTkU0NWZUWEhDZWtpNE9zQ0JJ?=
 =?utf-8?B?dWZUTWREQ09rd3pINUZBZVVmenQvZ0J1cDJPMlh5UTVFYS9PSU9EWFdZaExn?=
 =?utf-8?B?VXFzdEpvQXlCMVlJV3U0WjVITkZlL0FhR2Zic3JIL3JmVjJsekJlQ1ExQ0pw?=
 =?utf-8?B?ZWwyRlVOMmtibmVRZ1k3NFRsY2pabFNldXlkRXYvUmZTK0M1V2hMQzhpalZm?=
 =?utf-8?B?aXhFK1ZLWk5ETmtiVTdkNW15dndRcEVWbitjMG9pV25LWjhQSTRwenUrdFU3?=
 =?utf-8?B?OGV3aHVhWEs3WEY5YkMwNDdoQW9Ra3VnMU1mbkVlSWpaYk93RktJMWFpSmtS?=
 =?utf-8?B?cHdBMVM4cEF0YUYvNENDYUN5Q1Jydkc3ZVV6a3VLTVY5enJGdExXVnAyK0JM?=
 =?utf-8?B?ZzFVZ2lyK3VZRkpYSWlORjJOTEkzZVNaM3orYTMyb2g0RFVGaUlxSi8yRTJT?=
 =?utf-8?B?b240R0V5RGVsQUZCTWRyWmw4TWgwTDY1ekNVYmxpSkxJSGdiTmJIN1ZSTlhY?=
 =?utf-8?B?Skh6ZlduZDFuT2xXRlNlVU1DNVpYYnkwNnpzeUNpSUJrY04ycXlXeDh1UWVa?=
 =?utf-8?B?ZWNjdEZmbEc4SGttMHZHL1JuTk92R1BnczNwNUF2YWRHRVJFcW5xcXRvZ0ly?=
 =?utf-8?B?ait0b1cxKzJKM056Y2NSMGlqYjc1VWlVdVA3VmZ6Y2VQWmRsNnRBQml3bXEy?=
 =?utf-8?B?Q1N5UkhJWTFNWGZWYkhUTklEVWw4cGFYcUJvam91RzBGYzFHa0RmM1hJVGM2?=
 =?utf-8?B?Zlh2T2lRck5Wcm5ENFhJN0k1WTVGOWFNZUVISG91UDYyVG9VazZ6YVFrcE83?=
 =?utf-8?B?NTdjWnZJeFBTYnluaXVRbXF1cVY3Q1JXTzJMVG40dGJYZnRyOHZGNjFTazUv?=
 =?utf-8?B?TEVLVE9TUHp5K0d6dFRJR055Q2RIVytQYzZYRCs1M0RKSFZRdTZsQXh3ODYr?=
 =?utf-8?B?TEU3L3paSWJDc0FQZ3RiMitOc3hZK240K0VtbUdaeVB5YVNRcUFJSzJLZy9E?=
 =?utf-8?B?c25xRCtXZklLTVNkeWVpVUhaWlVCMU9LM0dsRmc5Y2tmVGdpWkpUR2Nrc0VE?=
 =?utf-8?B?a2dpajVmYkxUVTUxWWNsOVNMc3VFWXM1WExhSHljOTZFL0MrSnhwV0hCR1lv?=
 =?utf-8?B?REJqd0VvMlJJYTJYd0ZGSWl6V0tCOEVGWTZuVnRjUW4wYmptNy9WVmZVRnFv?=
 =?utf-8?Q?096AyBLMVAAfq13jXgItiR5no?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A860D714BD0F094C88313757A9B56FF4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IWJI0nMflR3ntnZX3nTaEz7dNDPgJHG7m+guJe/34QD2HZ9VV2jvtc1N+98HX3roafyEe0Cxq42CGk9HO6fhd4dLoGQaQ2OcaCDSUtMAmUbcVovkBKgolLQ7SH+KrtpY8BbahZHeJ7E2bWn/DxxcQws7lBBbeO/bpWuhvX2SCHdQKzpr4/d2VmnVIoGTDTPAFONcLG7RgBuGsans8QAqMt0epO9J6qTUFEHrmueDY8JJ7ieCNMWhp/GBHIXs8J9iaR/cgmK6gNITCi9MoafpNg08pZS+COX4JGi7mRH2JlajvZlcF1m3OfoGLOMvZrzhx6aemnVFp5ME+micdL5wWpAP9JLovyAifqwmmtg3qkqcisxeDQL57706/IxkZaURjKlJrPpiBZk74eQ+pELkvsTdTSA+37hqeTbNlS8srKu9m2nlZnLL6IrjniCQlO+5kZTIeiE6nMtNd3Hy29UFCGD5YBjjnkqLfPapM2yo0pCRKmeEEY2mExH4IY26W92VGR/A4k8t8fvM3ywF+7Dr0gsjR+s0BXzMuIv1vrNHypNB/Zqmz3fgox6KN/pI57o5can7Bt5sBDaaMbKSPNn/C4NbUDNxHC37qQK0QmyICT0urc5/lAVNnbsMhCUqHc1ba08+ocsN4khuOFpBulJ9zg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130d2136-9544-4bdf-0358-08dd5dce0a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:16:07.7618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jvc6aosOaxqAdZ9rr6spnaIgXvR90BfLKMNgFS3KQnSzLVlVjd70mU1wknpOUydUldoHu43EWHVqhRYppuZiQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690
X-Authority-Analysis: v=2.4 cv=DbvtqutW c=1 sm=1 tr=0 ts=67cb7e3d cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qPHU084jO2kA:10 a=n1lpdFyZgE4yOmNOnKkA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-GUID: N9cFNo0MKG5ppqJRHcFFqRUhM9yimyi7
X-Proofpoint-ORIG-GUID: N9cFNo0MKG5ppqJRHcFFqRUhM9yimyi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=938 spamscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070173

DQpPbiBGcmksIE1hciAwNywgMjAyNSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNiwgMjAyNSwgQmpvcm4gQW5kZXJzc29uIHdyb3RlOg0KPiA+IA0KPiA+IFRoYXQgc2FpZCwg
dGhlICIyIExUUyIgaXMgY29tcGxldGVseSBhcmJpdHJhcnkuIElmIHlvdSBwcmVmZXIgdG8gbGlt
aXQNCj4gPiB0aGF0LCB3ZSBjYW4gY2VydGFpbmx5IGhhdmUgdGhhdCBkaXNjdXNzaW9uISBFLmcu
IEkgd291bGRuJ3QgYXJndWUNCj4gPiBhZ2FpbnN0IHNldHRpbmcgdGhlIGZsYWctZGF0ZSBieSB0
aGUgZW5kIG9mIHRoaXMgeWVhci4NCj4gPiANCj4gDQo+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJv
dXQgdGhlIHRpbWVsaW5lIHNvIHN1Z2dlc3QgYSBkaWZmZXJlbnQgbnVtYmVyLg0KPiANCg0KU29y
cnkgZml4IHR5cG86DQpJIGRvbid0IGtub3cgZW5vdWdoIGFib3V0IHRoZSB0aW1lbGluZSB0byog
c3VnZ2VzdCBhIGRpZmZlcmVudCBudW1iZXIuDQoNClRoaW5o

