Return-Path: <linux-arm-msm+bounces-75675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E37BB033C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 13:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E3487A5FEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 11:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F42012DAFD8;
	Wed,  1 Oct 2025 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVuelvFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D142DA751
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318716; cv=none; b=rM674WZQYoB3MJCn0pf5pqOJvwz/TjRUzApqgrFE3V9YfAyXZts60xnFKRMAE7KZu2RghO50T6ltewsBXy3SYeQ+uYip06Rr6YsDFrBqyaHqGhYsYAyC767xoJ6z9rQ1qbm+FMPYKBtRkd1P7s3JvbWlBnijt35XWuVvAniPZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318716; c=relaxed/simple;
	bh=L4Cyw3GgF6Au8o6Hny+g4N/DoHBQ9SVqEs390lXRzGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jcc1z5KDpq3hVyuZZMqbf8afct59PrfNeOmbRsDxkG2DyP/BITW54Xf3+K4VCXrcI40PlCHlUfrFlvi08mwVmyGm7Y7MEj0/3pCx/jKgNMoU68sFFvxyZ0334AtHmOKD7QQh4P1W6SPVX6JJvYQE8+BrWLdDtkXbKEt1wQU/UyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVuelvFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917jJ6s017628
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 11:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7yE6v5/M6wV7yegUaBo1axPJLG+xPn73fkfkm/kPY/U=; b=WVuelvFh3tCC8Hra
	AiJBSdi/mvjV/CsWFQiyLIo6iWkbpFnBxkvi7W5CgSlVOgA5drSDoxdBQQ1172yy
	pbOO/pGs/ENmxJwbCQHw2Nr5okuv8gGruorxJYg+PZ236po6EDqB0tCxKv5aCCVX
	IzTkVzKfgILAE1d9Mt5buu2FWmnxs1csOba6Dvd8KqML4gIU+EN0pTc3zsXN0Jfv
	V0PZtEqqTBlLx7qwcLw4V4I4Xs6wnDvqgKw63VETEBXzIL9LWY5MYrzUeg12I0B+
	61cmV0JkRQWd9MI7/yfxxW1ODql1QCYNigkU2FctJt7abgE9WJTcWL2dirLjFf8t
	ZR9dqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tvkh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 11:38:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3307af9b595so6417797a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 04:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318713; x=1759923513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yE6v5/M6wV7yegUaBo1axPJLG+xPn73fkfkm/kPY/U=;
        b=HlDEfq+bsjpHnyeZ/j/fXH/7GHBOAFboKciKerwYrZJiDsNfsyOtK4NvC7eYryHX0n
         dbKBtyN9iXb8tlUhjwqwdnPOl9JsgHaM/L4hxn6IFj2vBLhekj+Q1cL7CzmPHKfBO+6a
         44zIJ+hburnE4Pr14N/zUHNiwIM5OxRLkCQtLleYB7DgCMU4jjQG04qY1q9jG6SHWSDA
         730eGNzR25qvV/f/aqr1UC77Rt/QgvE3Z3c11zDCk9qo4xpwA4Ip7IejFkF3zrhyE0NE
         tDUP1Wjt+pTaj5BHFxJNNggRrvOu/lWqyZVbdchs5Z8EYHRNB4dsK5WNVl5m4cd+PhbQ
         AxCw==
X-Gm-Message-State: AOJu0YwPPfigKJdQFSLESaza1ZYNntL1Q17BfvhjGwvk1RneOCPx5ua4
	GzMfvCGnpm0T14BstzC3qr7clr5bj8P4Lg5UIVfqa62gLxc8x8xJK+AED1NG2PTUiPuC1fxdi6M
	pLTuquwcGFmshvTi4mo9msxsrSU2DbXBNp7dEIItrQL7haQHV/BaxMxmJyj4hGs+yicj8
X-Gm-Gg: ASbGnctW5sUtwGKK0/MEPWL+op+5+fFwXrT4PlXS9OY8Mv3RaJjYd+cnR2JNtYOObzO
	M08aeOy75RMstLDyYe9vLUgCJ4hb46mh4A3EuczifSYj+O0F0aqhrlD2qmXtBHYQE9y/HCz/lnl
	+UcwgPCtrGu3+k7Aw5EqlHyrgCk9HUr75tRcI9fvhHYhToi1Vm22JZcbcfzG8RfgcM+H1dxAPup
	+GHK5kOVDLFHW5T3rz5RKhrhLbOae0XqYifkM8LOtq/+tKQZ9kSt1J6apsFXuEg5z6Fykq6tYju
	a9ohyAeygeK6eMcRFaBjn7sFk0m08TexQ3nzOfAyAqtv2iqs14uqFRWfSJbzYxzJuESTYXbIMZG
	oHBhMp1g=
X-Received: by 2002:a17:90b:4ad1:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-339a6f2e7e2mr3962093a91.17.1759318713117;
        Wed, 01 Oct 2025 04:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxwvyET/Ieuj5Ju7O5ebre8+IpT9Z4SrRxpt+5+Pe+dnBwvtlu0iBKTtKy6pMTTWKEO/JIg==
X-Received: by 2002:a17:90b:4ad1:b0:32e:9f1e:4ee4 with SMTP id 98e67ed59e1d1-339a6f2e7e2mr3962059a91.17.1759318712660;
        Wed, 01 Oct 2025 04:38:32 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399ce47d7csm1861646a91.10.2025.10.01.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:38:32 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 17:08:20 +0530
Subject: [PATCH 2/2] ufs: host: scale ICE clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXwykkWfysWAis
 +KQv84EHDSiPsZn1I+odHIWtAD3hn8icQw5HZNeDrvbOR/D+u1Sxm1bXVHSnYmkC2zA/A6W/G3R
 IrxQmrSLdVhHsGAvKQB3W6+o1wxOsra3jcSqJHLCwuajb7tjhPPci/rzD59gjSZTRpAOZyfgtGR
 vz+MLW36mhBvpdMpZUlORUrcC4aN/EIFn5VMJ5M1yD3whqxG+Uq8M6/BuWyK5fH/5B+2wNXcmO0
 nw8i4Tq2CWOz2JQLvNeUateEV19W2Z9PaPDv4QwXo5MEEqMBVCXS51UYuEjSUOf/plMdqieWCtt
 VwluLQ4+w3ofBgGgww1hV6E4fz4e3iuxi39C024z+d77u/dPXj20mjkWXYUDcpOW7ogAjJke5Dy
 O7HYsibrB/HqoDGZFpH/LVtUYu60xA==
X-Proofpoint-GUID: 0FbHtqUgGE8dV98pdjLCeF7UDaXrpKQb
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dd12ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=5PmQtxlypCO8_UJlTPUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 0FbHtqUgGE8dV98pdjLCeF7UDaXrpKQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Scale ICE clock from ufs controller.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed9399cc02d37b5229a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, scale_up);
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1636,6 +1648,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, scale_up);
 
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);

-- 
2.34.1


