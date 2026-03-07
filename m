Return-Path: <linux-arm-msm+bounces-95967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHHJOUQPrGlIjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC5E22B827
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BE893046D83
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E42357A3F;
	Sat,  7 Mar 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwzR2mDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ksxsray+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47A357735
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883733; cv=none; b=ioz4LPknjXNwtT9T8WafIA5e/SNL7J8Iw0QYMiWnPbQVcehZ4AHknDIvIjaiehx3Z+aM/JNefNDzKyYSAx+0FyZhAW0ABSSJ1X6JZWltIgPHOGH4dbQTqRbDgHttGNolsU52u64JRIkux9v1fOZLAXYUXj06WKPPjXreIC61EM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883733; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfiiOoESZh1afnvDayV36EohpqNhHLI+SgHsnZN6i8K7UTzh5hluVAVUE6kbRPnMXbiRPNKubb4fKn3c20VJftKePni+k+G6ETHDj6FcqVOV2yuVtWYf9UrlVUymwIeIc1/Mpn4Y5/DM2gao1d4zV1gJHLxuDjRIrCx0CFGQtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwzR2mDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ksxsray+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qhBr3098026
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=XwzR2mDAVP8gQTmc
	ONv/9nBbSN6R1/IGchyt5pVMxbvkE+HFfnOaPpL3gKYssoTyJjrdBodQJLB9bkNl
	bbELNoZRi+f/yXKdHSR2QNGN202Me4tnPDtMvgEFsyEw3v8vSZLOJxjwGvvEygoD
	474gv3EinsdqUM2MqtJeKbK7qDKvuRedK8hSnoqO0c6kvLtX0SSF3pqmK5G8QWZK
	eQ7ExLmVM5by6tSH4MlHvuAjlAO47zPkWYRIHevZg0nOtMuuUi0gEG8lxjT8rBTv
	027wBHsbgvg1sshTTQrLhquygJn0fC+aKYAB/hbXM3B/3f7Eu3j2fzcpPiqK8G9s
	8CyhJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrgugd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4cdfc468so63808895ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883731; x=1773488531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=Ksxsray+yQlWDE6Atop5lEH3UReyPN4H9bY/FhIiI3j0uoJnF/2yApBDgGR5J44Qxm
         eaUAom893yqqzWrQ8D0KEYsyh0Y7MnE1i7pKHEWldjl9LPx8Rv6Dv/JaTiSGJc8FIP1s
         wgbDa2VB7d17Uk8TJ5dGH1iva3XSYakGHe0rCgLJWsKdg7E1oHdW6Ts1Fi6fkcx7AbmU
         qjWOC1+3UAJ7MwgwwDGT+X3X23SBI8n9C+aAnz/ViRZN5k9R0Mu4MQT5vAJWVSD3v8Yg
         4S8ph0SxuCtjKuOekmvDocgbrWP69kAjlchqi/pFZRbDHzTbqjpxtRE3s9JbD35jyOsy
         fafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883731; x=1773488531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=XRTmCbyjx3aCem91+W42yIfQil8ze02nP9U3XdQ69413weH9lNCSShhX1hvIOkOK1f
         1JrH7pWnmKsBaNN8nBkng+xnhJfhUT6gGA6mZUPxKrLGXHEQee45Wr0s7XuRRyPx/tB6
         pGGIY5OlPa3P1xL7z3q3xtAUme4p0WxKEEkm9F6op8nkB6fj+ABMmvrxqq/h19Q/Z62T
         4wIhnbPvZmDcJY1bvSERD0aVmNy/RDCPD+bqxRxm20Ac+nY3sSSPybqksAXqoF2tUAhY
         1OA1IBttOvTt8hbxu6ccnBZqOZFQCqDly6ECy8TNNykc5xS93iTqufCZSR57aRH2Of3R
         bC4g==
X-Forwarded-Encrypted: i=1; AJvYcCW3vvCLF+NqjRZngZnN0LQVVId79uV1an+khHW7DlmbV9YRJFEBEjh3FzZhZmw+3vAj7CcMr9OVdvGaegKd@vger.kernel.org
X-Gm-Message-State: AOJu0YymvMFt+rVgQ0HPUty0WVRsMo/8uA955+yXRl6ntyU/JlVArGoT
	2vldSEhsxjLPLcidC3LsQafgYBxpT2JnDnOiFoWC54LR+DBUet15/zdO1wDvyrwj+xrH6oRq44O
	Z/74xWboI3vvagY+xgQjJLR1MidkiN3jexqLHFQsti8ziJJw+xJI9xaqwJXJPp9J/h9FJ
X-Gm-Gg: ATEYQzzvWEXrgklYcYJJHUvqn2wbttR0nrEjP2yFomxQwQniy2Mx4oj0UWpvHQEcSXR
	vWWqL+yUdLSTuIISWbwkizRXtAVizn3fieX0TPcwqtWWRFg8iPhV909mLz5bzhi4XjLDGGfWlCJ
	2FrVCXQcctUL5SIVRZiU2QanOZZFaT197f267Ya4W6oZd053NR3nqx6PMbgqjUcXThR6/k2biqp
	IdUab+CgznapxdI8eGHEyUX3PMRpe2EZpi+3HpFRvbs8JP9d0fW4sfWtA4WAEMHJCMt+HMXU7ps
	OzcSKmDxjYiQbGMLz4ck9aMl0FBAhBPhl/UfVk27s+X0xTmGMaguFY1naZTSvuZ9nNlaXnOKjee
	DSU35JgkIIzJRaIyPglq/k/lYtp6+WuDwbB5lVMkrSHx5DLKkJ4M=
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55366105ad.24.1772883730936;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55365825ad.24.1772883730454;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:24 +0530
Subject: [PATCH v2 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-3-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=3HTb3lNqq1SBlZH8owlRUqgc1PykEjlh9ZnscaYY2XCHwlu9RlWn/8c29wYzbFP832FhPqK4M
 6/gbGM0wW/kAcei6sxdVFhRnS5Q53iyxG//r/OMoyPfrXciF+4abQ5k
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0f13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2R4EAtZJnW3a9e8v-tkKLHyZTLlyiqVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX16ej6LYmLD+3
 52sdfSsd8gpA5zBGq7sHhr5m7F79DszqTBYMP6PzwBe/O8R0C6QqITyu2KZ8rD6Jmszn2OLYgW8
 c5xZxMkymjcJXtrrxNTzEndo1dRMfxa9XD+kopDo1dLW8AUyVYaZVJw7J0lsJEfuIHpw2bnjuKv
 Mr8VsUBlxV1FfI3ENMI9B7HGy2DuZVvHQmlKcy+ObDTjNdUQPLStrPEJUioI2ssvNbb0vxmr/fn
 TwFYdBW7lZs0Jmj8pEedBB+YGVqsslKHC9TbTIcIFOGxNeiyqE7eNaznOnbu6pHDJIoUenOh0SR
 xd7VART8EB57MIIIg8uyv1i6+gjSWzDS4xjnV9An8x4f0aP8oXcNJfWMnKIfu5rv2Tj01gaSmPs
 J18lgQnf6ZQB3wmv7WpOX+tSALc2s8qQjSwtAJGzl2HmHUbZzacryeSHTrEhwc6TxwyOq/r9axr
 +075PsbzywWQFrfYvtw==
X-Proofpoint-GUID: 2R4EAtZJnW3a9e8v-tkKLHyZTLlyiqVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 7BC5E22B827
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95967-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.941];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1


