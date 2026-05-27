Return-Path: <linux-arm-msm+bounces-109964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qClWD0S+FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4655E21DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2482D310990B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D8B3DC4CB;
	Wed, 27 May 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrAFtNC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHg3Yy0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031913EDAAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875066; cv=none; b=dZu6fa+ZZIUGUaNti5q3qnaTZG4Z7tWN/zo9escCngi3TqN4JGXHo/B5WX/TnxoyS3PlgFlwuycI2AZvPB17nmIgnJ/ZBjy0QDCOrOsWgi52nmJGEkKJkHv+7KRMpLoKlg6iOLc0lV0RpEcWZBNVT911cd73SW8DGKoRovcz0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875066; c=relaxed/simple;
	bh=gUY06gMwC09fUktf/lr0U7avQcoj6ewxy1bGD9BkDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewl8MlvCtq+ZlB7TWptQMXAVjpu94x/Qw9cjuYhj0HgEKKUItk98H9B4pIiB9e54iiU3jt5cm6NT6gDKrh+9gXA3Sbzg6h3nYyHwD0gK5+xfsnFOhP41m8OIwRhwI+tP1RYwVNnSUYnNPrgMPkw7hI+46OrDsa3j9IHJEVrtOdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrAFtNC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHg3Yy0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRSh871167
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZMe7OPUlXr/
	W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=; b=hrAFtNC72oA65oejJ7Ava7eWYkU
	ZNMXpJnu5oVqoYM69i9Sl7kPKEQs6cP+DyZQ1yKDjeM5gs1ZZGhbRPdOvDnKz2Fp
	u3Wfa4MjICGEWzQGUqAL/LmC/oxMZKBV1tRSWgQnsNksKJtc9SdbZpo8FFKm2Q4r
	8rYPvehu2P1b7TDD3qZ86749rjyvKbb6b4W+wZDI/shbrhh+/wHU7Rjs5HMUoQqX
	funYShU1sIbnj7haYTEJPCQfZwmeBPs004NNY0zCFbr2qf05wQOvk46NDQg6usMA
	Vl5u96W9hq8PHLvk8G8shl0CPFD40qvGcL9W3jaHxHgshSraRzTfQv8QTQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eduru8mtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so89227195ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875063; x=1780479863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMe7OPUlXr/W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=;
        b=aHg3Yy0/g2m5QaaZm9DlR1oyDqeutnY2GN9g2znIgtmRu4BQNxoAiUKnusWxdIA1MB
         itndXnDhomor/+SVACjDSQLiE1BQJe2YuADdaL4qQyHz5iqA0gKipgkhGIeBA/ODoLVv
         gTyV+U2kIT3CZZ9aLRrb+hzdwqkXqN60DNL5zJ3e7T7UZyZsejWARfywZg2YI0Jz5jMm
         F4stItzH0tg8LgGZ/5X90nhPP0Rhiot/bVj2Vti+vMrpaRuJavUH3KExu0wc/8FLh8Kr
         p2FzqXp4y7mb4AuFW9VE2XNutrNv7es9GDwrq/L7+MThB3IWN2sEYuwluxZg+hIy8tTu
         ynxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875063; x=1780479863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZMe7OPUlXr/W2ZmTGZCiea7X26onuuKy7xU69UBTmKs=;
        b=Rruy9/ftrzqeoevpiy8TPrIJLRaEiZnA7J2MqcJXth0ERsRoU+P6lgGdBTpfeh7Lg3
         9GRWQd8yBAa0vLnQsicB4NUwZZW8ufPbDLligc/L6m9Hf0loF5bl5++LaMEuY91mU3Kb
         oEho8BIEIWSt1LORZCGj3yxWVmHGw/8bQrR22QVhRZ/Ih6bw+gRImhNWHVlh8Hz9mlux
         uHW9T4zeZg0qn7HkjXfzoMQNfzb4WRWtdwgjMTiOcsm2IuIhDFjAeU6f/UmRs0+CzGvo
         VnSMgN7wGyW83jwTMyivGhrHCqt7bVwDzDO9zFTrv0wACblm/89UD1YWmBgbSHbYoH66
         vsiA==
X-Forwarded-Encrypted: i=1; AFNElJ/S6D2mEPhu/v1RmCdeDjwbZXd7etN4K5XRmUrdkLtzvngcg2qEYWoc1TPAwHxVoSYbPHtU4KX8cyQIYtia@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+kJfaB+ydZxKzOJsnBAIKL+ycIBMQkFzq5fqyMBWgdTPJwuQ
	IZ78C2qNR6+6uXLj0eLOXJFNOxgB7Gg4mPqC9kZ7KwRqubPglTny/PKHu6DX/OkIvtfCVjOKgUt
	zwFlQjxgEe8Yc8EVLBrz/oaYNh5ikrfATWjqasN+k/BvpAGezBVYdPKIGMGu9vpJeS6U8
X-Gm-Gg: Acq92OGqS8N1f8guPqaEDgrb4ANkMZxaMgC2deGAAOBEYpqz+V6nNhL9hHnOPoQs6XR
	e6ThKkGgbyP4R7st65v/5FkIbCHtWEegQEdv1ejwhY2M4YN/HaTrt/gisxcEkd14Dx35pwrIYu2
	xK7274tPLTiaVhdnJosc9llUVxncT0or7lkwbMFr2Ou1TjTmB4Xq5OtJ8WfsdgmTgJk5RkRXJqE
	/NPNc7Z1SzUP1DglnOf4vlhir7ARGtLUIwZ/fxF9lF9cjWIIXA5IRZW0lYu8b2079nyefN/mKiF
	kh4045fe9CEY+XRqY5ahCMX73xkGpaCtHrlI2Qf2TDpOX60ejeuvUmRrKTVCI4Xf0bERjQlE2+0
	SepgOVaASpPU5OjICH1BW1TUz/ly4zkf8VQwpB1R4egzMzyrW
X-Received: by 2002:a17:903:1a84:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2beb07930c8mr188305845ad.3.1779875062796;
        Wed, 27 May 2026 02:44:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2beb07930c8mr188305555ad.3.1779875062190;
        Wed, 27 May 2026 02:44:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 10/24] arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:15 +0530
Message-ID: <20260527094333.2311731-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VY3H+lp9 c=1 sm=1 tr=0 ts=6a16bcf7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=I9_6g77LLF1zyLlhHlMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7qojp3XQJzlDa2sufxSo6QURFHWLw4DQ
X-Proofpoint-GUID: 7qojp3XQJzlDa2sufxSo6QURFHWLw4DQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX8MS2KIdrWNB2
 6wVgbtD6pisXqN3pHafFXPshuRQSJXAXKa15yXZMIeZm8HMIMV2lJY6R5DgFQ83Xa4uKV6whX6T
 uotSzqKe0/sEfTMosJHQCrdD60syYwUByWKzxkhDy3Xwd0BavJdGFP6+910SnUNvv0pRGvDfzLp
 AN+EApufvCiT9qGv7nIOVoCq705MbHzLLf65Vzv5x9j+qQIw+OxBV3L4yrcw0wfs9JH49fCKOA/
 /eben4Nu0jrpVhrUYYJojyvczNG8MkGfLtOWlu3RSdXzm61XMb0bVzMRJoxqyH3ksUPz/vbXKR8
 VsMzcy1ulLCgLTsvKFDqzIqTJjXOO0NTvuZPJIXK0sl7wZzRbHrT0oreiqZ4Bv/H5eWheVjJ/R4
 ptg3wWwUWAFvd6OXuTjs/fq5TUN9VR0Nc9+Jx1GlR5smCPRvTSIFWsv9dApjMeDLBmqeQTsmt4Y
 pnjqK13d85nZ6AUGnpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109964-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af00000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b220000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB4655E21DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8350 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..ca235ce899c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3174,7 +3174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
 					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
 					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-- 
2.53.0


