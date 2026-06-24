Return-Path: <linux-arm-msm+bounces-114394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HNEHOrQrPGqHkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1976C0E63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fi9H6CQK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j4xxeLun;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114394-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114394-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 024ED30B75A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDED42F7AC1;
	Wed, 24 Jun 2026 19:09:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E3D33F5B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328156; cv=none; b=EQC74tjuC2y0yG6NHIiEWtuTfblzC26Q5urlXkWs0vxIzyu/hnvtDW6+Z7Z2goLjYKr2U3reR1qkfP1iJ1JLxOCPdK1CZqSVkrTtJl8eT5O5Q3KvY/OBTfBtehSQgdmGKqwyZgtdLthNx6WYJQDML3yNrA7wz2Fjddti1CpVNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328156; c=relaxed/simple;
	bh=ugptK5yPWV3b0e5LxrA3hkpcXCBCQxYSIHBrFGxSoCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0NlMVUNgfPoXaFiJlZTBTFP4ZbJUyol/H0wMPAdmSnAWBHtLLAbPL9pCsYFfY/2exQz/J0o3WGnU5DNIdIwcxGAqvsDOiTZ+9RUqzJ8fIL7mgbVnG7MMusoXJCE+AxDwxBkPcJFSgXy+ftx0cuzm1fEVCRwILl3uRuwEbXHVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fi9H6CQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4xxeLun; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj1pF978289
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cNfZ+GRBh+z
	VDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=; b=fi9H6CQKcQGUgoLfvBtfXt6kVYP
	qMr8/AMOl/mxm9k2qqeqEtXweEw1nNg41+PyV4+K3CEORJuFraPkwawz6KF3p7WQ
	B/ZKc4kQiry61NQx4Dv5xa7hrbn0dGOE30qOcEBwYgXt5cyfQp0oodGCZn2lCo9C
	k7G8QopO9mLo4j4hkUi2Q54sr0ltHLsEo/mcPQF0ARHLDejRZp+uPFoXOFRJtEai
	m3U/rdDrcIeJ6E4Ni0432G5meden6jghjG7tP56ArBR5Y583Ic+5FSCLWycWWVSa
	aMwwSE+ZuxZhPJKfSugHlbd1BVkYv1FnyNaGUMyTEwjprnokeH187rXi9yQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpau5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso105497b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328153; x=1782932953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNfZ+GRBh+zVDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=;
        b=j4xxeLunSQXi+APoR/5d8TqL+bny8yH9RZLJLW7z1lHxwA7FhrQdgShXF1B1XEbSsC
         XMiChYE3hZvHBrdGhg19pI+VJRVom/3djg+Gr5NZvFYSKrDCbIDmrLhPNmMr7Y8kOa8Q
         UkoTq8k4UpOaWDePAH8qOuMqKXJBkTsRSatxtsjS1yooZrvlKEeIgQICWgcDVc7W3AjQ
         UyLwdR2Wo4hBhQPe1tgCVFaBqCv6lysrk3ac6zAY+10nRhoJk5UoRuv+JmrN9uSwmn/T
         uHy3COWCSRNyoMkzRbQBN+Y30tHEc8am4Jhxm54N2Nt89qqdv6VxNXz0dKeVJ11TPZk6
         3cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328153; x=1782932953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNfZ+GRBh+zVDTSEbAPJDe09lxxojv7nRV4D8SdviFQ=;
        b=k08QnKKya6n9qUxFYIis7tPdGXgRAvOfJoi2w4OgF7CrkiZtnC/lhA66agU911yolT
         8CvzmA/k2X4zRtHwAUFtYuVZ6B5kKpJ5UUcpe/KVw8j8hnWvPbKHhdVq/EMGZT/V38zh
         Y9cO3ZSzUE2qaI+qnUCTDf8g9ZtVMLNEYHflkfYUvwtc+eI0jY5jQxp9Mgby4XUC95UY
         RjU/xNRUzQxzYV+vj479UL8JUYhrRfgMr3m2zIfpZ77RPUPJEUVsOgdFo12nuJCM5CGn
         sz7V2bP4xBJRNGoao2NunLMhRrSCM3v2BF1VnsTr19TgdKMev0Rcf1Bu28SE5ertM7jD
         mjLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ABauV4Q8SE2fZ2bvX6KVP7iWfzr9e2lVDkO5SypJ9bVAI9tRz73J7pDj4gp1eXX7wSyHMv7H6UDPPUzrP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8w8yOttRrV5fsWhMLS4NZiEPscZb4/je1jRfTYLRY2ktfnW7L
	1LEv8bHrfFCU3ZAv5fJ3C+QTHpPxmYlaO80z5LQq28lRdf8hHM/DAwy2akVrR+LhGOWikWSuYdu
	SG9zV/GEYQqYpD8FVkN7/fCRHP4MM8PMbXcBXlPv07+whUd9WhAObaIVod3gzXAbRVBJd
X-Gm-Gg: AfdE7ckbbwpfJ5jg1n5u9yNsg6fLca8NV/ekw0j16yK8JcW96gJw86bFWyl91V7Md5Z
	Ji6JdsE07o1I0uJl4r9fu/ZeVEIha9iyKbWDyTo7CCbQYWNokJMD/ef/7toCx+4U1URuyAF5nlW
	ahHwuxPAhfboc/WIVBkPMPjkFZK+I9BQUUGeN8hUVNvx0QWxGWiwYHoJyHuq7FhymzSlzviAecx
	Y5gTrCYlD5ONRSFU5gAZWVvT7IToihf5kll19WAo9NEO4FxXiK3oleCAK3r+uTiwHcSW+Diff9h
	WSXmueQZTUPh9aY/SvrwiH0HXFOmy+5HPQZ/3NEJBYGM/kZmIDTcUiRBcVYqkH56svwnlee4KyE
	X+29waHobbOrYf+iPsvmMb72m8mIg8knpxW7gEA==
X-Received: by 2002:a05:6a00:2e21:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-845ad1c0d76mr1665642b3a.4.1782328153093;
        Wed, 24 Jun 2026 12:09:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e21:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-845ad1c0d76mr1665591b3a.4.1782328152548;
        Wed, 24 Jun 2026 12:09:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 08/19] arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:19 +0530
Message-ID: <20260624190830.3131112-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DNieNm2E8JZs2wazF9QY9AAm5hulAaU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX+fhQsRNuGEy2
 oet5DH0cCrDER1K6i6SYh2hX/YV0LymBq3wAHjqCXan29kwHj3D2UFD+sciyIe1ZtWEw1ULjNzy
 QJhG9MtkYMMwDREXQQezO149IRS+QXWePDVf/4sWfYs4/HAuopkJBGuL3RoyDnwoqtgxbPvfpyR
 7Qkf1t3GCDgvI33nLdKEjBL6ejNxZuT61i6k7wyMgY+COvRyHe4r9LFTzyPPpKDXISYI9HG1TWP
 nOu20Zy7XlwoWNY1agbZ2vBeGxsFPIrj69zLmeGzdW8CAJRLk+EB4ddNEDhyQiMRcf+vl1QK5gq
 nH3qlVSJ6aO7iyTw5eUhREn2BDjDfvMZixhGhY5PlpBx08NTVmhrVXre1FecnuWb5Qn+r5h+tz5
 E5q895eYBSpbY0pGW3DwWIRv5nRr+Q==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3c2b59 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX8wVqDSvKqIHT
 DZlIxQ35NVsmEonGSfhzOI7C/QLFPxgphHLKLbf+Bv6It8JS0RL/b/SR8fH01VaMzM10IimXwfj
 dV/7+R6u5kdfg5810LSGcnjZq3+FlEQ=
X-Proofpoint-GUID: DNieNm2E8JZs2wazF9QY9AAm5hulAaU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114394-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B1976C0E63

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..a1708bd15076 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6825,6 +6826,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


