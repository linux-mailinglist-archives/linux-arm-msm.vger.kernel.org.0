Return-Path: <linux-arm-msm+bounces-92905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFdxKr7dkmlvzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:05:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0F141D35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF9B53001077
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0341B273D6D;
	Mon, 16 Feb 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="ZMbGS31J";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="E7ld4dcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91C26FA6F;
	Mon, 16 Feb 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232688; cv=fail; b=TZBzUUIgUKIDRDQuWNS9LadSEBpndN3efpRbueKl4qpHYgCqfjmcCj1V0FKlmbRmWvjwe7r+uwSXILGMol23lWGzwP84GcPL4+dT4rb/i48gKdlowYkRfbihP+FAysVEh/1WtpJhCCxeFofwoFAprwiRuuYwQNIx5dbVvQKnMbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232688; c=relaxed/simple;
	bh=lOyo0ymUHnkOHF7FQGyiN0eXg5tngOEQ1w23LJUYyPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jstv5PDyqleMQogf5X+he35WeuLdQNnpzRiF8PEUKLo6jWKaZrWwIf7idjx4BpXsp8Z5qcpr6AvRggYZY1EKc7DSo/da2/4y26+TjTX1e/ShhfHJRg8Ftfc/zQfkAxH9G1m9oX5ZYsm5nQmV7VcrbVnAweUN6Qzpw+W6LItMuHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=ZMbGS31J; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=E7ld4dcE; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G6OGCv936749;
	Mon, 16 Feb 2026 09:58:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	8fdbfJIzPfHBhbPvLfPSugEn+03Na7kvsR6ZgAJOqK0=; b=ZMbGS31JGHc/mjIR
	VPXsTRijxPxyGkFDTIya1P8TvH9t2sqbPBHH+BVppcimYA/sRRkBq+5bJ6BcNo2F
	z9ZLVWCSpfGJmIVI9W7O9pssz4L7mDcztBqtoh3fYnC/xvusVq6Bh/I2uHMxyxIV
	ZLuCGjii4OvtHrBjLn02opT3RNBoDu7maZpvRB8SfybjtJAAoqVE4hHICSGnrjx7
	7R6NnAk99noF+IMnKXAMwGwf0t5y1l25QHFYSZ2b3y4zlP4vw2b1DCc+FN5in4Il
	r6mO+0AscSS6gLE8iFqoDj4vJyEEtH3EujOBH8PtXs9Yc+qBDbBkEBNbi8Nkrzf1
	S8FruQ==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022090.outbound.protection.outlook.com [52.101.66.90])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4cae9bhnxj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 09:58:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDQdBhSa/bbZEQN4Q7sJwM4ZWuCm5kKpbKcmPCOcEJKsGiL+6GXNewx7TG+5c9URLZKUtOcrbl0f4pHBRTf0/0GoKqVVtON0Ditx8HqPa0qEQC42tW2/S/HkDzmBXYHEH8EfER1HP94fcK3hSaVoRm478tJdAbzNlltFoQ5rMe9EQ4dexsFlYWdH7insJAhCwZQ/7x14m61AnvxULGAzxJGboUJZPLJ/t7pJxkqK6LOqInnf9AzvAQFDbEJYFQTtTfshygX9M15ATTQ2iBVTt4sOrTKxOkHpC94vt7wgiQ6YBn/GmQXTk/TXN1jdM8PUu7ZFsgQnelsSTMEz/CX98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fdbfJIzPfHBhbPvLfPSugEn+03Na7kvsR6ZgAJOqK0=;
 b=l/VJlMTv/ezNRBX4lmMui8/XbdVyDs1kJdU7ijEhwBC6O6BkG/Tgn+OgioS0VzV2SdD0WeG4w/5e/TvAI5aJNqeE/kUpS3A7gnerIiR+IA4YZthjEWcNLtQbFWzu2s16hGV4aBowjuzGQV+Q9eKKeP2/ghqFBL7gmyVw4vmEWYHa+etEgsm67ckg5ocLffXVyQaenCe55aeCJY2DiKwyHWg/Qg52EKEF17ScxIZ0N6AXxWc+o9DSxNvS787Zd7+JMGT5VfVr3Xw2mCiUT+B6xNvYbVj0v7uH+0XtrBRnofbh7NRDeAR8vzbButFdsvLo//iSc4nAja24mNMKT8xPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fdbfJIzPfHBhbPvLfPSugEn+03Na7kvsR6ZgAJOqK0=;
 b=E7ld4dcEQvQmcMr3rkANcQCYD0t/FkzGX+O90watxoVpguUlcKg/1shLmCftxnBSkDjKEOjmsQnB8KLWMN+aNaU057hrf8sWK2JZAhpGJ7VWH3ZRMkWqNusNc000Liw4FyYtY3RReXkuvUfJuuxv4UfNYXSNR+24jwWWkwSpAZI=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by PR3P192MB0777.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:2b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 08:58:40 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8c02:9739:5f2d:b147]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8c02:9739:5f2d:b147%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:58:40 +0000
Date: Mon, 16 Feb 2026 09:58:35 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVYP280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::25) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|PR3P192MB0777:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d3960a-d639-4d98-3302-08de6d39949b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmpkU1l2WFM5OGVUZDhENGtENkVtOXpkRDd5amFvMVlGSGZQbldSSHhiUUxD?=
 =?utf-8?B?MW5BRElobTc3c1QyMXc5ME1VQWpaM3JkSzFCUVJ3NUlJVUMwdXVRbDgvLzFP?=
 =?utf-8?B?RXJlZlpVUmljcTdhVHZUUEVEWVFZcWNjZ1dBSmYwMkJnaGtoOUF6cmdwa2ow?=
 =?utf-8?B?OGltTzB2cERnWW05cmQ0dkh6UHl6clFCT093YngwREpCOW1vcTAwT3A3STJ4?=
 =?utf-8?B?V2IrQTRXL1pUMzJPbndYZENhR2lIZTQwM1F1SUJ1RHFkaVVGcHB5Tnd3dHE3?=
 =?utf-8?B?akRGejZJak1xT01tSXVJNWtrbXlGSXhGdzRlZXhlUitmM2ZBYUl0amZaQWNw?=
 =?utf-8?B?VkZERTZEWUhPdExYWkJOZ25aSHVlMldPaGlZRk1PTjl0RlFXQ0J3ZVpyM2dJ?=
 =?utf-8?B?OUltQ0lGQmJVVXlLVFh6M2VsVjd2ZU9YMWIzMzQyRXVML0JDd2ZITExyWHUv?=
 =?utf-8?B?WTYxR3JMQVdpWWlyK0lVT0R3akY1OS9iVENWSWxoWVp4OWExTHVHTWUwUnUx?=
 =?utf-8?B?T2RZUFk2dDR6cm0wM1dsZVdLcXNVQlIrZllXcVdScDlEbkJ3eUQ3SWcwUUlZ?=
 =?utf-8?B?YUdocEVRRnhhM2ZkczBnV01DMmZjZkd6eHd2WldCZ24vUm1IYisxRE5jemJB?=
 =?utf-8?B?ZC9qT1FKYVZVMzQrNmRTVjVKU1pLRmJ4WUhCYXM1eFZ1VmtxSExjUFFhdW8z?=
 =?utf-8?B?dk96SFkxSmxRQS9pMmdkZVNnNS82emRrdFpNVXIvMkVXSnhXcEorMGJsUUtN?=
 =?utf-8?B?SlhYTmtlVmNxMFVYN0YrNFZTNjR3TGhnWXhvOERGVUJXL0ZBSlNxUEtmT3VE?=
 =?utf-8?B?YnpQbVRjYlJkN0tiRHRGbTdJZ080dGVFY1R5NmJBTGoyUkhlT2RiQnQxNkI3?=
 =?utf-8?B?YUJNL1BhT2U1VVg5ZXVhTWtSTWNJTjZ2Z0lQY0VMZk1FOUo1U3B5WnZUbTZr?=
 =?utf-8?B?TEhLTjFyS01Jc3hYQWozczdtTGcyVkVZbzM1Z3hPSlg2c1V3RWNOYjVPSkgz?=
 =?utf-8?B?czVYYWVNemZCNVJjM2h6Ly91NXhxUm9nc1JscmdZbmJmcFlRdTVQa1kyUkIw?=
 =?utf-8?B?R0V2R1lSd2lvM3NJMFpkQzdRdWw3WS82YzR2SURBVmthbHNuck5kcVMrejNC?=
 =?utf-8?B?clRCYlB4bTBxTkJmbVJrYVB3NVBCWjcwNngzclYwVnlJLy82R2c4MTF0WkhL?=
 =?utf-8?B?TC9TQTgraHBKKytYc0JzTXppME5GSTliVVBHc2o2cXRIcnErUkwzQzZ1RHJu?=
 =?utf-8?B?QWlDWGJZNmJwdkNNMWYrQzEwUmtyR3FwMzQxWVhHUFM1dXU5L0pyRC81UjI5?=
 =?utf-8?B?VEpqSm1NcUNpMkZMbVB5MXRGa3l3ZnNvU25nT0JuZldwZ0kwWlhrZVBvWEhh?=
 =?utf-8?B?VU9OaEp0UFlzSzVYVTRWOERGYXpLQUxEanlnNG1nQVR1S3AwR0xxdW1Zck5y?=
 =?utf-8?B?bUhzMmNsUzZaWWFGelZkSXU4elJNZkVGaHJ1WHIxZDJGZWphd0MxQzdveFQ2?=
 =?utf-8?B?K0g2ajRjd3lmb0NTQU5lNVhFV3FHQ0RJZlg5VzZvYzJkb1lsUFJHbjlqRlJ0?=
 =?utf-8?B?YS8xbEFsN2R3N2g2T2xpZkkxVzR6d2I3Qm9pemxINUd6ZGtQQXluZmgzQ0Rt?=
 =?utf-8?B?L2JYUDE2ZE9rSmFZK3BZa0NnN2M2Tm43V2I0dkl1RnNNY0ZIVHMzOURaZ0pX?=
 =?utf-8?B?YWN6SS83QVBpSlhEWHlndENmVHNhV3k4a0h3U3dVQU5zZ01kd1A4dmpYTEpN?=
 =?utf-8?B?VC9hNW1teEVxemJLQWhmMnp6OW95dHIwRFVyb0NiWnp5c3lnb0hKajFpR25x?=
 =?utf-8?B?eW5WdkNodzQ0ME9NRmFuSHd0NHdUays0UXdiSWY1ZXhkbkdiNGJIdk5Jc24y?=
 =?utf-8?B?bXZMRGgya3UyNmFmU2xFSHdJa1IreWhxQVlJNzEwTnE2RkNTS3Z4TGtYYmls?=
 =?utf-8?B?UXRyNEdwMUF2RlFid3RndkpkOG8xM04wMDZtRGZEOUx5ak01K3dNY0toUURj?=
 =?utf-8?B?ZldGVDNwbmFIT2FWdTdJc3YzTjFlQ3JFQVQyYlQ3Q0ZacEtUNXQxUzJlbVNV?=
 =?utf-8?B?akhGeXE5OTFYcEVTR3dOS1VHeXVrWDdLaER6SlMvdHlMS3hUa1ptMjl6R0Vr?=
 =?utf-8?Q?8n9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REI2bG15dnV5Yy9zc0F4NTZIaE5UYnprbUtESmFMOXp5bU1xTEZVRUcyMk5T?=
 =?utf-8?B?Sm5NS3cyRzlLeXRnL1k4M3U2NS91K2xkN0M0V2J1c0UzUDZWWmZkdDJTS1Ji?=
 =?utf-8?B?eW55dUlFalZsS2pQVytRYWJ0WXpldWJ3RHBCYWdVaG0zVHNFNzdZVmUxWVVj?=
 =?utf-8?B?YlVaME9IYjZLRmQyalpmdXlyTkpTYVBhTGJJclZCS1hXVUpiUm03eHByanVZ?=
 =?utf-8?B?ZG85NnJPajhCSEJ5Y0xWejhoSGpRN0lDOUhTZnk3OTRZNFl2L2YxRlgzWWJy?=
 =?utf-8?B?M3Q5NGc2NC9vNlNqUnpzNFVUZTk1OGlvU3c3UTBxSnl0a3RUQTQ4b1pBaEJY?=
 =?utf-8?B?Nk1lQk0xWEJ5Ym4yVno1UmNUU2plSi84ZTEwYXAwNStGNFRzaDlIRWduZnhx?=
 =?utf-8?B?dUg2RkJxMkVxSUJ6aFBBRmdvSCtwSzJEUkd4TXNtcit2SGd5dWg5OGxsTjVX?=
 =?utf-8?B?MXB4dWh4NU42c2RnWmVyUFJBOG9Cd2dCajZpY2RJcW9pekh0cGxNVjNGbHhN?=
 =?utf-8?B?bloreDRDQ1k4eGZySzYwR2duM3BKeG4zcFNJSWVidU5hNHFndUVjNTNGMC9K?=
 =?utf-8?B?MG93SUNFclhxT2ZqcnJMeVlpbnlIaHVlZ2lHY0RjOHhvS09MNEhsUFJXRFhx?=
 =?utf-8?B?NVZjWDc3WExsUTVGblJpcXNXK1c0MGJBTXFsdW0zbWZ4N2lyNWhGK2VQTmxF?=
 =?utf-8?B?TDFjT3RxVXRFdjdYelhUQml4TEl4RlVFSjFCWWV6cGMvUGpDMjk3VTBLMFVF?=
 =?utf-8?B?di9PUnBYOFFDQW1oTllQUFNFUVdEQkNsR3Vra3A0SzBuU1VMeHhMc1orejMz?=
 =?utf-8?B?OE9uR0J6VUR0TFF1ME1lTFZHWm5GWVlKU0NCNkFnYnBLTGVzb0xFdlN6a2Zz?=
 =?utf-8?B?aEFjai9JcElkUWtBVG1YalZUVHRXT0VEcUlhSHFOMkE5eFV3UC9lRW53V053?=
 =?utf-8?B?QThXUU5XNzJRR0c2NnV2VWRSUHd0R1ZsWTVSV2RsNW93Y1I5cWlsNnJGNlpO?=
 =?utf-8?B?OGFlaVhNWkF3cEFEWHAwaFNqUjNBQTdzTi92ZThZSHJTQkNOUXVWRnRhdXhL?=
 =?utf-8?B?WkpVR1JXc3FmNHZBQkdEOUFFWHNHVDBoUFI0aDBzRTl6MTVuaThnZVFDcTB2?=
 =?utf-8?B?TXh2MWp1M3Z2NXhXRXFjYWptODArSmNzWnZNbE13THFmekV0OXlGVC8wVlR4?=
 =?utf-8?B?SnVzRHVabDBadzZ2N2RhbWgxZ1JzMkw3SWEvcW5nNEJlZDE1WTZJakFPZXU0?=
 =?utf-8?B?NGlubTVVZTJBYzRjUytBZ1NwM0R1VG9WNHFuR2xaOGxUaHdxUjBYbG1rM1VX?=
 =?utf-8?B?RFRTZmhOZEVTWDU3VUFOZW1rMm1hNmtUZGlmOTBLcy9INGNqcjhPMWZpVDFx?=
 =?utf-8?B?RTVXWC9HckJpVmltRW84dDBMeFVYcDJDNzJrLzhTM0xHVmI5V2dUQWZ0ZVJn?=
 =?utf-8?B?L2pQVXY0VEUvV1ZQN2VmRkpyeUVVMlU3ZkZkM1BVVDdURHRZQ0ZYYVRUcWp3?=
 =?utf-8?B?VThrTjFMUDBoRW9pdEFYSEhqRmdLanhtN1c5amZ1L1JXR2dNbmVpbDRxMnIr?=
 =?utf-8?B?ZWtSU3E1M0U2QXR2ZGhGTzE3aU5BUDZUbnNSbVptcVRRODNSVGQzQytZSXFy?=
 =?utf-8?B?R0YvMkcrald5eTZnaDV1bnV6NHplUTQ0b01OMUl6aWZ5dnFiQzhIWlhMU3Jq?=
 =?utf-8?B?RHZGOU5nTlFDbHdrTERiQlVUUEpYNUVpSkdCSUFkSkE1MlBaTEJzSzJQOUZY?=
 =?utf-8?B?UEJISVVrMHZVS0o1QnF2UUY3WFdTYTVQMko5c0tPWlFQNGlBdENkU2NxbThF?=
 =?utf-8?B?OWV4blBoc01YbDV0Q2lXdDM4RXZwOG1VT0ZPTlVZSytuN2pYUWtWNlVRcTgx?=
 =?utf-8?B?MHd3VWdVdm03ZlYrUXdXU0JhU3kzRElST3Zxb3RsNVY3dWk4a0k5SlQrR2RY?=
 =?utf-8?B?eTNYTDYwMjRHclNwdEVkYmd2U0dURVBqc0JvdFNjWmsyVXdneGUxNzdhN0hs?=
 =?utf-8?B?czZVQ0dpcUdTYTE4OTJoYlp5dk1VM3g2QXZUZmNxTnRXcmc4MXpWNm9HSm8z?=
 =?utf-8?B?N2taV01NZ1ZCdzNvMEZUNXViT2x4MDZCRlZJY3VGYjFEQmNNMmtYQlUzK1BI?=
 =?utf-8?B?MTk4VmVNSlVsQmpKOEhIcEZCOEgyRGFvMndBK0NSNUpyb3YxUENtWnVtQUJY?=
 =?utf-8?B?ZHpDSnhsamRBQWMxSVFTYjk1U1BWWGc4bS9TelVmQ0lCZnlSWEd5eEVNY29V?=
 =?utf-8?B?V091VTBnSEtJY0hHa08xUTlVVGhUeGRJclNwV2VIc3JvNDhiNStEQVN6RXV4?=
 =?utf-8?B?bmR6ZEZHcEo0NW1FeUYwK3dIdFM4MGZ3ekxJYmU0UGwxZGVmd0dEZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C9vT3ToOxPsQ6Wq6uqu3V/VK/cO9MZ80AngQwdkjI6/6e2yfqbUuPxvlkMKTfi5EEeA885Lp96fMYz8HMdBGPJCbcsjjwC8jL1FTSQIYiL82wgKp0sDkzuiomCin2p3w9ZrP+v8X0TAq6MwU+5QUupAzsIcROFSD9ZuElHoLIhkDrIQpLq7u2VB3PnUPHlNMsMK9lfIlizBBIJtjJBZfxx2VmvF0fxFiKM4ASKlhZ5b4lBYTc5YC98lhb1uAE0cjy06e6+7Dce/YLBoQvb0sYud6NtvbftEZrGD5COVexHg/2WYmobtFg4AApg86uRJcX8xtRGTxxjIFbaGRSS0WmrTId7s7sH9+pkQDdczFMA/L+JJs5pOmGhsv2EKoqRIW8HJePM6MrvdePPOif7OYwH4heDQTl8PuFk4+qNX20u89gAx6jyRFmcuoO/txi7WmtEqXHdJwNGaIPPb7DHGXO8g9STUJjTxttyjhaXUN/Wo8pGJOg+qvXsXJgZYYh3SBoAVO/6baPwoOSXCCnbvkt1MmBlzhvd+lgJRhJdCbMgK/L0soqsLAhGHKIx6b1Ovz7czNjErsZjWAy1HPgj3UgrslOcYjtbjR75RxaOS5ma4xQ/o1jGHZcJTHNl8p+KqS
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d3960a-d639-4d98-3302-08de6d39949b
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:58:40.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzX3OgtXW9oOJiiZ2b4aRObB5c7vOVf+W7NKIG+bDLgWW7DENklW//o1OyriHwCtYxvNfXS+cM6N3aXrA5lgNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0777
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: PR3P192MB0777.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfXy3xyfozbnGP1
 LNgYCnZP7RAByOFwe9zqOy+f1mlkyIsDqqWB8OmCNuy88ur2/yMcOqW0lzpvAUKHTVEbyoXC9kl
 lscVKrmoBsozYZc26Sj8DgS6LM+Ifcr6Qv6EM85NpWCKU3SD2vRmYmCTziPMtFccfWEbTKEr0hW
 HHjVmarTL+0992vnWKmhMOoEmAiwVcEO0a6JHhAXC4otzNnyg2yZtmfEpwQx3vG3BhZ+aw/PAXk
 aOBt+IrQYxMN1z2X6ql7AmK2kZu7Z1N39gQqYxLn7H56U9FcaJPQVCIrkrIgp6Q8P6vf7vm5Sn4
 ZS8PWGdsA+9iRxAaZDFH1uoJl99NBUzvxFs1YuqOXpj74Ljynbd2cztfrCmS9ngIwwI3i9YIxIV
 VCYY7eY3fsjQVVEiO2l2P+cAFB2iyLpOQB/y2/kFRMBokUktK1Oh6Zq5u77CLUGPUMoKbE+9yAF
 HaLYFe69Qak1Uq1GmQw==
X-Authority-Analysis: v=2.4 cv=D91K6/Rj c=1 sm=1 tr=0 ts=6992dc43 cx=c_pps
 a=iLBBpmpEAL8KygvK/tCCQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=blOs2l17BSgRN7JBxiYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: j3ojj9H0m7f3MeQv2mEq6Gaz0_HQKdNq
X-Proofpoint-ORIG-GUID: j3ojj9H0m7f3MeQv2mEq6Gaz0_HQKdNq
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[westermo.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[westermo.com:s=270620241,beijerelectronicsab.onmicrosoft.com:s=selector1-beijerelectronicsab-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92905-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,urldefense.com:url,beijerelectronicsab.onmicrosoft.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[westermo.com:+,beijerelectronicsab.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.wilhelm@westermo.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6D0F141D35
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 03:16:55PM -0600, Bjorn Andersson wrote:
> When encoding QMI messages, the "source buffer" is a C-struct in the
> host memory, so while the data that goes into the outgoing buffer should
> be converted to little endian, the length should not be.
> 
> Commit 'fe099c387e06 ("soc: qcom: preserve CPU endianness for
> QMI_DATA_LEN")' fixed this, but did it by copying a whole word from the
> source into a local u32 and then operated on that.
> 
> If the length in the DATA_LEN refers to either a char or short array,
> it's reasonable to expect that the struct is packed such that this word
> will contain not only the length-byte (or length-short), but also the
> beginning of the payload.
> 
> As the encoder loops around to encode the payload it runs into an
> unreasonable value of "data_len_value" and bails, with the error message
> "qmi_encode: Invalid data length".
> 
> Rather then complicating the logic with local variables of different
> types we can instead pick the u8 or u16 "data_len_value" directly from
> "buf_src". As "buf_src" refers to a typical C-structure in the client
> drivers, we expect this field to be naturally aligned.
> 
> We can then return to the original expression of qmi_encode_basic_elem()
> encoding directly from "src_buf" to "dst_buf", with the endianness
> conversion, based on the size of the type.
> 
> Reported-by: David Heidelberg <david@ixit.cz>
> Closes: https://urldefense.com/v3/__https://lore.kernel.org/all/dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz/__;!!I9LPvj3b!BCfk4-YtwbkEy3mc_UUojT1xCH5BW5COilqBek1tBnJyWzp2eK716Cj0C_35FQwo8__BS8qk_PK5oJs9i719BCjcA-rnMg3YY71aTHHs$ 
> Fixes: fe099c387e06 ("soc: qcom: preserve CPU endianness for QMI_DATA_LEN")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
> index 28ce6f130b6ac355820bb295c8c96f9c6a6e385f..45bb26d010da77ab8d481897026b718c2290bad7 100644
> --- a/drivers/soc/qcom/qmi_encdec.c
> +++ b/drivers/soc/qcom/qmi_encdec.c
> @@ -368,8 +368,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
>  	const void *buf_src;
>  	int encode_tlv = 0;
>  	int rc;
> -	u8 val8;
> -	u16 val16;
>  
>  	if (!ei_array)
>  		return 0;
> @@ -406,7 +404,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
>  			break;
>  
>  		case QMI_DATA_LEN:
> -			memcpy(&data_len_value, buf_src, sizeof(u32));

Hi Bjorn,

unfortunatelly, this change breaks the `ath11k`, and most likely `ath12k`,
execution on big-endian platforms:

    ath11k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath11k_pci 0001:01:00.0: MSI vectors: 1
    ath11k_pci 0001:01:00.0: qcn9074 hw1.0
    ath11k_pci 0001:01:00.0: FW memory mode: 0
    ath11k_pci 0002:01:00.0: BAR 0: assigned [mem 0xc10000000-0xc101fffff 64bit]
    ath11k_pci 0002:01:00.0: MSI vectors: 1
    ath11k_pci 0002:01:00.0: qcn9074 hw1.0
    ath11k_pci 0002:01:00.0: FW memory mode: 0
    ath11k_pci 0001:01:00.0: invalid memory segment length: 83886080
    ath11k_pci 0001:01:00.0: invalid memory segment length: 419430400
    ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 0
    ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
    ath11k_pci 0001:01:00.0: qmi respond memory request failed: 1 48
    ath11k_pci 0001:01:00.0: qmi failed to respond fw mem req: -22
    ath11k_pci 0002:01:00.0: invalid memory segment length: 83886080
    ath11k_pci 0002:01:00.0: invalid memory segment length: 419430400
    ath11k_pci 0002:01:00.0: qmi respond memory request failed: 1 0
    ath11k_pci 0002:01:00.0: qmi failed to respond fw mem req: -22 

I tried to analyze the regression I introduced and I think I now understand
what went wrong. Previously, the code looked like the this:

    memcpy(&data_len_value, buf_src, temp_ei->elem_size);

However, this never worked correctly on big‑endian systems. `buf_src` is a
`void *`, but `ath11k` and `ath12k` always store the data as `u32`. Assume
the element value is `0xABCD` with an elem_size of 2, that is, the
`sizeof(u16)`. The memory layout on the driver side then looks like this (X
marks unused bytes):

    +---------------+----+----+----+----+
    | Little Endian | XX | XX | AB | CD |
    +---------------+----+----+----+----+
    | Big Endian    | CD | AB | XX | XX |
    +---------------+----+----+----+----+

When `buf_src` is treated as an array of `u32` and then “reinterpreted” as
an array of `u8`, only the first 2 bytes of the `u32` are copied, which, on
big‑endian, no longer contain the actual data. After the copy,
`data_len_value` contains the following data:

    +---------------+----+----+----+----+
    | Little Endian | XX | XX | AB | CD |
    +---------------+----+----+----+----+
    | Big Endian    | XX | XX | XX | XX |
    +---------------+----+----+----+----+

So the original value `0xABCD` never gets copied at all on big‑endian
systems. This is why a simple pointer cast cannot work reliably on
big‑endian architectures. I did the following change:

    memcpy(&data_len_value, buf_src, sizeof(u32));

My attempt was to always copy the full `u32` value , but it seems that the
modem on the "Pixel 3" does not actually use a `u32` there, but rather an
array or a packed structure. I’ve CC’ed Jeff and the `ath11k/ath12k`
mailing list as well. Hopefully we can find a solution that works across
both endianness architectures.

>  			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
>  					sizeof(u8) : sizeof(u16);
>  			/* Check to avoid out of range buffer access */
> @@ -416,19 +413,16 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
>  				       __func__);
>  				return -ETOOSMALL;
>  			}
> -			if (data_len_sz == sizeof(u8)) {
> -				val8 = data_len_value;
> -				rc = qmi_encode_basic_elem(buf_dst, &val8,
> -							   1, data_len_sz);
> -				if (rc < 0)
> -					return rc;
> -			} else {
> -				val16 = data_len_value;
> -				rc = qmi_encode_basic_elem(buf_dst, &val16,
> -							   1, data_len_sz);
> -				if (rc < 0)
> -					return rc;
> -			}
> +
> +			if (data_len_sz == sizeof(u8))
> +				data_len_value = *(u8 *)buf_src;
> +			else
> +				data_len_value = *(u16 *)buf_src;
> +
> +			rc = qmi_encode_basic_elem(buf_dst, buf_src, 1, data_len_sz);

Here is the problem again: `buf_src` is once more being cast either to a
`u8 *` or a `u16 *`. This does not cause issues on little‑endian systems,
but it corrupts the data on big‑endian platforms.


Best regards
Alexander Wilhelm

