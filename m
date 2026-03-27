Return-Path: <linux-arm-msm+bounces-100336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOriBDyLxmlELgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:50:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A644C34596B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA81730A10BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FED3ED110;
	Fri, 27 Mar 2026 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2KeNApi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdHVVRBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5903A7599
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619064; cv=none; b=pghMHUKSBrNPq6AQERd7fkSUPg0LUd+RwClDG50cVZlJbpOxxuvAHl+dPIpkcwJ7Akcd9W19HAGg00RpquJJR9I4gNnFsqVoHHDP03TVN4Pn5xMegIVbYHCK3QcbKygd5b8eFJP2Or+2QYZUQZ3+/nIqT27xJ87NRJEuecu1N0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619064; c=relaxed/simple;
	bh=WLp44NdrpQY5+ihIZi9+jneYN8QyP36uwtuXwEh/J9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LtDxCgycw1n/WstkecS1CrSEQIxQT1BPcCPc43E5486wtc7TxPazwEBPHe2maDUMQzFIre4SXCf/KVYi0aDS2bmokPc+ds5V6Ewep4YFK+/BsquN8g1TktLkXtpdzE+2lYvermKjPV0qf0N/F5QMRR+/XNZ57VmRiwferWSO6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2KeNApi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdHVVRBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhQcs2769547
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0d2lK/B8DebECRChn9a1f4
	dUpqpCsR5VR9s0KzTLjM8=; b=O2KeNApif279fUGPbqjr8vhlBSbWIWOZQ9aled
	myONguTM2XdeqJtX3O0UWsK8SMFFKb+evVCfda4qDoLWHBokpqaoJBNg+bp7xTvq
	PNNi1ZEQ4hsFqLs5Uzlqo3zVa/DywCY4M/yr80o2mmpmSUrYsqP5xJTu+IU3aD+p
	oPA/v0c4hNDFmB8oj7kSPsFrvrv1Xag3M3KEEY8OQsA20QjHounXouw6T6uORoeM
	fSx8brBa4Df79RnI3VtpiDeUkHnKuIP9DX8xIFdZrQawmQLGZHzSKCyh6GxcxRNl
	5mMlwzknoar1xfslIBo5gwkK8hI1WRYUSTocAeo56gkuOOEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv38bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:44:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso6742801cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774619061; x=1775223861; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0d2lK/B8DebECRChn9a1f4dUpqpCsR5VR9s0KzTLjM8=;
        b=JdHVVRBMPl7MYURHxLrRW8pvP5nCS7l7+J2kTN0jQ+km1cVBwvZ/f8+bsg9SIqpCwW
         BC1a/mdopjfcQpPVlkjjOd2KTswdyo1Nm7jcvvi8nldUTikTFZzv9dSJNL+E64RJNv6q
         TDStr/+PnQ5pt8ziKghkQZcJFtJM2LXnZ4G1hZBAnSfzc3OUxjUSvQZ4Usz7dBtWCGhj
         1Nla2/EFCkHSXyRHsdkJ+n9zyhLyl73uTqJSZwzNsZdgETgUR3yjrUw4KniSejmDIUT+
         BCvMI1CTcyuYEn93Gl3s47QXTk3Dg9IXIJUNKU0KMSFCb+NT7MZFU89RF10Sy+qzzQPC
         3F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619061; x=1775223861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d2lK/B8DebECRChn9a1f4dUpqpCsR5VR9s0KzTLjM8=;
        b=r6S8kHknYyy6Fz5JELy3cFDcdvVnPs6x3iI+C8lUrhKj+5KCXY0es6SAQU/z5eTKw0
         ZFJ+4Cd8pH6Fa8vqgs7S6NXWWGEhhXSPeBCNDoIiruf5NlFY0U/GyKxC+FpXwR0Wie04
         d8Nl/LDWO0Vu0xj8f5iUESWFWhDoQonSYv5jqcAbLjo3Gc2Okf4ZUdGxo0LHAGzXHa1M
         IpzeA8V4nFukX6H39xuOwuO1MP+y/qvLtNnloUhU48qYorKdS4kp0+1os02YJ74TI8jw
         77/HmCQC++5Fuyu9ksdqMGTN3f5p0ruO4xRZVzggXu8+kV7hi/y68p72s4+FpuNjC4s4
         SQ9g==
X-Gm-Message-State: AOJu0YyEJwHRDV+RAL4fL8KmQVGb0pf3Xn7YBKyqT96OBVMVsdOP8rqA
	a1suslsge/+5ZMykXmZWNfPuI7MXr94R0P6QD3e5SL7MlJsL/GpbFs9aVvqymT+i38PHFtmYG47
	+nKX7M/YsWHhNHnL38bi3WcjxcaiKgWot9t16jzxzgW/S9w2Kfcme6Vj4kHC+2CJrwrc9
X-Gm-Gg: ATEYQzxHpQKb4sogbI6cRo1/nXlA7WvwWTGupgOwEDxlKQSrzFAe1iY9pcnCH72jOCY
	bYRP/B8a3n6tAVUZVinWIFL4ahseoTp8lruOUt51v8mfm4+XkgdlYstJWJu893wy2OpZtnOiv0Q
	TFjabOhOIHCF2SiasSOSLhk2bl4b7qHa1hH2gVft5pa7TJZ9TODLuOPbv+nZZImj7GQ4Mnq7oLl
	+YwvX9a9Ursysx9//lCExi3eM/de6UKbO9dwQocmtqpW6jFRgGPM2zcSxyEl1wdi0fo0qYGyWwZ
	OneAKGvCyQtova64m8FQZO4AHoLEJko6zyLRAdCd9evlS5fvd4vBMhwFzOWb57TV/H5XxpdM9m6
	q5OLHn66CR0ZYDrbAZpRZ1LxiN+g=
X-Received: by 2002:a05:622a:11c1:b0:509:2d79:f884 with SMTP id d75a77b69052e-50ba37d1d87mr32933331cf.12.1774619061245;
        Fri, 27 Mar 2026 06:44:21 -0700 (PDT)
X-Received: by 2002:a05:622a:11c1:b0:509:2d79:f884 with SMTP id d75a77b69052e-50ba37d1d87mr32932731cf.12.1774619060510;
        Fri, 27 Mar 2026 06:44:20 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270dd790sm35668815e9.5.2026.03.27.06.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:44:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:44:13 +0200
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKyJxmkC/yXMQQ6CQAxA0auQrm2Co4HoVYwL2iljFSuZqiEQ7
 u6oy7f4fwGXrOJwrBbI8lbXhxVsNxXwpbMkqLEYQh2aehdalEHnDkktqiXH8a6MaVC7IYe+bQ6
 0Z6IIpR+z9Dr93qfz3/6iq/DzO4R1/QA3VST+fQAAAA==
X-Change-ID: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WLp44NdrpQY5+ihIZi9+jneYN8QyP36uwtuXwEh/J9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxomxiDG9Z9Y6+NrOjxLMqcZN0FpsHORr26YpD
 1rLgNK430yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacaJsQAKCRAbX0TJAJUV
 Vv1fD/kBpPyMuyI4eziP2PlhfGQFvffC4v6QiFookjC0KqThBjOJ/w77/oecqsVhK/2hpFpsFuz
 dyDYUNFuJQPt8G+8kMiEOpAJx6mOYWtSKee7bJpVS4OWNZxwSPgxBzNP6XO7ea78/DjcYX9j+63
 0ZwGbhAnaj4ahryQXJ1139Q4MFyC6rz/qgvS8Ar8UNvvLkx7t65qK728Yat6xtrtRyP3ipXHAS9
 dQucpAynRtnf0CM4pmzbFp/hZHfU5r9YtceTKiyN4hiRfS8XDYfLXDD6e1D4tOliSL9BfOzXP2k
 53R9L+UwTAvWqzEWVcBkQFxdfxDTIGwGDc1DFdO/bNN1a2iXImG0Mti7uWCIdAC3GcHqHUm8AaJ
 oJ8/vBVZZFcZbm7/el2D2kMgp5KKRQaAZePuF+DivwbGBSs6zDDABiJMYN6HDP4F94R0q5cHp0Z
 5yK3WNiVmtwgQMfxe9l97wPF8rLPuT6AMudKQDr32qWck0M/ZXLAhuH9h8stvOvzwurOD9h17ln
 r37Aqj1xQiFA+K2DC+39nJY42qJ8bbBhYf//gzdMsXPYbbSFveO2hya1fnEpFCpoA2Kmk+yqHND
 4JkUh+6rvCd4plktZdAom1Sd7vywoD0abWcxdL96/w/JKSkXkGo9iOpHiiJF5BJnd8jfjL1hNsp
 PY3bSNonenLFc1g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c689b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rFgtliq726l97mATxKoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YnLspW9sdFK0uwD66n6ODhLJFtG8vS9Y
X-Proofpoint-GUID: YnLspW9sdFK0uwD66n6ODhLJFtG8vS9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfX8G15qqDUZbcU
 OflsVZ6bbB3FoWT11lQnatn5OJSB6W0xNRVPLO3KLl3LkXXMTEApPdfNQmHEq+OhhwEogcd3dT7
 hkZ7tcVokNZhQW6RLvoRouJUxfKv3reMvIC84OM6xqA2PzlBiOikled510WinFKtROZVH9SeVmE
 GXSh/ShhRAi40k0iIbeC5JGfRQworbV00QqZCHigU6vOcwm0Sn4TjHTV/TBj3r/tMdoZiS1yCEO
 F7oDuoTHExZh5eDhiS7oAwVP/uywmQ/SFNLeoE5hUgoBcRt947ouqGWpO8Ieu2C+WdTlzro95kY
 4enHGXoHjFxrvAIR9i4W+2pkOEfIENIgiynaxZX2vL+JTnZeI/ZZR/50zL1m5YvtMh6d72o6vss
 zpsBUidsidE2U+S6JidThGZMbdGAwyhq/y+cVu6CnAaUI4d8urO2pop/n1geLQB4KHAAPQMAgpd
 5UgRVrDzo/At/G+7/qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270094
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100336-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A644C34596B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for the PMIC GLINK interface found on the
Qualcomm Eliza SoC.

It is fully compatible with the one found on SM8550, so use that as
fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..411932f6b282 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -39,6 +39,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,eliza-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


