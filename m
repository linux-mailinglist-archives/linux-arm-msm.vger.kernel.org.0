Return-Path: <linux-arm-msm+bounces-91543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFV4LSHqgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:17:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A35D00A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7778C30CAC5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5155738E11F;
	Mon,  2 Feb 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5xcBR0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbIbmerr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE44538BF95
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055835; cv=none; b=VNXF/c/41mCEPbV3sR9LmCGmwoCdTPHthf8+is3ELxI20lZd0UsBOaH8ZKsjCJd2ie2YU20jKNs2Z5WCbUNZzuP6iqedD8B6djruA9I11oOfwgTtXjfe+LXYDwOrHPRXo5WmnxV2Sg4V57mKKvtBF5D3wi5s5LkEXOiNsS2nd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055835; c=relaxed/simple;
	bh=u7ew6qh+piNDH+u5pZnf9q5xI6HsyRCZPq8Bi7+YzDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r5m7CQBLywTyysyRH1/X/dbu/b+hw0sceA6UaQiSlgeV8aTbgJVVNzmD7jwVMBtk1L4rghbEOKFWFQBGqKPl8UUWZP3pEP/QeGVY80tvbnTc2ITmsJiX8mCHcXHTHN3gBu8/FvYIC2+R7yMBc4+fsAK+X9O0eK0Sx0IwDPOK/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5xcBR0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbIbmerr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5Qko3459139
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+hhRIcP4ObJ
	nfpPZ+yGg/UX1gYqSYL8XEGYmg5LvFnk=; b=O5xcBR0wAjBp3Dgl7D/JTcx3+Tu
	8jQYYV7X4fhmhLqXdmGRQaIuEpaEe9ocqNvRaqJMISDYrfiVdd9Q0Wo3hsVYKdRk
	FzMVtBb2JWLjRKUVaJYceBX3Xz96tZUwm12TWGCK8BRL0JLHnNC7fvhO5l8DbI47
	z6uadSfP/u3fOnJ8CwmGaQL66S2i1LljdlouXYlFzC/ObBPwxHxjpZqXhklsd0Hk
	9ENcu6cg+AQCTeMrhrEi37cahB1RQUSIv4Mz1bh/d1lC6yhXAhn9MsTSHZRnQQwl
	ts64cmYa2zYIfp7lFGJ0B2WYaOkDSUr9Yx2Ft74xyf98Mj9gkcbI/nGYA9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbh9hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a76b0673dcso47808785ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055832; x=1770660632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hhRIcP4ObJnfpPZ+yGg/UX1gYqSYL8XEGYmg5LvFnk=;
        b=jbIbmerrBbi16cpRk13QpzHFpjIe7weE/s7UBHheUFC4Zm0H3dvH3oKvimjArmzwm5
         eYt0uo97wbZ34/6GU/1B1I6QVSLKyVciH/wusW6aiMxfhn4B/bCp4a9xE4fcAOv2zuWF
         eQwOgffdcc7u/Uzq3/TUNZJYtdS7O6Gsg0tDsUTbxs/B9mVwHeoXlj0+E2s+9nYg4qY5
         hpF24zDxIqgGOSkjljq4fpoAD+i4hZqzkQjgqsnqQ6XBWrpnFJMthO1nR0lSQ8OTqaBz
         rB/1ms8R8sEbyTa7+k6DTvRwV0p+JWPIRwcfeyW3Xnm9SrNRFXLX0XlxCkvxr2nw3ClT
         swlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055832; x=1770660632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hhRIcP4ObJnfpPZ+yGg/UX1gYqSYL8XEGYmg5LvFnk=;
        b=J8pQ+Qi2fEjl80DEI9lbK9GYqXI0DKmLfAX/ovBjSUaBg/c4Pvi5pgblslWmcLdOpg
         /tCg7Jt8P26/uA+omoyjwO3Q3XdDZRWil4VWSegKz9E+F/WRFF1E7SZ6qoRT/g9uztXs
         OnZ5+Y5loohrHxKLCG8M1nuwgoLbhacG0CcTBqHqelbPV6C0oGFeC4pfYka6KUVUCl0v
         sMCrfriGs4TKD7/Xwv03lJMyG+dBO8IixMSCvriddYxtyL6utf/MdFUH11vA0BBzRv9U
         Un4u3W9p02Ixn4Dj7tSyem7XyARmeWRRq0mwh4GPgy5SWZCo/w9JO2dJokU/rAuM0tGv
         89sA==
X-Forwarded-Encrypted: i=1; AJvYcCViGMSfLWzPBq39MRa9xjB0nURqP3gRVPlnzPgrKe5JADagECUFWbA9Ieu4rDSM70Xr3ne6PhxE+nwfo0fL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FZf8eyf+PFML44GDgtfg1xzIbSteHf1PCh6shje1/Z/+RfIy
	rr2HF8DcC7po6d3GoxHR6bBB2s2lr22lwNGXt+lXpvOmhrjVv2sLcV87FJrB3niZAgG+1/dDp6x
	OgWM63oaZcH+qvVrYf3/ktSzDYRpFGCLqyxtpSwETCuVRrZPSQrZlm12jBkGW/CqzdLmt
X-Gm-Gg: AZuq6aLsg8OUk+HE3t/MPPqkuHJ1KEWcQRwtdB8RP+y/Utzr8uSlJC5Eg5hwrfA/Lqz
	vXnYeGzP1O07gqJm7FxfhgPP89IRwqvFzJwHBbudnzuUErd+ofvVXRByacIsEOgHLLIQmftHp3z
	f6AN7iL+soA06LGCmLUh1wMXYC5iWImcxdiBsMoAIuylJ00jGuiq9eApauUB5GNubXqHndbyVVf
	EE6zEvbULXKBg1XFNe6aO+a0aH4FNxjx506XkGDWzX4Bt1Tupk8J8NKW3XHLf63QVshJpCSaXP5
	/rvhFji3yKEGDaKH83uaWLEG4lph5yUurZ+h4iFRSUG9eJ8Jz5P2W33Ve/s4jH+ZOe1rd4WgH4q
	67kajEj1Sa7nRxzuaX2GTRaQ52wNhiAu5zsxK3AR1HjY=
X-Received: by 2002:a17:903:2c04:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-2a8d7eaadd2mr123035345ad.12.1770055831480;
        Mon, 02 Feb 2026 10:10:31 -0800 (PST)
X-Received: by 2002:a17:903:2c04:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-2a8d7eaadd2mr123033035ad.12.1770055827918;
        Mon, 02 Feb 2026 10:10:27 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:27 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 07/13] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Mon,  2 Feb 2026 23:39:16 +0530
Message-Id: <20260202180922.1692428-8-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uobZUY1T-k2C3-bPbOGc7aCVF2xua9UT
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980e898 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NwCh5GMA9Nt760FYQHkA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uobZUY1T-k2C3-bPbOGc7aCVF2xua9UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX96j5xrJPMOB+
 lLbkgUgi9foayZz0jC0YT/en3JHh3HNdvBLqJ8RvcCJK+9RNyqet6p9pRN5aDzXrUadz7z3czVM
 N2X44DA0aROiQn+AcZ64mi0Og7AqHggoctxM0xbT4KrG0pRCw3P2wXZoVQ/Je/KkPw7EFC7fDtY
 leg0asmeC+HOWrCOhMOhvumhTJzd2XCnjR64dTcoPSZMVL9lJhBBwf6ZeLGgMtQhDeBR9d/DsNy
 /ba9uBLPoys19KIAgEjx1PIodhriGYzjopVU3ibjGteBCFq6gxU04AnuanQ8aVCIuqj+uHctzz0
 yXoAKPmfQEUxgfMu9wSZWTltrFdLaCmu5dZWkEdT+vZAWniicgwPWHG/MWY4Iq0w+fg36Yv0U7T
 CkuL3VQrY5NPzG7+FsRiHTN1i2+KrdCXIIn+TWJTKnwjzUlR0gkg90GodIwV6bGZdUm/HNJMxON
 yNv+TIAZLQ7xqhdNC8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91543-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23A35D00A0
X-Rspamd-Action: no action

The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
manage performance levels and operating points directly. This resulting
in code duplication across drivers. such as configuring a specific level
or find and apply an OPP based on a clock frequency.

Introduce two new helper APIs, geni_se_set_perf_level() and
geni_se_set_perf_opp(), addresses this issue by providing a streamlined
method for the GENI Serial Engine (SE) drivers to find and set the OPP
based on the desired performance level, thereby eliminating redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 50 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index d80ae6c36582..2241d1487031 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -282,6 +282,12 @@ struct se_fw_hdr {
 #define geni_setbits32(_addr, _v) writel(readl(_addr) |  (_v), _addr)
 #define geni_clrbits32(_addr, _v) writel(readl(_addr) & ~(_v), _addr)
 
+enum domain_idx {
+	DOMAIN_IDX_POWER,
+	DOMAIN_IDX_PERF,
+	DOMAIN_IDX_MAX
+};
+
 /**
  * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
  * @se:	Pointer to the corresponding serial engine.
@@ -1093,6 +1099,50 @@ int geni_se_resources_activate(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_activate);
 
+/**
+ * geni_se_set_perf_level() - Set performance level for GENI SE.
+ * @se: Pointer to the struct geni_se instance.
+ * @level: The desired performance level.
+ *
+ * Sets the performance level by directly calling dev_pm_opp_set_level
+ * on the performance device associated with the SE.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
+{
+	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
+
+/**
+ * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
+ * @se: Pointer to the struct geni_se instance.
+ * @clk_freq: The requested clock frequency.
+ *
+ * Finds the nearest operating performance point (OPP) for the given
+ * clock frequency and applies it to the SE's performance device.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
+{
+	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &clk_freq);
+	if (IS_ERR(opp)) {
+		dev_err(se->dev, "failed to find opp for freq %lu\n", clk_freq);
+		return PTR_ERR(opp);
+	}
+
+	ret = dev_pm_opp_set_opp(perf_dev, opp);
+	dev_pm_opp_put(opp);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 5f75159c5531..c5e6ab85df09 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -550,5 +550,9 @@ int geni_se_resources_deactivate(struct geni_se *se);
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 
 int geni_se_domain_attach(struct geni_se *se);
+
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
+
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
 #endif
 #endif
-- 
2.34.1


