Return-Path: <linux-arm-msm+bounces-90289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FAnMF8gc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:16:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45D718F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D1EF306EA14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962D1361DD3;
	Fri, 23 Jan 2026 07:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lob5GiHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGE+h4nB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCF35DCF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152371; cv=none; b=ugDnnfWQ73+PitH/vMTr6VLFwsQgTAgReLdr76fd9QQ8vzDhExdyi4HaOz5EQxL7E4URZo/qL2rzCcKz/rNcaSVQana3u2GEoF8KLEMjG24IjshPlClbapIWWtqL3qSq9tz2x7fAocIKrvkhfE1pko5C/NhHi8ERLUh2IbbWYyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152371; c=relaxed/simple;
	bh=oAm2w1B3wOADUYdbdnTyko05ceBRrrkfGqHAPNZJ7nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CR4PyKtGNRwuRHJgIyX5ZyJ6tCZdON2jqz9zaxKvUgkEK4wv6NDvBC0vrqhACG7SYdzLFEsN0OYQqq5+tHOuvxzNXlfNc8BmRivdLDcXQPZtgFi8wAUyznC19Ytx68S15PoxjRE166hNYLjpMjGSBgCt90rXtxnah2ayNbpgwb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lob5GiHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGE+h4nB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6rkvP1328259
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlCzppJMP2kP25D2fk1iMHsxDptOoAXzHriXIuLywfA=; b=lob5GiHmioZXDSJx
	nIRqWYHQidJZCY8Uf/IO1b/ryEUxkDAF3aqFSwA0YsNqpoCRZmEo+WVqwQtkOmVY
	8aOUgNiEVW5x0wVe7pZ7w3BVy/g1Z8YL31J1s1zxr3u3tUVs29AWZHeYQP1KOpMb
	0ukf6Imdp73OtzRvhaG+Wau2A8Pb2VdL9ArMBsJ2P864vkdx89ROsGn0ryBocsvO
	DAdWp2lveZ7pHJ5DBPQpjz3GtKXhAogxgc8PrvhxyrzoUEyVxlZgN9qG03YU0unY
	FXGy4HqGgBphGsrVrUzOW+Xj+yrRKYti7raTaeALLH/B+F+anNlOs7vUm6ySb6mk
	UoGo7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c820n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so36741655ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152366; x=1769757166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlCzppJMP2kP25D2fk1iMHsxDptOoAXzHriXIuLywfA=;
        b=KGE+h4nBB5+Fj7XLq3lQ8NoX26OeW6kGAEQFErvyoyI3s5cKINkPcTKMrtwUP5umYL
         iCi/TMzEl9bPLD5xlSrgGf8TRY3Iksft9Vfo29XAMBGJPGOysCT+A4Zj0qiFn1Ek9JkX
         TOGlexNZND2dM2D+0N6Z4IzupfchYIcmdnrb6hwsAX+ptNLiTBXNgzpNTvX904xQXaN/
         sXP/4QrE4ZkZUmZ5AxNTb+a/isTY+0anT7hPF1Vb+ZKq0EsO8NF4rBkQfAIJwpWTcna/
         9E6pQR88f+MiUD2x9Fdk09H0eaAhmzZxwcQtCBkZcAiaU9MC6gAf1Zto/zKl/JYjmQx7
         W12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152366; x=1769757166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlCzppJMP2kP25D2fk1iMHsxDptOoAXzHriXIuLywfA=;
        b=PQj3rMBa5AK5Rjgnzyj2l9tAIwIrkg05h17CoL7gvsfh07vfBA2zIentcd0BUrs3ry
         PWRu2uruayF5FKm1HSWM0evbSDCWtwg5lWCgTGO28oAzyX+tpLngYDB5b3Ve0LuSulQ4
         YkyjU8hFBtS2+zSSRCOsgDtDr8C4LwHMu8QZq9uWHkxYQiVCgF3eNMfBTSFFfzwfXMcH
         UoSJ8RPi6iDv0DP5F2aIFniK43KqE6KnW7gyyM1/1AQhyU9kz5rh0KBIQkibK4Khl6d9
         qJtiJj0gzKuBZbHEoSokxMGPFM+FoeGSXOPPKul0XElS07pIOM6GXnl3bbZAZ5wfSM0L
         elhA==
X-Forwarded-Encrypted: i=1; AJvYcCVuIEJIBUnunAga3zxoPlqJKJzWei7B/FNqXfU1KI9Wam1NR9CuHJm0lc3YmOpH1ABHonlsefxfVcaXPYoy@vger.kernel.org
X-Gm-Message-State: AOJu0YyRH2vZ5xaWb3ACQJj4MYIczYA7zSTbas6pnJ9zSUh6B69gvbvx
	dwPb83ubFuO4dUW1fs7YoEsUDfjUxk0Z7wbQywm3BxIAvh7lepC+AioDGInu4U3pqkojsWI9/tu
	EYHTENTw8OsFqRled0tf6XnRLLA8FCyr4Xh2NqhJh4w1wMixOrAUWS+FAKmIcGfssePGw
X-Gm-Gg: AZuq6aJkCwDb+5hCivGvQUKg0OP0/S3vNTgWgOVy+bwO6PZBI/RiFmPFjpWappwGZWv
	rqarVuT3/QkaBAT69kiCtJJcZ/SRzkgGd7jRoZJ1Dbj3UTERwdOtCbsMk9Rct/JCkkJA9kiDIo3
	inRXbBzlG8cigxAMnAcPtCN8umqhokcxx3EJrFbgUpFvROVa3LlZx4Kx7+m4Bu62k0r+kdZCnsk
	ShIddS2MfdyRS2x0YXjJObwi5hKqMC7zTi/w0bWSXFfRJiYfxtxzKsVUX2/SaRxdpB0X+8lNVKf
	Go1T+1YxE//adiiHJzTKoHNXhXLDBqwAFAD1jdEuP13tIgrE78f1BMByMOechiFq6b62wf/r1RH
	LR9WKfNz0Bs3tlvFyk7CQ//XlTxCTxxEWl5s=
X-Received: by 2002:a17:902:e547:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2a7fe56c13emr19221845ad.16.1769152366465;
        Thu, 22 Jan 2026 23:12:46 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2a7fe56c13emr19221605ad.16.1769152365987;
        Thu, 22 Jan 2026 23:12:45 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:45 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:41:25 +0530
Subject: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require power-domain
 and iface clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
In-Reply-To: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152356; l=1661;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=oAm2w1B3wOADUYdbdnTyko05ceBRrrkfGqHAPNZJ7nY=;
 b=T/bav/N0hNBenIP7BI5+XtgsxqIv5HNC4FE282RJr750Tb/TiID1ROJflYtef50laUb/lOj9/
 RCth3S1QhAMB+3X1lPuoVXooQtg9Sf8EX4NoGzXsgcGsjxn6YI8gePf
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=69731f6f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fZJ9qQ3NMfmE2mB3PYEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VV-zJPfeXW0kU5cLlveh_x_u0ANKFJRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX3isFkcmnnzqh
 28ek9RZD642iO8NwpxKB6uh2N/N/+3GqXy18q+4C+G7hQuNfrHQkbI7IxF1EC29WLaSOeQQYin0
 SQIDop54J31Jwv47Tt0t2391F+MJRFWyZMv0kf8TLT4mY84m/2G9np2jPnk6A5LG6FSnkw5oEgO
 hlACL7ptlNiUx5zdcHjtfwzpHVK2jOK4Ps8JIBUAR4cwej4sLNar2FuXrfQaZxkkJeh6v1tiF6P
 6uYrBFHc75LQal2ilgv7+m3QWd9FdW7L6KJK7d7CKquaNQp2E/dq2ajHsWc4ow6Ez7qJmBJIPoq
 +o8rei1bX76e+kRiqOYnleHfZSAw5k3IY7sAoWX169Wh3hvpAclvIGaTFTNGekmi5Z7jFL8UUlD
 fDSdeOuLmSun5g47At/qf9vASBslqU57Ro7GG2ROO14PY0ExcA/FRu/o/lddlUawl2Ttw/puiXT
 ypwvOfejtIIKqk/S87w==
X-Proofpoint-ORIG-GUID: VV-zJPfeXW0kU5cLlveh_x_u0ANKFJRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90289-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B45D718F7
X-Rspamd-Action: no action

Update the inline-crypto engine DT binding to reflect that power-domain and
clock-names are now mandatory. Also update the maximum number of clocks
that can be specified to two. These new fields are mandatory because ICE
needs to vote on the power domain before it attempts to vote on the core
and iface clocks to avoid clock 'stuck' issues.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index c3408dcf5d20..1c2416117d4c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -28,12 +28,20 @@ properties:
     maxItems: 1
 
   clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+
+  power-domains:
     maxItems: 1
 
 required:
   - compatible
   - reg
   - clocks
+  - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -45,6 +53,10 @@ examples:
       compatible = "qcom,sm8550-inline-crypto-engine",
                    "qcom,inline-crypto-engine";
       reg = <0x01d88000 0x8000>;
-      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+      clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+               <&gcc GCC_UFS_PHY_AHB_CLK>;
+      clock-names = "ice_core_clk",
+                    "iface_clk";
+      power-domains = <&gcc UFS_PHY_GDSC>;
     };
 ...

-- 
2.34.1


