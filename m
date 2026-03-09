Return-Path: <linux-arm-msm+bounces-96303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIeWN3b5rmnZKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:46:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5423CFC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDF9830C574C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 16:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C77F3E558A;
	Mon,  9 Mar 2026 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foTonYht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYhLLJaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7E2D3ED1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074120; cv=none; b=LvRkpHZ2qU83kUMnOd+xS8Hf0cf9NCBEImK2vr8iFcR+nX3pUxqXTJyOxA20mg67b43cLhGQSoFR5sC1zP+EQa6dZvczls2k3dhQoc9REgIr9H1AnfNv121wORarLSxplHDNzVsEMrwLX2ZMdaSv/AUZfaLlzWsd+tUmVacmVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074120; c=relaxed/simple;
	bh=66wRObVYpzCrO/A5ACXGOc87Enr1h4SzNjeBFnUL3pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FzI1Tfi6j9dFQL4BslZ90BbSvbC1yQF6oD/jmjnf918h5uZX/3G85tBa+2+b2gEzcfa+RY7T5vFBN7BQcZadjF/2z31IxQsLPoyMPWfjmjXPTBKtAlxc/85VffsNig0NC317dfjclyP/et/4w3FXZzaiWAvGwFnsjpjddnzr2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foTonYht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYhLLJaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629G6fEp2270294
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 16:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ecUqd5JPev+91MxPWPESWO
	NzPC7EpW4EpwmNWadHEbE=; b=foTonYhtPLqudTwCn/uzuTXchMbF3RLoSaHVAn
	bTh7mUVSUeYG99kkHHz0dCz/X+7EnxeVhPbeQdhkd+rPzqYvd9NXVnsrye5dJMYi
	1nOtLfmJNUdwEy0zbr+A4ti6cB8irbsHxdYZa5B287nMm6pH6psA99ubCSRs6Urx
	hAnBgYGJ5yjvqwTIVA6Ii/Kf95rEKbE0uAc3Ya/HcH/iQCDoEUOaI2Ckwg04z/LU
	GhuE04NyGaft3UPkSgpIxl41mwvF82KsMiaH5RJ9wgjwKTEROncSzj1JibYS9Iwp
	FtQWsA2aQHAYXK/6bsNGWsmdAYT6nvihTyyHAoq4x/6n50bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekr3rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:35:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81c571a5so805185885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773074116; x=1773678916; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecUqd5JPev+91MxPWPESWONzPC7EpW4EpwmNWadHEbE=;
        b=eYhLLJaWaSYjXv+HLq1d6EC+1VLdqoAGjz3RtnGteZr2eH3iwvrCsvMUEd03OGub6s
         WqtrW1EFrenuAnywksAN8dlSRrOwOEE3Sm94iEjhl+EqkK2edaAEAKdGL4Od7ugOciEz
         EL5HDZLRtcdg+iPLGW2U/lOBe4PqNiAM0PBlct7sY4t1Cezilo8FzNWv/IRK+3jkPqi0
         ekw+aA1eppaBRmElUHDRdR3UTNR1bW0Bg8LmEM9420dqpylTASrV9vGOFk3Hhk/iFXKd
         pASdtuz2P61bWsE4hui7HaHlB1PL6LQ0ypfHfZ0OigiqpTA6SO081C2f+Ycjb36Vq1YB
         rCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074116; x=1773678916;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecUqd5JPev+91MxPWPESWONzPC7EpW4EpwmNWadHEbE=;
        b=KXLJLDuC7fMOPyYoh1RNPNXX2wEBUeeVtYktx5JobzCrpWJpnvSr4HlhGsM0mafVyD
         kEA/AW3b4JtidO8ap9+i8Vhul6fh84NNvRO9SGxs0jFD01hS0+OejmCq7uYr+b9tMgKL
         9Dk6d/gj2uupeciUGw1n9kGSXuso4eDQCKNqxlt621tbAt3Lt/wqeFPUCrUPYmrKmxNW
         vGnFCmzPqG/lAAM7CU32yT2DQevpI2UMcRvbCEkfFIxEZtYi6ciMaAWCSsoqR7bHWPZd
         V76pab5XYDs3UGkCK31MmY2rX+8jFMqnTEtNZ+h67jXV3u7jIqScy8PPAYleq3B+Rl4x
         uiCQ==
X-Gm-Message-State: AOJu0YyMl1GCK5EwXfEjlYQW9mkUHVyON2+6VanoXyizFzcz6DeON76N
	JoeMhDniAadxfG3DrZFio0iI4EHCbur8EuEsL4sF8ly2RI0YfL21UXsCGsNho7UYanXmtBZpBVD
	fMcxrWLsxL87ieOuQLZHMazHYDI0bEjLPaY8kLRS4BtDNnJsNEj9gZTF/xKShYHSJO9Ph
X-Gm-Gg: ATEYQzxrC/SfrIDWEmDvUfp8Q2McHUfE1DMkkE/rGlboo26vCe4k7OKCzc8MJN7bhTA
	9RBGya0fyLtlAh0LOiXf1m+zVJGEB5aKbNPkbbol309u2J37sJ9Y5iItW7HEqtfB2o1m/1tonxa
	B1ut6Z+ZtfPeEn07YiLnhd9qONWSJuZRzVazsqrkfyeJ1MiJHfpYHXSoYD+ZknIFkaK00g3KSS/
	f1JYjQzrTpC1Eg4WI3C/TMBlqqj8czvAOdFMQ/5dInFH06Tr5AwXaV3TNN/3GseQeCFWlfiTqYj
	9TTiIEku5mzCeGRs/hzXfIh6z6Fw+0A0EY651qhYPE5X+hsCSvLxrnF+ilnhVOOdJgH13a9mR1L
	P/ZWnF1ubo8Goe8hf9UAmRl+/8FshjQ==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr330191185a.0.1773074115793;
        Mon, 09 Mar 2026 09:35:15 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr330187785a.0.1773074115244;
        Mon, 09 Mar 2026 09:35:15 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm5295455e9.2.2026.03.09.09.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:35:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 18:35:11 +0200
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL72rmkC/42P3W7DIAxGXyXiepaANAnkVaZexNjp2JqfAqlWV
 X33Qrrtenf+LOt8x3cROXiOoq/uIvDVR7/MOai3SriPYT4xeMpZaKlbWUsLp/Nt2gJQiuACAc8
 Dnhm+kCCtUJZGOumwM/YgRaasgUf/vTe8H185bvjJLhXsz0Xgy5ar0+tM4BAZ3DJNPvVVo2ojj
 UJTG7KaFY6OyHXYabRaNc4NLZt63Mv+lPtqF1ZZuJheMuzXfCCCLSLEbV2XkKBVHbZkSdba9df
 DfzHl+YJiWkHm+jyz7RpZEMfH4wnasrV3WQEAAA==
X-Change-ID: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4959;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=66wRObVYpzCrO/A5ACXGOc87Enr1h4SzNjeBFnUL3pE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprvbA7fkG8dYK59Wa3kIdW07BS7qQHkcTfT91X
 i9Dk7se+A+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa72wAAKCRAbX0TJAJUV
 VoZLEAC6q5fvsdHsZb6f/14PpodlXgF2bwh4UeiWH5cvMI3fTrpQeVCoNkuirP6HAA2k2VHqCkf
 e3uR5mzNOC/IHt6UQOSKOXDLx7m8HMzExOVG7Rz9lamW6dTMTx290Xv5pRiq/PNLiLhweJrCYBH
 xGvPI5p9Y7Dzs1fQ8BBZHbUG71nz6WNYNCukDn7iQyuvfoU3e3USqL/lbP3kZi3Bo+HiCcpfm1O
 FUD5cZVrDBriPbInIGbDmDXJZ/e2h9hX22XB789oWdYptedxQ2SHk9DPYMQOURT+iv4BI5GmBwN
 3gNe8SmVqTk9jUMYTOA8KNXCc8aVKk0xIdnQAi3kwqMMqF+IXm9wtmoQAvviJyh0j76Y0XLvK/m
 IUa1+6VITMErpr9bQ72MgSbH+FC4pHxYxOHWvrn69XySmjv4ja7W1LfjjrlddoRJ9BL4RnVpIMu
 CV1iPlbr0HWjgSC/aE74QOKG9DEnKXnAIEsm211k/F/y2sEOO2OElVMYgmTzYFM3RPs5Yi1h7wC
 dKJwKkk+x0F6niMVnuu8UXGizM2mN5YQ7lky0yx0wN4gXn+VjcjQZBTtCE9kjomJVhXDnGhT9b/
 CNTCPKxgkL+PY9/Ofbhe74hS6ZmORm7W4phtWWdITKyzZCVA3K1DA3ZiQ2ijGRxYtev+QnS3DmR
 bOVzaw4Zu+lU6Vw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: oevCOu2ezLPp85xYSOnF8O2eWc3ZiNcu
X-Proofpoint-ORIG-GUID: oevCOu2ezLPp85xYSOnF8O2eWc3ZiNcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE0OCBTYWx0ZWRfXwF3N+G/F+gMz
 D6DWy8wns95Hw4WNQ6bdq1kJ6sSUjqEr0QMWSl7qkv+XlLuFHN3X6Y/petJ3zxTQk/xoik/D3HK
 xxIePiFgZWrsxZM8r0GJvveuvu5rokIdaiOAkUYtdsy6dX0FiOWch8dWGHiH744YZdC5ylUTI5B
 NkJC0ihC0QjhaZoxISN4o96lGmK4rWH1Frq4CPqgwqsqa2Y59j79x+yroUjkYA40jbgNSCMa9Xc
 aENMgYhPvAf5AWaOSw/w47YqUkOmi0Pa5/9J/DxyKscMH8sd19hkuptJazcBCSNlbWwXoLoT+07
 eKfFaXKbxTJEPfs/h7ae8WUCRxAlVexpCzt1Qr+HmbNQ2xpJ05NArpW/SvrxeAmuuVg9AuGtsct
 A0Kg9mdKhKCUn/WsT8TolZt4tRhdkQDelNWblLtMiMVYglRPbJ9/nSs7mw4/FH98CvaOx+iH34i
 TPjfz57YLPoadi4I7BQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69aef6c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zzYwUZRbWdkVaHQaSXsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090148
X-Rspamd-Queue-Id: 48F5423CFC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.38:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3a:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96303-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.936];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On CRD, the keyboard, trackpad and touchscreen are connected over I2C
and all share a 3.3V regulator.

So describe the regulator and each input device along with their
pinctrl states.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 38cdcf662ba7..0de7d35e1148 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -13,6 +13,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -139,6 +141,23 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_misc_3p3: regulator-misc-3p3 {
+		 compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&misc_3p3_reg_en>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -446,6 +465,64 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -626,6 +703,19 @@ key_vol_up_default: key-vol-up-default-state {
 	};
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
@@ -664,6 +754,33 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			output-high;
+			drive-strength = <16>;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v4
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
prerequisite-patch-id: d986d8d948eaf7b80028b2244750dc7aff7de307
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f
prerequisite-patch-id: 6a291fd702870ca28d64439313d498593996b741
prerequisite-patch-id: c96958ab5c5605fb9577645ac5bfe5912cdfebfe
prerequisite-patch-id: bfa283218723a48e54fcd842484b004c877339b7
prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
prerequisite-patch-id: 919020405b70d588fa4356a5cbfb44e67006102e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


