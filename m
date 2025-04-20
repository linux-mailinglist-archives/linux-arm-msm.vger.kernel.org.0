Return-Path: <linux-arm-msm+bounces-54828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A091A94965
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 21:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40E557A23F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 19:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2062288D2;
	Sun, 20 Apr 2025 19:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CsOcTbmJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GjEGcV7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453D801;
	Sun, 20 Apr 2025 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177905; cv=fail; b=rA6IN/Pxy11NXRIhUEFAR80i2W8+E9amJJ/n4J6JDqzt9Muy0/lz1gr+JcP4fqJno85GNQy/KaPegbvoAuewP4NE5JpmBqwkOINeWEy1F9uGPOo3sJVI07pNT1dogjR8hpK3Lg7TcdqXqjA0i2mAh0JTpIs7kQhDNa4xG8wEC6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177905; c=relaxed/simple;
	bh=nrw3TCUBrznDh47CJaR9DtUPgcrUK/bNOBLpyyyYfUc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h6XvIrYyLxVdMkRWiJ8dEfhl4IsJ82pnSU+pi62Gp8iXsFgJvOwNcKzlSCRl/h6EjZHGXm+mQezedJAZGBxuW+usCP9tOY3IUt8GaYcBZFszKQdc7AduQ6TM8mBU0gBitfsWdroGu27fbbL2IYcaOhKtTPtK/kkjrg5ttcSF3eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CsOcTbmJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GjEGcV7n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KIP2hl015352;
	Sun, 20 Apr 2025 19:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=pRnAzLKywpcvGou0pCFal1rZj/JbYBpIrjuRpvLBlFM=; b=
	CsOcTbmJlQL4KQPsGNR/SfwphitgyI3xNBoI+f31AYPCB5RsGC44xo+6xZ520s9b
	RjZSZgcciLX27AmIIBBXlzlYrYnzzWRMEJxY4i4wvTszwN6C6NCWj03G0uaJflz1
	4cEbQ0xz0FmfqgdQ6hEicAoqW8qdd/wrZHOdJTNoeyjsYlO6iMd+I+FRia3e3ZSh
	5PCN17mZDZr0sViDg/aFFJWTCVdqXfEyyC9BuRKi+M3GGGHJiXCgMmgbhF7GkEOt
	1nSAdsRvatUYHO9xok/paHYMNGpcUUmrEyXCcMtcgXVhX9gvn3mwJE4nK8RzVt6y
	3xItUqA4iYyDuI7RXA9qzw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642m1shr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 19:37:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53KJAplZ033565;
	Sun, 20 Apr 2025 19:37:51 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 464297b748-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 19:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8D6lzJyZPcrjoubDEQTxtE13dgL7jibWGvGWGBAypGUz1E9IYiNFCxg1V0sgZ2oap11Cm4D5F5l0rtRVqoDLKtlLS5TtKUOZuI4mqvG46oBY1EIOQpeBE9a1AdLOayd9x3OpE2J4s0BwL7EBE27TN5YZx8iJbqTEjgqLyhkHzLcJjO9jqZqbHdgAgR2WFvH8yG4DGR/leF8TFIdACjlSqdmniOq5aENtaczlZ8BF7HerAz8Z7bPuzGrjiVQ3xQUXs3ud/ij4xIVFjNQ0I11d3alYUk9IyAYzc2Fj7Y5WegC0z0T3CtmiLMQQkcj/m3w/h5HM/rwzxsgibJ8jWInag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRnAzLKywpcvGou0pCFal1rZj/JbYBpIrjuRpvLBlFM=;
 b=DdlUZmYb/hYph4oGo66HBkETf3Cli/FN3yCxQiulgUHSliFSrm0iIrYWlcpgUJVTbaQEdqF9KD70kzidEYysDCTMFy9M4i6FvW650gR9WaPwud1qkCVuV3UEJmP2Wyh2BQ6n2unLnWa4ZvEUvhUqWHtnfbJkGbaYf9PxzBqCMvAbwvHP9wssQG3NrwNKDRapYI4BrQy8SGqGUCglq8A51Vxbqy2OAuzQGsgpR015Tf5NOfPzJtX3pVkII7XV/czd/CsOqIkmLYE36LxjK+rPgNtOdm/kr/dAUkIDXw+e4HWeemSa604R3TQsRc+6R592/gVgqK1ZQg+sfLf1p0137A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRnAzLKywpcvGou0pCFal1rZj/JbYBpIrjuRpvLBlFM=;
 b=GjEGcV7nnthqZb+l3EodvpOgBfY7GABSBhj7sKWcL9Gqtkx40aR74u0QgpLCaupgRGTU4CC3d+5HNqeq2GOvntG8gdCkLKSwtZK7rIEPVUhcZRmoR44PgtuYnAZGD2xb0lKgT236SnySWCKwT80pUpL9zN0umFT35YrmrFBST0o=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DS4PPF67D158296.namprd10.prod.outlook.com (2603:10b6:f:fc00::d23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 20 Apr
 2025 19:37:49 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 19:37:49 +0000
Message-ID: <06a94366-cc81-4127-9edc-501e696301b0@oracle.com>
Date: Mon, 21 Apr 2025 01:07:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v5 2/3] :i3c: master: Add Qualcomm I3C
 controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
References: <20250420081530.2708238-1-quic_msavaliy@quicinc.com>
 <20250420081530.2708238-3-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250420081530.2708238-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DS4PPF67D158296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8d2917-84d8-420e-4310-08dd8042d538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWRSZDhENnluZUI3b1BPN3RnY1hCenlEUnFySVBvbUt0NjNxa25ONGgybmZ4?=
 =?utf-8?B?UFZFcmhxK0t4YzBFcUIrQ2YxTjJ6NFZmZ0RDc3pubG1pOUVpbk15emtsN1dj?=
 =?utf-8?B?eGFDalM5REpPYjlxWE5lU0oyL2FoYkh1MUhjVm9nR2lXMU01eUhDMzZsMjhu?=
 =?utf-8?B?SDNoYm9NWU1YQVlLRS95MGdJVWwzd0FiZ25mbW8vTEZpZjZqTVRaamk2RHJk?=
 =?utf-8?B?RklXZXpBakUrMTZQU2pacmhJcTZzKzlhZ0N1d2thR2RIZkVXNWkvNHozVndo?=
 =?utf-8?B?YUg2TmtCNVZjSVNNbEg4ZXNrRGpsVUNiSko2N3lJeGtkd2VnUHp3OUdCOXlZ?=
 =?utf-8?B?YXRQTzJMT3JxeDlqNkdwbG8ycUxBamhwL1ptcEFsTmkyQ1FwZmszcXdQekQr?=
 =?utf-8?B?eW5wTXVTdzJJTFdJcFNCYkZpT09NYjVMaW9Gc0NWZW0yZXN1bTdZQWYyMHE3?=
 =?utf-8?B?Ukw5Y0o2NUVnd0IwRUt4TzVNaFJNcE9QTlR0bFRURUVjb1REZXZ3bHp4Z3Ba?=
 =?utf-8?B?RFV4N1FDUmxKdUIxbGNYdHJSOFZvZit1cXBIMFI1anlBaXMrUWJtd1BSQmRq?=
 =?utf-8?B?bk9ESzRzbzdwRkx0Q3BiL0RqV1pTTGVjWmUwZGs4WDBVSmJJN0x1bXBKOVYr?=
 =?utf-8?B?dTZsSWNGZzRKeGtPTCs2V1VyVDYxRWxscWFEalVadjlvMlVvVXIxN2lSelNN?=
 =?utf-8?B?dWlmQWVHcTIyNmluUEo1b3dvN0hTemhxb0d3Z09tZXZkcHVEMGJVMDJaNkU1?=
 =?utf-8?B?dkVxUFVNZWVyTDhCa3ZNaVBrMStobzRLQlY3WmppcG85OWxBS0xCbzRCYXk1?=
 =?utf-8?B?a0JCZjg1Y044NkRobHdWNmQ5M2RVWTRHck1OanhNdWhROGk4bE5JSVhwQ3E0?=
 =?utf-8?B?S05SMkpBNHYvaE43ajVnNVAydkNVVTdqVnUyZjRwRHZpRUxlWVdFcjd6Zkt0?=
 =?utf-8?B?QXk5WFFpMVkyVjJiMlNERUhqdUIzYzJuNW1nRExRYTJCSTNUZitJUDFrY3Rx?=
 =?utf-8?B?cjZsbEpKdW01SEZ0cDNXbDBhKzIvbXhMVTdOaWl6RVFQMExiUmFhanAwd2xx?=
 =?utf-8?B?MzgxYUxCZVkxb0hEb004WUwyS1c5U3Q3bDlVN1FnSW45TzZ2d1YzMTkwRFlX?=
 =?utf-8?B?WmVFOWRsU2FzRHErNkpqUnk5VDd1cTNra3lwdVFwS3hpamlFT0czMnlPYUpL?=
 =?utf-8?B?bEU4dUE3YUVHNXIySjk4V2J1WVYvUXE3a3VnRGsyRERjYy9ieUJCUGVaVzdx?=
 =?utf-8?B?TGNTeHRHQVo4UlBueFdGSk1ieUlQRXgxbjh4N1JkTzYrQTdSYkZ3MjV5SjlJ?=
 =?utf-8?B?bytxVWx5OS9oUGh1ZzMzRHN5eDVmeHlpRUt4ck1QVWtHL0pKNS9FRDNwT1Bh?=
 =?utf-8?B?QVFqWWZYUVVvRUV1UjJNVVRlMlJRRkttNm8wMGdYYnRRQlRZOHpTY3pMNDRi?=
 =?utf-8?B?TDg4SVhiYjh0R1MvVlN3WUcwcWxSRlcrQ1d4bXo5VTJ6S2FJQkw2M1VDY3Rq?=
 =?utf-8?B?eE03d3lnMytHTHZRbHV0RlFZT1hTVmQvd2tNT1laZllWZzU2QzZKNWQxMW94?=
 =?utf-8?B?RXYrRVZpNy9CcVpxQi9ia1Z2d1NYTGFOUWI3aDNLdGFOOHlPQnRUYUJheHBV?=
 =?utf-8?B?cTg2WXRLV01pNEI1K0c5QmxqT3ErcmNOWlNKSldMQStSV0RyZm1Ca2ZsZVNI?=
 =?utf-8?B?TjdEUE93QngyQms2Z2Z2RjZaWkI2RVM1M3U2QWF1c3dEWkJJRGExR0VKVnhH?=
 =?utf-8?B?anAwUHNuWnZIN1hHM1dETUVVTUo2aURMMmRpMzI1b1ZoNU41aXhGK2IrKzNp?=
 =?utf-8?B?TWdMYkxvMTVvRnUxNUMyZTlGNHIxTWZjTHdSOG5YcVdUVjdPdE1VSHpDZ0pX?=
 =?utf-8?B?TEpWUHgxT005YTZyRk50dG84TnpNb2haMUZ6ckdlTEY4MXEyZGFIWldvazhx?=
 =?utf-8?B?WjVhZGwwQW01UVpFUzhjWmJaMG0xV0RWbEFkOFRHc0ZmanVwMjV5Tm9NVnBp?=
 =?utf-8?B?NWRjZ2MyVVJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUc0VmtCOEw1MFRzZktIczVPYjJ1K25sam5sQ3gvQm96YjV2enNyYm5JRHA3?=
 =?utf-8?B?UDN0d2pqa2UwUjhpb0MxcmQwMkgzWVpzbmlEVCtVT1R4VzVXQVBIenVkS2dZ?=
 =?utf-8?B?RkNsZ1E2SVB1K3R1N1NEbmRydE1CWGRrMFhSaXQra1Q5Vjd5U1RZYmMrRDFY?=
 =?utf-8?B?U3hSYVFnd1JvbnFZREo5NjZ1WUtQNlJiZlNBbE5tOG1RMzhEaUlCUDdRWVVv?=
 =?utf-8?B?ajhnU2toNTgrZk0rRSs1bDFNUndFYXRpRXpQYjB6QVlxSk5OUXl2OTdwRElj?=
 =?utf-8?B?cFd6MGswaVZpSzVQV2hlYWwxUTJoT0E5c0ZCWWRleWFBcmFGb3J5U0YxWVls?=
 =?utf-8?B?VnRMeEsrOE5mUlZ6WHcrUFJ6ZGRkL213S2ZZQkp2NWk5RWc4Wm40VGd1ejZK?=
 =?utf-8?B?bThPYUxxbzU1WE9TSXBqTnpUQ2I1UmdWbnlvMnE1aFhqRWlhTko3TmF1dmUr?=
 =?utf-8?B?S05hcFA3TXZVYTVjSEZlZDY0dXBOc0lwZVNlRzBobjYzN3JKL3Y0N09mL3ZR?=
 =?utf-8?B?SmNHT2xPVDcxNTBLb2lDTkU4ZTcvWW1UdzFES2FoRUhmNjVZcGRvbTRJOEsw?=
 =?utf-8?B?V04ybGZrTTVtNE8wTktrbzlhc2M5SFRVbm5INXowN3ZlTE4rMUpocmRibE5S?=
 =?utf-8?B?aG1HMUY0WVlXdVJrS0RiMUtYRzltSG9sSUtCOUJKN1lpQlJtY1Y1STE3Zmly?=
 =?utf-8?B?bzdZOVUxWUZTeXBJWStGUjVQWnl3aWZsMjVKSGJ2R29XY2M1K3laczQzNmFh?=
 =?utf-8?B?dVI5dVdjTkJkUklLZXhCM3BYbENDaDkrODhVSTFMVWJjVUVlWlhQSm5yNmgy?=
 =?utf-8?B?WmxLM2VBZm5aOGh4bmpzNlozcUQrRVd2VnBsQmI3Tyt5ZHhEOXJRT3JGbG02?=
 =?utf-8?B?ZyttNEM0UitpSWhFUThqdk1tTUkyVGgrcmZnNlVhQ095Z25KbVZlU2VrRnhm?=
 =?utf-8?B?SDh1NDlnZjkvSHRMOFR2NkFpUlBhVU5ESjRRb3FRSXFCSnBYQUhyMUtVUStV?=
 =?utf-8?B?QmtjZjgvNEprY2hBemdtNC9ERTFTTFNIZ1ZNbGNHa3ZOVUhvNndxQmtBREdH?=
 =?utf-8?B?aWRLc1VLSjBhQW43cURGY1JRN3YwRVZsd1p3TlFia0tjcWo1cjJoYmxyS0ZZ?=
 =?utf-8?B?QmpGRW5FZ2dzMDVidi81K3dmWmJlVnZ0TkF6OW1XOC9mN2ZQMWEzeWFJZVJE?=
 =?utf-8?B?UjVMTVVrZVQ4dHAyb1dVY0UzS1dFMWY1alpFa1pRYlFqRkNDd0I2RHVZc3JZ?=
 =?utf-8?B?cG5lTDVobStyK2ZNNUttT01EdEx0S0dVdm9ZMXVKcFUrSzg0V3YvTlR5VFA0?=
 =?utf-8?B?cGdVd1dZUjBzSmJGeUMxaER6UmpEREhxakhtVWxLVkhIU2FUblZjS2JBMktm?=
 =?utf-8?B?bmhwQ0huRFphYlg5bFZCSjVhdzd2aVlMOWJDZUgvRDZPaWtGditLRVJhdkli?=
 =?utf-8?B?a0FNYXhLSDhmRHV2Z1dwWnVuckI4L0FBMGlVVWpwd1BjK1pockI4MFl6MDhO?=
 =?utf-8?B?elIxRXNlSllPZUpBOG50L2VlRnIyR0JwemYxQ1A2ckIwT3ZmTzhaUUdOZmRX?=
 =?utf-8?B?L3NISm5UUTRJREswWU1YVHVyNFZmbVhGTFUxL3RKVTMxNWRUT0llUnpHNUdi?=
 =?utf-8?B?OXJtSnVGWk1ReEc2Y3d3WUVSRDlkUmJ5S3NUSC9WcU92TUJrMnAzeEtaVUYx?=
 =?utf-8?B?NVAvUTVPbnFLT3hTdVJpMUluQ053VVJLLy9qdVNWdEs1VCt3cm9GaEQ4SFpW?=
 =?utf-8?B?VTVXUW00NkhmVE5TVWJuQWRrbDl1b2t6S3k4Wlh2N1luWWJ0d010cUo5Ymxt?=
 =?utf-8?B?bDNLT25zUFlLQ0QvZEFiTG1PZTRaK3VTK2VqcmRvbjFPN1pYSjRtckNVQzRV?=
 =?utf-8?B?MTZTSmh4VXhqcFVMOFcxRkRsZTNzWXNLeUxzRU1uOU5VS0dEbHFwUXRWbHRq?=
 =?utf-8?B?NXJRWmNKQVFScktvaWVyTGZTZlZtSFNwQTNsOTRLRmszUXhPY2E0bXdoa2VZ?=
 =?utf-8?B?SllxbzhDMmpYV2xsN21ZUXpHRXVGVDFweGVwUmxrY2FNQjBQWE1XWWpxVjQw?=
 =?utf-8?B?WXJBR2FUYVMzRkJtc1NVTzNsZXhDTmd6ZHlVeEM3bE9iUld4Z0NMdHZLOFVz?=
 =?utf-8?B?NEVjUVpoeUNjUEtxTGw4eFh6cjZVVE95R3NtOUordEFZOUxBbkZrTkM1M1l1?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/fl8Dyf4dWwbk38wM0io+Ks+7jtQbCoQIAwHRL2s0LQOzfDmmNfVzjjsWSyosRfbrlvg7gbJQyvhfssC61LAQsaNtvTjY2DzGpVevclrjXE2GpurbVgalI0LIYwgclr3GRnnL4wm5pOGiMjHHsZgvVxgM92ErWFZQpA7/BBdoeDKNc1setpT9itazYprtKTp5h+6ApJaYdf6g87U2n4HTV2TAYvoiGVDYTWypYBAIDZU+yX6QtgE4FzL+vsKZURzAF669xja4AVhIq3mlML6RMDvkcAV56cIAtTSBZLE5OK32NoJd5D7aMj+TIeB63fUR0M8CLa1aoemufisSzncjJvPYDVJKGKpfsFZBrK1VaHFLMviKwg0pUS5fmKvf7KHdGuxoF2MZBUjq6TNre1hkT2TghXrx1sMWXeCXKXD24WV609bHqhAhwwjJyRBbdQA7uJs1M+df6dmZrzQexHBBwMoBkqmgnuRqwVZrxfCCVc42zaxnF36kZO/u1spXeeyMnIhK+rB2x734Ofg7y76PDic7nZH+D45w71knR49uPQf1xw5kY3Pzr0ZYkHy1zCgZbVJKl2K29Xb9pmwra45XPe5cw2aBeEYegUhhKlfwY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8d2917-84d8-420e-4310-08dd8042d538
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 19:37:49.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3A8yv+FqdNnoMyFQIPegn+BSAjFGTYFU1u9hY5ks8WvrUWmpRQqDVBkQNiIKhfcEjdf5fqpMPWRP8hlHdeYFnpkn4Vp1vVkeos8SHlcdvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF67D158296
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504200161
X-Proofpoint-ORIG-GUID: y6uKOeBmz3r3MoifRYVshjf0RvjqMO-c
X-Proofpoint-GUID: y6uKOeBmz3r3MoifRYVshjf0RvjqMO-c

Hi Mukesh,

On 20-04-2025 13:45, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
[clip]
> +};
> +
> +/*
> + * Hardware uses the underlying formula to calculate time periods of
> + * SCL clock cycle. Firmware uses some additional cycles excluded from the
> + * below formula and it is confirmed that the time periods are within
> + * specification limits.
> + *
> + * time of high period of I2C SCL:
> + *         i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
> + * time of low period of I2C SCL:
> + *         i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
> + * time of full period of I2C SCL:
> + *         i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
> + * time of high period of I3C SCL:
> + *         i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
> + * time of full period of I3C SCL:
> + *         i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
> + * clk_freq_out = t / t_cycle
> + */

Here is a polished version, if you'd like. Otherwise, feel free to ignore it
/*
  * The hardware uses the following formulas to calculate the time periods
  * of the SCL clock cycle. The firmware adds a few extra cycles that 
are not
  * included in the formulas below. It has been verified that the resulting
  * timings remain within the I2C/I3C specification limits.
  *
  * I2C SCL high period:
  *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
  *
  * I2C SCL low period:
  *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
  *
  * I2C SCL full cycle:
  *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
  *
  * I3C SCL high period:
  *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
  *
  * I3C SCL full cycle:
  *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
  *
  * Output clock frequency:
  *     clk_freq_out = t / t_cycle
  */

> +static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
> +	{
> +		.clk_freq_out = 100 * HZ_PER_KHZ,
> +		.clk_src_freq = 19200 * HZ_PER_KHZ,
> +		.clk_div = 1,
> +		.i2c_t_high_cnt = 76,
> +		.i2c_t_low_cnt = 90,
> +		.i3c_t_high_cnt = 7,
> +		.i3c_t_cycle_cnt = 8,
> +		.i2c_t_cycle_cnt = 192,
> +	},
[clip]
> +
> +static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
> +					 struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_is_write = false;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;

a '\n' before return

> +	return _i3c_geni_execute_command(gi3c, xfer);
> +}
> +
> +static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
> +					  struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
> +{
> +	gi3c->cur_is_write = true;
> +	gi3c->cur_buf = buf;
> +	gi3c->cur_len = len;

a '\n' before return

> +	return _i3c_geni_execute_command(gi3c, xfer);
> +}
> +
> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
> +{
> +	u8 last_dyn_addr = 0;
> +	int ret;
> +
> +	while (1) {
> +		u8 rx_buf[8], tx_buf[8];
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +		struct i3c_device_info info = { 0 };
> +		struct i3c_dev_desc *i3cdev;
> +		bool new_device = true;
> +		u64 pid;
> +		u8 bcr, dcr, addr;
> +
> +		xfer.m_cmd = I2C_READ;
> +		xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
> +		ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
> +		if (ret)
> +			break;
> +
> +		dcr = FIELD_PREP(GENMASK(7, 0), rx_buf[7]);
> +		bcr = FIELD_PREP(GENMASK(7, 0), rx_buf[6]);
> +		pid = FIELD_PREP(GENMASK(47, 40), (u64)rx_buf[0]) |
> +			FIELD_PREP(GENMASK(39, 32), (u64)rx_buf[1]) |
> +			FIELD_PREP(GENMASK(31, 24), (u64)rx_buf[2]) |
> +			FIELD_PREP(GENMASK(23, 16), (u64)rx_buf[3]) |
> +			FIELD_PREP(GENMASK(15, 8), (u64)rx_buf[4]) |
> +			FIELD_PREP(GENMASK(7, 0), (u64)rx_buf[5]);
> +
> +		i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
> +			i3c_device_get_info(i3cdev->dev, &info);
> +			if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
> +				new_device = false;
> +				addr = info.dyn_addr ? : info.static_addr;
> +				break;
> +			}
> +		}
> +
> +		if (new_device) {
> +			ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
> +			if (ret < 0)
> +				break;
> +			addr = (u8)ret;
> +			last_dyn_addr = addr;
> +			set_new_addr_slot(gi3c->newaddrslots, addr);
> +		}
> +
> +		/* Set Parity bit at BIT(7) */
> +		tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
> +		tx_buf[0] |= parity8(addr & I3C_ADDR_MASK);
> +
> +		xfer.m_cmd = I2C_WRITE;
> +		xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
> +
> +		ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
> +		if (ret)
> +			break;
> +	}
> +}
> +
> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> +					struct i3c_ccc_cmd *cmd)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	int i, ret;
> +
> +	if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
> +		return -EINVAL;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +	for (i = 0; i < cmd->ndests; i++) {
> +		int stall = (i < (cmd->ndests - 1)) ||
> +			(cmd->id == I3C_CCC_ENTDAA);
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +
> +		xfer.m_param  = (stall ? STOP_STRETCH : 0);

remove extra ' ' before =

> +		xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
> +		xfer.m_param |= IBI_NACK_TBL_CTRL;
> +		if (cmd->id & I3C_CCC_DIRECT) {
> +			xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, cmd->dests[i].addr);
> +			if (cmd->rnw) {
> +				if (i == 0)
> +					xfer.m_cmd = I3C_DIRECT_CCC_READ;
> +				else
> +					xfer.m_cmd = I3C_PRIVATE_READ;
> +			} else {
> +				if (i == 0)
> +					xfer.m_cmd =
> +					   (cmd->dests[i].payload.len > 0) ?
> +						I3C_DIRECT_CCC_WRITE :
> +						I3C_DIRECT_CCC_ADDR_ONLY;
> +				else
> +					xfer.m_cmd = I3C_PRIVATE_WRITE;
> +			}
> +		} else {
> +			if (cmd->dests[i].payload.len > 0)
> +				xfer.m_cmd = I3C_BCAST_CCC_WRITE;
> +			else
> +				xfer.m_cmd = I3C_BCAST_CCC_ADDR_ONLY;
> +		}
> +
> +		if (i == 0)
> +			xfer.m_param |= USE_7E;
> +
> +		if (cmd->rnw)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer,
> +							    cmd->dests[i].payload.data,
> +							    cmd->dests[i].payload.len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer,
> +							     cmd->dests[i].payload.data,
> +							     cmd->dests[i].payload.len);
> +		if (ret)
> +			break;
> +
> +		if (cmd->id == I3C_CCC_ENTDAA)
> +			geni_i3c_perform_daa(gi3c);
> +	}
> +
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);

a '\n' before return

> +	return ret;
> +}
> +
> +static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> +				      int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	bool use_7e = false;
> +	int i, ret;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +	for (i = 0; i < nxfers; i++) {
> +		bool stall = (i < (nxfers - 1));
> +		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
> +
> +		xfer.m_param  = (stall ? STOP_STRETCH : 0);

remove extra ' ' before =

> +		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
> +		xfer.m_param |= (use_7e) ? USE_7E : 0;
> +
> +		/* use_7e = true only for last transfer */
> +		use_7e = (i == nxfers - 1);
> +
> +		if (xfers[i].rnw) {
> +			xfer.m_cmd = I3C_PRIVATE_READ;
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, (u8 *)xfers[i].data.in,
> +							    xfers[i].len);
> +		} else {
> +			xfer.m_cmd = I3C_PRIVATE_WRITE;
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, (u8 *)xfers[i].data.out,
> +							     xfers[i].len);
> +		}
> +
> +		if (ret)
> +			break;
> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i3c priv: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);

a '\n' before return

> +	return ret;
> +}
> +
> +static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct i2c_msg *msgs, int num)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	int i, ret;
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
> +
> +	for (i = 0; i < num; i++) {
> +		struct geni_i3c_xfer_params xfer;
> +
> +		xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
> +		xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
> +		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
> +		xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;

remove extra ' ' before =

> +		if (msgs[i].flags & I2C_M_RD)
> +			ret = i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		else
> +			ret = i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
> +		if (ret)
> +			break;
> +	}
> +
> +	dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);

a '\n' before return

> +	return ret;
> +}
> +
> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_dev_set_master_data(dev, data);

a '\n' before return

> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i3c_dev_set_master_data(dev, data);

a '\n' before return

> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	u8 addr;
> +	int ret;
> +
> +	ret = i3c_master_entdaa_locked(m);
> +	if (ret && ret != I3C_ERROR_M2)
> +		return ret;
> +
> +	for (addr = 0; addr <= I3C_ADDR_MASK; addr++) {
> +		if (is_new_addr_slot_set(gi3c->newaddrslots, addr)) {
> +			clear_new_addr_slot(gi3c->newaddrslots, addr);
> +			i3c_master_add_i3c_dev_locked(m, addr);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	/* Get an address for the master. */
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", __func__, ret);
> +
> +	info.dyn_addr = ret;
> +	info.dcr = I3C_DCR_GENERIC_DEVICE;
> +	info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
> +	info.pid = 0;
> +
> +	ret = geni_i3c_clk_map_idx(gi3c);
> +	if (ret) {
> +		dev_err(gi3c->se.dev,
> +			"Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
> +			gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
> +		return ret; //This was missed in upstream : TBD
> +	}
> +
> +	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
> +	if (ret)
> +		return ret;
> +
> +	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
> +
> +	ret = i3c_master_set_info(&gi3c->ctrlr, &info);
> +	i3c_geni_runtime_put_mutex_unlock(gi3c);

a '\n' before return

> +	return ret;
> +}
> +
> +static bool geni_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> +					     const struct i3c_ccc_cmd *cmd)
> +{
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +		fallthrough;
> +	case I3C_CCC_ENEC(false):
> +		fallthrough;
> +	case I3C_CCC_DISEC(true):
> +		fallthrough;
> +	case I3C_CCC_DISEC(false):
> +		fallthrough;
> +	case I3C_CCC_ENTAS(0, true):
> +		fallthrough;
> +	case I3C_CCC_ENTAS(0, false):
> +		fallthrough;
> +	case I3C_CCC_RSTDAA(true):
> +		fallthrough;
> +	case I3C_CCC_RSTDAA(false):
> +		fallthrough;
> +	case I3C_CCC_ENTDAA:
> +		fallthrough;
> +	case I3C_CCC_SETMWL(true):
> +		fallthrough;
> +	case I3C_CCC_SETMWL(false):
> +		fallthrough;
> +	case I3C_CCC_SETMRL(true):
> +		fallthrough;
> +	case I3C_CCC_SETMRL(false):
> +		fallthrough;
> +	case I3C_CCC_DEFSLVS:
> +		fallthrough;
> +	case I3C_CCC_SETDASA:
> +		fallthrough;
> +	case I3C_CCC_SETNEWDA:
> +		fallthrough;
> +	case I3C_CCC_GETMWL:
> +		fallthrough;
> +	case I3C_CCC_GETMRL:
> +		fallthrough;
> +	case I3C_CCC_GETPID:
> +		fallthrough;
> +	case I3C_CCC_GETBCR:
> +		fallthrough;
> +	case I3C_CCC_GETDCR:
> +		fallthrough;
> +	case I3C_CCC_GETSTATUS:
> +		fallthrough;
> +	case I3C_CCC_GETACCMST:
> +		fallthrough;
> +	case I3C_CCC_GETMXDS:
> +		fallthrough;
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +
> +	default:
> +		return false;
> +	}
> +}
> +
[clip]
> +
> +static int geni_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
> +
> +	disable_irq(gi3c->irq);
> +	geni_se_resources_off(&gi3c->se);

a '\n' before return

> +	return 0;
> +}
> +
> +static int geni_i3c_runtime_resume(struct device *dev)
> +{
> +	int ret;
> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
> +
> +	ret = geni_se_resources_on(&gi3c->se);
> +	if (ret)
> +		return ret;
> +	enable_irq(gi3c->irq);

a '\n' before return

> +	return 0;
> +}
> +
> +static const struct dev_pm_ops geni_i3c_pm_ops = {
> +	SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, geni_i3c_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id geni_i3c_dt_match[] = {
> +	{ .compatible = "qcom,geni-i3c" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
> +
> +static struct platform_driver geni_i3c_master = {
> +	.probe  = geni_i3c_probe,

remove extra ' ' before =

> +	.remove = geni_i3c_remove,
> +	.driver = {
> +		.name = "geni_i3c",
> +		.pm = &geni_i3c_pm_ops,
> +		.of_match_table = geni_i3c_dt_match,
> +	},
> +};
> +
> +module_platform_driver(geni_i3c_master);
> +
> +MODULE_AUTHOR("Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>");
> +MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based QUP cores");
> +MODULE_LICENSE("GPL");


Thanks,
Alok

