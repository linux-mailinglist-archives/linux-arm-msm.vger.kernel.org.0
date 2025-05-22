Return-Path: <linux-arm-msm+bounces-59058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7C6AC0E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F88C1BA8793
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4EE28D8E5;
	Thu, 22 May 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="r3mnUFBi";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="uHvdOHYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541628D8CA;
	Thu, 22 May 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924558; cv=fail; b=GL8e4WCLhXyuttSb1rTL2NqtF1z5+hGTZnHaYu+q0ffYiw8ehWakXzOoaNilGpZUjX4dkVSOFiMUtXuolce6XdmlM2ZSTXN4ZDxbEpPNO04LwO+i+lYAwC8rKIkuYS37T0t2w/o1kUGr+iA0dqR9GiwuA7Y35zr8Ye42xw5Js2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924558; c=relaxed/simple;
	bh=MJJfZ1D89BREGuS7ilgG57thcnHEDwvBPxBbLFUecJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7gPx0+r2BIdrNp8wyE7mFEmm4WNrNlFgeEaIP79ia3msIp+7NzmNNSwz4gX443u4OgMP7vI8f7o0C/vF2iGuRh08K6HggVgOYnWWVC65wFq4O9Filb1EvV0/dg/LCU6n5EQVRTNoS8A4FGT7z1WTniwW8pyW/rINsf4eQDJF6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=r3mnUFBi; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=uHvdOHYz; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4j0Hv024668;
	Thu, 22 May 2025 16:35:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	h6CmerF+c7J1rsc5/xLiIYfroTBExyhCZ6eT3pfZEA0=; b=r3mnUFBiqMr0Pn1J
	97EGkeusTQi602ow/Nl4gnbeORF07Fi3FoJleqk73sT7ODrRhyn2DJsFjYnFR15u
	6iWlZ8UbD4fPIjdXyvS4m+tXNfGctFsDW6/Hh3VGI+QB0XTE2myx09WkpNqN4Dx9
	/wQ0g23krlp/K9eVPTr2PENYxWF3svBca3mQdI+7BEnrMnpKOERlh7szPSd4IkBW
	R8K9W4jrBPnIoIlKvisSCnF9e7UB/h/RZE45o4FZEGVyNCLizdGUmvIOfJq0xd1e
	vyLT+cBNNItoXtDn5PhAA+2pu45+t6A3e38yo56RMCfHyQCHNFROIo/Gcs3JTE+R
	x10lWg==
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3ju5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 16:35:39 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYj6QtTO9G7a/KEEieGP0SseQr3QlJoXX0jIsWrfi7XGLqOtZdONDpnHaL6yie1m2eX47C3wtqCt2i6jNG277iT35ZnIacurygsL8Gv7vwEvgJhYYYv68dMNe6vBTNDYgMHux1yhUtz5Pz9gzSpatlRh780HkwoIzFxrE3HX5BlNFoASa8fvwoXkfL+Yrd4ZKGcrqsJJxHIgaEebEhondyCWWhVUnHKuldYVZy5EioxBfAuqiECb99d/ik6NoI5gOaH4CfEHcA8i1InAxORNOcnW0nWtxclUH5KqVeXAEttyXHGCaXq2r/T7rJZ6Ky++4aTAQ3K6Xwe+wLEcL3meXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6CmerF+c7J1rsc5/xLiIYfroTBExyhCZ6eT3pfZEA0=;
 b=hxUWeJzmvBX27yb0Mf7U0G9Nul292yF9jb/aGjNNcBq4ToAXwTtJd4ELKKqyC7qyakrWcJQSIKzHumQkJd5FvvQ7xxo3giHbqM7rJqCxGGj8r7hBdok8MNclOD0hTrqwER2ZG7sBfBkuDSppLs4iJNHJKYCL7Enn9gCORgRtvfc8sdNPZ0kPTbRkRDAF0ghGraJEPdSMfyvN7Xkjfn3JEEqtb1rbdoi61tNU+rknYjhcDO/QAg3i2vDVV6h5KmBQvmtOIKEJk4m94lhQXXGPQ6SBfYNhNEgTefNtVWUC0y5f89HHt8qCJ5QMKoi60N4Vpw0nQ0xcBdo2Ew+5t0d26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6CmerF+c7J1rsc5/xLiIYfroTBExyhCZ6eT3pfZEA0=;
 b=uHvdOHYzk0ktK2vkM2M6bffCpg2F3Ko4JmdYuTyJQFZLKIL4dEmXUY0uuMm6YS90lAKStH3pleULzNPAl7jAmXT0i1h1/EcQEKSMMnBDvKsHisK0gjH8SkYQCqoJVuwIYSCly9XNy4byQyvoQI4Edr1EurWBOm9eQEmllPnTWqA=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by PR3P192MB0682.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 14:35:38 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 14:35:38 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] soc: qcom: QMI encoding/decoding for big endian
Date: Thu, 22 May 2025 16:35:29 +0200
Message-Id: <20250522143530.3623809-2-alexander.wilhelm@westermo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000756F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3f2) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|PR3P192MB0682:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e6c7d2-3270-4147-cf8c-08dd993deb57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r9RBUCDayITzkPcEo9MkcMdL9O0ZPGnhpdMRKvmZYt1IiBzq5PaEg1pcUGKc?=
 =?us-ascii?Q?4n5drW4kiPyiBxeuAjCd3C/RMKF+iPerm7r0qhAb7tRX30tNF0R3rAKrBs2p?=
 =?us-ascii?Q?3x6ZhAOoKSumjYrTa183DFFNMQVefsEsKWnJhQIKpSkLQBcpWTlNzdUf+glf?=
 =?us-ascii?Q?xSj7k1gywoP4i4s7pwIw4+hSFup0jlLbVQR3iJqgUwq/rnAjYZ/obZwa9nyd?=
 =?us-ascii?Q?RsJ+R/0O2O3muiU7xjeZ7qBReXLE/fdlor3bpqDLl+BP1qkf0LwaaXSADUnV?=
 =?us-ascii?Q?N6RBIKzRPeIjAtyeK0yG4ttbn0o/BFgGo+jVwMd/9g7zNqs1LR9bX3yoHtxR?=
 =?us-ascii?Q?TQseWXxsuUcpNpHOl9suIIHsZCQEblkw1lLpqLR1fIrs+8AtyS3/f19N6H20?=
 =?us-ascii?Q?DH0k5vKsFz/S/ZZ59kpewtcytrkCL6fkvzZDBHwTecgoJmyxoTYyxfjoLbut?=
 =?us-ascii?Q?haTGefAu+BTQb8UvqkMHWefCTvDqnXuXqnEOJ9ZeU7/2XCxxjXHUc6wdaXmQ?=
 =?us-ascii?Q?q9KtQcd+PbgffYiO8DZol3mQholJspefm22I8WF1diHFEgwPmw5y5xIqjVMv?=
 =?us-ascii?Q?rG/UGYsuKWHzssOW6C39cIL5Kfvw+Ox9ElixHFnioHaYTmEAQes1MYz2EK+Q?=
 =?us-ascii?Q?HTV3AJV9Fd+QRRukZ6Duo3F2Asd8oWfAlEXbEWHM72t+G4eHDS70dH72eF0Q?=
 =?us-ascii?Q?Hk8SU5Oeil7whaYi6KDEQVd9H4bhsc6Wv27ibZgwyjDi/4im9GAb+4T/vdgS?=
 =?us-ascii?Q?AodLHNXSoqyV2WCDKqr5PL5dINfeAdcckNkskqr/jB3WA/fmqIuMLEzwziXI?=
 =?us-ascii?Q?fZ0cNESEWA9JMSTxjqtuaLyxcMvlG2jTTOe+LCwxQb+qkGkPYUJfhIr9CgsN?=
 =?us-ascii?Q?j/QmGPUtAWgzZBm/nieyrHS9o3gaSdk0KpGLIaoAfJQBDrL55De7OcxvkuFm?=
 =?us-ascii?Q?8xKj65uKlj3W0DI+WpFJLqkfqtDnNkrbz8HF+kjgoJhYJGZbfdJesEjsSYNi?=
 =?us-ascii?Q?LAh2fzm4cqVonU5h0jNCdSLfZZrzzmbUfHbz80J/WWSb/cw/8MkOK41eEH2T?=
 =?us-ascii?Q?a7ZpQDG7enx605BzlKQc849aCcbjhi7vEqPJorxcL/Si+uWPFpnRZubstiuC?=
 =?us-ascii?Q?PB1lbmA8TTdhVvjtbhjpchJiMxKiUR8kPBdTMBhgmvK0xHqPEKjNC4AJrzh8?=
 =?us-ascii?Q?zjRCm8E1Opwys7RF0TBFLQeP4RRbReZQlrbvaTTUkOYbGCyXOp87ZZ1V0OY8?=
 =?us-ascii?Q?6mNCkcUak7LpgXhDa1UtxpWg2h8rCzMs2uArBmpCyKYFIm0JS0NMjAehBn8G?=
 =?us-ascii?Q?3+2o/mTaCtku6pRO15LBm9cLVtRftuSaPH7Ntlmx46gVYjo2vzb0Sn4KfiJp?=
 =?us-ascii?Q?jHyZ96zmsvY+5J3q3EutmwCqoHB5eX389KysGK6hYxLYoUe+wAtzGpsMbkJO?=
 =?us-ascii?Q?Gljw64UD6kw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yW/pASJ9DD63b3UV4VMEuPXOpEsFqxKWHKRNclgHaHxtWKfRfyiWDqPe4S6/?=
 =?us-ascii?Q?PC//jzre5i8Uv1nq2SlnKRajUBCJb4MBpzrY3UEAfF79qzZshXYRdK51wi6z?=
 =?us-ascii?Q?fDLQUV249rOsKmdlpd5D69x+Bhv8uEvsE4X6uPkxhegiA67ti57gBiejM/0f?=
 =?us-ascii?Q?yM57ScP9sPEuumf1DOYmSMFDgKWyKQKZlystrN2kKKFk+ZicdCY+egulOnpn?=
 =?us-ascii?Q?ieDrJI32vl3os6eRwCkBEMIX3DEAEAkotXk4iYbyPYHX6Cpnc8dv04c+iCRf?=
 =?us-ascii?Q?8ZqG5xxdkj8T8Yz0QKw+ZFym3r1TyYVhQrOjYyfDqAFAlh2kmEBsrtpVCvl0?=
 =?us-ascii?Q?lp430IndZHtQc/WgBzKWe+T/78L9oQGe+7YCHzCKk3pW2eP35vz67WqZi/d2?=
 =?us-ascii?Q?c4v5S7nlwky/FW/f6oIqx+uyxQRr1IFy9C2KDFKQdMu9TjbjAP8snrx7h4qw?=
 =?us-ascii?Q?A7upCe2L0LLihEwFohpo7tQ8JZhHmny5zbEv2Y0UKMBe20fCk7zOSefOt5wg?=
 =?us-ascii?Q?aJMwn7xZTFrB97EbDGzAPaPGhJsVWXbEmyRkyKn3RhB6U30cM9QZJ1yiC1Jl?=
 =?us-ascii?Q?v8EtKJ3HVgCbRAhHyTnfjfhvQQS79cWClsLDEa0fSaVt5y0AoMxWGZO1Fpb+?=
 =?us-ascii?Q?2ZTX5c9gCnwnHPdcAe5AF5glJI8r3rdF28GMzFWGpMH4XDnUaoFcLzcQOEVZ?=
 =?us-ascii?Q?0D5wjr/vQrTEmnD6M7nigO8Y4dSxLWKJs0ZilTf1HqFtmL1qS5Mg0w57DIdV?=
 =?us-ascii?Q?/Hw5BqPcyPLeLmK13XJouzkYKsbXTUAcqhvS9GF+sOcvYZtfQ+mcqbzDj7sW?=
 =?us-ascii?Q?UDUFcEvxgi1YZzM1ax7VXkAsOueEoxeU5XaWKhEGbYx8gwP0r7TEevhRuJzA?=
 =?us-ascii?Q?T6jPdCu+EGB2gmGBY2MJ3h0uJsE8OyRJGTbVmgOUsi7dOkjJngZ8DhsfZ4yl?=
 =?us-ascii?Q?JwzbR8kk80xrWd/J6ecIYtU+EV32XfTrA8hGueztkrH2ZXZzp9uztT7iezg3?=
 =?us-ascii?Q?Yt5o7WI0M++OqQIa25pflJdwGc570r5endN596iLfB1ozoewjAca/JtgWvGf?=
 =?us-ascii?Q?eqZK4xRIYSX98GDjxuVmTtRc4A16dObcHgXHwZpRppvLoKeuXWLE/Esj+aku?=
 =?us-ascii?Q?PNrWJjBx8ez8m6uYewWS9/Wnyhv9nZeGMWUjljZkYer2DFSTHIJQAvBkJh9n?=
 =?us-ascii?Q?IzhVAXYi3pTzbu9mGTZO3O0owsWY3pyQoyy8GA+vdza/lA0yZ3373dnoqbTL?=
 =?us-ascii?Q?aPQI43len6+EFeH9JMY1AVWSM3wo5Kv4xW7YCezMiI1oUrGlVJYCCW7m45To?=
 =?us-ascii?Q?de2I/V33sYxykG3CbuUORGjoM7VRLqj3ABl4g4IuCGhaJsL7Ucc60yBSVwsK?=
 =?us-ascii?Q?D9A/a/axziV/jGCLAj3oUxA2m/gDPa+3FrjEP748YCcmt10F1ZJaVdIl63wr?=
 =?us-ascii?Q?SG433zECaEvu++mKjb2bTwB64AkDRkaYGIEmN1eE4kHzaf9z6p0BNvjLJzmK?=
 =?us-ascii?Q?3MvRBvYJWVVAEUZPvQjRYXXCyIHymOzdQ/Wo9g+odohJpUeRKOOrHZPT6R6+?=
 =?us-ascii?Q?8lGX7aTT2otDs1Vb7i+BHOwNzqXBZszviEGg0oO6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fc57jZxbPPnuGNmzHh2Wc/v1SBpUhWK42wllPvmuc1qEITei38YtIkT3B6Mwrl3l7kAdgNRqwARa7jC7sKJoB8x9jDhz8JUc2R2QrIgaObmuLnjvxULp9gOjlarVV8SxNL37VmfgXXFHu0wJuQ34828LyhHh/HqLKTWJ2fGD/veWUTU9kFETd31oN2E6sFAJd4QCde6b2/KihVH2iINop3zZabXzoK3j3P0TgjxFEk2+BcMPjej+f8u+UIeial8xFn4X/ZcAdy7FMc+QYHD9eDOa6h5n6O6veApiQ3rx0ViMtO7gjXZ7hItHpn75jhrWEGwszkVFw4Zsr9y5Uwx3L18GFj54VeigdRWYAtrLrzn6S6uypn+KUr0CTROf8cuuYAHPX/PVSMaLkeU3ErZdIRGS4JVnvwNnoiq0OszBOtWC7fU65Z7Df69O8tOBdipYQLrr3PTnhCvkBl8q5j9jCSZvse4AGkjun4Al1B7E7obBJ9evJss2TzUfdj55HzBurcCL9lQsXEqxLEG6v0mzLPoznWK/NpldklVx/EQeOdRivuZQ03EnrB7Ldigccm8Dtaw2bh33wqRcWMmEANtSviYRPY7z4K3NUIFHIq3YvBcZ3QkpL21imK4L6D4LHrJb
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e6c7d2-3270-4147-cf8c-08dd993deb57
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:37.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig9vUgdj6g1M1azA+hDdzBSVGS2YiLDvVxWv58tnnoTLf8yfhF0t1yHOzjtouTs7TxNyHwHCFDTc9eNukbzK8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0682
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0682.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE0OCBTYWx0ZWRfX+bDREYDs24pp ggOdrdIwpUpyJ9UU5n7exXM6AsX6uGUIsHaj6J4QHrWDxJbO2wCC+pnzrGoXEopETnokBmY437v OOErJLCspg0wdHFFk9PfIEydGFgrN9u8YMXcwWrvsMK+o89vDguak5dfZrt0ofEk67uhmklmZyV
 34zS+FZ9My/Y6MjhOMWeO4zy3LRQzPleMvATNoAVNRY/Rfwm5bOT4v9eWv4HWbtuGPxFPN2lUWc Due3/iE4T7RM6TiUrnnZ+JNYXKmXSetozEKHIhp15N9ZNz3cRKB9a9Yx3ltaVu+VVxDi6y/afqg shLW+4JjDlGzyO/k9vM/J1PxFWpcD69dqAv85Hp9jDVojs8zxflC/NHVcpTEOvp4b3xJgYoinzw
 qaUmweC3/lpwdvM6mZ52VnWNG7Rj2tsjVoLebJ7qcLwHjbKbrnlJ7G675PuH0DrkSCUVPXp3
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=682f363b cx=c_pps a=ZbF0nDb3NYyigRfKXiLIKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=Z2VYdKDLklew4aR_wbMA:9 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: Onbg3RtzN06Ccg7Ni1hLIWTHydwKB3GS
X-Proofpoint-ORIG-GUID: Onbg3RtzN06Ccg7Ni1hLIWTHydwKB3GS

The QMI_DATA_LEN type may have different sizes. Taking the element's
address of that type and interpret it as a smaller sized ones works fine
for little endian platforms but not for big endian ones. Instead use
temporary variables of smaller sized types and cast them correctly to
support big endian platforms.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/soc/qcom/qmi_encdec.c | 46 +++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index bb09eff85cff..dafe0a4c202e 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -304,6 +304,8 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 	const void *buf_src;
 	int encode_tlv = 0;
 	int rc;
+	u8 val8;
+	u16 val16;
 
 	if (!ei_array)
 		return 0;
@@ -338,7 +340,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
-			memcpy(&data_len_value, buf_src, temp_ei->elem_size);
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -348,8 +349,17 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				       __func__);
 				return -ETOOSMALL;
 			}
-			rc = qmi_encode_basic_elem(buf_dst, &data_len_value,
-						   1, data_len_sz);
+			if (data_len_sz == sizeof(u8)) {
+				val8 = *(u8 *)buf_src;
+				data_len_value = (u32)val8;
+				rc = qmi_encode_basic_elem(buf_dst, &val8,
+							   1, data_len_sz);
+			} else {
+				val16 = *(u16 *)buf_src;
+				data_len_value = (u32)le16_to_cpu(val16);
+				rc = qmi_encode_basic_elem(buf_dst, &val16,
+							   1, data_len_sz);
+			}
 			UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
 						encoded_bytes, tlv_len,
 						encode_tlv, rc);
@@ -523,14 +533,23 @@ static int qmi_decode_string_elem(const struct qmi_elem_info *ei_array,
 	u32 string_len = 0;
 	u32 string_len_sz = 0;
 	const struct qmi_elem_info *temp_ei = ei_array;
+	u8 val8;
+	u16 val16;
 
 	if (dec_level == 1) {
 		string_len = tlv_len;
 	} else {
 		string_len_sz = temp_ei->elem_len <= U8_MAX ?
 				sizeof(u8) : sizeof(u16);
-		rc = qmi_decode_basic_elem(&string_len, buf_src,
-					   1, string_len_sz);
+		if (string_len_sz == sizeof(u8)) {
+			rc = qmi_decode_basic_elem(&val8, buf_src,
+						   1, string_len_sz);
+			string_len = (u32)val8;
+		} else {
+			rc = qmi_decode_basic_elem(&val16, buf_src,
+						   1, string_len_sz);
+			string_len = (u32)val16;
+		}
 		decoded_bytes += rc;
 	}
 
@@ -604,6 +623,9 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	u32 decoded_bytes = 0;
 	const void *buf_src = in_buf;
 	int rc;
+	u8 val8;
+	u16 val16;
+	u32 val32;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -642,9 +664,17 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 		if (temp_ei->data_type == QMI_DATA_LEN) {
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
-			rc = qmi_decode_basic_elem(&data_len_value, buf_src,
-						   1, data_len_sz);
-			memcpy(buf_dst, &data_len_value, sizeof(u32));
+			if (data_len_sz == sizeof(u8)) {
+				rc = qmi_decode_basic_elem(&val8, buf_src,
+							   1, data_len_sz);
+				data_len_value = (u32)val8;
+			} else {
+				rc = qmi_decode_basic_elem(&val16, buf_src,
+							   1, data_len_sz);
+				data_len_value = (u32)val16;
+			}
+			val32 = cpu_to_le32(data_len_value);
+			memcpy(buf_dst, &val32, sizeof(u32));
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;
-- 
2.34.1


