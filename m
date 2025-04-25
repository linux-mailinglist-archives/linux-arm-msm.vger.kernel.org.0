Return-Path: <linux-arm-msm+bounces-55788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E269A9D646
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 01:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982AB4C6054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC06C297A70;
	Fri, 25 Apr 2025 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gwSsehUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC129009A;
	Fri, 25 Apr 2025 23:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624097; cv=fail; b=TXcd3V1kDJUlvnwEor7+AlV7hNd0OLjUVnxRtnM5px5568UViyDz+9iTBa7zvcSRxvdQdxPsHv1oqVcVMOFNaYP6ToDDoYP+zxir1mtJE2ZnL8Ufy8HrDfSc+oRsDrLziIYN9iavnB5s7fIdlvI6HWGYsHr1pbh4bw//VCP2QNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624097; c=relaxed/simple;
	bh=jp5A+Lq0dxNQ470AANcNdgN28pUjVWj/6m9w45yEC+Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jsUsFRrTR/WthHYgAWK0oJKU2eDtvONZPZNkDvkv/m7srkINbth9u2W+EoYwdPvg3FWOEiPCE8YtAcRU2ly4o9qYAebXnw1T1nU8gyrvJQKeKCMuwGcEU6VywSI6abNRvyfFmA7q2AOaG6jK5LPJMxr/kNcASVRldpXzR22FYHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gwSsehUM; arc=fail smtp.client-ip=40.107.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuwHNV1uUmwVXQF5dd35QnJUXxefUAn6971/5y86aufgfDCIHRremjJD2lBQ4+PshkAmqaEFqD7NytcehX2fXx5FvXN8FYSKCgCSUP7AsAgXqKVLsX3HcIoyhdnVvkS+CiPIq/4iF7ywjDKSy6DsZO82Fo88XcmEGjmtBKxjFKK8xD3ieZPBhtSxQMVtNLlSacjNP1Ge4MUmJ7fEh7avHI6kuooOAQC7PNvOOk0ZOdDxrzwW5dEK9foSrHF1JqKhd8wJP2Qh0JIcDGdVE4PniKX9aQqhjCTgFBsMYq8sXILyUk+7DfB18T4sL6P+2+TrUCmV8UErdDkr2Qy1qPkk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MruZsTjdJWCRbMLmMTwHHX2eHcUKLOU3RmfWqq6dggY=;
 b=CEDgITo/1XRxJM0nYqY+WhVVOw5JY9vb14mA9Ey5cCzjpiBdHVt+uLDDz6I3C+dSu776zXSbkr+qCboaCRkGYJhdAR0vFVdwtNqIHo969GJfK16vHxd5rEDAKv6553OhN52ZXW4COjdV5UWMJhcKP8ogaLpdyBcB6hvSMlz6T5lpS9YY6zZLrD941+ih506u2eys4Qf4OGh8rKV2PzAhRduq+EMenXfvKYEhR7dwuJch7jvD3Kyu3PQ3r/fLZ8sWspeM9/HfZFYrKogWYeRWKSxq8I+eJBKf2oR75tMkuK03eHjM4Un8spiOSvIi0EiQPgLw/RXYpQfgg1ddbUUZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MruZsTjdJWCRbMLmMTwHHX2eHcUKLOU3RmfWqq6dggY=;
 b=gwSsehUMVygSkPFrcu9vmtES/sWh/nd9o07r8+7DmimZ8x9OWyZMZrVtqF2ma1w4SN34ObZNnQuMFBE9DNGBRBRNQ01IwTOWPW1bpyDi19u4dC+vHIaTxXNQRzsUNPvixRm4AcIVAe2H5WA9LtAdLNG6tISZTb2bXQbk4iCbzNKt4zDyXBz7Zo8Bek7V61TDaDEX1TZHXqOuac02TA/gCiVQ+sSxz5MoLxCC5+/+VdFbFfloWCdLkC31fC0CrIQu6NYNkNR8dTeILevqHGgLfQ4bGpGv2a65aiIwAp3jKesiMCh3PuTJrSmLVdU5bfjgU63c/+N7b2phYAP8xC7uEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PA4PR04MB7984.eurprd04.prod.outlook.com (2603:10a6:102:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 23:34:52 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 23:34:52 +0000
Message-ID: <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
Date: Sat, 26 Apr 2025 02:34:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, "Andrew F. Davis" <afd@ti.com>,
 "Shah, Tanmay" <tanmay.shah@amd.com>, Saravana Kannan
 <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0065.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::8) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PA4PR04MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 90595e85-58d1-491a-5967-08dd8451c6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3VDSXVKM0l1cURXcEFqSFF3UzVhdE1WYzUyTWZhb1pnajc2RXkxQThuamhj?=
 =?utf-8?B?VDJ0ZXZUbnIyWEZWNld0WExqeGVUcEk1K2NNalRYYnhuUmNrcU9sM2tSYW1I?=
 =?utf-8?B?OXB3NlRrSW9pRjFoeGQrcG9WZTd1WUxaRHBUVzA3NkNLd1NOZUwrZE0xTVlX?=
 =?utf-8?B?cmlWZlVwZ3lNYzF5RENzc2tEdnRFWFBpVDVYU0o5MUYraVJLdWtsYk9EWG5n?=
 =?utf-8?B?V2VhU2s5ZElLb2FmZTlYd3ZrRkN1VCtXczUyN2ZIUHl6bTA4YTBCTk4vQmhI?=
 =?utf-8?B?Z2xTdVZvQ0c0bVZybzFYTFZYejVwK2hNVm9MdFpyUVF5TDZQeVI0TTk1cHNT?=
 =?utf-8?B?OHJyWU5mb2g2NFRlRjkzNFdYMmVuTnB6VDFzRzBOdTYxSDBmbEUvWXljdldC?=
 =?utf-8?B?RWpCL3VlelRSU3RhNGVPTjFqcUtEMEhBc1h6aU5RL2oyRUQ0ZkI2dC9pQjQz?=
 =?utf-8?B?c2JacGpSeUczZkhIMk9lZVVxVWt6d0ZpbjBySWdPbUpnTURlSjRHTlFabXBs?=
 =?utf-8?B?YXk2M21CTkRveU1HNzNWdE5nUko4V1M0YTZMenRzV0FhaFp1cWZGUDRqdDdF?=
 =?utf-8?B?em8ydGFtbDJkMXZGUUdOZHZKc3FQanlacjRVRXdPU0xWbGs0TGdsdHg0c2JM?=
 =?utf-8?B?NUJzUm91NUNaOWVZOVhGeCtWMUZzK2NLOTl4L21vY3RwOFNGSkF4bGdJT0FV?=
 =?utf-8?B?bEk4Y0IrUXJ1eEVQbER1NERzS0RsVjBwODdwcExFR2twM0lCdDRQSFZNZWp0?=
 =?utf-8?B?bGFCbUZPRzMvVzRqbk43RUhVZVFFSG9TRkNUdFRNZkIzREpnbmRWMjI2Y0VY?=
 =?utf-8?B?S0svVDE2SXAvdTJqWklNOWJTdnc0Z0gvQVdsTmlxeXpIZzQrblBvUDlOS2k5?=
 =?utf-8?B?N3MyM25WVHJwTjR2UkcwdFkwTS9HbFhJMHpQRThUK0s2Q2UvcXlWWkZSeUdx?=
 =?utf-8?B?eGltMlAzSGYvdzY0eHc0amluVnhMMjdMK1o1TE1mN1FQL05qZjFSVjF5SzhU?=
 =?utf-8?B?QTdSeDJWbS9UWFRxRUsxdjlYSkxPYmQ1K0FXMVRXYTN0ajFRZEZlYU5iNEtU?=
 =?utf-8?B?UlBlWHhlNHJucHJqVjBTM01QTXFzTmdieDlxWWlzWkI2MnVGTWowZW5pZGdY?=
 =?utf-8?B?eEZUNjl0WTVOUnZLalE1UURqcGZnZkdOcm9DOW1CTHBXTU5KZjhUY3hSNDho?=
 =?utf-8?B?NS92YXJLTVNOVlhBTElGNjVrYUI1YzVrUld1Z1VYZzJWa2xzZlRrVCs4Q0tY?=
 =?utf-8?B?VG9IYm5idm5jZ2I0YjhoUzFvZXVBeGF1WFlXQStaTDVnZC9xOWN4WVNraTNl?=
 =?utf-8?B?NUhXY0JHaHIyRjJyQTM0encyS1lrbnFlWTFzMWJ2bEJrb3BUS2tvRnhTNlVm?=
 =?utf-8?B?UVN2N3NCaHBROHhFZzdTSjd4eU9WU1F4NmV4dnJqRlMxRVdmb0I1dDFtVjNK?=
 =?utf-8?B?OFhjZ3F4d0Ixb09aeHcrVlpTY1UzQ0VPNzF2cjgvdlZUR1BobDQwcXRzUHpa?=
 =?utf-8?B?UUg3Nno5SlkzeVorU0RpVVNpeXBLZXZrRlh4OGxIVnJpbmFlc1QxbEE2bmdN?=
 =?utf-8?B?WHBEUjN0Y3E5dndxa1Q1MlEvN3U0MUVBMnhZb2x1d2phaHVudjJ4aGdiUjRa?=
 =?utf-8?B?MFVJVEQzNVJ1R0JVV0FjcUtZb0FSdlJqWUJSYkowZ3hzdVZBc1Fqb2t3Q2hy?=
 =?utf-8?B?aW9JZS9iZHZDRkpFQWpvU0FSZGUzVkEwSDRqWVFXcDZuM3VWVFdrYXd3cjA1?=
 =?utf-8?B?ekpDSXBJL2dXci9GalRiVGordCtmTlFIV3NhZ0xIcHJ3STFqUjlDdkU1eVpt?=
 =?utf-8?Q?oadHW9T8ReTySsMbRYn0siRoHx2/OKlEheebI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhyVC9iV1c0Ulk3NUx3STRrVktzV2xsZ3ZrYTRuOEw3MjU0cWxOUG5td3d4?=
 =?utf-8?B?dHZ5TTBUVnkrTWUzUGdQc2NRbmtEd3J1OExhRFRHVlM3Q0RnN3JVSlRUMGZX?=
 =?utf-8?B?Y25OWXRaZXJkWTYxMGh2WEdMQmhmVENHQzhBRDBVOWRjelNObUJFbHpIUENZ?=
 =?utf-8?B?T0lyVW9tdEgrUnFGR0NmYzVwT0daQzh4TUthWXdNem1YZUVXMzk1SUZqUVdj?=
 =?utf-8?B?RCtGdldqMDlTd3pydnl2SU04b1R1RTRvaS91SkNzbGFxa2EwamptZ1Erdlla?=
 =?utf-8?B?cE5XM3dnN0JOWnVoYjMrNXdORUFYWEk3WUI3V0U3ekQ1WDZjVWxYZDRZRDZq?=
 =?utf-8?B?ODJjRHYzbmp1MEt0K2JEWVZIdlNtSkZzYTFRd3UwTXh5eVJvQnhYclE4VWxs?=
 =?utf-8?B?YUZ4TCtxU2Vnd0p2ZHRLcXBMb0ZZamIxdmg5ZjdkZ1lRckVuVEFjRXo2Y2JU?=
 =?utf-8?B?T3ZVVDkrUnVydXlFUXNseUV3VEhTSDNRQnROZ2FZQVBjSUEyMThJQlBzeXgy?=
 =?utf-8?B?Z2FSOVNoa1ZpaFFkTGNzZzI2YjhlWGtRQUc2cUN5MEdWdUU5aSs4eUZhMmF0?=
 =?utf-8?B?L3dURVAycFdQQjdCTks0TWJKWURxYkNLd3RyVVZyTHFqYnBLTXd3OGhuYmx3?=
 =?utf-8?B?ZXM1TFlLYUFPV1hTcU5ScVdlNHF5eEVjZUNJVkFmbTVnOTBvczRpOU0xVDFw?=
 =?utf-8?B?czd5Nk5hUThkSFAvT1U4QUxZdzBQQjZiZVZyOVFaQXNWQndFNkErWm5GajA3?=
 =?utf-8?B?YkwrLy9ZRXdIVW4zVXozbDdvUWt5cVhVUmkzMGF2ejgxSXBkaEtvcnFTTmV2?=
 =?utf-8?B?QjYwWXZ3ZGJzVXZaTW04VWlsbnRhYngwVG8wVTcrd2Q3Uy9sM2tLaWFGWmIv?=
 =?utf-8?B?TzVFcUxsVTVkT1FvMEhpc3BoV0pxQnJpZ1VPemV2dG9zM0lKY0o5WHpNTUE0?=
 =?utf-8?B?V3NVZnl4NDNXQVdnSm91L2pjaDJ1cjFYRXF3ZENtTW5BZkpuRU1xbE9FL2pP?=
 =?utf-8?B?d1NhU0lkM0g3WjVGYkN3d09RVUxwNnh0aitmY1ltMFN1SVAvcXJvZ1d2QXJU?=
 =?utf-8?B?L3JveFg5UFZXalB0aEhMcmhwUVQ3aUVlTk5kSTVreGxvWnpSTHh3YkxudFV3?=
 =?utf-8?B?eHZPeHBGU1BWang3RHJJOGRGQVFXUUdpVnFrVkl6RnVTMm5oVnNjNjhyazJy?=
 =?utf-8?B?STlEZlVlVjdVM2Nud3I0bFNQY1NsZFl2ekZ6bGV1alNud1RwZjh6OGViN2hN?=
 =?utf-8?B?WTRCUFBOWWlhWTVVeEJJbTlKaG1KT0NWWjk2cHdVcGlHUDRmS2tCMzYwNGhD?=
 =?utf-8?B?N3hsamlFaHJFSnZkUDVOWHgwc20reERMMU9HbWVLSCszL1BwTGMvUSt5dlNn?=
 =?utf-8?B?Ny9NS0ROc2QwL2VCQm9PUlpQSENCWTVHZEVlNzI0Yjl5RklSSjNMYnJqYjM3?=
 =?utf-8?B?MEhlYmJReG1kL29JUlhDQlRxUzhDZ2RzLzBaS0VOcGgxby9zQzhTTHRybEhP?=
 =?utf-8?B?SDE0YjJ0MTlMK3lRN3ZaMTFkaXJQMzlNQVA3U3dSWDExNEZHMGZCTUxJMWV6?=
 =?utf-8?B?ZzZWTDhXak9iaGtHbUFVRHAxdEsrL0dRelVjRlA5SExiamNVNVdtTjcwd08x?=
 =?utf-8?B?Q00rdlBUL0FhUnN2L1V5WWtvK25ER0dzdmpNektIOEp0NTdtYzByU243NDZX?=
 =?utf-8?B?ODFmU3NtelNTNXpCUnBPb3RxR2REMUF0VWxxYjM0cHMyTDljY242YmxNOE5M?=
 =?utf-8?B?QzdERkEwN244R2V1YU5VR0ZtTkxRUkpiU1UyUE0wZjU2QndTZGV4QUVtdFBF?=
 =?utf-8?B?MFpPYTgzeHd3MmJQUlZDK3BJRTJjU01lblF3Z0o0N01YVGVzWjRSOTBCR2VX?=
 =?utf-8?B?b1dDZkE4RzJ6TWpMSGh3NHVQK3JJNUtwdk5YTXc4dnVVWVZOYTlYR251UGhz?=
 =?utf-8?B?Wms0WVJKN3J5ZTBpV3JJNjR1bXltbzZmYkpWWFNPREJzVlZENzc1VmVVWlQ4?=
 =?utf-8?B?NEJ6ZFFvVW5qbFkyK3lpTkJvZGxVbEhmSUFCa0ZFL0lzTWlFNUs3ckxyN2NO?=
 =?utf-8?B?Y3BObEtFbDZxQnZ6Qm9sWi9CREswYzczMjRPK0Q2K1F6TWtOZ25vbFI0RDBy?=
 =?utf-8?Q?jKkld3rtN98hmPRFGhMb+W9Bf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90595e85-58d1-491a-5967-08dd8451c6b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 23:34:51.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtF/z/AQ1cpIjtTozMHR+rM0NxbBHZHphaRZ70OEmoNeglf4eLid7zUyDMFQ5iTpeql7N7ix8lok8Xgym1bAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7984

Hello Mathieu, Rob,

I've tested imx_dsp_rproc and it fails with:

[   39.743770] Unable to handle kernel paging request at virtual address 
ffffffffffffffea
...
[   39.805078] Hardware name: NXP i.MX8MPlus EVK board (DT)
[   39.810390] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   39.817353] pc : __pi_memset_generic+0x50/0x188
[   39.821892] lr : imx_dsp_rproc_prepare+0x3a4/0xea4 [imx_dsp_rproc]
[   39.828079] sp : ffff8000853dbb10
[   39.831396] x29: ffff8000853dbb90 x28: 0000000092400000 x27: 
ffff80007a36d3d8
[   39.838540] x26: ffff0000d0a5e410 x25: ffff80007a36d3f0 x24: 
0000000000000004
[   39.845685] x23: ffff0000d5414880 x22: ffff0000d5e1dce8 x21: 
0000000000000000
[   39.852827] x20: ffff0000d5e1db98 x19: ffff0000d5414b80 x18: 
00000000ffffffff
[   39.859970] x17: 202c656c69687720 x16: 3e2074756f657672 x15: 
ffff800081f8d050
[   39.867114] x14: ffff0000db584680 x13: 0000000000000003 x12: 
00007fffa3330000
[   39.874257] x11: 0000000000000004 x10: 0000000000000ab0 x9 : 
0000000000000000
[   39.881400] x8 : ffffffffffffffea x7 : 0000000000000000 x6 : 
000000000000003f
[   39.888546] x5 : 0000000000000040 x4 : 0000000000000006 x3 : 
0000000000000004
[   39.895689] x2 : 0000000000008000 x1 : 0000000000000000 x0 : 
ffffffffffffffea
[   39.902837] Call trace:
[   39.905284]  __pi_memset_generic+0x50/0x188 (P)
[   39.909821]  rproc_boot+0x2c0/0x524
[   39.913317]  state_store+0x40/0x100
[   39.916812]  dev_attr_store+0x18/0x2c
[   39.920478]  sysfs_kf_write+0x7c/0x94
[   39.924146]  kernfs_fop_write_iter+0x120/0x1e8
[   39.928598]  vfs_write+0x244/0x37c
[   39.932008]  ksys_write+0x70/0x110
[   39.935413]  __arm64_sys_write+0x1c/0x28
[   39.939342]  invoke_syscall+0x48/0x104
[   39.943094]  el0_svc_common.constprop.0+0xc0/0xe0
[   39.947805]  do_el0_svc+0x1c/0x28
[   39.951123]  el0_svc+0x30/0xcc
[   39.954188]  el0t_64_sync_handler+0x10c/0x138
[   39.958549]  el0t_64_sync+0x198/0x19c
[   39.962222] Code: d65f03c0 cb0803e4 f2400c84 54000080 (a9001d07)
[   39.968317] ---[ end trace 0000000000000000 ]---

The problem seems to be when computing `cpu_addr = 
devm_ioremap_resource_wc(dev, &res);`, in patch 4.
In `__devm_ioremap_resource` (see [1]), it's expecting the resource type 
to be `IORESOURCE_MEM`, which is not the case here (at least the flags 
are nowhere set for this).

A quick fix would be to let the `cpu_addr` be calculated as before: 
`cpu_addr = devm_ioremap_wc(dev, res.start, resource_size(&res));`.

Thanks,
Iulia

[1] https://elixir.bootlin.com/linux/v6.14.3/source/lib/devres.c#L134

On 4/24/2025 5:14 PM, Mathieu Poirier wrote:
> Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
> on the platforms you are working on.
>
> Thanks,
> Mathieu
>
> On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>> While there's a common function to parse "memory-region" properties for
>> DMA pool regions, there's not anything for driver private regions. As a
>> result, drivers have resorted to parsing "memory-region" properties
>> themselves repeating the same pattern over and over. To fix this, this
>> series adds 2 functions to handle those cases:
>> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>>
>> I've converted the whole tree, but just including remoteproc here as
>> it has the most cases. I intend to apply the first 3 patches for 6.16
>> so the driver conversions can be applied for 6.17.
>>
>> A git tree with all the drivers converted is here[1].
>>
>> v2:
>> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
>> - Export devm_ioremap_resource_wc()
>> - Rework handling of resource name to drop unit-address from name as it
>>    was before.
>> - Link to v1:
>>    https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>>
>> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>> Rob Herring (Arm) (4):
>>        of: reserved_mem: Add functions to parse "memory-region"
>>        of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>>        devres: Export devm_ioremap_resource_wc()
>>        remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>>
>>   drivers/of/device.c                       | 31 +++++-------
>>   drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>>   drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>>   drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>>   drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>>   drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>>   drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>>   drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>>   include/linux/of_reserved_mem.h           | 26 ++++++++++
>>   lib/devres.c                              |  1 +
>>   18 files changed, 339 insertions(+), 369 deletions(-)
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>>
>> Best regards,
>> --
>> Rob Herring (Arm) <robh@kernel.org>
>>

