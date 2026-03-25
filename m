Return-Path: <linux-arm-msm+bounces-99866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sId3HtrQw2lLuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:11:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E993248B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4D8530558C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A863D090E;
	Wed, 25 Mar 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR/XFy1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbfZEhB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9063D16E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440095; cv=none; b=qMnDCL50vYbIG+uc3qO83cPwzCrgTAutJVXihaRFlPwtEONHMTJBRQTeeFiWjtMCInQh4iMkHS4x/vIuSAmAlTOjmoWCLEe3D0YRM1ULe/yL9pxyCQFgh/s4kv3AsAY/42DSzVfYyX/P3kx6WY4prfJcFrvXhSOzIyOSlH91N9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440095; c=relaxed/simple;
	bh=elqbJzwTK4RlLEHDihKz5qYzGOzjo0++lq6c4OD1zzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcHwntI18uLdU6fggcWyHob2P4Hwa4iECi9nincLgSWuKd8cVf3KfcH9e5jPKn1t8JYw9mk9o/s81vvH3VRksB0opZ2/btbuQhMGuzZciTlKHg+TosrewdHujLrFzXqNERNgdr6zHB4whUHg8v+Z3XWJMEUFLqfjqqxfT0UDBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR/XFy1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbfZEhB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGORE3922592
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XVtvdIOXt7W+zMTk6G1imc9LagVh7jOlQc/
	1CUj/6Tw=; b=pR/XFy1PUR3NSsHPV2R6G6z9TcHFMbf1p/rD7Gh1+tKQuIG26HH
	Cd2b2OrNej6+wCfETd/FNRbGGxbNryrFEuUhlJ8hO8ZJBI3jfcyd8qWeJTjTEuGb
	OZYrpbZ8+0wrVqtSFKRI+MJEViONCqeFhYJC/9DXzJulSk56OLTzUWpdQcuJ6AaD
	HN1FslClRzAxp8rzHsGm5WOwRRKlHBUJQOeX/OhHCYk+B9W5Vil9SQqMLjI0R1gQ
	xEyfIBOuSzOUWKsLip0M1Oi3sqCv+jYWHZZalVKVOBInL2ipLOLx//4OptYXuHKc
	ZPBf8Tg14VKPVUcflXjf522MUB3p58www7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rau04e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:01:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so5755142a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774440092; x=1775044892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVtvdIOXt7W+zMTk6G1imc9LagVh7jOlQc/1CUj/6Tw=;
        b=VbfZEhB8HcKK/5sHpxvSs8a56J/TQBOMtXae13YGLZ3uCM7T6lBPUS2vZ/xSeWqMbb
         AuI/wVz0t+meLnlBf/Q4viaUyeAOZwdRvAJm5ExhiTAgCmOzX53Z28zamtpGj6KkhR+p
         BLOlGMHXhegtryhOEglrMVZ2KPpF5hUdKu9l6VCDLO4eIyd98LUfWQ27mEprEtLxdgmA
         oPBq3JKSzOttSbmURDTNbkpW1dbEwraphV9BxgpF6ig4Z1spHXsRSbJFedSBRVahM0MO
         HFCjaXxEzpUsY0cl9FnxyEOvCT4pGHEjkK6SSoIIcygou8CXqRz9QZ/PvqoQ7eSThLf6
         uTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440092; x=1775044892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVtvdIOXt7W+zMTk6G1imc9LagVh7jOlQc/1CUj/6Tw=;
        b=YGZDoh3fgXq+NY6/ZY37oMdWpisCe7kl7nViBuCTvW60ZwS9mMPXyIIFuTiS/oilaN
         QEpPfRBz5g4cmm4YmNbRoqNMxmQ0igHRJFHKOj/3hYOgdwiKiJ7EEHIOhDM9gJFjtZR2
         zlURwnrCPXAzLMHR2E9hk2atkee4ABQp87bTjfpwGkPBj2VA3tAKT00aQ5bbhUY6mIJ8
         ZQMYMYCyIon/3GtymGwKn8gFVVa2xvPYiQFQSVeSlzhumC2Q1JiTX7gCRhefY4X6RAc+
         KoNVGjvc3rIwe5N2UIw3JqsUgRb9XDhxxXI8PTPwqy7NUH+5Y6YDJ0n3wGlG8dhToB3y
         9djA==
X-Gm-Message-State: AOJu0Yw7FZ5l0RaQQsiq2m2nUilNdzb+TtFnDKAr3L0QnwiexpRhpBUh
	fmGyW8oLZURSOZs31xG7OtZC+OwvkUA65D25orlruiuCoQ0UF+szZFHDpGU49sy7W9K3dy0lcCn
	4Pucc3qp3Apka7fPbry1f3VWlUzpHru7gG46HL5w5SufWua6pvV+Duk6pp907mHdLlDAB
X-Gm-Gg: ATEYQzy1tyxRnNAXfO8kzUG1jBwPG0B9hTqaYOX+tPnQy60JAT3HPS3ol1aGqvZ1PMa
	zzkuxVp0QlCsxuImavcUJL0FOw7CwCnZm0Fpadncnl0AbmevkPvFi873tEJfLjp74VO4MfVI/5E
	Hb+HPUSP6eu/crQX4qffzEpH20R0DW8awu2QJOFmJkeDtZObqnuYoQODPLkGInNPM+ulgN6YVsH
	70WIp3Sq7OZgO0I6yOtoXOWmP4muJFoTVTmsUduhnNoxU8ZhZ/YemzhhUfb+8BJpXps7V+tWpkS
	224b8BAIXPI/6XWF8FdSs1HJ0aZCDaq86R/QOKQxsHRbO9o4AGSs7mRE1qR5bGuZAx8u3IPE8N6
	hk7bU95K/CaRfATz2xYL2FSrMtQkXKhyVukad
X-Received: by 2002:a17:90b:2e4d:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35c0dd40e29mr2770807a91.18.1774440091853;
        Wed, 25 Mar 2026 05:01:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4d:b0:35b:a760:1a54 with SMTP id 98e67ed59e1d1-35c0dd40e29mr2770739a91.18.1774440091099;
        Wed, 25 Mar 2026 05:01:31 -0700 (PDT)
Received: from work ([120.60.74.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03172a8asm6556117a91.15.2026.03.25.05.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:01:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.oltean@nxp.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] scsi: ufs: qcom: Drop the PHY power_count check
Date: Wed, 25 Mar 2026 17:31:22 +0530
Message-ID: <20260325120122.265973-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3ce9d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=DfnuZq+CPLWApegUcJV09w==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xL-BF51SwBSFlk349IIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fS8pZp9zul_RCzu2HXw6IYglV8DIz_q3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NSBTYWx0ZWRfXywuqKigJZLAa
 eJLAEzOvCshbu5eV12P5xeQnfWgz+ouGii0iDDn6f+qIHB945Lj+TbBL+5B9BtKrbgMesgZm13/
 thMxu/K/nNIV061X1UR5oxj4sz8Uc5KZvvAsGzpk5KUcMWu3DhZiymdCEWShfss/Cqb2jCibP51
 XMRmVAuYUEl3KLZ7CDNZDvpJRrRT29Co2tDvaTClNWHNinHHGA0KM7zfVgyvlKLgEzxVMl5+vLH
 42JurF9oFESasAzGPoItSHyj0PnfoHEexQ8MlzmBvCE723EJDZxA1HPZr6OOXLW+10pMSAkzcSW
 76q7pjHBJARMOSotzaRlyxkWpezOKmCI82aG+DfvOYwP/gEGHSpli1Jybx1B3XnaQnl4Ch4YXbE
 q/GkL/WWTE7W1/yGn3GAoAcKyk7UTYlKlrRK62BUW3rx5xGeirWeSFiAu7BdocqKX/fbDfUgsHy
 Ag1bOsVtRh6I+/IumKQ==
X-Proofpoint-GUID: fS8pZp9zul_RCzu2HXw6IYglV8DIz_q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250085
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58E993248B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

phy_power_off() can safely be called even when PHY is not powered on. So
drop the PHY power_count check.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458..4a410a0137bb 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -508,9 +508,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	if (ret)
 		return ret;
 
-	if (phy->power_count)
-		phy_power_off(phy);
-
+	phy_power_off(phy);
 
 	/* phy initialization - calibrate the phy */
 	ret = phy_init(phy);
-- 
2.51.0


