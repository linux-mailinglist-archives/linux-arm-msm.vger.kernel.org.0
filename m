Return-Path: <linux-arm-msm+bounces-99165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 12QLF+YNwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EA2EF6CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B769130579F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACF637BE66;
	Mon, 23 Mar 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn7WVtAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgFAvpZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC338758F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259397; cv=none; b=hC6zwKdfP3V69Ds3MZcu9QvKJKnePz7H9xY/wWK+j1zbulFmgfD6ln0yZ/D22/vY75NHmF3sKRuabP2SS7M3ocg9R2xbAAP+VhN4AxEGyChKOD4KemrXupfXmY2zKK3ZlzuznGAENnVLdfyaK8bqJi71cIRoVaii7DRJ8mkm/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259397; c=relaxed/simple;
	bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqeHxTgpfYIUAEqtNrWx0sHtSOP4hNMdmlfb1gH48+9zDPgusFu82itBrD8ALHHyYTOdHVrGvcK30STHOE+NV/mDbj8HZBK0hgresoo0tHYdYZnokViXMjBqB/7NOGBESr9cFGyG1Kh7jWbXqR8RBnCTApiBddP957GxPYlB1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn7WVtAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgFAvpZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tcG11627195
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=Mn7WVtANdLkIu+8d
	ykBDn7KOR2vtBgKonqxOg0r0blLWFH8TBhoKkUME5Bk0NcZySln1ruTj4QQn0pQW
	rEpWrqmMGi0rM5PveuriqY7HMp9LzXugw1t0AombowwSCleZ0sKJE5z/Avk+Qv7t
	Qv0mDQY7c/kK0WKeeaxvAtA/5r/qFZ9WF8Zl3ChMXON2hT+w5DejOeycpqwhXWrI
	VZLRzQl8IplW2b9MS+w1SmIHavZfa9mQpxLEEj7C+TeNcgv06Rp+kBYgWrwFL82/
	DXHD/nRVrXZrmvbzB1ryz48TcnUCNynZVBCNUspOI2oAPfTnPWvWI/eVhCSykXXX
	DN4KEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0dg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:49:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b051befbb8so33180405ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259395; x=1774864195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=kgFAvpZmVSzAQqXc3K8grVmwyFog8rDnkztt4dYxTC7NGrcM0l0Yyn8+LH+yakIzct
         wNr5QeQgT43GSlefYSG+Oy5vrOst9eGcTUTtRfiHmxZylOUOEgoOZCwPtdliCtsHlZg6
         RIFdhsfY0/PE/Zy5uN+mBWuEC8C5dvMB2fhu9le2YMnUEqsuMYGSPFbBr86VF60jF96R
         ypW5xOKG8Iit6seKoESyOiaXSzydcVBYcHkKKhgn2dEySOV+u1OCK8IWn4Zm77xt9p5h
         Rr7ODbJ4nxLRC2x0LBV9we0VrFIM+z8jhF7PsXxtnTFNEd3qMf9obMDPriE9nNFpLUNj
         M5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259395; x=1774864195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=Anrlhe+mlGGKtpSqpYXKc19UPFkp9VV2W1DGWEaP638xALXdej2/ANFRVmjwgoEHWZ
         qUwjCUnDR9mHB77O7BGzFGTsKlKV1MAaWnNlqNddY1kNxqT1PiT5B12NggJB9X+kIJ0L
         F88OvYfwx6b1mjYhTA7A7XWawcxlK3DS3wX9R4TPBOl7d6l/HVioJqLHEi45qtDctZpn
         TiNB47Ebf9kROWRfPBGrk2u1fyDHgbRjywLUvCrvAwzh8xCh+eXsLmXOl/kbBYxDJ2u4
         lxzDzWzJchPjV1EKCJXqBb61A2sV/aUcFs1FYa0y1TLnP7eU3BN3bVKQI9+kcreELudV
         lHog==
X-Forwarded-Encrypted: i=1; AJvYcCW7Dp4R2PnKbWtjaYcCgg4FD7xln07dgRdk/elKbWmJDDjAgGkk+qsZHNqtEwVEEgmeUDNjNrjDgkmLuz9+@vger.kernel.org
X-Gm-Message-State: AOJu0Yykpt0db/Vacm0OlwYA9Z8YEx5p6l3L9WdjfEVkR6uvPB2hkEAO
	B2JWkDHOoPuJb7KARQKC+gxCOF1P+iEeWG3IREEdSiHwDuorfZTn4uww7Ov9HiAQ3aXfYiOlaw5
	VgjW7N/auOQo9wn8FNjBD++gV/nQhTsC63VtHrvl/B+oDx6msQ7EA12tazoUOkCMNghac
X-Gm-Gg: ATEYQzyHdRnAJw696nNsPHw2FF23TZbHOWR30k8wW/ZgaX3Y59z606DhiP7SlZqyC5o
	qGPymo08uPYwnf/3ceCP4BNmqe8TKqPgdVUJmVrFXcU/NA7cLe+pNJaGNF9+DSZwMK8d+4xMoLg
	hffUtcKXqKlsUoYjIiK97vfnhdITpa12gPpQUyWF8lKtFolOT4m1+8J4I1z6XT48am5/L51P8+G
	WZU2wg6C0jpb7DzaihlG0Uf8SCxkFOA9ILGaa3rCnXYlra0KMEkPfgOs/7mlgkCJsUQA6BM4lQ3
	zQqIb3il3X0Ss2yOCGzk86/ogOkKuxZEAH+Rx1n8Uy7s5oeGonY8cXnn17R/VCyjJIKnIoxgrU/
	8a5EHljNleRiFkMO/J0yToJLMBdwihCneg7CZAdvXVb2lcU20BV0dNefaH8C9xljy0PCnAGl+go
	vh91kLI5Os
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114908995ad.21.1774259394752;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
X-Received: by 2002:a17:902:f545:b0:2ae:5655:b16 with SMTP id d9443c01a7336-2b0827556bfmr114908795ad.21.1774259394276;
        Mon, 23 Mar 2026 02:49:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:26 +0800
Subject: [PATCH v16 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-1-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=w8ZILQOnGTMowRbpwWpLUHa5OOF+7MJT/Ml5rl4sI+DJZQpFY3JY/QPQdMZL7gqB50X0CQjcF
 Ld7n0gX3kSYAOt22Gbfx3Q5bQ5n5sDS6wUCigNYTrtUhtb2T00rpytb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10cc3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jBKfsQ9nqAgvvvpPEVINK6UZiy_sYnrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX2movKDWLlVEV
 2zykvS/hE50C7ls7iSq4xh0w3uZtwETo13Scv4N/0NrXFkKAqxfO0vcOk5emcDHOqsBcYISmdJR
 fBEGCgbCAgrP88Pr9dDb6/SVVsrD5YepMP7k58lMch07Pw6Fywa6xqOUDdM+rEzLLyoKqopw2R6
 Q7FtH6a1l1yWFn3b1lXK5KPmpCwjnKKQw4eweppljXgsdseSXVUjmjmCSdEPq4U1pcPgN2hVfeK
 EbG+iR+zsNTYXC4TJvSkxejs5EFlgteldkhSNa2vmM+PUbc3ssOI5XID5cnNi6rhK8+qHs7wfY6
 O6f+Za2As7WmP/VS+l9lvCaJpPyWoMX0wJrEeNRR2tyAVACrmjS4xyMATlnmMffNzmHYSG6eW1N
 v7E6kvwxroI+vbgSYCDxGHvcTIgzj1QdQychRcTN8Qat5LhU/mN50MboVo4mcH7RbogaM+8gs6n
 L2pDXGYUnkyFmmxZ0pQ==
X-Proofpoint-ORIG-GUID: jBKfsQ9nqAgvvvpPEVINK6UZiy_sYnrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230075
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
	TAGGED_FROM(0.00)[bounces-99165-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 172EA2EF6CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


