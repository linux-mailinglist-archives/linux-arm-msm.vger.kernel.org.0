Return-Path: <linux-arm-msm+bounces-110713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIrfJftqHmqojAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:32:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E568628964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69AFD300D7B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D8830FC1D;
	Tue,  2 Jun 2026 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="r/i0KLDB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012008.outbound.protection.outlook.com [52.103.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0DC3090D5;
	Tue,  2 Jun 2026 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378356; cv=fail; b=L0hscPTfaCjUWIPrEaUq9GLMQts1TIzYvWtDHU6RjU6E9nlwBx9nhGhuomTWQcBgMzi+D6gvdQ3F/O3BRS7sSt6MOm8onrNIIAzKpdi4E4AfMz0buL9KcKp5Ez7AwlMcDLXUV+fdtZyN/nudfgQaZWKRa2X8Al10+DyS90gApe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378356; c=relaxed/simple;
	bh=NuiDfAIM0BEubY7+l4cQlxdGIa2SfvHwz6K82tSffoY=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=uwe2WKokuY6DTfyLSz7YpzeAf5sgFTrhoYVb6e9en++NDI7jlpPhFwksU5a8BZbh5ba3utkKJohEycYfCDDn2jlv4S9VMWvjK1K9dJ+93EIBZNeMqyfNUwpCbWJAyaZupZ61A0jDXtutg9qWbqSU9Z7JwN30BqV8RdvqPjInx/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=r/i0KLDB; arc=fail smtp.client-ip=52.103.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNKB250Anr7e4eWI6M/4m1ZUke6u1rBtm3AT6SqXExMyhOv7SBY28aRw1oh4onslGkDkqsq0XATqz8gD0Dtd8ZZbSprpH5xchWSoTyNlQr5hSsg9by/942PxFIEMxyHGBXpDFAd45aCZ7m3dQ1u7VJryl+GdB+uczedEr/0e4Ufb5LaKnXUe0WGI2J+2L4WTygPuBBaBIJLQh+XRZv1zVgusilLyvNgYuV7FiJmiRpappZ797BIIns+0hGIuNGQtvP5B6HzJzFJp+6Y9on/F6TidZU4eFQLCum9Sd7vH8+pnfb9R23SXnzmzM4kbDmoAQbcep5SgyWZ/qZ5rUxP+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXD4bWoZIC47ZpE+Mu6OIZdqcarsuN80zQ+6ZP4Mn+c=;
 b=X8CBAZl1ZTTUDHVxttmVMlS3LMXm6hvnbhMlenjYrSp/ApK6vkUGgn/WHOoWz9HfT0Rr2cJExiNR2tz5Gd2qkihXTWh1JjJSO/N+uHHlcD22RbVLeUPzOuh0lA0bKKDid41spcXxnHjvpuTKBmkSX3KDUfCO4b5BJus+yKXooXL/Haf4Hxyf0MWENDlB9ocVkwEU4CPl3U1dBQR75hflVWZOqdgYKfDMYEtp28QhfF7f/x7K/uBjCGDiyCOUve/QfNidbCyMrqrRCU1pVn3qzlGIQbyXNyOo9fpJkCwz3Uvfhu1mncpic+7yvcMHOI6VBiCpYgsiEl+/9tt6MnTPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXD4bWoZIC47ZpE+Mu6OIZdqcarsuN80zQ+6ZP4Mn+c=;
 b=r/i0KLDBcDNhSCnmLyI7BU77KWw1GNR52AQUIuCkcWjJZTUghQhTMZZ7vXEMn7ZYKnI7C52SorSXteWujqc/b56U5IeileSsc+FgHuoA7vBpXd3b6Jg6xji7w62J/pRD/f/+LcZQaJhd3NTNFxmcSuuxrCX21QH8YC5lRyZxNDWclhXbdSG0cC0XZFM4nu6gySNuiVMb1EZzca7wKkauaIBHa1l4h7lB0lc/WN1O6N3aFRurFUSeJ9LbaakmaKjfOZHudu+cy6ASgnzxN6N9zdQNoW0VFGfX49PmYx8gkwndbzMQ6NNs3fBOKfkB+6geYuZ+A0tlga8MggpxPTEWew==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by ME3PR01MB7992.ausprd01.prod.outlook.com (2603:10c6:220:192::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 05:32:29 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 05:32:29 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Tue, 02 Jun 2026 13:29:58 +0800
Subject: [PATCH] misc: fastrpc: take fl->lock when moving mmaps on
 interrupted invoke
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB78817DBE3397783540CE3372AF122@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAFVqHmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMj3bTMitRi3aRE40QDwzQzszRjEyWg2oKiVLAEUGl0bG0tAJZ8KMh
 XAAAA
X-Change-ID: 20260602-fixes-ba3a01f66f34
To: Srinivas Kandagatla <srini@kernel.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 stable@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=NuiDfAIM0BEubY7+l4cQlxdGIa2SfvHwz6K82tSffoY=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGLLms0Nw14QGhs5p0Xs5I+KbEaCP06Wtq1iJu3rvPu
 z8EBe6rZegoZWEQ42KQFVNkOV5w6ZuF7xbdLT5bkmHmsDKBDGHg4hSAifzIY/in8Ic97mvC0XsV
 p65/8RL6w7rSwN9Ns/aEgts1xpSWt5NeMjIsW98aXfb72nyxY8ZviyUiZFpFF51YJWut1mtY6/w
 5cTsTAC6TSfA=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: TY6P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::7) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20260602-fixes-v1-1-ff1ee84b68f4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|ME3PR01MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f04d48c-2a7b-48ab-443e-08dec06855ed
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|5072599009|19110799012|8060799015|24121999003|22091999003|24021099003|6090799003|51005399006|5062599005|23021999003|15080799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkJQdHVla3FvZURqaFRzTmdEbDhhcjIxU1BsbzZnejBQZGZzaUhLcnhSSzYr?=
 =?utf-8?B?cmNZMnpHMWlvQ1VaeVpONU1IYndjYkxFOGZ2QThNVjJKRHlrcG5UV0p5Q3hV?=
 =?utf-8?B?L1laaEx1NkY1clVwTGRTb0gwcE1jWURzNS9PN3FBV2dhdEhDTFBWV0N5U2Jl?=
 =?utf-8?B?TCtRdkxMTmsydlRCaXhwZjZPK0dkdEFZNjBkbTl2MXpyd2lsWUdRejBMSWlv?=
 =?utf-8?B?VW50ZlhjSEZBYlVjakZ0YnpvR0JZL2lXZm02VUNZclpYNERra0xRYS9kRTNx?=
 =?utf-8?B?c0trb090YWV2K0JYUjJlUS9LbldwM1p6RVZ3SFhqdnN2WG9iL1lQZmRFOWs2?=
 =?utf-8?B?ZHFBanVYWUZXalRmNUdnczRwQ2ZxZ3VESFowMWhpT1dYVnJ1OTlTbWZWejU1?=
 =?utf-8?B?aWhGRzUrem5JeGQ2UFdJNzBSZjZQWTNobmR4SDA3OG9lNFlHZCtBTEJxVmRq?=
 =?utf-8?B?b3J6bVhLVXJVSFBRWmFXRWh3WFMzUVBCYjNPbk12YXhKa0RXZmpScFZvMVYw?=
 =?utf-8?B?M0tlblNRTjIyNzYvZmwybUIvR1F1SEYyeFdpdW1JZjBKSm1sSkhWYVdxSlVW?=
 =?utf-8?B?VFR6ekQxYjZPV0lZVkdmZFZpWEEvQU1sYkpqaFFJZjh5d0FnVlJjV3RaWnZG?=
 =?utf-8?B?Zi9HQW5sSlMyVFhtU2xOMGVSaTk0WmZPbmFUUHlXOGRua1lNQnc3ZC9ITGsz?=
 =?utf-8?B?TjBTSGpwTXNobVhJMWN2bldpQnhjOW1CYlBmV0M3M0RNRWszczNWcVRYOEN1?=
 =?utf-8?B?SmdkTUY3UGRLZ0RKNUZBVFU5bGY4SExXNjQ5SStNdE54M1BseFhqSmtDeFVi?=
 =?utf-8?B?Z3V4YTNvUlp6VERwQmp4ZFFuYllROEUvdms2RHlUcXBwQ1dpaFV0b3QwelZz?=
 =?utf-8?B?eFg4U2locGNodjk1K245NHBja0c0V2lmaklkRStheDBMc25DcElpdXB4eXpN?=
 =?utf-8?B?V1JwaFZVU29YL3VvRjFnQmxQcjNLbXZobmFTVE5rU1NpWXVKYUN3Tjk3VHlV?=
 =?utf-8?B?NnNaY3dybHZjYWdCZU1lRlQxVUpoWEhGcTZLVGlRdURLT2dWRjBHY3RIbkRy?=
 =?utf-8?B?K2dzLzZSdEprWDlsMEVNVzNhanJWc0NlMUw4SXVsVkRKaTNiZFdLMVcrMk41?=
 =?utf-8?B?TlNnWDBjR2Vna3lCUzc1WThoWE5EVVBIaENFS3lZUmsxMmRFMk9lT2dZSFd5?=
 =?utf-8?B?anVmZmtvMzB5Mi8wZk9VN3ZRUE5HYnZJTXNmT2pjM05SYVFKR1dIeGlJQ3Zm?=
 =?utf-8?B?YzNEc0VycEFCRHVINjVXSk4vRENpVnpUenNVUWp5b2wxbCt4WU40ekhUOWxB?=
 =?utf-8?B?K0ZiQXkxM3Q2c2xzRys1VlBTd2dkMWVjOElGUFZNVlR1V0VlNTlsbnNRQTZu?=
 =?utf-8?B?bjErSjRPZGErRjI3UjUrd2w2MHhmZVVxTzFNQ0dYUzFaYkpxeFdSd1UvMFRn?=
 =?utf-8?B?UzZYVDFjdXVnVmdvMHhDcGI1akgwbmFaZFV5Y29uclpKaHQ1OFdsRmpmL00w?=
 =?utf-8?Q?J1KjjUViM82w/ClTLLCtpma5+H6?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJVcVYyK1FlR2d4T0gzS2g4NXBodW1wLzJOL29MR2NFd1UyMWFSdTYzcVRw?=
 =?utf-8?B?WlZCdDUyWjJmUnBOb0dTRDlKcjMyTG5lMlZPcWxJNzlZcUVGRkh6SFFKYkNu?=
 =?utf-8?B?UXBtRmEwQjZBcmdNbHNhTDBjTjNtUUpWNk5iOGR0TS9PWTJ0ZjQzZFAvZWtF?=
 =?utf-8?B?N3pvZkNqeXU1MGJuL1VBdU44cUkzR2RJb3ZvaERhYlZaVS84TGRCZTBtajB4?=
 =?utf-8?B?SWxyRlJURUtJOWM5cEI4YzcySm5uR1JXU0JhT3dPaXRpOC9pR2Vrdm80K2Nl?=
 =?utf-8?B?Zmd4NnJGOVJLZVEzam91d3NTMWU5ZjYvcm9yRXJTak9yRnJ1dk9URGExS2FR?=
 =?utf-8?B?WWRyWWJVTHJsd1pTQVVYYmx0SlNMblpldWpqVmNOb0NVaWl5bklkQ01QazRD?=
 =?utf-8?B?cEV4ZVh1ZFJPcktFa2JWUDM4Z2pGNjU5N2FyUDFpQm5ibGFCTmFtSUdhaTlU?=
 =?utf-8?B?Mzc0dWJMOUthQk5LZXdhOXpqM2h2RkcwaDN2SldyQVBOa0hSODNqeVZpeVkv?=
 =?utf-8?B?bHVzVmp2dmFnOThaRmlLdzQ5dE0rdTFkakZ0NFVNcUI0b3k2YWJraXV6REtM?=
 =?utf-8?B?bE85QzlyYUFMSTIzRTZoaXNUelRhV21ZemJFeFg2ZllWQUdHUDlTUnhKVk5I?=
 =?utf-8?B?TE1ha1dtNnVIdllqSWU0aHR5bGlqOUpKZURKK29rc1lTZVhod0lOeitXdHpF?=
 =?utf-8?B?aTRrSjh3WnRxdGZVd2VtdWxTYmpRS0tGd3d3OWlUdWVmL1ZhMkNGelVYYXRw?=
 =?utf-8?B?Tk1scmJ4VGpSamlNQUlNM29EZ3JOSXdJTlZsdmtYTjZJMzh4dGdObTY0L1Z1?=
 =?utf-8?B?K0FjTG9lY0JKOGhNYisyWG1xVDRsd1dVTjBnQUxHSWNYYzAvNStvTzlCS08v?=
 =?utf-8?B?RjUxMkVscVljc2NmZTJ6N2l4UE5tejZKSjc3Y0ptT1R5aGh2N1lCcW9DQXdj?=
 =?utf-8?B?cHo3ZzFLWXBzTFVLNE5nSElQR2JvMnJhejB0eWxVTUFQc3A0NGZxclNvckhY?=
 =?utf-8?B?OEhuQXhSUFM5UEpFWjJZZjkvNHZxV0ZOM3RSMTJXYkdUQmhxRC92dlhvQUxq?=
 =?utf-8?B?S1V2NzVEVXgvVjl4QWQwN1g5N1BheE9nclRzWS9QcTlnRm9sSC9qWTc4OTky?=
 =?utf-8?B?UXprNHNUK2ZlbGhhc09ETkZMRWNtYXJwWnJ3OStHaFY3TGNwWFREbkZDdEJy?=
 =?utf-8?B?Y1RNQXlwRnE1blFMeGFYR3JHbjZWaUswQld4RDFPbDNaQlA5emUzQkFNTWRM?=
 =?utf-8?B?dS9vZTB2dldIWng4cEFhRXJCNUpJZTJ5c1ZWeUl2eHN4RDB6dXovTzNFRHdJ?=
 =?utf-8?B?Z2x4bFErKzRJZVRVbnFjSVNrZGNhWFgrR3ZBMjYzY0Z1QWJXWGRtTjV0eU80?=
 =?utf-8?B?b0J2YlMyZmxOY0xvSXRpZFBMMTNObW96SlYvMkFLbW9TREN6YllxV2t0SHRq?=
 =?utf-8?B?MzZIU0xDcHBHdkE2M1Fhbk5vd0ZzZ3dHZkpYNkZJUzlJdFo4OFMvdmlXZG5Z?=
 =?utf-8?B?MXMzaXNPYVZhcC9Ibm5odG10MXdtR0poclpUWUFPRHNkNnNRWUp4dUV2NXcv?=
 =?utf-8?B?QXhSVGtMTXhJOUJ2MHI4cDVVcjcxZEhac0lWNDRKZHp0TGJpcTlhUFlVNGdV?=
 =?utf-8?B?cHVDemUvSzFJRzJ6SzhTN1BlRU5tWm5VUzBHZklWQ2RWczhZV2dpenpEZXFE?=
 =?utf-8?B?cURNTDlIdUdqWHJ0a3ZvU0hHZW1HQnpCWWs4RzloRGJtbE5obGFqWHdPYlc1?=
 =?utf-8?B?SC9tRWR2VmRVSVFPR1djZ1lxMVV4Z2FUMWU1WGtxcTF0VmRSb1JyVloxdWNy?=
 =?utf-8?B?UURoTlhUMVhkakpiTUVpSUVNWE1YVW5FeWoySlpISnVZTXU4MVNnZlZkV2J4?=
 =?utf-8?B?aDA0SHpNNW13ODFGc3VnRUFDdHY1SjlYbHlDbTliaTdMdVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f04d48c-2a7b-48ab-443e-08dec06855ed
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:32:29.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB7992
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,outlook.com];
	TAGGED_FROM(0.00)[bounces-110713-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:email,outlook.com:dkim,SYBPR01MB7881.ausprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 9E568628964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When an invoke is interrupted by a signal,
wait_for_completion_interruptible() returns -ERESTARTSYS and
fastrpc_internal_invoke() moves every buffer from fl->mmaps onto
cctx->invoke_interrupted_mmaps. This list_del()/list_add_tail() walk
runs without holding fl->lock, the lock that serialises fl->mmaps in
fastrpc_req_mmap() and fastrpc_req_munmap() everywhere else.

Take fl->lock around the move, matching every other fl->mmaps accessor.

Fixes: 76e8e4ace1ed ("misc: fastrpc: Safekeep mmaps on interrupted invoke")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/misc/fastrpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..1601c9667d0b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1259,10 +1259,12 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	}
 
 	if (err == -ERESTARTSYS) {
+		spin_lock(&fl->lock);
 		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
 			list_del(&buf->node);
 			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
 		}
+		spin_unlock(&fl->lock);
 	}
 
 	if (err)

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260602-fixes-ba3a01f66f34

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


