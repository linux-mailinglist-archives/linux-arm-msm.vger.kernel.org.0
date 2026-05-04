Return-Path: <linux-arm-msm+bounces-105661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JNDJrtT+GnSswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:07:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8764B9E40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07784300F972
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545F1314D0D;
	Mon,  4 May 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSTemDgI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b44ng6Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085ED1A6813
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882041; cv=none; b=XsZAkcJ7UjVa8H3TtbGhXKslBk17GfT30Nw9HSI2sQIuc+pnXDSs1IIPrKd04WoP54uUor9v9VI8hOa1awMGy0olHU6EIIo0gqPJ7M9sPZEwmeB+SlfARbUfqaMN2Z4JZkRS26ArB3dO8fx4nitli6QuhZvcsh40CQTOrcr7EEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882041; c=relaxed/simple;
	bh=hi/ju4IZ5QA4z9vfxDz7l2/qO/AUwkoK+iPLaOKk7Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNvsvIfVkvNsxWXMY34qJIkBgdqB4QRRDwFpqqVdiILe9vQdFheFy+wLXrNHOeAiebVz+XHBqSchrgX1rqHUNCiGk9quhW7/9tyZDp2SdLIRkNk+qaq1W8psMQBCnLmvCseimmzSv92TCLQ0KGujr13/Rv92ACbAItomNvec1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSTemDgI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b44ng6Nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DEdX3470497
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7
	CUrbeR1I=; b=aSTemDgINX2Pnz5HEbxgv3FlKUy1gJbKawit+OutuRurvDtMQ6j
	p6knYyG+IJVhxHhvjLdpTeqC6qVdXtgsM5TfpDIXsgZ6KPozzcxrC9Zznx5ZC0DB
	diryGkEC0po1nIEBAW2b+n/+VG0Z0jZxAFkyF6/Ne2N9G8xMkbBFEpll8YgUtu2V
	RgRE/4rTRyI1qwabu4ufWAPvB8u9UNujvXKgMNMXKbRA5ffkT4TqTA1wsgvxSxZg
	0ybU549RSPTFWX2JdE38iAtrdOMxpbiYqCUG01oujHhUXeJnKutSjjpxQ7qqphrB
	TRqMsasknIh1RbmrY1H2aFeM3ITnXNmzA8w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmtfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:07:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12e683ca86bso7077569c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882038; x=1778486838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7CUrbeR1I=;
        b=b44ng6NfwEALaA7cVeLD+d3pnIq34wJtuzfQ2CzGFtM6b8ZijrCwc+zgKLGNwfCqmm
         qhMUHm1skdU8G7Y0U7bLDuf7/dDaka1m/jv84v88Q+VHFSzRt5ZP9UkFKsWJ+pcCAgZn
         oVrH4s+xU6RzO4cB5/RTm3b9SN0xqruVxCOHQ96FyG/ECNejdPNMzNIxJPv3O3TQ+Zqu
         ZEM2RD5nVamJqEih0OBX3e7xgxDHbhf6yQV+GYoG205suux9+DZoSpyakrb5D1YibnLH
         3X2bA3UFTs6J8j5yaSql8NaLtgRLnEA+YF2oFHeZyj99kyYczvPakck0ZgRKl4UbclvG
         I1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882038; x=1778486838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1STb019Nq9vz/TmdQ1QuyiB523ENL8cT3Y7CUrbeR1I=;
        b=CC7ivHIduRug35a9YWSZAH4g9y7vGUGzmDGoOCd3fqgsPSOPdvkFTIX9+Alfc0tCqG
         E9xggHVAa/TGUKkjRdPEYMec3HEuuT2dD/lw01vLKaeTuXW2YiPzXk5RTv45DSEIqN4r
         aKJOB5a3Dto1TBRSyr2f1zSxTstH+0ftu/BxpPnJkQ9bEihVr7a4dy5CJyp/Ply8Bq0/
         5m2BStlCM+ph9BppR8pyHj+J1/XQM+fOk3hWtD1r8D9w9d/LLrkWqdfkaJ2hTbVjRnQy
         vEgA3UbuYFRGybVcdMNjrRdFk27rfhZmBHlJFRDE9GZxX9JNnlOYix0hq40Y0u6NZovg
         Phfg==
X-Forwarded-Encrypted: i=1; AFNElJ8Hs1Xlu3+SRx+XYBrS+mM48bzTebZgzka2QX7OZizYHBcn2N39MDO6DGkFCC6pEif9OhjWYD64pcPX7QGF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jQideD+A/eYvfBg40UU/mlGTZS8CAlhGS+qkl2XIZSfhyFfs
	jToZ6fNg9zdEKPkfXhr1vdTtYl/9VN08nqzJOqLDBjLeYydJo2HzOIoDUN204F6MoJBuU9QHxrJ
	eZadmyk75yYqpl7uMj0Qgpa+M5YQ1iFFQ4b7uLzqIgQNYdZqC0HIzMWaGCBgF0Z0bKeMz
X-Gm-Gg: AeBDietf50JUJ201E1gWCH3uXHlJn6fwl4omQksh+buNrUTJgzR26ABHMa+hl+RdhtY
	w3bB6MWClMzX0MZ7H7VlFQYXGwTD0/TlSHpQDrGB5h4mZ/qW0pfoWtk/hy7V8sNyWYrNH4Yt5Zf
	GA6KrQ5Dx3NvMzudBJ6jhpx94N7R0wnG58kL7OVc6Au4AvtLj8xitY5/X0ncBRawTvd5RZfcn1B
	s3xygUVvDxmp1n34Ck/bn9Gs/4mzNkzTqsBQdF7inb+UFQjLqh9rkhD6HUHaxoXStinNmsjYUW/
	jECo3wdLRbXtzr7uJlyXKuMh3nuRFfLsi58IQZ17yAlMcmjqpFjFHkNDmC6EXzhpXwfzVSsFOvL
	TcWEwXqsll4GOUJIqFwf4THXZ1OXIMzp9JUUFxc43OH2rKKQPRuE8hhgMZjpk7+v1fPAfTvn/Um
	xlc0jvFKDl4yoRhwh6
X-Received: by 2002:a05:7022:6b91:b0:128:d4be:7438 with SMTP id a92af1059eb24-12dfd839a02mr3479955c88.30.1777882037991;
        Mon, 04 May 2026 01:07:17 -0700 (PDT)
X-Received: by 2002:a05:7022:6b91:b0:128:d4be:7438 with SMTP id a92af1059eb24-12dfd839a02mr3479937c88.30.1777882037437;
        Mon, 04 May 2026 01:07:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm12729573c88.5.2026.05.04.01.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:07:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: interrupt-controller: Document PDC for Qualcomm Nord SoC
Date: Mon,  4 May 2026 16:07:03 +0800
Message-ID: <20260504080703.825328-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O_QkSpcjcbWTU261PF5Xk2qY9XGhOu4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX/DQamAp8oSuG
 FnRAV8SlMqxvL5dFIkcCc3mwFxNfaOT6NahZ+stSD0TJ+3n4P9zQqiHXQv2x9wsJYz8DvbY+ers
 gPG7q9m9tE464K8XscGXNX2Wf2JBqUX0/DLNoGyeQqipkUkQ+uKHTRlqic37rQ5kG1dHNV1AhQ/
 urVSTV+lY9DOZrft3jVVwrelZALcefMN3O0ypQMxGsZ68uNGB2SkXJVYDMKHsYUtmFoE6Qmmlgn
 iNFRKBjGwZiywnJ4MDT4bKax1mY/zHc09mlD/x72P4N13QQ62/6spFHMNd7mGXXr4yM6Vh23vps
 jD7XXiLgGEhIA0m2wCXE/AGUCBDeZWEAO4Wu90vkStrxtNOORXf2XT5M5SXJywwnm8/7x2c4TIA
 myOUPFgyLACLVWQgu8alchO10tHi4xDjGQ58mLoHpf56sv+LQHAKGc5YWqWgutLF+E6KpWI8Lg3
 G3ODckbs6bwDFfd4qWA==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f853b7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Yo9YwD7WwG_EyHPTu4wA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: O_QkSpcjcbWTU261PF5Xk2qY9XGhOu4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040087
X-Rspamd-Queue-Id: 0C8764B9E40
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105661-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document Power Domain Controller on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427010922.230586-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420024733.1240249-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b4942881b9c9..07a46c5457a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
+          - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.43.0


