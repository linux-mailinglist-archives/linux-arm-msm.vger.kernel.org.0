Return-Path: <linux-arm-msm+bounces-116767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cZyDKzysS2pCYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:23:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A92711349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mBGbEjEo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=col0qm8z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116767-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116767-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69D1F32FB8B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC872417362;
	Mon,  6 Jul 2026 11:32:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300641DED8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337540; cv=none; b=Ufc13s02xqG0qbDg4D+gu5lmX8fMgypaMl7E0XAXNGY7D7JHptnKxfCvP39tAJwzHMNfbwgLroEgAI+STiSMqe3PDuk6o2E8nu1C0S7pzC+6w2eJpiBwuUxacGCVcFCdDFJb07DbKqPy1Q61vhryf1OO3dJz+QPMkm5FjqT1HDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337540; c=relaxed/simple;
	bh=Tw77m65ctMpu+WdJ5WWdw8xSnLCdE2h/81HKHaG+/qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngib5eLhnobYWIUfoKwUTURTfwgEB0jy+C7Iiju6Gv8xGeW4WYC8CGF8dvUKslUaY96Ip6bk9SLMcJBPy0wn0lJUFIcdgxH2/Xju6Eh2sSwy3k3xzFGBpvT77GKlOdN6Pf95mjh1Q3LSkJCow2gXhE2MhcHC2XuB7XVNynguPig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBGbEjEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=col0qm8z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFea401628
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQSWpZpdZx1gdCMr14mQLPTR4DAVhMyhocFoNcUqucE=; b=mBGbEjEoRT5FKNQz
	4i8cFalxOlXZT7iErgvRyE24n9Hcg/kOqIY/S9wrLk+49HF1XKiMzOwpbhmjm9md
	ybFlQIQliBzJw6iy+LPwAN0Nks0H5xQ8uo86Zd8YehxXp5gAqLNUy+4o0pjPPPWz
	rTMuZJ5+8Hfsv6mM1gJAwzheh8weWvAP6SB8x12dXosiRWRFyLXUuNPHE1pQ0Lb6
	5fIbs0o553OTffegrMhMs/4aexvGDyZr8yhPe0x9o0tVPfqeNPL94TiFRIumQQf/
	FhaSUPqcDCpJZaMJ6iGwgrd6GQe50ljrZWCOuX4AWv1AtKGdJY/t0IJedxZeQxkq
	DWaIZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grbyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:32:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478ff5d801so5358294b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337538; x=1783942338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQSWpZpdZx1gdCMr14mQLPTR4DAVhMyhocFoNcUqucE=;
        b=col0qm8zA4pT+AoQU68LJaCO7+oRtrV+2BklBeEGVSB1gnQrsAtzQDWzp8WLlT3E3w
         5tIIegVBnL+ssd67MiQXKkF1Rv4MCts/wV3fcjnOuMgOm5i1YRY/5Yf5l7GmBDGk1LNs
         BgLui1a1YPJ8XknEBQldmWnL1gEjPB5AWT6GZ2IPA4AfxLJP/IjFnIZ6medHBlbdV/lK
         Oq2nIrmDyAR9QVb5JAdAncPbTcgPp8uT8To6ekvZsA/haRBNYK2+GXBw233uo/aplmPJ
         rj944dIhpKWyGdUs+4kLTAop3BrQEqWFMWiwuUlv1yz8I8RUwZ/P/Y5gZ2aeHqX0ehYT
         zpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337538; x=1783942338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQSWpZpdZx1gdCMr14mQLPTR4DAVhMyhocFoNcUqucE=;
        b=L+WZT4nKwf8pH6CW69ixMv4hTwFA+tgjsnI7kq/gXhE4zJXMPkKBs2oXR6VZ4is07q
         INmaIfs0rM+L4BJ5h38oYDShznF5d2DVoSFKqod5o+xWltzhj7r1j5MYzEXjW7lhrNuN
         Wt7+jJGRjDtcZg/dqI2HTKocc0BEu2oHokIWtP8MzNUwPrHQ0C9lDstJ/VetguX9wOS6
         CePKjUmwSj6FBHJEzkKxq0tIWX1dazeLhmggGYSWTOaqOGHSV7Pl6pBTkhIfXm0N5RRK
         HbOGmomdczhj25DjO7B4AoKepZFJ92fr+6K5tYNWUnvcOHdc9Lcs2toEifDpdTDbX4mr
         q+Bw==
X-Forwarded-Encrypted: i=1; AHgh+RodpWfKwuRV0rCGXIBHgYG6mQhzTHH8M23rabzhySORojTzT1USCpqDioAu02H5DL10cZGwbDw36hYLaTpj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyth3j7t6yxNUCoZNJCshTwKYEzRv0+k1JZA1CVTIZHw/XibydN
	/o8ra0nC1YJpjOls5L77+VkEBBuJVMGWCJ0foKiDRopls55LxVNZ1dGTMsSVGeMufDlvhr2TN72
	+Ak20P1tL4nOjIoMj1FP/pdFRb7PRvOjJVReNo7Bm5j5XDLa/SlccgtUVdR2XzMNZJu18TL9EXr
	DN
X-Gm-Gg: AfdE7cla+2q/2dv1gdw73Ey+aVc4i+YhaVJHKZek256Et/iYs1QCIf8Yc89Q/cHOpur
	15BryslBrNYvF1+jHLWm/Iu8HQ/JiQ1LcuqT4H49ziUh2cxGKrek2EQWEEq93z7yw8ocdFMYQaY
	ANGpb/KN9He0vpDq4gcI2TtXAc18O/NWTvO4BJjs56KD/0olYrlzADXZkX1KJSjj80r/BF+2Sc9
	+K9XFHE7VOfWwIXbPc8kjOt3rX+TDSqSRMXlRqpJyTknl5voyJI5QlPpwcgV1s7G9HH1hlyiIk4
	C0rixCm4cZ10NhZdj1IvIFFrXAvR0WZ4b1HZNMbPukxeauqfDbTfkrXHV3zO9ohnsiCRKVm1WvM
	YctXerxE1+k1D2OO/NGbtqwONCLLBzO2Cg4MbAenK4rME
X-Received: by 2002:a05:6a00:3027:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-84826bf903cmr128483b3a.10.1783337538066;
        Mon, 06 Jul 2026 04:32:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:3027:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-84826bf903cmr128452b3a.10.1783337537616;
        Mon, 06 Jul 2026 04:32:17 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:16 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:30 +0530
Subject: [PATCH v3 2/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-2-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: GwjMhDDrh3vWR9fzAMx1o5niAnBMXuwV
X-Proofpoint-ORIG-GUID: GwjMhDDrh3vWR9fzAMx1o5niAnBMXuwV
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b9242 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hDoUnBfku3VNtUQ37LIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX9LaStQ2rSgja
 knWw4upB0q1H+4jl6YSgNUkyuBTCiNsB5MrAnXYg71/K7tGTdbvdQ08L6jI/A/zdi1gf60hmqC0
 nFgdMd8Figa4bcDNfYO4VqAKEyeBD3pgPW1CBjDHFtA8x9U3OiehBUTojqqaxvC55STPQtpFYZd
 0LdvsHWrlTEYyfwx08u4yM+hSG8vmiOUyFbbn2RPH+i8BV1IaStrN7+wcslIJq8oDImsw8JB6EG
 C2+jtet+b4MF4MdCZj3jq2rW/7v3mWGWPkkVkLgl4QwMpOaZu+b7dP/nG+44hH79ZDqqNMsPeMq
 OuX+JTODqvcEtCfdf3TTTRkyvqjRPEGlhM41xZ8JGW2lIGjBIqq3fXatI5XDb3Oaoi9p+ve4JD7
 zkjFmRAeEKbAyF1eYXQ2weAOXqR+x0Tx6YaEpiShW5YJ9fihDQw4dESXJyYMLKJLHGEa3xxMysI
 k+ekz7aeimyB1GPUlrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX0SReRRlW/56f
 LHk4r8SAp+rN8eSDVTSKLa1Tauc7ZVe9Crvcj8UbKQAwdXMhqAoBJEcBz/7heU75Ngd8soNS12O
 WpMnLktnKB9PDIXjIoQNOWEa5INhKuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27A92711349

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 4f3689a24410..9e6d3af42971 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1


