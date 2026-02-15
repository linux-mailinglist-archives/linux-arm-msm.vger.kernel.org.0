Return-Path: <linux-arm-msm+bounces-92861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBkLKLOokWn8lAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7313E8D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2130C301B719
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 11:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27C22DE6F8;
	Sun, 15 Feb 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OE4562jj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWbmKZkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76D25EF9C
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771153564; cv=none; b=pD59B/xPrGWotOLNYCt+UMw2RWWPja/t7nUIOOtQ02D3zGplKpDPaegKc8KM/WT/SL4GeyaPTSKhKXYBA85B4PgzUhXOMAf6cvzHdTENPc4eHUp0vbrS7IXa6oG5fWOKoxiEVAjjp723pRY/kjQQozeQvpnTIFCdci810sTuVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771153564; c=relaxed/simple;
	bh=ULpe9j/GsNbDq7msTKnuHZyEObHfbgs1X05+hN6UnHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EH2jgmuLU8BShPxl29mNiElkSEchs7V/E+PC/58QalIjIhZevbvHVeaURBwoBqea+ROS7PXsZKW4/4Rp1fwAh5Pl8R/ulKW1o5j0RH6ldCjp1+HA8tL57ESLyDZQTnxCodvHTnVd9EOkqOBwGF/29+D5ullfbzSOf8QH3V+u798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OE4562jj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWbmKZkJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F3ZvIN4092676
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OmKSzJ5GtfV
	bLP6ZZm1eMbaLQAqoSfxOtwWmx5JTRJw=; b=OE4562jjNWnW7WTr/edbb17f2+R
	71mvsqVwIy/XjVIi7jUMvqhccNKCqHj6E1/oyMiOxHgV48t3RfAV3D4qpiVkNwL7
	5FSDysNF8z657Vsi04xYE+qHG0R21/pxv5FKduaOucpjya87FjS9ak4UALuP2Aq2
	8gSAKOEKHY791Kpjb6g2BPd5oIWUwVdIGTgyHEHAOxYvXV+PR4x2f1seTzbTDl+r
	hHKkqxUxH5t0aY2Pei3c+OHmvIkRfQxaHIXHprqMlcNLqkRh7hswibk+bcY6JM6k
	Fms1mVANfpTd5IyBUHaV5XL1qN9jHgS/z75vYlJoq1ZZITyW/jKztzfhV8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bugeq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so118860585a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771153562; x=1771758362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmKSzJ5GtfVbLP6ZZm1eMbaLQAqoSfxOtwWmx5JTRJw=;
        b=IWbmKZkJzZhhTKcWlo80rbioObsr8muM1NJnGB2dZzGjInxi3bj2KI1QHXZ7cGCuIV
         L0i27SnHRZ57Uf4EcBHtkAL4aTEMQZmRfcdF338EettRV3clyOAAK1N3oPx/n0BcQsH6
         9/5vREvSln2vihXz4byGSFe4AKDJqOB/sZKijHuwbY4Nn/5L3HmAawcyn8d3CQ7h6ji0
         5kQ49JAZusHVBA1gLkXQ1qB2p5dS4XNo9nY6k6zMQ6kEaoKmZJpZi0/CDNGna4obIUm9
         VtK3nKk2nC+5NkbDlP4IbRYEIn617sWt48Uo2Xxd8kxfpHt6amyeM0U4s4rO460yXGgB
         /wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771153562; x=1771758362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmKSzJ5GtfVbLP6ZZm1eMbaLQAqoSfxOtwWmx5JTRJw=;
        b=glKTb1REaPkxzswip4QwbnzttOc+sRnQ0uI4VW82hG6OTuJ1D6pPlFPMKC5Pcdmi0Y
         Z1YmSCMJWZ8Gcw/YSFcjFZjq9qnJZFtQSHG0hYeZBYT0Ul1iJM1M5XuMQ9XYn5EHx9sU
         Vhmhqo1gi9sywGF+UXQTocd/FZrQmhSr/amoNcftJi/2mT9ZUo6KEZ52c6PozGzpy2GU
         cpi5VfvltOZnh/boKMQnuWXDhSeXlvIvBJbWNwjVm2aVUSpQjjvPFcZ05RSPLlb6J2CN
         1c13Rs8AffDaNrpTS+67K4Lfy4FoH1gGgXUqpXB9tXVn4wLaBS5gg11y+2jXqbCEzs39
         4mPg==
X-Forwarded-Encrypted: i=1; AJvYcCV8NwiHzygjs04w+FWF51i65UsuBCEsQV3vGN+hrH5m3fFiKi8OYVCiN9AZ2TWY+URrEHZwXt1LjPbviRH2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkpNCGBvnHpTFnwcsz65X+Zwjq1P0m0ysFsOIEwgYd7qt8nHxx
	JWVgZlMG9EvSUkjeNuJKrOWlr1Sqi5RJVDLcjp0oWngvugbpGqxBkS6+e/kBtMxYYs9pigbW0OH
	rGevML5VeKEVp3TfaLAFxE7d/usxmtRuzK/2g5hwwgkJkx9Y8N6Edl0hQjpJzc7pRn0BM
X-Gm-Gg: AZuq6aJLWBRIqb4WfUHI8Hh88KtH9Jzsr6zULphlJOhOwKb6rOnirJYMG9mFtRdh4gN
	xesdXP1MmoSKj+0zjDDL0Dtgxj928JbF5cHGO1Dg0uze5c6iVDwYgugkGVbrfJisiMa1SLqRAJ+
	UjwqFFkHydNMaGEUeAZDMawy8csWStARrqhAOUiFCH9sfGyQXMAzJMQ3F+BwI0QBoFszC1Af8Nh
	pBvnkYcA5spk1kSJQWo3m9SLkc6IsFntOZzNyE/aSRr8D/5ZQNBy4BaouEhV+EpBt8871tjZ2Dy
	alQWpZAGSfIzMhA/WrTyR3JMqziIu7WTfIjlrvYE8s9LyoOae1jIS+gysVTQ6aQw+aqYzxk7u/W
	QGXi+y8A2x9PfBDlKlx1qe5JN8ZXffYNYaVDxUQ==
X-Received: by 2002:a05:620a:19a5:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cb4228dbc5mr816570685a.20.1771153562111;
        Sun, 15 Feb 2026 03:06:02 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cb4228dbc5mr816569085a.20.1771153561669;
        Sun, 15 Feb 2026 03:06:01 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a15dd9sm83550155e9.5.2026.02.15.03.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:06:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] firmware: qcom: scom: Simplify mutex with guard
Date: Sun, 15 Feb 2026 12:05:51 +0100
Message-ID: <20260215110548.34152-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ULpe9j/GsNbDq7msTKnuHZyEObHfbgs1X05+hN6UnHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkaiRi86UtLzQRIGwGMY40OovtO56L51NFQWSu
 GuyTjakVZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZGokQAKCRDBN2bmhouD
 13QfD/4tS1xb7qxfn7QBXpHqEHz6PBdo0wWCbfZl2kDrYa88BS6kpuNVUD+348Kg20MqawSWNZ0
 ukL5BEUxk/cbC2vqgAAzKh8JzpL26Dl0z9Botn+MmDP6Q0W+YVsg3QGqmfe3Vz/52LdGa54w01m
 bTvXstaFm+zUgoLTDNH3EItVHk3LaNOAPSgL41Srm/MW7EJaLC5RiM+vup544dVdDNYpTTOSjyP
 Bam+2fFZLuFysv52u2OiLlxsdi+BBxw626HaPeiXa5V60MF+V4ehV45BIRCmHAnc7l8pDj9DXYj
 lMwPXDpIQz0egjJovhD8xov62ElcFNfWiIzXzyLtbF2WbjENj75R7xBRulZdisow7QQ8AS1RqFj
 ifZ/MNSiN55ZALbxqqbNquXJy02/f8QGqF/VkOthEHYmUmFBlCc9kT2Iigg+1+efvOpuXte2s6w
 RCtaFJLedWWCMkpFIcXlx69vHbDA/P6dfPDyt3innH8zz5s4c3P+tPI5VK1cDiFVuqqVcaynwyL
 AxucJVkZKpbyiDK3CtRc8ejoLul9JJ5O07aoNm3ym+dBG/oJ3O/+UyjsLjsXVBgSTbc9HEPdJdY
 RhZchUYI1n6JVXPNFbIbRYgtD6JR9VcD44dF9Z67QO8AObzqUHSK0TA42h7LRh7RPOR0yEFugRS BQv9qxt4z3J7mLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cnf8P6Pp87D-jmJbeFCMwtbEVRkhRp3A
X-Proofpoint-ORIG-GUID: Cnf8P6Pp87D-jmJbeFCMwtbEVRkhRp3A
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6991a89b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qlTs7ZDSZxy6MtpO9yoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDA4OSBTYWx0ZWRfX21eXW7mWNPbG
 tNWKduKJTettXmPKPBinAayk+V+oTijzF3Goaac4XzoxCj1v/xOtvxqc+HeCCDygBegcPaCr/gG
 /gZdLzsm/4oRj+y3skgaeaPNu3mhOufafPlt/rdjeBfn/VUebyauYX3abJwZkHElWRcylHh82mZ
 9aH9dckftsbEeWBZp8w2Ihw8r1ylEaQzvpKja8cBzPLQfGqP2Fvf5UQU0Ax9EWNzCbrgR4m4eq6
 tmQmUOjtv60QBXmZsFm8C6CUum7/p62uyesIHTxm35rZQ2KN5Kqg8d7DaOWlr8Qwi07QgUUqfFT
 SJBUKYUxmJcIiTdnPy/03d4LA2gLqnoOTavb711NIeboPwee7KSxM+/RDd2oPaGvE+DrMNMZFjp
 FH1q/BNiB+wZLH+P37kBReM92PSsr1n4zlIHIKNqVneroVmaS919xZO0dbjDnmCKXhAQKpG6KCW
 BxCwZ8qpAyOxtYHX6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92861-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2D7313E8D1
X-Rspamd-Action: no action

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..f1947025d8b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -199,19 +199,18 @@ static int qcom_scm_bw_enable(void)
 	if (!__scm->path)
 		return 0;
 
-	mutex_lock(&__scm->scm_bw_lock);
+	guard(mutex)(&__scm->scm_bw_lock);
+
 	if (!__scm->scm_vote_count) {
 		ret = icc_set_bw(__scm->path, 0, UINT_MAX);
 		if (ret < 0) {
 			dev_err(__scm->dev, "failed to set bandwidth request\n");
-			goto err_bw;
+			return ret;
 		}
 	}
 	__scm->scm_vote_count++;
-err_bw:
-	mutex_unlock(&__scm->scm_bw_lock);
 
-	return ret;
+	return 0;
 }
 
 static void qcom_scm_bw_disable(void)
-- 
2.51.0


