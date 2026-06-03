Return-Path: <linux-arm-msm+bounces-110928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d9VQD9H+H2r7tgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D503D636778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:15:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iMpnQS5D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MZZoQxkf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110928-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110928-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB6BF306574F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC204534B3;
	Wed,  3 Jun 2026 10:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D4453495
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481691; cv=none; b=qcLDIAe31yNTsaJifz8YjRpr0HrHQXKrKJrgEABcys8B45ZRR45L0VqfECZcwjB5jAT4JtN3wGNvqMjFxqph/ag7OdIPxynLaJ/g3hDorxV4byrqQxSlTr3X6q8i80Ae+ms0+3U1ldmQ4tB1YdgVO/D//XrgE78HpeNs3hmxeF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481691; c=relaxed/simple;
	bh=xryvc3WEeX6Eg2MpUAaAvXQdss2b3pJzRlW6dcfR2XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsOOMO8NBZqzvHs8y8cLZL15bX3B47u76EZ0SN6DHh41HmcnOa6mcKKEHAIKmhHgoX70xATqv0KN0hyMfW/9+FivfPPQWnWsLnxkamTMUc9AUsc+7S4sCOcr2k30Hy//+oCK2JUd5Q8yWQI0xwjIhNp4G+T0j1jfX+g3s8ksjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMpnQS5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZZoQxkf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJ6D380230
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=; b=iMpnQS5DgUZjEs2D
	Qgu9qR7UF2Fet8Wx3iS7N+ZwF2u6viHKrCKoOJ9mLvJAQ/RNHsma3t507XLh/itQ
	cCAYaw+mNFdVnSZLBvHNk1jBdDneBXKf9Yu3NmjZcL5RraHaDauaMTSYi9QNhhIv
	ifXSPv9oY+LWjBsoyQL36x8+0xGt9Rm4i8RphoVaVnFUFq6n6+uh5LKV7dyVDgNV
	sprZHNOFk/O6F/AyB/LoagTfhBOjd1Z+fa99WfeKqpNtGsfTZxBRNxtfdgGnHMn4
	kqqnkYd2W2eirzMbttwhp85H3J2UKdAcXrpPV60xHFXIuhndttKz7JAegzPb0AJm
	tORYdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhryg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso3143079b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481689; x=1781086489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=;
        b=MZZoQxkffj9yO4isAIS6XvrMDS22zvD64YU4bFLmDcetS8eu9oREmkYhVwj+QPKu8Q
         M8aryS+8Tx7hNsK6BIMmmdREtiyrQn3i5NFoXtZb1jkBVhYOTunPIP5ErOJ+nWXcL24+
         LKieJoyN1k6RvbEFQLqD3NAt0PmjD6eyzT7kHuhajtZBAIjXb+KT94bmYOLhwfcGYa+B
         oLC6g4KJ4OmoFRp0rHszBIwV4P4IQMADLZ5BDETfo8zNCNecJ+aNqXIgBOX4KBSXduZ7
         LSYZ5Jedy+lqDE4jBtHu46e8aFmheGnqYVOnyuu/4We0P8Fy9WC21Lxylxe8RV9ZEvtE
         aMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481689; x=1781086489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8UO4LKBr0BalaekeUgLna7aJRBnbkSc89WeUtzQIK0=;
        b=ZR9gQyS4GRGcdEYu7c4gy/dac6iJKTW0mX4sjqM2wGFuGvyuDf6V5BFD4bxP445fY7
         S6yaDxJ03jLBSvJUqeUUBNj8PAKWbC1VVxPIg6VJQGq7v9gqqHnsuY0MNBElDOyqKWDB
         CV5uGb/B+kuzvXuX39CAG9iBeUU4SavWdw0m/U95/yMMgZhL6Psa3js+HCi8627CD7b1
         eaCFZHOgIYms7MEVbM8IXQkNRHZVJFf7yRXGkV3Mbz2wKgEWj3t2YyIEy64IPL+DtFSR
         WHDEbnDKiDnKF42bINKjLh1I7wsZ242BNebO0vqy7Fv0AfsDflmVpmhA1RoMhdw+Vthw
         v/Mg==
X-Gm-Message-State: AOJu0Ywu5xuSNimOKqBiP9sJssFvT7ypJ+whwEtXR8nLCOahpJOXulJV
	nD8i9Eh2XyQ3fs1U6xVCo25HJQdRYN5qQXohl+5XS4sI9b5q8KakWJ+WqUAcCr2bwgiIYuN8bQ3
	KjXHPJrMhtL4GjtAgaNCjga+/zwrmTX//FrZfff0wY9K4RI5qYP72pgrspndCMRHG2Jp7
X-Gm-Gg: Acq92OGIFgY7OBr83umRY+E/3vlz2RxZf/1gqf68AjoiJLoEgmbREh/VJKlr4UeQK59
	SBtqV18fk2jWBx/n6S8l5udNaGF01h5HGkejaGE5y8SbeeA7IOCKgcWe3jQqE/xyjfkeJ/mv0VE
	3e2nXCUV+3vmOB2SFtI1hHuahoLbx9Z07xdgd741+/ma5hfwKLTvoBARe4luFA5xa55hB9AO6k3
	pBjicVdgqYRpQL2Ayr5p4ldkQrAPD8BDsZnSXug0ZUQsQIBGTZt2MKFBcqpJaMOjgQXoM5E6CBx
	3yXrOEYRcP1DDKCasO5MnZXzH4Qj0sIbIH8jXCVubSRBIE1lAkwU45xq7XolnHKjWYyk20CuyWx
	xhUNgo29rnWb+dakyKBCGJbe6Psd5UbWRiAAfsGWvBTfvn2SDrY48M2uwODM=
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr2733735b3a.23.1780481689017;
        Wed, 03 Jun 2026 03:14:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:c90:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-84284f5f588mr2733703b3a.23.1780481688493;
        Wed, 03 Jun 2026 03:14:48 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:48 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:29 +0800
Subject: [PATCH 2/3] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index
 invariants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-2-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=2183;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=xryvc3WEeX6Eg2MpUAaAvXQdss2b3pJzRlW6dcfR2XM=;
 b=W7rrhdR9oZq9h/xeDM4l2ttYCLekP4r8zRmTb3sRZ/mfXd4ngOI4iO9OkHkxPf/p+rkR2SjVn
 02lc2TjGcE1D/VPblg/3GjpaHaLnOLH2k7yM4w7TbSYwiMofUxiDXGW
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXz+m40FbTPu/2
 foN5QcOx35OpMu/usbYmlTDBaTYR+ZC0eiw2TGeWwDlSjVcvub5Tv8MDUhJSH4Gw5JlhibnBSdO
 Bp7RaTjbN7hqqRpTk2A2t8liqFuSgjTi4vMKYYCgnihiJpcYe4p3HjR1qchOjW23UFVdrkIVequ
 b8IK53RnSktqktD8PJXQI8J29NbcOb4FamcaL5RDlnJL8c6HoPwsv3mnYIfbQSX9n75ItcKg2jq
 v5RFmYV+EoNP2WgZjJeeWfMPMMP0OH90goTiPz6n5iqloHh9fmLb970puGgsaWYHS6oijAa4jFL
 EcgDurcbeAahawyGEz2hOumIL4NR3BLoVlStZInS2yrl3Q8Fq1jRiRqGtpXRCmuAM26v6ADjdge
 FVr0Y6WyvWtuxlUqhtIvjKTdwESRoP5XWyqUp/9dB4zNCzDNabqnJ8Nt8s5dB/BKMzAe5azAc8e
 E0g3apkYuG7LCOxBkPA==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a1ffe99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: cVEDFn5dSKMJFJStgMfK3XE3lkbCERH7
X-Proofpoint-ORIG-GUID: cVEDFn5dSKMJFJStgMfK3XE3lkbCERH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110928-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chunkai.deng@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D503D636778

The FIFO read/write helpers assume the head and tail indices stay within
[0, pipe->native.length) and use them directly as offsets into the
mapped FIFO region. If that invariant is ever broken, the subsequent
memcpy or memcpy_fromio would access memory outside the FIFO.

Add WARN_ON_ONCE checks in these helpers so a broken invariant is
caught and reported once, and the out-of-bounds access is skipped,
instead of proceeding silently.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index edab912557ac..42ad315d7910 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	tail = le32_to_cpu(*pipe->tail);
 
 	if (head < tail)
-		return pipe->native.length - tail + head;
+		len = pipe->native.length - tail + head;
 	else
-		return head - tail;
+		len = head - tail;
+
+	if (WARN_ON_ONCE(len > pipe->native.length))
+		len = 0;
+
+	return len;
 }
 
 static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
@@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
 
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return;
+
 	len = min_t(size_t, count, pipe->native.length - tail);
 	if (len)
 		memcpy_fromio(data, pipe->fifo + tail, len);
@@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	else
 		avail = tail - head;
 
+	if (WARN_ON_ONCE(avail > pipe->native.length))
+		avail = 0;
+
 	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
 		avail = 0;
 	else
@@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
 {
 	size_t len;
 
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return head;
+
 	len = min_t(size_t, count, pipe->native.length - head);
 	if (len)
 		memcpy(pipe->fifo + head, data, len);

-- 
2.34.1


