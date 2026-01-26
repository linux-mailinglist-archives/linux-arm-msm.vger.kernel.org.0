Return-Path: <linux-arm-msm+bounces-90480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAPeOArNdmktWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC650836C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 03:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 111543002912
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 02:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3F1231A23;
	Mon, 26 Jan 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sa/pSIOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5zpL9oU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C631C21ABB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393393; cv=none; b=nAwBO4ipgePDHDvZdmHyuS8PckTOTN+DjJPFt63fTd7cygGeSRs6sI5MZZdgwXQ///GyoMKRHG6kIIXbVF5/1uEfeA9BhazqOZ4aqO2Sy+IicxgY8UFE7kVvWMeU5wWSF323odpUcuUTdkzg4jQAsCSCKrw5vyfGTVANguJDM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393393; c=relaxed/simple;
	bh=JEd3DfqN/K5qIES7JtABDfJMqyIJ9oHtt5fbP6+eFbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7KLupcatytD/1vqRPx3ebHPtrGOar9YeNkioc/CwXRtOsTSuirTiSgkKyRtalcI4GDtnSXhW7Myghz6Z5Kmsx8xqq0KwKqC4XzY03IqZRfzoZ2imOIlmMtd4Mj1FuJxBg2Je/YGXN07S/BgxKHXq7vwmeJDyY7dJhfzJo6SJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sa/pSIOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5zpL9oU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PJlDsO2026043
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=; b=Sa/pSIObmENZhzFc
	mFFCIjD2QZr1pQXht8BvI69YPxxTpEGKGOc3egJiYdg15AaBbqcjbGOvP/ybmYjm
	PM8aGwC/E8qJTR/F03YSWYX99M/bc2pSA+/EcZbwrt6y3bFgKHDKbrpmmYCnnNsf
	aMMRvLq6syX7/z+AM8ez/U0XFcxcsoIhj7pJdr/tyYa+eJa6DzN+jHHVkcPetfC0
	4QBdvXTdQe3sX+Fp0Ga2vdJTw89O+DBGYTpXrmjZS02wUc/ojA50LjqQqUVZXWiT
	qadRqQd6L9Fj9LU+YjMoZnK7dqlxH4Pclx42MBJ2BLi3Leua5Vs9dTner38FYHjB
	JEgGuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dk41y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:09:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a341ac9fso322717285a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 18:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393385; x=1769998185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=;
        b=G5zpL9oU0lWvp7sJy3dlAiekS+6eRwk5sQnl4sIBuT5qRv69TIgqYB8133y8As9786
         Alp2fT0nhYRqhDI8+6/KG7UmmOpQShJ7RUyKS+z77WIjn/J/vhiZWm63Ft+KuaF3tD/O
         +xb3xMOJZCfHGf5Ti6oeTW23j4XfGht+DLGWMC7T/coUmp0KndZAlm66IwJnb7Pg/caH
         RVknV29tDiW/gTvFCe4+9KFVu81kvxIMzVAcHdcbQuuYxDwLpoJYL2Lq3GUtet4RWROi
         VdD/S1SQZEOWavtXGaiY0C+F4VppkKybah7Yw2TIHnJ0pFg4nN0o/FXl1OrGKk4tG8Wa
         aa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393385; x=1769998185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=;
        b=SLi4jeB2rI5o1+OQPDd1xbfzH0o0KspdOa9kP4D48IVsb2G8JP09UKdFuLSlkMjfd+
         u0EE/Mnxp6F96tOTDySFjRGL+gDnrvcmt9PhCPkNe7Wk1Gg28HCiqXEKTveq2Z4HcK8H
         R8wc40zc7nxZP5gYr0WrxhVIsFwOCsUjOuW0H7DU/dcIFmCib421/rsT6XFyCBBymIhJ
         EAVZlGr7q7TvaA3pmtBPMTkI4K6YaU1i7K9WEcP4fmylMGW3MzllFgiM5/vHZNJOFk6k
         m1mPiafskpfnj0xYoEkPnTG3cC3gzrUi/r1EHUwAmBoL9bdmECv5NJGVJITGVS6fq1ev
         DTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX62m/hBEW4LIQqCRk03ZBaeQN9jFwm2znyQKx9+o1q4uHcX/AEeqHIyB7mG5H+3Y6E5O+UQ0uOwPuLrXZu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9Q3/HqlRV7yEyhi2u734u6vU9urEeizk2DQajZ8Hp2MAR8Ow
	PVjICJqf5zVXkSSxRhymtkf6OZvVYVdnTnDE+xU+TAa66ng5+pPsyWTcLGL2XW9o9C1XC7hCajC
	x7bRahVePjGdHk4Quq+VxMKpNLYmeCkFZavj0FpVZ8MlGt2QiVDLxgPV/Xn3aVYWFFTws
X-Gm-Gg: AZuq6aI0ZxzOl+4mXdDv6YmuTas1i1ZtsT2g+acVnyd7d8EbZ971IWrg2B4vCICpyub
	5Dweo45F2/jll1wJ3ImRiFJ8zEckLy0pUzJhLOGnQUj+ZOGLpmurDlwJ7uUlyFKWLsA2q6koOK/
	JmQIusVj5vN0DH51kSfml4hxtIbOGRtbxQY+whnThW7cPxwAwjMkJ+zLc1gpoMbi8TQjDCFfteW
	PLH3q2RpcVP5HL+C1Uhuz49goWFROOBs771qfpmVKSAqHoWfkq9QlXGFjqiWp4fLb4S/TlTA65a
	Lkj9uOYOnVtCeiM+BerJ0tjd72fz5PUvhQfBMGozynelRjd1Q5PR1ZJwWWwnz34myRE3Q5URYck
	HoIDkfdIHiM2JTnpD4ZrweAAZOFYQm8Hg2Zfq62wFEHfo/dZIkgK6hhelwfODS1om/xmgFnb2vo
	v3qMtv6VpUQIpWONu0TNQoGl4=
X-Received: by 2002:a05:620a:3199:b0:8c6:9fc2:9f91 with SMTP id af79cd13be357-8c6f9590c5cmr354606385a.30.1769393384636;
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8c6:9fc2:9f91 with SMTP id af79cd13be357-8c6f9590c5cmr354603385a.30.1769393384211;
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 04:09:37 +0200
Subject: [PATCH v2 2/4] media: dt-bindings: qcom,sc7280-venus: drop non-PAS
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JEd3DfqN/K5qIES7JtABDfJMqyIJ9oHtt5fbP6+eFbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszjKZbGDSiJEXw18Hmw3P7Py7hKEIulRnQGN
 KQO2K69Kw+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM4wAKCRCLPIo+Aiko
 1dB9B/0eFUGFn86X+dv5oRghrs+Ba8ZJJfGaJA9byKixkce2MnC9NzkBsZch12SgiDIb8ecSoox
 Au4cgPAOk/RdFbXGLEHVL66UewSOjO7mf/td4SmTNQo1T2VNV1axcORToenbLH2ZVMaidd5CorP
 eSohVbAjaGzG/4BXeoMbto439ctB9NntQuTylMwZE3Lo6qLZvgBc9gHatwy1YOrXOdiwEVsT+xS
 uzGpwP6Tn9Z3z0WxiQvpjYTUTOy1QLazJCLB5+Bp/mIKUNb6wOWrMXmjvXQEcBGpxl9vf+qXgMv
 x4+PdcLS0NR9dQzQ5mqWJMwY75YS7dvHfT1g8PDYrboX67tB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX7i2CzkhMhb5S
 WTjYp89ySuzjCK4FP9bO0Q+D5f610CuhAlS7+JlMdIhPMhWI7B4RTLo51Q4z/VkC04QkbJ7z/V5
 xU/ByeITHPY3Iaq5cL47CsG2E0XpBCKzdDv+itm3dYHzN0/s3B/RqPl5Y22LVn1g7Evi+u5LjdI
 D3Dhj214LuoojnCHBXwVOWd8UIRifaml39uGtgidbcJ52mt9iSOLkooUG/40w6Wh7RS1oSPYrsX
 ITw1tyL+6qOy/c6S2aczhUKr9u0+HRVdTB+/8phDskdW27MdBmACk195yVI5ZlVIGVnzSnIoi3w
 +YGikOrJk1xcze+diHwcy+s60pxhGdoGL7V6ga0YPJnoLQS8KEIP8OuCICDUjZT+fOszAJgikNR
 xqRkMLyKH82CiSL4GLfU1qHGkEJbZSIgVE2aPlrkvrJWYy4Pe9oOmr95V+GFZF9RQd4HqrTAEqC
 l8uaPJJIYdqxTjYHkNA==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6976cce9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zCM7-lDapuS4FQW10A4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: w02JNTpqZym_2Z8DPJZ1DOnp4U-NDkqF
X-Proofpoint-GUID: w02JNTpqZym_2Z8DPJZ1DOnp4U-NDkqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90480-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC650836C6
X-Rspamd-Action: no action

The only users of the non-PAS setup on SC7280 platform are the ChromeOS
devices, which were cancelled before reaching end users. Iris, the
alternative driver for the same hardware, does not support non-PAS
setup. It is expected that in future both Venus and Iris devices will
use different ABI for non-PAS (EL2) setup.

In order to declare only the future-proof hardware description drop
support for non-PAS setup from the SC7280 Venus schema (breaking almost
non-existing SC7280 ChromeOS devices).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..9725fcb761dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,8 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     maxItems: 2
@@ -120,12 +119,7 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
-        iommus = <&apps_smmu 0x2180 0x20>,
-                 <&apps_smmu 0x2184 0x20>;
+        iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;
-
-        video-firmware {
-            iommus = <&apps_smmu 0x21a2 0x0>;
-        };
     };

-- 
2.47.3


