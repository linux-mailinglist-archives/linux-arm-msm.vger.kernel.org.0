Return-Path: <linux-arm-msm+bounces-93358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBVtIfralmlJpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C815D737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13E2A308BDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DF8320CAD;
	Thu, 19 Feb 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HB9PQt1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jby3DwdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86131A7F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493979; cv=none; b=RlpkfsyJyuWddUuWNMmoTDneTXWGGL/yilKgioYfQHdgdKJvg/ptJ/5kyYPi5xznfJGHP4GZZakizvy/zsDR8+gNMoqAvUWWGHYr23vwHOLxz2KQiNbmXy/JRPnJYOIoXc2ICPoIDZwiIPxiZql2xDbjoGOAJwM5RV3gkDvdD+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493979; c=relaxed/simple;
	bh=FdQaUHaIKGi8PX7kvnxnJG19Dokd/6H2sRexB/vQ9cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pW3JMdPIXLz7CnPHk49W4rkXIrkgzBAVQEdcoJwCO6jSqXHoPOAmd0SSzguectkyG0flXK6Q6BZ3q3NmQJjJ2Y5uo93LhwfNqi/x9tQHMCZnXJOQUZMR5A8G27fkJTcPc+CYRxu69ZBIk/RZ/4fJs+p/AH3ZB2rILBx5Df4BI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HB9PQt1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jby3DwdE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INlfbY1924952
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxM27KGWub9YOvIskp1G0Jb2ZU0MzfIFZFqQpkv+G8E=; b=HB9PQt1zsqp1Sn/y
	7SgyPZcRkFPJJOYU0ZdVMprNiMhj9Vt/23BMYurUsB1EGBRsyUDKOaGr/iboqtw5
	N8nBcmr15jqffwfYmEmzikhqEal9f/22hrHiU5mmy6FW6MnhqZCCdmJOhRhPkTwx
	2pyWN5QM8fDkILKv2jceqWPiwuJqjA4Qgv+a7Zc+o72CERO8wYo/+Vr8PhMclHFl
	O9ppkqjma23+B8cX0MgVNKWUfI5++C6u0zVCAX4ZCufKGx47AzF8f4HrWP//QWIT
	6FziYRxxRIPZKERTLQrJW6K0hisoBnIuiSe+3qErYXWGoxESUT989AsydstP6gWp
	aBFUcg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdg94qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e18ade2c2so539188a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771493977; x=1772098777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxM27KGWub9YOvIskp1G0Jb2ZU0MzfIFZFqQpkv+G8E=;
        b=jby3DwdEdRx5GgVpncDNK2Z8qKNMb3PVAbM91u0vcq0KfYxMaa+cqXDYhs8mi/YsIu
         DfwBKUgPEhnwitIiTIfm/nOjMOQla125QVjPbzZPZlv/pMaPc33VwY/aIkH0RyGee0jo
         EXE1UCnSDxXU9/nZwIaPB/LjMynOHyyK/dmz7B2BraYNXzVETmBOiWuQMIYwd/pdFo+J
         uloeEIJBNu+hclKMxqE4oyU+8TdrDeaqWD2n92mNImCB8z3qJDwEnx8Xee4sTskyxNWV
         saYufVoBp0ydFgabxIJ4dOcTb35XwZvfzTq5qdH6egMpFDlm3J4p4cdhgnJiUhsoBNmH
         /CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771493977; x=1772098777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uxM27KGWub9YOvIskp1G0Jb2ZU0MzfIFZFqQpkv+G8E=;
        b=svgDHypVkQ4M94fqSYi/imls+mtZVPUYFx52LQfg0MyQhlxmwCQegLwR7QqI3b+jni
         n1U/Muz6DGaOjUpspe3bYsXH40rWaxyb9FtYsA91olzSxLdNQt1+sQnFvkahWWLDPvff
         UPEvDZvNa/K8qJwqNj/O8KvJOfveWUngk7hHaIXR8Q8sdrG5UU3maOjrpi7OhZvz2qo/
         fwkc9ZKv9zpi3c5WfpeAJyLsSa7g0iI1hsJD8ln201e7w9nHQ8dhHtVTZQfWC9lMdmAy
         tV0RmZEShpWRO0sKO5JZuDX0EV+EkawKNmrPrN8No1/bb189DmHY0SnB+0Q1utiwMv8t
         q+rw==
X-Gm-Message-State: AOJu0Ywu1Z6aBbLZ4o3cRyVa3mykZjJhR4lfp9LI/DnSchuhKVB1q82a
	dS//vDxbpUN7EfudAI7s3zT2eEcC0KZdT7kpd3cz5xigL7nhZCmtVfJwyomB0oVbXpBt1xdeLDE
	bV36gUzxGt2yegLhjL7TbzZDhZW/0e/Mz8eSqiAbMg7RhdYZ8or4XNM/acAEQPQgt5M3Z5Y01ZV
	LM
X-Gm-Gg: AZuq6aLUeyqDzAuIVPZi492Z9ihIK1Xrbo0EnaUyu8XcsKIIO0dDHespRwGd5p6ufpO
	UZswyh+b0r9tta78hVIn/fA1e0hULsB+pxkzSX62sRUk1KGJMZKZ+K55zXn9S8rnpWnFJiMnyD6
	4unjkfAtGu2zsKAfxUy3JG85/1iBFYonU07qusTa9Wzj1L9u/BiBPzA2gj0iaXIVZG/tEkLaBEl
	3/TJnKZ0pGzcvkPuoIv0A3MpdcA5AE6StwHjrtZj+LOuBp2Bl9y9aO3qAzR4MxKS5Fn+NKs1Zpd
	Gt0wNRkDIibZyTYIjUTOhhu9PWUg+mCI2iC8yWCWOq45HtgZI/C9JoE7B5o20U24pFQGSXIk8rq
	m61cnvCr7nifyjloWEqKF4qf1mEOFVIgltnRsp0hugVdypIKE9AQBy7q2tx0=
X-Received: by 2002:a05:6a21:3991:b0:38d:f2a1:a43f with SMTP id adf61e73a8af0-394fc31ce77mr4241410637.42.1771493977076;
        Thu, 19 Feb 2026 01:39:37 -0800 (PST)
X-Received: by 2002:a05:6a21:3991:b0:38d:f2a1:a43f with SMTP id adf61e73a8af0-394fc31ce77mr4241380637.42.1771493976568;
        Thu, 19 Feb 2026 01:39:36 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2ac83sm17710250b3a.12.2026.02.19.01.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:39:36 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:09:15 +0530
Subject: [PATCH v6 3/4] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-enable-ufs-ice-clock-scaling-v6-3-0c5245117d45@oss.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: HkQg2_3fbDNoyiJBOpDP9qAwjhUAPNk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NyBTYWx0ZWRfX9W1jGICi903H
 a8Xh0hldY5+Nm5qshVzm5C69ibZWOxefRGZGtYJP9Rdd01BWwu/jD/9BwpMHWfNWFSN2Zo7BP+n
 Rw2t6LAh8ijDg8pQ1iMRrawmEP+UfbSZ8TRTLwsgKPe/h7MmsTXvqgfuNQ4Tu/P4oesWsYReyJN
 cwmcM6GzLGr4i/I5pjugqx0O3sssAU+QOrMUkW8fujOWUxj9VMzh/zqhOCulVNd5K9e+tX65fAL
 o/1EOiTjGQrEsqb2EXZ8yWEZXlmsGAhuZJoOkByFdXWlkf3HD++Z0eid6OCOXbUDQBKRxn8LaFt
 G7qm5p1kRTfKOQRJ9RK5QmcKNWuBN6LWELjib5S7eS6LtdCLSZoV7iF7kRFCN8jckjbk/dlXY4c
 ohANBlQABvHO0aARPimUZEUu9ef/QpCnBdDvNnUAmLNEaPK+F7X2dhJ7WX7bulvIU3lWrR9Vtxe
 utnFmXFJ+j0CAOD06jg==
X-Proofpoint-GUID: HkQg2_3fbDNoyiJBOpDP9qAwjhUAPNk0
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=6996da59 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RVjIYUuWhs3u9hRN0oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93358-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 301C815D737
X-Rspamd-Action: no action

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

Incase of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..d85640028b567d2084683f237e3110c682a08ddb 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  unsigned int flags)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, flags);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  unsigned int flags)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,8 +1661,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, target_freq,
+						     scale_up ? ICE_CLOCK_ROUND_FLOOR
+							      : ICE_CLOCK_ROUND_CEIL);
 
-		if (err) {
+		if (err && err != -EOPNOTSUPP) {
 			ufshcd_uic_hibern8_exit(hba);
 			return err;
 		}

-- 
2.34.1


