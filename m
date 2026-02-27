Return-Path: <linux-arm-msm+bounces-94499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNrAGFvZoWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:50:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B71BBA0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 834993018295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B2E348479;
	Fri, 27 Feb 2026 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMJl7JH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVPGfLgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC368348880
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214450; cv=none; b=jfZg4sohyddS6R6V5jvqHFqi2/3sROkW3Melgww1ZDe1OUmT59yeqGLBk7f2PXl9JEWm0PlyoiUCV3hHM4hjRB1Vbhg1IlSuOFQ472iVIZfWoxVhh4rR+sblqG1l8ni6hslOBADSK5I6rzZQlZyKeQGLpTtpbfFUWPbfa3vl8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214450; c=relaxed/simple;
	bh=FhzDkoWPT2mloQcX8uWNOipC7BClHTaTapJNp+e/SXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JwxlTUJh0VrekFqC28NzggBVsrPwymnAWUNz5n8xYx3s/+ll9LmmdmXmi7MvL0qr7qmODtnNuKM8aFwpjwrwklPQNmjHO9tPccEaIvyYh5JUSg3QJSep31XM2bBn07MFQ3BVo92qBh6J4nuTV4LzjhpN04YyFAK7iPshteF72wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMJl7JH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVPGfLgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0KXG2167858
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZBZj4NdTrytE8Hgm95ldu3
	CSuXdWecXfZnLb7l5lbeE=; b=RMJl7JH9n5wZ8MohaR0ktAdpXuYF+o2Cgqcc62
	s/x5t9kPbcUFs7p1dgil8yvfg94+2M+zAXdIzQmTPu0aar/7VFZ1OKiqVDaa8wr7
	PIg6V27+NnXkEW5wUCchkXALVlz0OdnZiG/rootBbQjFmy+mpnzBNBAxVY+Eyude
	zjNioGlEbvFUpbmNW4EegU1MrhDtDXvytS489OzLXtK7rYTL7QrIFd1HmMIhJyCT
	VwEM7d/Fcf0xGQtWgF4wVTJT+7f3w3VsYA1bGyGk2NbODqf24egKNAEYE16Zt7jd
	Civyy2laBBkaREVLTNyx9sdFMpqxihDxBE5Fa0O6ft2Jpz8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xukeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:47:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso2081175285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772214447; x=1772819247; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBZj4NdTrytE8Hgm95ldu3CSuXdWecXfZnLb7l5lbeE=;
        b=ZVPGfLgRVUy8NcHV2w+5gHpBIFxlHMgx+FM94qXyBjGiQRJ07cHRE5cGVpCW1shw/o
         oS9LpgxHj2nWx6YzvfFhTuZoDvyiJ7JR0CJ8iq4zyn1fKSu5b4MzCwB9BNO2XmOhDWQp
         d+zoYRYRth3NqoLzqnC3/Y+Bkzk88s6+GL8E9LwmvhlVS5O5qmBEuVZQS/P+v6bLsKbO
         LPu/CILWsHIBjYd5p5DHUQERe5Bj5If4hSLK9v++wdLm8c3u8l/fkgwFuhIbcXx6n9s5
         fOMxQwo624JCBz5DsWFILxXnpbY8kQJPg2VXtgrpwOv98nzQv1fpgNPIE8QpAN3ml1PG
         3hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772214447; x=1772819247;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBZj4NdTrytE8Hgm95ldu3CSuXdWecXfZnLb7l5lbeE=;
        b=j6LEryRR2jp5EPt/XLcwu+c6q5O4/meo+OrarPOoEA5kpMLNsntS95Tm5eWyBuSoig
         ufp3vdbho0o1azGtYeVUmSYfA1SKjlCeCPVR96FPfzTvqA3SpEdS1bWmdWDU4ELLCRZ2
         wCCZi3tU2CmrfudonlsWo/YpnCAV+zNr8EIRGnXaiv+W563wITtbXZ/IcFkXHJJULg+9
         pQ5brJabEfsarRiJ8ZV+eI1BQuxs3DuFz98RyCEK8qM1EkEsH4WMccH9aOxfbR5nifoq
         YhufKlc+1iDANuk+QmYxANRJ1U/WeTclKl/Qr3FncLtKuUPNhbTWbyl5ksNp6M39Q91o
         /7EQ==
X-Gm-Message-State: AOJu0YzafeU5u/ZQnzRPmHx4+QHyfYqSu2XLIKUsQCOsoJxF+ezbPm+E
	noui5gUPURNA/HiboJ+if80IvISv8goQE0F3wBuxWLUIl0YQJEDQfTTy4DBePy+sCjq7t5u1yg5
	qDsWEfIh7RgCsC4NstbZTFyoRSdwXN9kFkuWltaVoRQmqQwYblPesnJ558tt/FWdB1I+3
X-Gm-Gg: ATEYQzz22LYItrYZdZWYNaEzrA3TDh6/tE5HPJF+lSVOqjjXfBg1abNpkfHJpTbKp3T
	QdNl6+V1wy4OkLPJLCA1ofbSqIhwnfB9v9znWXVtmwESJYVBIz0d1pYxexOU0ynXWw7PtMPbQ47
	FtapApznrGE8EF+ruo1TOaNmw5dpzX4LmovxxmUHIxx3FZ5dnxl3DyVTDXhGzLO1yRgOomcDE9S
	59rUbPmgdQ/lDOpJUDzI4g+lwU0wEKZmuuK3ygxPOyLI3i/kJkChV/C7prLVY8Dod8HYXb1wLHl
	ALgUZE8mDJ+pePWl2Vveq9SqZGXDkvV6TkB0iExF/DIw9Odw0KXVlG1sCcPSqHEQhjaS1PkICAM
	R1YH93nAu4b+eFSQVPLrO1rdXQYS9eA==
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr450030285a.58.1772214446829;
        Fri, 27 Feb 2026 09:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr450025885a.58.1772214446223;
        Fri, 27 Feb 2026 09:47:26 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm238078895e9.7.2026.02.27.09.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:47:25 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:47:14 +0200
Subject: [PATCH] phy: qualcomm: m31-eusb2: Make USB repeater optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKHYoWkC/yXNMQ7CMAxA0atUnrGUuFAQV0EMqTE0QJrgpAhU9
 e4EGN/y/wxZ1EuGfTODytNnH8cKu2qABzdeBP2pGshQZ4i2mIY3PjgGDK1FmXJPGNxNUCWJK6I
 YU6kNd8eOLO/Ysmk3a6i9pHL2r9/rcPw7T/1VuHwHsCwfSvIdEo0AAAA=
X-Change-ID: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fct6BCJIWqovNkFale/9w8GPVmsqmYXW9/uA9H2fiIA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpodijICIqiWs0ntgO4PHv47ox3IwrtvU7BDEeb
 9hEPt8MaeSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaHYowAKCRAbX0TJAJUV
 VmNcD/493kLQl6k+518jvBRhwQsAh4LMUKjo7RzfgtNyjQgS/QVQW0jLzGWVj+eICsdfdSlCDpo
 /FCJFZ3OqkL+BNUuApPVi8sMHEYL5cFwOhv9PcNF0C5qUGHK2oMHctKl+bkvNhmn8TjfnmpmQT/
 LkZM8X4qIhjyITv68HXh8oh+RAG4jeVWHkpsncwHkKUKzLA6ikiJNFXXr3Ez5hAK2YmLM17DHKj
 8vpxwIrPqHsEUFpY9k0q8gDnkaoWxduZiiHMmtQ5NHCB4C/fZDkuBjVE5eheyuzSmVHjDPdbneV
 5aVgmbU0aP4O41kJNMADf6sXl+wBp7WOLS22PEOJmem1iAS3VEBoYkvb0PKOwH0a9lDPycEqNth
 YDKGyFcvvky4HZ8PoLCor1vroThpUakPL8TDluK0KSH8zbGA+I210ImsliBqmbFCN2lriAcHB0M
 6temG2pWKgS+xj/h/H5sfnjSQHpu1IjuxSVRLSE/cP8EEG2QkU8VssTJtz9SBut1cW6epoE5mnO
 hEmQR5Xj+KMzmMK9rbPj2/PV7oZkrrWvtmLCXDbKfTHUmAdFiN1ErqXVem9XRqfwFwenujTja4r
 9YOoIKvQBDYPf/qHUM2rLPcFmXsXGDThjBM4VYqoCvSJpt52CBYPcqm71qN0/HFFhLLGqsMOHUW
 ecK4iDQ+QiXIDCQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: bp8LOHLrDWN6M-V6gjOUm3l5n4WNX8ck
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a1d8b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-yzJJKm8KVfH7sqCjyEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1NyBTYWx0ZWRfX44y+A2fv1zTb
 VC10ynvw6GwVkzey3GzLVBT9gN/ZriXZbqDg4SbFuZat/qSOm37Ji/lrkejHgkOMrMaOVeS7Qlq
 oQl1stxW6B1umf6mSdHQTkV0JXqphgo6ibkAEXgLC2N+BlSHba1Tz2/H5r/hIo900gBn6R3Wdw0
 2ticjsfqy7aRHmJcOPrOi8APvgt4pf/VDQtwkhgpBaFhuOfH/0Bcfr1Q6wpMx5jJrNncgZVyvub
 J65gLNDytnYDe5GVjRdTm8S4F4mJCle9nmp1nEFGhspfuQGAyn2kZ57leU3IpPiUh5RnQBxyLNt
 eEvQTP8ECVHsYUujM8leIXy6aF5qN/9gzL7dww3TIfh8skWfcYMM3E4qLvAt88uDI/3QFmjCrYN
 n3R3Bx9WqyWTO3KG6tzdzkIVqPTjavUYyTDDdHqdj75byZXdOE0tJ1htP+5Z6aPp7o5dyVGVPfH
 q1ui+Z64mPKyMZ/SdmA==
X-Proofpoint-GUID: bp8LOHLrDWN6M-V6gjOUm3l5n4WNX8ck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94499-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B99B71BBA0F
X-Rspamd-Action: no action

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

A repeater is not required for the PHY to function. On systems with
multiple PHY instances connected to a multi-port controller, some PHYs
may be unconnected. All PHYs must still probe successfully even without
attached repeaters, otherwise the controller probe fails.

So make it optional.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
This has been sent initially by Wesley here:
https://lore.kernel.org/all/20250920032108.242643-10-wesley.cheng@oss.qualcomm.com/

This is still needed, but for a different reason, so re-worded the
commit message to reflect why.
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..70a81ab2482f 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(phy->phy, phy);
 
-	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	phy->repeater = devm_phy_optional_get(dev, NULL);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


