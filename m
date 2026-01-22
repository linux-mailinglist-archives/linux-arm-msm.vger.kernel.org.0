Return-Path: <linux-arm-msm+bounces-90169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFSHF6oBcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:53:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3483658B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55F8F8842C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE7E426EAE;
	Thu, 22 Jan 2026 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh1XT9t7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zkv7AnYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA574266A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078484; cv=none; b=C/xl9fuNU6XQwv+Q9qfgGEoX6EBzKNN8eiWlh1lR8z/o3v28R8Q5edTXwpI9+PAaNACKN9g5BSA2buKnqHI59B15IlJtXB1hinbf5OKz2afO8TjR2oeSvfGaONaXjhxJG1dMlrhC95JTp11cQCSZS+n2mUxKfdaGwm/v+5jn7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078484; c=relaxed/simple;
	bh=05p3WSQeINtZKVSYvGmsEKNVBC0B9Jn9M3IpPDE6QNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJ8Tg/Q7WBSV0ifFi+lvv8BpplSpXSCDqes2J8PaPsS8HBfltEg8WIrkR12kuFz6YPiE+2REkmbb5T0weAdQ0I4UeMLOSB7XGmzspNoiJSz2F+EydzCqnjqtMbBZYdH8wmaU3tmeJh8aQqCfGAWor43rmCZyIKvN9GUfR9ybVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh1XT9t7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zkv7AnYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7l59e4057304
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=; b=nh1XT9t75VOthVRX
	HMtTxcv8+fy7GpWb5N7uCpSHEyd1Y/aSEqbNLDJSjAqoXDAn2YgViv+zHUfyfxsH
	qemzZ4c9sJjaGYMdZRKy3RuT00v+irO9T31lICxXr+F4xjWibNhqwlQK2xzAaevB
	r8o+rR//5jG4v92nwiMj3vKXnqYlFFvfEOVjn9Q6NxIv/nCpNf7n5Y+zuzb8Slsz
	p48GytUmOoWEYg9Rqbuz6CS9R+rRTFrKdvvk9utR5YOrofAcyrwatKkD0g3RV3LY
	rDMRuCxCpLRnLczuFuLa9y45978+/NDVZg9UemE8QuAFn9TPDUCXJcuUBjATYYbl
	EzkSdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbsxmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a341ac9fso223579285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078479; x=1769683279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=Zkv7AnYvYAXZKAIei6Xib3pZ5oE2rTp7l4OyX9/VEfHEE7FmZ9M+5gRnusBCGqlaJz
         58etqA820AjxRsYZ/i1OmiuhAwBpXRiBnVL7LhItK/THxRWi9VlmOoXqigYzGIMtx7/j
         EN8HWLiHjeRQjF6u146/k9ziZW+2CaK4TuYVpmUl8DrESjTrIPBu94EULqmAlAfOEAzV
         t739H+ImGE/JTaZQAj+d4/bzsRMry7OgiFDIJQ8pX96CCmQkjW1SRiLZdDzmZcdeOqqF
         xjS54k/Pci9n4GIklgLhb/oOwSxdiDS38Kob1DijaQrtTLZu9SVNNpo6KOpG79VHvAad
         uCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078479; x=1769683279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=bebvTMjnOnPiT6EbMFU7OLeObXME1UgNsGKWPF0RJoIArG9P2bhdqMVauBKzetHdXJ
         4EmOvoDp3MRv4jOZ+2HFYs9XqRpgGUPVgQ8fAlCMCr4EZ+TjNtR5Pc3hKcheXS8rEsyR
         YiTgKGSa0pOcTh7cAGamPA8gk0hmptF0Og/CDIA9fXJun4RGyOm3XYLP4SJB/+9W7kd+
         saZ569j4RAqpT26CXKOm46Iu6Tq1rbmYzgdD5h187AzNEpXm7K4C6eK/a+rLIn7D+sgl
         N3TKU5YSWMkekgn6u6T8IIys5UsnCiUl8Jy5Lwnbmo+W7gDvnfLdxq47E6I0LaIsWlpr
         SBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXsdsoDDS8vXZEAFvOezA2yuwpoPoP+HLWyhE5zt7+/co938fpFtqxxwP2gFjflfXEpbfB7NiJbtQwUCE8@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvQB9+QuwN0BPaPKRmZqUAbhYD/KSk28GM+omYW/FtqtuQjr3
	xAjTaiRUmgJuQgaOMj58MHWz2fUTo4fyZ1JonfKJRyPOMRTcxOYNtovTIBiiligZM20MRdD0f2g
	tHay22YtjMppIqM+uDhZuwgeW3hNo1FJxp44+hUUKjXJKtFDvEb5BVTJ84+pw1VH0nVMN
X-Gm-Gg: AZuq6aK5WXn0EbGjn4uAD6XCc8bBP91RS5AlZ9aTDMaByuao/SJeQnMY93eHacxDo3b
	ZdnuCWOOHlKMqymPOQtOJYxN9lMS3BUrkCS8P1BXg4CPQY6du4L92r6F+2gBFsnJyNPyHS9Ws5D
	6Jz5QZk3mRTRPHohaTd19XMYVWgThmdu34vWUyQAtUI+le1vcElqP38ylRH8ghdxdMlpGYyGuTs
	YFApb0H6OfJ+0cmqva15zZZSAR7MugBWdYeHMmjk4sYD8LDosh3SzJNuHM95nUWBQEjGfGZ1tQB
	cd8MkBEymqjpXKcdKWYOCu77jpwG9IiIninL1E4uI0OSwYw8xpOcnGKHsvDceh/MO0XuxDiCBhd
	5CjvFgXLhTWb3D1zp5Lmys79CLcBi9oHpP0b9/uA/x5QB0UordmZumVhpZM6I4HnYtxJdaMo4Dq
	Xe
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001004885a.16.1769078479462;
        Thu, 22 Jan 2026 02:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001001485a.16.1769078478975;
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:47 +0800
Subject: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1338;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=05p3WSQeINtZKVSYvGmsEKNVBC0B9Jn9M3IpPDE6QNA=;
 b=rD2dN5adAIxAGRJ8S8E2CUYLxHGTa+3f/kXvrE4lm6mRaajo/bEdkmlR06eYX6tVWEgBumgqK
 LPdNEc+/gziA0P09lKs9ONVb95cxLTNqqoMB5/nwLd9f5NiVaVkzyhj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: E8zMp4yY9cnWbsQqJdDG6JDMNihw3Eqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfXwf/M1eS3aMGQ
 JjS8d9PmGhTqGdrRqfhq89yMPfVc9SJ/XMf0z90pFhFFlDh7wYX2wIF/D/G2qDWhTsOug1EqE7P
 eECfjFG9PqOojQ4q0Hg+wc9dk3Q2LswGSeT3hAO201Ld0ByghrqFsEgrwcWwR//TNlQLO4hJyGk
 xI380QsBPWP4TLBp4GBTI7xY4E/8P8DeSWrV0WnCf3n9GD3E2ph2xeKuvjUV5T2l69+PQ8jSq/G
 yyqatlYprwtCDG7GxouF0Z7L3+7q8/T++yJE1dN3YPdf0UgRZuomCKghxOHSvZgwDgdZNOFrmSK
 85hLGMIOx4MKNdWlnnHr2uUR9uqgJGIo73YurI9+vnquoLkxYlnClVtyCC9rk6aJejoptrhCvwP
 4Mz4jpA7DrApShCHYQLhBYI7ccTf1q4v7hGkRvqymRZw3gASJpQBhEht49Po44aRT0Cih3keheT
 A5bVuQcoHuhenMUY5FQ==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=6971fed0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: E8zMp4yY9cnWbsQqJdDG6JDMNihw3Eqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3483658B9
X-Rspamd-Action: no action

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


