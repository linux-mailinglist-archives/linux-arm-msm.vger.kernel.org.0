Return-Path: <linux-arm-msm+bounces-94869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALFoCeFspWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A651D7040
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89B1C304069E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADD0339858;
	Mon,  2 Mar 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQDrmRpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTlTvvTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1803C33DEE2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448827; cv=none; b=SjQ464l7iFdR//oX9+Nif0vdW+2vFwLlAxLkhpNGNDTsAhJwYz4yyU6fv/Ww5CuS2Rg2SFAo41TYicO3Y3XueVUOmZamTa1+P+NGaKh3I0BDKpchXDzBmAqZLIXB0q3PkXmH69sKft9qIXUgjLkbLpo7YrLqEpwkQHwL8sj6vjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448827; c=relaxed/simple;
	bh=+X74KMWb2lVjQ9fnowKj6jei9ytZdwOYWqFCEBJ/bZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2zOUEqP5Ff5ghrMI8LfDfALmJHww+Df6QA78Wd8iwQI3Y1vdlxiZndjLsj6BflKo0KEwARg20bJjyNWvvJupP8WTnPbAvmq2JJdcl/Ut/oqJBlwnge1MMKAbBMTkWmZOSkgeteUbHFzUxVD5NnsrrKTrTCHgm5/mtlu8rpyAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQDrmRpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTlTvvTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294WMF3752736
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=; b=MQDrmRpdFC2963ym
	I40VQ6fy8Qk0flGVT6sIj+dbkb6vor+cN+pV3nPkJhF63XFFp0UZa7gKLMrFyf7p
	wlB80343UQBPcMb8o3HOHELauz4mO/r3MI0DF36YsviujxsdO4oIma3QRWLdZ+H4
	+pH9H7BDCsurLIixpsNF2jul/4nxZbjlFhq+94QAKUCn1kOoRTxjcYAjz13mSH09
	odaqC6AdhGeb4XrsfXZHdTgNor/roMDT6xO5MMSlrPk9DlFFZ9DiMm6AuO2MleYu
	Pcn0aTVJWfM98COMF3UnBhBqbNc92XKnP4R1k7lVcf/4Xxlc1Zk/ilOKBvBmGgK5
	ua2BtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8d4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ff05c73so3248607585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448824; x=1773053624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=jTlTvvTmkPUCthdyc/DuYYeQZ3UJFmktO7s3M8652zEP/kFecOQrO+gd5FaMCIF6lE
         CaKVSF6JX5BYN2j2k5eBsgu8eYOFstxHN54FBNDAeiEqqoYIyYjJ086vrQE3BALrMRtg
         XuORvH+AEhwO6x1UM7d55j9xnvBoIKeyAAKB1cmta4b2wRwEA7BPV85SOc6wGcOpAJB7
         ReNDQXjh+MzkOH3HH87h82AsK7UbyBZrL9ObGDdbEdR7F2g8aZAPelQePEWOvBNhqwRh
         +mVT3tjE7jWzoMOPrYSmjfD+3BwUy+6yv0ZOubIpymg+nY7tvPcQQk5qrwn3xlL3C5uI
         1IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448824; x=1773053624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=dvf7+jHAb7KUMcB7GvXVt6YE0vgvzesrQu5/gG7F4JiXKDEDpEhde+XUYzwe2b9AKU
         73xTiMQALc9WxH8G7Z/XQhRpOAJVQihA74lMh2LWuB5S2A/M4Lk9mTLL/wIq3WDHFsBe
         y63DOejBKxi+h1StkWObs7Mf3iNx8KZkM82MNclx9rXCt0SMUeX5lt234LSi97G9y3cf
         iImXTpchm3JN4SDaC3EzFAyGiFtneZMNSEayQbz4y6NOrYbjYY+eOlgUAKxjMiWTjBSC
         2Q7G0lnobxAWwXWrwkfpqyPewh1CvtbV9sdt882ddKpS18Qb7ohF22NTBqJ/QHUw8NyV
         9Stg==
X-Gm-Message-State: AOJu0Yy/IAVzh5Ts/M1MknOah7c09//AjbYINgvWTjLxRzOuBxNLzeDU
	bws4+zqrdFo5VOUPXuLNgoVAFSxNdJzjbs2P+bi70wyAnMLYdEioadl8zb07fLA6Q21bjzvybzT
	PhPqr8FxIZI1rCkulRqKlpfgvZhU6XcapjzcJP5dCVz4tlRkExMz+iCACioGuUCjf3l7S
X-Gm-Gg: ATEYQzxBkYPngSG9fWv1xgXmxepuORsYINtXNfxWR9kWRTQ+BsTKIpb2YJVBUGMk4qQ
	MaltvIN7bLHNek9WBUDLSfuZbd88BETYH64vXhOao2Z7sdXF0F/RspTwhoW52YUnJ29M9qxuqhk
	kmSt/Ob8PttvAEEcg3r2jOV5JAGb5My6181WQuApdlAml01cX/2MYoh0xU6ruaM2UAeqMur128l
	la922RW6PQAAcMl131QQjbwJ4VXnKA1ac5YBwQLGrTKMcHFSyVG1m2Lvz2mFPd5ejNIjaolH70F
	CB4nKyYYoxn2UC6Q6Mz8jal4hWS9ALGDHgAWG3UQjsl9a8EY6acLHWIGDVgWc8JAfXHv/wHLtAZ
	LGUIXtSeH4WX57g+gLizDIZiw4LA8ug==
X-Received: by 2002:a05:620a:2591:b0:8c5:3415:aceb with SMTP id af79cd13be357-8cbc8e8095emr1507362685a.32.1772448824346;
        Mon, 02 Mar 2026 02:53:44 -0800 (PST)
X-Received: by 2002:a05:620a:2591:b0:8c5:3415:aceb with SMTP id af79cd13be357-8cbc8e8095emr1507359985a.32.1772448823777;
        Mon, 02 Mar 2026 02:53:43 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm8399509f8f.38.2026.03.02.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:53:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 12:53:30 +0200
Subject: [PATCH v6 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-eliza-clocks-v6-2-6f42d8a9d25c@oss.qualcomm.com>
References: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AauMYzLc6gTEXz/GOQcSBdK6m37250bGHySZPyTqHNw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppWwsAJk/rvjPEyfQMVifir/1rWW6ylF3L0C3Z
 movolv6da2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVsLAAKCRAbX0TJAJUV
 Vp6YEACnvqCyyDLDGdDfd1d5/Vw8hPYe/EUOc5hhI3qnogiX/pvgtssFnCRhircXtyniUp+omfs
 hUV7VK3/8KBJTYUSsSlmuHb1+Qf26mNAPj9ka32ur3Oo+tGYoiFj/JkpL6hk93DZYNXK7ByQkix
 TBq8pEVB/RvrQ+2RAEzyP71czVV7984hAyo+4gqFET3ws8foxcIzJVnx5nVg4IDRk2AcvdOpDiq
 h4X8ZfL5j2r/ee4wg+JH0TAfqFkmNj1+jXky5ETjoCLfO+Ylzumlp3LY0GMQvbm/nyOMom7jCpG
 0v3YHLjpzfwjpWhbJFG/BCF1J28z2k5s3bublDQc0umM1shV5j7K0cYWjXMSSvXEEx5tEaVSEJU
 Qty1KhO0S+iW3nSoVEpqm+f4jAmuSrbWC03IZejYIDpWUaNy1PHfCGoJfGRcnywaHK5y890TAlO
 N3knY1ldGKXl9aO8HhFTdfKx61zcMWP2//ArIPF5A+SVxaa2JYuL8sTL1qNJ/aNB5wbUtuqBYjT
 4w6wSs09LoRWFMRYVPmaibF9/k6qa47se31N2NZHattleD6yqMVa5seF40+7llWuQvuWUzLbF3N
 +/WTu+agsKZYBZr4h83PZ/IzRY+WcA22UsbzRrtqAMIG2zIZkaAQ7G3m1S/tuTW/B3jpfN/HTpi
 vaSZuDynASVrm5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: W_HoO2Lt2TBPs0UPIrbGpGGe2E_qHEO-
X-Proofpoint-GUID: W_HoO2Lt2TBPs0UPIrbGpGGe2E_qHEO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfX3lY7bcOgWDPB
 6JThuTa69zZoDfIuTK4gN8ByHgyOUW5bU4CTDul5HaX3KJf4DPsWfQVLws4vg7Fq7s+u1EJvf4H
 soSOq2JmNXxk8J8Zq460O77wf2iMz5PWiIBecN/kj9RCGiqGDxdHj1GCo3iUoBALnf+s1/Yft9h
 iwOb2Q/QS20dtN5xr53XJPlNRrmxC2S7uusdeiEQllQIjkU9nRplJXExTPoinyCzDYrpcv/f9Lt
 tWA6mzo/PYIzRNmhzLI7o8DWBHDL1PFvWo+amtnzO81hRX9ANwrmvmdMeyUoUdaV3dhTUeag0XH
 re30qeNRf4+sopsgHR0G8OHCTfMYWkpCakPJxoGwFcIrqZYDDuQYzm2OMo4+9hyjkf9RKKzDscS
 AteqghKMfhR0xBAoAQaprloTjU2H81ssUmF0exkI39WU8TYpEa1rKFDjNn7eo/3jcizLH83AYt5
 djarsBdm5JTxiHdQANw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a56c39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94869-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95A651D7040
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml     |  2 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h             | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..ae9aef0e54e8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -15,6 +15,7 @@ description: |
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-tcsr
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
diff --git a/include/dt-bindings/clock/qcom,eliza-tcsr.h b/include/dt-bindings/clock/qcom,eliza-tcsr.h
new file mode 100644
index 000000000000..aeb5e2b1a47b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-tcsr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+
+/* TCSR_CC clocks */
+#define TCSR_HDMI_CLKREF_EN				0
+#define TCSR_PCIE_0_CLKREF_EN				1
+#define TCSR_PCIE_1_CLKREF_EN				2
+#define TCSR_UFS_CLKREF_EN				3
+#define TCSR_USB2_CLKREF_EN				4
+#define TCSR_USB3_CLKREF_EN				5
+
+#endif

-- 
2.48.1


