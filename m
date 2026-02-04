Return-Path: <linux-arm-msm+bounces-91820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDVcCUN0g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:30:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E1EA433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D8C63017F8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A267A428461;
	Wed,  4 Feb 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuwuN3SB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRrtNAax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA34427A10
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222565; cv=none; b=LnTTI/VkJ+cPIGAwqpCnE/eEUCvXLaGw+vMgGjjtrZghC34u5BtQN5MX87FHC3mkvgnZZWqnKN5GU3/J8tFadBlDuLC81zm41WWH0ZXX1jj/gvgyinBPqFpy0to6wJBnWDsVmp6KhZPTbO9HJyP1TLZeNHsO2Qoa/+12TkeAsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222565; c=relaxed/simple;
	bh=68oM4+XC5nRFzWgW83ZVy2hK9lV2X8Fgc/G9FC3yFl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=etV4vdnjl/kpIjmHczfs4gttLPvyXsp/NzwMZP5bXzd3NK/dJTFF/N92su2PDlKroHLWy91KQOj1HDkhwWQbbYKYPh+jySePGKJ8hHMKCCrot2818LeqYp1/BIf2/XyTM0oCwKZJZ2MxXSTtKcwFInc7isjnBqtbZjgcJ/o9wSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuwuN3SB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRrtNAax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIQqR898842
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAfwiLiuSak
	yJDmAWGtn9e+lRT9itU+foDd5KST34eo=; b=PuwuN3SBeNAcBYnunF7I8QSyPyg
	tZMaE9VzMa86TdUpPr8BFdGO43Jhbia9y2vFfBx6xIL0uE1rzkWwwdAixYDxIhwK
	UyUvfaL28iYA2sSmenTEEH6Jn9x31F3mD+3WlyvufJEZpB/3pGs6xMlEXm7kz8Rw
	cUc0jU6/qStyLMWCVqIsAtLD7TwCVEyLttSSCM1Gy6s0aI5uTD8FO4egRcuOgfht
	G5Q1wurysZbDjUergFKkDFYXfJ/79MamiMTD5fgQKb5/l08kpc8qM1oJpd1hI5xa
	wNJFWmQtfaSxQBjNS9bvVR0j0V7PpR2lXaY9LXAw3A4t+I314F9KKkXM+fA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445wh3us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:29:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c67e92aad79so2758409a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222563; x=1770827363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAfwiLiuSakyJDmAWGtn9e+lRT9itU+foDd5KST34eo=;
        b=WRrtNAaxgZaRoae7WhBfQ4b0/5tLyDUGeityjUOrag78q7WBFdtTitT31bEZkophJF
         iGuxQG7sO9Q+sIIhn4ROGvQ7bPrR2WAiYc6NlneLf2vpFih/i5ykPPVx730B63HcomSt
         PJLYkohpQeKnQTJzJoSOKJZU9ohUwN+8vD6K52r7EKlGiK0DnqrGOcnZW+RvR7gioOtV
         4/qufHHacM+cK3iQnMPNDRHF2tbJ75mLhMbjlNpBR2mCuJlbAwyfFHRMRtBHbJ2D+hNW
         v8LovyjR6iNbJcJWt1TQ+gPCcwDidj07FM0zGefi1sqsB0oOOmt+Gx7zL3S2g9+w9PdG
         eALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222563; x=1770827363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAfwiLiuSakyJDmAWGtn9e+lRT9itU+foDd5KST34eo=;
        b=I5WOS1xDDwjgEwVdyLfN/yne6fV4QdHYAU9E8DjNLLSAaPDSNoiICHS9u+JvCEfPLp
         boofRok30n0Tyn6o9fK3qdL+q3oNoa7T/4zE1/kiIJN1Oq7Qw05hT53GkMBAnwMOINv5
         SwS3/MakP2XVzZVOvZeAA+FNn9NfYROuVYriM8Rgl7ivewqBmnCClIt0CXe5+PcD0Q0B
         C2OC0MDAoglxafXFUuZlP8vHJ4xICep8d5kd95/XQ6++rTe9EkqKE8a/hQwY+rXyb7DC
         D2J3gYWGqobJTNWym22/HZ57N2FDDn3hHmQ2wjl3VW9gfHF9fFNImA15C8oafxsPAjPA
         xzYw==
X-Forwarded-Encrypted: i=1; AJvYcCWX8Lid0YDrQVIHFo/PUtELIo+vWcDZt+QlNV879TM17ZTh86PjCp/Of9AOOvfVekBM/0hTZ8xhZ2ZG7w7h@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPjXFL1u94Cr3LhvfiG5HxSTp3ZiNbxHoaIHDnn+Ouitbsi4R
	o+uZBb8tIcDMZ6iTeSs+4K+l+OdDB4IIzF41Wno/chOLRuTxljwANXFmGgeqdiA8PFSO01Wqdte
	YMGj5OwAu69uWIBejh7uzJKQh1NlSKoxfWy+isEyaTKiZmXjZqiOwsT2rrQc4faHPx6Z8
X-Gm-Gg: AZuq6aJ2OP0kXDOY30FLxSwCktqp0OjGorHhVd+PBzcRow96pvGw15IWrAjsK9IMIqt
	hWN+VbOWPR7BvUBRwqq/t6DEq3AZErsqSb5/06TU+wUQToSyAhuXFXqDcrCdOC3RN0/ZYFLLPK4
	bA3ebzlOmE98F/V0F0kDfve7eHjbbk8u2vQa2GwxfPT0HNMkqBUj73Y/N7y5DQpmhOwHlFX5HJN
	ZEkSjAHjRlLSuNGkzHhd3kZL+fqgrDxVKVez1cLWI9q1Su55OMTCb/nSPtD7u4uNpSOATzCuJl6
	Fj3eT24XIOXcrK4ID/bQf1X5rHO1I/VJoOKrdHmkBjCycVbUbdTTNrZiXrHRq/pKK0Fh2b3K6AW
	ttC7ZLlYTspqucnJ5oc6OWyE1fvq+TZDjXbaXDOsQzUU=
X-Received: by 2002:a05:6300:614e:b0:35d:d477:a7e9 with SMTP id adf61e73a8af0-3937210bdb2mr3917174637.35.1770222563385;
        Wed, 04 Feb 2026 08:29:23 -0800 (PST)
X-Received: by 2002:a05:6300:614e:b0:35d:d477:a7e9 with SMTP id adf61e73a8af0-3937210bdb2mr3917152637.35.1770222562794;
        Wed, 04 Feb 2026 08:29:22 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm2546878a12.29.2026.02.04.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:22 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 3/4] spi: qcom-geni: Drop unused msg parameter from timeout handlers
Date: Wed,  4 Feb 2026 21:58:53 +0530
Message-Id: <20260204162854.1206323-4-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNSBTYWx0ZWRfX2StAP467dpJ+
 s1BCP/JCRWwczIw90L2cYj2QI+ZRvZjFCaEIfYPAeZwxlEVv/7VtzstYA8eEU0jdfu2P9ymHW2m
 e3GMbixNLW6ao4PzvMvK+gYFqKZc/octsRfkxP+yrCNbZGXoK9Xnymy657U7b+ffsPzEsnnCs+/
 i7kE0nZqteEbeXYc2tNQwmiq92A+QGUeN2cvwzAXCTIfezAQQPRvdaavuRiaNovgwzxUalIu1ru
 OqATC8v3I3cYBhAAxK10/blGpbIP8r+x7ks2MzqTlXIilr5ghsLmSPZxMzIlZX8KZ+X7utT4Rk2
 eDRN5bySapiXUxQIBND76icwCjM+s/IRcG8CERaP3NM5UCqOn5++pdjjZbKAwXbzpxHplpHp0DX
 1UALIlPlvFFr57JZWoVBTGedNRp89bXn2LdlyIrvEujvi9yGsUl9Ly5jAnhy/EzStmB0NcFml8+
 sPqHVoLpqdZQPNamqdw==
X-Proofpoint-ORIG-GUID: qkpCJg_ThZLjdKvmNFYmOHuFPyoioHUW
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=698373e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gJUBjM1s-3uNyhB8e-kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: qkpCJg_ThZLjdKvmNFYmOHuFPyoioHUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91820-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D49E1EA433
X-Rspamd-Action: no action

The timeout helpers (handle_se_timeout() and handle_gpi_timeout())
took a 'struct spi_message *msg' that was never used. Remove this
parameter and adjust the callers to simplify the interfaces.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index e48aea7ce681..5077dc041e3a 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -146,8 +146,7 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 	return ret;
 }
 
-static void handle_se_timeout(struct spi_controller *spi,
-			      struct spi_message *msg)
+static void handle_se_timeout(struct spi_controller *spi)
 {
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	unsigned long time_left;
@@ -222,7 +221,7 @@ static void handle_se_timeout(struct spi_controller *spi,
 	}
 }
 
-static void handle_gpi_timeout(struct spi_controller *spi, struct spi_message *msg)
+static void handle_gpi_timeout(struct spi_controller *spi)
 {
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
@@ -237,10 +236,10 @@ static void spi_geni_handle_err(struct spi_controller *spi, struct spi_message *
 	switch (mas->cur_xfer_mode) {
 	case GENI_SE_FIFO:
 	case GENI_SE_DMA:
-		handle_se_timeout(spi, msg);
+		handle_se_timeout(spi);
 		break;
 	case GENI_GPI_DMA:
-		handle_gpi_timeout(spi, msg);
+		handle_gpi_timeout(spi);
 		break;
 	default:
 		dev_err(mas->dev, "Abort on Mode:%d not supported", mas->cur_xfer_mode);
-- 
2.34.1


