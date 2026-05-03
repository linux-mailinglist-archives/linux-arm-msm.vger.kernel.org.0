Return-Path: <linux-arm-msm+bounces-105608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBa4Ni5192kpiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00C4B663E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 18:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1A430191AE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558DB3C8714;
	Sun,  3 May 2026 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Swg7jVk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmRwTVGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAE03C3452
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825029; cv=none; b=okZJDKfsMQ52hLA+Svyou6twTz4l2vVv7cECLkF7n72zxI4r6kmUiuta+RCHeqSUxSY6ft4upcbB6Zi+JoLvFxLNRSLJmrLvcHjc05vbnXfKns45UfSXNFYQKCUzzRM3P0L2pjWwAhRaC9pAONmT+f+4P645VvVamB5Puz4XaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825029; c=relaxed/simple;
	bh=C9Bb/xr9LEyl0DLoUoc6Oee6qrwLzKXIYPnV3SsUoXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/Nkc7tUMZ2UhZ/sIFTMvdchnIrFTiFnfhp26oNvIS2UXIAflHWWslvPn/Tz/s85huAms8yWSG5x18OkEnxHjOrhq6SLipd3digUznjZdJc7Y3KlDBLXom+S+ZG2gx7VphnGcDcYy6K0OKhlxkDDy3o1QxeymmSM7fNobD3rgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Swg7jVk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmRwTVGL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6433141B1025155
	for <linux-arm-msm@vger.kernel.org>; Sun, 3 May 2026 16:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R2p9Q2Dqngt
	iV//zzqrVL9uTJq7yFojPLMMFu5Kk8Wk=; b=Swg7jVk7I0E+JhAN7sVSoY9LvUi
	6Fy2ffAC0ZtI5lJLugzJXsDSew2POCX4Rx/z9iTdtwrNYOfOSdDlRndJHL7q3FjW
	Od2hqL0FkYhP5P230k8Jf9i9SsDYp9XVE4FWkl/tP5aBWh/OUUQc8rckOeAGGlsk
	/POOCobmEBR8Oh3nqmtB6GU/BMIMFbBWHv8IboPE7IJqx83PQgeQHhFS0uIU+X6f
	7JSGfvWstjMdF748b6O7mUfTSzXV2bWgtyzoUkyDd0sBds4c8dKkwtLlBkP9+GCZ
	ZXb+IxlfPfMb8+6AKcRzfAOsJQr+MswXDgk4Qh/LbFr1q6V2wdlGdOrC6Xg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejk4d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 16:17:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf0245b0so77399131cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777825025; x=1778429825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2p9Q2DqngtiV//zzqrVL9uTJq7yFojPLMMFu5Kk8Wk=;
        b=SmRwTVGLGwBvzw5tXGlTTWCJoNH6+X1FgNJeZViRg1VCfAz9mOnZa6YOp3lSo3Kej9
         iL6diRsJXmZfZwFCWMuFLmzDFRM8V9EqgkeCF3K9AU/4pjnhzlYaqRWHXAHhOCPZyhWU
         tV5T0KcGV35GWscmmXseWjT4IsJM0whK0M1vMcEPGng/wv1viNePL35nX5TnXABwq6sz
         Wzfv+YIAwbCpa9YLuFVzbN/dn2QxCXK1tBHUeZQQyTT6d3MnA2tQdjpoO2a1Asf+oLor
         +U2732z4vyw8IklDp/7zhkPioI1vq1JvXAt99THMWGC5+hqdY0ni9jgZMiEeG9ZJS+p8
         N2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825025; x=1778429825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2p9Q2DqngtiV//zzqrVL9uTJq7yFojPLMMFu5Kk8Wk=;
        b=YBCrZosNmT0naDRCHQygn0+2gsBRqoclFi0x1GRaU2lG/fJQZyuN0haY9WWnxvg31d
         dR+3Msj2YGT5bzRrrdpqM38AV13u9PWDSftb8mvWbpx7PMBnU+JflgsX42zxQ53dZ2pR
         2Lk4wbR3Tt/HS+qgzOQook9UNv8hBX3f5kqu4Pekg36AFbh0gND2dN24E8Kykkb6ZodJ
         AyN5H1l9LsHdLRl4/fMPfYmZxLCe5OJv4ANSrao65CMLNXaQc2YeN8Rlp2B461Ey+CCq
         i6w608DA4LA6rLw/Lm0Rg1eprayIij2XqlB5+qdOA65y91XDAtj1lgX1AFm+Kk8CV+Dr
         CSEg==
X-Forwarded-Encrypted: i=1; AFNElJ9Zne+Pz8k0Vm14zln6whYhJkW0VGtnY5uwpxcgA57lJE6IUFWyP3P2OeTju0VgCRQAqq/ESCPbqIryVPLY@vger.kernel.org
X-Gm-Message-State: AOJu0YyRvwU4SHG1SG5S0dQL3dtKNT8ePIHn2KtdqTpV2hkd082lLQPo
	orNLTCAwypXwLTvGH3kTP3u0rSZvfYN6+NBPxh8Kl/DfV4wKmL/dsBeoBEccFkUpNSy3uO1vLhu
	+kZXtpLDlKdFto7XSrUx1LGHVNwyCSG2+bcwEqH1es0ALsz1idrmMpxh/zhAv6ffqKp/m
X-Gm-Gg: AeBDievRQlvH0sz5uVp8eY26c2jq/2NPzXTx982Gjx0lF3/3UHs1twmC81ze06PmpDi
	jLKYIEc5kpX9fzYGiw5hWqMOMPvyv3BjrLWoTs9JtyWBfheNzno88nwdJ3ILPIlrorfeKXUlz4r
	u8cTnzZyFGJ8Wro759y4kopVDTn+mcWCSf1K8LhU6+XhoCPXQ8qFCXzuecdh+eALKGjGuCNjL7T
	IHfSTq/tyq3r5h9Pl5TCYSvuOBvgcvmVg9EVL8oVrbAp6nSnU0CObXPKqsr98Adhjwh87M0JLQP
	+6zyH66No8EqLTvnrSn+OOOpnPXUJclhJNVF1PG00dKiASAdP0cd92U8q6jJ73WO0JSVWJsmxUL
	1f92MRuPtpR/vHEDMlME1YsW5yrxF13P738UoxD6W33uL5lw=
X-Received: by 2002:a05:622a:509:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5104bf8056amr97586201cf.40.1777825024772;
        Sun, 03 May 2026 09:17:04 -0700 (PDT)
X-Received: by 2002:a05:622a:509:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5104bf8056amr97585791cf.40.1777825024367;
        Sun, 03 May 2026 09:17:04 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm198912675e9.2.2026.05.03.09.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:17:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: interconnect: qcom,sm6115: Drop incorrect children if:then: block
Date: Sun,  3 May 2026 18:16:55 +0200
Message-ID: <20260503161653.60785-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C9Bb/xr9LEyl0DLoUoc6Oee6qrwLzKXIYPnV3SsUoXo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp93T41UUDcl4BWhPrmCowzEEwn07/4gg6yMBKI
 4TF6tWtNX6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafd0+AAKCRDBN2bmhouD
 13sDD/9uAX61r2PXqZRA/fZnGVxg1jOvisImmjP/rFVo4emHMHlggk5T4WPuQ1xPmu4HdulLbjI
 f1W1PugITqNT/TC/47f9HzMcAIU7JoFsga3tJhW7+Q7sT2xcMmGaCmz7x2F4YFGdYhWSOhxSM+I
 Ao4WCN13p+8VVS83mrlHEXMvn6Aw5WY+ckIXIhwBLBFRimL/P8h4+khnFN9aASFXSdR1f5mQ+F0
 Ul4odPQsLt4UPwk0Ae2ItnrUdySFoSJYPe4zIE1ai7TBuXmCSQ2IDe5MvNJzkAkQrW1HszPn2Sa
 Nqc6Rrf0Nty4SCt5zflhKD7IHMbS9o4weWKIo1yOUZV6HfHb5zpFVHkxd83aEm+/YdJs7RhI+TR
 QbaMc7oujajx2HQRR/dY0N+VRpCbwst75TQVwI8V7hd+vLTiMHZ1mYubEVtYgjNKyfnrjQLp/H/
 6kReNzX5bgzogGPkveXAhM00lxc7meMKrSkkWbKbxEmmyczhGPgUm/h+Kr77qZ2ObDR0W5nHxme
 oqGzqlZwM1sURTEX0xYGdpVG5N7/uE+JW1Sar6fGi94jLIrt1eOr/5CjGtj0S5QZ5M+PuV57rxa
 HyeEETnYh48sOX4eoCy9xeoQeN3jWXHa1mAP//voZP8D1L9BgrcqM5gQF/iMC+TxpT0y3Q/Rabf bcfeG53SxbFc/MQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDE4MyBTYWx0ZWRfX/OV+v5SpObx/
 uiTUqoo4u0Cxo5tmlzVZU7xK2lYj071xYUxu4V3uMO00iCBe3a/Igq71KcbdL/o9NqaUaOLr0zw
 YU33C6C/1ldPQOYoe1DiyeWRocL7bdVyo0+mRTxhchACcN+PLA28UmkvzuQTuN9ge4z1ptta01z
 jvB99osmIuNbR1uN/QYrlTWAcDh3v3FWOU7axrRd4bDocTIkO37ZNNzd1k0tfapQKOGJaJjaEBR
 StahBwlD0/0JIXkCS8UD8RB4CNxfnXsgDZe+vBjkbxY+GeyNEgFgWsm5749RnfaUzvXcxryj/3a
 2o6DXm/mCe/6S53n2IQcfQn/4dAj7kpZ/+KiZr4Xu7a69+IhPrU1aGDqrY2JoTycr7OadvbpwP2
 RV0uu9uRv7UFSwlTId3kcdOz6IAgXfj3xnJfFzfUz5wL1SoaqGbpu6SIgNjwHWFqz3Lq9yKJCw/
 PdK4rbOJCuc9D/1Qm9A==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f77501 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OhMZvQ6Gcaex14dD5EMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5UL3e-qqRS3jik46QuK4Vfhg7pmAIY1Q
X-Proofpoint-GUID: 5UL3e-qqRS3jik46QuK4Vfhg7pmAIY1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605030183
X-Rspamd-Queue-Id: 3F00C4B663E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

This binding has children, so any if:then: block restricting them,
cannot be defined in top-level allOf:if:then:properties:, because it
simply does not match these children.  The block, if it was useful,
should be defined within patternProperties for the children, however
since child nodes do not have clocks at all, there is little point in
disallowing them in the first place.

Remove completely redundant and ineffective piece of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,sm6115.yaml         | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
index 14b1a0b08e73..67c1705af50f 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
@@ -95,20 +95,6 @@ allOf:
             - const: usb_axi
             - const: ipa
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm6115-bimc
-            - qcom,sm6115-clk-virt
-            - qcom,sm6115-mmrt-virt
-            - qcom,sm6115-mmnrt-virt
-
-    then:
-      properties:
-        clocks: false
-        clock-names: false
-
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


