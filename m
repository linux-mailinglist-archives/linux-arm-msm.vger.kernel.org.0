Return-Path: <linux-arm-msm+bounces-110030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGOVCNiRF2oUJggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:52:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA695EB6DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45443115A65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 00:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F58D1E520A;
	Thu, 28 May 2026 00:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ghZfvoFg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j2evFe2O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="d0vei1oU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2636719D8AC;
	Thu, 28 May 2026 00:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929224; cv=fail; b=PF5ZrlY+QkUEdlv2rnR8WOAxb0eeyobrr1J2g48qVPT7nVFFebA/eimnn5wJNJDh4eZ3JKcH+zbKVryDbWrctkSrG/EZOPZCKaPoEMd7uN1O9rXE9IvsWrb7v14idPhLj8EsKRodyL2sgYtP3MD+qM3eO/+/MFyzkVbotqeRYRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929224; c=relaxed/simple;
	bh=rueLe+Duls20rFovlI64EnKW0saPJQiwBzI9EvFHQ0w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rLgKPANBo3K76wzts/OnYCI9evfMCRhwoTSkAesoDjFIXmpq3fqhuI2DC97bCQqlvcwQG2yT3Hf3fXgB5Sujkqfick5MMVf4psNcdiq+vsa4B2fMLSvqBkRacID/qH9EPAdIo3d929/DAmLObK9AodmjN2jEyjHocRULPB21RbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ghZfvoFg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j2evFe2O; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=d0vei1oU reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RMlQ3K2453500;
	Wed, 27 May 2026 17:46:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rueLe+Duls20rFovlI64EnKW0saPJQiwBzI9EvFHQ0w=; b=
	ghZfvoFg/6kN5gdB1jTDq9Pv4q4V67O/QAXMWDIGb+0N0HyXg9xg78lQlicHa/+H
	Avg9uU1FSin7uzR2yLHunjXhgKKn18Z8C0b8NVakrB3pHICmlleLEePiMSGuw8Qo
	obyqzOq3lfEXOIGRfY+gJuvIj2fB5/JZQLU0FxK9ISGRmDzpqU+2Em/sijjG1HTB
	RAdCidfYds7AQPtshP91IhcQCJVGBNXPR7Iv872AFk1jqN+aVs4J4QdkKAPFkHPG
	OWxkxt+gVAS5dRTBYBkHeBlMGXz3p6eEcu1BsK//9OjPQDs5lkkKiJDsqOZ5/nnL
	k9LIYsgRjI90qvOLbgI1rw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ee7xqgytu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 17:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779929217; bh=rueLe+Duls20rFovlI64EnKW0saPJQiwBzI9EvFHQ0w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j2evFe2OZyeYZN9tfwir+gU0IfOgUue7UQNTWWfeW1iSo4wSriRxOEJdmecZICldR
	 vDaiDZZSnQeLvU3SvQZp14VKs223DtOq/cooDv6cJk8EUwvSWAS/rZrNh1pp3qJkOi
	 +q4HkjcWEU3LXvJHn6JKuYacfgd6bt9lFwY5doG2CwaE2LD0HbDWf3Yt4ZEDYGeL5u
	 oL4cbOU9zxqnXUaWIEj6piMoZmcYoxyfxFzZKk8nRXKmFFg7K8/BMqdjcIKUDRqIN8
	 g3AGwRYfUeOWnSCKlpIyOTrOqeJR2dqF9hm7eDv0GP2LvzlNrbJ5Cefr6LAJr4dqCZ
	 dJBenPU780P5A==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9C39F4062F;
	Thu, 28 May 2026 00:46:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4ED64A005D;
	Thu, 28 May 2026 00:46:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=d0vei1oU;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E2B9D4035F;
	Thu, 28 May 2026 00:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpDyzygnpcH6yMjCXun/Xv2/gFNpS8AKoT+FjXjqMREvsMdWwQ3WAWiiLUkgzoePN6PBhgI3lQThH0tlSgTi4FzmdQqTqLsA8MoaDMvm1HwQTsyGdD1YNRMxWw96AgSp/bWJ0L7RtHvy5QmFMAn74m4nYeGXsn8Czj5JluBgTEUl8W0rTvegG+r8o7Y/cyHVqQni3iTpZvEi6yJhdR7Nrovm/NxEwHm0IAZif6s+RL/35FX/CxwzjEuyIWwbwcFs3NuflE5f5TULowbBm7dtDWrZUwBewZhORijsFXwsDhlpLa4SC+t2KBTIREDJIvTe72Z/tkbewDN6e1eFek/M1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rueLe+Duls20rFovlI64EnKW0saPJQiwBzI9EvFHQ0w=;
 b=vsbV1c3CebmCeCcgMA8d13/yNBWdLnJmtHXoAaZabrGJX8a5a7MIHTotShOYFJ7u631dq1Tdzukqn5MhGdCx56NJ0VpawD0yyAOwG5qqwLemjMJPmAqJ9x6mQb1wr8+kzzepld7XOX+MS0fGrqxhI3GdiSwLt7fMDEzHC42QqYkuY8ESNt8VdLkl9T1SuXXjkNNq42MzQccUCO9vd5L3ooLDaPFbd6YZahKAsPTFmK07dVS4Qup8/HSHNNX1jXDlhDguKzJLC1dIo4zUn+x+tGHLtUrMi1p97nTxnecXHHJmBVwJoIUV8zUOo6Tu4Kk9Qju/zDdvTunsSiOtMj5bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rueLe+Duls20rFovlI64EnKW0saPJQiwBzI9EvFHQ0w=;
 b=d0vei1oUZ4ovRDhJ24u+DvCaoF/MqfizUHxnTirFq+sYrRDW8xHzP52VUUIwKtffN6uRxBUX+lD/575JO1QZEhRrdwXfxlMAVXEm95A7pNRjJI9bIuO60LAG8gLJ52QmneLNThrSDNyjl1ThdiDNZ2Z5X4kxrQFVQ8J3peTCD7E=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by LV9PR12MB9832.namprd12.prod.outlook.com
 (2603:10b6:408:2f3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 00:46:53 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Thu, 28 May 2026
 00:46:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Topic: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Thread-Index: AQHc4SrI3SfVExEMhk+zm6OnMWCdurYMcYEAgAvaCQCACldXAIAAEbwA
Date: Thu, 28 May 2026 00:46:53 +0000
Message-ID: <aheMJFKI_kBTH3jH@vbox>
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
 <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
 <ahd_VjrHp-u6thMT@vbox>
In-Reply-To: <ahd_VjrHp-u6thMT@vbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|LV9PR12MB9832:EE_
x-ms-office365-filtering-correlation-id: 420ea0ff-8ee5-42e4-e032-08debc529cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 7sM6//btqFSyCcJ9myEkNPblatc5KM5Qt0mtj06iD97tRqlGOFdftFvwhf9IB7xDpIniXmXSRtTmhaHCBeR34NJWBV/91Gua+otEwGIausJ2Ryk1VJdV0LXwUpfArOv9mqIkodrh/PDVQMVYm+wyrpPjywBHP8+fG69tfbkleuachnKyoc2KukfV85ibfKwZZdgOAwyiIbTOmxfS1eXR7QEYbq6XKGAYGSMv3VJzH33VBhsb2Dz6NQpJZ/pVV2xTEM/CiCq7tSurdoRb7xUGlaS7ddlxixcceCg1axWbnQX6Zg9XuCpYcqBWzvnL8zBvNhMqJd93UG+W70ZVP5/fGLkceT3izBWFHxzos5AskLAg1i863c0vWQv10vm/0VBDJ+V8d1NGHzPGuwJNSXMXEapD2/mBW9+1joBuSs+nZvzMWFLyTB5oNmoyd7I69m5urJsBPp6vVQannSFxmwODoOW5edyAr6lh9cLu/PIKUI57/Oh1mmtno8Nw0PN4AD6qhcPoM6l+zptYvO5BkNynH/r1UOrKBjnttKVlxkqWXYlXJABdP7fdyQwMgnx83GhLpZBKLtBBtVIcZCVptzObTDVpdGnpKb/tM/bJHS5/MhLUFfJLGwTN3nRGmbq7wMp4Etoi5ZYzHciYc6UGfOp/jOBrdhve3mXmS27kDGhzdsvbE/P8SAmdyM1O5/FDnl22O2nYmutR1BOHgztymlScjvNyhJaZBcB9DViCmDK5lAgaiBuK8zNTRnD1MAcwY3BE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTFab0JtclV2MlZUQlF0MERUV091REt0QUVsektWazhVaFZ1MWNaSXRRTi9k?=
 =?utf-8?B?WTBwcGRnVXVJVnlQRmR3VFVEVHVJdExXbzhJa2JxODJEYnNnVEprcDY2QVpo?=
 =?utf-8?B?eCtvK2VzSnVVeVpIU3hFclhNZDUyZVF4RnhxNThFTmFhUUx5OXhxa3k5clND?=
 =?utf-8?B?aGtVTCtYNFcyRG9ldFNKNHFTZVNmcmFjM0w4OHpEME9leHZpZHBJR3FYamlm?=
 =?utf-8?B?MFBQay9QNFEyMGZQQVl1em14aWVtdFJKVzh1WEtoN2NOd2RUWjFhNzJ6Zlg4?=
 =?utf-8?B?VkQ4bE11QUhhNTNreUQrckNtVjBPdUs0MGd1TWpacXE0bEVDc3FaUmlVcUpa?=
 =?utf-8?B?QmZKZHdpWE9LK1U0QXlSK0N3Z2hRMTZ6Nk5WNlB3aGhmZnNjMnVDUHBxRjFp?=
 =?utf-8?B?N1JzTzdKOHRjbkFhRlh6ZGlsMlVqNkNQZXYrd3ZoNEVBM2xMdDZob2ZRSHRa?=
 =?utf-8?B?d014UnFqT3JRR05Ea05Fa0dmUVdrL3VhRGVoSm56RVFyWXJhZWZJb25FQysz?=
 =?utf-8?B?ZENqcVVyTFNWbkdIblBxamI2dThsRHhrS1FEUWhEY1hDZzlkaEx6NlJBYjdv?=
 =?utf-8?B?K1pyTlA3aHdIZTZ6MEN2MnNiWGk4ekRKSkVJUDJiMGxZQitVdFJHTmNmZFdx?=
 =?utf-8?B?TzlhU3F5Z00rQVRjVExoKzU4K2RpOUIrdVdnVmxkZldmZU9KYjArY1YzQjdX?=
 =?utf-8?B?ZU1xdm56SU5nZy92aHJib2xhMm5PWUkycjdKd2xNNFZnbzdtVzFGUEZJaUFi?=
 =?utf-8?B?QytmVVBST0JYUzMvd1dBLzNXWXBGTnFJRit2NlFxQkt6a2w4OEMvalBHYm1N?=
 =?utf-8?B?UTBMMko5cG9pbExScDVZeU50NVM3YTh5NmpCc080UHJOelhMMkQ3eW1xdVNx?=
 =?utf-8?B?bFZBamdHMC9nVjhXaWJoRDlyS2RMbjZJa1lJMTV2YVZLYXdJeWlKTW5VNFow?=
 =?utf-8?B?OEg2RXJEUjBGTU05UXk4MkRxK0p3NUZRZncxSzhYMXVlSTVFbzhsOFpPeEg5?=
 =?utf-8?B?NFRKUzhCMUhXNm1wcm9sU2c1UkZaVWdSLzMwK2RaMjl3RjcvWG1GaUt5K0RQ?=
 =?utf-8?B?K0x1Zzc0ODZXSXdnRnI1SGhGUXEwRHI3UFhEN1h1d0xXY0t6NWhId3hzQTNV?=
 =?utf-8?B?djByNVAwQ09KMHplMU9YNXZaOSt0MSt0b2xINlVhZG9rN1RQcExSejVYdHdF?=
 =?utf-8?B?cmY1T09FRU1JRE5ERmRSRDRHN2xXbEhzR1djNWxiOEFKaHZrakJYS2dkTVlU?=
 =?utf-8?B?OTYrOWV3K09SSFZUcnUvWktHWHJ3bHlIK2JodVJaOHlQWUd1MG5JRmZYa1U5?=
 =?utf-8?B?RWNsMW1uQUZDdXpmQk04eWlNdEdVV1BlMkJqSmpVaUxVeEoveXdOUmlsY1o1?=
 =?utf-8?B?WWVFd3VQaDBxYXpWY1RPUnFOQnZEM09Oc1AySWE2ZWdLOUdtVGkrekJqSmF6?=
 =?utf-8?B?d1RUWjFqbXF0VHNkUm9XbFA1VzVEUGhkNVc0SU5rc1JpcmtEdnUwdUo1bTd6?=
 =?utf-8?B?TFVsZkFtMjN1SlM1TG9ESFRDc0dxRG5UMkUxVWFlSStSTnpoWG4yeVJZdkpk?=
 =?utf-8?B?VmY4cGRyRU1vUmFod2VsMDh3UUhXei9makdsNWZ3OVY5b2Z3KzhNRktHeEhQ?=
 =?utf-8?B?TS9rUzIvNzEyT3FDeGdYSXoyQjFRYU45c3RQMzRuVy9FYzRyMTlReHhTMGRa?=
 =?utf-8?B?NS9xaHRiZW1vU2IrTlEvY0FvdEVTQW9YZzgzZnZtSmhzZEIyMG1hL1V1cXNm?=
 =?utf-8?B?cTM4RVFxYU1qL3hjaUdmdEpJdWxDSlJGUmdvUUNTNkdLTjNXZlU0WlhxVmR1?=
 =?utf-8?B?Q3pIQVB2d3lnUlJ6Mmh1Qkt4T2ZqeC9lR2poM1FnczRTUTdsZGdURy9rdXJz?=
 =?utf-8?B?c04vaURiTUxGRkFEODhkYTZGWTJTMjRwdEFwVnJVTUl4eEsrZzcrbWU3Y0wr?=
 =?utf-8?B?VmJxcGV0ejIrZ0oxZGZsdnBXZUlkK1d1R0dWYU0zZkpvVG4xN00yY3A1Qlhw?=
 =?utf-8?B?dnl2am9kVkF4aHB3bW90bjNLOWdZUlBpYit1L25UR0tKNlowYm10MDlLemR5?=
 =?utf-8?B?Y2pVMHczak00YllGMFRPdGZ0Ry9LKzAwaS83TStVN2RoazA0Q1hEekduVHI2?=
 =?utf-8?B?OE5tWWkvZFZxOFZ3VmJQbHVQQjY0NTVTTHBjT3FQL3hVSkFKMFZGN0Yvd0Nz?=
 =?utf-8?B?SC9rMUhlNWhsMnlMQk13RU5ldlIyQ2g5R3p2RVZuYytiM1VwMTdYL2VNS3Fz?=
 =?utf-8?B?bEtvVldGY3hhRmRpZEdDQWR2TjRnN0RLUGtMdXp1LzVMd0hteTdkbE9MQ01P?=
 =?utf-8?B?d1czRHRybTVhVTVoWE1EdzBJc3c1bnBEYlJ5eklid2pGL3FxWmNrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CD946E684DF8645B16AD2D194624C35@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TfinR4j6somZ7Jo5MNug5qOYtGaTIHippzLANM3zk5LInFpkY7E17BKtk9wiwdUV2FXjj7PmPpFfbkuUiYuiI8uQffiNzv3K4bYcUVll7nwcW4U1BaS1mrDT5MX7zQRnmqE3HaSBQo1skv51DeX6/yhYNF7WXpp7ZOdOhMnuaz4GAy4JL6q2W82DUCdV7Da+WuiapW27R/VP2FKvV2PH9ExEw+fqYPkV+QMWcYK1Bvj1UIiW8elbQoECQgBvLRlIrSSZuG3lYmagXkkjBKAd5m4D7qV21RHb/EO4tdor8ftgDWStmpVUB3yXThOvnJtjuA5BCfPUja+bngy/t3RCqg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9BgyMBxSDF4odBUWAObsdLbXgnMjgA/PgoQsBaRYp3IihKkIdUvI7DRLTuVR9SsLcUKxqAtkmkhtdDs3C2ukcUNb6w9/mMHe+0FtMjeiKJUABz48gOnoz/QnKUwkmkrTN9vMMiahscW2z4/uUZTt+TqRzeN3QPuNsJTTzTkkfYjrgS61vpRyVOM/mOrxEnIf+2unrZIXB0+2+MeKMJN0VfL/f3Mgf3rUHcBuQmSu7nMSHeYGBajZMLknogwhIld+jn0RKdJmht1Nj/vKgB1jLQNo9pRDXvXT/aogNF32DYUlA5oJ4iTZPTmOfQA3cFplKiajozNs4hNw477w3e09v/lWBRo2M8t8T8MSd03CtOt9BQbooRMPXfO61TcGrqk/luHcI1g0j+oZU+7xJIEYyaYxt7wdFPNJJccGSgr4uc76UxU8JCSAAzwI+Nn+Dwjc8jiUU/PLGvv4DIdrgyGCBQBK4QhFNORMwZOPB/Ez34XzPHDpCkpdbBaKMs1fLksrxYXshNaLpaAnwE0xObNh9v1NIXjrxsu4gmswElY+7TCpaZAs9d8R4Qx/eHHDkuupMg8EDMkP/OxAptohZjmHi0bQs5BLixmYmc5ptNZnqZxQDP1klOuUaponTVafanTtxv8Rl6fD48gRuNqM/j7WdQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420ea0ff-8ee5-42e4-e032-08debc529cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 00:46:53.7273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaKc8iGn7w9WoXFrkc0YSPBAJBO15Hrq4+3XtqqRDTRvbQT4vTqG3jFEVQQQ/19TXLwdIMXZKktrR5fNCzJ+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
X-Authority-Analysis: v=2.4 cv=KaHidwYD c=1 sm=1 tr=0 ts=6a179082 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=3JJ9vUmbjyo0TxquzO4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAwNCBTYWx0ZWRfX3D+WxveLj+pv
 WyoM4SmESahlAWt28YvVmIN9NoCxzy7vJzSQVbDTz0F7HHAHSeIi+k9EkNbM/UX8aXUgIPMeCNP
 1gxMyyyc7USfexyc0RMj0uq6qTR/R3YZGqUarUHYcs2NVM0ypNP8IpyhErukNOWEdo1aYvMla9Z
 2GED+rxoeUR9ACxsSyMK5sNvpehfF48EBR5//JINarxesUiOTvpiiRG2mUw+MXyeqIIxVtSi2rE
 byHcaNJ5nRToF2Sea8UvXner+FECWfp+O4b66/MxFUh8fghXnc8VoVqXnylbq+d+DIhG7XNJIVF
 6rq5NWVKxcb/b37joi3/GDvsyyUqnLuP5L0YYfRQmOFx5kjqBNiya0FoB4r64AqhcchHOA44ro3
 A4lvEIU4WIBklXrCymk02lNPdO6RDFLm0AUtcdeT/3JsnQ41PKTF8emb0SI7qriN8XtLLi2Xgu/
 u/rkyfeP61wHhEL8fHg==
X-Proofpoint-GUID: p6goMyHg4tMHN_l2ufpnZkICSysD1T4R
X-Proofpoint-ORIG-GUID: p6goMyHg4tMHN_l2ufpnZkICSysD1T4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605280004
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110030-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,synopsys.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7FA695EB6DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXkgMjcsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVGh1LCBNYXkg
MjEsIDIwMjYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6DQo+ID4gT24gNS8xMy8yNiAxMDo0OCBQTSwg
RG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTWF5IDExLCAyMDI2IGF0IDAz
OjE0OjIyUE0gKzA1MzAsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+ID4gPj4gZVVTQjIgdGFy
Z2V0cyBoYW5kbGUgd2FrZXVwIGludGVycnVwdHMgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIGRl
dmljZQ0KPiA+ID4+IHNwZWVkIHdoZW4gb3BlcmF0aW5nIGluIGhvc3QgbW9kZS4NCj4gPiA+Pg0K
PiA+ID4+IEFjY29yZGluZyB0byB0aGUgZVVTQjIgc3BlY2lmaWNhdGlvbiwgcmVtb3RlIHdha2V1
cCBzaWduYWxpbmcgaW4gaG9zdA0KPiA+ID4+IG1vZGUgaXMgZGV0ZWN0ZWQgdmlhIGRpZmZlcmVu
dCBkYXRhLWxpbmUgYXNzZXJ0aW9ucyBiYXNlZCBvbiB0aGUNCj4gPiA+PiBjb25uZWN0ZWQgZGV2
aWNlIHNwZWVkLg0KPiA+ID4+DQo+ID4gPj4gV2hlbiBhIGxvdy1zcGVlZCBkZXZpY2UgaXMgY29u
bmVjdGVkLCB0aGUgaG9zdCByZXBlYXRlciBkcml2ZXMgZUQrIHRvDQo+ID4gPj4gbG9naWMgJzEn
IHVwb24gZGV0ZWN0aW5nIGEgSy1zdGF0ZSBvbiB0aGUgVVNCIGxpbmVzIGR1cmluZyByZW1vdGUg
d2FrZXVwDQo+ID4gPj4gKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rpb24gNS41LjE0KS4NCj4g
PiA+Pg0KPiA+ID4+IFdoZW4gYSBmdWxsLXNwZWVkIG9yIGhpZ2gtc3BlZWQgZGV2aWNlIGlzIGNv
bm5lY3RlZCwgdGhlIGhvc3QgcmVwZWF0ZXINCj4gPiA+PiBkcml2ZXMgZUQtIHRvIGxvZ2ljICcx
JyB1cG9uIGRldGVjdGluZyBhIEstc3RhdGUgb24gdGhlIFVTQiBsaW5lIGR1cmluZw0KPiA+ID4+
IHJlbW90ZSB3YWtldXAgKGVVU0IyIHNwZWNpZmljYXRpb24sIFNlY3Rpb25zIDUuNS4xNSBhbmQg
NS41LjE4KS4NCj4gPiA+Pg0KPiA+ID4+IFNpbmNlIHRoZSBlVVNCMiBQSFkncyAiRFAiIGFuZCAi
RE0iIGludGVycnVwdCBsaW5lcyBtb25pdG9yIHRoZSBlRCsgYW5kDQo+ID4gPj4gZUQtIGxpbmUg
c3RhdGVzLCBjb25maWd1cmUgdGhlIHdha2V1cCBpbnRlcnJ1cHRzIGFjY29yZGluZ2x5DQo+ID4g
Pj4NCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBLcmlzaG5hIEt1cmFwYXRpIDxrcmlzaG5hLmt1cmFw
YXRpQG9zcy5xdWFsY29tbS5jb20+DQo+ID4gPj4gLS0tDQo+ID4gDQo+ID4gWy4uLl0NCj4gPiAN
Cj4gPiA+PiArCXsNCj4gPiA+PiArCQkuY29tcGF0aWJsZSA9ICJxY29tLHgxZTgwMTAwLWR3YzMt
bXAiLA0KPiA+ID4+ICsJCS5kYXRhID0gJmR3YzNfcWNvbV9nbHltdXJfcGRhdGEsDQo+ID4gPiAN
Cj4gPiA+IFRoaXMgd291bGQgcmVzdWx0IGluIHRoZSBsaXN0IG9mIHRoZSBwbGF0Zm9ybXMga2Vl
cGluZyBvbiBncm93aW5nLg0KPiA+ID4gV291bGQgeW91IG1pbmQgaW5zdGVhZCBkZXRlY3Rpbmcg
ZVVTQjIgYnkgY2hlY2tpbmcgdGhhdCBIUyBQSFkgaGFzIGl0cw0KPiA+ID4gb3duIHBoeXMgcHJv
cGVydHk/DQo+ID4gDQo+ID4gSSB0aGluayB3ZSd2ZSBoYWQgYSB2ZXJ5IHNpbWlsYXIgaXNzdWUg
b24gc29tZSBvdGhlciBwYXRjaC4uIHdlIGNvdWxkDQo+ID4gdXNlIHBoeV9tb2RlLCBidXQgaXQn
ZCByZXF1aXJlIGZpcnN0IGZpeGluZyB0aGlzIG1lc3M6DQo+ID4gDQo+ID4gMjg6ICAgICBQSFlf
TU9ERV9VU0JfSE9TVCwNCj4gPiAyOTogICAgIFBIWV9NT0RFX1VTQl9IT1NUX0xTLA0KPiA+IDMw
OiAgICAgUEhZX01PREVfVVNCX0hPU1RfRlMsDQo+ID4gMzE6ICAgICBQSFlfTU9ERV9VU0JfSE9T
VF9IUywNCj4gPiAzMjogICAgIFBIWV9NT0RFX1VTQl9IT1NUX1NTLA0KPiA+IDMzOiAgICAgUEhZ
X01PREVfVVNCX0RFVklDRSwNCj4gPiAzNDogICAgIFBIWV9NT0RFX1VTQl9ERVZJQ0VfTFMsDQo+
ID4gMzU6ICAgICBQSFlfTU9ERV9VU0JfREVWSUNFX0ZTLA0KPiA+IDM2OiAgICAgUEhZX01PREVf
VVNCX0RFVklDRV9IUywNCj4gPiAzNzogICAgIFBIWV9NT0RFX1VTQl9ERVZJQ0VfU1MsDQo+ID4g
Mzg6ICAgICBQSFlfTU9ERV9VU0JfT1RHDQo+ID4gDQo+ID4gaW50byBQSFlfTU9ERV9VU0IgKyBz
dWJtb2RlcyBhbmQgcGh5X29wdHMNCj4gPiANCj4gDQo+IElNSE8sIHRoaXMgc2VlbXMgdG8gZml0
IGJldHRlciBpbiB0aGUgRFQgYmluZGluZywgaWUuIGEgRFQgcHJvcGVydHkNCj4gInFjb20sZXVz
YjItcGh5IiB3b3VsZCBiZSBhIGNsZWFuZXIgc29sdXRpb24gdGhhbiB0cnlpbmcgdG8gbWF0Y2gg
dGhpcw0KPiB3aXRoIHRvIGNvbXBhdGlibGUgc3RyaW5nLg0KDQpBY3R1YWxseSwgaXQgc2hvdWxk
IGJlICJxY29tLGhhcy1ldXNiMi1waHkiLg0KDQo+IA0KPiBBbHNvIEtyaXNobmEsIHlvdXIgcGF0
Y2ggaXMgY29ycnVwdGVkLiBQbGVhc2UgZml4IGl0Lg0KPiANCg0KSSBub3RpY2UgYWxsIHRoZSBx
Y29tIHBoeSB3aXRoIGV1c2IyIHBoeSBhcyBhIGV1c2IyLXBoeSBzdWJzdHJpbmcuIFdlDQpjYW4g
KG1heWJlKSBtYXRjaCB0aGUgcGh5IGNvbXBhdGlibGUgc3Vic3RyaW5nOg0KDQovKiBub3QgdGVz
dGVkICovDQpzdGF0aWMgYm9vbCBkd2MzX3Fjb21faGFzX2V1c2IyX3BoeShzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQp7DQoJc3RydWN0IGRldmljZV9ub2RlICpoc19waHk7DQoJaW50IGk7DQoJYm9vbCBy
ZXQ7DQoNCglpZiAob2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGRldi0+b2Zfbm9kZSwgInBoeS1u
YW1lcyIsICJ1c2IyLXBoeSIpKQ0KCQlyZXR1cm4gZmFsc2U7DQoNCgloc19waHkgPSBvZl9wYXJz
ZV9waGFuZGxlKGRldi0+b2Zfbm9kZSwgInBoeXMiLCBpKTsNCglpZiAoIWhzX3BoeSkNCgkJcmV0
dXJuIGZhbHNlOw0KDQoJcmV0ID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoaHNfcGh5LCAiZXVz
YjItcGh5Iik7DQoJb2Zfbm9kZV9wdXQoaHNfcGh5KTsNCglyZXR1cm4gcmV0Ow0KfQ0KDQpCdXQg
SSBkb24ndCBsaWtlIHRoaXMgYXBwcm9hY2ggZWl0aGVyLiBTZWVtcyB2ZXJ5IGZyYWdpbGUuDQoN
CkJSLA0KVGhpbmg=

