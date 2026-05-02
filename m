Return-Path: <linux-arm-msm+bounces-105576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PSsOMkg9mluSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 18:05:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 989244B2BEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 18:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A511300E5C9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 16:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDFD382379;
	Sat,  2 May 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biwTrTfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7Fy3FZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C51A6808
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737916; cv=none; b=UcRmZYSHLv2x0j/cTilXLecFfiV1uOBnnBXIjzD/oMnd7XhCbE/isD3Onxc3itXelPukvHqmy1aRIjd51y/mkdAwHi5RBj0kdsU0AtC9bjUjIDwW0KP0X61V7Fwa3aV8HrkzVX8LSCnDgCBW+/CdPEyDd/LB5bHhOQ66pcqEP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737916; c=relaxed/simple;
	bh=rgwAduSAuGAmKuanH3/72r2nsTWd3UBmyeg4wlC1vPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BdilOVALI6GSCuHSorRJ43TRwVVMnYOgwIicNI16VZQ+Wwm8mZA3usSE/OUF3l9JpvBwsmVFwOibpv7z1LOJg2VvNfT+PFAVd2ZBYqO3kozZ6upjjsI6zZNt1KsJxMcf0L4ep0dE4qwXtffhXhgBUK1uPMU2852XObrFUL1+rZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biwTrTfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7Fy3FZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6423flS01577589
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 May 2026 16:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pxskkpGelqJ3sL/OAiT1fM
	BOJD29inpnuAT49FPBKr0=; b=biwTrTfOWobm1f3X2zYcf16QNTZbwutP4RbIJM
	Wek9fALtgdkW8UQX50UogJv2psSOA7AjiqBxP9ZRAgOzFWBuXPbP/zt02eWMPyOI
	30xF56+mV2Zu/JTgqP7YeX8QHnilyiPwLT7H51ViU/ExMb430VJZ27T0YDIPuqSx
	qJI7IbrCEevuzNr19P/7mkKuv+L6NVvxb2eq/CeZ3YpvnE/C3v6ZojS0MSorFVdi
	HKGqaA0/N8bQzlvlnof5OFmkFF75Aspf8rq1qMHENMfMbnyUNMzIFo/5U0X0vl+5
	DDNC6T17o/3WnTFyzVL9CkfMBICZkw6YVzZ3Vo8iE56RJg/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3h6se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 16:05:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36524e2c5dfso147565a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777737912; x=1778342712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxskkpGelqJ3sL/OAiT1fMBOJD29inpnuAT49FPBKr0=;
        b=d7Fy3FZHP+0/AkiJ55fAIp9p4LzZPqyMHXK6QSt71TUwchPyGbYb8pCf9xylfJfox/
         UToiGTAuF7cFMY9F6G1+mogGaJqQ5utG1+ZIQT2QyF+oQ4GxGAmmrT+/GKVlgJaZ9MLF
         CoCmXiDDk8MccJXcZrDG0/q7uXdZJybexZp9DQzRiNoAi78kwHbCMT9JC0UqiA5WQEKl
         JDL5yOaaTjWmyITgYPej0tCl/JdmPZPEHLDQCDUCBr5cUvtIQi+uhfSUdXihx4dfVGgP
         Fbqj8IzNh/EUcsBYW43/OW7HCG0vMHE3zR6ynemV8/yCLeGbBDbuSnOSjaqXlqgxwRHg
         14Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777737912; x=1778342712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxskkpGelqJ3sL/OAiT1fMBOJD29inpnuAT49FPBKr0=;
        b=W0d7C7scixLwrV0S0UqcQwdlCCFQdNaqfNMiXYfrBoi9Ti09re0OKHtIpNpGYU45Yi
         JqD0g59oCK7uBnrGCy3Y70Ds0q/j2t8dd5fftzwZY8cA4df28LD6Xs88WGC6m9S60NH2
         SY1+oakMg31j7mXFjhOEMfsDLWf632FY7AEEx2sYdxhXGIlp5DZVGK5S2HdYfgvd5fOK
         1pe/X7A9PZbuL/XN5qv8PJkCfWBBzaDzAXePFF0dL1ijLDyxI08Tgsl9PmaaLZN8SVCr
         YyK3hQB1+99P2C8gfmiiWYLL6/kcZVHWTvzHICK2qyS0sMIu3vrnNhmP245ihJGRiTvn
         XTrA==
X-Gm-Message-State: AOJu0YwIN5YZVRXQ7DfKZ7nGuM5d+gUxL7lVIamH4oB3uHJor8x5T6ct
	73Kce4vloA63d495xeUfpDLmJwDjTvRXSDTt8/bJU/jgFLDHT0Rd/4SkMdRuPTKrgsBrhEMaSSI
	T6E6bZCDeDo5NNSz/5QVtY8ns7COtfRzuOLo0q5klyZ0tRv41/nWu+tKgxN6ksvqG1bL9
X-Gm-Gg: AeBDiesnqEyrC+faLhi8XfTb7nURFz/Sjo48Psdv5nQE5AHHOKMeRBBcVreeNjHYvqd
	FVNgKgsNeOAwsuVDnrTNQ09JO1oCmw4xqj7iracEHhK8p4Cf9jm8npby/K2uxH0L3AHbof2tM89
	W0sat7WItHhJxFZ8PCrS64uNLsD7I4L+brzLaMW/8EttZVyX7wlt3fwmbGuRnse51meMBTJI89u
	Sueh8E6CvdRePKY+uByZ+AgywO3EX/VGzCvzZCS0nSDhQN2sHxXu+zjfwdFSQVnW6D9QszpMHzL
	RakWSNzAyEKRjNYr0ACDVnykfrc3e51fFqka6oGY+gTMlGNSB8QQK68evHevolnpGB19GACEk43
	t2jEdSm9WHRCSOX8Bt49F0+gt0RxF8rM7Sc1vbov3v8cwyXI=
X-Received: by 2002:a17:90b:5830:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-3650ce6f2c7mr3516899a91.19.1777737912441;
        Sat, 02 May 2026 09:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-3650ce6f2c7mr3516858a91.19.1777737911995;
        Sat, 02 May 2026 09:05:11 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae4b0d5sm56787875ad.68.2026.05.02.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:05:11 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 02 May 2026 21:35:06 +0530
Subject: [PATCH] dt-bindings: cache: qcom,llcc: Document Shikra LLCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-shikra-llcc-binding-v1-1-1da4b1eff0a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALEg9mkC/x3MTQqAIBBA4avErBuw6ZeuEi1MxxoKC4UIpLsnL
 b/FewkiB+EIY5Eg8C1RTp9RlQWYTfuVUWw2kKJOtYowbrIHjcdhDC7irfgV+6GmhRp2feMgl1d
 gJ89/neb3/QB5cdO1ZQAAAA==
X-Change-ID: 20260502-shikra-llcc-binding-7832b24ef74f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777737908; l=1118;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rgwAduSAuGAmKuanH3/72r2nsTWd3UBmyeg4wlC1vPw=;
 b=pU52dA3MXR/qqW0EniFYgiOF3WauK+5LJ/2thRQ99bdIai6hnXqhHkKYj+6x0rXnnCQ8RoODS
 J+APRjJQGaMAyl3JA6yfMs+zzSax9cnErbsPUVSuygSnPdyjJFYH7ME
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAyMDE2MSBTYWx0ZWRfX54l/lltrDOmH
 Z869JH7T3xgVdt/cQQ+F5mT1xXhhM0tGmLS9Bf+qJwRXliOBtKwX1QCE5Uu3+0KOUdD8n4ozq9g
 6CBkMovttKQWeM7aLYlfsG2bjs22men5zZU6Vg3KNpUFqPDzwINmiY161QxDkCHvSWDtR5EwZ6E
 csO+H7/0uD9e8bpOcLzf3qSc9BOU4Opyc6Vn6aTscQ5lRn4q7lH83Fh+7Azw40MJwgJyQAa5wQ2
 hUCp69cJ8GDffZlxjs/ok+MwrPQACz4/QsrtKky9yP+J541uSI5gNmPbmBIvQkHJKSToS4k3Oqk
 pvs6HrveyJdlftFo/1lss0UjM+gEJ/VqFfJfADbzFe4kQXcmOKFyqZzrmhdJrxMzcZ8hd+M48Ew
 3GAyjJX/H+XyYIhtHBDZuYWslFXLRfuNtQTr8374B1PD5LFHIvp9EP+TN/ZDcxY+ka9vhldt4SG
 Eb7QW6Tdr4bBybPg/hg==
X-Proofpoint-GUID: 9Jy2JlvCQVI2GiQ-yenW9HRdWxi3PVlD
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f620b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9Jy2JlvCQVI2GiQ-yenW9HRdWxi3PVlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-02_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605020161
X-Rspamd-Queue-Id: 989244B2BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105576-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Last Level Cache Controller on Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..730556184a59 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sc8280xp-llcc
       - qcom,sdm670-llcc
       - qcom,sdm845-llcc
+      - qcom,shikra-llcc
       - qcom,sm6350-llcc
       - qcom,sm7150-llcc
       - qcom,sm8150-llcc
@@ -206,6 +207,7 @@ allOf:
             enum:
               - qcom,sc7280-llcc
               - qcom,sdm670-llcc
+              - qcom,shikra-llcc
     then:
       properties:
         reg:

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260502-shikra-llcc-binding-7832b24ef74f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


