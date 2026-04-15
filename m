Return-Path: <linux-arm-msm+bounces-103306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEDQDqnE32ksYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:02:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B217240692A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 19:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2406231F7930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1B3ECBD5;
	Wed, 15 Apr 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YmQOhjm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C73ED10B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271950; cv=fail; b=IgZI73il8t4FAIAW3+1FZTGo2nnKhIdz86WIofbbAFDFDUoD9ljB1xBUjFDPmtL+jE3qlUt8F4JMMupaMNdOvrQdvIQsSIWXEv+adHZlVGSmb6PFvjD++tXSu6q2k87fVaqzBNSaUNGLhIukatZI//mYMYgt1zLQPa2+CJIoNss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271950; c=relaxed/simple;
	bh=/edpperTSESpUKzMojV/aO9VXfdPkSBZaF8mDiyOVq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LKAR54alrq5R0tLzbkVq80K/p0kv/DECSMLG/g/sA8zm/L4angAtra+5Dm37j6RMTzWzkWiOCjj5GiJAtqpH+c1U3CBNtDw1OlVbu7LyHtoJ/j8zTE5O1n0e66f7zwcZO7teB6d7YD0eoTNhhTJu+zUhLFUpwApPZ8M01SfcUZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YmQOhjm2; arc=fail smtp.client-ip=40.107.209.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA1C5HPhj5UsS28W7AoFEEV0WIDW7UJddt7EOX45TTdtfZUjszRTG7ZxoBRr3dtpS7OYaqwwUpZ+v9zjwHCkmjiUXxc4F66k8H39S0VQkxSg0iH29SNFOF0xQSEmwohskbS+UZVF/hL1XVt/G5s1vUXSdBTd7emAsTbjQw+g44NwGo4qCtn8xE34oIfs51yJK51XZKMeXFeBymXhZgDifdgLHCjKvFPvtt84oxnvrMb/jRENIH4325/ysAzO3VY3C4CLMRCCMzkwBjCdvHkgQzxd5sb6fQ3iBto8UlLL1bYL+bEHK1XrjhQERgFt7IJuu1uzi87Ejq/vMby7THngOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DwMq2RTJYydRxJ6G0CYeJQMxCJq5u39Mt31BdEV7Hw=;
 b=FkrzAyCRItUIYG+N7UK/lN+yx3z9R3J2UgKcsXaWYZXcspJchs4BWsMNeGoN/2t3iF5cp+vwjLTVIceqHvpDm9ZJR3m2RIacLM2YGadHfts5VElWBSEEuzp1caOl1Q0AeuN/igLOJdLYwMulKRwMyuRwRralpuInnwyOF07oz6plPZfY8t9FlwdpKelDs9zDf/mgWEXjGXeWNDC4FiToXwAY0nz6nNCdciOXu9PYQHwrN5Qbm85mlgR2ypmjIpK3c7eoEg/2Pwss0H+2BNlLrVEvUsnjMu5AIxG5hSieFVHbK8RkyKPUXeQmXvLzq5WTXuHMH9f9lHXIXDciBOjA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DwMq2RTJYydRxJ6G0CYeJQMxCJq5u39Mt31BdEV7Hw=;
 b=YmQOhjm2O77W+6VmGqDbii8I+Uw2dKW1BRmybi+6fhUIohWdd+oek98YRjSqWliBwNjZ8bOSWgFFf4Z5N3kqE2d5aoJds41qUcrbhnacn+/dMAQE/7jt47pIDLzL/JYvVkSESmiNR4ruEswg9j9UQ/TXNIIeglJ+9GSjG5UpAkk=
Received: from BN0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:408:ee::15)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:52:24 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::37) by BN0PR04CA0010.outlook.office365.com
 (2603:10b6:408:ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 16:52:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 16:52:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 11:52:23 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 11:52:22 -0500
Message-ID: <78a955ce-8990-8594-1ebc-e7d4da14dce0@amd.com>
Date: Wed, 15 Apr 2026 09:52:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/qaic: Address potential out-of-bounds read in
 resp_worker()
Content-Language: en-US
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	<jeff.hugo@oss.qualcomm.com>, <carl.vanderlip@oss.qualcomm.com>,
	<troy.hanson@oss.qualcomm.com>, <zachary.mckevitt@oss.qualcomm.com>
CC: <ogabbay@kernel.org>, <karol.wachowski@linux.intel.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Ruikai
 Peng <ruikai@pwno.io>
References: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 43759456-af29-48b9-8a70-08de9b0f5dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2qxNpik867QVXIj8H1ggjCPMM6TTyb+OVxmuyFcKzg+On/T4ssBD3jaTLuYG73zLmua356VIYBJbNrfxVsAwUVK1EaC9fEWpcErZJ7GI7D8lD+MKIYoqDtF7XYMCaMlLqCbToHUabiRT7fHZSTmWLiOzCbtT6JXCGv9yfMKwft4T1nN50HAT4nrasNigjKiMglCJpqk1xUuU5VA/kqUJ3EQPA3odd7gSoShCft6DtBk4Th1SE/EYpSs6Yb7MPjP/xKAFl6hRqVQZ3Zno7aJZ6hAwB02ibduyqRuFFXtUCCbYDOmn2gehqCbPphk5WRGmzScGJt1oB2rT4Pyl5Pu6glah1AKUotYpse9XnawTWQfy/l3/PiJMy2//DOXKNefpszbLFzL+Yc0ViMmZy5C24eVlr74KiBZ1E+bgRcKO6Fw8LIg9MIk+V6qSp8f+DudSK47TwfyGmNTC0WPaFKH60fT9+tZMZmqML+b1Rg/9nOzvjVjygEcY43QF8OV2kYhiYxNrq7QcP3RZDENVD/xD8HiEV8weKPowgcaLwGwJmZzgV+p1uoWS+WN9/VG6Y17pv6q9VOlwQqQjSFhaceGoQA/zVmzMZDoqAzQywx5uPhsEAYbq5zypntGvZwjBABP2Alu90t3XdAn2qVmVa0uNpIi9tpXH1pquya/+JIuj4Xsde4trT1P7Bwzv/e+9P+7GsbvG7hapcyDmvamm1WKTr+6L0+l/fLEXbOUEyGosz4gh2Pdc3fuDplO91pLx1v9UCGWWl1M9PKL5WGsEQknSpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ONn0WQv0So/8KJQFzp0UJPONmt/E/0EAf+6uQgf5lIuFV5CIKmFqijWTrJvvV3h4ofQk/k3sFgEcmC7fKoieMMVz8PAIAFLP5fXDcM2yf5/fkjTBbINKWRGOidvLeE1lVTV9ofQWkFDHuHSjya3CQqxra5tTXuxZ6uJvNMAFmCo6P/KqhjUn9wzADTEnfM48fdigMb4ik7YWIkp5wGPW2v8EFYCBNC68gmM0VEs32Z26WPSP+A/f4cjc+Y79yI2j8wzJmvVPT//Yhx1NR79BaQzdDuQjNyvBj/TNrCzBWHHBkUM3QgC5tpm1OChiIZved7f9zaKvhmyXDo0tQRfBaL6ZbhQpTyBPJ/j6fK8l76bPR+1s9ZxbswhRsTP4Z8WldY0P/wjxH3uYUsISrGSzCGiaQyt3HIoiOYZk8I/E0zGaEOUrCej6bTGiSKm5/BDi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:52:23.3988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43759456-af29-48b9-8a70-08de9b0f5dd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103306-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B217240692A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/26 10:32, Youssef Samir wrote:
> Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the
> owner went away")' fixes the scenario it was intended for by walking the
> message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
> skipped over the bounds checking code that is included in decode_message().
> This could lead to issues such as reading past the slab allocation's end,
> infinite loops or kernel panics. For those issues to happen, a malformed
> wire message is needed to be sent from the device.
>
> Instead of duplicating the bounds checking code already present in
> decode_message(), use the function inside resp_worker().
>
> Reported-by: Ruikai Peng <ruikai@pwno.io>
> Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner went away")
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>   drivers/accel/qaic/qaic_control.c | 48 ++++++++++++++++---------------
>   1 file changed, 25 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index b21e6b5b3a10..818a77adde2a 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -1075,11 +1075,13 @@ static int decode_status(struct qaic_device *qdev, void *trans, struct manage_ms
>   
>   static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   			  struct wire_msg *msg, struct ioctl_resources *resources,
> -			  struct qaic_user *usr)
> +			  struct qaic_user *usr, bool orphaned_deactivate)
>   {
> +	u32 msg_hdr_count = le32_to_cpu(msg->hdr.count);
>   	u32 msg_hdr_len = le32_to_cpu(msg->hdr.len);
>   	struct wire_trans_hdr *trans_hdr;
>   	u32 msg_len = 0;
> +	int trans_type;
>   	int ret;
>   	int i;
>   
> @@ -1089,13 +1091,15 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   		return -EINVAL;
>   	}
>   
> -	user_msg->len = 0;
> -	user_msg->count = le32_to_cpu(msg->hdr.count);
> +	if (user_msg) {
> +		user_msg->len = 0;
> +		user_msg->count = msg_hdr_count;
> +	}
>   
>   	trace_qaic_manage_dbg(qdev->qddev, "Number of transaction to decode is %llu.",
> -			      user_msg->count);
> +			      msg_hdr_count);
>   
> -	for (i = 0; i < user_msg->count; ++i) {
> +	for (i = 0; i < msg_hdr_count; ++i) {
>   		u32 hdr_len;
>   
>   		if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
> @@ -1110,7 +1114,20 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
>   		trace_qaic_manage_dbg(qdev->qddev, "Decoding transaction %llu.",
>   				      le32_to_cpu(trans_hdr->type));
>   
> -		switch (le32_to_cpu(trans_hdr->type)) {
> +		trans_type = le32_to_cpu(trans_hdr->type);
> +		/*
> +		 * orphaned_deactivate is the case where a deactivate response
> +		 * is received from the device after the user owning the DBC,
> +		 * and the message requesting deactivation, has gone away.
> +		 * In this case, only process QAIC_TRANS_DEACTIVATE_FROM_DEV
> +		 * transaction and skip the others.
> +		 */
> +		if (orphaned_deactivate && trans_type != QAIC_TRANS_DEACTIVATE_FROM_DEV) {
> +			msg_len += hdr_len;
> +			continue;
> +		}
> +
> +		switch (trans_type) {
>   		case QAIC_TRANS_PASSTHROUGH_FROM_DEV:
>   			ret = decode_passthrough(qdev, trans_hdr, user_msg, &msg_len);
>   			break;
> @@ -1430,7 +1447,7 @@ static int qaic_manage(struct qaic_device *qdev, struct qaic_user *usr, struct m
>   		goto dma_cont_failed;
>   	}
>   
> -	ret = decode_message(qdev, user_msg, rsp, &resources, usr);
> +	ret = decode_message(qdev, user_msg, rsp, &resources, usr, false);
>   
>   dma_cont_failed:
>   	free_dbc_buf(qdev, &resources);
> @@ -1607,22 +1624,7 @@ static void resp_worker(struct work_struct *work)
>   		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
>   		 * otherwise, the user can issue an soc_reset to the device.
>   		 */
> -		u32 msg_count = le32_to_cpu(msg->hdr.count);
> -		u32 msg_len = le32_to_cpu(msg->hdr.len);
> -		u32 len = 0;
> -		int j;
> -
> -		for (j = 0; j < msg_count && len < msg_len; ++j) {
> -			struct wire_trans_hdr *trans_hdr;
> -
> -			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
> -			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
> -				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
> -					len += le32_to_cpu(trans_hdr->len);
> -			} else {
> -				len += le32_to_cpu(trans_hdr->len);
> -			}
> -		}
> +		decode_message(qdev, NULL, msg, NULL, NULL, true);

This seems changing the previous behavior. The original code will 
continue the loop when decode_deactivate() returns error. And 
decode_message() will error immediately when decode_deactivate() returns 
error.


Lizhi

>   		/* request must have timed out, drop packet */
>   		trace_qaic_manage(NULL, "Packet dropped.", -ETIME);
>   		kfree(msg);

