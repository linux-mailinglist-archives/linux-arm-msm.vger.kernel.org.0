Return-Path: <linux-arm-msm+bounces-106426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yATuJrOf/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:20:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E524EA072
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ADA930B6CC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7196F3FCB0B;
	Thu,  7 May 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD8BaHm3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsFHm51g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF53640242E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163166; cv=none; b=rdkTzCzLXddafSq89cQpTwT32zBrv5XHSJcTVfkS+wzDjc5GT80Se3lByYt+QTmitDJSbhxhWDoyVDGwtYNPMCvDOgUoljJwbDQ4TxF7MeFDZKLaUBrNjuLiVzSnTMWP+AOm0id0ybUIptO0IJ3g/lU05jrSeTOZOizgfJQFWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163166; c=relaxed/simple;
	bh=hixjNT1jMkq758zZZ1hEzrAx1L8FCxRRm5D2VujRxWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0y8FAMr274v3jxGgKRfguwr2vr3wKL+RScD43hNiZqQZwhaiI9AL8ygTr5CZXwz0huiWvJlNwtEXlKCnab95uNYpuyREWvn7w/XecSPmTi2SZex6F4O/4FrAfpukGc1l22MB7EtVaL2pKIzJwLCyIGiY+RsccXWh1BbrXknm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD8BaHm3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsFHm51g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6478miP9258772
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=; b=mD8BaHm3MLAwaIZP
	u5sZcxhdOeMzMDqeR3i7XG2l4WBe3m/MAZ3GdiI2Uv07+VsclECVbd2OMo4M4l2C
	6zgVu7Odiu8kYnvRjcGdfBNcssTZcNPx096Py3UrVl1VAdRWnO9y3fYCl7qNlpLc
	7LhexuBoU1AhXZeR6Rp03CbUHuJFIiFRy2HoURxx/c3Xx162GGaRX065LCUQp+St
	5RTK5bGy7iJJz3RImUKMj1MvCPt1KAO+DpdI++mOcHK1jjxx/PooEGFx9OZdyEOA
	Zxl5MxHKQjHfpHdHyiL8oTDkcNfeQ3m2H3T73jEaM6AolNyNYICo8knZBqBFmYIw
	AheKKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8th0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba268cb5e6so11617395ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163163; x=1778767963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=MsFHm51gK+wYb/kI+jIdsRx1izMweCjUSQFZ+ZNATk3gmSk69Bo86VClCl0JVaC7Mg
         2hRI5EdL1Mh5REjLRSBLwOwWfwEcC//EX7eKO/b4S6H9eLcY0tw9HXNHDHxbXbwwt0E7
         zcuNWv1qUKRDHtlt30u0ZqPxIsdXm2Rox3cR6TPH2pPN1p7fz6SPx21KbYX5+zfcLY+S
         skFlbhF1LeXH7ABEhe89NpNvJbG1nJhDw5gWC/MSPVdv9AZkNeGcXXGtgRhclCqvhapH
         5bL2hrozxItVQ2vlRLXAyEbDSqFoll+iXl+mgkDVQsBQNMfdoGG/xoUExdBHXoS5A/QY
         CsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163163; x=1778767963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=cVCXJGS2zYcyZMTl3Qwtt3rjGILAZgyd20uow/C9IPfdQnIE0IOcsqJdb7a2FdSfNl
         MpK0scOkZkklAxBuZz9DZj/SNkNA74sf+zOe/SrbJ3bUmWfQvgghitX+8uffom83+c53
         6ZF2TUKfpUom04kfsP53v17wm03dgOH5eAJsnCDpX1U4J2EQKdjpTTnPveKWndqdtGdp
         PfoLgPxobO95X9Ul+FXUKJhyRq5NqyAWmLLiQoj3AzVHq2Gh5brrvzvlxOq9N1x63tM9
         vWEMm7Q6/Jinifrl8p1Tko89SOKWfT1ICBaHYL54R63wffnPW1EjJNCKgMf1Luaci47w
         DzDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ENFbJsfSbH92lPCcyuLWUAmBxCSyF8nZ95YgLRjZ32n8rIEeA6h0B+hWTUxVAWRkvIF1t+cvsj9mN54oH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22boyR8YQfkXq3fRGTFd8ibeQq1f9/PgxF+sLu2L7/FeeVxTN
	BHyaPPT6wQHknSScE6kO1OC//lgJDZDUxFcQKzTO+WmCnJdnPcQ8U2B1Fwm5q6ACZ/GJslcgiqI
	fqj/ldrKjLEE+BRHmLn+K/un0DL/dst1tJuS217Yy4decll6uVo/PbpgYwnLlzOq7gmiu
X-Gm-Gg: AeBDieuETvjW/YOEULCKK6zDz3c69QoD2cvJte4qJzQ0Bym+UDSRE2+NqJtrsHsBEmv
	6YJr5GDACJCPgym1Ueq1Q/TlUj2RYFCP8M6iWA5r7zVLLP6yyf4MuzMIY5MpD4OR3JtW1pjlve7
	h/B9XB0ETKI1Dn9y9rJLWgj058MOOwJAaD1sw2cMFosKH+oxy7GXuUbq9nfqm/gc6GwG5JSohSg
	ybL7WUsnl89UDTJBuxy1EVHGS5S1oM/MU5cp9oyd9YLj7xt8yigoQyK2Hm8nihgOtEEW5ZmBOCa
	Px5FLT4uj74igYH86XkaAK53HRsabCZNFOD9z0Z0R7iuqQw79Ff+Ckf/pwzFUBle22VeLn9vcpR
	iLR8ij/cIN3hSs4d9TEq1DlY/q6pw+I80NYxpJRfFq7FeT8glGUPo4f0d8A7GMEdRmrHPhLzw3R
	6D+VSiDyT/jRHvAIDkYeo=
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423421637.27.1778163163390;
        Thu, 07 May 2026 07:12:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423372637.27.1778163162865;
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:58 +0800
Subject: [PATCH v18 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-2-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=6615;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hixjNT1jMkq758zZZ1hEzrAx1L8FCxRRm5D2VujRxWk=;
 b=wGzEsqp85TWlVQzZ2kT7yOm4VW8XctBS4r24DeLT9H9rJAFZwpFrzKLX95JGw4H0LaxRm6k/N
 cSprM1HBNr4DALEpeUXrliKZmBhBMgBLMIIqZgfySpjxbxG0MpK7T94
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: GFUEL_V-U1Z5DH9X1OYQ7-SDMjqucGm2
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc9ddc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmiEMI61MywFhWxRikMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GFUEL_V-U1Z5DH9X1OYQ7-SDMjqucGm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX9c/FevpctDfv
 DD2NQV4pwHoXuUdHyyj4JafxU5zSbvqOsPb2tNq6ppqaDGxweUcosJj/dqFuvldKIH1NnCB3vcn
 ZNt5KmDW5Ws6PTu2w+vkGcctDNGLUujxL32l1FSHGMpPBvFokCTQVdt3lyiO1cblpcS+k00IszI
 JNH80EjRHBGQFXsV/iXQc+D6DrctGQ+IGKUL6Nx4t0AF8RGbGyKtWn3UIqS5hHVul0ixHaG1Lmx
 +J3Bh4cMewSiFGzxDKczBygovYkxvpOnSR3lrNMY+/QxKdBSqBlGnL+sgHgRXlwiC3atGSMKyhG
 2PhnXVpAgrzXglJb06+o30iTufHYgmpLhWXRbRfLbd80TwXz43mwRhcgwTXcPigATPXfzTaSUF8
 LxICSxFThut8hAml1JpOz6GozRExGEJNQv4FMyhfGQRdo2hu0fcMZgatahcdEiBN+acfl3CMyk1
 qRkD7ChziqICdC2eF0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: B2E524EA072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106426-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 105 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bac3278ef4dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..779d9e479aab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,111 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the device is active, the node is
+ * removed but the buffer is not freed; ownership stays with drvdata->sysfs_buf.
+ *
+ * Locking: caller must guarantee exclusive access to @drvdata->etr_buf_list,
+ * either by holding byte_cntr_data->reading (byte-cntr read path) or by being
+ * in a single-threaded prepare/teardown context.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from the list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+			/* Free the sysfs_buf in coming steps through nd->sysfs_buf */
+			drvdata->sysfs_buf = NULL;
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		nd->sysfs_buf = NULL;
+		list_del(&nd->link);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


