Return-Path: <linux-arm-msm+bounces-111973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fKNVJhw5J2oHtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:50:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04565ABFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:50:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BJVK7Dj2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FxUiFifv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2655730A9E12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432253AFCEC;
	Mon,  8 Jun 2026 21:48:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078E3AFCFE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:48:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955323; cv=none; b=Ewq4uKNGAmdTYSYCFY2BsvhxLhd/CWvitxYUcL4v7YhFUKYKfzo7hA8vZ30VNioqA8PF+qHN8MwXO5CIgt+ogCnkIGuAcC9aLjamCcLuF3obzO2SqJusdnnSxFTMthEqTBF+uUPsy19Eiuhb96rKbIhbC6q7dZ6Sb5m53rRIeUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955323; c=relaxed/simple;
	bh=V18lkZ+mYtRW45RZQcZ5zGi4H7dZflBvwdwCuHqEMXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVPdPfxpLgZHBoMBQqjr4Qeu3dz2nbeA7l1FYdIqmQzf+ol8GfxWDybXLiVKprDaRJZ0Yx8fsGMVTC8kSOzBotAyngYR5HJc7XgodPrelC3NoE+QYIhkbnm/vfXhLsfWx3cScqS7q3HA8oA7JYuJKKplnYM6bzJyM8sty+JJFZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJVK7Dj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxUiFifv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IxBnN348910
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=; b=BJVK7Dj20XAZt07t
	qwaKXPK9Tit4+EKS3XvP2r/ubOYWVXrqwZl4Nfon26q3SBcFu3xlskWpP8Qi9yjV
	qCXlHqujpmlXJ6ORrTgpKa338GfwZAyLivf9BrORfjpiY7p9R+cVjsR7I5hdAvS/
	wUu24W/xmS6MyzFAHUelqTbCuyyfFJH7g3mgc4N5jEcockwjHgjCLPooTRoZnoPv
	zb+kxGl/HsPBShKHFxv6qp1NY5FQcjOCO37HgviploNW8pfdo7r1hvSOYBcxIeig
	Vs1gpemk3ojyuJb64fZV074QmC1apzpCao4hlZk9BGTyhNg7MkbIWxPKLLnL0l6N
	kWcRMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvajr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:48:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f24dcedso5923394b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955320; x=1781560120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=;
        b=FxUiFifvAyuyytvCJyRAoMEn8z0Rw7QgsGngpkzLEd8tGC/zQlolX5e6gh1WF4VVQ4
         rzm/ksGYXHudO5E8xKtYi4pjHK+1UBmSaI2EWJztpZZ9KNvkQIHsgsmoQWDve7RBuVJ6
         WJNz8RDWGbiOwk4A6lt53u3RpJD2/VmMevnTwKLqnfU1IWRHxkcK0+wxW7T/kVsbyT2e
         wkztYNZcF2nbDHGXnaSAlun/DR2tnFv27ztVVieq7gMwM9y1Dg+WgZUPl4GaFGCgkQ8t
         UaWh6Vk/I7yIEpwnJ/KWLn8SfXtcYMTJb79Z+J75HmiJjl+LLVUr9ctzzFSkEACbNm59
         ZooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955320; x=1781560120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2btTWcfqlMf79K2ygn2F3WwB6X9SQ/bHFDltKt8bfE=;
        b=MFursflwssD1Q9UGASF2HEKrhn5wDAeqJof+Ht0xj4q8UXdHxWjGMdh6L2ijgGTXRU
         XBuVyV89cTSGmsZfjrHBPL5xhsOgNCFBYJJ/KOZw2ozgWiSzZ1bXSPshQSngl5h+sXLf
         0Qx4tnZcm3ds1hK8qXDoecwIron0nvUXBTRKQWJ2YmSP+rf3PlvgGBZS1i0wmMmUBgFW
         hWq3VBJ7eK+Bh2Wl9qs6UQQulwcamOdEMcHD7px9YrTiTjdaeYsPiLurR4as/BAfS2ja
         0txPo2g7qPq3+m00+hYSs+bTilz32KxAOCNg3gf9U6aHXTgGwcM4LDiEeEEUOgqE9gLM
         JHmA==
X-Gm-Message-State: AOJu0YzeGdS0biUeM/yWqHpm7jPa50om1Upn6Is50ME+Rl2aJaenusQk
	KOmwx3nwhXQchWveaIHUiTMVMH+fjCSnnShBr1dWYQBMZXkMXz+d2s63uVydq0Uom62C/JQyLpu
	+PcmvPI8GVhw/i+u5XRBIL16GLIdh5T20xCOCRQ0TtRZSVzbuxs7oIFr7n79DBgSXx/GY
X-Gm-Gg: Acq92OEEhpCKGt0bJSiSzH83IwmO1MUqOjoeBYZXUR7KEWkweHvVHdgin1Y3qjgqRbO
	nuffJh0lH0V9QIrJAOXjOK2e11h3YYjG0ZvK4LwpWzFjPNlJwHKFSQAffIMaE0Qt44DFytu92DW
	e+dcqYd/9AgdjTC24yNdJDdXGS9iN3m6cIXhzi30Xj2T3BBhEOGTglRqCDxcpFa0Wa03PehTY1D
	HjaP2QKlHGYotM/HOMVSV2wWX3n4drGAVwSwaPh+o8CEhVDYluTUj71tgknlivMR9AciSVl28He
	gHsg7P8G58VsOwLP9it/VUa1gqUxwJlR+dKu6kITA2zEFbV8rePkYeNWJeHqNkawOPBIX6CzXkT
	iPYDykUg6frhXLQgD5/m3DUK0/X8BA57YMbYVtlympw4FxVjL5b67il828qxJWTIJC2ICaw==
X-Received: by 2002:a05:6a00:10c4:b0:842:4982:81c with SMTP id d2e1a72fcca58-842b0d5d2e7mr16779872b3a.20.1780955320056;
        Mon, 08 Jun 2026 14:48:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c4:b0:842:4982:81c with SMTP id d2e1a72fcca58-842b0d5d2e7mr16779847b3a.20.1780955319634;
        Mon, 08 Jun 2026 14:48:39 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:39 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:24 +0530
Subject: [PATCH v11 2/6] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-2-1cebc8b3275b@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: YmeFTIUX138atO9dxgnY9fjkgycfhNd9
X-Proofpoint-ORIG-GUID: YmeFTIUX138atO9dxgnY9fjkgycfhNd9
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a2738b8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4vEl8bdWBwuQafGpEzkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfXyGgpQ7v6WObQ
 2H8Bslx0NmJNWxE9/YUsFZ1YbJUuSWIZuZ3D0CkH5jLQiVAYxZPyo4INAKYZKEUQM2H1mecKdyx
 bLOrLU+Q1xawAPnxeuqNAcmpNbHRnIdG5JIasBLjmIvm8mzbaubgF2h6YPzf5gZEI4o4+F65kcw
 fGg55oryOfXQD//HcybpafVJgPBIQe5qQ6p7LdwL4oZR93/lXvaQNuNHlDjbbd92Og9cA0a74pL
 BFRp7lz03lVqF8Q7J9AjleiiXnJi9HssXwFJLryoFgv4NaELU/AuBCd/63k29uKWOR4wusf44q9
 Gg4Z17LmH8sebUpiWmZUDT4RmO6+pq2dB+rBxUuryEd6e0TEvaB9ViOlkmhWTptCOQBmmcq7NlA
 OVU57Tfo5A6gVV5OHI6VtM+vrT1y2KN7T2KEbHqQWIjpromyYJN67unvKzST1SwpyRv7P3z66lS
 rMR/71ncjgJon/pfNFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D04565ABFD

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

In case of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 291c4344876481461ab958f3048db5405bbead62..dc15d7806c7b677d6890cd4b077cae4f4d5c9a41 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1946,6 +1961,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1


