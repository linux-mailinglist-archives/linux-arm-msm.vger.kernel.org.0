Return-Path: <linux-arm-msm+bounces-71211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E2B3B17B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 05:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684FB163637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 03:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1CC21FF36;
	Fri, 29 Aug 2025 03:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BnKXmUCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011029.outbound.protection.outlook.com [52.103.67.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750E1C5F39;
	Fri, 29 Aug 2025 03:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756437034; cv=fail; b=GvFcj2B1BOeF9sMBjNt+1IEVzrSHb+DThGP14jRHOGNA2Mj5M910tDueOun1IghalJdF/FOAngxhHucCUFghlF84T5D05uAmAlZxOQmPGLQ7XpkP7ZvKFQYWnIT2XwlHN1joDxbFSOZyZzPBSCcvzLq/HA0nqlgt2Yp8sdGt8j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756437034; c=relaxed/simple;
	bh=y0XQeMOLO0fe2CCdzgcFcNqL9oR44b+T29vPEpXzvTo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eJ1rvpTuT6KnY+tPQxm6p/ouYB34KmR3raGBeDFu60okRXfRlXdsiycdtqk9b0aXK6lfaGS/OICPY6ZHbbVVdxpF17LRrCDFu2gZHmIgxO0f8WjC9WH1574lYOLAcNT+MZgUi5XERL02PfMJmxwrwatZoG+nbQyCTV5rmGhdOHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BnKXmUCJ; arc=fail smtp.client-ip=52.103.67.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktJ4Ngbo9qy9/qJCw8VwZPgBfoUKAGXyg44ivpjG0rGtAiS7kG9WKaaEZTJoKbRR+mVfB6TqUVFkYcdYcKoNA+XcQmRm56+tQ7LGbSznx+F5q9wmlLs1il/2pYzdfMAkFsORZXtAzAtSDvM9zUeMotS2oZKHzc1vx4RSEmcTEdfrTnylJ5sTFhHiqe5O3MneOvt7xmjvB9gqO+P5mYL1/8qQSD9YgDFCEiPvUR9dgZiQttBpOiHB5b5oTk6WpL+QzLdSRDdXz85+QcS2tU5wnI5d8P0z0RGPo2o2nO80wBGGOpTlfDRzLUmSEQ4v12jBgo8SWe38vgR6KDI2owXANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSwd5dQrobt714wf6Y7ITiSuYm08x+ID+MKnUASfPXw=;
 b=ii6QZl93ZyjHhKBeEX81Ayek34N3N6P0gPsZt9cWsMXHlM4wO095wTJsIVDcPn3DeHSn/7OpqO5FDfN9gzwpv+QYbMwOQhuRWKdXE2Bo+avbtqNa9H1KX4+7/vOyRZasN6ZcnYQgyxywTWeAciMTlT+AJ29rs1FaIf7d9V/roKNyyI0SHdCdjCaM3BTDZ+7CWgftPPqg+HZG2+CHznubgznh1zfqtzC3rI4MJdcNxMCspZxnrB5IqP2PibDV5xLMoXIL2fNcBEvYJXqO9T4OKKnfMQDWLn2uI3u/vUl8/n5sgwNevMhfIX+XOp05A/BGilszm544QfTVUQgv1N4YFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSwd5dQrobt714wf6Y7ITiSuYm08x+ID+MKnUASfPXw=;
 b=BnKXmUCJX74DG2m3c/Pum76QF+npN/SU/j3IBfXjwEc/BA6ta2/juIrGHG+5DmTaabblgaTkD00yCo07HAQUEG6andH1DAHJP77WdzGRwMnbcV1MUATNnZB++KBvrZlIYH5xA0FISCFlMpjFY2DH30eFnqXKneRKLVqdH+OH9Jl/JIs0b4NmZdCz9YD89xmtqP9SYnhkzW1MB4VJacnA3oujj/D4wHqm2S62wKcGxK6pz9/10Avr0/kWIwWmCrdV0C7a2+nAKCBUutFe2K0mShwslh/94kSU6Iqca7JxGsU7F09zgM+V6K3YfJWScsRxPtNRvtzN359Wav5oX+E1ew==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PN0PR01MB9365.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:110::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 03:10:21 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 03:10:21 +0000
Message-ID:
 <MAUPR01MB11072DB589F1E6B1E18D329A6FE3AA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 29 Aug 2025 11:10:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: sophgo: sg2042-clkgen: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Inochi Amaoto <inochiama@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
 <20250828-clk-round-rate-v2-v1-5-b97ec8ba6cc4@redhat.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-5-b97ec8ba6cc4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::12) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <10de9834-4584-49df-8d51-1bee1c821e62@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PN0PR01MB9365:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8dd617-0e13-4f46-2e61-08dde6a996bc
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6fOgpu0AmRux6KMzGkolm4jvkjiR1GM6lqFmvShxAYPC/J2Cbtn4yW1m7GAwc2nr5pbyDnPGcaHjJ9OgGenotpvdNECqtGm+AQAm5imYaWvgVgwvxBFke1h6S95Zr46+v6S1xBvePBPm3DK4vKHKk0BKqvThb335d/dX8SLOb6M6v2b3yHjGsyjX/qmQ/bz9UyS77gRW3d+ToLUleRZ3L/giy8wodXBffMhrj49NeL/6JDciNA4yM8z79IcxGJLfs+Uk50hEb5ClsEz+3caHz77gQd/Rvy7qRMvMz8aqKXJy/ETmzcA+0xjERpxJ1odmCrl17qL5bhNfbtrvrju6Tc9UFTMOO/0E51So+raK/ZzGg35vUD+eYt/2luWukQq3Se45Erp1fW8BsqSPPNQNgXUI3XYYMZZiblMNArH3c5+3gdrtzzBdTmljGolC34ewQiaS+Kgb9IXDpmo9XCvSNK10b9RJFB98wJVBx4rEKcOxBA5001c8UM+ZIofTaaQm7JmkWUQWKkzAFg7yK07MaTx/vV1ZDyPgXYoAns4iKFs++s5qYVWVyURjxgndvxbxRpCor+rh/suosAIUPKr2GeFGwHEEEoyeH16j/XzjMuMrvUpiEc4PIxbFWUfvdSK9SnzzWR6kjgnDMVCFIpqgDEF9hLFL6F5NL8o3mCRoamRQ0zyE91MJyt+rvMM1d6u4rdv/zse9O5xD30Sv3PpvbGZnJACCzO+wc6t/0BSt5WFGRrbg7Cz+flWs2RD2Bh3ckk=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|41001999006|461199028|6090799003|5072599009|15080799012|23021999003|3412199025|440099028|40105399003|51005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2RXUGxLMWJLZHhSNXJtQTduY0xsRnY2eGNMeXlaK1R3VDNVQjBtVDZDZE01?=
 =?utf-8?B?ckgwY2VKenZTZkZrY215MS93YzA4bmdqK2cxZSs1eURkQVlueHN0RmdtMHJL?=
 =?utf-8?B?SXdqNjBHdkxaNE1YR01jbW1waC9oZzhkU3grSTRhVXR4emdZV25qWWVoYTF3?=
 =?utf-8?B?VlhrZ0pWTXV3ci9IWEduTWN0SXJqZm5XOCtnMTJRVkNSQ0Z0QWFOb2ZOOEdq?=
 =?utf-8?B?RUVqNVdUcTVrQ2tsMGxyYjNqUzVhSHF5ZGsweFlYSEtLdmhFV2R5M00zZVhZ?=
 =?utf-8?B?cW9JK3Nha3V0WThvSUZ0L0EzaU1hL2pRc1hUTW04WXlubkpiUFJyMHQ5UjhD?=
 =?utf-8?B?V04xTkViTXFlWUdWU2pjWnEwSVE3a2p4T29wZDhDenFVaXk1bXlPQVBUQ1pa?=
 =?utf-8?B?ck04REVoR1dXRXN0bkJTbkdFL1dHNnEwLzlkZXZDRXYvcmg0WU0raVRrdmlt?=
 =?utf-8?B?eHE0bDlnQ2hQVlM5d2VWb2cxV21oZ2xKd0t1ZmQxMk50eUZHdHlWcTRyVlY0?=
 =?utf-8?B?SUx3cUtETmRMY1JtS3FCaktoeFRFemkwZUw0eW1UL2V0Wlc0V2lnQVlUekZu?=
 =?utf-8?B?bUFKbW04NXRRdEhFL0NDNUh3Q1l3SUpBREswZGFyaFJlUk92cTVhOHF4N0dy?=
 =?utf-8?B?alNGZU9KU1hPa2ZiZ2dkMXdXZTN6aWMzMVErampjM1F2a1c1UkpHcVU4NDNN?=
 =?utf-8?B?MW9Cd2RXK3RQQzZnSjc4ZmtVRGJmM1pySU15dzNvNGlNbU00bXFaY0ZsRWM3?=
 =?utf-8?B?UVdKeFIrY3NVUlo2UENaZmdVM2NqZlF4TE1mWWhaaHRnWnk2YTlZcEdMZkxG?=
 =?utf-8?B?WjE4WlV0THg3alVMTjJzZm9TaE1zbVdmRWF2U3FUbmkzM3lFajVtVW1PU3h1?=
 =?utf-8?B?ekRxSmV1RHhSRlpoUVdKaEFQRlBjTE1MSzlnYklsQmNOZkZ1OGNzUHNXSGlR?=
 =?utf-8?B?TEZ3V1gvanNzUTA5MVVsN0EyL3Y1dG5USmdrbE8rWVY2eGdTaTgraHdoN0Ri?=
 =?utf-8?B?TER4U0c3VXQ0dFJOSU9HNkZRU0dOV01LVWtMb2tERzk0bFNZa0pIcDVSMWor?=
 =?utf-8?B?NUpqZnJJQ0xLQzlpZGVaODhEbWVrQ0pvWXFQcDlIbFAzdUs3WGpTK3RxYkJ4?=
 =?utf-8?B?VWdmUnpqanBpQTJWTmE5QldjbVAyZFdFMEYvS3piVFptaXc2aFhxbWZIMGxW?=
 =?utf-8?B?RlJXMVFtVkdHTlptNE1CVll6Q1RPOEc4NlRwNkRmbkhpNkdIb1ZxNllqSGsz?=
 =?utf-8?B?a0JjdHdMTWZuVUZpZmZuK2E3ODNsZ3NIejQ4Z1N6Nk5GMit3KzhLeXp0SytN?=
 =?utf-8?B?d2daWXVTN2kvUzgrZkxQWlcrMUt1MHBVWFpPSUJKcTNkeGxDTUlCNmxST1hS?=
 =?utf-8?B?Y2ZEV3lXcWNUcnJVMWNaWW5LZ1dnaVZEOTMrZDI1Rk9OK0pxSUs0SXhSTG9m?=
 =?utf-8?B?UGp0VzltT2tQWHF6QkJjcTR4c05zMTNRQlNEUE10SkQ0bHlVQitLK0h2ay9y?=
 =?utf-8?B?OExrSEpwSFdPdjliV1FzZjFYU0RuY0t4Z2pBZEcxZkw0aFhWa2hES3JVdlla?=
 =?utf-8?B?OTdXQXRqR0J0bFF6ZHFvdlFXL3JYY2dPTE51REtjaHhOclc3V0luUnhjMHJq?=
 =?utf-8?Q?6Mw10WvZZka3xBD96Iu0jmxMGQ1X220hXfbWhngRJ3CQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHVraHpUME44dHFBY0UxUHlvRURLdS9mRmpBYTluL0JLSGJMOEx5TXliRmJ5?=
 =?utf-8?B?a29tdHAzSkZLSGlUdTN4MmVxeXFmRU9qeDBxUkdhQWtoa1loR0FzSmttenR0?=
 =?utf-8?B?VXZKa2wwQ1luKzlicEp5c2kwSEN0OStwMTNQN0xreWZQSnZWZUQrdmJaWFJp?=
 =?utf-8?B?anBlTEk0MU1jQzlOcTlRMnhSb21HakxNWnNLZ2tNdm4yNWtyNkxjeHRJS3dP?=
 =?utf-8?B?aGRRbkVvd0VuL2s3OEJuSC9TK2tJN3hLOG1wVDZ3U3k5L0VXblRRQjBBaGUz?=
 =?utf-8?B?Q01uRlhhREFteVFNTStVQmJ6Qm15MEFjUEsyY1NKT3hGaDdtem5WYU1malJE?=
 =?utf-8?B?Z1YxVmtWS3VHdFpXRCtzUE1FQjhrcHo1OEUvb3dwbURkVkk3T0JtTDJnQmQr?=
 =?utf-8?B?RlpUNUlQUG0zM2Nvb2FIOFNxaWZBUlN0T1huOEoxUXN5RVRVTWN0T25pRUo1?=
 =?utf-8?B?dW9CY2JpaU5RY1dmK3JFVStpaGloUW9oZzNRMjhheFFoc2xTaFVGS3ZrZDNE?=
 =?utf-8?B?eitkZnlrNTlleFJDbzAwZ2lOdnFxYTdXZkptcGlYSUpIc0dwcnl1enNvQXd3?=
 =?utf-8?B?bkU5ZGE0MkN3NW1aNTlCZWRMNmpPQUlrYVB5SzFmQkF6dG0zWGk5bi9icHF1?=
 =?utf-8?B?YkowMTl5Q2NJNklHM29ac1BOOHlZVEJ1blZMaW1kaHhSTk52NkkrZDlzc2RT?=
 =?utf-8?B?TEtoQUdzenVvVEViRW15VWxTTjZHL0ZUb2dTanhFb1BtcUQ1c29xbUJWRG5k?=
 =?utf-8?B?SXp2bnlYMlp1N3hXaFJpeFd6TDdRZDE4N3plMnI3UlJGc2tWRUtOTU9ZSUZS?=
 =?utf-8?B?dTkvQ1hkSVZ6bGZuUFZTYVhqOUpsNnBCVEpSZUs2R29ZeGozT2Y1ZWVrNnA4?=
 =?utf-8?B?UncwK3JDdy9ybEh5NDI4bXVkS1pTRldvVVhZSlpLWi9UcStKUFZ2bUx0L010?=
 =?utf-8?B?ZU5XdGNuSzNOWnVWRityZG1CalNMc1FyZmp4UW81ODVuRzRoVmx3dlVLUXhH?=
 =?utf-8?B?TFJZNlVLS3ZZSTUvVkJzVXZGbFlLTndlaWJMMFpaUnI1Q3NGbUdETXM3aDlR?=
 =?utf-8?B?QUhzZ0ZoemFtbTlJK2pDdHhFamJTZmkxK2UwWVpSVjVlVlJkUklzTUhCcmhx?=
 =?utf-8?B?NXdPWThVZWU5a1ZhUktrQlI3VnlFYzNibkZNUHhqOWZ3TFB0Q1hRcjBtSU9C?=
 =?utf-8?B?Z0Q4ZUEwaUZDZjh5SjFEMFVaV2l3V21tdXcydml0ZEk1N1hTUlZ6YmpwNnpX?=
 =?utf-8?B?SmRnSmovVGhMQ3dsMU5GbWxCaC93TGk1OXBGazJieEU4aDk5aVp6VE9LcVF6?=
 =?utf-8?B?WXUrT2F0REtjb3VjZUErQkl0QWgxZGxGaGNIOHZ0Tkx3T0lzeUdqemFRenph?=
 =?utf-8?B?aGpyRElHa0ZqRHBCWmRHTStMQWFjZFRIWnpyeUt5VVRRdS9XMkNoUU53b0Z5?=
 =?utf-8?B?d25Pc3dKQ2Rja3l2b0krRW9PWjBFWWlsMnVaTmJHbFdxZUpEUEhUenpIM25w?=
 =?utf-8?B?cmNKd0c2eGhlaTh3QVMzS0RvK2s5aUtBR05oUXh2NWgzaGdxbkhweHFQMnAv?=
 =?utf-8?B?MkhJUC9wS2MyZDVRRFRITERsbGFUMGtLa2ptQXh0TEJwaWJZOXUzNU9RN0t3?=
 =?utf-8?B?OVI2RExJaE5wL3FIOXFveDlCSmxmejA3TWJmN3JwZitJcVVhTStickI0cmJq?=
 =?utf-8?B?a0Z3RFlTSWw1K3NpLzgvenIyWjNiUjZSTlhwS09kNEJFaTNlYW9WejBrMlVL?=
 =?utf-8?Q?jSoZU+aqUxs5KYbP3Y=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8dd617-0e13-4f46-2e61-08dde6a996bc
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 03:10:21.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9365


On 8/29/2025 8:38 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com> # Pioneerbox

Thanks,

Chen

> ---
>   drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 9e61288d34f3757315702c355f2669577b29676f..683661b71787c9e5428b168502f6fbb30ea9f7da 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(struct clk_hw *hw,
>   	return ret_rate;
>   }
>   
> -static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> -					  unsigned long rate,
> -					  unsigned long *prate)
> +static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
>   {
>   	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
>   	unsigned long ret_rate;
> @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
>   			bestdiv = readl(divider->reg) >> divider->shift;
>   			bestdiv &= clk_div_mask(divider->width);
>   		}
> -		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> +		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
>   	} else {
> -		ret_rate = divider_round_rate(hw, rate, prate, NULL,
> +		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
>   					      divider->width, divider->div_flags);
>   	}
>   
>   	pr_debug("--> %s: divider_round_rate: val = %ld\n",
>   		 clk_hw_get_name(hw), ret_rate);
> -	return ret_rate;
> +	req->rate = ret_rate;
> +
> +	return 0;
>   }
>   
>   static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> @@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
>   
>   static const struct clk_ops sg2042_clk_divider_ops = {
>   	.recalc_rate = sg2042_clk_divider_recalc_rate,
> -	.round_rate = sg2042_clk_divider_round_rate,
> +	.determine_rate = sg2042_clk_divider_determine_rate,
>   	.set_rate = sg2042_clk_divider_set_rate,
>   };
>   
>   static const struct clk_ops sg2042_clk_divider_ro_ops = {
>   	.recalc_rate = sg2042_clk_divider_recalc_rate,
> -	.round_rate = sg2042_clk_divider_round_rate,
> +	.determine_rate = sg2042_clk_divider_determine_rate,
>   };
>   
>   /*
>

