Return-Path: <linux-arm-msm+bounces-107395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wgiVOJezBGo9NQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C296537F28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0386B31F4CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4511526E6F3;
	Wed, 13 May 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aMH4NK6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0738D3F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691123; cv=fail; b=mtBNvJJc2BRCmyspLtO8xEsd1enKgiBXyXGaIXxmoWjpIqvT6PYXlrTxaYqJHD5YrHcrINE7UlK8uXyOfz44/elqLoNimM4vKA6WaV5gwv2CWXMZg3j/lKCOSvaU/yLlsLUtrOZSKBSRtbrBoL1EdopEIzce4oiRNeMQfGlC/Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691123; c=relaxed/simple;
	bh=cWb1poy7Kh9KD6dJq1b6EKQbM47Q692iEPp1SRiU8zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qpfoCHnV7Ujr94FhpYqAAA1c4p5rtaxkqcf5LwIDc8GZ1Va1a9Re+H3OtRVHfvIAnmZTBW1FK0Pf2HI+k1cCQoLZb9kNdqShaIMkpJWd/nxJr80BilfI7gsfEtTrvPKTQLAtrz05HZCmlUDPTvOflMs2set3j19AHrfs0CkDNMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aMH4NK6E; arc=fail smtp.client-ip=52.101.46.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNSfyg/Pu4ITJ8RcZmO/cQYFiwHgzSLdKz+rfwFfeN4ZYoixMbXvDfl123QzXdPN0qvkpIRHr94Wh341+/kOYzjBrGAhzscXnEPIvLoIirq4uW83p6JqdE83qpkt/ZP2rk/S58lfJb6becbn+sQXMtQziMTY/q2zIe7DndF0p/UOf/KIaaYnlTWYd7LodKBG3TZTPIygFcFHg/1FPGO6E+HeEgX6AOTEKQO3C/k/hZw6jro73M2dFkhSUdJQmaPTZXjmYNvT23Zko06o/WqJ6YAdkv3oAVTlVQbYSiX0sgZpjH9NHPN7BLtn6Vf0ijudkUqDjMV8R6rhet4QGHmO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlBXcw8gPqqznMHqI3KHEcToXLDtvH6VbOdLjrZ7yI=;
 b=jSgwCVu57AweJo/nIJ9vP43xlH+1o3Fq4O9lwEDG2+MlrAE85DZC3Zo2RO6L2vIldN6ysjDXfJ3Klfb4jN8UO9DKEDu8xOt4KBgcZy62uWsehW/a70BzKOl8i48OHgJOjRfTqiLPCWNYk2LpF198Cj0aeU2XkMc22MNelHuKNfUvpfjQIl/wOP99gSbTu7O7hU/1QxtqzkkM7zGN4cfjBT+giuu/ILRAn/00IW4nDdi7/Gz6LjXuYBkT6ZM/kRZfUm+UMwhEzsRLzqOlG377FqLg7vzqnI2OCO2Gfa0Rq3NnM9T3kGBKQEb3wXM2A5o6kYRCnMXAfycOcQtvB5wKtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlBXcw8gPqqznMHqI3KHEcToXLDtvH6VbOdLjrZ7yI=;
 b=aMH4NK6EEwJCn/bsNTX3EcA1EnwHkqDw/r1aMRB7DzdlP+FeFLkEudWHEA+rEaXsdODBKqNL9EocNFC3uxkzcBHBbB/F7kBbCc8WAPpllOCflktzYFNqvY8UbllhK5CPvsfZDc/DJhGqPbXBlRRkjDZAHEqwTl4m2u8xtF4AypI=
Received: from MN2PR22CA0013.namprd22.prod.outlook.com (2603:10b6:208:238::18)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 16:51:55 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::8b) by MN2PR22CA0013.outlook.office365.com
 (2603:10b6:208:238::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Wed, 13
 May 2026 16:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 16:51:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 11:51:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 11:51:54 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 11:51:53 -0500
Message-ID: <72fc7f93-a7ef-c448-6170-827bb54f1063@amd.com>
Date: Wed, 13 May 2026 09:51:53 -0700
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
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Youssef Samir
	<youssef.abdulrahman@oss.qualcomm.com>, <carl.vanderlip@oss.qualcomm.com>,
	<troy.hanson@oss.qualcomm.com>, <zachary.mckevitt@oss.qualcomm.com>
CC: <ogabbay@kernel.org>, <karol.wachowski@linux.intel.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ruikai
 Peng" <ruikai@pwno.io>
References: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
 <78a955ce-8990-8594-1ebc-e7d4da14dce0@amd.com>
 <8c12cacc-ab86-49aa-b4ac-d80ef965b55f@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8c12cacc-ab86-49aa-b4ac-d80ef965b55f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6169a5a7-6f40-4854-a609-08deb10ff06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	1GdshNG9fCPmQ6jUboLlRbgZl2TcEvAXTG5pSWhRzm9XP5Z7CKDFJG2wyj6dC3WZ1eoewXFgt9+N2MYA8cYRdxVtNA1QM3YlpHP6ld49RxP8pW5NHgi5NN70Afkw+hrer7ibYLrX64YfswWfnrwwR1QFz8mULqU1WPnWx4Suix7ficvd4q5CEzC5KFwcY0lT2AY++Redf+0Loar9zh8LQW97OObR85oOWuVc8+/gXLaxaubyPPRM+v7tYsebn002ptROCWw8M4XhhBzlCprLqQEny+GWJ2CUorxpu7DrHHxPYwIK4ZCJuTcsoKb7JG5Jn651aR2g8mGwIXBWPMpaLooifrrXspf+1GBIG0KJ08AbCjslL/+dQ3TQ5y9ICD2NhIQU00syKqloraENA7YmI6MDE7WBvYKraKPM5uD/ECT4LP/sEjYxkLyZAJz6AkHiYGhLga22VyHfgHpF9dc3iFm6qnD4XnAsRDSYPPiUyHHza0MTyajWSs/0BIYKF/0eNI02YRhlbIP3W0MVFcXxxYBKUyX2nxSXQjsHG7JqQZqxWGF2FjIdiVOA+sQpvpiQH6Pbhl+iRZohsZE7aJRUviFnUuVeRZhHlReAG11uZSXm+e1WNfGZHVUs9C9ikBnfi+8wPR5WRaHwFpVGfUC8YhvcNWOsNrw3CzKsQRYNtCiQny9nHT9uo70QZTZ2XQY6lgDl9+hVQ8WnwVkJUPeRFBWDGLxi9j9/v2JDmvEYz8k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/9gcVYYVZPjFUU08LEAVHRuqsc4EFmUPvMP44tKrrK2tv2k53UOtAMI4YRSPA1XLk4dwgY0xMouIUYZ6CTZQgRxMjyN25TZ7nQl+mGWTD/RxEtd2C5aCy8cKOD3eOxzdtuEMvOXUqkRt7VCJITVN3N8v2p5caE/w72e64rNVplh7xbzNVgp0CJTIg4TR0EHz6p6xr7o1E+2a9VijETMOoQKLj7Q+32riSWq4fAtd+pZ2VIG+FLXitKP+gASNw7+L6JSpyqA0MDl++wK7l+Jhs8nIFHxfLuSVmAIMviXNpNDHHPKjHH7/CNJMHAzM7Rwb1Kh355BXHbx7hOi+jPcUwhCJElSg3JD0xpmgEdtGfqptCdbnS9HKevhAcG9sLbXYPKRH+/gW+Y6XuRiVZanONlp4Nd1hoTIjJ9zWNUT2ETu9VsL+pgCGqgCTUlVI7ka
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 16:51:54.9152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6169a5a7-6f40-4854-a609-08deb10ff06e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
X-Rspamd-Queue-Id: 4C296537F28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107395-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


On 5/12/26 09:29, Jeff Hugo wrote:
> On 4/15/2026 10:52 AM, Lizhi Hou wrote:
>>
>> On 4/14/26 10:32, Youssef Samir wrote:
>>> Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation 
>>> if the
>>> owner went away")' fixes the scenario it was intended for by walking 
>>> the
>>> message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if 
>>> present, it
>>> skipped over the bounds checking code that is included in 
>>> decode_message().
>>> This could lead to issues such as reading past the slab allocation's 
>>> end,
>>> infinite loops or kernel panics. For those issues to happen, a 
>>> malformed
>>> wire message is needed to be sent from the device.
>>>
>>> Instead of duplicating the bounds checking code already present in
>>> decode_message(), use the function inside resp_worker().
>>>
>>> Reported-by: Ruikai Peng <ruikai@pwno.io>
>>> Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the 
>>> owner went away")
>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>> ---
>>>   drivers/accel/qaic/qaic_control.c | 48 
>>> ++++++++++++++++---------------
>>>   1 file changed, 25 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/ 
>>> qaic_control.c
>>> index b21e6b5b3a10..818a77adde2a 100644
>>> --- a/drivers/accel/qaic/qaic_control.c
>>> +++ b/drivers/accel/qaic/qaic_control.c
>>> @@ -1075,11 +1075,13 @@ static int decode_status(struct qaic_device 
>>> *qdev, void *trans, struct manage_ms
>>>   static int decode_message(struct qaic_device *qdev, struct 
>>> manage_msg *user_msg,
>>>                 struct wire_msg *msg, struct ioctl_resources 
>>> *resources,
>>> -              struct qaic_user *usr)
>>> +              struct qaic_user *usr, bool orphaned_deactivate)
>>>   {
>>> +    u32 msg_hdr_count = le32_to_cpu(msg->hdr.count);
>>>       u32 msg_hdr_len = le32_to_cpu(msg->hdr.len);
>>>       struct wire_trans_hdr *trans_hdr;
>>>       u32 msg_len = 0;
>>> +    int trans_type;
>>>       int ret;
>>>       int i;
>>> @@ -1089,13 +1091,15 @@ static int decode_message(struct qaic_device 
>>> *qdev, struct manage_msg *user_msg,
>>>           return -EINVAL;
>>>       }
>>> -    user_msg->len = 0;
>>> -    user_msg->count = le32_to_cpu(msg->hdr.count);
>>> +    if (user_msg) {
>>> +        user_msg->len = 0;
>>> +        user_msg->count = msg_hdr_count;
>>> +    }
>>>       trace_qaic_manage_dbg(qdev->qddev, "Number of transaction to 
>>> decode is %llu.",
>>> -                  user_msg->count);
>>> +                  msg_hdr_count);
>>> -    for (i = 0; i < user_msg->count; ++i) {
>>> +    for (i = 0; i < msg_hdr_count; ++i) {
>>>           u32 hdr_len;
>>>           if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
>>> @@ -1110,7 +1114,20 @@ static int decode_message(struct qaic_device 
>>> *qdev, struct manage_msg *user_msg,
>>>           trace_qaic_manage_dbg(qdev->qddev, "Decoding transaction 
>>> %llu.",
>>>                         le32_to_cpu(trans_hdr->type));
>>> -        switch (le32_to_cpu(trans_hdr->type)) {
>>> +        trans_type = le32_to_cpu(trans_hdr->type);
>>> +        /*
>>> +         * orphaned_deactivate is the case where a deactivate response
>>> +         * is received from the device after the user owning the DBC,
>>> +         * and the message requesting deactivation, has gone away.
>>> +         * In this case, only process QAIC_TRANS_DEACTIVATE_FROM_DEV
>>> +         * transaction and skip the others.
>>> +         */
>>> +        if (orphaned_deactivate && trans_type != 
>>> QAIC_TRANS_DEACTIVATE_FROM_DEV) {
>>> +            msg_len += hdr_len;
>>> +            continue;
>>> +        }
>>> +
>>> +        switch (trans_type) {
>>>           case QAIC_TRANS_PASSTHROUGH_FROM_DEV:
>>>               ret = decode_passthrough(qdev, trans_hdr, user_msg, 
>>> &msg_len);
>>>               break;
>>> @@ -1430,7 +1447,7 @@ static int qaic_manage(struct qaic_device 
>>> *qdev, struct qaic_user *usr, struct m
>>>           goto dma_cont_failed;
>>>       }
>>> -    ret = decode_message(qdev, user_msg, rsp, &resources, usr);
>>> +    ret = decode_message(qdev, user_msg, rsp, &resources, usr, false);
>>>   dma_cont_failed:
>>>       free_dbc_buf(qdev, &resources);
>>> @@ -1607,22 +1624,7 @@ static void resp_worker(struct work_struct 
>>> *work)
>>>            * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
>>>            * otherwise, the user can issue an soc_reset to the device.
>>>            */
>>> -        u32 msg_count = le32_to_cpu(msg->hdr.count);
>>> -        u32 msg_len = le32_to_cpu(msg->hdr.len);
>>> -        u32 len = 0;
>>> -        int j;
>>> -
>>> -        for (j = 0; j < msg_count && len < msg_len; ++j) {
>>> -            struct wire_trans_hdr *trans_hdr;
>>> -
>>> -            trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
>>> -            if (le32_to_cpu(trans_hdr->type) == 
>>> QAIC_TRANS_DEACTIVATE_FROM_DEV) {
>>> -                if (decode_deactivate(qdev, trans_hdr, &len, NULL))
>>> -                    len += le32_to_cpu(trans_hdr->len);
>>> -            } else {
>>> -                len += le32_to_cpu(trans_hdr->len);
>>> -            }
>>> -        }
>>> +        decode_message(qdev, NULL, msg, NULL, NULL, true);
>>
>> This seems changing the previous behavior. The original code will 
>> continue the loop when decode_deactivate() returns error. And 
>> decode_message() will error immediately when decode_deactivate() 
>> returns error.
>
> In practice, there can only be one QAIC_TRANS_DEACTIVATE_FROM_DEV 
> instance per message, so the two behaviors are functionally the same.
>
> This is somewhat an argument for this change because having different 
> behaviors across the code feels like a recipe for problems from corner 
> cases.
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> -Jeff

