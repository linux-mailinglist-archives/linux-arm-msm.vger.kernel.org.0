Return-Path: <linux-arm-msm+bounces-92964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDEvBRckk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:05:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B105F1446AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32293303CE2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C09331062E;
	Mon, 16 Feb 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U/Djn2sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF3830FF10;
	Mon, 16 Feb 2026 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250633; cv=fail; b=hdrBA/rDeOe8SoxQKnRcUTYWzaOOBD+Ve2yHl5o8GlQqZitYYbofHl3v+X3cHAmImhTfVRvHp0rNMpqu1CZ3KzCGq5aP0YKTa9ZL5DUeUuXajsxOprYrwRuERIt0/1KVycgx0ezUfsCJ+K9TgtY7z8/nOMWK1Ja5lZEFzPyipMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250633; c=relaxed/simple;
	bh=OD6gdrPNuD3h2kENjArw3ihjtagLd39JjDT+eGvgRmc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bctv4leX923EmzqzAYaVllq+LW45AMKTYt7dJYHqsqe0wxfc8N/I6CDYzxcCzZXYFryU08y85dAdDzJi6Q/2H0KUMjayWPB/Yz08Lz1yUVq/ybmGfX0xJiigk+6HkXAxBsgCTRpEG3IrTwlEAcCOfT4mbPtUys3qzhBsqz71vSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U/Djn2sy; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUH30I5HsX6YwarX2vV5IgnbqcTd2vPiQ66p4FhTUf5b8jC7cA3jypUw5yQAAwkb78bgFDPPDCC71jzG7MPMkfOZ2j0u4yolE821XyESaU/r2kGJVablyblRizzvx1wGG4HfIgJhs/+VOAfaTIvyTTETNZ0ZnuMb3cs8tdSwT4iQwX8lwzrp+1kY+OXoM/VfA1wGM0GZFsHTKM3zT8mvwOCmzT1YyWEcyZmOuGaoLvn/isCCJ3i/IcghSWi/YvUA64qybaANFuSNoLjYvASeaDNQr6EfLEMZVpFbG+IkSU6LIRyJNUmj/0C0bxPqq2mVLoYSOhbW7f6FdJUnBx9KGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz80//Ya72waUmdB+N165dYi/JbLJeVjnb2DYOV3eCU=;
 b=FG8ySuGiW4bHJfJtEiT3b6XCRr/9wiD91kFA1g1x/Y11Y6xVAIbCJCgu1tUQCfEfo4Y4VnXvQeVgFomvDyWeucQpaG4CrDiMOEsQhcBMdihYTxgqS4hF3TJAmCkVZkhct/mVgkG1FRKN2faM8qXwF5YMGW81Vb36yUPHqx/LQlSLNuwOEQ985azAIlh1y8mYHdB4LS6EmjqBHEgu7fJsX0an89F6ndQGnqbr8Axj5ZbdM6rZ4nCN//wxXPe4x3VuL3T/AEdqzUQdL8RkOuOPKhf04Px+WVnGVrnIWdjTlEhC88Tksoa/xaskpK/Np8cFht/90libqu7zG7ugShosNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz80//Ya72waUmdB+N165dYi/JbLJeVjnb2DYOV3eCU=;
 b=U/Djn2sy43+iWP1z2hsyr51UfpiAdb/HFe1y6aRUJTA5FSqhnfTC2JKKH0A96nCj21h9bCvL7sV2/CeLcymMos9cTm7nFTsh4yVwPtNwC7zajiZ4bL6DpsuqFwm6lbtofUTiTllrt9EOXbL2h9MzhOQWpJZwHUbw8Mvp4gr/jajXHFCmCFbo6nkbcpX3e2YqDvPE8SHk5V02vwJzn2Lk3mKR0zBKRKj7Of7azBS0o3Ll/t6dQ4BDtuLLa6E0g5cildgbTQEotwHmnIrKgfp7N6/GVRxinA/g4RU4zVXPxa2hXm05mGGwHbG9L1ZjsH6QOiLWNlkLiC4H5E5JyPClBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 14:03:47 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:03:47 +0000
Message-ID: <f9ac8c8f-8959-416b-ba90-14f0886c5bc0@nvidia.com>
Date: Mon, 16 Feb 2026 14:03:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PCI/ASPM: Override the ASPM and Clock PM states
 set by BIOS for devicetree platforms
To: Manivannan Sadhasivam <mani@kernel.org>, krishna.chundru@oss.qualcomm.com
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 manivannan.sadhasivam@oss.qualcomm.com, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "David E. Box" <david.e.box@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Chia-Lin Kao <acelan.kao@canonical.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
References: <7306256a-b380-489b-8248-b774e6d3d80e@nvidia.com>
 <20260122152903.GA1247682@bhelgaas>
 <5z7c25nkb35prvax6vq6ud7eaeuhzsswbf7fqvmlgys3xftgwb@odocboejrdrv>
 <e44c330b-778b-4fa1-b678-fa909cc05b03@nvidia.com>
 <bf37b6a5-268d-4c07-a536-a826b3d5953b@nvidia.com>
 <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <unc5zefwndgcv7wufaezz3gkg3qtaymkjlmymhyqdqwzn3wybl@ow2rhbyt772h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 787ac05c-dd82-4aad-56bc-08de6d6433fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHRyS2gxZmtTVjlQbkZaeTJHOERtenZUSTB4djM4eEh4cWdFc2Vwai81WUFF?=
 =?utf-8?B?OUhjYzRpR0JpbDBCL1N2QzhvOTFFdVc1WVo2ZzBUS1llb1g0Rkl5RjJiNUFp?=
 =?utf-8?B?L2RZQUQ0RmU5dytRNGZHbVQrNFE5QXJFQ3dWOEg0TW52aVk4MnBDRnMyZW5R?=
 =?utf-8?B?WVlkWFJBSkpnNWVCRzF2WkVyZFNRRGZvcHZoa2NlZ2hQWmphQWNlMkdheWd2?=
 =?utf-8?B?aUNiQVpZRDlrbUJIVDNHVUxiR0I2d0Z6eXo1ZzdNem5qVWdIL25GYlBVQy8y?=
 =?utf-8?B?TkxMQWNGNC9YMzJRMG11eWVZWURYWktBVmVsWDRxMTlkSC9CY05YSmVta2FS?=
 =?utf-8?B?dWxLTk51cTdUVWlXZC9PWGZvalpDbFlGZk9pb1liUnRkb212OThjWDU2bVNi?=
 =?utf-8?B?aGNKUml2NzJBYURTbUlLeWo5WWl2M3R5aHBjcGVUTkN6SDZxck9KZFhzSHB3?=
 =?utf-8?B?a1llcWQ1RnFJdXlmZ0wwNTBHdFBsYkhuQnhVRG1KdlBIRmN1Y3dsUStOM3ho?=
 =?utf-8?B?eCtVbTR1VmdjNW1sUkVSMFFtcUc4RUtXWWF3MWQ4K1BhcW9naHp0dFpETG1K?=
 =?utf-8?B?YWdxN1pqUk4vTWVJKzEwSCtMazB5YXB1V08vQ3FTNzc0bnRYQjV3TU9YQklz?=
 =?utf-8?B?Z2xkdmpGYzQwQjY3WlNqbklyV2FiWXlWNWcrb1IyVjdWUlQ2bDdXNEVONnZ5?=
 =?utf-8?B?SDZ4Nmc1aXFTRmxFWndKcUFoK2JHemRSUFJXNWp0QlY3Q1huNE5Yd3RkaEJQ?=
 =?utf-8?B?WTRpTktPUC9YQlViTGdmeDNLK2JXTVBKbDNDR3RrZ1hnWlJ4eFp0RUVkZmQy?=
 =?utf-8?B?SU0rSmc5dkxpUTc3aXpHeTlnaGlzeXBSdlZ3Z3FmVmtad3NrT3JiS0NFVSsw?=
 =?utf-8?B?U2I0VFZUcnBFdFdTaEdWcGJFTElhdVZ1MUtDSnB3cGhtRnVaSE5pbFZ5MUlG?=
 =?utf-8?B?bGZSSkJETzZOZHdSbHFVc3V6TGY3UWFNLy85VTVXWGJTTGNsdU9GZzJnZDdP?=
 =?utf-8?B?dkxQd1ZZT2ZzeS80Q25RbG1OUjh4bUt6dno2eFk4WW43QUsvOWlsTGpJQ1BU?=
 =?utf-8?B?dk1VdVBwRU8zK29pRG1ubURXbVl6R1Y1YytMSnc4TGhuL1NTSUZhYU5UT1g0?=
 =?utf-8?B?azJmMkdPTU43TGsvRmdBdkNjMjZia3VtQXJnN0VmU0xobTc3dWg0OFNPVFNs?=
 =?utf-8?B?MnFRSUZPUUZGMms4N1FSY3NRcVpQOW1GQ0pWMzhyUUtTMnp3OTY3UFptNnlr?=
 =?utf-8?B?czR3MDNHV3VUR2psc0JzOURvZGxFWG43VHFyRmZmTzNVbHEzVmEzdDhUNVAr?=
 =?utf-8?B?c1VCOVVsa20wejZKaGNXUVZKM0ZFWlVBRzVZaHU5THlIeFZucmVzZkdqL1hN?=
 =?utf-8?B?MzM1RERzYkhsR2ZUeXBTNWdIL2ZzUldNdDVoNmVGMUhqMndyb3dxQWduNlEx?=
 =?utf-8?B?eWlXZGVtMjJjRFRBaGRPNUJINjNGc1BYNHZyVlpZRVRmMi9QQ0NpM3R2Q082?=
 =?utf-8?B?NS9UUk9sVlNGdE9mZ05tQTdXa2FnYjVDMGEyL0VOTHdWOTlzd25JMjBLRzQ1?=
 =?utf-8?B?akd4d3ZIaFV3Q3l6ZWlZenBUMXd5cnhGUnJJR3JBbE9acWo0VXdSbHREUm54?=
 =?utf-8?B?d0xGRkhaYk5YYWt3YVJTMUVzRDUzZzVZckt6c3hxMUVxT0wxRGhTTlJTTmJ0?=
 =?utf-8?B?NzVQRlBIa3ZQNDVBL1MzS1N2VEdXL3JrYjhnQ21jMjlwK2I1c3BQYzZZZUho?=
 =?utf-8?B?V3ZlVGVTNWpkY1BYQTBWMWx3U1BORWtlYzVvc2VONmQ5eXJ0WUsxZXhRQ2NG?=
 =?utf-8?B?a3BNL2VwK045VDlkNWxBS3RlQWZSSkRETE9MaEtuUzlrdjgwRWt5cmU3VVhP?=
 =?utf-8?B?ZGdzRXR6R3JIUWwyK3JnbUtoUjcwUDhwM04vanhrdlVvcDBSTEt5eHBMeFll?=
 =?utf-8?B?dXJUS3VKOU9UOE1rWmRheGNtSzFyZWZGdkRpY3ZySklFc3hhLzRMcXVzMHdW?=
 =?utf-8?B?b242VE84bis5dXdXNnhnY3cyYnpuaHU0RXk5dUNzeWlnd1pLcDhJQWZlNDNp?=
 =?utf-8?B?SitBT1JEcVNvdlJFbkJzdkQxcnFFWllLMW16MGdHUWVRVERCaEZiTnN4WGE0?=
 =?utf-8?Q?HK80=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1pvNkNtRWUvZUN3ZGw3c0UyOGFwM042a0ZsZm1pajNKMjQyM2RnRTR1RE5Y?=
 =?utf-8?B?OFMwSGE1QUZqeGl5TFQ0K2lxbWhYQ2RpZE43ZmtFZ3BTTlo5alNPQlZBNkx4?=
 =?utf-8?B?YWlBa0xhaFpBTUh0TExFQk1FeDllaDh6NkkyOHl2VE15bFdkSW4xT3dVTDJQ?=
 =?utf-8?B?OUZ2WUplTzM1dkU3Ymw4Q2FjOFdNK2ZZQ0YvT3d1MmxHaXNIcVZ1MXU1TjZx?=
 =?utf-8?B?dWlyazBjdE9VcUNBaTBvdEJKUGtqaktVekZiS1NyVS80OS9mbjZMSHlwUzlh?=
 =?utf-8?B?WmdCWWd0L3dmQlBRRkZKcWloYitxUVNsNWs5NDVHdFVZRkJmM3NzNEd0OHFK?=
 =?utf-8?B?T3FLZlFkTEhDb1FqTzh2a3cyU01LNnZyMDdQcllUcHNWNzNBSjNCdlBpYVBS?=
 =?utf-8?B?WHRwUi8xRjNUSWUyelZ1ck1VSFZNLzBjcVBROEUvQlU5ZGJDeEtOZGhzZEk2?=
 =?utf-8?B?OXdsTENGWmJTRVFibmpqMDQzNHRtN1JmSUcyNjJqZXVtWlFzVzNWYlJPa3Zo?=
 =?utf-8?B?Q1hRWlE5cXhWWk5WeGpnMWpTSm9oRFN2U0N0SjA5U1JUTzFJL0h0dzliQlpM?=
 =?utf-8?B?blRPOFRDR3locWsvTE1LaGN3UkJ5M0hFTW03UW9jVXhTRVpOUUtGUE5vSWdB?=
 =?utf-8?B?TkNTMGZwSVY3NEpsdWl4djIrUnBybUpnTzBENXVoeE5NTmEvQjNYVVd0Nzdy?=
 =?utf-8?B?V1hnWXV3UzlQVTkzMmlPNGRkWG9CdDg5bW91aE1NV01LQmlaano0WEJHMHJW?=
 =?utf-8?B?amdDajJqaUxGc2pUeWwwTGh3N3doU0NvejFWZSswSndqUWVBNzRuWGQ5UlJW?=
 =?utf-8?B?T1RLMHJNZ3QrbUhMZGVVbG5GNGJKWUtNTmI1aFdGK3ZURVBDelhLcldOYlAw?=
 =?utf-8?B?eWpNd3ZRWTFsS0R5ZFVTWHpmSHFyZG54UVZiZExWWXJRRktMT1hDRjJram5N?=
 =?utf-8?B?eWZlaGJRTyttUncxZWFJRTJMSXd1UUJ4Y1M0S05ubXdtRXROTlc1WG5VU3VL?=
 =?utf-8?B?S3hIOHlOcTJPYVBtUkE4Ull0Vjc0aTd6OTNiVURWWkQxSjVMR3A1VXFXZnBj?=
 =?utf-8?B?Q0hCNW9xVExWQzlSc090NXllRmVZWTRqZHo0MWQyYTFlZExCcW16dUFsY1ll?=
 =?utf-8?B?YUFqU1RpVU10RWxNRTF2WUJ0SFByQkVZUVVoRjUvRk9CM2ZMdUdYNHNIaVd6?=
 =?utf-8?B?STFjQ3Q0RCtWSndITWo5M2pXU0p2MU9Ob0swOU5kanFBcllRQ2k0ZEIzRlEv?=
 =?utf-8?B?Si85RzlJRVpBT0N6VmN2OGpKczJxMmtMVUdpUk15NVRjSkExZExSa1VaVnJH?=
 =?utf-8?B?TlVnR0FNSWdkeFc0cmdSVCttV1lIVWEvZnlQeGc2TWorZFhZdkpIZ1N0Y2Np?=
 =?utf-8?B?cmJQRmlzd05qV3luV29tRHNUWThXaGJPODFQREdVZUhPaDgvcDEwVHdOM2hK?=
 =?utf-8?B?am1uQjQzTkpmTEhPeWlNbTZ6K3dvSnZPTVA3UmpKUUVOb0tGbVM1c1BLUlUy?=
 =?utf-8?B?Q1JBbk1aNDJlc0JmQ3VVWlcyajFmaWFFOStrcnRJVnFLRjFYTThPMFFab292?=
 =?utf-8?B?SG15VzVqb2tuRXZPNGFiUmN2dEdzeWVlWlEyVE5CNjh5bHB3d2FCZ2YzOWxo?=
 =?utf-8?B?b1hBRFlmazNyODZ5RFNxNjNZSkpSc1lPM3ovQXV3U21NUkZyb0lrVUtXLzJy?=
 =?utf-8?B?R2dwUGZydjBNVGxIaGViUDN1dmJNVFBVcFIyU21JWjY4bHFVUGx3WlhIc0Rh?=
 =?utf-8?B?ck9wVHVSdHFqeVY4Y2VydWQ3djFtcllOdDlZeC80ZzlSWi9yRDdmTXB5bFZo?=
 =?utf-8?B?RytKUDVvUTJ5aUlGOEhudVphTm94Zk90c3hDc2hOTHg3WDF1VVR2VVIwSk1D?=
 =?utf-8?B?aHFGSHdQZ0VCWUloTEF1R2xrU2FCTVJGN1E4bXQ1MUJOejQycFRVeVN6RHFP?=
 =?utf-8?B?WTB3dWVNU0lvYlVwWmdsT1hQLzEwY3Z4WmQ0YUw4VGhlQ3NHczAzOWM0Z2dk?=
 =?utf-8?B?OG90R040U242R3phN1N1MGpSNlNqMFNlbW5uS3k2YUpOdjMrUkdjQU9XWFd1?=
 =?utf-8?B?ODlHSWlFcllySTdJNjdxRXg5djhXaUlZZkxDTlNReStyaGhJay84blFqRjFT?=
 =?utf-8?B?eUNPTjJzdXRBSlA4QzlwWGk3S0x0VHhHbUxFZkk3bUhDYS9adWxHdlcvRFlH?=
 =?utf-8?B?eDhLL3BGVjF3TjJlam0vZWNMUWh2My9LUytWOWN0eUZiNzhkM2c2eWdFTGVB?=
 =?utf-8?B?eko0b2toTGgycDlZa0VwT2ZHRVQ2VnFDc2tZL3VvMnllS0xsNitsWmRlOEwr?=
 =?utf-8?B?MzAxZ1kvQmk0WitDK201aW1sQWN3Y3MrWFVWSXQreXJQYUdXWm5naDNMQU4w?=
 =?utf-8?Q?c8aWTl5fI4rihYxbiV4NM4HN6PiGd42fo828pjpuTA5te?=
X-MS-Exchange-AntiSpam-MessageData-1: 46Ym6KiyuFBddQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787ac05c-dd82-4aad-56bc-08de6d6433fd
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 14:03:47.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27RiU8ujTe0NT/CCq8s69rvFIg/st0PFUiP+EiC0WVGziZP48mjXOvMHAc9WbMNvmDrjuzfYnAw7zSNR2Tb9Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,google.com,vger.kernel.org,linux.intel.com,canonical.com,gmail.com,kernel.dk,lst.de,grimberg.me,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-92964-lists,linux-arm-msm=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: B105F1446AA
X-Rspamd-Action: no action

Hi Mani, Krishna,

On 23/01/2026 13:56, Manivannan Sadhasivam wrote:

...

> So to properly fix it, we need the controller drivers to perform below checks
> for all devices under the Root bus(ses) before initiating D3Cold:
> 
> 1. Check if the device state is D3Hot. If it is not D3Hot, then the device is
> expected to stay in the current D-state by the client driver, so D3Cold should
> not be initiated.
> 
> 2. Check if the device is wakeup capable. If it is, then check if it can support
> wakeup from D3Cold (with WAKE#).
> 
> Only if both conditions are satisfied for all the devices under the Root busses,
> then the host controller driver should initiate D3Cold sequence.
> 
> Krishna is going to post a patch that performs the above checks for
> pcie-designware-host driver. But since the above checks are platform agnostic,
> we should introduce a helper and resuse it across other controllers as well.


Do you have a rough idea of when you will be posting patches for this?

Thanks
Jon

-- 
nvpublic


