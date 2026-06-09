Return-Path: <linux-arm-msm+bounces-111989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dn5BI+lmJ2oGwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 03:05:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D044265B877
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 03:05:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D0lGOsww;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KM7jRTgB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111989-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111989-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 455CE3040A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 01:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0B82D73BD;
	Tue,  9 Jun 2026 01:01:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E101EED8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 01:01:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966866; cv=none; b=iYhfk/rbSn92Hv1/utKyiH+7JZGD4mN0wUBU2++57t58oJP4nfCwRbK4adU4yp891/GAAvE7w5qwoduya1P+OfQDDpYEyncE8obGLEBkpkrI+GyjxUXrG6wVUaq9FiWURcepzvH6UL2yPkrtsWfZo+y1H5ImimG9cxfievQXSXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966866; c=relaxed/simple;
	bh=k3kCfnXysJjxusDs4PdJEamjN8KqEC0eQhWZW1aFZ40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ua+qOdaYwwo3ZeSlp10AYNDE6BJuhwX8iXCgdDR33d0vJw+2NqbajbnAiuMMSSTCPDOthizGNavzCwVO/AnuR7Rz/jXLxIi0FIgAoGvlBgWri3eVQjS3REkYdUWtnIwk5iz/NOREwRRPg91D5TE6r9fNbkMYurDD251GMj8UXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0lGOsww; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KM7jRTgB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6590s0QI1110453
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 01:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qK4HFUQOu39pCkyfl1uuyp
	/oH4qDv8gzAIyT5dTsDBU=; b=D0lGOsww1hpI5UpN6fG2DVqJtruIU2fIKneWHT
	EEKtk0ULf22tae7GnuH2Xe9akL0Rmoo6zkF0FhrEYlQOi8VT20Q75qERcNpa+gj5
	wTwKzYnyb+cVWBQs75QgppZ3k8ToKP9UfYcNbfEfOEgsbY9b2VZ/MVqcu4sISWLC
	KXZ9AH5yFbmPh3GIEiiggwIriRQEDy8iaI1ZQzxAOaZIJ/s3r4ua8ZJij1UlLudu
	XKIh/Ypzg9InifwvmY2e1rJNoG/3hzSIbTeP11BWAA6C6V9nDyexidy3Lmy4e4f1
	8pd/1zRmoTyXMFVAJKYLtnc3dquV1RW+HWSZwgUvS6dM8IaQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvb6r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:01:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304e4636205so12254975eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 18:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780966863; x=1781571663; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qK4HFUQOu39pCkyfl1uuyp/oH4qDv8gzAIyT5dTsDBU=;
        b=KM7jRTgBfYVUVmDW9ViU8OXvY1aJcpmeoxyjbcpCb23BtmfeVAPG7T3hdLeQxW3Zbo
         jPE/urUQpuyMo6coGJauhOvtx6pVr0v7EhGffKtc2g+pTJc5VuFhVTl087VszziEvxlL
         8+Cnk1pqSgdZTwnfazIy3+cwtcuYeklXomPANgqI0jstGkdr04Xqd3wQB1sGewsS3VFg
         76jkhCowjiHv89kQntQFy/WqvrpTWn1PADROcNt28vaBfKwZeUXeoUCljgMqOU9YbV+k
         Gx03WG3wlWw2dxYjlPNvNHtMSlDS90hxnjQOjtPCWD7YRTmEFuVzIMbyhl04lMydZUPs
         wWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780966864; x=1781571664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK4HFUQOu39pCkyfl1uuyp/oH4qDv8gzAIyT5dTsDBU=;
        b=QdR09Yu5s0sooFeSYlN1ChK6SqkHsvPIcD5PySb3VQvzq2x58T9QspY7cPHEb2PZYu
         VxX5dNR2Q1kJKTm/boZfJKO5JLw6ub+Ij/MWVnTLv5aQrjlqO/nF5v3XfpgGKtpRQXCP
         qTP+TLkh4603pDRrkFpxQXQlgGcrZo6CtkqvkGdjgDQzHM7kwRgDnHL3OF5TKjxnJXuZ
         HRzTO4OU6eqNA/Pc5F0fAc40q6jHtBAtU22fN1U9SrqduqW1A5gdXqhlpix7QAj+3iUF
         ghm2fXV2gwo3dRLb9NK/pc6pBO+Q6KnvHQzlWkPO7U1MY8dTYtAHs3cLHCSLnrG9Xi5j
         kAAg==
X-Gm-Message-State: AOJu0YyVFc8cYbKsjuVQ+4RWFHbE6TJLih363i2rxRR5xycFn0GBRB8m
	tA+H73MiXQQr0PTT8DsJQ/ctZkzcjOYVq8IgvPwAFD9HVAq/H8cC/74eqdjC02ShDUDj0qTj40U
	9yBzxilHsFIau7mBddlDz9XoRQVX4JIGWFtcJv+PyGudKHHTjLToO9Kwt8ekz8aSe9hHm
X-Gm-Gg: Acq92OHByliWa07hBHFOFBO7+sgwW9FT8O5kJwmfgvok/xZbQLsTCT09hrxbAJ/6gN5
	XBCFN2DjA0i3WaM3zIPDDaJQy4m+Yf8PpJwtxAX4Vikm0lz9/owjM0Ct62O9XJQHiuIoWvgUo+I
	EpLlxCTnAkwf7YF6smPZ2OcBJ1qog8nNippxO7JaOmNX9tv2TyVRLv4ER2BWp2uryZGi/d6pJfk
	NY25/qT8USdFGLeoNNDVrYikM8Yb+xqqd2CjFygMYy7jIvg7EfssnTCJWLQbF7bbxop0f+rCCyJ
	28vNpTc0HLMnF/EM0zN2MTM5zabQSJIHF4KfBCkRPO5j0eujZSPLyAGrdJPlHhdRClwvoAKZ5/S
	AOgc+nSjIOyFybkjMHPXJJtJiqtKdiW7UUCpuYnWgB2g47fsQgQUspZe1nFVLJhdAlvqZQK4RY7
	DXIY8cZrgG
X-Received: by 2002:a05:7301:9e41:b0:304:d456:fca4 with SMTP id 5a478bee46e88-3077b1de05cmr9496718eec.21.1780966863446;
        Mon, 08 Jun 2026 18:01:03 -0700 (PDT)
X-Received: by 2002:a05:7301:9e41:b0:304:d456:fca4 with SMTP id 5a478bee46e88-3077b1de05cmr9496656eec.21.1780966862801;
        Mon, 08 Jun 2026 18:01:02 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm20011238eec.26.2026.06.08.18.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:01:02 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:00:59 -0700
Subject: [PATCH v3] spmi: pmic-arb: return 0 in
 spmi_pmic_arb_register_buses() on success
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-spmi-bus-register-fix-v3-1-7fbcc65b2929@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMplJ2oC/4WNzQrCMBCEX6XkbEpNamg8+R7iIWk2bcT+mG2DU
 vruJvXiQZGFhRlmvlkIgneA5JgtxENw6IY+Cr7LSN2qvgHqTNSEFUwUoigpjp2jekbqoXE4gaf
 WPaixRstS24qXQGJ39BDtjXu+vDXO+gr1lGAp0cby4J/bcNin3L+NsKfxuFDGqIoryU4DYn6f1
 a0eui6Pj6SpwD5hh18wFmGaS1HqQnIL8gtsXdcXUPcaVyABAAA=
X-Change-ID: 20260604-spmi-bus-register-fix-dfdb94bf834e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780966862; l=1283;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=k3kCfnXysJjxusDs4PdJEamjN8KqEC0eQhWZW1aFZ40=;
 b=wM1Vbbh0+GhyrEhM+ZifR6m8FySX6R1MZ7TuaCjqH+JMcRvqRc8NRVBT6wDaDBYPGCab4P8S7
 kWoQ2ExNx8WA3b+kbDAOMU9sgv79thAAFcVFLmi6ePpFljEVgMQJ1tM
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: U-QjK0yWWlW_oEVPl271wTrEa48mrKT0
X-Proofpoint-ORIG-GUID: U-QjK0yWWlW_oEVPl271wTrEa48mrKT0
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2765d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=B7dErckuDygrV3OWHfYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAwNiBTYWx0ZWRfXxqAj6AI38rIe
 rvuqUIWKJCbH8E/GT/Do3Fgv8M6LxaV33g82CzOYKI7VdwhU8yMx1fDZG1Gt8NuAFhSbsBGn6kV
 FiWcE56tItyRG5YtGE3/d1JfHYrpc2cuCBl1Gg/THj8XBlcIZPZb65TewoHOvNUmTHoWkQpksT/
 eGXE318awdim2m9YuzQkiD4GJy07myHiONXC8FNnU6Z73VErRY8OaTV7U00cbfmjjN+XF/NWHi8
 TyL4hUZzuCkuHikTm3S03eKDji4aGQ2+tO3CPE+SzXhfUbc+rGKV7F1GkzUkR/odwUSC1GbbihJ
 AIhwskr0UplyrenGNkLL2MeuLfnNdiFzXDiQBeWWZ18Y+aIolhgnPz8SAwNEEBoBzhM8l/VGmE5
 LZXaHiqWeJ/huuknA/PjysrVZFFXlc0w1J4Xw3joeOsgdjWEQfCQNh1ZMMNANgJmDK7jjDFZDsX
 uLS/81kszyhzWYfDjiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D044265B877

The "ret" could be returned with an uninitialized value. Fix it.

Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:
- change to return 0 directly on the success
- Link to v2: https://patch.msgid.link/20260605-spmi-bus-register-fix-v2-1-b3964b093fe9@oss.qualcomm.com

Changes in v2:
- Drop "of_node_put(child)" fix as it has been fixed by updated to use "for_each_available_child_of_node_scoped"
- Link to v1: https://patch.msgid.link/20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com
---
 drivers/spmi/spmi-pmic-arb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 2e2cb4774103..402ffeaff8e2 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -2060,7 +2060,7 @@ static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


