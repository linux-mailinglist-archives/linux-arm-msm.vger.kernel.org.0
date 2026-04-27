Return-Path: <linux-arm-msm+bounces-104809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI3ZAqep72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:23:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB64787D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42997301BA76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2013E92B1;
	Mon, 27 Apr 2026 18:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDbuKv0u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3CedNts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E63D6CD4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314208; cv=none; b=fwAPnRS0BjUteWotJyJmsz9//QJoEH8x6O4u0B3scraw5+EFKLyKEuDt961/Oiv6bNcwPzQTzbAmu+xx9q/dBN1KHYssEuiaSohxDhd8bH+dsQJUNB0Ch7aeoAhR+G+INl8o+2qa3zZWYKsFvNnhelvT0GmmXVZPa5WDFZe6txQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314208; c=relaxed/simple;
	bh=YkWiwMK2UL7nJitylE4MB/TTR4aYYELndcelMX3Lh34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDCKbSo+eY845lk9NRZUYjTFHFDrgTRZ1rMsW2C0iQGh0O9dvTGXQ5JmbG4qb+LujlEYbB+jDBaIkVdgV+idZibwqiEXKPG1JXq525i72ykjJXULeOAD7+TQsamBLMU5ZtbTpGmV1/Vms5h1huCxQMmrNNCbMtjrmqJGIeXufII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDbuKv0u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3CedNts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDteVF241134
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg
	0D8zQXCU=; b=HDbuKv0uptQWGIjR4a+rPf2SX82MviCTbDH8Dlgr89V+w04+iXq
	0OFlBBumMYwN0M7sUXTkdvpAdagHJy+kpsN/0a4dGy1A5KFwLvXgYpjQRu8vAobC
	F3htVrjqEysJovZezoWAPN49u/VNKlr08EhM61h8GWTaLFD8d1P1EhXtJXTZLBTr
	P6iad2IY43xaVg9Iv+BmjDSQdPfQvAL9HXQg9hTwO/A1dOYN2siGVLn4Wd2r2bTf
	E1L+AiXaHm9/KC0mn9QYJwMdYkBgbhJkvqadtyli2fduHAiIFqVfLWpOUwyn8kYi
	boXVuFc5zB9DG+BECM5dtLS2NTNKU/g2myg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946s1pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:23:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b79f4b35b7so45166305ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314206; x=1777919006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg0D8zQXCU=;
        b=A3CedNtsyaZwpepRufyNtsW3HmEKPLbPuh4NIPmPxfYhTd4VlMZ6eEIA8prEcUGD1P
         AeEUicuITo9EK4FMl7XOxP4baGzTq1GiGJIBR2w8iMI5S3coI6Fv8AOLLcsqdYG0y8/w
         JbfqQIQ5q9vhE8+cYbD2k6iJS7/luEQXtLqGoKSR9L7mvKL8nTR2zElCDwqpk7Gxn6q0
         IIL6wAngsfUliRrS79z/hheASy78xkKbfNkh1SGGB357pm2U1r3Jp04QN69QlC6+zTxk
         h1bsMUqMYCKOT/H06EF9d/0ZeNvC8f9no98sOhp6M43RXiTgNgNXb4ggC/UWGv/t1tSY
         IeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314206; x=1777919006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gtoBvIM0vtUEFDzhqKijfXiWCi/e0CvPeg0D8zQXCU=;
        b=ne5dlxEM9VG2oHhb7DI/2O0DyLLfJpBPDNZEoTOOdBxtlSuooRcodPpyE0n6CGsItd
         QDommS8EzaPqBas8rCtV+xW57StbKigqHVGbc6Ul9zrRScQCxwUrjHohjGhHVgoSkr/l
         AV/MWSNgiRFJi2G4gUZK55MLR8fFU25s8tXOcc4jaE3WnHW78A3JlFOLe28+fZpnMr8q
         kqwl9EEDRCk9Chew0SxERj+ENFOOMwWDgPePCo/C+47exqgGUpRuiqj/ls5J9DVLdTsc
         mgYS4gAv2NEtYQcgpNuIrNkWQyAwuruBrOsfhz+3cf89/nalw9bYW/hQQ7FIh93y3s80
         E+ew==
X-Gm-Message-State: AOJu0YzizdDOB+kq8/NqbIAFJUhzAMUrv4XUqA2fp+Fr2k2N6eSte0lw
	HU3n5QteNi6jREBE7D4nboXyfJLITtHE0p96Bwyj/+KNQ5PKxR4Bhm4mkGTLi7Nei+stbnlH6j8
	8WYmDr3r3fp4FUCcAQ7T8++qFyygMOCJBDg1KclMn0C1LZ2ckQ429uM35EEBwdKo0BNRD
X-Gm-Gg: AeBDietEENUB0M4dXKhl1iHJlpYLFgUOkLGwXFbPd+VgqjCL6sFirvoehT1O24qHuJC
	ZdUuVZlPA46r8wlw4ZnNJP+ujAUfRb/qUtYaTAlPjJYYw05hF0JAqEzlx0SLfn6xcEVW4EpPpm8
	5tudzr+y0KumQ9gRU3sVS+J0xSsRTJO18YvfAK3m04n7n5WoqpTSw6YVkrY8eh7+m9f+EHKryYV
	gWTCrdvsp6AOWMXW65swj/BTsbmi3XpoCv7R0rTwlmJqQpME0HDZfQeSuR7j5O12em7epFOTMdU
	JHPeiM9ml2GALecCZwU73OKyuH+Ip65Gqz+gNyesza5RrD39z3MwriV7orkurg64PUiGxEtwuy4
	pN9i6+76ey2mIGc17cLGeT9tx/RZEbhW7HqNS3Q7BfJT4TPkDL8tcHBWfkXA=
X-Received: by 2002:a17:903:1a2d:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b97a9336f0mr3015475ad.21.1777314205609;
        Mon, 27 Apr 2026 11:23:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2b2:9f45:2266 with SMTP id d9443c01a7336-2b97a9336f0mr3015125ad.21.1777314205010;
        Mon, 27 Apr 2026 11:23:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d066sm1224745ad.67.2026.04.27.11.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:23:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi cpu-bwmon compatible
Date: Mon, 27 Apr 2026 23:52:55 +0530
Message-ID: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efa99e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fFZ-BlF9OTnTLI8sbqgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Hp0HwVOscscuhnMuZxDwqsEUuS2PufZh
X-Proofpoint-ORIG-GUID: Hp0HwVOscscuhnMuZxDwqsEUuS2PufZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfX++2WsPDubJyy
 CQSb3mwlfG0NlLYrQP4dQcy7jIAVieZRPSUD2BLfbNdVPZlcUsD7cN/cGG/F77wfZfXZe5jVtMk
 rMRbtaJ8AwDEcJNkuAzH8dbU15xVeL+ygFG/PKxjXLXc9XwaKoIFKPQQj5IvrVmGfYyliJESPE1
 6D200hiy9bT+NeBy+S1pl7Ftiu7ydsC0rAy/adRJOWbnGHRb+W7/8lYwM2DcbbFSw1aztlKPWIM
 r/RzUSIBm4S3fqcFY4VYQxusyQV92J2foVoZsNi+5LWjnOsAFmucHD5tnGRzAPFojteYdaCE40i
 RXTXm6WO1Df/LGShzOUFfEzKAKiHq0TV5qMQMQwYVXcljq4JJDvCnI6zLB4v2hNd5zuIRx9YZ9E
 6hGCJE+MO5sLxU8QPr/eguOr2/UFySJPFVUBQStIxO8iGco6LGnMmaOz1aEzsNApAbbtiLBAMNu
 QRz8FXuCwrcepfjv18A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270196
X-Rspamd-Queue-Id: 8DAB64787D5
X-Rspamd-Action: no action
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the Qualcomm Hawi SoC compatible string for the CPU bandwidth
monitor and there is single instance present globally to monitor
the traffic from CPU to LLCC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ce79521bb1ef..82b1d94d3010 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cpu-bwmon
+              - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
-- 
2.53.0


