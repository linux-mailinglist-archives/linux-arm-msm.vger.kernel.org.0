Return-Path: <linux-arm-msm+bounces-96473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLdDAeaRr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:37:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF47244E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E0F63041D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515333BA239;
	Tue, 10 Mar 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRUdaScD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ul0DReJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C123BA232
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113819; cv=none; b=eAz+c3INT3C2QfDxh0UstgtGip9liy6Pjf3SDZ7FM0PlyDz/BTVtUzHUdFtjjUIzyH231JeedqZDg0JQHrvw2zr5Q4cLnc5/2ywGhRfz7hWI3B7IyBTv3IICSYdaCIP5xZ2EyEdbW9J83Sp4VcGRMvxcBVI6yNp4fRzCqpjDe6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113819; c=relaxed/simple;
	bh=TbZHaA5vOn1udlECRr5ebxVlfa8fzityrbwOFQl8KJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRmN2HaKaqe3HFGn2pNVp7L3x2UxapUpdZA/eKcvFaOH2i1YQunDpyDcRQMK6YCtfKxZSb+c9cX382wJ0MloUnH+HArNuiXYXG2B1Fhib4JJwk8tVtdCB4STGCNxiXTBZ+JEGn5qQJ/iObeuHErFCmrXbxxNj6I/r/8WDIOzyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRUdaScD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ul0DReJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ENbA110900
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bP04qDOHi3y
	ZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=; b=MRUdaScDWaToasLA2a8qIBEZEb0
	T3dmSarh/Qab9LQTkhUj8dn1f8UZKEUnFL5pthZSLErFtgzLtq+4B9tHll9IObwJ
	ymoodQnMhUo3owG0fUBJftcLlGUcaeczgX6w8Xn7yqDemQ9ORWf1jS4jQn63LlMZ
	t1qMnO1/8DWAdiuKYEF14UzbVcRTWtV4SjwcCXF6KBHhA4Y0sJ5HWdipULZzq4E3
	roMbx5JEGdCmQR0uFTXKBzBxprCaJu1an/E9qeUDMiBXowslkkvIiFWaKcdQS0g7
	T++acx3u/LPIgk3r6k7WRPfKeaxonszNOb36dc+Z8Zs6ek20/WVACh9it/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ub3ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:36:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738f71723aso2849420a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113816; x=1773718616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=Ul0DReJNuU29vZh5L01jJPgdIUav+vhNgyGVJyBbFjGZxcHb2z+7RywQtvHTqxcA8m
         swgKMUzeiyHSK6ZK5srYqMN9nrjWe2lubwj5+egxYZHDWDVDMAcHOLDjfRYW+xk7bcsR
         UvgjT8nludYWGQUcYuIGdP7+n8qoh4hxQogqnkT7lwgc2ISHV3GyPbHLklVIy/l5T0Oq
         kCAd3FzA7TSyXIcU96VkiWgvHlah+zF2+0GrwYdI6D2rLy0pA9UBNMDc9/f08mGJad83
         KsB37My8qvs/UKpKqQiyMGPK7BxceFN0MwsUcVP4d+JJbCUyQhP9Tra3R/pnaON/nzF5
         1wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113816; x=1773718616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=qIh3uXUguCkJrohtcMaFQlzyMykCgja55q5eRTQS7631CyyAwMrPfIbHPW+AgAGSSc
         mAzoncpkMiBJMmTCP5zCs7OyhOh1K0flhKIKeVJ9iYdFrfaKkOR3rAN9pToGEPKEgeOj
         f7Q789FB0Zf6rpqIUx3gfY80VUGpeDAMOCqJ2Y5g4e929UWIw8CrtWDxRZnjX0yac4G1
         OINi/gzBoOfmeivKm0DA9XmZUsbG8Z7G/q4Zeg8D7CVMnisncfKRq4yOUOgjy6r4mruW
         MHpghYHSj2+XQjg0TqNaYrJVuzTnZ3j62n63G6GU4vYMABbPIxklKrwTDrIdPc21SwM+
         2Wsg==
X-Forwarded-Encrypted: i=1; AJvYcCVnEBa3CRCrDJHBDoJPhK7Uam5QEqk30Z9CpgfZKZ5hMtWDX15UeM9JQghO/OkoX/Uqe+TcjTgCEwMoRAwf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5cpeXfejBs54MtJlAS+msQ3Q9WrQpPmIJImRzdsmY6Bu9UGiH
	zz46R5/O0YLFi+PlJAZeRhVCZoJIOFsMAUCSE1hwB8kuZPxcKY0NOUORgaBymWpGzPMK4H3Knwp
	5rCNqyhXKS0LNFN7VzaMvgrUlqNuQ+XhcyMOiNNbUoBqK/wgjazB/4JI7iD7ebSX3+rTyVg5WVq
	MQ
X-Gm-Gg: ATEYQzwndPvAhX9wdrgsNwh9yw54T+2IC4ezt3ijg8Ua0n4ClByHX370bBbOoaAFk34
	PufgZGhieg/U6UAWyLpNMTi8vWwMbUHvbZb5TxxOLu+Fx43+xfE8ZA49bQXHnJRpXsHm9812Hk6
	hktrWEtGSGtGLiRH1kEr4Zu0eyWsexVQR3mhzOCEnwXQXjjJ2en5tcnHV1G7nM0wEkVatiYTfRu
	d2Azypmn+zPY/SXUVXHEFCOELxs5Np1KZs/6gHeQkHXKZVInfVCSxBOymbYr5FK99Vv+QAj5Nam
	VX309puM9SxMT0iqgcBrkHngTJpM37vjI3V0ZqVXZeVS987OjCVcKZLwVlmnimsx7Qm8YUiKTgh
	ZfLUnTKDk6jLfVcb/UQVJq6rHnDEFXMkCM5fP8WEutFHjpPYwzH+X13/5uAQaRwbN9S2ix6chB1
	0w5N2vOJXHBqfXIvEw0DXKidNR/FgXmOhBdmrr
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr3300650637.65.1773113815901;
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr3300625637.65.1773113815445;
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Tue, 10 Mar 2026 09:06:17 +0530
Message-Id: <20260310033617.3108675-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IY-cSXm8neVDDKsEHY1Tg8ZefQ2RK56m
X-Proofpoint-ORIG-GUID: IY-cSXm8neVDDKsEHY1Tg8ZefQ2RK56m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX6Fd4rdXHfwW1
 dfWP7ZqpMeAumYsMMXC7T/Xqg669gHAsqTJuR/MG+npIB71694khXL/QFIesND8RiqnFOJteEWL
 UZ3m2ENQRgJP9sz2qQPuGks39RPmuVZ4uxaiwKLFl5zC0x3Bo9UElgsE1d1CVPI/VjcvOgpxvgQ
 HYGhad/8AEmU45zkTgLa+cxvhQGtp0bECk0bz0U32UAii7GhuyZRxP0hGZnBLx11FL/hp2Be8IO
 hai8uSPlRb7g7lZFLZ/JPwAHkzXggYP95AKrqSuoYY3PBZq5VlzzjoeC+9/0M045i8KzaZz6tvC
 2AW/pEQIiypHMQAAyBsfBDONBHTDBlBBhog8wiBGbTq7RJOybol/1xv5+PlSIDBoys06E1fFPcW
 SgOsnfKQZFqjLgsCrLGfJ+LMzK8RU9wFuT2J3VL3A+E4JOHKELRQWYYXDn9m2mB1ibTEkphzJMU
 LpbS8S1kC3nuO9OuOCg==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af91d8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ePUXPMwdJMzpUIYWY5YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025
X-Rspamd-Queue-Id: ADF47244E1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96473-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..6b7f91a3a968 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -485,6 +485,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1


