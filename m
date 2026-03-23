Return-Path: <linux-arm-msm+bounces-99441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHZ/LULHwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:05:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDC2FEBD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E04A302693B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E655384255;
	Mon, 23 Mar 2026 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKd5GFRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYe7NaUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE5361667
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307137; cv=none; b=YiVlrsbD1dLyz1u0/MKafJCy0F8r0Hvy7KeqRq/QhsNngwAE0SiLHfrFmcYMP6RX3gp+gMA21uEpPqbf7xfU/6d7lTzG/j/bSnBz/c+eif2fZfiKOpkYX/jjBUJ1XzfCDUwpFYtvsKe1GKJUABD3rE5iVSJT+zRNxfHtbpIfIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307137; c=relaxed/simple;
	bh=wtox0sR4P4V6gdITzpCoMXo4mJqnKdeRgSOyog8ySFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngA/In4uzgK+R/whFRD/kXSNpb8Y+Cv55lDsAtoDUEeSQFnoBGKhp8Q+kfycrKK9hXP3N/42Ker9DNA77lgpT6nkskRUIJP4HSfDknxqvvRmJwsYs+3+efMWk4Qt9tJBtCFGMZF7MlRRtZiigsh0Ufk2+MQbvSb+qW+UTfjF8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKd5GFRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYe7NaUz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrQUU2682372
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EVoCuClul5Imz+TrtFHjX+ZZaFwsFQQSniy
	NOUtP9Uc=; b=BKd5GFRi57jPUu3tFkTGtpouU5K01qVKlXq4w0TKABVdYQ8TRUi
	ClVDGfXLyxGYjFlvxK+VnfcmpVHtlESaW4eJngQ10sO4Hv1QrkpdqoDH9bjalCXd
	7yIRVGzurnKriVDXRkbUfBv35hWMNJnvyDuz7Wum5xbuJ3r7cFbgODt5kAyS1uEg
	HW+0WiJDnZ/PQ2llsQ9uKakFSiGjZRUkUCgxYpYkgVcUTO5hhbI1mo4UAspnU++V
	JiMnTz8dyg9FRFwX+TxxGGOuH9I6ZLnHCplhXkiqcx/khLrxOqbGUa/6zTf4G2ch
	Vwrrwa3DNr+U3th9m4LmmqgPwT962TLggWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7b15f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:05:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so359522691cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307133; x=1774911933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVoCuClul5Imz+TrtFHjX+ZZaFwsFQQSniyNOUtP9Uc=;
        b=WYe7NaUziA4YkXCZ63KrforgKeyvRENbbN61oLBPuTtj2Ml3jDYkaBI9HsH7R+7y9F
         TfWBDZzvRruTOIkOR0qLLUpxFliF7XiPMBSr/Ti40JqAjLJC1uZlcLFzrcWkgOpbCNDg
         JOBRtxNHU19rS1VoAVBXREyuW2KHOnjGvaK86wRt2N9/5q6t2IFObAmNMb2/x/tTH+LK
         fa41OBuHkTVAxbaP+ThZ3Nd4tI1RbVEtWUv0DYmgQ7nCz+KrITe43ChEPK/iolFB4F2+
         wQrh+9IEaHcxPPYJFA56y0RM2M4PrgWqKUELySINlQasttmuxCIO8lCEjEcNjZ2M4UNv
         L6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307133; x=1774911933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVoCuClul5Imz+TrtFHjX+ZZaFwsFQQSniyNOUtP9Uc=;
        b=opM37VGftXJQKWwpbXArRDZZj8zFoAAL2L9X8kwnkBmnUQP4mhR+CwbBzM16I62ZFj
         YQDll2IyG9z76XVXY/39qmwVW6xdyl3BXMcstXZV0VDbSjWo7gf+Fnz5LZirm0yxQKfD
         JGz5JHTstLN0VYcS8xsxTXxdaiy+I2j5mcSXAPLsm8Gh1vUY7wv0Fx5OqBXhjT0Pfgor
         YDVz+LU/QF9IQEzl4YD20GOPrGmQZHxG4+YDG30dykZGru7ACSD+jANMObqbz6U3+ty3
         N5tKdXAOrna7/M8Q2Ymkk8SlwXXsmws74XjRfMMBjHB2ch5iB+/aO8HbQLZ3DuKBSvOt
         aQ/g==
X-Gm-Message-State: AOJu0Yz9ZiAYESTspOMuZFdwqpDsKWnmbih4XSHTLFn+gOcjAafMkU6c
	PXqtxzVspdVonC4Fo3wG2LSYu/6bjiQHCqhK823pxDGe+ktUDRpGsWYnxhfA4bCGXiA0OmjfR2Q
	71vKWZo4eO/r7M8SFiklmBrcICpFMW31LBPlPEiwb6jXh2pze5V0xfnDDpWXfY+JyKvA6
X-Gm-Gg: ATEYQzxsKWIK2WoaMVxYpxpdpg3V1RU1GrscZXSgCUdGg6/VBQ7Lm2uP716rCQniKNP
	F2bBvSlPQ+O/G6JW4jXb97/WmIhEfNkVKbDxSVxh+LgKvKqoCktqwYPNZF1Irs9rEufomoS3D4C
	KB0usPg87bAcxCz/VcyzCrjH0qCiUiZS29zavjMpkmttcGd45MXgZe++t3k3updbf2d7X91PtL3
	RieH6M2ir/6zyYQW0JbXyFhBJGhhu2n+dzMz5NDZTfvVunYN2V3SaCerr9qpNuekECtrh8GlBI8
	pAePfg+8glEkup/oQSBEJmBC7/gmNMu9hsIJR9wEHSNtyTO0JdiJFsBzJHDFSG47qam5RFLNSzv
	dTi4Rxr6qfKc3UT5siBee03Fl/Pkaz/EPNjMFfiFwYQM3ea50xO0+ngY=
X-Received: by 2002:a05:622a:58c7:b0:50b:4f07:315a with SMTP id d75a77b69052e-50b4f073f2amr127779491cf.53.1774307132832;
        Mon, 23 Mar 2026 16:05:32 -0700 (PDT)
X-Received: by 2002:a05:622a:58c7:b0:50b:4f07:315a with SMTP id d75a77b69052e-50b4f073f2amr127779251cf.53.1774307132425;
        Mon, 23 Mar 2026 16:05:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae132sm31942528f8f.6.2026.03.23.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:05:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: pd-mapper: Add support for Glymur
Date: Mon, 23 Mar 2026 23:05:23 +0000
Message-ID: <20260323230523.2209023-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1c73d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_v1nR9epLT7gu3S0IL0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JriEHR5TGE7wI9olPAPKtvzuY9shOhWN
X-Proofpoint-GUID: JriEHR5TGE7wI9olPAPKtvzuY9shOhWN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfX60L7M/xPJfAW
 Enh3ZiY4mRihMdmSWYyEKrmUCyx3OwRCLAwSlquGbvpGMgB1Mob97hrN5Lr2/Gdtq0hfKpBGybc
 aKJCwwJyLX86ldBsP1bWbeoXEwJ6/5AXLceqN2B0Na2/hubOJkuEFeyJtlrPTelwSowAbkGPvEb
 P/b2F0KizCvbUaXs77oqHPZytrzwCWCeuxPjYks6gb+OAdO3v+eYbK9clScOmkbKahJaIZIJ5ZK
 aDnXG+/34fm1CqJj5P9ckRSrCI3NeHzoC8tiFeggDDr+/IB3/CNBu3duluMS3Dtlbj59DmGcLg5
 5ll1kn0YdLN10iSWiFfp34Dey6rzk3KDIvn2bGHqdUjdRmaTr9lmjTGKNQ2/uhZIr/riYY9uKtn
 XqQQkspkZisuznM4DLlagEG+HPsgfiqoEaehmVrJA5dXMTWHYwJUJFslOxXNnlTCBCGHPBLz591
 4RstW17flSvt9oENFTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230171
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99441-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5ADDC2FEBD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Protection Domains for Qualcomm Glymur SoC which has both ADSP and
CDSP.

Adding this entry to the kernel driver will avoid the need for userspace
to provide this service.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 05e66c497691..dbe4622a1bd7 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -360,6 +360,14 @@ static const struct qcom_pdm_domain_data mpss_wlan_pd = {
 	},
 };
 
+static const struct qcom_pdm_domain_data *glymur_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -571,6 +579,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,glymur", .data = glymur_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
-- 
2.47.3


