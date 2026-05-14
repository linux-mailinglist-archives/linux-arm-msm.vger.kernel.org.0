Return-Path: <linux-arm-msm+bounces-107673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJTHJ7bvBWq3dgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4565C5444D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 17:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB4FF300D91E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DC03164C7;
	Thu, 14 May 2026 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAna9ek6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJhTNyJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC830DECB
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773869; cv=none; b=eYhxXM+31whvfc6l8uxxWCHu5HsMAz7TKA4NYxOqcIT0xzV6bchJeN0fDEaYUdvSvDhbjKLQJTQf4mULe9eHr3/MQg0oEVvJg/J2+yzJJqLDsB73Q9yZnw7RXkdumbVKuiJfj/XEn+LBAy0bScltWCn1AgEa/k2qwaBH2VDOcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773869; c=relaxed/simple;
	bh=57vychfueC0MTVqTPCvkcg0ziquH1M8ssyJCiqhqLBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hz16YMxCk3R+ST0nNiBcYgiJ+1EpC8CCOLHru18y7IxxdV6r3kT+gTzQ1ICu7sPh7iJrL9FcBJ79o3JSWPDX02nIhp1CfUdmy9aKwUSXPDhOwrS9dQ2NoMsluqpE+KQNuCXh8Ww7ipStKxZs5G4qjjA+YLaGHKaPkCiYG8T5IbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAna9ek6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJhTNyJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBes9h2842121
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I9Hssygm+uY
	xt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=; b=IAna9ek64nCVwcKDgDKo8hL1dwb
	NtlY69Qln9Cccnr8z53KZIMqnOMBgke/rJN+erelGNkVyJZDlRSYsvgYWqcqryqo
	RFVYmNbyomviz+f44SCmE77jk4cy3dEu2pD+IQ7WsD+pOm+ByYkmD773edwd7DgI
	mrkRBhpsbIVQs22PBaFQNN+7VufnIAZHHawrVjuEOatgSbtK3ImT7bCKzQ6XhCeh
	HC5Tz96KVcJCAUGgl4vzhb6Fc4sbFNMUSIue3G0uEFZBWHIlyIV66b5hbcgAiQUl
	amjtALPTML0z4s7DpMoMXfaLwHDDUJhWCFBISghDxj7UR+h/dP1h7qrlplg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899t4x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 15:51:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631289505b8so4073535137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773862; x=1779378662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Hssygm+uYxt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=;
        b=VJhTNyJvCSobpyVLNFHOtXOVZoPoNAQl/O8C/6pVwRnJLrLka804kD5oQUjxjEklpd
         3d/l8rqdPJxKBG+M5iDaueyDW6Ys5GsCR1QflImhUbA2B8pzxOwtowpTfLZIHcCA+X4q
         m3W3PMHvmFV81sFJv0y4zZtuYMJFYjD7w4G6JB+48Wn9sRJAXIarLGPkScJsozaOrB74
         lsFVyfbCHIry05MN6fCtIGH0XTeyodsvSeyH6CmsU1AVmmpjMXvp9jPXY+3SP8RLq89H
         dPmmodEFOoP9G0UQEDnJZ1C1hHDBFOvhyAfIECkBkZo67gvonLi5EAzyNBthR/83lC6z
         zr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773862; x=1779378662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9Hssygm+uYxt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=;
        b=H4ciyMXN3F54UQRm9sJY84O97ETszkSF2mt6xotBK0mhTBf9sBFgqtA3zZnCDYggdj
         z+AVW63THxhT5R6NHJBxD6crKAR3j/373agYTZ2b1gd/b4rTZPW5Q7yP7/K9bO5tbsjk
         TrMK3S0K+FxT28XrSa0ARAbakqQZ5m8rIiXxeq48kDZes2o0OqEo6F9uBTHvxSznvjK1
         T88PXmgRo1WJOGXLppxg2XSDXfvL4gEOYls5hYoFyWm55RUl0VTYMSUSsU24vrcjJu2/
         Fl7loj/VbYJbo8c3X9UWFKUFoPrO5R+39c0kBv0tjFjIWr2e8nQY4ooPi8MJ07abdlsd
         izSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+l5Gd5hpPJPo+r/fjuZrevTgv4TLIFD6DoCvUNYWH188kurBFP6aUV5C5ty00hoMP6PfqTURIqmauaw+n8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mvWXtwXJZoGmX+Si3v7cmidHvwaBa1339uCsRjIlKT8jPm3a
	y3ej9VMlwezYdvKCD5xfBTLjxrOjLbUYPU9NrfvTXDx2YSRlKo2tVMwWAf+PCmoBPiM++6AR5AB
	72vnrGhoskRNaZvH27HG9t7/tYJLdD8q0jxTP5GHG8aKE6SueOcbLHyc5tsSUkAILV+c+
X-Gm-Gg: Acq92OETrBWGARD6tgl3RO/cv+1wJlY+TS+F3LOeHA95VXTAlBCRUnzypP/n28CNoRA
	4FfbGrCyBjWKRJOakjvx2K+/o2M7kDej6ExGx5GoKGhgF6kEninNSvYwPSWnpG9PAZ4sTFf3ufH
	RiiJfBNHlrrADq2qLUtZe8tMV9Dodz590bGw0lYWxIU51U90ER5mvpMftnEwbpOpS4jaDmURYHe
	t1H7o4pk++Tdf31dE3LJXmTSEqzn/obReCreeMMzIf7v4Tj/afHH5flBXg+g0xC/fELmyrQEwG/
	iH5zXAxiBCpmEHHhIJQmwqaidyeDbuzS5Wlj5rwfJeDujd5NdJ9X8JbWqonpZv2His2XRqaK0x3
	e8szMy0ImBU4YUAgKzqXtkQaehbpR3SZuZ/QZKHXmimWw8RXbzxfwX3FeKEKvjj5MaQ==
X-Received: by 2002:a05:6102:c4e:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-637740331e4mr4426049137.23.1778773861818;
        Thu, 14 May 2026 08:51:01 -0700 (PDT)
X-Received: by 2002:a05:6102:c4e:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-637740331e4mr4425802137.23.1778773858665;
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] soc: qcom: apr: Remove service from IDR before registration failure
Date: Thu, 14 May 2026 15:50:49 +0000
Message-ID: <20260514155051.2593354-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfXzVkYICCxI0bV
 zWvhvbPfz1kcNi1PC1Dgdw/LVxiBJp8w3TVLasBFkCdOfj8syCJAX2Zsy5Tr839RYubS7AkjTLT
 gA9CKFOrQhwBwQ3E4AsHKUzvg7LKu5JIeg14p5h2HVKtwqXWAOdcWZ3ZKG8i4e5T1FYC+GIaCsa
 aq7IJL/noTOkKcrLw4Pv6fJXnzq/OR7ynSI5suP5tOLEvrpD5ZNoZZNkXBSv7mqtQ5krfh1+esq
 iHX8V4rpcERyb9nYGV9qv4JPHf57e/VrwXdz0755oJUrNE8EzHGHMk3DK3o+4VTeoKsAQAd8KcE
 hJFptsCK7DeNRcev7zQBGCIrziOnZtQ+d4Sj/6zbTxifi07PbWUPbXz3k9QBATePbZCt8idGP6Y
 rzoH69cIiy2G8vcKUOggo3jYOYDcjKhkOKd+Dxje+V8XoGg8cE9EeQqH9rIjzrsNzB0anWjXVAq
 A3JgOg3zGQbgHmVxDYw==
X-Proofpoint-ORIG-GUID: pxrl75aN4S8RNIYSazybqWcWF8oXdeE-
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05ef66 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fuhSPDijbYtawkcQ4mQA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: pxrl75aN4S8RNIYSazybqWcWF8oXdeE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160
X-Rspamd-Queue-Id: 4565C5444D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107673-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

apr_add_device() may fail before device register, do cleanup of idr from
global apr->svcs_idr list so that we are not leaving any stale id in the
list.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index ea7f83916d8d..127204c195ea 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -466,6 +466,7 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 					    1, &adev->service_path);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
+		idr_remove(&apr->svcs_idr, svc_id);
 		goto out;
 	}
 
-- 
2.47.3


