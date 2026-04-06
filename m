Return-Path: <linux-arm-msm+bounces-102023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHmfLSg81GlqsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:05:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DCA3A804C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D4E93022F5E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558BE39FCDB;
	Mon,  6 Apr 2026 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1bpV+1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ0XwRvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D838C40B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516694; cv=none; b=hDY5AUpfJrkHGTPry7Es0fwW+8Ie748PA8zbk/qGiTOrBPM8oP6GrMB28eXRAdHFzqXKm40hf/22xYYEcqHB5ukNWXH3glaN9UZHWnhzPLkpz9K2cm17cQQNxMurHkAdqefoOLQIk7eNQzFRGyNIurfA2H3WwpXfZOfMcPOot+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516694; c=relaxed/simple;
	bh=PQ6kFlkujbjEumz0+/YOBAnPDDNcW8WkaM8HVaueoDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L6T/VHzCWNhlyL65felRMk9KXJ/oRy0E1Lvj6SfrslWrSINDg0jsTIE8/Pae3VYF48XISPLWkomz5ClaFk+NeCOJxgpobf9vZ3tI8gjpSuemEEZgCsw0/n0bv7s76eob8YmwPY5odMYlazcvLec1Q9E7MisYTGBndCHTICaExb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1bpV+1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZ0XwRvJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSDUo2327993
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ow0rpNiShQqftCOV3v2c5h
	yeObiaytexs3/f9bNlGQU=; b=a1bpV+1UjqNKQ1uHNBcnpoYZeno/N8U4aJ3nMM
	qIQj1u1ZW/QRxG/a4UtMBevi4wf7xx+9dBvh2Co8mlLusdKEzxg628uaAq2b7pbU
	7vX6StTq5+bx+5u1DOqGBITExbwZuORW2lnUv9fiz6aPBoQmmkTUfE75qgR53lOd
	t0cRbTneZal9tnJwU8UMv6P8Ih0CNa9IOWnX4ga/cZHZRJiYFbsNy5kndRXqgQpl
	LErfTLPT6b9kYzwrF1AaNA4F3BHFLUzAivTPddBhtyIFJtedynRetfI/p/Vta+pK
	J+iOVU44Jb1P7k8Y56eaTsM/08jwyUHoB+2TpiEKx24uP8+w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4r6mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:04:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d054421d19so5118259eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775516691; x=1776121491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow0rpNiShQqftCOV3v2c5hyeObiaytexs3/f9bNlGQU=;
        b=QZ0XwRvJ4oQdgAdE0gM9udl4ymjRS6iXzrNjCtM6fHpeWe0w5GG6nMTedEZU1ESl09
         atBRQP8/xAA/icgNGm2zJ+ec9q07jTdHwBYFGs3nSasRWEG7qSrBIAn5V5vI+WRVhh4/
         smcJ8NDgcZtabqysB4svKPGGM1rgFYHonUSjOzEp/u+p6HwbY9W8deqUaOmC4uiiYQBD
         nTdBgH9d6BIxV1pfnd3DVo/RoN8nfO6c89wtj5MtU2tLyOxA+x019bQsWSFZFyneZ9B7
         TjOXAxNfduDCSuKYmqPUMxFp8Gl0fAnspAEQXtleX7ocHmmTnEdJNdy9hEtTCaxB7MLz
         paDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516691; x=1776121491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ow0rpNiShQqftCOV3v2c5hyeObiaytexs3/f9bNlGQU=;
        b=MLpT+0G4lqO58nyUQa8Yq35kLKgtGKHwUyuNXvhnEnkIVpbUB4tpBQjoRqPAarNPZn
         1WP/oVQIlyj9IMJbF/EG/C36bHnLSe1pFkOlRCicQx1nhx03xs0QHexcZjTPBwcmtqKO
         acOMWVIsPGsoCwM+8sz79et/gA5BbNNJF7Nwuz+Lj3KoGyn/Yp8My0IRoVNMqnSgjUDu
         EsH1ocFihR6diHcPVi8n7QMa7STeBOtcCLNGSKUbV+xr2hROqe3evEkBDdprhKv8ZUpb
         kMxFBFpGK/c/lzPdAlHm+zSCDfbznibf861lPH5UTCvL7VWUDFSKI549zibs//60+iqW
         dYDA==
X-Gm-Message-State: AOJu0YysU9IDljazoDOo+/ZzB/1ZQaQXjyBO1RGxcbaNsJyOnyJ11cJD
	3i42UD156SEty3WfLsz6WIX2i1TKh7f9Ziuz/uyF5SDz475nQlVo/zYnUdlIE9ODe7OOVaWJqlB
	x6R/SdW9jpoLI2YV6iOPGIKLLhCmP67VbALInDGNBlaePkIo8zcX0F7+5sS0fQfYKz7eg
X-Gm-Gg: AeBDietAab5hUkfQ8loN6hJnvaVziIswWQy6i52QOsUY8mv3OU9QPTmuQYSj4hLqhYO
	19WPAgNvKQUk/+KZGiigP1FtPceZQjpOzw6nqnbOSJKa6/uvL1O7xFQaUf3IjlSR1uS3v5RgUcQ
	DpicPs+bdzHb5thfTg6z3iLqJvyzcPjtuRxG35KilYboK+/F02EaWSKfbO9bf3ra9aPj/FNo9Ow
	f3lIuISK9b0wGrciglxM6dbJnMav2m/R6rP64O/gbpO8dIkeNfzu2s6ZAJV8/BUhgbYr/85QwYH
	koalfKkBggZm6uvjJ2r8pv93gB1gUjM6fun8hEmquHQnShZrRc+xRz0lISB05+Cy2tSlpHoOvS8
	QgZFg9Zc72Uwf3qOnvtfmFv7Vw0tBajkussvVeQwHyLMehJu6p8ijVmiYZbxRA0sMv/UjJTfRqz
	Wa
X-Received: by 2002:a05:7022:52b:b0:11a:51f9:db0 with SMTP id a92af1059eb24-12bfb6fbd8bmr7961170c88.11.1775516691156;
        Mon, 06 Apr 2026 16:04:51 -0700 (PDT)
X-Received: by 2002:a05:7022:52b:b0:11a:51f9:db0 with SMTP id a92af1059eb24-12bfb6fbd8bmr7961144c88.11.1775516690543;
        Mon, 06 Apr 2026 16:04:50 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm14853281eec.19.2026.04.06.16.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:04:50 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] interconnect: qcom: Add support for upcoming Hawi
 SoC
Date: Mon, 06 Apr 2026 16:04:40 -0700
Message-Id: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAg81GkC/0XMTQ7CIBCG4as0s5aGn1JbV97DdIFAZRJbKihqG
 u4uNiZuJnknX54Vog1oIxyqFYJNGNHPJfiuAu3UfLEETWnglLdUMEZQa+LUE4lpjWatHLteSCj
 zJdgRXxt1Gko7jHcf3puc2Pf7QwT9I4kRSpqzbFRv90Z0+uhjrG8PddV+mupyYMg5fwAj5mUJp
 wAAAA==
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775516689; l=1089;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=PQ6kFlkujbjEumz0+/YOBAnPDDNcW8WkaM8HVaueoDQ=;
 b=GLMWv68S7fULcidmATT0KBMV0+k1//HKKWxC70kzcqFv9TMdn0dS7em2C7bofGyNqqQAFoVmP
 NNjIKDP+q+JB1pKGV7aG7GxZOyLtwRaJST6ULWitoNdCJk+ZbYMreo4
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIyNiBTYWx0ZWRfX5Liysrpw89Yv
 CuzT1IIne4PVaAsAduwHLt7u/fMydpdngJp9oD4dodIIqzY/paKh18oPQjdWqRetMjf5FeXnvV8
 VLR6yyjwH9wpLjGcTG0vk8PdzyB1ixnS25nFzJZy+P1Ok3DhjUVKQ/xVQTFvbM38aEqssVF3OGh
 5W7a8d9BxYESyBN46axRwUUvq98MbfruWdSqHLFeJVlzpcS1P4ocwdPNR3fFdtMVoiN+FD3wlAj
 HEnUugAQ/n67VEoZsmqhG2K/FZDFl+nNoVczirx3BW0/zWBVs2HwoQC+m1mpUJgXAco/HfcvaEe
 XPTexz4MHD/bP6Bmu+wdWWIaIEssHGVZ9V50KWe27+WJZuG4f2MdPDdAr6DKwu6x8Uy4/JOUbSm
 0iKb84hU0BnUOpWOcUNL81TweDoJzTMuln757Ukf8wpQ2UrsCsU9XkIh2w0qCJx4XUFwgrzqDwm
 OijwYDb9I4q5cHkM8yA==
X-Proofpoint-ORIG-GUID: asFMyGVyff0EUgLMfDneFxoJ-AErzPT8
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d43c13 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Q3xDJHZUcaiZJ3d9McA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: asFMyGVyff0EUgLMfDneFxoJ-AErzPT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060226
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102023-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38DCA3A804C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Changes in v2:
- Fix warning reported by dt_binding_check.
- Collected Acked-bys
- Link to v1: https://lore.kernel.org/r/20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com

---
Vivek Aknurwar (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  131 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2327 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


