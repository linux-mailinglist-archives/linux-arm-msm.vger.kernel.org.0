Return-Path: <linux-arm-msm+bounces-95705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DxzFq1HqmlkOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:19:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1A21AFDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B113019900
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 03:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859E025F96D;
	Fri,  6 Mar 2026 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6jIU8Tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4pmI3LA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B726738D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 03:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766967; cv=none; b=KWM0acHLCXu7YCTaoPLayb8MTZNJzmqdKuUmh9Mb538pBY1+Z58MesJQaLDv/xKPATsLVpqXi/17M16UPXym7zZYIwk7i0zmaZyZ+vp/lYYBIDHscuI8rJaADFAfw0CEsw+KzP6fXmsFsY9EyEzkoAPrBtEnmjI6jfaKqMloh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766967; c=relaxed/simple;
	bh=fRY6995pDVPrsgfEGntNtqtKE5aYXYzxVYUkdV2LGjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9mmdVgEGFf+0h/9AynImlUeXV3ZDxO/ADpBlasL8ggxQLVMk1x7XfBskirwjKe7mCdMs13w4NgAAfEk7sA88c3fOqmaoS+NCl7S14NUS6o9pDK/9xfoUk8f24weF2Kiq/mNSkT1pSGuO6DKScPP4wef9rpJBChrTJcnw9RKZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6jIU8Tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4pmI3LA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kn6BY1805878
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 03:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUND/+KqgfCDxCvWEudnxvEruQxwolLqNyciLlg2IxM=; b=g6jIU8TlIm1p2Qvi
	GgfnDeEVztMj15DAlvJmKQvqvX+MNv4CXRsJkPtflr9mxZ0TiybM9PrScwuyJw7K
	LPQNl8R/4tMkzjOWmtxNQGEe72/9DTRmXILpVJIPim3G0nd/zyXtibM1wVXLOq1N
	dC+TXTnKK7HmCPa+2OCsSdygh0ZJgTJj07Ri+eBWDBhymEJ51MnsbQrJ8bgkIQPg
	JN0OW5tEU9pTaQHub+mk43lu92ptX6bfKYryilHX0OVHdwWIiBjntmX92bJJwCrV
	UqN0dRLjoOWF4hmZILHk8Q2oJxqyB1yNmKFpYnwFUYSA99CCfrSERQwRb+JOKKpv
	GcYHMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srjme2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 03:16:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so13389529eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772766857; x=1773371657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUND/+KqgfCDxCvWEudnxvEruQxwolLqNyciLlg2IxM=;
        b=J4pmI3LAvEEDhoL8lgKeAZ1McH95w/czXWY/Fwc8zK2cIYvm4sR7Agy/hadTP9OF8k
         ocN/f+Meo7MDwd8ZCPpEMBs2+lJnYs2VPXSyy+1M86devHe8KI39jW+Ais1xCqeen4zC
         2wr0wTRN4C0T/U5ETUbwO7wq5vqCu9TwYGpPUquOqASws0kzDwNFxhUajApGPAjJaamK
         jAklAYFCp6Mc/VB5p8aB4JkOUBBzRf6aGwdYKD7kwdQKtQBIexJX4jnbuloaRFPn9X5A
         Na0J5EZY8nrdnho2fbTNnOrhqLEzqdVJHnwl8SsZA5yU5ukuMIxvueBNJX1jtes8wlTI
         XVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766857; x=1773371657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUND/+KqgfCDxCvWEudnxvEruQxwolLqNyciLlg2IxM=;
        b=RbZS+JpD5FwC1gSkZVEy9CYnubDLTlAwNkYvKcC7ENiOhQT9NPd/2pN0jBqF4MBeh1
         2/luIIBZO/Onla5HA8MAzbGFG46QxfLcsAkC6oV/sVhcJGKzzsqhQawSH0ctRUWnt7Ix
         eSUGCk4oWjQ4ylC6hs9pXHSvBQP2IaeF1i9ObT6qZb3qGHnaiouQ5/gUrhtBvOZMGcTx
         gKnstX+4y5a2vhxNyhUBfmu2FzoTGMDSBCEe0AouZrYmwXDxnWbP6SDnaBvitwLatAtQ
         djUjPY7vtdaPmVK+L6Eahn7bijVOa9mQkySr67VP6XJh+gsruucTwR8t7Z29wlxK7gR6
         U1pg==
X-Gm-Message-State: AOJu0YzkLd6LBDfetl2L6kjALqY5u3pr8xWMmlifko71Zd1+96fFOB6A
	msKQm8cM2/dll1Lg+SUnzRsOZDuPgfIf85Qf33l5HP0NSzCUd2w5KktU2eaa8vbNCae0HElkQbl
	eVB3HhnreY2h/9QBr4ZrPvNxuTl3EX/j0YVX6J+TxQw/5iRBlW/BWJMy698aDU6GCLFI=
X-Gm-Gg: ATEYQzysHrk0DWdcw8Oc5EZo0LwvKK2bLWsK3iWtLNHWKNx5TpmhgLBQcomAsWWnaHz
	Nb/1GJ6pjyqDQ2HykCOk2kZdhSrIK3rMiemxEtF6f6QhOXeDoP34ia6curWuXa3vUPCFBBE4z8A
	A6s6D4I3Ib2rBTlAWWqxzKlUwEiLD2Vlf0YpobJ6w75UgQG5O0oqIkGKPn2/d+Bvjt6mqSdqj1B
	Y+SLJcafetdl1m/pl8BtuxsuHr+bIYkGKgVLD+sNafikcCEa8KH5EIvt67fNQrb3onUEQr/5MiL
	tRnzo59Q0QQCF49Vd6iU84VTyU08ChDrUEUMgCA7ZRjTwwigoF4bSCST0R0iw0KJsyXI9iqznq7
	pqpaOy90pMTfh38tIuStpUAfWTUOyPiTOTHhmmv1lMl/Jzj0ZeSaJfBy+dVNVTu5PWyNd3jnh6Q
	==
X-Received: by 2002:a05:7300:3724:b0:2be:126c:e335 with SMTP id 5a478bee46e88-2be4de98aa4mr303399eec.10.1772766856712;
        Thu, 05 Mar 2026 19:14:16 -0800 (PST)
X-Received: by 2002:a05:7300:3724:b0:2be:126c:e335 with SMTP id 5a478bee46e88-2be4de98aa4mr303389eec.10.1772766856074;
        Thu, 05 Mar 2026 19:14:16 -0800 (PST)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82b1d3sm197839eec.11.2026.03.05.19.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:14:15 -0800 (PST)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 19:12:06 -0800
Subject: [PATCH 2/2] soc: qcom: llcc: Use guards for mutex handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-external_llcc_changes1set-v1-2-6347e52e648e@oss.qualcomm.com>
References: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
In-Reply-To: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772766853; l=2371;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=yd2tvj1vkEgWnWkgYzbTmmIfhhcbMrW8XBX8Xkv+080=;
 b=bpib13fbS79o02D0uzDtPYSent/2VfnH2Z0lLgkk1jUglgdpju+rZNdXMXdBgrUNjxgvnQJQw
 3xmfJiyo0DDAf6rgHE9mqmk07pBiVS7lH87/eduPKuOtKrsuXt+GHBd
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69aa46f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VvdJ20gCDTMsAWRwTQIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: WSX9o6Si7wrJpOoOCs1DS6PhhKYdaTXe
X-Proofpoint-ORIG-GUID: WSX9o6Si7wrJpOoOCs1DS6PhhKYdaTXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAyOSBTYWx0ZWRfX6JsWfzw069eH
 6IZOLIhzhuZ/ZDB/ZTW3rxmUZt26Ezl4yQ/8LQaaBVvA9ioqdF0I5B5SPAPJKoD6JXaUuRX5zGG
 lyBJLUQYrQiWKb3ViQLVybAmHg6AKoI6ovoeNe0kgH5RAejuCDa4+M5vp8Qzu/FD5Ox5YN47cJJ
 6laYkCkGPQ8Tvi4D/t75Pp8vldD1O95mqfHClBMHk3n1yK871bWsBG6U/miSEr2kbujOjuxf0zK
 FzEm2Ks5iuv2u4wGaZSPPTAYb+oknmpXi32M+RxdgtgMMYWfpvM8ZoIyp2F/PrpVkoBf9USdd6R
 JfLjKSn8aQ6dLmScm2Rz1AQvyc8xPmibotM+nyU7lvNGxn5K3Kqlf8GeFZcfjCo3VnD2Tzhk+PA
 qgOzV/3APItH85CAlatPVD3T2qNYzjx6QbZWxG2F9RWfuNTzChtv6KLhUR90fKzoDHSXd1QCbt5
 1Q/xQFP1tkwzhT1QLqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060029
X-Rspamd-Queue-Id: A8B1A21AFDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95705-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

Replacing manual lock/unlock pairs with guard() removes the need to
think about unlocking entirely and keeps the function trivially
structured.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 2e7f05df93a6..f859d91460c6 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -4531,27 +4531,21 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 	if (IS_ERR_OR_NULL(desc))
 		return -EINVAL;
 
-	mutex_lock(&drv_data->lock);
+	guard(mutex)(&drv_data->lock);
 	/* Already active; try to take another reference. */
-	if (refcount_inc_not_zero(&desc->refcount)) {
-		mutex_unlock(&drv_data->lock);
+	if (refcount_inc_not_zero(&desc->refcount))
 		return 0;
-	}
 
 	act_ctrl_val = ACT_CTRL_OPCODE_ACTIVATE << ACT_CTRL_OPCODE_SHIFT;
-
 	ret = llcc_update_act_ctrl(desc->slice_id, act_ctrl_val,
 				  DEACTIVATE);
-	if (ret) {
-		mutex_unlock(&drv_data->lock);
+	if (ret)
 		return ret;
-	}
 
 	/* Set first reference */
 	refcount_set(&desc->refcount, 1);
-	mutex_unlock(&drv_data->lock);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(llcc_slice_activate);
 
@@ -4573,27 +4567,21 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 	if (IS_ERR_OR_NULL(desc))
 		return -EINVAL;
 
-	mutex_lock(&drv_data->lock);
+	guard(mutex)(&drv_data->lock);
 	/* refcount > 1, drop one ref and we’re done. */
-	if (refcount_dec_not_one(&desc->refcount)) {
-		mutex_unlock(&drv_data->lock);
+	if (refcount_dec_not_one(&desc->refcount))
 		return 0;
-	}
 
 	act_ctrl_val = ACT_CTRL_OPCODE_DEACTIVATE << ACT_CTRL_OPCODE_SHIFT;
-
 	ret = llcc_update_act_ctrl(desc->slice_id, act_ctrl_val,
 				  ACTIVATE);
-	if (ret) {
-		mutex_unlock(&drv_data->lock);
+	if (ret)
 		return ret;
-	}
 
 	/* Finalize: atomically transition 1 -> 0 */
 	WARN_ON_ONCE(!refcount_dec_if_one(&desc->refcount));
-	mutex_unlock(&drv_data->lock);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(llcc_slice_deactivate);
 

-- 
2.34.1


