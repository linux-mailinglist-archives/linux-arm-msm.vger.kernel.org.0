Return-Path: <linux-arm-msm+bounces-108577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBF8OMCbDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:20:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5E582F12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F0AB30AD232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15044305667;
	Tue, 19 May 2026 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCbvO47G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK60jVPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57148BD2F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210951; cv=none; b=i3k4IqHkvSPA9HZLPnTZkzz9alA/gkHFxUr1nKI8XhiFfg75aVdX1uNyXotdbVUcd+t/0kd5q0+l49MwXVot3c5j3/SQ3lN+849+n4rqB/K3yjNXXN6o7neOqTv4G1DBaFJ1Esjh9BFGDITYTnd1pulCnC9aKSLKqsyb1rpr6QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210951; c=relaxed/simple;
	bh=k7XS6g+yACWsz+lIJOxbyvEHuQON0JBUh1Zalmxh+qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvzUTsMgrn+nq5Y7NSsooHRdHpBTwT/VGc0DhAcbRNDgSsBm6KjwtHaGHpulb/FpFWxJfajKeX8PJUMZ4rMcUnkWjBV42FXdciqnVyS/LTZFElA+tGX3xXbz+OEB2d9kWF1BlPiSLj8o/XgYesaItGfXt+Spb7UMHS//zPvrRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCbvO47G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK60jVPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwftd1739557
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b0ycF5Fq5Oe
	oqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=; b=YCbvO47GgEpfdToboN6JOusS/3V
	qNWgbNwVzdUHvhdsYvUqYqTAHrxQaIxblwUkm4wfkhI1BIabsMS5sc74/4SpRU/2
	fM1DdRsc7mcrLjtTT4ERqi9EfE4wvNAqpCeApnJ5IY5dxBqOUcC2V08IGQeGtj9k
	kbgwFqMSmmw9pZC9LJdCo0oa0jhNLx84wNdEasiMdWRBA7yJhuDGEF5AgBhEPns4
	OFUZ7DG0356f4pzw4S6Sb2For79r1VEB2ODeGRoWKrnfK04gpXBy5iBbrtWQaTuT
	0mKEPdYQKXUlBOj96IeYFUVp4num/dsHhoM5qvGqbneoOA5gYz2/Rzl5/Jw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3q8nbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso2325628b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210946; x=1779815746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ycF5Fq5OeoqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=;
        b=jK60jVPjBLLSrXfzRp3sWEMPeq8SNcMVnXskL7Y8OdwLoCIxYjQG25bYBGDWfZ7Lvz
         tcN5IJ7obBaW290qWaFIaeD2RvCES2gm/9BDagidPSr2I/0BGKt6YzVXzWNXJ/O1em/y
         EOS6yeX7VZBbpHi5VDDXugjgVAa6ybDi9HjPkng+bW0Kob9pG7jh49MjEYNcXEL9/+BI
         wirNTtoo0GC7qlA9JHwSo/YU23h2QSGSiSUTGpGqrFTT1FbRr3LVsctxrNIrRrVw1yb1
         ibj9Xnt+5m3VIKdHooKB/T7VRhqQFShe20dm7bCD9nUMuH3jhNikRE+vKfq5XvcB96d8
         0Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210946; x=1779815746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0ycF5Fq5OeoqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=;
        b=S1LQk3G1QwK8GYHQibGtxeti0lH+uRRx0ngIlyrW3IyzFsDyyAB5toELpi2X1FdKBb
         R28lWJ9YN7NgfNphTqyM6zgfP9rkn31u9Xb1CMpOfHfby0fHPpAbPse0Efrn583T81Kc
         Dp30Vdp7fCUwfZMlyc5z1y+Bx62kwruWNn3MJlzcixhGp2F8l/czByal6d8Awdh9iNP4
         FlD84zQQ3Oe2ZzLr/ty8SFV+NZxOs07DrxEB7rG0gvCIoWI8JS8TxCSI23hGBy5fXhUk
         Atja6aDFXtLDJNUg+Z5zNjGsYc5Yd6EzXjx6/ORODHqg64amgue4ahqVVoNB0SPFHHu9
         b0zA==
X-Gm-Message-State: AOJu0YwXadBm0UVzyADTsPJLR4y4y3NZMS8CdQvGkOVOVJDszz9cntIL
	qTOoan82MFVfukHZG+VNkF29OWfzXqb4NGRQchkVFfwpVIR7izP+/eYD1v8BybAjIFVHv4XDHTj
	SLMMJ1mbnkkojAxxx97EoaqUk29GBx8/xZNJpz9vnoAlN3RsyDAvncmDPhNqUQQEslfT9
X-Gm-Gg: Acq92OHLqy5P78OFAwdTaVNCCTB35ichhL/Hx2jH+4/QhR1YWJETztIuBfbKnFhii/5
	AiK34ftEK61+mOE7tZYZy1S0V7KeD9T4opBVNqVPD1HeTdABNjAqQZKL4BhFcfBOXadieIeWhN6
	aUnrqSlrESy3scpXX7JTD93AH/iIgTaup2jnRsQh72SBD6Shx3IWE49OTfBUgizg73TqsagQcwv
	lDm90fh59yKCFqfI6qHqrTUN2b6oORaw6K/PZVEH30YhtfmMGRSG6b5MFsZudfbQb6/ObpYALAS
	UOgwSl0HmEOZWx1y0Ue4uiXrs20i6kJvG8+1mP9k5l5gtGJNxOl/cjLgKdBzgGcUbY4MZTEvglN
	cLMcC+FFUqZkddhc4Hh/oohZS898iTbD/b5mA6naS6PoahTgG
X-Received: by 2002:a05:6a00:a203:b0:837:7e7d:3d9 with SMTP id d2e1a72fcca58-83f33dc529amr21144313b3a.44.1779210945375;
        Tue, 19 May 2026 10:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:837:7e7d:3d9 with SMTP id d2e1a72fcca58-83f33dc529amr21144248b3a.44.1779210944514;
        Tue, 19 May 2026 10:15:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Date: Tue, 19 May 2026 22:44:41 +0530
Message-ID: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y1o_oOlwetYPjgR8uMIg6O90OPZ33YFx
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0c9ac2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rvpxAYJ4qTt-cjm6DxwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Y1o_oOlwetYPjgR8uMIg6O90OPZ33YFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfXyQB+VvwuOmRc
 xW6W5tCS/sa7SmEZq3YJSSx6sY7zcsFHJMi+zylMyDCLZQUdrLlLFN1bbBIMA9avEc2KJN1s/ps
 Ny1O1yVd/qh3AUhZisQGvTvvAm5C3uSs9WYQpv9FideK3CkDOI5xhNVlZZHZpJksJd6oBNWBttH
 kZjqO/qrOc/yZwdkOuLq+Xo19Loa7WxEGX8FKbDkX3ctr9Dz/+uyMPnCQuyXedfxNT5MgiSAMG8
 HPxIBc2c6dlW3Ry+90AHfYtzAkVdNYUNV4aTjjfvivNCe+34l7CFfOkdd9lQ+xn09rtMVTrOvAb
 1O7cL4/jyHtsqvtdjuEhbJjdQwynmFFGa5xw9RgX1CHXkFdPw//lnp3nQcZDVbv3RGfQ2Rcnb4S
 Wf83g70hsqWDuj/Uh4uJ4mH5JW1+ak+s7Xr7bPSWyC2//Jwkl0roxUhGnRLvix5D38IvYcDM+X+
 4H33+X+c6FdOiLJNQ9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-108577-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FA5E582F12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user can
select the destination. Only the string names "usb" or "storage" are
accepted; an invalid value is rejected with -EINVAL. Changing the
destination while minidump mode is already active updates SRAM immediately.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 91 ++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 52432469badc..e3d5973bf567 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,18 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const char * const minidump_dest_name[] = { "usb", "storage" };
+static const u32 minidump_dest_val[] = {
+	QCOM_MINIDUMP_DEST_USB,
+	QCOM_MINIDUMP_DEST_STORAGE,
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +581,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 
 	if (ret)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
 }
 
 /**
@@ -2040,6 +2061,37 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	if (!of_property_present(np, "sram"))
+		return 0;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return -EINVAL;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	if (resource_size(&res) < sizeof(u32)) {
+		dev_err(dev, "minidump SRAM region too small\n");
+		return -EINVAL;
+	}
+
+	*out = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!*out)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
@@ -2733,6 +2785,40 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_val); i++)
+		if (minidump_dest == minidump_dest_val[i])
+			return sysfs_emit(buffer, "%s\n", minidump_dest_name[i]);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	int i;
+
+	i = sysfs_match_string(minidump_dest_name, val);
+	if (i < 0)
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_val[i];
+	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
+
+	return 0;
+}
+
+static const struct kernel_param_ops minidump_dest_param_ops = {
+	.get = get_minidump_dest,
+	.set = set_minidump_dest,
+};
+
+module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
+MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2750,6 +2836,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0


