Return-Path: <linux-arm-msm+bounces-94780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLW8DREmpWm14AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 06:54:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F01D343E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 06:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE7830466A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 05:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B680F320CAC;
	Mon,  2 Mar 2026 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG7zdkQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmOfgQxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E410377016
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430652; cv=none; b=MJwbicT7BPDUrW5h9oqxODhXz61i0toqD29ra0cLG68ke8sPRD+aTOY/M0JaStmKP0WMVYBjTKMv7qjpRXmfViHTsn15eHAVFteVt4LA9GwDBe/i5kOYzprWN96ITyNNtCA90+YMWJlf6OeoFxH5og/UUUAn2D4PvvdXc+zv038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430652; c=relaxed/simple;
	bh=Lju4CWP3V8ABLB9X0SzpJ74BRzmxxmjnvWfRf+lmAZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSNJGLG7nS1GMMVV8b84eKNaYxOgqBr2Klk0KY+GFVtNqEA/rLK4QC/ZUApE04QHqHGY2G2MDddTiMbnL7tQCPQPQm2jbZgX1cpSzBeV/+e+AOjOY2DYvBQQQuNdGAPAihwVrCEdU6y5nIVdBxlzGemiWyOExuGlNEXc42Kg9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG7zdkQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmOfgQxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621LHe4U3510864
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 05:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz
	5T+lx3rI=; b=aG7zdkQjnT7fIMbx0usGgpjqHRjHguZPe7O7mwOHz+G0dwd93yv
	ateTOcs/C9nJ+7V3qIlvcyLr4MLEtjphtaSJ1cBSVRf2MqeaWhLvCDgc14jko0Sn
	WTULyynOMU8ArnuI1iFwSPjLqRZcT6CrBx94rcSr/Z3Nvf8PXK82Z/+tXdbdxPuL
	5j1TMVUNIMUKXTrdRviMlQqUqQ6tVCgL1tnIun8mnf2BAAGSdMwMzUQxAiXg4v6V
	aOYCb5viaN3hjLLKAnIILmWUF6kTF25EeEUWNqL63aaNybR/9AB4PSut0RMq7xdH
	6zKb+DUob/vlafuK2UKCD9VGHeyjp5+96sQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshcm7dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:50:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae50463d18so5137865ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772430632; x=1773035432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz5T+lx3rI=;
        b=cmOfgQxda1P3nod6iy2whMyVmwc6vDWtXy/qs9di6I8geAUyK92IhTyj+nYhqBM88d
         e++K7FXB7sjwfo0Iqub49WTtYIHJI8ugc9J7or+Ii1YJVzGWt3T7RjFIpjPE7p3RgZm2
         YegQHmcX2XEO1mKHOllhXKkEhOApJFCyk7/Oa9rNmCvhmlsM56uJzUrAEvbwLLxWnn4q
         QE06xaqyv0KAYpJ7+IWUUg72+8zBoNlT9sGiyoWm2OxY7rDp3pUDqQ/uxRRVdR8Q4E1K
         u/zXzarg8wAUjbUpyDveDu1fNVSAwE4NsaHi++l5P7TlZBB0R0qTaxdMlDnM8c5c5E/v
         pNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772430632; x=1773035432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz5T+lx3rI=;
        b=S1Ns7NF3LbSurkCUJulo9l35WTy4haLvyRYpzTmcMfetghRTSkLoLKvnwxJT6mjEsQ
         ZnzGWjHcbO0UdaDJYM4rgYeeUB8qb419VoIVaYBSy6SGIn+OlujKfLNyEs7E1WSA7BsB
         lZyjGiwvPa+IV3REfXkFyBiNfbT3AEsU/Zr35urVjFcMka9un6UDs4Q/ylNcxe8tb1dm
         jEBlDEqr2Qm99s9AMsHvOG5J3HbaviH1aup4BZdJ7Q20e+lhlOwsZgzPUqeHkJt4ewC4
         iIZekKSJp54dgA4LV8jBLPafSa8MIlwS8yvoZVgrck9++JfN8c4aDx4vcacysfuDKAvk
         fkCw==
X-Forwarded-Encrypted: i=1; AJvYcCWngEtc8avKdFPIWi1fMJsOyYpc+Dbalxr2g+LLZo5Jx9Nfj0L81Pt+CRLReA//HkOheKJsNAI3wCEWF8M2@vger.kernel.org
X-Gm-Message-State: AOJu0YwrnP14DedIm3rAPoEWW3hQAWAxGaOzoEwSegrOr5Z82ymXETvb
	P9Su970yLibcK6SdHH1JZREpHbteai16/VLJuv8x5keSBmRllUrEq0/jj6RAYhtJQ/NxU6WyGuY
	hzk+BsvdKKql9FoGLFQRW3hR6nW9pHTAk79OAdo7uZ/+/gf44I5Z+bAMbSNYlMVFtqRmM
X-Gm-Gg: ATEYQzzKW7Bplr3pIm7yTy0e7PL3jvdU/SAJHUknM+h1j4tfik6loSG1nPYeVyvBoof
	paC1uUgFLl+oIlS+3wOgUxCpSLBOg0N5T9JqYZ6hkGinOW63DDnUKz9NXMRvFtIKCPm8PFC+R0E
	as3WLOf32KbQmnH+Vk27wnC3PgnvKTYtmWhko4yEPyd9wTaQgokKnqh4DUTaHvx5YSHH4T69iuq
	IGNmPD+tOa8pX0WUQKFrUZeaeKjViwuds6LV+pXiVmTPhJ3RWvpwFFvPeHUbLVWreVVXqADB1fF
	PxOEHSZD4ps/hX5hFt3g/gpLAJcXxCzrnJU6LRk++Cy3hsFeyhs2vSv1TPL9Nyx6Xo8OxdpvF9E
	aaQCNP7jrhV1A4fJ21DVnrntSKwcik8fpl6ZkWa7pkQSFC9w=
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2adf78db637mr150838085ad.5.1772430631690;
        Sun, 01 Mar 2026 21:50:31 -0800 (PST)
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2adf78db637mr150837705ad.5.1772430630877;
        Sun, 01 Mar 2026 21:50:30 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3a9baf93sm64857195ad.27.2026.03.01.21.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:50:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] bus: mhi: ep: Test for non-zero return value where applicable
Date: Mon,  2 Mar 2026 11:20:21 +0530
Message-ID: <20260302055021.8616-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Hpw1pOdkYqXmHjgfcnC7lvi8k8Mqg7yI
X-Proofpoint-GUID: Hpw1pOdkYqXmHjgfcnC7lvi8k8Mqg7yI
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a52528 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sJQNH4r01jd-CmyNH9wA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA0OSBTYWx0ZWRfX98mjEo5YI1hc
 BSF7d3gZS7OFVKU1MzDVYwyHmEXALx0jNROzC7JO2QGGW7XsgDfwQJ/d5DfIl3U5nJFDlFDMlhD
 kJXA10QT0IxEpBpf/CP5nLGTW4sZPQK6Fj6tsotVFx1rHhJ3JG46YuWJTplr+2Tkt0zL7gdrBkS
 /cFxA/Vit4V08/ftsj0BMyJj/vWzutbd9OgaE9nitCb5urbuu+mt1CUC1f5N9nBTFFONIWUksbX
 9LTy3zkHxjV26NYgI4n3fWM+aERI2ryuwp/OgDotf9FSPjTiMAJ+vcu/J3FWCkGc7QB3MXbHljP
 ft9rtwt8EmX/LgKkxrL96sxPVhjpSH6pjNhJBPK0Mr9SUiJMhW9YFYVJ2AN6fHEOV470hWm+6R3
 SHxXIJDLqoQM8F6EuqIxN7Q2PBaiJrdvE70GMwXxnPN8Nshh+872OBLrPw6fCJ9hQNM+0hJ7Frf
 pj+MK1PSs2+Kg8OCq7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94780-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C3F01D343E
X-Rspamd-Action: no action

Instead of testing for negative error code, just test for non-zero return
for cases where there is no positive return value. This helps to maintain
code uniformity.

No functional change.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/linux-pci/20260227191510.GA3904799@bhelgaas
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 10 +++++-----
 drivers/bus/mhi/ep/ring.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e3d0a3cbaf94..0277e1ab1198 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -367,7 +367,7 @@ static void mhi_ep_read_completion(struct mhi_ep_buf_info *buf_info)
 				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
 							     MHI_TRE_DATA_GET_LEN(el),
 							     MHI_EV_CC_EOB);
-				if (ret < 0) {
+				if (ret) {
 					dev_err(&mhi_chan->mhi_dev->dev,
 						"Error sending transfer compl. event\n");
 					goto err_free_tre_buf;
@@ -383,7 +383,7 @@ static void mhi_ep_read_completion(struct mhi_ep_buf_info *buf_info)
 				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
 							     MHI_TRE_DATA_GET_LEN(el),
 							     MHI_EV_CC_EOT);
-				if (ret < 0) {
+				if (ret) {
 					dev_err(&mhi_chan->mhi_dev->dev,
 						"Error sending transfer compl. event\n");
 					goto err_free_tre_buf;
@@ -449,7 +449,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 
 		dev_dbg(dev, "Reading %zd bytes from channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->read_async(mhi_cntrl, &buf_info);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Error reading from channel\n");
 			goto err_free_buf_addr;
 		}
@@ -494,7 +494,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	} else {
 		/* UL channel */
 		ret = mhi_ep_read_channel(mhi_cntrl, ring);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
 			return ret;
 		}
@@ -591,7 +591,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
 			goto err_exit;
 		}
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 9375b16ff2a5..405ce16c02a8 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -49,7 +49,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.dev_addr = &ring->ring_cache[start];
 
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret < 0)
+		if (ret)
 			return ret;
 	} else {
 		buf_info.size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
@@ -57,7 +57,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.dev_addr = &ring->ring_cache[start];
 
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret < 0)
+		if (ret)
 			return ret;
 
 		if (end) {
@@ -66,7 +66,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 			buf_info.size = end * sizeof(struct mhi_ring_element);
 
 			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-			if (ret < 0)
+			if (ret)
 				return ret;
 		}
 	}
-- 
2.51.0


