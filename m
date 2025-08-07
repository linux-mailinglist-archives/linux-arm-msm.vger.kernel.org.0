Return-Path: <linux-arm-msm+bounces-67956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E42B1CFFD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 03:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 998795645EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 01:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE305770FE;
	Thu,  7 Aug 2025 01:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="icwzcjV3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dn9jCWfz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a4yHUUSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D11F95C;
	Thu,  7 Aug 2025 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754528951; cv=fail; b=AgB54X9mvKD636pj9OXw3OM0+ZhHOluAPobq7Nn/LqzVLeZxIumFjocHFw57AkDqbf3BMvD6mH7KB/9/rf9UAMldR828u2eSFlfk7ch7mIDJLqJx93PaLE3+qE97McFhtn0bqDCyaM4P7FFZaVAQx2CSsn4qYeWUdft3Yk+oGBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754528951; c=relaxed/simple;
	bh=qDhhiA12GhqNklakeWHQ28aF57w0wk6rZQE5RSo3m5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hfMlQJxfl4kWZf2Pb8f1PLwwIz0t90C0J19RVy5+8T8QjqkGILF9t8ZB9ZMNOlw7PyAEVkt7vzUi7dON7dWbE3AVk7aNhRYKgaaT0F98uDraggqdhUNs9ya3sHIdxMcpKwCttWFnVETSU7/fj1vymCqxaO55pkzx6ju1OKCcSAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=icwzcjV3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Dn9jCWfz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a4yHUUSt reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576JZvIm015841;
	Wed, 6 Aug 2025 18:03:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=qDhhiA12GhqNklakeWHQ28aF57w0wk6rZQE5RSo3m5M=; b=
	icwzcjV3q7b659EQcHgiuXRWOiItrfMsCHC2n4RbnNuSfl3HcU3ao5nCQwXa6WQf
	gY2AyeU/yz6WMhUPIcTj0SaPIN7rmlycTzEUwpAFPkgosaSodkm+9vdLlnVOfh1+
	f4OaOBBH41JmN2jCiwDSMTFOdZiyFyDLdy6+LmHJXDvRWD3nR7RedJahO+ANnOvu
	cGt1W5q11ii6DNscOf+eS7kB/pApRg5xJU6mKDhNgWXAkhv4sqrYWG/hc8+wXNSx
	RmBV0V05ebljaKDElYAiUJh14PAQwiKaHDHEydBg2rup2yogSeTBCTYFba49PmNc
	JSTGBVAjjxBbXRW1UxBBfw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 48bq0wgcrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1754528626; bh=qDhhiA12GhqNklakeWHQ28aF57w0wk6rZQE5RSo3m5M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Dn9jCWfzVu5s1K3MqEmSfDIiAZE2IpJHvx2XmuZBJxiWXt9xIvm1kcm2FAaR3athS
	 4S3Qgk/0HjKEOGenjWbwFHI30i2kBjl80j4BjYCyAM9TtuUxOSjfyI42Tb6b7U9QsT
	 vdzv2mKy0kooQpT5jb778DOL78SLeJ5cu/5zL5LCllLDdVX04OH+x18eNDCsS1Jxxn
	 Nv/X30BeNHHQWoyiNhsJY1KxL5kowqC4tHlh0SE3YQOmkmN1Jqz37kfBEAeEbTEzjJ
	 D2bqRiRTxkpZBEdAHhag1eulneKQBtNFuH7wLOnGkQYzZ1BXZWtnr1U4sp1jAZ9ZXp
	 2LlNqGWJmLHmw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4475240572;
	Thu,  7 Aug 2025 01:03:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EF7CAA006D;
	Thu,  7 Aug 2025 01:03:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=a4yHUUSt;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C436A40122;
	Thu,  7 Aug 2025 01:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLPcsBkEDWW3zAHl6tnQtR7EnUnJEUaH/ivIk3mQuGjBqSiNGo6ouw5hAcVt0mxVb9jv7WRfoyvZ06U1UZ8DaB8rCWy1ch1JmiKz7uU+qtM5gkZGwYC1TyI1AXlHXCJnOsL+hvmUsD+JknJ3Al0j3UARz7wbhv3mV1EEPgaatiHHr/RknG5ivGgO91jqBw/D65NIrbgq6lGbvpvQCPBlKDjnh+OIGqeiqjeVm2J7GD88UXtjJOehiNyZDTxSEGBrzyAtKDs/E9Qm3it7hM9Y02dKqdfnRymBp0numpxqkOFpHIlFgcTTiY8ohoISvzJmCEhfxYKW+MV54O7lYv11bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDhhiA12GhqNklakeWHQ28aF57w0wk6rZQE5RSo3m5M=;
 b=t4wfsg3So/y4DcxMuSbjn6PinXP0JkT8BkVBd+acKL4dY8xAk81O0xaQD7L8rIweBoNxWlh1kK+4Uqb27KMJ8dPJskHjNuFam2gXzcOQL6fZw7dJvrG4iUz9gbsAqXxMacIhv25Qzpb7BhDUHphRBEhVidcb6fa0pW4IHp5ZjdUmgkc1D7FlVRbZUWAuWEjyg7CZJqCrUR81jK0ya1RWZVeCLXWL8QTvHmoAqW6978sx2bvRlkYLNHoQrs2tZllq5Kr2t9qGYTn8o55hfTVyIoG9A8zmypZq+FnasrifzvbXgHg8PBTAuH+pJ6mfRhc8NarxFEu7HNh8fR1e2QPjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDhhiA12GhqNklakeWHQ28aF57w0wk6rZQE5RSo3m5M=;
 b=a4yHUUStfs9NLcFbwA9DNjgXUsMe9lF5zUiFZhmGvm7k7ybl3MAwNXtVhgSpYPJbOpPqG7yWJdSKSrsgQVQWP4P18I8iMjtNmH/hrKGZZzQc+7rxpsPsLIWHPuy9R7nO0EuII7rTZQbFG20VWAGKiPN7c6P+DA8l9z/7nAfnl9s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 01:03:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 01:03:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] usb: dwc3: qcom: Remove extcon functionality from glue
 layer
Thread-Topic: [PATCH v5] usb: dwc3: qcom: Remove extcon functionality from
 glue layer
Thread-Index: AQHcAGr9IasaGZ9NeUqCt5QaG9on87RWbWKA
Date: Thu, 7 Aug 2025 01:03:39 +0000
Message-ID: <20250807010339.smx62c375wakppql@synopsys.com>
References: <20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7327:EE_
x-ms-office365-filtering-correlation-id: 51f3c009-4587-4e9b-a72d-08ddd54e3f24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHdHNGt0aWRPSTFIakJBRkpQOFlEL21CYVp3dUd5NmoxbzVLbUNBbCsvTjdY?=
 =?utf-8?B?cUpZQTZ3K2F1Y1FQNHk3S1VDWENid3JnT3lUZ1gyWklKVG9rZUNJRnJlVHFN?=
 =?utf-8?B?MkRsRVNJaXdsa2tocWdUTTk3T2FRN2VFZ3lobUhzdEZOeUVvc0oyOW9IcHEz?=
 =?utf-8?B?REhlTEVObXQ0RXhkNFpjNnZFYmpPWGFrdVJNWUZYa0toTkJJTGdaUHhEaDF2?=
 =?utf-8?B?d3JYSjEvRVhEWGhFeUxTdmMxVnJJL2o5ajhJZ3hoQTM3VTJZMUdDd3RpSmRp?=
 =?utf-8?B?NGtCblNLSERuTHB5SDJOZEpiQVg2ZklhTjRBd0xpN1o3a3loZDdaTUlPU2Rz?=
 =?utf-8?B?N29XdGlTR1dUQ0dsaXlHSk9RdGVObnRsUUdzbzJseDgvaXhSK1BZd1M4TGlB?=
 =?utf-8?B?NVQrbHJ5dXArR0JZWXN4akgyYnZnd1hFTndZMTVreGxlN29MamQvYlN4N2t6?=
 =?utf-8?B?ZmJEdkx0c0txampDaWEwWnE5Q1VSV2FlSlo0SHRaaDJ2djl0V09lT0NNQ1VF?=
 =?utf-8?B?OVRvWUZKUElTYjVkWGl4SG44N01iOVBmZlpCVTZnUTlBQy96d0tLTVBwSmRZ?=
 =?utf-8?B?RmxVc3hhd2hTeSttVWRsK2ZHdUpXM3Fxazg2VldHTU1iVFBWcjdkVVR3M3BX?=
 =?utf-8?B?YkM5Wk9BVmhGbm90OHBTYldyZnU2M0lhUkNxK0ZNMm43Umh2L0dWMzBxbU9a?=
 =?utf-8?B?Yis0bytUem1iUUNQVUhNa1B0cmx0aFh3QkZ5SFE3c0NBUmJMeFp1T1RzVFhi?=
 =?utf-8?B?aW5kWWZ1QWY0MzloanFKZHlhMDRncXgybEJxc0pjRXJUM2NwejgrSHFLS0dm?=
 =?utf-8?B?a0N6ckprZFZ0aEVDUkhSNkFkb3E2U2k5SmQvSEtOVm5xRFdLOEtDbEIyZkdQ?=
 =?utf-8?B?MkYrVU9XaEVrTzVzZG9tbmVqcFdVenkvenlwYWhrMlo2QUN1OEpJNkE4d3hX?=
 =?utf-8?B?eHVZY1RzYlplSEhQTnN1d0FhOFM4M1QxZlZHVytybi91YXNZTFpxU0FHV3Bj?=
 =?utf-8?B?ZTN5NFZnekdMTkg5THZSV1crSWYxZjhwbjNJbmJWaVNMVUlsdTR2TWNqbUlu?=
 =?utf-8?B?ZUNzYUI5dkw5b2dEQUFYakw1eW5yZllid3hjRnNsRWZxOU5QbXBybDI0bXBW?=
 =?utf-8?B?VXlRWVdKeS9acXVieXZmRi9tUmFROFJzOFJBYjBBeTBhelJ3SzJBRjlXQ1FT?=
 =?utf-8?B?U3A4MGJNRklmeUhGZ3JoSzNiTll4ZkZ0TG9IYm5MNXQ4Tkh6WjN0YWRqNWIw?=
 =?utf-8?B?bm9vNnIwREtvZ0kvVnNhL1R5Wkt0bXh2RXY3ZTR6SFYzZk9mNVdoVTdnclBp?=
 =?utf-8?B?N2wwN21QUFBoM1dseW5uQXpTYWJ3ODdUVzBuOHlINGhONzQyUlp3QzluZlZD?=
 =?utf-8?B?UktTbzRkLzdqVkMvNUpkNjR2RmlYMEFOV09yckRzellkK1hTSm52WGdvc1c5?=
 =?utf-8?B?cW9xeGZsNFpDRXNhUlhDcGhDc0g2cEhvcitUNmJ0Z1dQQzVzUkh1cjMySVg2?=
 =?utf-8?B?V1NhbTNQYU1mRDZUMllpTjRlR2F2M3hzcnJtL0ttS3F2OTIvN2xvQWJHRU5n?=
 =?utf-8?B?cDhVTTI2Rzc5VUJFbWhObjN2VXdvcWloYXo5cTRFOGp2Rm9LS1Z4RVZZRTJE?=
 =?utf-8?B?eG9ybmVMT1lLVUw4b2ZVUS92RFZsNGpiWjNUa25QdUw1T2R2OVJvakJkbnhG?=
 =?utf-8?B?WXAvcnJORFBOVnhXRGYzTWZxTlRWUkkwdzYyVXBxOVlxbGN6bkIvR3AvaUJ0?=
 =?utf-8?B?Nld5amhJcjV5UGw3Zm4wQjNBaTBiQmJ4L0k5U3A5VGpxWEcyMmcweGZHelA4?=
 =?utf-8?B?dkRYL3ZCYU03QlVyZy8rU201d3RtT2RVWjgvaUNMbTdDY0ExWHB3VTkrMWZa?=
 =?utf-8?B?alJhVkx0bisrL0dqNzBPem9VREpUZVdPNENRQi8zZHZPODNpa09DZVRZb04y?=
 =?utf-8?B?bUQxUW5KcC9uN1RVRWErTTlwdS83WGJGK3QzUlRzd0F4c3o4bHFEOXhwQkQ0?=
 =?utf-8?Q?6F4tWT7pgO1AXJYDUDHz011bhra7lI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFNmblAza2RUYmV2ajNSUXQ3aklrdk1XMkxVNXREYVZ3Q3JPd0tha2k0bDY1?=
 =?utf-8?B?b1VQTmpkbU93K3EyazUreEExdUZURHI3c1c1U28wTGwwU0Jld3pMVjJXdmN6?=
 =?utf-8?B?dHlWZ0JPUGxtUkNsR3BJbTdadGw3M0FsUXl4ZFJXNjNyQkdMVXZxcm84NWIy?=
 =?utf-8?B?ZEU4K3NOLzlrWUJrb3hzT20xMEFYZzZ2SVlxUGtaT0xqNVpmd1hjR1V4TGZZ?=
 =?utf-8?B?ZnJiWkE5Qnpra1IwRmczYWVQSDVLV0tQNHZsNE9UVURtM1RTb3VCcFYvWkNL?=
 =?utf-8?B?MFRSSzlSL3NxSkM3NUJUNFl6S3JzZXRSQlRTQ0I0OTRadm9lZFdteEZCaDFW?=
 =?utf-8?B?UGFZZGsyZjFxNFN3djI2NzBQSlRQUGtPVm42bVdMSFByWG5JWTJLemNBT2VX?=
 =?utf-8?B?RjY5cnhSR3dhVUJRSFIzZTVkZGkvYVZldWVjWHdZaGM4WnFMQk45RkgxaWlM?=
 =?utf-8?B?QnJxWC95SVBvY3hRWWs2S01KT2FTY1NHTVZXWTg5NzA4Um14NkVPTjlwaUtQ?=
 =?utf-8?B?NmgwVzFmRERsZWpRTUFsSWQ0MlNHWXRFZkNTeHlra1l4R0d0dHp6aTlWMjJ4?=
 =?utf-8?B?YS90eVRtRms1RG5nR1NmVThtTTcvb09BYnBYOWhUS25Zb3pRek9nMjZxamty?=
 =?utf-8?B?QnFvZ2c4U1dUNmpPOGhXZUQ5NkVtbjE5TE03VmYrRXJGaWdyaUMxbG50aFpx?=
 =?utf-8?B?b0F5ajI5dThMM1AvbiszQmZmdnpwaVhBOG13TzhBU2RiWUljdTBrblgrZ1lP?=
 =?utf-8?B?RXBDVlFibVB6RUFRVWR5a1J1d3phNlFPNmdNK0xBQVN2WGVuUURiUkhna0s5?=
 =?utf-8?B?N2F1ZUZ6U2V4Qi9GS2Y0SGZEVTNrcmppUFlXZXlFR2VPamp6b2Iyc2liM1hP?=
 =?utf-8?B?cFJpUkRwTERTTmNNamorMi9pYm5OT1ZIbklXb0ZORzErcm1ZM3FhZGh6RjIz?=
 =?utf-8?B?WUduZTNCYjBVbFViZjNPU29Pak9xZ1FzZzJURExienpZNnZkeUtLaEJ0M242?=
 =?utf-8?B?bVBGWmVRSTlFYmR0V3d4L1Z6bnNCT3VQQ05JbGFjWHFjZ1RwcE52ekQzUXFJ?=
 =?utf-8?B?TWV5TVhTajlaS1pXWVFmdmlSQjdZQ0l4RktVKzJNVHk5STNiQ2JEK2ZqWW15?=
 =?utf-8?B?eXlNWlBzcTRlRUVQUnZzRHJnU1F4ajlURE1rckw4MElJWnpIV1ZOUDBtZlVL?=
 =?utf-8?B?eGZSN2E4MXd2bDk3ZVA1cTlNUTJ3eXlDUkZpbEE4VGc5c0tsNWd4TzZUWmdX?=
 =?utf-8?B?WDlHN2FBSldpRmxUTURRYmVWV08xcmE4b3p1K1FlSWxmSzh4YUR1cXlGTW13?=
 =?utf-8?B?YmFDV3JLa3diakhabS9aR2srazBOYWVZV0ZaVWlkdTY1RUR2ajRiVHBaQ0dT?=
 =?utf-8?B?QUIreGVqSjNVUVFCd3FkeTdDS1NiOXpSOGN2bEQ3MU05WVdpNmpFTkFxZk03?=
 =?utf-8?B?THE5cGdyZi80OU96TWx3QzVDMG94WEZaR3lsTm9jQWhQNTJEbFFWVENkR3dL?=
 =?utf-8?B?cmZiUGNZSGJTeEdmdXFDaVJYNVJTQ2ozTzRpS2UwdUxCN2pQU0wwaUVIVDlp?=
 =?utf-8?B?YVJzeG9IQUVhRzB6QThpOUtBdEZNazNSM0NxZkNxN2RyeDZUcTJ6eFBJK1VR?=
 =?utf-8?B?MXJoME41bTV6dWdHSmRaaklPWTRTQlMxS0R2bGgvMnJJM1diWFFwc3ZFVi80?=
 =?utf-8?B?OXowazhWUVh0NCtjZDAxYmxEV3g0SzRVLzNhNTZ4c0d6cEh0TXp0OUFKRnAy?=
 =?utf-8?B?djZocTlhNTl0ZU1NTlNGRFRicW9qenkxTHZUZHI3aFBKMlhUUElNZWplRElh?=
 =?utf-8?B?WUY4U2Jhck9DY2I3RFNNWWVoS0g2amRJSGJOSHdvYll6ci9LVzM0cE9LdnpS?=
 =?utf-8?B?WDE3cHZyUVl4UWpwYkpaY0l5bHZ1ekNMVlZqazBCeGNkVlhUU2NHU3hyTlho?=
 =?utf-8?B?VTBzNTB1YkNva1ZaNXhRUTAxQnU2b3RYYVB4MDVWS0JVNGl0dzFxRElmTEJL?=
 =?utf-8?B?TmptTUNuYnVuc1RvRStYMFZRbHZTbVduY2poaXorc0FaSUhGMkNhVkppeEdT?=
 =?utf-8?B?UTA3WEN1VHErK2pRbURjeVpRK2NEcTlkMTlUQzNDcHdEckludFpGQWVOcFRT?=
 =?utf-8?Q?koxE/ynEC2PNGH4h3PQQYzFhg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <203EEEB12020C6478EA20261ACA2DD74@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IF+VmJk7/b9wI1PB+Em++cVYaRbIkcqh8lwZnORxMs1K40xgi7tFMAMk20pV9ZLkKcz+60h0X5sxnyFO8dgmFtFtMBrTKTINgjPRXA65gzGamIdsJEKx0RCfmjbcLeP5uZaasmBkmyF+PbLzBQ6iyvz2lQt4ATe3Kkotu3IPQW9LYnN0lg/9jaixZx/YKxDx8s8HUpy+a7PkoLBG2uTG5OSv/c7ZgYXHmQYLzlPbz4/Ifiw2zKOL7F0fWray8M9g/kvitqHOn0uY0V/arbXsu1beJxfetK35v53hf9aVpeBPp1FpOg+3gVx/vvNdFuXBssmEocIJHjrTU9t/Qlvq62MRmnwnzrIKRhVJ6AR2wEQ2MnPnBQ9X7Hg35HFykdJY79pKUqOILhC1a3CX08LG5svevkeweEGxmN6ijaQuKndkzEJ+sXeXVRnOAonwa5ojrixnjuvC9vle+hDeYaW2+lf1sKB6nYd3R0g3ZKuhKybEX9AalrSuflclDff5igQLZZsOO2HrTB3ZqF/B87hV8HsU8i8uv0Ebq3NQ4xSqnBch8rumevVgs/E7oYJElvq6RYSkv9FhJyVh21guqkJ7NOEoqB/qm1h2dAxYzvse8pygu3yZTvNj2DwmlGtIfOBqkTEcPHvKS7yLNO3Wz55v0A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f3c009-4587-4e9b-a72d-08ddd54e3f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 01:03:39.9798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WvgR3cdrBipkW0KE+G3TRYSjPWK0vu9hR3cLY18km3USrsLFWB102JeMjBfq2b1k6J+W/ktWXohImvi54HzYMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
X-Proofpoint-GUID: 46bSfE8PC6S2ssNfw5rPb_2JuIrhysHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOCBTYWx0ZWRfX+yx66ZNlLD86
 gXf7ZH/jboXGDBtz7iiNVMTxwcUlsTIMUoK/k0cZC2itm3E+RfgOblnsz5k4OxSLkwILxKuAoeA
 EkaXeXRMUAtHmWpJWkrKGeueR6St0SIAlcb8Vt7/R+8t7+GqM3IgWVMIhxFz5TAUF2jT6sX1OLn
 ODAn7wQoz8DO5pCDORhSqBCR2Acl3475dt1/vNTMBkUgi/aGMpmrPW4phP81cLfKNA4HASEsNCq
 5uKZco/wY7hC26zmMZ9nnOf/aEEAGpQvV7u8xc5RCXGe7Mg3O3nujVdEiwIgDpdjSv5vH2g+LWO
 +z39dCq+wTGmm7fmmSqri9HRsdrYDJFPPnsQx0YpptDL1/x6y278KRLUDvVcpKLy940EvpTf0d+
 igBQNQur
X-Proofpoint-ORIG-GUID: 46bSfE8PC6S2ssNfw5rPb_2JuIrhysHg
X-Authority-Analysis: v=2.4 cv=HYMUTjE8 c=1 sm=1 tr=0 ts=6893fb7e cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qPHU084jO2kA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=CLpb7PKivxdXBAbSxukA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050128

T24gVHVlLCBKdWwgMjksIDIwMjUsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6DQo+IEhpc3Rvcmlj
YWxseSBRdWFsY29tbSBEV0MzIGdsdWUgZHJpdmVyIHN1cHBvcnRlZCBib3RoIGV4dGNvbiBhbmQN
Cj4gdXNiLXJvbGUtc3dpdGNoIGtpbmRzIG9mIG5vdGlmaWNhdGlvbnMuIFdoZW4gQmpvcm4gY29u
dHJpYnV0ZWQgWzFdIHRoZQ0KPiBmbGF0dGVuZWQgcmVwcmVzZW50YXRpb24gZm9yIHRoZSBEV0Mz
IGhvc3QgY29udHJvbGxlciwgaGUgYWxzbyBrZXB0IGJvdGgNCj4gZXh0Y29uIGFuZCB1c2Itcm9s
ZS1zd2l0Y2ggc3VwcG9ydCBpbiB0aGUgZmxhdHRlbmVkIGRyaXZlciAmIGJpbmRpbmdzLg0KPiAN
Cj4gQ3VycmVudGx5IHRoZXJlIGFyZSBubyBpbi1rZXJuZWwgdXNlcnMgZm9yIGZsYXR0ZW5lZCBE
V0MzIGFuZCBleHRjb24uIEFzDQo+IGRldmljZSdzIERUIG5lZWRzIHRvIGJlIG1hbnVhbGx5IGNv
bnZlcnRlZCBmcm9tIGxlZ2FjeSB0byB0aGUgZmxhdCBEV0MzDQo+IHJlcHJlc2VudGF0aW9uLCB3
ZSBjYW4gZHJvcCAobGVnYWN5IC8gZGVwcmVjYXRlZCkgZXh0Y29uIHN1cHBvcnQgZnJvbQ0KPiB0
aGUgbmV3IERXQzMgZ2x1ZSBkcml2ZXIsIHNpZ25pZmljYW50bHkgc2ltcGxpZnlpbmcgdGhlIGNv
ZGUuDQo+IA0KPiBUaGlzIHBvdGVudGlhbGx5IGFmZmVjdHMgZmxhdHRlbmluZyBlZmZvcnQgZm9y
IHRoZSBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KPiANCj4gUGxhdGZvcm1zIGN1cnJlbnRseSB1c2lu
ZyBsaW51eCxleHRjb24tdXNiLWdwaW8gZGV2aWNlIHRoYXQgbmVlZCB0bw0KPiBzd2l0Y2ggdG8g
Z3Bpby11c2ItYi1jb25uZWN0b3I6DQo+IC0gYXBxODA5Ni1kYjgyMGMsDQo+IC0gbXNtODk5Ni1z
b255LXhwZXJpYS10b25lLWRvcmENCj4gDQo+IFBsYXRmb3JtcyBjdXJyZW50bHkgdXNpbmcgbGlu
dXgsZXh0Y29uLXVzYi1ncGlvIGRldmljZSB0aGF0IG5lZWQgdG8NCj4gc3dpdGNoIHRvIGdwaW8t
dXNiLWMtY29ubmVjdG9yIChub3Qgc3VwcG9ydGVkIGF0IHRoaXMgbW9tZW50KSBvciB0bw0KPiBp
bXBsZW1lbnQgdHlwZWMgc3VwcG9ydA0KPiAtIG1zbTg5OTYtc29ueS14cGVyaWEtdG9uZS1rYWd1
cmENCj4gLSBtc204OTk2LXNvbnkteHBlcmlhLXRvbmUta2V5YWtpDQo+IC0gbXNtODk5OC1meHRl
Yy1wcm8xDQo+IC0gbXNtODk5OC1zb255LXhwZXJpYS15b3NoaW5vLWxpbGFjDQo+IC0gbXNtODk5
OC1zb255LXhwZXJpYS15b3NoaW5vLW1hcGxlDQo+IC0gbXNtODk5OC1zb255LXhwZXJpYS15b3No
aW5vLXBvcGxhcg0KPiAtIHNkYTY2MC1pbmZvcmNlLWlmYzY1NjANCj4gLSBzZG02MzAtc29ueS14
cGVyaWEtbmlsZS1kaXNjb3ZlcnkNCj4gLSBzZG02MzAtc29ueS14cGVyaWEtbmlsZS1waW9uZWVy
DQo+IC0gc2RtNjMwLXNvbnkteHBlcmlhLW5pbGUtdm95YWdlcg0KPiAtIHNkbTY2MC14aWFvbWkt
bGF2ZW5kZXINCj4gLSBzbTYxMjUtc29ueS14cGVyaWEtc2VpbmUtcGR4MjAxDQo+IC0gc202MTI1
LXhpYW9taS1naW5rZ28NCj4gLSBzbTYxMjUteGlhb21pLWxhdXJlbC1zcHJvdXQNCj4gDQo+IFBs
YXRmb3JtcyB1c2luZyBUSSBUVVNCMzIwTCBjaGlwIG5lZWQgdG8gc3dpdGNoIHRvIHJlcHJlc2Vu
dCB0aGUgVVNCLUMNCj4gY29ubmVjdG9yIHByb3Blcmx5IChhbmQgdG8gaGF2ZSBhIHR5cGVjLWNs
YXNzIGRyaXZlciBmb3IgdGhlIFRVU0IzMjBMDQo+IGNoaXApOg0KPiAtIG1zbTg5OTYteGlhb21p
LWdlbWluaQ0KPiAtIG1zbTg5OTZwcm8teGlhb21pLW5hdHJpdW0NCj4gLSBtc204OTk2cHJvLXhp
YW9taS1zY29wcnBpbw0KPiANCj4gQ29tbWl0IG1lc3NhZ2Ugc3VnZ2VzdGVkIGJ5IERtaXRyeSBC
YXJ5c2hrb3YuDQo+IA0KPiBbMV06IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTQtZHdjMy1yZWZhY3Rvci12Ny0wLWYwMTViMzU4
NzIyZEBvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5R19wZyFmMm02MEpxZElxNWVHdHI5anJQ
R0twbUhaSTViVG1pR0doT19DZmVudlJDNTZaWnZ4VG5hQ1JZajRlNnI2X1R0bWVxNU1vQUJIXzJr
ZjB2Um9MaTNZWjRzd25heVV5YVAyOGFTZkEkIA0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Jpc2hu
YSBLdXJhcGF0aSA8a3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4g
Q2hhbmdlcyBpbiB2NToNCj4gQ2hhbmdlZCBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIHRoZSBp
c3N1ZSBpbiBtb3JlIGRldGFpbC4NCj4gDQo+IExpbmsgdG8gdjQ6DQo+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA3MTgwNTM4NTYu
Mjg1OTk0Ni0xLWtyaXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbS9fXzshIUE0RjJSOUdf
cGchZjJtNjBKcWRJcTVlR3RyOWpyUEdLcG1IWkk1YlRtaUdHaE9fQ2ZlbnZSQzU2Wlp2eFRuYUNS
WWo0ZTZyNl9UdG1lcTVNb0FCSF8ya2YwdlJvTGkzWVo0c3duYXlVeWFKNWlEajBnJCANCj4gDQo+
IENoYW5nZXMgaW4gdjQ6DQo+IFVwZGF0ZWQgY29tbWl0IHRleHQgdG8gcmVmbGVjdCB0aGUgcGF0
Y2ggZG9lc24ndCBhZmZlY3QgaW4ta2VybmVsIHVzZXJzLg0KPiBSZW1vdmVkIFJCIHRhZ3MgZnJv
bSB2MyBzaW5jZSBjb21taXQgdGV4dCBpcyBjaGFuZ2VkLg0KPiANCj4gTGluayB0byB2MzoNCj4g
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDcxNDA0NDcwMy4yMDkxMDc1LTEta3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNvbW0uY29t
L19fOyEhQTRGMlI5R19wZyFmMm02MEpxZElxNWVHdHI5anJQR0twbUhaSTViVG1pR0doT19DZmVu
dlJDNTZaWnZ4VG5hQ1JZajRlNnI2X1R0bWVxNU1vQUJIXzJrZjB2Um9MaTNZWjRzd25heVV5WmR6
YTBtQ3ckIA0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gVGhpcyBjaGFuZ2Ugd2FzIDRydGggcGF0
Y2ggaW4gWzFdLiBJdCB3YXMgc3VnZ2VzdGVkIHRvIG1ha2UgdGhpcyBhcyB0aGUNCj4gZmlyc3Qg
cGF0Y2ggb2YgdGhlIHNlcmllcy4gU2luY2UgdGhpcyBpcyBpbmRlcGVuZGVudCBvZiByb2xlIHN3
aXRjaA0KPiBwYXRjaGVzLCBzZW5kaW5nIHRoaXMgb3V0IHNlcGFyYXRlbHkuIFJlbW92ZWQgUkIg
VGFnIG9mIERtaXRyeSBzaW5jZSB0aGUNCj4gcGF0Y2ggaGFzIGJlZW4gY2hhbmdlZC4NCj4gDQo+
IFsxXTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI1MDYxMDA5MTM1Ny4yOTgzMDg1LTEta3Jpc2huYS5rdXJhcGF0aUBvc3MucXVhbGNv
bW0uY29tL19fOyEhQTRGMlI5R19wZyFmMm02MEpxZElxNWVHdHI5anJQR0twbUhaSTViVG1pR0do
T19DZmVudlJDNTZaWnZ4VG5hQ1JZajRlNnI2X1R0bWVxNU1vQUJIXzJrZjB2Um9MaTNZWjRzd25h
eVV5WjRjTk50bFEkIA0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgfCA5MCAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgODkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4g
aW5kZXggY2E3ZTFjMDI3NzNhLi5hN2VhZWZhZWVjNGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20u
Yw0KPiBAQCAtMTEsNyArMTEsNiBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2Nsay5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0K
PiAtI2luY2x1ZGUgPGxpbnV4L2V4dGNvbi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVyY29u
bmVjdC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L3BoeS9waHkuaD4NCj4gQEAgLTc5LDExICs3OCw2IEBAIHN0cnVjdCBkd2MzX3Fj
b20gew0KPiAgCXN0cnVjdCBkd2MzX3Fjb21fcG9ydAlwb3J0c1tEV0MzX1FDT01fTUFYX1BPUlRT
XTsNCj4gIAl1OAkJCW51bV9wb3J0czsNCj4gIA0KPiAtCXN0cnVjdCBleHRjb25fZGV2CSplZGV2
Ow0KPiAtCXN0cnVjdCBleHRjb25fZGV2CSpob3N0X2VkZXY7DQo+IC0Jc3RydWN0IG5vdGlmaWVy
X2Jsb2NrCXZidXNfbmI7DQo+IC0Jc3RydWN0IG5vdGlmaWVyX2Jsb2NrCWhvc3RfbmI7DQo+IC0N
Cj4gIAllbnVtIHVzYl9kcl9tb2RlCW1vZGU7DQo+ICAJYm9vbAkJCWlzX3N1c3BlbmRlZDsNCj4g
IAlib29sCQkJcG1fc3VzcGVuZGVkOw0KPiBAQCAtMTE5LDggKzExMyw3IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBkd2MzX3Fjb21fY2xyYml0cyh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQs
IHUzMiB2YWwpDQo+ICANCj4gIC8qDQo+ICAgKiBUT0RPOiBNYWtlIHRoZSBpbi1jb3JlIHJvbGUg
c3dpdGNoaW5nIGNvZGUgaW52b2tlIGR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZSgpLA0K
PiAtICogdmFsaWRhdGUgdGhhdCB0aGUgaW4tY29yZSBleHRjb24gc3VwcG9ydCBpcyBmdW5jdGlv
bmFsLCBhbmQgZHJvcCBleHRjb24NCj4gLSAqIGhhbmRsaW5nIGZyb20gdGhlIGdsdWUNCj4gKyAq
IHZhbGlkYXRlIHRoYXQgdGhlIGluLWNvcmUgZXh0Y29uIHN1cHBvcnQgaXMgZnVuY3Rpb25hbA0K
PiAgICovDQo+ICBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUoc3Ry
dWN0IGR3YzNfcWNvbSAqcWNvbSwgYm9vbCBlbmFibGUpDQo+ICB7DQo+IEBAIC0xMzcsODAgKzEz
MCw2IEBAIHN0YXRpYyB2b2lkIGR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShzdHJ1Y3Qg
ZHdjM19xY29tICpxY29tLCBib29sIGVuYWJsZSkNCj4gIAl9DQo+ICB9DQo+ICANCj4gLXN0YXRp
YyBpbnQgZHdjM19xY29tX3ZidXNfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwN
Cj4gLQkJCQkgICB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lkICpwdHIpDQo+IC17DQo+IC0Jc3Ry
dWN0IGR3YzNfcWNvbSAqcWNvbSA9IGNvbnRhaW5lcl9vZihuYiwgc3RydWN0IGR3YzNfcWNvbSwg
dmJ1c19uYik7DQo+IC0NCj4gLQkvKiBlbmFibGUgdmJ1cyBvdmVycmlkZSBmb3IgZGV2aWNlIG1v
ZGUgKi8NCj4gLQlkd2MzX3Fjb21fdmJ1c19vdmVycmlkZV9lbmFibGUocWNvbSwgZXZlbnQpOw0K
PiAtCXFjb20tPm1vZGUgPSBldmVudCA/IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwgOiBVU0JfRFJf
TU9ERV9IT1NUOw0KPiAtDQo+IC0JcmV0dXJuIE5PVElGWV9ET05FOw0KPiAtfQ0KPiAtDQo+IC1z
dGF0aWMgaW50IGR3YzNfcWNvbV9ob3N0X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bmIsDQo+IC0JCQkJICAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqcHRyKQ0KPiAtew0KPiAt
CXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBkd2MzX3Fj
b20sIGhvc3RfbmIpOw0KPiAtDQo+IC0JLyogZGlzYWJsZSB2YnVzIG92ZXJyaWRlIGluIGhvc3Qg
bW9kZSAqLw0KPiAtCWR3YzNfcWNvbV92YnVzX292ZXJyaWRlX2VuYWJsZShxY29tLCAhZXZlbnQp
Ow0KPiAtCXFjb20tPm1vZGUgPSBldmVudCA/IFVTQl9EUl9NT0RFX0hPU1QgOiBVU0JfRFJfTU9E
RV9QRVJJUEhFUkFMOw0KPiAtDQo+IC0JcmV0dXJuIE5PVElGWV9ET05FOw0KPiAtfQ0KPiAtDQo+
IC1zdGF0aWMgaW50IGR3YzNfcWNvbV9yZWdpc3Rlcl9leHRjb24oc3RydWN0IGR3YzNfcWNvbSAq
cWNvbSkNCj4gLXsNCj4gLQlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gcWNvbS0+ZGV2Ow0KPiAtCXN0
cnVjdCBleHRjb25fZGV2CSpob3N0X2VkZXY7DQo+IC0JaW50CQkJcmV0Ow0KPiAtDQo+IC0JaWYg
KCFvZl9wcm9wZXJ0eV9wcmVzZW50KGRldi0+b2Zfbm9kZSwgImV4dGNvbiIpKQ0KPiAtCQlyZXR1
cm4gMDsNCj4gLQ0KPiAtCXFjb20tPmVkZXYgPSBleHRjb25fZ2V0X2VkZXZfYnlfcGhhbmRsZShk
ZXYsIDApOw0KPiAtCWlmIChJU19FUlIocWNvbS0+ZWRldikpDQo+IC0JCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihxY29tLT5lZGV2KSwNCj4gLQkJCQkgICAgICJGYWlsZWQgdG8g
Z2V0IGV4dGNvblxuIik7DQo+IC0NCj4gLQlxY29tLT52YnVzX25iLm5vdGlmaWVyX2NhbGwgPSBk
d2MzX3Fjb21fdmJ1c19ub3RpZmllcjsNCj4gLQ0KPiAtCXFjb20tPmhvc3RfZWRldiA9IGV4dGNv
bl9nZXRfZWRldl9ieV9waGFuZGxlKGRldiwgMSk7DQo+IC0JaWYgKElTX0VSUihxY29tLT5ob3N0
X2VkZXYpKQ0KPiAtCQlxY29tLT5ob3N0X2VkZXYgPSBOVUxMOw0KPiAtDQo+IC0JcmV0ID0gZGV2
bV9leHRjb25fcmVnaXN0ZXJfbm90aWZpZXIoZGV2LCBxY29tLT5lZGV2LCBFWFRDT05fVVNCLA0K
PiAtCQkJCQkgICAgJnFjb20tPnZidXNfbmIpOw0KPiAtCWlmIChyZXQgPCAwKSB7DQo+IC0JCWRl
dl9lcnIoZGV2LCAiVkJVUyBub3RpZmllciByZWdpc3RlciBmYWlsZWRcbiIpOw0KPiAtCQlyZXR1
cm4gcmV0Ow0KPiAtCX0NCj4gLQ0KPiAtCWlmIChxY29tLT5ob3N0X2VkZXYpDQo+IC0JCWhvc3Rf
ZWRldiA9IHFjb20tPmhvc3RfZWRldjsNCj4gLQllbHNlDQo+IC0JCWhvc3RfZWRldiA9IHFjb20t
PmVkZXY7DQo+IC0NCj4gLQlxY29tLT5ob3N0X25iLm5vdGlmaWVyX2NhbGwgPSBkd2MzX3Fjb21f
aG9zdF9ub3RpZmllcjsNCj4gLQlyZXQgPSBkZXZtX2V4dGNvbl9yZWdpc3Rlcl9ub3RpZmllcihk
ZXYsIGhvc3RfZWRldiwgRVhUQ09OX1VTQl9IT1NULA0KPiAtCQkJCQkgICAgJnFjb20tPmhvc3Rf
bmIpOw0KPiAtCWlmIChyZXQgPCAwKSB7DQo+IC0JCWRldl9lcnIoZGV2LCAiSG9zdCBub3RpZmll
ciByZWdpc3RlciBmYWlsZWRcbiIpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gLQ0KPiAt
CS8qIFVwZGF0ZSBpbml0aWFsIFZCVVMgb3ZlcnJpZGUgYmFzZWQgb24gZXh0Y29uIHN0YXRlICov
DQo+IC0JaWYgKGV4dGNvbl9nZXRfc3RhdGUocWNvbS0+ZWRldiwgRVhUQ09OX1VTQikgfHwNCj4g
LQkgICAgIWV4dGNvbl9nZXRfc3RhdGUoaG9zdF9lZGV2LCBFWFRDT05fVVNCX0hPU1QpKQ0KPiAt
CQlkd2MzX3Fjb21fdmJ1c19ub3RpZmllcigmcWNvbS0+dmJ1c19uYiwgdHJ1ZSwgcWNvbS0+ZWRl
dik7DQo+IC0JZWxzZQ0KPiAtCQlkd2MzX3Fjb21fdmJ1c19ub3RpZmllcigmcWNvbS0+dmJ1c19u
YiwgZmFsc2UsIHFjb20tPmVkZXYpOw0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4g
IHN0YXRpYyBpbnQgZHdjM19xY29tX2ludGVyY29ubmVjdF9lbmFibGUoc3RydWN0IGR3YzNfcWNv
bSAqcWNvbSkNCj4gIHsNCj4gIAlpbnQgcmV0Ow0KPiBAQCAtNzM3LDExICs2NTYsNiBAQCBzdGF0
aWMgaW50IGR3YzNfcWNvbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CWlmIChxY29tLT5tb2RlICE9IFVTQl9EUl9NT0RFX0hPU1QpDQo+ICAJCWR3YzNfcWNvbV92YnVz
X292ZXJyaWRlX2VuYWJsZShxY29tLCB0cnVlKTsNCj4gIA0KPiAtCS8qIHJlZ2lzdGVyIGV4dGNv
biB0byBvdmVycmlkZSBzd192YnVzIG9uIFZidXMgY2hhbmdlIGxhdGVyICovDQo+IC0JcmV0ID0g
ZHdjM19xY29tX3JlZ2lzdGVyX2V4dGNvbihxY29tKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3Rv
IGludGVyY29ubmVjdF9leGl0Ow0KPiAtDQo+ICAJd2FrZXVwX3NvdXJjZSA9IG9mX3Byb3BlcnR5
X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsICJ3YWtldXAtc291cmNlIik7DQo+ICAJZGV2aWNlX2lu
aXRfd2FrZXVwKCZwZGV2LT5kZXYsIHdha2V1cF9zb3VyY2UpOw0KPiAgDQo+IEBAIC03NDksOCAr
NjYzLDYgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgDQo+IC1pbnRlcmNvbm5lY3RfZXhpdDoN
Cj4gLQlkd2MzX3Fjb21faW50ZXJjb25uZWN0X2V4aXQocWNvbSk7DQo+ICByZW1vdmVfY29yZToN
Cj4gIAlkd2MzX2NvcmVfcmVtb3ZlKCZxY29tLT5kd2MpOw0KPiAgY2xrX2Rpc2FibGU6DQo+IC0t
IA0KPiAyLjM0LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

