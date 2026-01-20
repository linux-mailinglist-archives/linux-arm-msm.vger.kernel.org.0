Return-Path: <linux-arm-msm+bounces-89855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHUQOYrKb2mgMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:33:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED149856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 19:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61ACC9C87A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CF744D6A5;
	Tue, 20 Jan 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBBvBljP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FesPkpU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E2340B6E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921878; cv=none; b=Y63ZkGD/AokY6Nxocxp7viXXyb1q2UOuj1fX69jrtUcN8LL9oQv50/YoEH8vfh8hAM+lD6YXBG/0bhaZGeGOkq/nE1/D9JAEuRtoRW+T12JeOox57kKjIKVbgcn30zt9nsGl27AeK/vYB60xMU0xqeo11cREu0s1zjx6tWy75ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921878; c=relaxed/simple;
	bh=j8TwNbvdrY0oB2uJWlrb4vav4uY7HtWhGnmH8BAkF60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OJIdVx/sKcH5hZuM/z7ArwY8ymJLyCCF+mI20duMxLKkk4s2dQsLOaxBxcZCc2HgTPfKqmqjfQjiV2sG9VqmhHrHPG/Zi/YU5XTlv/oDOaEvbgBkISjq9DLvKQaataHPc5mPVOdRddTUyRjUyqxwoUdQ+uYEqlV9iucbeW+GDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBBvBljP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FesPkpU5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KD9Qsx512120
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R2Q7SvHuSDAVtZr8Kc9/++
	hSXyyDNQmsxA9fUfbHm9s=; b=bBBvBljPPxpPV5HYM08TIgyh/CiAGq1DVhJI/z
	WV/3EaibeIUHHqyvZYNU/mqVecoDq/0I3RG6qo5Cg0V27alaYHB4xr/GrOlB+vhm
	+mS7QlFzqMbj3vX9/856P/X+GsDwX1lna92E+Kg0OecQ/rzBb9xG444T1cq7GG23
	xbK46ntct770xJEX+R8rmxGWfVJ0pP+0Yi8x63msbvssv14HeSGXm5S+kdNsJVZd
	rpGGH11RyqkpGKC3aCp4ERJIagq6TmLFNfQzWaXIxhudAUYwVHWbid8jyoqHx8LH
	xNBPXSutXSohsGxuDGy2zxtIcdlo7MY9qO/2M3iEMrz/h70w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btabe0c9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:11:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so4786758a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768921875; x=1769526675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R2Q7SvHuSDAVtZr8Kc9/++hSXyyDNQmsxA9fUfbHm9s=;
        b=FesPkpU5z6uwexAGGngGg8wyGZQ2BivmwRadukVG+ePZgCJGDyL8h0TV0hqdRbz/KZ
         z4Njn243vKV+1oPAifZb0YCohu2trdCh9ChPddkjuS7avK7eqJu7C5CLd+Lg3yXCbqvt
         RJFtVUWY6JB2r7PJD/hmtwRSUWLt5HJKAQKNctZBn8dqvH0qPBVXeO6aZ5i9QemG/Ud4
         HwCW5OqjxUX/ktY4dnCCiHP5UWC55eTm3LCiJh72VfJDb8Oo1iComYY4CsgVfWwjulWx
         N1Yj7SLt2qQQLIMnxnnpqoIJ8c6t08wCr7KaahmBAWZQGKYbSUJ5JAYm39U3y51lB3Lt
         IQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921875; x=1769526675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2Q7SvHuSDAVtZr8Kc9/++hSXyyDNQmsxA9fUfbHm9s=;
        b=QZODEPKzpTmfwQmu6ul85/bv6SUNafSNirSXXm0IgbpwrH14fyNd4L1cijEF2cz9rR
         4Y9I02TFPHI13LgHg2Ed450vmq6Qjz1MjbsoilZovjEpMTV11888X6mlVEOPznEVfqHk
         oYjdY+0J9E8M1gIoKfH8PXKjaFK5+oU4nEnG67hqo4/5Ft6bppGL8wHBfw0pC3fPIvhm
         cMn2DAI8tBe1cNOUiIxd5cf4r+a5g195HfTYYIPZFmPAsitaPAj4/q03VnJejICJ9wes
         CM9HQlyia2JEncP0vuUMxvu8teTENhyMpi8Ec4M562tvDrFPBVIzzbanZl7ziiOmlOCP
         hN2A==
X-Forwarded-Encrypted: i=1; AJvYcCWAV846KGHGhm4gg+CF2DpaVsXfEqChSu4wegSD6UapCRx54hHzLIrSwHAoOYvSqECGWvaZdzdONDTjQDo3@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDPOgxm96pp/mbnrUZBSESwW+7Nh8Cb1DFn1lt1zvQSW/2vSj
	agHsbDRFzCsjguJ2uvg5AmTo9WxJLpx5UnhyXeWrofg5paOW/iZxBehR7vDhFs2BZ0fMzexQQNl
	lDOnrpS7TEwRC57ZQrtZ+auelcvBOyEWv2M47t9WK9Q5RL0zOkB/llOzGVrSmI86QVQ4S
X-Gm-Gg: AZuq6aIz+BtFYFfdRlIH2nyhksEP5ePqdgflBulnqYe6epF9wuMwbzYRVl4yYKEhYah
	I3uyuwGiyDyODEFd//SF+Hd9iLJJXMQVRWLZRg5SzAdoPBv0eqEpWoqVg8brHioCvmUbA8Ac4CB
	YX2y2Rv5A6hckFKNT2OYrlVa9n52fktrkDaKC0aDoQkzNObtM/ER+m/KpxeiOoIisWN1n2MJQjY
	J+Bfj4xfhvoEnv9OOyOqYfm91iimsepbMi8Phj/+bgX77NHiSyiuADqfywsgvPczy1VetrjhQFB
	1A8J131P50r/fODnSeY/HgUmAaBRJe9XSAo3F/4MZm4E7c8ugRQhRMdTotpH8FkHxxxBkqIJNRa
	ZA5E9L4UjrEP8SZiPeArN1rmTqyTmtnaNExN4JU/l
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr14267303a91.12.1768921874807;
        Tue, 20 Jan 2026 07:11:14 -0800 (PST)
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr14267256a91.12.1768921874153;
        Tue, 20 Jan 2026 07:11:14 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527306c41esm11517836a91.5.2026.01.20.07.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:11:13 -0800 (PST)
From: bibek.patro@oss.qualcomm.com
To: will@kernel.org
Cc: bibek.patro@oss.qualcomm.com, catalin.marinas@arm.com,
        charan.kalla@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on sa8775p
Date: Tue, 20 Jan 2026 20:41:05 +0530
Message-Id: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0pM6X1gV88WGsXhfhLd6DVlmKS3wjILJ
X-Authority-Analysis: v=2.4 cv=Q43fIo2a c=1 sm=1 tr=0 ts=696f9b13 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X4sqO_BnIXgP0qhT90oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 0pM6X1gV88WGsXhfhLd6DVlmKS3wjILJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyNiBTYWx0ZWRfX0QdY7Ld7TtAp
 ZHCEJvFHQqqZHjiH389cNDh56zcoNcBrLDPjjNFfDFBBrGq4ih3Whi4NPhBin8kAePwOiePZM2y
 TiXF1RSQC+9kJo+ZceC3qWSNQ1nzX/0BL3enTRiag0e5K42g2CBJ+vZ/G+moBI0nv+HLQY/2UKO
 D9Hao7qqZiiezrU7zZnn7WIfQ5/BPQWCyV0eU3NLWZflCO+CB/ZghEd7s7Ma3oLEomNzmyzHQ4F
 /dZmWfD5ntas1rEbAdjskv0P1tV3gVTSnlRA0HinI+3sqqlnf6f0Zvb596mk4tpIRuh0zB5tzTv
 j/DTLTj3dJf1hhXcn81VUsn/q1Lr96ufazgHU6DfP80b+ZtjCjnr0i9IRfYszSpYRp+vl01bvnR
 NKqfs6ZXDc7wLREu9xo2MHIC2K8RoFie3oSU2HoreVZnAwcgZQdrTyW3O04kMIvzBdhBeqd8T/g
 kqJMaU7zfla/FowFaeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200126
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89855-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57ED149856
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The ACTLR configuration for the sa8775p MDSS client was inadvertently
dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
Add actlr settings for mdss on Qualcomm platforms"). Without this
entry, the sa8775p MDSS block does not receive the intended default
ACTLR configuration.

Restore the missing compatible entry so that the platform receives the
expected behavior.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

Hello community,

Resending this patch as the earlier version was sent as an
in‑reply‑to within an ongoing discussion thread [1], instead of being sent
as a new standalone patch submission. This may have caused it to inherit
the same message-id and appear threaded incorrectly.

Please consider this as the correct patch submission.

[1]:
https://lore.kernel.org/all/20260109204551.845959-1-bibek.patro@oss.qualcomm.com/

Thanks & regards,
Bibek

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 456d5146831e..718d102356d9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -43,6 +43,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
--
2.34.1


