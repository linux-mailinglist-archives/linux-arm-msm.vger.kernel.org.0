Return-Path: <linux-arm-msm+bounces-113708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpNMOla1M2pGFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F278769EB73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jbwaEj7Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="a/lfk9Qp";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113708-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113708-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF1A7302704C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB4B389DE0;
	Thu, 18 Jun 2026 09:07:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB983876AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773624; cv=none; b=BXYGqPc25vxclPu8OEZH5MA1VlFmj0LoumePMigHmE5xPLyRljTZAI5cfg3BMIvz8ee7UGdUQGTod5tZAgBvONCKeKjq71fCWgyLTS6Tg3727hhZ5cZwKkhOuTntuqW3bwO9jcMN60PePkcuPzFZGr+K8NAMdtZTlDN86y5cUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773624; c=relaxed/simple;
	bh=af6bOdZ1W9cbfvbeGvSgzZBjx4KNkrqAVkux3s7tjEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KbTRgW/a5BEsD1KbfBVR8AHDzCUwZGKnc/pQgq9Tu/l6MdkJ3epXMjgsi21/+Q+UYIMwZefc/7vPkuJ/C2Nw+TOn8ieEov9an2suBEwvebSxTzB1N6onAo0Ko1Rrst5G6w6JTvliGA8B9Wyg2FGb05v5+XiuPklykID9iDh7Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbwaEj7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/lfk9Qp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FPjQ1177670
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF1qv97LlWYeWZA611ceR5Xzh2tQu7iyVQHKj5+MepA=; b=jbwaEj7QRJTGojwl
	P07FaoaxiW2Lb1wiIX1XARYyxpxcsoVLg3NVdNNew/DbH9ZQoAJ4e3tIKNZQ3wsn
	+hLPhgHVnvGCSH1ncgM9k/IWkxGP2OW8DdhrZ05Gy1n+9xH+IfbY4pDmTGT2lVL+
	iiN379eofAoKoyaOE98cjIwosDv7dVfmGfyPs82SGxxrYS19HHD0kbB3lO+mVM55
	0hUdYhds19vtf7s92aKcQMcRbbxLYkO+v07eKVMD8K6HgxHMNg/X7D49JFdmy90P
	MAsTINWpRDy1kTHd7iNb7fu8D2E6VZUhK6eI+SwWiRSmfjs5cd7h+2Rac98ynMhI
	DgjblA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kjqwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0d0516ad7so8727395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773620; x=1782378420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gF1qv97LlWYeWZA611ceR5Xzh2tQu7iyVQHKj5+MepA=;
        b=a/lfk9Qpyz5pn1gyK8oc+TWGj0WYIWqTC4oBerErfUcfLI9XRFh7CQiWh4DMeSH4ap
         tazy6oNuysrti862XipK29mt3Ew8PWd5n2ZhdvzLD4YbXaItFrHMBZHJaf9EZIUntaP5
         jRlrHxPC9r+lYTW/iDeELk0xV8Sh6zS/P4xo6gK6dyyzDsaVtkOwp+yMpmPEpJlbo/Zi
         G6gGcqLzKIuWHcd7GE1p7jbu8CTp6J53BQz1UDAHrfhInmTrhR/Pjo98ixKXjHL9lYGH
         /UahgA7phZrkrGYfoWVjwFV/gJ3k1OiDLFh+5XhLlqCgx1MqKz5OOEzzUl/4nCG8I8ic
         ZGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773620; x=1782378420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gF1qv97LlWYeWZA611ceR5Xzh2tQu7iyVQHKj5+MepA=;
        b=fYbdZRDODWUrQGwuzwbZWO0UQIUeFVJ3rQHELSZiovK13nhWwNtR3Q/+Anqd/zTeFz
         j+c9SpJkaAH2I2dgphvrUc1Ce7AEqF2LmpqE8SI23beunnUzDgekyGZ1US+mqEmM3MD9
         sjK9HwVzgB6m1WbO4hrEbk7/ck3jx32sm1gWW03M0V5aChHIFkbNyb0O3xtgzYKjSwMz
         YrPnTDiKS/mtdd7EG+Lxh7drZvyaxIVt4FSNAycrl8vExjrVvq73cfOj4lsgxF4XbH2Z
         OGiMX/pnzcKaaTzJ0StfYUR3bEtrLRa+d0UtZ/KQ8bupLAdGHXlibo+dWf5uVBpNn9Tz
         LDVA==
X-Gm-Message-State: AOJu0YyZea8KJY9cW2hIO78Ahx1wUGZe+2wecBl9+JTCdlK2zhTlkO20
	NaF33NQms9v8RvIl9/4oAyoPtFl3kVRkN4wMX2LktO13ELbf5q2+q7zf3xFJZJ1LQpFT7RDesaQ
	gUIt63oyRraoolpDCTHpZJd+X7XqQASIo8RN5OjMYFutvcBkPutN3RPC1JKq1nFlQzAh9
X-Gm-Gg: AfdE7clGa+PR4iXKQ2u2I+vqN7E9tjQI/EoDzDW/z3F2bFgcKgmO+Su9o6rviIdItoK
	YXr7b7dPdbNz1SZeTcIiph48lklhXVdbqCcanCuO4+ehDd+q6kN/ss3+dwzpkcjVDic7tBfApSO
	iurGsz2NkdbNDb7zbLVjLPuUCueDqT3hy9qmVUimxUUxWHGq5jQcPMwZLOJ3TJ2VDhd6zY20oUT
	lgtoQpmD/F2wx19rHIHRIbIIPgRrFlihqSBHhsfVd/1BQQZQOtT4/w806jlbbHg37MOc/a4KP5V
	c4Iy3ZqSWweW3jQSlBh+8oxV0I4eVN4G+gcl2ln7zUw8UTYUgcDMuw9QrLdwzm/sQWETiS6OEKs
	I6RNF3nYzYIHrz+8W13r7wY7TY3jqlk9b/qTGhAPqfFc6
X-Received: by 2002:a17:902:cf0b:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c6e4851985mr29816795ad.13.1781773620363;
        Thu, 18 Jun 2026 02:07:00 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2c6e4851985mr29816105ad.13.1781773619772;
        Thu, 18 Jun 2026 02:06:59 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:06:59 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:39 +0530
Subject: [PATCH v4 1/4] spi: dt-bindings: describe SA8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-1-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=2573;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=af6bOdZ1W9cbfvbeGvSgzZBjx4KNkrqAVkux3s7tjEU=;
 b=tqsq+yHGyUGmldkPvCnKVSHVSCcXg/Cpgp2Ltkv6m6BPwnsifmcazYaS0PU+XrTA3Mz8sUsCJ
 sS0bkV+dysKC/mbUcaPxFQAD9MoGbtqDvWaJAlqMahxAk99r9uDJM1+
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfXyygbVgsmiF8r
 j92bNXdBX4NBq/wKczl1BLg41LGGZVEZVBmZjJUMtGyH52tmbItvkSjpqs5tLVadTqmsrxhc49T
 kuh2kbmxIAl/UhVBKAcW+oWlrpGjO02V3S9SGgR6YLJWlGkmr+TWx7qdXcl1oETTIn4V/g3L8jg
 N/FmlJRNTg0qR1HWhbaK+dnSln5Xb7CfygDHadRhMOWi5nT0er1QrzBZERXYRqIEL224WSF8Xa7
 CyIEuvgS6y4c+3dgHSa6X5Kfme0iD0G9StEuTrWA0co50/R9mPYAp9kEtV449aQhejuKhJYBHNc
 labjzJB3sWRXhVJAZg/XQg2yhOxXUXOp09QSovvhdfmBWY+9NnNGk5U7R8IO5ekqDWe5AqCGaU8
 /6tV6Svk1NKJsdkDTHCKQUJ510wsB8REWpjSttfdTZmotbmMfxE3E7jyCQy3p6fOiRAsGxARAq+
 KcAdaApyAnR7REUMRQA==
X-Proofpoint-GUID: D_8ZwNMdDj7_5m0PiRSKQmwSgP26zTFi
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33b535 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: D_8ZwNMdDj7_5m0PiRSKQmwSgP26zTFi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX8WjhRFo+F23h
 A8+TVeI16FhmfVPpoGOQkF6B1wlIXcrUL/N3SFVzTDdCFhjO2oRVnn8GPiFaealDAWHckLTWPNp
 Gl036JpwUgyPKfnTiejDXq5mm0+3mLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113708-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F278769EB73

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..d9347d780ca4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-spi
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1


