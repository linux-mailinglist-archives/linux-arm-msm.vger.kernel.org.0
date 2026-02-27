Return-Path: <linux-arm-msm+bounces-94501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKTfK/3aoWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:57:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 641041BBB2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C974630741EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C83644D5;
	Fri, 27 Feb 2026 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9ILf4Vu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyrN15pZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B9366DB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214986; cv=none; b=eldLPf6ZQG5MTZjn8vN7EuizqW0ioSopDIzMDPDxKDwKj5DM+dEFpesa5+/UStpPYciCxAfZtUI2CT8AcIzamecm4/RFUEqxfOwFyVhr4fMMz2KU0Alih4nopXUFQ/Sv/m3dRNwwOg+08ETK8KOoMr5ere6nBkVVUQbQMgEjUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214986; c=relaxed/simple;
	bh=f72+ODrY6svTfA0qRivasyoBcGjdRizP69hhWW40pWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCYi0ihvO9/1pEjPkpuHuQ9EZprGjkibKByUTCi26cm82Qq6ZO22lkMY9E+iAp8v+/mW4FLA+zszbKV0BUzBhNLkMrHrBIF4tPLOfE+N3CS+sMMT1Wc6HPNOk3IFxnWiiA3ilwxx0t6ufJmtc3ZycTHjc2s7xZgwpnPiQcrH/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9ILf4Vu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyrN15pZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0O7Q3495951
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5Iz4VjRSf3e
	Mvp2MMAUYqwMKz3tRK0uE7/YzNKZxenk=; b=T9ILf4VuNwACMw8uwnsy8fZDQ/t
	YoYLv3Qxig0RqObz0kuf8qssVt0ajK+7wsfGcdv+dO4XBkE1/lUvIHfl5nLPoJ2L
	R3di2546i/rzriimiZvzv/4zGtYF3kGuOE7297Xt71Ki7bY8q6F+gRJMBxLKgYfX
	qWyxj8EbYyAuNOiES+NZ05sehdzYqV+e3jW0sCoQH3okIh/xHA8TKJw+CNOFmGe/
	HOe1OFPIBqloG12mVUxsC/3mc76iewC3LOsSEPX7oJaQJAlGagLrRw4/Z9xWCq0C
	aEbyw42NlwKE4NwGrPAwb/C+KRzVFAhTZRSasqim/0Y2w0tmN/a5KmqzKdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99vnr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 17:56:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3d11b913so1874429685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772214983; x=1772819783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Iz4VjRSf3eMvp2MMAUYqwMKz3tRK0uE7/YzNKZxenk=;
        b=CyrN15pZMSi0pJ6BpurepodsnKiojl5i53/wUWoe+ogwzWOcXRApUou/2TxCvyoHX8
         sF0hNAQSISUgr8owfi81f2YPy9NGk3YAQC+glzaa6kglM0zc5vOKdOg9lYz5AuhMMe+U
         1btw4MoypQpjaiKyl+34z/A/OnO4ntTSzfv5u0Plj/wa6He4TV4JbNJFhVB7nTtCxHu0
         Akz8CDsyrXNjmiR+UIU5lvKG91Gkde/ai8xZjzwWU9qHEPDj5euaMhaCFn69oIdsn4kK
         Highw5oyNlnb8AeIrnXSX72ga9g3JfF5zRo6daH/h1HmuC7nNRs0aLuuhj+PfHEx8+lE
         ANPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772214983; x=1772819783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Iz4VjRSf3eMvp2MMAUYqwMKz3tRK0uE7/YzNKZxenk=;
        b=RrgDMDn9gwJ48V5ZRm1rPxDytT0Unf/QrN0MYJirZVraIcFTEv/PtM1l29fobOOxBs
         /i5aRqgt3UKjJjpJSPdDMa41e0cyBYAHo/XG9DKmhm8mBEsAnHL3KezdvFA7sm9a4CMM
         fsOE6EDHDCbBGF1KPcmtGW5w/eYYhVlOTUperiexZYCSZ1FHKOjCNmaQM00X+zVjlzod
         1qrg+eDEkEPUbKjhj28HrXul6zDu9mtZ1hA0U1kN7oKR3mpIi16G2gyJLmYdgSffS1W5
         n4Np7qQj3sHMtEPSxfjLSr5HDmt+h5q4qwhlcK3HBa9/DLd9g3XW+qMTRdb4P7CDDIMg
         OVhg==
X-Forwarded-Encrypted: i=1; AJvYcCVjzFt97Vkr3lgStsLLmhNmZqXCJ9R7BTi6dRVyR0Lf+qRDa2kyXv1ddc4Tr5PUTwtr38ve3kaHw8pwWxDh@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdOdeRkPBcKLUG5ia6QZkN6z7dT8PDDBxfq/DZdq8MDTGq/5m
	99rmtmLgkafucWXxfylRTwXkXqcYbylOClAuF1qF4mjPmprrqeB7FtMJQ6pHJjhoKtWL/CWVe3A
	WMHH2ANh3i8+1ROSV4+oJaB7utpI4U1wnp2cIKYMv1kwoiLM4tfeNbgeY9tmos/Cvsg3b
X-Gm-Gg: ATEYQzwB5ehIpfV973VGFPV1XODztLFVCHBHh93+k4XqhSY1I9a92jDXI38+RncoNwV
	RxMpzliKVqMrdM0AFoKb/CchVlLlMw2FZEihfRET0mBnD1Gw0ygF8y8JYLigEW/Y1tiiR93VLps
	m8qhgq+ApEBIBuXnTJjOAaatvNKvC/TqKHOZqu4yUXEOtxauV0aBt1Z1+9bJ5AqGbnqHfJOgSxQ
	YfM9ANngVREMuYT+qjNdVooXKuclOEhi3ocRT4+eOSXDxWKNtdgq1nHiA0fx8tqAgRFNceN4c6x
	qvT16EnAjTywhKBFjmqwIImzmpA2DN3JrNHsI+ZAsBBbu3C33VpAcuvyIR+bTPz7WD/1hjpXj/8
	Kqm+I/qBvEnjadTK/CBjlT5D8pKbknFZH4NOk6Q==
X-Received: by 2002:a05:620a:4041:b0:8c8:82a1:11bf with SMTP id af79cd13be357-8cbc8dc2c7cmr465427685a.2.1772214983267;
        Fri, 27 Feb 2026 09:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8c8:82a1:11bf with SMTP id af79cd13be357-8cbc8dc2c7cmr465423785a.2.1772214982794;
        Fri, 27 Feb 2026 09:56:22 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf8b6sm76088025e9.20.2026.02.27.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:56:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] soc: qcom: ubwc: Remove redundant glymur_data
Date: Fri, 27 Feb 2026 18:56:15 +0100
Message-ID: <20260227175613.164637-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f72+ODrY6svTfA0qRivasyoBcGjdRizP69hhWW40pWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpodrAZqzW25dpPy72VNCtlq6z2VNC2K0VhqLMv
 L7h8X2hmqWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaHawAAKCRDBN2bmhouD
 13wvEACLSmQV7avKQDQhI6WzdwQIn8h7O50yxEpJ/IRGeRf92ecuMtTlYP+vfgmwOrvTGo3M2j+
 oVW8NRPiT21zeQnshWW4CqkK4Xteicl7P0Y4roXJ1ATK5LHL65/q6EGkiF36/IHuq09iqIFogoP
 ZMX64pKSUupVWXrOucB0+VcYNZkZRv+ktdtxsEeOH1r9d21NfPC8lX9yV1RFDyV3I1sr5yaBHA7
 oLNP11tSW9+rdrhcvwQP9gZIKWqpanidH5PgAwy0R/uMgbys01GyupCDVX31w8TNQJ9LpZ/XX7+
 NGMJ+LtDShPjnj6/JeB25Xbvm1wPZ3uMl15q3yf1WnSN6w6CJ32DG68HkIKyG6zKFFmeLsbveB3
 gtR0JiqbXTqLhIKLJneOlB8d6KZR2TkK9mi5uU0ZgSHDCGIOficNvuL+mLgwtVXHYOZy+htCoZv
 cGfkXoJaenQUcYZ+anEfHWMdf+3TfNXFQfUnSZrCtgLV0ZqGwLS/WnTweK5TXVinYEJizmqWYwL
 PF2eXRx28GUcHPIDduQuIydrO+IR3i+aX4yEuH8cJnRvOtBWvBuKLTM9m/GpkhNg0MeMIPd9XZT
 jNSzZZbYqyhLRz53z2buM4I4jeAaQNUHWwHOVGgFMBMxwWuryffLFpji5R5ar+ib+3emRARVamK DEw6AIEyu2QN7GQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1dac8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iWbhb1SRmFaL8LoAFIoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ILVPZI-Az5FQTa400t-H0OWLVvFNpIVs
X-Proofpoint-ORIG-GUID: ILVPZI-Az5FQTa400t-H0OWLVvFNpIVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1OCBTYWx0ZWRfXwbriBZ5csVkQ
 m55oodQiAGdBVL5kdoLc9RUxDfZ+8p+lXyElwFBbO1B/US/5FxuQb3SWG6zV6aK5gSBBgEZKshM
 x+3UOC3JKPVmgMeNW5V9m8nss/es5NOvOxp6Wav0z4xrpeJQIzJ5zZNixO5pETjpkvsmV8MGI4P
 wUHkN2qxvgpJffN3fA0Cfm6CKnUolmoDLREGXQurH9y7/FQKTGRSm1fkHO4qWaIDZW/Gzu8JrXe
 TS4rMwXFS2qZmGWUjoBW1XaAdnlzCSpYGMuuCOregMaB2mCewblkJGB7k7niGzZTVpgjdb8E3vh
 XagMPDpkcDpVchQ71fcTeJu54HRbObs1KdGDsb0W3tKeyXNZsmHBq9uVajc0YHhqZbdIJSTT6DF
 o8dNdFhTRL8eC8EVOVGhqLiG1mABDv2M24NcrPAAbjaCryFqVX56yfLnsvCui4nLbxP/6JG9amv
 AE8s76M1NMWtOQGuEEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94501-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 641041BBB2A
X-Rspamd-Action: no action

UBWC data for Glymur is exactly the same as one for SM8750, except
representing same ubwc_swizzle with value instead of defines, so reduce
code duplication by reusing older entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 63e77fceb6b8..eb71b2356c75 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -208,16 +208,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
-	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-};
-
-static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_dec_version = UBWC_5_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
@@ -234,7 +224,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
-	{ .compatible = "qcom,glymur", .data = &glymur_data},
+	{ .compatible = "qcom,glymur", .data = &sm8750_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
-- 
2.51.0


