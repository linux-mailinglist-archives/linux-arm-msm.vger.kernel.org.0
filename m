Return-Path: <linux-arm-msm+bounces-99074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IAOB8eUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A00552EB63C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA89300A395
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D7317C203;
	Mon, 23 Mar 2026 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6CYOZCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFSJvcjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B35214204
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228650; cv=none; b=Ywq4OHSxcFP0vQYc8SyvoFbON1m6QK0dcl836B/By9SFnglhJd4O39BhYBUST/DuwwMPmNrDTSMdHQ9cGme1rSWWo4VkS3Dtn3igyNi47Wx30ySfgyTktE+AZDVzNHSBaSIvIYZ3rDSYF6cmKxiIh4Io0aaCVfhzKa0IrSPhpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228650; c=relaxed/simple;
	bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBYuyqGi5+vs2g7MMKKeYQ34F6AwMAUdyndBK4gCAFUbjif9KaCxJ4SyhdV3mk1fcgZXCIgb2lm3b78gCuBMAYxWFbtZTq34Kj5zFZEp2W1w0k81uE7NVosTLhaoIfozGPVavTSYMcohr/bk1Q5p/GQtnEyvdfimrYw9VF4FFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6CYOZCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFSJvcjn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7D5gb3737909
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=; b=F6CYOZCLv0pLDWtx
	XTI+ZEEIDyqveP9oLmGoSXcAx5pZm1AcAf61skGhoG9Sd0NFiyWUkPge/DsKuu9c
	3I3GWJRNRI5jf2S4I6LVVUgssBDyWs2mQxvC+QD8IL1nfnv3oNLpkRGNqzztuQDO
	w8xM99YPZ28Y63KzcVOLPCdkkbWIH/TCS9+glJcBOJX8yE9hP4gA8QNTJQuNS4SZ
	2QFkUPw4QTKOoVPbGYT4iMZPDNXcghuw2O7Xrb7CMIilj96LSUURGq5m5tAPKucB
	ALOQX/CaoZwcmToG3Tv9eToqXgKxxmecBaKVThWErSuxtdAicmsPHjDFfV2zWBys
	TpTaRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghb4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091a96f0bcso141969221cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228647; x=1774833447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=cFSJvcjnY58N86jUXuCsZjCq+MsFIM9u0gjUn8NJwrhN4TeXSoC9+KlpzljE6pBR+h
         IIBx4L9+lzT5MsVUtO09jAGHrgis3W0RIyjfJiarRhQIeLR0sJyUskcIbpGGH5jL+fCp
         ixYefTnFLE1YpBnJjZoJ1WJg9Ch9Xw2oNWJ+W98Xpb8FnCpUsKKpZWiXk9sID6O7SssE
         pLywrZ1ZpR7UkieGZu0XYpnrZBl4GR1FB+1THAGYESNtawlCN1MtVZYQc0rrxzMac1j9
         2q1w9e+WF8CntMBIbFtSvsFTKvJKB23ZvE0sKnADtSPR/2SAeiM0AsOaJugCi1oXXVTY
         Z0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228647; x=1774833447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=rBvzxwOv0qrizxwxGuM7YXESfdShJWEoEiC5XpiF/fKd71827X4PeN7GspHopiGaVW
         lnO73R+2yN2VB/P2jHoChmwX/gpnBH/T1dwzXb+BsEfZfJn8JQx49Exd8NKpl9WrDh10
         56UH15ADuSOw5BeJlK+Cln6giHs7dSYQO21tZJJ5CSdIFBBP+p2XufIjdtxHp0gvy2dG
         9IE3VYeLd78Tkcvr36LH/Z57fJX7UUHsKVqh3VC4QYg5GCu2xSrzjr8pu6DuGpG6JHFQ
         63ZlymqxcEDaLjMqx5rFFi+bxV7pxUe0XUBryUwcnmWlXGlPvOO/g79wpA1YC2Ri2rc6
         sHOA==
X-Gm-Message-State: AOJu0Yym/BxPABHxbG0vAywGy6t26MzRpwnIxll0OxE0eIVvCOzzrzat
	oDk4GJCnr4W8GNcmkXqLYAPHqRMJXFrrgWZnxtsu2/t3NEq+doQhM6Zn6/8faFydibiPkF8dFf/
	5QzHVrvkkKQiMqWgK/YFZG2+q03/UtmSPI4EW8eQeDqOhDbwFXXSLS1yASbo6gcMEft1A
X-Gm-Gg: ATEYQzzBYYlwLDYJwXZ3v44LUsCpwyOC6c5pw3vfEGGxZuw78QNPpqJYMW3diVYKgz7
	NOnHf4G7UoYzx82NffK9aB8jAThDP+baT3cWsrgGk3YT5yUj2qMzMRhkNd6tEW8CVRc/k4jKgP8
	dz5paDHlVyUpNMj9BSrAsXZxQCCt93XKgOk8csy/e8UUIQIPa45Rzjtfyt8a3wVb5QTJ0WhXvRm
	9XQ7q22buDFturIU9eMJIkPTDczsOp7Miwe7oLld9e+UsmZ8B4vLsS2Imj3/IBuJGkIm/Dw4rrb
	d0ME2/zWy4UdR6c+Lwq9i9cxZ6n/8oeO5ZYI33VZrJu8mbeeTREs9P3zWpDPRE/6mEtSDSxm3Ob
	aDwODtQSLnS4C8KvjWd3a5CCwlM25k/fl3iHXBVkhK23IHDWyZp+Xdb8On4K0IbtVFjpG6Zyuv5
	Chs4x1CmLjfwoV/SppwoDu0uEKydd/wn/s9+4=
X-Received: by 2002:a05:622a:8c:b0:50b:3831:417f with SMTP id d75a77b69052e-50b3831446cmr155920551cf.45.1774228647257;
        Sun, 22 Mar 2026 18:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:50b:3831:417f with SMTP id d75a77b69052e-50b3831446cmr155920261cf.45.1774228646653;
        Sun, 22 Mar 2026 18:17:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:17 +0200
Subject: [PATCH 1/9] dt-bindings: interconnect: qcom,msm8974: drop bus
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-1-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSe3RQdQJFeHh2xXQt4k+38SLjcj2g9+v+Nc
 s9xarp4oQqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1TuBB/9xmgcOyCA7bpzuVj8O8Z0KrnHaDq0TyTJ6Bv6KFU+xUce704YUp5HWPkbolR4kyocq6t2
 c6Vn96ja8bJN1L+uS5g1Z3VxA1BTh6o4QkYu9SVsCMMieVOp82xsIu3QJtyvo9rB35eVdJbe28N
 UKf4HIOA6y1XrLi0/EQkJmRS94HEgRx8CgT00wnYEcFDnYyhwv/cOzDqAr7TkTJIDx+oTwer0Ad
 Pw1C2ncE0GzrocHxvmckHAZmyA4RA/l8kLNult6q6uwY6EbYTZ0AII/sCL7zZKVrrG7T6URI1a1
 zWtx37rlS3/gvihjkFrJ92N645FTALb+DBK1xH31qmQPYYaj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c094a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xO2zaiYFPJaqVjnw6b0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yPSQ7m1aFvu3ttiYOQ7yq-tew0RDujK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX6JazYbdIHBgs
 JmurxnCaBL2aGjNxErxY2ylzt8MC7T/1vPNpLaeNpnNX08myorHu5QpJPxOa5zs37LIyaCN4U9s
 44zGaF1VAnqACTm8R687YxJpuCzAxB5SYi3Kak6ZadcRbz2nSuNODqzPzAtnVwGybck/2O2an3A
 KbUkGYLGBXPi/e6PnMivWW38Yzcw2vAMEIhZAnyq3ousCZQBNGUIXwhA+Su5bYZnajk+F17I6Ni
 z+Cq9C40yuWgQzG0cbXv71YI8Ok8xDvFhofpuqEGi5ekNNuIb5mh0vm0b5dGJuEMXY6pjZ5m3rc
 t8Vg/qospHBpZUOvi5qYm/6luQO/Zrl7Yr+QMJN4qctKC/5MusN3vc/hMJoOpiXGEYhH8aFNA6i
 BG1coi420a7Hoz6lGjHVk654K5PnW00BCFsT6C2Dwa408VfhMppbNZoz9Dex63RzsxXyr2LNNAE
 +hUdohCuXpZ082OXVGw==
X-Proofpoint-GUID: yPSQ7m1aFvu3ttiYOQ7yq-tew0RDujK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99074-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A00552EB63C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the wrong internal RPM bus clock representation that we've been
carrying for years. They are an internal part of the interconnect
fabric. They are not exported by any device and are not supposed to be
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,msm8974.yaml         | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 95ce25ce1f7d..89a694501d8c 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -32,22 +32,32 @@ properties:
   clock-names:
     items:
       - const: bus
-      - const: bus_a
 
   clocks:
     items:
       - description: Bus Clock
-      - description: Bus A Clock
 
 required:
   - compatible
   - reg
   - '#interconnect-cells'
-  - clock-names
-  - clocks
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8974-mmssnoc
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -56,7 +66,4 @@ examples:
         reg = <0xfc380000 0x6a000>;
         compatible = "qcom,msm8974-bimc";
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
     };

-- 
2.47.3


