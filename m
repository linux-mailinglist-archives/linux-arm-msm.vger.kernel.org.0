Return-Path: <linux-arm-msm+bounces-104987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ci7Bvqo8GltWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:32:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1F484E0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A6CD3004DF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3C94218AF;
	Tue, 28 Apr 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pg520hlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2Wtb/dS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0952342EEBF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379570; cv=none; b=CkZvgCPSnc28jflLu+MmxOQEQ9oNjZYrzhrMS1ICb9gTs3biBTvT1APO4U8LCjZGk5lP9jHKtrn9FZW2EJ9zmH0RzPd9Rqsv2Zlfu9j/vI1UyAAOsyMi8jjh1gRnqb+E3uycwkkvm+1p6SLKpnAhAmQhAdwwSh1XAVfIgi8oCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379570; c=relaxed/simple;
	bh=B6ohoI+p4dHy/xUCsotP6MF75KavVp/Y+BZEzWlGK4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TN1Zcjf7Y9I6hMKOCzcjGOhXBiwnpMJ4FpTiqNJIhs4HN1lCqBNTutPKXUL903CIp8z6gbmwK9L2otHHJN1Uu2bJEI/PhBsT16PikgXwDNHzpAAy6xATT/ekI/5hRBftZbZM4e5P5P//3JE6PSJKCGPeavdu7F+dogwgGisl+DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pg520hlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2Wtb/dS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA40xg3275297
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CG+IEgRHotytIBiUFrLBWN
	4lepexZyApqAnCM0uB9Aw=; b=Pg520hlzBkDtvhPImNl+UkaEZUX3UpiVthR1u7
	RyY7HibnkYpR8j/C1FaJNOZ0kXrnj40CJpiTOZOzOCG9unjyH81NTSXsZQNiIUTn
	c0oprREGoR3l/RpqNgzQf84Y5/MH4uuvqH4PyPIKj+UbnIrHEEFTVu4SIRCmMalN
	CDHv+5v0yohJIWD0jP5PiQfX+3lQDYtBuHE7Hvu38cCcuye6UpVCn2+iq269+hhM
	wvjh6oPON5CN7QojNa/acrJaZkiDQ6ZZ1PukHGLGkOh4fKxAHh1ZOigq52iRG/Lx
	PGN/ChoGng5UtB6kb+88Y7BfTE++aroXS6oJ9Yw1h3DOavFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjgg64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:32:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff051e189so68894261cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379560; x=1777984360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CG+IEgRHotytIBiUFrLBWN4lepexZyApqAnCM0uB9Aw=;
        b=X2Wtb/dSa6FGqiuwOhMhOGTCka4AvzWDN04HyPuix4rKGQ+6r2Py4twU7qm6RkpwPY
         75uJcoop4C0wpuZs+ijGHY9+ncmpGjmL8UkWdRz/7B6EPJ9oiI1mMNkczcruIh9PULAG
         oftbmqHg3gryF01NF9366feNnA4CNXf7Gv8rtKCgds1dFOA0fNestQdLehhS/AwSFF9K
         G4sgEp8AHSFgTUuBaoGh/cC7dwwFT/CmR+GPqRs6zjpSm3IDpkeRWFrey2ZgboN4hbM1
         k34oWnKp+q+FtUzalst2FkCPz+tPByDkzfLjceiqeL20iAANFUefE5FmCmbT6tlWPsD3
         /eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379560; x=1777984360;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG+IEgRHotytIBiUFrLBWN4lepexZyApqAnCM0uB9Aw=;
        b=IK0jk2Xz3+8UteNiCNwJ1wHR9gxp90gsWFRMRsQ7GJ5rpcCKgPMOAKhNaEKgIp7iI9
         ixIWfPIR44oinO7oQTbEk4vKwcFL6sCdzi/LCswHw9v03VpjTvJ4JQwzrbYF3SS1iESk
         zFnP51sqDKXSG7v++CXo0hKnAVTAPbpLibcqmzTNM+SZpQJTU7PYQ0C8I3cJdrJCLuhe
         RXEjhYSa4QKyFKlUSm3bPxw8fogDVToc+U+78uFuHOKK9RJMmcDNmvrO6wowaMIbqpmT
         c+HMVwxwTmNopaClDSwakYb0el7b2PD/GlkhxkUHF/O8oD74Y2wEMWf15LGLTYmfAzIT
         9L/g==
X-Gm-Message-State: AOJu0Yw8p3gMd9KzGdXmajKIMAuhKkD2Ao3cdbCKB1pIMn74MV+ni0xg
	Bvl6/whQCg9TxMgmVnUKuJg57z0SjMSpsuXaqoozEUREg4ytEJzHkcu6BBG73zMI3X7mBmGDdvQ
	0wZ3cLHWPHFhlq7jwTmQtgJ2P70P/nMMR0k8+igy6wY3ps/Nk8yiumSdZvR+hYOXk10z5
X-Gm-Gg: AeBDiesIED2Pt3fBzLG8JaGhtQhCYZNY9MHuhE8A2LQufsm8b/qn+1Go4xbvlizAMBI
	j/sA1mk33zB1OI10NufBW44qxhXwWrQ+Ye9vBaOpV6L5VjOpgpWLCJ/ITQcHDKv5pgAL2+nn4HN
	lvx8ciO4uHLFz3+hhi8HrRr5POJZi5rZTzeJxlVSNHkAcf8cUq+y9Xtk4JMinU6HilaXOytDfS4
	kyREzk5Q6Yl4xPWpezaUN+IKjs6HGbd59ofXsdoS9fBOExa7qQq4eDPmrjpRTghNRLjAwEgzSiA
	O5l1indAHYm0pAH+KeWMQ2P+uhk0a7eZq7w6GF67a6MbfokGxtzNHWHCjTo4Ayb+Gv15J881yLa
	eVSVb3YUCEDpl5IMozVSaQJrfdpD48hSS/N+4ygHe
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr35013871cf.46.1777379559641;
        Tue, 28 Apr 2026 05:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr35012991cf.46.1777379558899;
        Tue, 28 Apr 2026 05:32:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774bc5cesm34221405e9.1.2026.04.28.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:32:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:32:29 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable LID sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN2o8GkC/yXMQQ6CQAxG4auQrm0yjkSCVzEuRvqLNTiYFoyGc
 HdHXX6L9xZymMLpUC1keKrrmAu2m4q6a8o9WKWYYoj7UMea++F9n41lck4iPKiwI/tojJ2kJrS
 pAVoq/cNw0dfvfTz97fP5hm76DmldP6CsJjV9AAAA
X-Change-ID: 20260424-glymur-dts-add-lid-sensor-e3da709a7ee9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=B6ohoI+p4dHy/xUCsotP6MF75KavVp/Y+BZEzWlGK4w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp8Kjj7GBF5dVL8mZG92IYGPXYjAwbwy1feM17O
 r0xJU5uONSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafCo4wAKCRAbX0TJAJUV
 VovyEACo9SlO4Hoa+tb8xPbFgZP8sZ5yA+k8srPv+QSP+E2a9wkBwQYIjxfAMMh2VvHTL2RwLeN
 KgZ2jnP2JzDzdfm+44BPmX5q91a8ggMqs4TpS8JwpttffAlTtuGsG7e7UMFCsw2Jw71iwxldGt1
 haHeO++I8wAvHF0RKBOBgUXFSfXntnFyqjkyGVrX7rZdsici5sSFy8ddsifjV2w/s0NWX2MWKAd
 jC58QJmhjEyYpCVQKlwoJ7g+LQy2zjbNyDxTKEJN6U9blJwbrg5CLZsod8k/vy/4wa1YZPsgX3w
 TyWAwzCwAGUAa4osvyRZf1wbvr1468LddrnOzkwr49KZOIdGSBDSxWl0bf2tHo8s7f3GwwNTyDQ
 FW40ckMAWEhs2d/zWrqG7EjTQdUh4Dik5I35vtau/kZgKGe5VozNO7SabFyfcfjtEjs3taNT2u+
 ZiPJdnepq5Ek2LhyIBfsxLztSg32W2ztqjAvJM501gGmhtBsCA434S8YiN+o8C3Zs1VQJDFrZz+
 sMLfWMSzVy3XkYKFYIHBfQFnb4yXKqazd0NqPc4kf9AHhXYZC/qyyk+wQGy59IJHACd4uo41x/k
 TZzLLjlDeuq45BzSwPHYqpcGJ+730RQrhXLyBJjPIGLxPUO+saibF5usGpyM3MaBJcBz2QdUcbC
 IkU0RsU0xQSRwLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNiBTYWx0ZWRfX1+YRBu9SlGK1
 Qvo+fDSA+F04HhWLL6npWciYDSkMyAOlf1dz2y7HRTKChfjldqPl5zy0EF5jrfSQSC635gQwsO3
 f52u95hqmDIdYD41bBhfVqGF54ijolYzu1lg6AfeXDp9w/YMtw2A/j45hPvP/oODgbQirh/zTbl
 IX7o+3OshasOxMJpOUtAhwFy7JVKYf8xDMxJH3t3wUnH0GIRPacjN0z/IFkZuJw1U48pxgceHyH
 YJCWIqjKdGNK6NKXikFjhDKc7ncniQg4QMmqJmGmJvrjcNcQUgTz13CSVPrcI+YJ+lkpfr1A2dZ
 Tl3WYJrJPxblJAFQdU61htIaha1L75npxyui/5R5fyKiF2qYfTPbzYGGj1cOp12mENXMRqecsIw
 wRhLl/y+dlKfCiYab8GkTtCeFBWQikjo9+JgfrYzSyGDhUAYZa4I32WesHFc7Xc2dR9DlLJKWHP
 PXcHpiYRRmVFYjIL/iA==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0a8e8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PvJN2xqvyYsZ1Jizr6wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vfkTqbJhJ40V8HX0nIFCjpPx7OG_RQGc
X-Proofpoint-ORIG-GUID: vfkTqbJhJ40V8HX0nIFCjpPx7OG_RQGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280116
X-Rspamd-Queue-Id: 98E1F484E0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104987-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

The Glymur CRD has a Hall-effect sensor used for detecting when the
lid is opened or closed. Describe it as an SW_LID gpio-key switch.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..357d4ad8380a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -10,6 +10,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/input/gpio-keys.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -44,7 +46,7 @@ sleep_clk: sleep-clk {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-0 = <&key_vol_up_default>, <&hall_int_n_default>;
 		pinctrl-names = "default";
 
 		key-volume-up {
@@ -55,6 +57,15 @@ key-volume-up {
 			linux,can-disable;
 			wakeup-source;
 		};
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
 	};
 
 	vreg_nvme: regulator-nvme {
@@ -565,6 +576,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260424-glymur-dts-add-lid-sensor-e3da709a7ee9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


