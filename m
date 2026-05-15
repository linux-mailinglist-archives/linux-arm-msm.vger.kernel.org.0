Return-Path: <linux-arm-msm+bounces-107764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG8JO57uBmrfowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E08554CE98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EACB5317A08F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C264843E4BD;
	Fri, 15 May 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqKeo9bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R76fslI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2343E4B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838029; cv=none; b=qAaDWHBVn9Hq8gJ0lWfMrMz9Cz3XMYcN4wnkffjKOoWGjKh2elndePJXc8CrSYXUvQDL0EXRWOfId1aPiuO/Y3+mAF6wnEoxYNaVFlKsUTsftZGSnBfRJruVGNKWV3mHUuhtJ0BurnM+gWwJd52pCVlhdKd0MYRXzcx75+wBpZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838029; c=relaxed/simple;
	bh=HAWDvyrm5udfihsD68H57lsz6emuSAfI5NRycP7TtuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KgXKGzwvpnYs/Ee4LV0ECEh0B3UnzmiQzHkUC9lUZPU+1R5/ZlAaMB8f5XlRH8nb3981qk/OxKk8RP/b9kD15PQfMVclg+7PrHqx2vdDlcieX3WK3N/KRHon5TTuxlptUn899FsK/lyG1IDBvqDfqFUP3SLDGEVZKqYZaqKMdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqKeo9bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R76fslI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Vn0n2676221
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jK+M5Q/wDupeusbZePUMdJ
	tPb5hvZH41yoSAbH7ILag=; b=bqKeo9bf/aTbKAW3qOYUso0jBvS9KRU72hNLzn
	OAL15hUlk9uNu0wR/sprb4WNfHKgT0W0IMble/tVTGdHtXEn27VKzAbxuN+RfmEl
	quKo7nAhPr58klkO8xJzwYfNeZCRzC219AAeCReMI9NbyxYKIHFapoBXLaS8krR+
	PNhYDigKyRtS35rTOrpqvzDx5hLfpF2VVuSkDECvQy4rKv4ik9cfgoCCHd+OuEut
	qd+ylal+PZRc6D7HpxzW0cbkGxUsddKSni7/1FpTHwwcNe9OIHF5FKCx13v00nmS
	+HSJml8I5x18Q3zD8UY447t3XwM85EFFqcTn/IgLPIIGcG2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtpdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:40:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6aeb3637so29136935ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778838027; x=1779442827; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK+M5Q/wDupeusbZePUMdJtPb5hvZH41yoSAbH7ILag=;
        b=R76fslI92xA8aaFNBMlV/w+3hx3EPGi8YBGKKiTZAexio+e71z2fIo29DWS4c6vxg6
         rNfFWBLK1WHy1i7psoNUjJY1ToSPojI8RuyCcOz412hBgXImyacoHkCzAyeJQ63xlvEp
         7DtSLyPDz+0j0CKF4+C27nA/8gWM7L2gQw1RUkjtDMfZXqeTFDnK+I8TUY8m/TYVWtwm
         h55lMQpAYSFXLVeXyRtkCp1Oxf+IWedPx7m0ozfH9GeNvgU7P3avih+gB8hSo1Ey/Ug4
         S0o52atfrnr0U6u3R0BhRrVJTbDXjz1xv8yRRNS+L+BPPeXROQbp4qAh7UJuJBuZ7F3k
         jeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838027; x=1779442827;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK+M5Q/wDupeusbZePUMdJtPb5hvZH41yoSAbH7ILag=;
        b=YUkUVjkUl321fDAFJ3VIclBFd2LdcTlKevfYg6s6VRWjOEUMZdSId8SWXETD1n+IFP
         24S7ZrbzOSbjkq/WzJywZ5GmAAw56fRSO2bgwKE005bUQXSBZpPG/eS0alfzklMilpX2
         EZ+lrZwv6rrh/LZbZn34oV+db3wE2KD7Gp3thD+xgxeuIARdVbnqaFnauqxRP6Xum4gk
         y2cT3aAh7wnRkaJ/Chx+X9x1AjSS1z2OPnWHaAy5dmpmmthGgGU8lGh0tC+AKOEgiuqh
         DWN4D3PHO3VVfEwEV8bsEDEQmzIQOa4JAY54P9tVn+/3o7CPPiLOAgYOvdt/H6bDzkKD
         Yz1A==
X-Forwarded-Encrypted: i=1; AFNElJ8khj/cUAr2gMS923elYAcYDX9WUbwG5GcM45qwKBvHNPvJPXjqzd8PVSAByUk2XZ6yPmDwYYkboyD7AqdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2b16bHl/YjIjCX5QMSTzeelhzmEypHiwAXAmxOZERYus5Cl0
	IzXyg7gHRsmUdvhm/R6JdJUXqoSbBTFQfYCz7mOA1/d9qzYUYiojsPg7T362gcprSiEn3s2o4TO
	3ty7og0JbxGZb43DQtWethDKWgxEq9r0IhqbmfweeprIZGZxg7zGEfeFizCqnfZMO9hsC
X-Gm-Gg: Acq92OGEWg5E0EJW43f9Z8qHzmL2zCYygmhlH/5SrU7KKqauOtKd5tJwIUialRH86BW
	J5SC+xQ/qltyktbPbUzT5t63wNmUhClChrM0lvXz8nvdNKGkxMiUdLlmrgz+m4Nb44Ru+UAUkWv
	NHUO75iJXnKHSRyP2GagrEoUEN5IEn9G8G0yM5EV9F5t3h9DXP1JoIle8ZGF0jjO76I/ngGaxZ3
	lIV/fdya2OxfXKScQS7JgMSSGwrm3giPFnV7zODee3MjJB9//t9M5zO2AFLOUAZfwDYmZZAWLaK
	2mdttz7Di43zC0BWhCRRZBRTrpJHzUVA9CvLCpuS3KygJ77f6rd6tzCaMMBCg6k4EjngQ1llT6J
	whODeUE/rNU6/kv+2kURBGBPDtLavwpFUe2ZDumoEPXyGpKd37rjFIZ1fhxWXWd8QYw+LZwGW1Z
	PMMo+k8leoHrjciWoWgxg9qTGG8iT2dQs2MaHVS5vy6u2sBLEjTvU=
X-Received: by 2002:a17:902:9042:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bd7e77b6b6mr29798355ad.6.1778838027206;
        Fri, 15 May 2026 02:40:27 -0700 (PDT)
X-Received: by 2002:a17:902:9042:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bd7e77b6b6mr29798175ad.6.1778838026755;
        Fri, 15 May 2026 02:40:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm50068725ad.7.2026.05.15.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:40:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:10:20 +0530
Subject: [PATCH] dt-bindings: thermal: tsens: add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAPqBmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZLi1Lxi3crE3Bxd0zRTQ/NkSxOLJAtLJaCGgqLUtMwKsGHRsbW
 1AB1R6aJcAAAA
X-Change-ID: 20260515-tsens-yaml-5f517c948b89
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06ea0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W2gPVXlb2yFIYVFQQSMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NyBTYWx0ZWRfXzFDB6mj4ek/6
 zEHbfR6JFKPsN0jBy+poCKd6SzhwcsH8+anVeUaUwXebOB09pYClv8tDLdmd/EZahdV9JepG+hz
 zKLX18bWpGheDdOEZfNZp2aabc6sFRD7n1qAaI7CQhwcNFFzxo0wag6/c3ccogTIl+Gg3CcDpoJ
 AL8lD3WlJJUQPW3+v3jlhZvuCJT6MiGAFMqp8CS26oS+GXgJIlW3JjoTiu3IGIbw/bDMxNwBP+e
 Sk4emzwsJa0/OnwZNBmmN4vbh9dRPZodBf+1rgCimg3eph09TzcGBs171kOVuSGKfYPOwp1URRi
 TVpTrnQ5pUZuzx9Ukyfb33qRoEWYdn/545HLsLJUHi8nmoLq8rGMeeiMex0O20YfSr1m3QbXAF3
 J2yteEi+8Bijors0LDTsNs4XlNcmtPU/vYKHiTe5mvFhPqzfo+lev2cOyizOqk+oEUoLU001kES
 2JcPS1lB+8S2FU/DwaA==
X-Proofpoint-ORIG-GUID: bVC4u-pwnKzIxuDIBuGCr5fuL4-6PDNv
X-Proofpoint-GUID: bVC4u-pwnKzIxuDIBuGCr5fuL4-6PDNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150097
X-Rspamd-Queue-Id: 8E08554CE98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107764-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the compatible for the thermal sensors on the ipq5210 & ipq9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..fd8031f7f6ad 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -89,9 +89,11 @@ properties:
 
       - description: v2 of TSENS with combined interrupt
         enum:
+          - qcom,ipq5210-tsens
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-tsens-yaml-5f517c948b89

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


