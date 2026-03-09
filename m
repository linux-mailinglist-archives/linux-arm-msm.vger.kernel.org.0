Return-Path: <linux-arm-msm+bounces-96178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DQ2FXyXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 085782367C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C610030185FA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B62E37F8BD;
	Mon,  9 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdJ0jIab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfknxrKU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F737F8C2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049708; cv=none; b=U402AxPMD4cpvzuu9nnGsr+L2OSaAumB0bBIufUYjqIr0d331jazfXjK+1tgwcy4RIsfKMbVNMzMpdjT7x0/11NdUmntJap2NQGldcNoddOyIo6pAnSJYQae30u2gd8BmLNWJbor/M6f6gC0+FoMMG0KRgC6FEyRoYutnhWV7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049708; c=relaxed/simple;
	bh=cfmc1VLxOy3etVkZ/MkjeByju832awJF6a/lCbGf8bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmGz5NDERGqcvJ/bI15wEiWrHdXcw9BOWFjx74pULx31Bcc7rjdGaO5/FzofRy71ZWiZXB9Ni14ESwhL5rN3XJHMnkKhCZVnnGz1sV9Li8C3wG70NlmzhfO/RtTG9oqlk/2Bsei/QeK0GN7R9JLlPPI9rq75Bc1RdBYSs4Lh8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdJ0jIab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfknxrKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298UXns3466070
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=; b=TdJ0jIabWVqA6Qhf
	ZhNAid9muT4UGDFoFgXZfFb3mQRfqza800NOCD8j5T8Exh8iffBDy2ot41ZKrsPw
	jkFYkcYZtKFL74CiZvjdY62jLU/qwmu38OasR5PEepENC9nm220N7hapgJkN3DL0
	B4SbyxvGxUrcmn2gZBVAEbFNWVAb5rRaVODBE0g9Iq4Hm/OCSzbuFcx5IbzVEAXa
	6C3mfTFuTrnIeraf3Mnw+sJstpm8b0OmHrlXF4CyW5crZZAjuaRZ6akQL5VMsfAG
	IC7cDtfTjWBleV6Y5d7sS9eCqfJSHYmP0y2614ycvywYRIXmLtRq8s5mS/fjBGM7
	MOdHbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8cs4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso65132067a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049702; x=1773654502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=;
        b=QfknxrKUZut34v90jdPITBAx/SXDPT597HyHTu7E+PupgkmZdDnkP34G/OmtThM9Gj
         J56yBHR9jop+8ez2QHeRCb/+K/tyhnynSKrN7bwO9G6retYaF/wnGwfg6d85xhNBgTvB
         PfUDpnrc5jU+GpF4zZ+SoO9lC4HhI7Q50uUOlS5k9TfJw2i9mgLX43efjHBcRHMcA+Tk
         A81b4kwvG1nJqW33eSeq325tmEAFFhq8oKatL6m32liSUFG8C4JU/DKOHetYgrL/FDEh
         dzohUyK276gx9oLF2u3KJp91Rc0nPcRdfipuZ1IfTUDNyNDgvOplBNXEp3lGIqSrSJmX
         5FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049702; x=1773654502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=;
        b=o/y4mqM12CYN6dnARwgfoflRob7s2d0IlS4kc0PJicmXwzM482rRstxqVBnXfDZYdw
         qeM7qdNAYlodS0fAYJLmeWV4oRU+IXUweuPtqcDY73Wc/ki6cVLYcGOPQ05wUqHr8WZK
         FwU304FlQqfzrOEIMwxeH8Q6IL3OMtcEHO/6O1ousWWoEeJ0bUIooRyN0mFlht6t1J3U
         aUf+GCUM9X+f1jOerDtZKdM5hfAhf6Aa1UeChYfMImJs2v+m4jna9ablyKOSVwZYBaJh
         Td62g1K8JMA4CeASz4jWEzykZ9sp4E4QJ6EqkcMCffllh4gEp3MtruLdoME38j6leoNL
         ChXA==
X-Forwarded-Encrypted: i=1; AJvYcCU6wZLQuQcQy3ztfy5fS+OR1cTFihqmFsoGq8hT2lIqv1M5eo1rWyEc+yTm4q9L8+YjH2xMCWU/XN4vn7UE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd8HxGK/SPx9kL6Lvl0/csNabS2nq64C0ioRXaR3xuZ61J1xeS
	iaEvWI0QM392TwtJXT6o8XjG5G9NjK0+P/2geVVdaxH4JQ/24RZh93E2bkcpO/ELXwfUzoY5b9m
	Bk3QqGaB5hpretFfkmPSxjObXpATn1S7SvzmtPpqDdlBfkAdJEtQcXag896Zs1B+4mQ6/4Jd2aN
	O/1dQ=
X-Gm-Gg: ATEYQzxVK3ZwpuBwVxxb2eHNMAsBpt/+lZ+egzdqEmIPUgXxXzY5s2jZZqg+W+O/1fB
	3GjdjqyEqGG8Btkqdx8wkxZ8sOHbaz3rXYyusD54WmX/gsYEJcPiUqFPEyi5WL3bvVSOriAHk0z
	DTQcl/sJX6CaCC0ZGJtPUvyGY35Uj9IZg/ii/okjGnAqf5vm28vx3KGZZPc88lkJKFmBEaK/DpR
	SvpoXjFJL/5M+k3VLUYx+evDWBHoheOD1WHZ6adgWjjC8F5lgADM456YTr/VU1I+wfVYxo9e6IL
	Wsimtxya30LMHFh+xTDJa9ntXVo1c/d2tgP7KgcdftiIusHbWBzLPcHLtCUdp5Ohl31zxNeHjYJ
	kOq0q99f+kuD+qeZj2XVmG3ycZvkjDbfWbdQa4vWJju9JpExkIk2swGcz51rqObNgie7FG0++qT
	toFOYvPlcu
X-Received: by 2002:a17:903:2c50:b0:2ad:4265:bfab with SMTP id d9443c01a7336-2ae82367abfmr95444565ad.5.1773049701586;
        Mon, 09 Mar 2026 02:48:21 -0700 (PDT)
X-Received: by 2002:a17:903:2c50:b0:2ad:4265:bfab with SMTP id d9443c01a7336-2ae82367abfmr95444295ad.5.1773049701114;
        Mon, 09 Mar 2026 02:48:21 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:41 +0800
Subject: [PATCH v14 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=6057;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cfmc1VLxOy3etVkZ/MkjeByju832awJF6a/lCbGf8bM=;
 b=p9HlbDiLRYUetMVKeBUUGiPvA5RXjctin3mI94zp9naMCYnHV1bF4jaYxPMEFztVftCOEWJUC
 TSVrIhT+X9EC/Q/AaSaaRYoEq7cNkMBB9f78Lb1cjLIN0Wi5o5NJK9F
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: YJLoBW_eRvf_fQCNWlDUMRl7czdXDAHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX/YdB+XgbxxBx
 Bbj6SkqRqDoQswrEHyoEB3Oyh51t1PmbWWzT+utuRafx9cFpKR8ScZEpmF3/oN/0rIjwHXbNQHQ
 kcO2AXOFTeHSH3VjQ4kPp42BWwEpD2uv9HbEAKr6//K+TPBZtcmDuycXtjQxOy/Nm/t9wFu/thl
 UvuX9rsMpO4hP9zgXfxrPfWgAfN6RBoPJdd0VUtaqUVd/ysHQIMt2ZnY1q9ncZVleNC97kksSPb
 9rDSC8IpIuURZi1zDIqHNAPD/rn99U6k0aqhNmdYbA7ZXpcaY97fO+blyvw5AZADIR3Ilcp/OJK
 yF6WzA5tuYhbnHwJ3SpBQVWiHZ1f0km/HDa3uPwPlCSWkd2a006dfRJM6ndSLb9tBwRKBsvZzkZ
 p1SWdWlg5e8tt1Vr/NcDFCleVrplcwfTjF4N0OxMnB8NNuLgOo5fV5KXH9EorRo48JGnMuFFsdY
 2f1keyTLNeUwbD+5MEQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae9766 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pN8Znu5onTEf3dnVCfUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YJLoBW_eRvf_fQCNWlDUMRl7czdXDAHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: 085782367C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96178-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
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
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++
 3 files changed, 112 insertions(+)

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
index 4dc1defe27a5..15c0874ff641 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
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
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
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
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
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
index 319a354ede9f..5ac07e8dd5ff 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
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


