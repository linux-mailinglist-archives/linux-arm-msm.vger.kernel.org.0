Return-Path: <linux-arm-msm+bounces-92907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OaPNDrgkmknzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:15:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A61141E0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A96300A77F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B4F23EA92;
	Mon, 16 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0b2bVr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHeEJiy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6C27F736
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233336; cv=none; b=jdL21f0OMrYna0lOUQyh8FsZbvWgLfcRdQSzDNds8FVhIEGRCfUKOfopYyE8ScpmnBcfN8GWApnooleIDZoYC1uQIng4dUta3VRBpN8LhGP4X1VS4oZlVkFxjdrn7cJaA8bMns8H6T/7JgXMcyI5NMySmmamVtqXBc4f/63NZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233336; c=relaxed/simple;
	bh=PA/ALeOd6a4Oefj4lbpJfvjNcw4qM4xnR9FG34ig7qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1PqaSlnrxdnEOdQgxuOTZ+i2jhBavxQnLVZ+OULgKQtjEms4EnvBHs7Crn+ohnj9hgRnW49nqhZ2q1513rWb52L3CF1LriUIlVgGu7wJFOiacxcMMeWSSgAh5SHJ74/1mPkZZTyNVnOC+DG269qrSUJ5YEFyNgjyoXhOo1VcJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0b2bVr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHeEJiy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G1muBa2994176
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov
	2IQI06QI=; b=Q0b2bVr4hUAy1Wn9sH9RPwRvuAoA6jtJ9S3DBWZoM7dxVe2ALdp
	EPR6giMGwig6KtFww3fFp/ppunFf5AxibtkWjvweD60ohEqtSZOOFgTu4f/jHB72
	SZ9SbayAzDAfXTts5HxN686r4S5bdNF6nJtoPqh3cnvBVbWLyn5PiSAVTJtkbxxn
	aF7anlvuKEtBfgZbgfN3CicCMo0hjqjN9D2TtcivXta75eh5O82rHm1jsWarePBD
	AFqIRe2gmK/AdKcxYKVbOXKltE7kYf/wO/QjXSPwjE8HgP21mbM9ZlL3CSK8HAMj
	Ju49VEqJST5qNIvAp+K7sk1F7BsURARqU2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1ksr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:15:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so1977856585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 01:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233333; x=1771838133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov2IQI06QI=;
        b=RHeEJiy4+NpeEqTYsUwDzZ7/eHC7M2lrSz5wxzKyQjg66PlEBqSbqt33zllcJ96eLe
         a/wlVJWpbVRZ5SnVnS4ojL5CCz+Iw+vawQoVNdwPSu7XnUcw4n+DoCgGnfNbjJ7VI2Ct
         jRK3/fneLrh2vRqK46LGIzT9/vHhAZMMR86kHQwvrPKAf7NIVb5qfpEznM3MUDxGu3Z1
         GeflMMA3BlOx6rCU+A+lpQd1YrxGlH4OKdJhLC76I256xkn6ovnSiRBU0UfIChOXRF1j
         HFZjVf/QBJikhiS4ei+hYLClz6MJahr7qBXfHa6COylxAtG/oGP7mg6BehR8U2p/4XrA
         dRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233333; x=1771838133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov2IQI06QI=;
        b=wdkPaAL2s2sIYPV/R84VYmwQaKixwqG+r1SSOPsvAum0HJoRCCkBbRV5Ad6kOPws9u
         VN4Id5iiMcD2QB1AoszsnWQPUkqVr9+5okbDFS7E4GiDyEpiTP/TSWJdtLpJx3z4xsEP
         cv7Be9ipx8hFBMXKGdNP7MgG2/jxtunPjCmm6JCcLTLT3WwZDRZtZI5081hqSAb8drkB
         lS2S9s7tALV6pAGaF+TzDByr9KcM9oD5NyApld6j6uRylvN/l56KPzrhh2HAs/J29+f4
         4UIWLRq3CrmMArfadGszUWmoCYvjLYSN+XLTfJ4fBjOS/wB8ktWBISJcYV6eStPlrfcM
         PWvg==
X-Forwarded-Encrypted: i=1; AJvYcCVaMcpQwI8XTU5mN4nFCFTjWBu2qxdnAq0pE9xUzU9d+caT74vSIATyEGszxlHraTyY6fkzd3MXoOVCoWhV@vger.kernel.org
X-Gm-Message-State: AOJu0YxQVeikDZN00bqehoPNGKwKP1eVIXo39dhW7nsVI45IBuIyvP9E
	vOpRhrZrnZNxGpHzq09ZIA6Dyoiyd+jtwie8+S2Er1pk8+B9HwsH+OeClLQcDSMf1d3IcOkFg/C
	1uI3/G7WreySuE+pIyFl43kAylMQ5zhT+a0VeB3qmdgXXgm5wJ5727+X5sTUWC1F1EH5r
X-Gm-Gg: AZuq6aKTlKN23YzPtF6trhI0HIPvEBN0DaPXdFF8K3xkFbmxYBfphqGXNG+liuzqzrT
	cS2RBDgpzJsg+JO0fADIZtnpa8gnH7i71IMKJPzKdKDm79u6cJxjY0fLp4yLCIOIg0HPdzgaOUC
	Odqs+7uQ8Sx9glsV56Ealyvo9SV8h7cR6EA7Fcc7lYgPmSIswvP802UGb+wpEQu1SW+SZK2Luca
	5DEIhX9rsoH6x1KpjeyLPlZsKue+pZYS1k2JCm+ToQBnhoB1Z76kWwpRmNgR9+uXKU3ynaHOapE
	3EjJCd0ZK1hoHpb9PfBjgHfbZl8N9BptHssOMH0wKfif9/QHaIRaJ8RuM2hlwySnN6KXX8I3y+p
	Gz2v84abtWMGWfzWOi5ZjSOoQm0BPyfcKGpQl4w==
X-Received: by 2002:ae9:e905:0:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cb50f9246fmr535600185a.34.1771233333184;
        Mon, 16 Feb 2026 01:15:33 -0800 (PST)
X-Received: by 2002:ae9:e905:0:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cb50f9246fmr535597785a.34.1771233332747;
        Mon, 16 Feb 2026 01:15:32 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] firmware: qcom: uefisecapp: Simplify mutex with guard
Date: Mon, 16 Feb 2026 10:15:26 +0100
Message-ID: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PA/ALeOd6a4Oefj4lbpJfvjNcw4qM4xnR9FG34ig7qI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAt4IViU8A4dWN29pTp5Ek6xfCl4V/3oyJ5J
 QI3fvh+X1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLQAKCRDBN2bmhouD
 11czEACFGr/cvt6gSKz9PG8VDvdQYu3m+br71YgSyCzsapDN/5i/1cQJhG4ZwNF/gBHxIwfv8Vc
 7SQazyPyKpjvapb4OvSC14++Beuiq2LLFxPL18Vq4PuK8q5Mp8Yx5UrWQ4d4PiVMnDNhV2i9I8e
 Hnr2loo8p+92PlMYVV4ovUYHzEJFRsWUHHtwKy469ICG05zSN3Fr99dhTN6sZeoBGC553tZrUie
 RzRGMxAymmVlg+BXt4NS9UahmjEaUrTO/C/VuO0E3sA4lTlP7TuXDWdNDFEVUU8yHFJ/tU+IySf
 Uc8DdXV75vYJaHBhOK647tan/uk96amibLrXkl8YjyuSmE/319tIdfedInuu7VLQ1aGiqoiVqPm
 tD9oYuEGjkjyJiUOuyxpyQoCb+gyeOWgsIWXMKMSr3GVLGf9CioYv22KiixiEUBxt4Pnl30GvsY
 IqdCUXHTAhEqARsP+DzZ3o3cr9v6Uk92vD1J/AOYkXw9KBfXEpaotlSlVzT9i46AfR76aLAr0+V
 7OODxYu1yP5Xv+IdV9E9JBB1scDnksdcWvPNza9S+yPSpBQWrXQETpflq63TyqX0mSTVBkrXbmv
 uuLqQhjFFYeATUnEanOfSCS1NED4/HUV1vcgTamy/KcL3+YF57fXDOB4tnG2+ytEzyBn5+FtuhM /9d7ZCqpyQR9M1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992e036 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SNk_nCt-9yVKVlh-3MUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: gdoVStfyXICE0Wem39J7UYGOuHvheqEG
X-Proofpoint-GUID: gdoVStfyXICE0Wem39J7UYGOuHvheqEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX3hEZNMALhzHc
 SELn9HuMoKSL2Zxh2lhkJ6GwOmmg5tzw0luVxTpGlk0bPo0q+4SBI6tFeuryJMJqeqRoIugOPXE
 ZVj+L1UI+iL8MwENV/jAnDQdUibQO3judTEmhEdQQ2RK1OHRaOw5znfxgCPSN4DnB9PdlctGfIj
 Pd9aQA/d80NF4L5mkBG5JHaVMcvV4tmFtYKiXuVvr/KX0BJ5DBf6M52CpaQwVKlntmRgeF1a2ao
 QXxgn0IJruhFWNcvc/gbj5FzahtRVpPHTyTaPkYzV3LRJt00UU6Hx9yaiuKuNPDvH6Szk9vedg/
 ChcDPQOLWOW2e3t/VnLP/qroSoDiIhLxEzK97+KCJTyNacH+ZLhQXsnaYHoa3lvzqm7LTa8eYbB
 KmofAozAJEmYyW5UsdonbswKPLfBQeS/o4ULccrA1C8cct7kWHqu3AqyomKhLgGnvKlAHnYNDWV
 Vc0N+COD0fFCn9f8x+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92907-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41A61141E0C
X-Rspamd-Action: no action

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
None
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774b..21be447374aa 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -699,16 +699,13 @@ static DEFINE_MUTEX(__qcuefi_lock);
 
 static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 {
-	mutex_lock(&__qcuefi_lock);
+	guard(mutex)(&__qcuefi_lock);
 
-	if (qcuefi && __qcuefi) {
-		mutex_unlock(&__qcuefi_lock);
+	if (qcuefi && __qcuefi)
 		return -EEXIST;
-	}
 
 	__qcuefi = qcuefi;
 
-	mutex_unlock(&__qcuefi_lock);
 	return 0;
 }
 
-- 
2.51.0


