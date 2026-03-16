Return-Path: <linux-arm-msm+bounces-97948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB8CEn33t2nSXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:28:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB929983F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCA2A3006B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214EF395DB6;
	Mon, 16 Mar 2026 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHAyRGOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4VawkFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22363932DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664095; cv=none; b=pVZb0bcKR2MXcHEhlzpjWX2XtdVUAQd5PI90TfArEmltIgZbYE8qV2W01gGtsA6uB0Djdhz8lXh+uGJmZQ9w3TlKuJ88vSLOHlRenu6TE0FyZjAFy4Otd8h8S9Sa+Jb1hfsarkzdgWNb+BnHNcc05XA1YFNwYXQLuIdyJqCkkLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664095; c=relaxed/simple;
	bh=jdgPOEenPrH+BnN3qahgu+WWKGOOmeDRTpXHshbPST4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YrGWjQOCoeakuYF1L8d/n5VIec2mQ0O3Nc0fk3hxZhrOh1mJvOBETF4m5eW2elRt5CjJjxLnXL0D94plsL0wQwjxmV/fZ2qIKRBhcg3xwJQV52X8g6nzpxPX8Qm9EiLHPv2+REW9PNeHHubSkVjTUR22dvBFrWdhsWSk+UV92xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHAyRGOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4VawkFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA4DAT3125145
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlNTVkadnpS2g8Cs4zpmNH
	W17FU6Ww633NSchLqv76Q=; b=UHAyRGOx9nbwh5rp/EBjj4mgsT/XhWGVPCjr5P
	Fh6QmDdJL9AsqdSFM2/ublRDFf42dUhwWQeNFrmKpbDArO7unY8R4kve1ZgkoQuv
	tUkmReYNJ4+Jf4HhEgjAJP1Z6LX9rgjHlZxUZ6BLkwZeZIlbG/palyimJqCkf/aw
	Px7U/s1Ha2PLXlk8z79p4gIqEU4jVf6OowGALZ65xEZI3iYj8cOb3Cqiu/6iDQ4f
	R1hgA64uMDkb+yXxWRaSiw65sM6oMrmOetFeGdyIxLAF7UULKz21M21CphfsKasn
	azN9svbgN0FWb4IPhsbYYzSjU8axhkwCcMePRSIcE9g3wAyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgfy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:28:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so4133700a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773664092; x=1774268892; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlNTVkadnpS2g8Cs4zpmNHW17FU6Ww633NSchLqv76Q=;
        b=a4VawkFbz4jDfI8rmIVCUm+JEsTT+X0CT0SuDRgiFjjqtxRPsxclZGzqlFvI+IiIEP
         998ZDFAiGNEg3V8RU6dpqIMSZidfF/lLyuEXuGb0c2nSv0ks39Op4u366GbLU0nbk1RD
         hpjEAlYmDhkzfR9AW2T4dW6Rjkpxg/OKTCKP0OZ4IgUD+Hs4wUc6A8WZYmLdaMXA+KvO
         6Uq0rrqAP7xI1f+g23Gnx9+6D8gyHcVk0nv+aj7K5g8VIJocwG37ARLkTVmhFm3FMuGR
         qb9kEpax55ADibNxdBKLLewTXMQ19prVS6LkscJCW4mDocBjlh31pibndCVcFE9V3+hE
         3DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664092; x=1774268892;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlNTVkadnpS2g8Cs4zpmNHW17FU6Ww633NSchLqv76Q=;
        b=AESjmogLyuH+3sAE/cz0njkSaizc8Nk1kjmey0pdUm9bVg4hDQHz9qRbrmB2K3u/7t
         JOejlo7RkMdBU0PIfhsLt2YLLSodyUn/EB/xoweapnjmm60CHBifGHw2mTcZnxjopq3h
         m3oKaiWiRFoCrlEEP/o5bHdkM79vhZ+qadKTx5qQXtS25us3rrj+XhrIZhheKA4KXWLG
         +ls1OWtt44Svmr9U0ZeirMbHZ4VJmyzRJ0iyKLoup7TWzOhHUK8FFJI5LD4JErqxz79Y
         xvg9NSXDW2LLY9c8KsXtTDX+3QWtoGe1CrSrOgsjgOwUcp65wDo9K6Lyjk89Ew5MnoeJ
         RwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfIO4YEp1VeJBxC7dm/LhXz/Z35kSPg/IPGIwcVIjxHu7ZaibNyIkq/82RJ/qaGaXnFtkrn4L9H8QsXhwj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvG2f0ufykZdZvnEN5KcceJVFvHMfLFq/UL5VZErWqjlIX11Mr
	CBKpwxbCBFA4RQMpIpAXnxJdNolIbUdmHl5lkfCZla7mfUZSARGSorFimNOYhIKr3E0nkLHpQUP
	Zz0hhHkOr/ACp/tOUZJlqdd438TH5XlPH79UWByDdAQQNqC3Ckrg5H+easPJdMau/xDc1HAi3w+
	xz
X-Gm-Gg: ATEYQzyQP6HVyyT4IrIiUSO0m2vcYVEbRYcx27ycoQ176fjWmGPFnuq2pbqOvICIHIv
	IyGNi9IV/I1eJ6ls0zeXNxE9G9bqs/Fp3etPBt6GpvkLMq3hPvx20WUg8nfNw2yxkNZm2c/aEHR
	sjq8FB6iCGfAnoSswKZK2vwldxSeE2daRkslmI9beL2pkLhAhDTgyZ8oR8JsHg8hchhtuecJF1o
	LyDjaRaLf/q761aMUOgDu6CxvvTn3K2MubIQzMX5xjPJ0gs1lHLcICLQLnDvPh/xg4w1q0iuiyA
	7NnvWRwfviaot0IR79Cl8D8N4so89f9Cw28MKzfFywUXFSyj65x3IJEf13nlmv/f3s1k6t7trR/
	j9KOK4z7ebgSfXuqkYFuz7e3BMdAMfkhgpzrexeuD7MdTaQykFQ==
X-Received: by 2002:a17:90b:3d05:b0:359:ff8a:ee4c with SMTP id 98e67ed59e1d1-35a21ed3e2bmr10913622a91.11.1773664092384;
        Mon, 16 Mar 2026 05:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d05:b0:359:ff8a:ee4c with SMTP id 98e67ed59e1d1-35a21ed3e2bmr10913601a91.11.1773664091804;
        Mon, 16 Mar 2026 05:28:11 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b8e1cb60esm3293429a91.2.2026.03.16.05.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:28:11 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 17:57:54 +0530
Subject: [PATCH] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEr3t2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3aKCovxk3dzU3JzUxGxdYzPz1DSLVMNEM5MkJaCegqLUtMwKsHn
 RsbW1AAwtd1xfAAAA
X-Change-ID: 20260316-rproc-memleak-367ef8e1a64b
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773664088; l=1864;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=jdgPOEenPrH+BnN3qahgu+WWKGOOmeDRTpXHshbPST4=;
 b=X2/Br6O8Y/+walmutcPBiPVp3+IrMDGWdFDFJ0FaYqdFv5pe/k/isPU52HZXBnlNfwdCRZE/Z
 Topm7iLHkIUD/F02Bs7YGKIjSp7oGOa9S+W0FC+MdF+4q/HCkzTJ4e5
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NSBTYWx0ZWRfXwcgBtLCwxHuE
 fFQ4y2Xnjh+/11peNp37JA6ksDbpJD0izD3SvTSZ7nI+52f1wP2uEdESLMjAvKVuVxoWnxxUPDT
 /6zQs0uGxGRajqdyI/unniSvwtWXYPa0jJCFocXSMRpvDNUZLVGWd+7/gn57LCvh22yF5ORQCOc
 e+L2ofeinSSHHAmhpoS+j76qE1VOYKAGItC7hrNRXBbjmvmtB644ut2gcl2zp1gha0c1nQ5lFfg
 VpzuuiR5xfC3+TgvCcBHkxzovKHJy3pnAj+TYuTe0NakG3cMd+qS6W0ecw9h5JXUTDVepiyZLZH
 O44YWYdkC7cw1zr5cwiQgSd2rW5D4FEPU5pEwqCCz4x7n0fxY8/ylGQxxru1hCPFyd/datcQq03
 +Wt3ILnei2oDxM4IvIOXlGA2Hbo5c6hkOJtNht5ASH/QlM1TioR1CuqTtYCP+1KPMnk7HBVUII0
 O+Rgai6vhrmBJmCaaFw==
X-Proofpoint-GUID: zdkXICulwLRCcNnWBQWC6KnfAkB4L7ZW
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7f75d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LLE1elOOhh-9SNOzqboA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: zdkXICulwLRCcNnWBQWC6KnfAkB4L7ZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160095
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97948-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wasim.nazir@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3EB929983F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Free allocated minidump_region 'name' in qcom_add_minidump_segments()
when failing before adding the region to 'dump_segments'. Otherwise,
the 'name' is not tracked and is never freed by qcom_minidump_cleanup().

Return error when adding to 'dump_segments' fails.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..aa93d3324561 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -110,6 +110,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 	struct minidump_region __iomem *ptr;
 	struct minidump_region region;
 	int seg_cnt, i;
+	int ret = 0;
 	dma_addr_t da;
 	size_t size;
 	char *name;
@@ -130,17 +131,22 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
 			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
 			if (!name) {
-				iounmap(ptr);
-				return -ENOMEM;
+				ret = -ENOMEM;
+				break;
 			}
 			da = le64_to_cpu(region.address);
 			size = le64_to_cpu(region.size);
-			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
+			ret = rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t,
+								name);
+			if (ret) {
+				kfree(name);
+				break;
+			}
 		}
 	}
 
 	iounmap(ptr);
-	return 0;
+	return ret;
 }
 
 void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rproc-memleak-367ef8e1a64b

Best regards,
-- 
Wasim Nazir <wasim.nazir@oss.qualcomm.com>


