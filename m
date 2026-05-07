Return-Path: <linux-arm-msm+bounces-106378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNPLJYuP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EF4E8F80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12E5E30D8AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10FA421F0A;
	Thu,  7 May 2026 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZG+WGyRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUfUswVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD53FB7F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159057; cv=none; b=Q87uc0d4KS3IBfuLiQCnOqKGYV3FbVUKT8bPlbROzhnDGF9NXxRGOC1JgTpIyQG8T/WeDBu3qvOaYa2pmGFwkITFAU2HA7SwTNEGCyH/iPD1enmQCF0jI1yIQC7L2q8KWY49j8nKshzGC3qtfL3zGvL/GLavQBK3dLNmiiLNBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159057; c=relaxed/simple;
	bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRrC1g6jxriJT6mCf0ndbInwCHnX2U81P1mx2UCXld5C9a889u3X63YtPE1PVmRFd2AmvdHTlDZY34WjA1FdJDbKHem9bMKJeRYJ3nlzSKaAo8cHPnMGk+xpRuwtE2J+/79tLF/prqxTYL/f+7jqPEcoZNHxjYRtapLPz7irVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZG+WGyRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUfUswVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A70Sp026476
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=; b=ZG+WGyRqHDvOsl96
	oAjPaXEzqoZrWjrQ7lUrLNR1vY2jdt/gUHiYAEadYdgJVY+6QUb+YwL28jIt0cAv
	BZuv6bqXUhPBtmMKQGY9mqhO0S8RT58N6jL6V1wx3CjKieCO2nv+qqRVjrp9RcRA
	732AaqfsT9iRFvMKV8EdyWESJVrAanxURFgFs8iudMsj5Kcmi8JR/b1Kum8kQjyG
	egWR08CE/gEcbDr38PpKMcvkvHtDTf6YUo8EFvvlYgx29/xKj5xGU7JIauWp4+mO
	zW0vizXlc+U5BTVCkh9dY9uc3AeSeVaj9h2+5Xi+Q2kQ7oPvPWMHzLBQA/urT1l4
	IWB8xA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t1yw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso9465465ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159054; x=1778763854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=hUfUswVZYG/EK9R9BTGAZCGZ3+o2Lp3wdT1v9ju9pCZ4/KTpc2/HpkZVRzFahgOPMs
         ak0i5MPSl3kwHhYDrlbVTpuBcJx1bkmph/6A8URXoDdvDHPdcR0D8Uj611BERjsp+v1G
         414JFvWD3mmTGaeQsTAO92+l5bfNdr6XnlAoNOztFW5JlHcnlhcL4Hp3UEjuENKypUYF
         iXIwsI7h7Y6ohKrubGNZUxyuQllxnItQKP728L8a7YjGQzDd3VA/D2cOYu1p44CV83fU
         ybovX1ZwcL7bM3sG83nNQYcZD4ddfT+i0dLpjsOEx1thOKqnL7f1BT7pHvUGC4pnHTiK
         /JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159054; x=1778763854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=T0+iMv8/xbDCGvHHse7IoGt2/yHDlxWBEDDv+YcCKk1l0G+LQOkblAD0TwnH9koU22
         wLyETpGlKz/0R7x4J054BKAhtb5pNCUnESAvrKTlURDUCd36adU7iPH/ra82cPvIbwOq
         +9zLNRij8MGSxxEA8pXwiuIjQWgH+WI2UNMLnmp1YzY9dmkDrssKdwMgAKQPj2jM4bbS
         odthkv70lDqPIJXkvzR/TmjVrUUNZorcV1m20ykoSMHlK48pPJ7AxwX+YOpWwXmC8AiP
         49HTQncwLG3MBP0kUcudghEE9vDKVx4lu0LC6pzkqWw16KqLkHEDUfw0fBTqhbinW9+H
         3xXA==
X-Gm-Message-State: AOJu0Yzn4ZEcR13DjDClvvevIEkwHc2aTNOjT2mlaam+PGDuaEzpFvp1
	HxZ9cfMzA00JAo3nGBjpLvuTTfuPnfn7j8gd5FKPKnwv3Kb79+gK4NBhSV6znmNcZ6GhHPlWkt8
	EpMeV5NrIp/MNVxDhBv2X5ptvc6L5iSHK1k9l57UHXb2KTI1RUoYNw/VVsi/hsN0HNNVq
X-Gm-Gg: AeBDietRWhUkZpnoIrkixy9QuB44UJP4jFF7+KzP468+eEWEsEHJlmCA4UkXjNcBJXZ
	tEiqXVs9qIOCZWqUJobo6ldJq/fIokoD//em9Hkqc2oJAMYpwWS1X3crJhwlHxi/fYhhsKwziaS
	9Cu6hu6HiXCMKxSISkG7cd9WPR+JdQm76XYotAgRqV+irsNxx1lMuiOVMjoVq4lLHNhJFRKBKLc
	334JY9oPOP3SXcN5m9O3lMTytqu9VAbW5fFSyDON76GRFq5KqMrybALtUJciOhnnSwwtX/D29Ga
	cC3PuacNKUxXfSxcwEK+0HigBmUuny/wu5Up/7B40ltRhkcwyqmD5juL2mLfFiAoKyO4FkgQROc
	SNM1sSbIQRCjaSbuc/3M3ubJErtZv4doH3ZBkTDIoVMnBwMJiedCDfzscm3g+l961IzoCbNgHzd
	Dd8BBUJpMxqHZcFZkydfhgUrdmcJxwC93cPSeKxorcMYAw6g==
X-Received: by 2002:a17:902:db12:b0:2b4:5cea:f619 with SMTP id d9443c01a7336-2ba79c10b84mr86598435ad.22.1778159054204;
        Thu, 07 May 2026 06:04:14 -0700 (PDT)
X-Received: by 2002:a17:902:db12:b0:2b4:5cea:f619 with SMTP id d9443c01a7336-2ba79c10b84mr86597625ad.22.1778159053511;
        Thu, 07 May 2026 06:04:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:19 +0300
Subject: [PATCH v4 23/29] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-23-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2HBa1QLkqifwL/HBfz5x5nw7s2kRgdvsGq/
 Fnr28Pz042JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1XqyB/9dxAVdmuGnKS9oEtRY58nIh2ICpjHSxdwoEWDJ8ahzt2MX+4+9PZg1bwDw8VRYOpfJUZf
 8uWOOIJy3XlHhyCrZt47Y9EWT7mGQ641L7+/Byu9drnE6Yca87Mrj2bft4ysOeVSBqSDzuKFeW+
 sFW9KPECm/JGnYNxYXiYvOQlYgG/NzKpAQpnaHSjcAJmL8UEZayqaSHusWAAjdR5oizbRe2y5dm
 MQ8g+knty/WWrjGvdXDMo30W8hQjk91GswrbDfHxRiy92NzlTKYH6L4oZN0x4j/5CUTyb0Qs7Mg
 OJUxhtcRDFP6huwS49k0dX24NYlj5f0EeXkb0R+hifNUGdKA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc8dcf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WIOHKLvtKZwthBlmpHGzA8VCPg4MBQln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2h12X/M+fM/4
 cQSOQE4H6FRbfIwQDa1CUtBYJHqnfKuTeexqt+OS7OzLgQD29Z4hxNZPxasXhcdCFry8Fc3oj0u
 XUyUwZZ0odWVCn2Z5oyNoMvt7d0+us5Emg32VWiCGF4pBB1rrFJeflkU4WkE+1oEkFzEL6oT4hE
 NeHX5EFIRFwulIPmaLE6cxHHuzWrCZSuS74JKf1uwIASKRXbNknZZQGQFGPbL4HVSZanydgkB43
 OFPET4agNugJ37FZid8BV1P744Y968LbZ+hufsrGzk/1fdb+73eKwYqXHuunuMp3H0Qae1usfoT
 I2evkh3HapEEYoqXwucpKACdwHdJkb1yCDlFiSKhKkmUb8fD797bqBc92ayY0F8fdYNM/IytwvK
 NVT1IN+X2oAO/9uHp5HQaaKfWfbXyGTvPG2jtCiR90w7FQBSawb2jjpi7Zvw3YSZCLSQOnBeLS1
 u6dhtcf2QCa4HzoeirQ==
X-Proofpoint-GUID: WIOHKLvtKZwthBlmpHGzA8VCPg4MBQln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: F01EF4E8F80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106378-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 83d2c2a7116c..0b5aa9d0343b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -75,14 +75,9 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
-/*
- * This is the best guess, based on the MDSS driver, which worked so far.
- */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


