Return-Path: <linux-arm-msm+bounces-90228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLKpNo0/cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:17:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF768903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3718C307E964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B306352FA3;
	Thu, 22 Jan 2026 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWlLbwaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9COu89r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA13559ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094633; cv=none; b=TVEWPzj7PDSY78F7Et8T7uYqmEFwdzA/TcYIilp+6uHITVLv5pk4phl9a75f4FLax3AQiNeDCx1ilgE8D40zpQ7JosjJsI0sg5T7C1j4NJGucULveqFdOJjhJP08lUzbLn3NCWoPnkmRa2+p+GDXU9cROYqa0VzPs7rl7F6FVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094633; c=relaxed/simple;
	bh=C4Hy5jJgJFgiJtT3bfjDFpiGxmP13VJ69+n4ZwRm4iY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s9v9uQT5oo/ux4fiPGe0GNJ1+DZGzoXSzLuigkSXOwCzYcQb9m62Z2Y6J3p8xN8iV4RkemUAjBt3FfHPcVZtNwyAzRIF0a/M6gwaAZ5ruHTkNrEUiEF7+/L1rAHnycurCV90Q+dkw1exv5uXX+mJtH7RTL28F+igRmBREbX0z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWlLbwaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9COu89r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MF4iIo725891
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ALflICnLm9d
	AF6K/Wk1dDN+VobBIOAmN5UmZDdeZ3Sg=; b=DWlLbwaU89OwpYB5NALN5kI0wFo
	6SdDodiRPewHE7XycaYJDXRV6Eby2hpYMKW412A9UzSblA/fHA++H5OZ858AUigN
	AuSPYns2szMwS7diSmRV69XRGQcpgZXqSq/o90ueO5tsG3I13lmqtGAuD4KLBFin
	SxLTlNjZ/AxR0Lq7F+zPiIeU8/8O3wBZaOYLoq7lBwpIcczzllnQxFBzHVfI7mwi
	H1IK8epNZ+9rzx5nOIJ9YAO3SWNutC4a+k8gUz3RXNYQUmrABrxvhJlmiPSmPYWS
	egB60wp6hbx7d55wUCknbfmdA7fFRNaZ48uH2Hw9RAZyEvAVtFDvLBReppQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bhffs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:10:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f4c1412b8so182778b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094628; x=1769699428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALflICnLm9dAF6K/Wk1dDN+VobBIOAmN5UmZDdeZ3Sg=;
        b=R9COu89r+IaD3z2dFRTBn1hAaWV2F2u0F+DVwSwQouLoHiRsHCtRj25wC89YIjRP3N
         pEdduqzdBNbsj78BAk8xub71Y37Et8CmrHrurUl0XrRn2DomQ3tFusJUv4i1cHtZnJuE
         da/fQ41sEPAexCFN1N/HljtD7De5L+9ubfVkS77yph9RnkcO9xgWz5wzUuN8dYKc5JRq
         GCSpgk7KtCfG1TFGHQruyugU4X87MSQYjrAhOp3n8qmytgedFt5xR6iVE0TEeX5itg5y
         E9W5N914XB1CJHiWivPDvyv2t5zjSdiAQRjdZMyXN8CPh6FsqGczkbfguQChsvC1Vu8U
         rAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094628; x=1769699428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ALflICnLm9dAF6K/Wk1dDN+VobBIOAmN5UmZDdeZ3Sg=;
        b=ORkT0lRlgTWviNbUKM2FjeK11MQFoRL2SPzo23dKBV1Slt0mtCNzwOBDepB3iEYZ+/
         5S6m7O+aWfm9KK32nvqi9JHsQKZsD436wGeycxP3CtfSk3K59scxdY5lg5+UWdNJn42F
         LMJNOTBQov+qfdRQ0vEbo3vTtHMrubmBrtSIX+Dg8Day0LjZen3Ppa3gmM/er9HMkm2K
         PbE7z2gYFE5r6lTNMg8RRJ7pNriJC9/Su8sSjrYrB8xxkDcoEX12Na0dVqqbFQqV5i6c
         Wh6c7Hl2hr0+0cxkTYimhWGRuZDkYbSZbP8gOzpPQ4lQ/WbvYHJ9fcUa4Cphro/198LS
         ozcg==
X-Forwarded-Encrypted: i=1; AJvYcCWZg+sjL3uUvNfSiC38BaR3khkmpTkkfjTv+pCilMz97EWB2vi7BttqQ/nTyBHfesvHosQRHbTQPvGH1ZTz@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMw0DvFfuxTsRHpeOv0RQwrLBH+5QcRL3bvT/H+fS0aJAb/2R
	4sPQCPQQ9CQPjOzAPXVigdL5VamY5vZGla0ztJOoN1Rx3MILMEswTWa8sM+mAEfonP1IJNj1yu5
	RUw2iSgEAgTaz41DWJ1RXl1J/yUFb/m96cWltfvyqD5HM3ol7KC1t0Fo6IWCCLihF7el1
X-Gm-Gg: AZuq6aIQx1hlOTo4vFUZ/AcyddnsXnVFEay6mF3xlNMjCeZaPM4d2k+9Ix+ELDaRRtM
	6BRC2C8W0ntLh9YU6cm8LKk74ILZgxkZ6MQXWG5TjdInwfXxY/yEpoJit+eOZftT0L3n3yc6w59
	0tTFYxXgEQ2dp1K4UoZ30887EfKsx+BtdHFUSONXXA7aVvGmbimEwfiEr9a4tqLykLalpK9MMcM
	aKIW9xnYQu1FQJGObfbrPDRzJDq1XRkvGyGneA+donME/kzXXgVSiP1o6ijRTiYsnM2SoM3OhVw
	UDKTfy6OYACXRelqMBrv4+qCdizuAgAj4Adf316hQikUMUvitJ9lSYi1YFhBMjGF5zcqbQgOY2e
	1wVDoUEb6C1MFTMGwZctEovgl6y34bDnxZ8CJ6VMncqA=
X-Received: by 2002:a05:6a00:4b0f:b0:81e:a17c:b439 with SMTP id d2e1a72fcca58-81fe87e9f3dmr8191828b3a.27.1769094627760;
        Thu, 22 Jan 2026 07:10:27 -0800 (PST)
X-Received: by 2002:a05:6a00:4b0f:b0:81e:a17c:b439 with SMTP id d2e1a72fcca58-81fe87e9f3dmr8191782b3a.27.1769094627030;
        Thu, 22 Jan 2026 07:10:27 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8217c258fa7sm4328182b3a.17.2026.01.22.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:10:26 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 2/3] spi: geni-qcom: Fix abort sequence execution for serial engine errors
Date: Thu, 22 Jan 2026 20:40:07 +0530
Message-Id: <20260122151008.2149252-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4D3HB-9RNTLhsCEoXNw6_in7Mm7EIo0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNiBTYWx0ZWRfX/poikWOiXO+S
 9damAtI+JCNcPhFMjDsasJM/MKAfbhaOweQPfAJ6I8o1s5aQDwDIe1tGlu5SrcK+ZhgY+HX97iP
 apMwGGPUPh6FY9HVzlG76i0BR+Ot5oxGjlntmcmL41G648ZRVwGgw4bwvcQwgZi+4HQ5LFM0OZb
 ws7PGYtqsqwxPevMcCxI8rcM6RylYqa6dZBJQOfaA4vMLXVvXVQIMuORCevrojQnzpB7Bj1++TC
 bUxwQe1MQXYa5vRTjxz6Zg7YcZXcq5OBbHWR5LFv60aTdD5O7Jp1sBNYy92bIqNxiCu6zuFT0I2
 b4lzlkdHRDpAHVQLxS54qOg0a0dxMWQvcEhJljD3zSNkZZA3vxqz6B5fIdPpI+zbrJcJJS8Fq/2
 mBXTGznTvT40FsXMCsBRir7FneENYY3foXfiBfdvQN2BCcN+EqY1ZDw09Zkc2xBqk9yayCNOYCp
 tFXA3ssKPod+iOW2bpg==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69723de4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PwoySFKYIoUPqChjOH0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 4D3HB-9RNTLhsCEoXNw6_in7Mm7EIo0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-90228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73CF768903
X-Rspamd-Action: no action

The driver currently skips the abort sequence for target mode when serial
engine errors occur. This leads to improper error recovery as the serial
engine may remain in an undefined state without proper cleanup, potentially
causing subsequent operations to fail or behave unpredictably.

Fix this by ensuring the abort sequence and DMA reset always execute during
error recovery, as both are required for proper serial engine error
handling.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index f5d05025b196..e5320e2fb834 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -167,7 +167,7 @@ static void handle_se_timeout(struct spi_controller *spi,
 		 * doesn`t support CMD Cancel sequnece
 		 */
 		spin_unlock_irq(&mas->lock);
-		goto reset_if_dma;
+		goto abort;
 	}
 
 	reinit_completion(&mas->cancel_done);
@@ -178,6 +178,7 @@ static void handle_se_timeout(struct spi_controller *spi,
 	if (time_left)
 		goto reset_if_dma;
 
+abort:
 	spin_lock_irq(&mas->lock);
 	reinit_completion(&mas->abort_done);
 	geni_se_abort_m_cmd(se);
-- 
2.34.1


