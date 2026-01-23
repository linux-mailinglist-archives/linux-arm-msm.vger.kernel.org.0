Return-Path: <linux-arm-msm+bounces-90296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F5BN+0fc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:14:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85971842
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D06C5302086F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78960367F5D;
	Fri, 23 Jan 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V256o5J4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUsxnhOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35E367F3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152417; cv=none; b=fzIhmwtE8lj9ytIxB5IdI6UR7oNE8eSr7cCW8Any+l9eb8HLDrtW+77QMofcyl9Bx2T8apRl8gUgIQ46988K8PtC6o8cyotsofvkPzlS7PilRh5+Sfz9gXgrg2C7jaEP92VpgXfMZh7F9yaqaKPn6SkUZp/0tr2zS2WM16somf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152417; c=relaxed/simple;
	bh=FAydTEuSpolIPbgdCzPABbxgas2Q93+RqfmxMnmHLg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L57CqlV+wb4uIlTM168KK/tsbGWI4OVmuUJ20n5/x1F3nz4aTTinTyp8u1YkOqqYg62UbauC4gUFCrKt3OYrt3TUThNqX/AW9Mmd/m6Fe22gt6bOaA5iPHW+QTTniK5itGrqsbCNySJ/qaDMn6/merf53XNszJKlqE/FywXV1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V256o5J4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUsxnhOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N4L4kB1118874
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFEJqMm3Lu8V6b4IeyfhRQweFSAUcJ6M7eJtDdl84KU=; b=V256o5J4rtn3+PgF
	c8cDmbUnmJnTGKIkqWNS7om+1oR7fMTOOJBGAnUFt+bFn+k1AzFAkALmqr5QME6d
	OOwiYgLFSagAAaWzP1vauMETQOHz2LfbPvr5vQa/tTxUJ+aeRYGpINmggiqRK1bs
	HbEon9Up/Ej8h+p9dTcaYhdYEVWWn6tfPVY/DEqXwS4ENfYsOAyn8s+XNMt1y0+o
	xmE0P/jhI4/oKnNcnYtzDKTWPyi9JdI1H9G/cTyNB0wC/OxkDZh3wdjqUahPjxo+
	0Mw4vD5GPCAlZZ6LdfNTMkQYeRzRvqRefVx7Q1RvhK8bJl1QmZdtA6MucssKhsBy
	p378ow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1cah3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:13:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so17248205ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152412; x=1769757212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFEJqMm3Lu8V6b4IeyfhRQweFSAUcJ6M7eJtDdl84KU=;
        b=GUsxnhOl2aQEM3EDMyQVAy9/MbkjYyYt6QQMd8F0/ram4Nb+sWclmmUlL8kcJZAR2w
         5BHBy1OtPwzQHEiUZteEYb9Z/yeiY3nfZR5P4/EEtPCYKXcKZ/IB+3jlY3HChQ6Q1ArG
         r3ZulT66pHmf5BRzZu8asJKXRmE5vIWskgpUOjPfCrvSGHmEYZig8fXzBYK7gCqytznO
         UrBC8W9FacbpBFbVqxSJaZlA275Lm4EKbnIY22R5632wB3PR3sN1CtrT8Dgif10zUM/o
         mTAjjhPQoqtSxBKxUP0uIu41OuvTK/17YA68RJkGVpHbpu6gFYODlNtcCV1tVq5gGMAQ
         lgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152412; x=1769757212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dFEJqMm3Lu8V6b4IeyfhRQweFSAUcJ6M7eJtDdl84KU=;
        b=Nz1Lshkfh1CQrgCnQ/XVvZNeFN6sVYxt9bdlTlMyYupplVcJ00uCYaFsabXbZFeSSZ
         UVspPfQu6CIn20dfZt4P/FuhAaxNiHaI7XNyr7rArKsGkdU4fkW6YC3tZr7MOqHflGl5
         1zfWMKwoP/bJeGI9y+AjwGO7spybFNM28nbIdA3dvKCBQlibibaNG4qWhfgkuwZx05By
         0dkFE6rIax6PK3OEyFLJHgw6KR6wDopujjEdww0592GMX/YqFmz8r3dXb8eAqjYPM+Ep
         pvX+Gbo7rB/APuodJgr/k3o53O41Aq0Rztkk04EFwcN0qMbRzAjEAlbek/wTziZr8IgL
         X6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ47JK0YbI3BzgJGjJxb6t8imPE+lQVtJEDTc3BsD/jJRnWYjVWRnVfCatIA32WkuyhY8ZzpkktJi0H3ZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeYONdcWahn1843W3JbUpov6lg2G6zqXSZ5X4fuC0PST3CSq4
	BXjWwl/4ohjzPRNzrc022A9Dz11+FNZF+wNKxPUkd+VFCTT+gRLtk+90EhpQz6FJ9T1prsTTsTm
	BCTiCSzjekd+zstF2TIlZOcAfPOP7gUl8YP7qHE9B5oKjVPeCrXB64wOVzZdO2H3QK8Ui
X-Gm-Gg: AZuq6aIE/mZ1k32GFaUHReqPE2yi1VNjaNUqB+ka8DkbHQWFmqz214LFrsMlQQOj5t+
	EXeLeBUKdbyyd/4/71et+F4GMBdR9m2o9Bvyug3nGz/xIpgCoD1mptSb3u98OTUN8I0RpgTEYs5
	i/3E12s/UEP1gKSdS/pBtgxxRb9SFyZLIJuGeowsX/jb2nSoZr+FdjWwJMgnbqVgE5Wby8W2C32
	1gfLsd+nhwi+HhXuc+PgYkRkc2mLte2nucuxP4I7f63TkT65LES24Y4IvDlpbF+r4xqzfoFKZnD
	4DqUNld00O3AeX6YmFmYV+ajrV/JgWKF+WxkAdx60lFJuqN65BWC+9dYJfTengH8VKSgp/TCoej
	km4Z9LUCnkm2ERr4CJjrUARWBuOVzUQavWIY=
X-Received: by 2002:a17:903:1c8:b0:2a0:cb8d:2edc with SMTP id d9443c01a7336-2a7fe55a646mr17345435ad.13.1769152412395;
        Thu, 22 Jan 2026 23:13:32 -0800 (PST)
X-Received: by 2002:a17:903:1c8:b0:2a0:cb8d:2edc with SMTP id d9443c01a7336-2a7fe55a646mr17345215ad.13.1769152411877;
        Thu, 22 Jan 2026 23:13:31 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:31 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:35 +0530
Subject: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152357; l=2522;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=FAydTEuSpolIPbgdCzPABbxgas2Q93+RqfmxMnmHLg0=;
 b=ad08EUFi/SNxt8P3OUY3DK1VxPif88I6qLpdUMVODH5gqLymjIDhedZVOx9bmmaCmvtGXDYkN
 2h/SiV1SNPUDITiIf7UlCQUEfkG+pYBOVK+g9uzGvyBSHXpzRRVaoNp
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=69731f9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DGDWbsvPyNGGEFbMfx4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: cr2H4l_b5qEeTMjf62aYtYopnic1aiwu
X-Proofpoint-GUID: cr2H4l_b5qEeTMjf62aYtYopnic1aiwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfXxDXYc4dQaHps
 a3YWnDKYzumr/eZ8eMbrdJ0DXZ8H395MxvBK00+ZwHA9qMA2rErosXNb/tEK4bihz2nx3CECqbk
 dcNB1PJ3fi1XqWvB95VNj3jzZaw5eTpwOh3bOkGc9kF53L5XsNEKPtf3ttmyB61JSNf/KD+bA95
 9yB4CQ9r9v6eEQHh2ioFvASApXeu+6y1xMOrFYYyI7kGZeNxXBcSbueW+PJ0kZJhE4UaSGyHs70
 vojjqj8+ofcp17PAG0RHLfJYEenDt3x9Q79/mw/99xptH32wzbz2RgdFhsdOKs3nUm2IM6ueyxC
 X2THKLeS5qKb61ZTnCiHBm5uzpLkEMQ1IQGczU4WUw31NvnqeV68iUejXQm9UTgoIatLZaY5lKL
 NadkdCO+oOxUCHqT6uL/xpU/qpkaTgbGZBxOQ1uZXUC1+zuCSPapL50dISL1B1WjJOk7wgmsRZ6
 wz7IlBztcxMaKizZKvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90296-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D85971842
X-Rspamd-Action: no action

Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
de-coupled from the QCOM UFS driver, it should explicitly vote for it's
needed resources during probe, specifically the UFS_PHY_GDSC power-domain
and the 'core' and 'iface' clocks.
Also updated the suspend and resume callbacks to handle votes on these
resources.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..4b50d05ca02a 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,8 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -108,6 +110,7 @@ struct qcom_ice {
 	void __iomem *base;
 
 	struct clk *core_clk;
+	struct clk *iface_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
@@ -310,12 +313,20 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
+	pm_runtime_get_sync(dev);
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
 		dev_err(dev, "failed to enable core clock (%d)\n",
 			err);
 		return err;
 	}
+
+	err = clk_prepare_enable(ice->iface_clk);
+	if (err) {
+		dev_err(dev, "failed to enable iface clock (%d)\n",
+			err);
+		return err;
+	}
 	qcom_ice_hwkm_init(ice);
 	return qcom_ice_wait_bist_status(ice);
 }
@@ -323,7 +334,9 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
+	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
+	pm_runtime_put_sync(ice->dev);
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
+	if (IS_ERR(engine->iface_clk))
+		return ERR_CAST(engine->iface_clk);
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 
@@ -725,6 +742,9 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	}
 
+	devm_pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
 	engine = qcom_ice_create(&pdev->dev, base);
 	if (IS_ERR(engine))
 		return PTR_ERR(engine);

-- 
2.34.1


