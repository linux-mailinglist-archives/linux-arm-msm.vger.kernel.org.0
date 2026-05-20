Return-Path: <linux-arm-msm+bounces-108786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN6SO/bMDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E568B590645
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56FE8300609A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50C03033C6;
	Wed, 20 May 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub3/C+ZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AS7sc6A4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E63E9F71
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288688; cv=none; b=TfalWBLz34lcS9QuZHIVyY1McpcxvTvndAsd/xlhXTjUitySmc/r15NYCREa9D5p08yl8gua5Fh83/+yn1O/BIvAkV7tX0u5gQCZaFZIvU3u8BRUXnSY3cWyIwzYH9CVdE10vGdf/fJOWAtwmjBj6whEF366kUhuYc9OjcybPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288688; c=relaxed/simple;
	bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uubkY0rNnGjDhf6+g03NcF1Iau5FewSQEvwZQsmYvypFDhXDc7vqUXys3lartdeolz9tKQLeonFdXpUL/KWSIot42ANfiNgkukjBDxSoKAVzJI3ryvAEHnTIZKyp3E+grngHJcIarp30aF2Rwe7EJO0+nfRnl0N9Jmy0ppONBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub3/C+ZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AS7sc6A4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXYoG1797760
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=; b=Ub3/C+ZJfbhY6/ls
	axipwBKPQAqBpSWIq2w4QYZ90cJmsVCNNS+ZnQGHWwVP/oL7qg+0MwMBMCuIy1oA
	sMuUSl4hCKbD/cm9MIfN48FtHxKNbP44NLlimQXKdQLI2lW37540TpgxPSJG8Q0Z
	mDWacPbAGEUJYxlNG7vn1wmtCgIOp9ie/L69an/+CnDaErie0LMz+dlBZ4FG59qL
	ZMcswYya54H7DpVXBTHzLLSmOXUjEmvB/8CZ31zanZnGxMyjI1T/jwFb0QvzZu6K
	TuJ/SPVXi6CkS0x7CPQUEXmjw4DAuZFTrJppFQIVHWUM6DbLXZx/+yJJFcTIo4ku
	71al1g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu09yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fd70270f7so7862214241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288686; x=1779893486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=AS7sc6A4Xe+W3+eYK4UEB01MmBlzlpmgKjkhNGgSXvreR7sP7nmduEtg/WWBc5NTcy
         gBW4+dttvLyq4MA2ZdBFq+2MCvgsrnNR7JcgUOgpDwEgzRYXpvIxjstEXgXXPKVSuEsf
         genFPd1r4Uix1bcKMevhDWp8BiEaxVvJKN0Ek3v7i1p5PaXiBwcX1cIlTzP0Wrb7O+rN
         ikjQBiWbimADl6fwukGZ+Xw23p68oXQmP4/5z3Hjag2ZvgicUQQ9gveHhAuJ0yenri23
         VFz/k+Ekuamqq60i8/npv3Q7wgKd8F7e1W+zkJDVb/BFaPcE8QOzwbPsg7Lhx4XjgI6z
         U22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288686; x=1779893486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhLMvVZQbF3J03WMc2id/1RoXxcDZvjE9wQx5sGd7p4=;
        b=T1dY9GOK8xVw0s7tkADzmPr2xCaff1IA2xDOzm3BRzuOvWKhuJJUQyDzWGq2VMT+uK
         Xh1pHTofkmOBmexbgkgmyr0qwWc5IPdDQCwLwBbWS2Gq6kiOEZH0bouC5g9oJa4WGg6v
         5dq+hfMjHWch37kABVtPdsGqeTTL20JuzBt1L5jL393zh8rGH2vPlu//mmbHNGAoPe4u
         NxzNVgtwxOih998M0aEKR1b/6nHUPp0lmHnXnA2Iklw2EI7rdH/F0BO21vW3s8kjetXb
         4A+hBhpa2/ZWOFtfLZcPPAli9U7fy3yCvRCDc8Ybu/DmdvDhlVnK9Ra5+sokjz9Om3h9
         Ob+g==
X-Gm-Message-State: AOJu0YxU43+nOiX/gROgIXIvfet1kqiu4kBPaIzlbjCykfWzO7IbA8wO
	y9rGaIQreQDH+m9wM4OaQL6linLa74fenOJDxv+sWupW9DvTpF8588nTgcEAO0gQ9ulpSe6PrxU
	5WOKpK0suqaMCMCShsubqGMD8wrN1rJvp354N0pgamD8jbEdHn7uSa8ZCj4WhVOZc8PVx
X-Gm-Gg: Acq92OGj5ZF9tLHqsZq5PYa8gUFg3iuRnAgmKv6nmZ2OYMXwflB0bSAhqPAov7uRhom
	aJx5KpILJ6+BFLNYPGFVrVRc4lnUTitcPFYskN4/OP6D94WIOCBvtMadd/JGbNoFe7yID2It0P7
	kbrPa70tTyyqsdh4vn9TAETbtR19wD57mIG5OlmvV8mzMKVQRPLGYIO2n91wwD4Nk8u9vqXKUrG
	zous8cSl3tTXUpIXoVRcGtVmGHo44pSZIDGqQfN84DRNqcyhlmHF8SiSp3QT3yoCvkW0XCMsrlJ
	Sx8gR3Srvj+sJgxAttkRM7j4x5agVtZRA3YJr1Rea3Rhq678PzjnLJs1TLUaVKxAvVPEkgMl+YN
	Av9/areOxDjSjO5nuaY00D6j708/Koe2vDUIsvglbEjHTL0BWqgP7ISSBt3oHyvJ/OCY2bA2UMa
	dLup5YCu9kJUEkXvzwkVVIN8Sj+4RfRRaokY4=
X-Received: by 2002:a05:6122:179b:b0:575:2ac3:4166 with SMTP id 71dfb90a1353d-5760be898a1mr14028615e0c.6.1779288685702;
        Wed, 20 May 2026 07:51:25 -0700 (PDT)
X-Received: by 2002:a05:6122:179b:b0:575:2ac3:4166 with SMTP id 71dfb90a1353d-5760be898a1mr14028558e0c.6.1779288685286;
        Wed, 20 May 2026 07:51:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:08 +0300
Subject: [PATCH v5 01/28] soc: qcom: ubwc: define UBWC 3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-1-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0jnnTKmBVzx8ajx5YR0+k88TfAux9nzkeECglU8qUoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcplYiehb7WoqTeu02NUv4h10NpVZjPhbe8EM
 6ruVayulkOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZQAKCRCLPIo+Aiko
 1RJcB/9RW/moB8fe/PV5gy+RL/l4+HEVXkDKQX4mRW/3S8f2W4iEYaITIEeOIFX1mfQ/czZfVhq
 H/yFBOSA1NV7X0xsN4oNLJuQzeBfr5CmzLayhVuy6lWQNUAVMM/B+drkm2Ddym3f4evfcU6SddU
 q34oAMPW3lb3Z6WvwpL+MHx4YL+AqlwZiNwmtQG6rFG7WntaNnZw0+sjYVulRaoGY333QxXffHo
 GNW78p7+v/GOJ3EMWMrnf/nsyaQRWV74UKqoBSch56VyDNDE7HthLnoYpCgCQP2o8CGDGxGQV7j
 OIdSB+bWJqvQNCmcrUkWpY34g4F5XoA4u00BaoblFCJiK5qG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NCBTYWx0ZWRfX7PTWyF4cxvfM
 PSKQu01g4HcDcV3urAgmwqsj693ty+DwvGluG/77czTke2SUkK4xJnzSyOQ6THyATCJLgYGRwce
 MgY7xl/cIf9FawuIoNZb5WZ3fG8K4crcvZWVOWUqOJm6aDgWxtbgmHTDV3Kb4iS6thL2dzWpMr1
 uuPLsFPg7qq80LYj7Lt0VyGCDiO0D5khO6sEJuyq4L3c35zlaw2xpvpF86Pk+Odufn1rR4m5nKU
 lXp9SRgpdtzbi8cPfHqTJUxH5qjOkAwUu2cOMHDbZtV44JvNKIngLw3b6yW15nVIZAVs7Wv84oP
 vMsyh5IPH5Jec9MUO3kkJdxmI5LglfH0X0LxXq1XWFnzWRwcaYhtVesh8iEENbVQwzhszJAz1W8
 c5zx/xjx6HVAvlPECAgotHhX2O8BeSFNy261CqhV2keX27Z8t+a4LZ25slSPQhdrKat5oAW6zD/
 S6b7wQ4M2AJtTzYynMg==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca6e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=o8D1m1ilSIXDguKSM1sA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: cj_IVgapC9i4MHpbjKr_q_fwIIdZtya6
X-Proofpoint-ORIG-GUID: cj_IVgapC9i4MHpbjKr_q_fwIIdZtya6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108786-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E568B590645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Follow the comment for the macrotile_mode and introduce separate
revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
the database (since the drivers are not yet changed to handle it yet).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f5d0e2341261..319caed88775 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -50,6 +50,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_1_0 0x10000000
 #define UBWC_2_0 0x20000000
 #define UBWC_3_0 0x30000000
+#define UBWC_3_1 0x30010000 /* UBWC 3.0 + Macrotile mode */
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000

-- 
2.47.3


