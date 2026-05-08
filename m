Return-Path: <linux-arm-msm+bounces-106584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEk0FMeO/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9AF4F2EAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A824302E7C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DECA37C926;
	Fri,  8 May 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb0jwep1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gug6Y9J6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515637B003
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224831; cv=none; b=nq56KNfgQ0GtUTVeioRUUUAvHAMxkdKsQM0Z+fNQ7whByl4NROpmd73zryX1EgGOq1IDm8ihl9SFy7DZcoKuZG3bzTYJk1WXostF7O7pELzVTiLCU7nfWbcnr3Oybp+wcsHoy4vpYtqaz7sZW4iXksK/DKEHpVoS3V6W0Lit4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224831; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2Q+Z0xpHf0eiWS9TURu9hSzJoDwwhu6l1IvmBYV/irw4r5ESgrVUVZcxGLGNneluAfrMO/m7elQizRriwKXz0SM7/SvbeQmrnwAarls/ilRnZPKCcOUsQIKzC66kYQwUddKQ6HWn4qaTZoZBcIJue0v+oD/xdPnD9RlQvWwpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb0jwep1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gug6Y9J6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485UCFg2530922
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 07:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=pb0jwep1EoCR15Zh
	qRCMWPwOC8xBb2DQDzsIvNq9/+BMm8gsy5LPaG+vO+VqzDOsJQVEuqFNx+cmLte+
	4e/kacxoXt75bGVCMvauwsJ6fFbjrn1pqIxm0k0dhP2b9B6jFrTpnObEa8yF3x4O
	s1Z0QhVNqP3UnaP+JTpktEwgUSMD9nRU0tSiViPIGeBu573rrW1uf25GOxczVMiz
	GxUkdlJjp31Jye45LMr0HWHM4/1vXaEQdQm2Wz1gSE/fAr9jE5Yb4Ejcnfs1Y2qJ
	TD3xxYmRU3854UyGpWq+lx1hCGnIK9oDy8CrEQYbSNFwzByn+8tbI3mLk2HJClN6
	cjND2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9t70x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 07:20:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-836cfd84728so1036946b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224826; x=1778829626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=Gug6Y9J6I5hTS7GrOMCT6KGaQVADHuAk6o0CXbNf90kA9b6ekk7qqI87ikWmEpTlVd
         FdhL5RK0RL86UqZtLbe3HT3o6s52OSA+aW8AKMWVgHafPVRbb0EhH1jdrH6wmW2Ze6nv
         JzopXZ3d1ZZjEh8hq6SKfo/bXBF+/10yQ5cfYVDs939ACnWD5/HxcCZNiKpfyT87iXR4
         f+WZ6KNRSqrwj55cds9+00JzCUxwzwigYdzA9NC/kKTmTAHhqTvaysuZKwJF4wjSkb51
         xi2b/YR0DQ8EKh1NzjXv0SXT5h9/voxjHvrYqr+8KW3JX1gIZ0IjOjAwxE+Bnom4wlYe
         wZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224826; x=1778829626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=ZXUbR8c0knwRj84r/545ezR4CG9/iAUMt18Thbh0dE6jEgyy1wV08phAv+kK2vTToM
         Qwfnfk4D4EMYN9mOa+DL54hUpQzFR5ECXkZBbnPRp1qyOtFSuALU3rJqbUNNqrUW+gRo
         n5L8ehbcuRMgkp8NN9YEmFV3GbYV1ORmGuh/AS2UO6VfO8A3AsoibxmkShvhw8swS17+
         gMRTX51KuUC4BgIN0padGdTuC2tHA/+wQU82gnW7XN9A5rL0z9Qa9LNRKfMfocZ3gbvK
         lUwuQ81wgjfu5a5mY8u1YcCspFIsLD9z0Dzhd68c4h0R5KvtlyfGB/fuT2JnVAU3kE97
         6ftQ==
X-Gm-Message-State: AOJu0YyWEqx2GZ8HqmoDgLiPA2zSBS9Ruck3L5XmG75uIz+jVVrjzq47
	xEd4a5IO48M+hzbN5MLZyblcvWuNM8QEilD8MMwqdCgZ5RZPeGkVsrOsLpFL4KS302J7m1MaGAd
	oCgEQL1tbE4hGJCMnwS4tguGqBvzt1XaEpNCA4EKC5h7KccAbw//lS4MrcidFBZiruT//
X-Gm-Gg: AeBDievEXKZiu4/IH0tfLqebD3MQKhHRw+MaIxtFFJ85N/tR8exAfD0bkoEWaaN5Fbc
	N2VG9m7RsTUKHlXMzEGQx+dTNdOa3BviRifREt0vP18Ir3miaA6KzJ2In21xH7ZFDXNRqShYas6
	8/fSs8y/bDR0PJ2Cl8gizbdkqsoXTKlvJAckg27GDlW2EHpidiGboZ7ZPOdUbmCWjstSntAj5cE
	qqnYU5g2VVOp6f4agnFnq/k4AaXoo2SHjIUwh3Zf57MtaD0qE3bgdZ6OVQdv/sKnD9BOs2c4oh+
	2orTyomd4iiXCinVnhkEJFtai4zZCzQUbD0Q99FQpmFyLBLzvXYniCNaD6YH32Qk0XI8K4B1mIF
	DEjOVjQbaLP+bQ6Ph3vA3GHd8HfwI61rRoYBZLO4aov2M8vZUDPs=
X-Received: by 2002:a05:6a00:8c3:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83bb7fb64b6mr5283670b3a.18.1778224825713;
        Fri, 08 May 2026 00:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c3:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83bb7fb64b6mr5283635b3a.18.1778224825227;
        Fri, 08 May 2026 00:20:25 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:24 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:47 +0530
Subject: [PATCH v2 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-1-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=PXCqMzm2pz/MN0WNzlq6U5QlGQH8dmERsSICWaI1BSRa2cqw0313Y/b1ug6Q4LccPg5v4L2eD
 xWQZ8MX9355A9t6VsjeKCEPXqTIa1W8xd4nupVmKQ/PHXwy6ZrAQIMs
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: FAQNY4uuerYCGwgaAZi1vcd5WSS5t0Ri
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd8eba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX8lVJg8Cxjtso
 hdykDN1kDd8lOwPudjd5s79gFxdtd+mS7zw7HAuXJMzKZMLZXhi1LedUd5O/q15rJi3x1Uy1EFT
 d8BLTqPQ4AWsfOLdVUDAl4swrB1CDN8F//EIYWeHrXdUUVy6pnW/21EpbckcW6NSBIA8Utwqp+T
 Mz/cTJep8j1813VwJp4QyCqF9v8JTRVzOc40M0mb/p8G4z8A3Iz9a3d+e0HdkiY7dZZwZTu8UOu
 GxULudqrGqm/zT+CbTcu7v9tU0Pc2YneyHEJngYy79wyqm9yUKmzF0XSarl3a6V8vJADJ2n1Xup
 Uf1In9XBo7kB4YwH627xzF256f6Pbdzb8Ghe+4wPN2+c/NJaibgANLShbbx/weJnkYT+Um/Okxn
 hTlANDod62v+DOY2t8n+9AipBeF+ofjbXUPUNwoSCP+6Ru4nEDSzgeVz0Y5UM1FNN/xwaeilYLt
 f9cey2Eu0oz6LwojERw==
X-Proofpoint-ORIG-GUID: FAQNY4uuerYCGwgaAZi1vcd5WSS5t0Ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080072
X-Rspamd-Queue-Id: BF9AF4F2EAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106584-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1


