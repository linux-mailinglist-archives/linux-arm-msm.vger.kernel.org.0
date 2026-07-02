Return-Path: <linux-arm-msm+bounces-116098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U/yxEwqvRmolbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:33:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 257676FC15F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:33:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cL2MWViu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNDqG8Fr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3F5530332D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29992358381;
	Thu,  2 Jul 2026 18:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF65368D5A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017198; cv=none; b=jU7VbmKPbdG2jMF0chSfx3goOm/qBfxtF+OmraFNvF8VHlXKM5MIuE3PI86YfjHYLvUkKYWmxowBC+kEjMoHVYHTQEeRKV0cjVaLs5CACezM+Bz5lS2kn2gZnBY4kFDq/dSZ97TL6bOEvrhT8EaTN1hg3bIpU2aM4rmpiGfNBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017198; c=relaxed/simple;
	bh=ODq7eDWthtMnI0q0/3/kj+6Glk7zuFnIIQAuCpzOJks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+0c1GM42xpnahghHE/AUJ3JaHaAwG1zyrNdJONF+MQr04RM60Fd7RIuBx6Lb/c6OTnF/55k2rrYD8xN4UbYyOnJEmrqEmI9DTOi8CF0HQZC4Txh+uqToYjm7kCE8AFMLxg9cDaKhRbTlSQhlyz7VARJV45Xfu3Ep5sS8TrV/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL2MWViu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNDqG8Fr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3MeT515497
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=; b=cL2MWViusapTSdHe
	PHNWTaY0wgskVoPgsZODtTM6gnPMdw9Ho5HPzaWF/UAeD+Nx8wq9JDNvwNH3FkaN
	6UdnhRT/3Ko/3Qg5/Odck1uB7b+iNitcMFZTMD/GrRoQrC0ScgCQ9nnZfHc2Zro9
	7CTYiFWwUuQOu3SRi8DJCLuJx84W6O60S0r300zJn6A7T0WS/bYvUBsxkhldPS/A
	VvXCOxT9XjOXtBKCImeNxX864rf9LOYFt6iugBJIkAVe74l/LfH7hYizpEnXUMts
	1OKxUaeYSoaqCj33RpSEEorwaBDKe9rxxQZNB6It1bKhmVQs1bYMhD0mqPDyK0Nv
	4IwBsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra8dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9b71388fbso43918265ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017196; x=1783621996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=jNDqG8FrQ7i4e4KQep0bKuoQSa9mMc4/uGt7mqiuKl+hJW8eCFUvEIEhlwvfs7qD+V
         clals4bFjz5MRC/KSUQHqtsfUQugQAf5q0xfleD06+OYKAubr+cl+FT9oRDBCYsPyw7w
         xpLEneG7WhVE0Or7c4mfuc8MSpA+jSZhU8QpjGKX61mhwzWX7FNcpeHJnfeZ6ZGNWrar
         ilbvngZVWr5BiMKeCrvRkaZSmQK7OfgCyBUJRxr1F6B/zV4Q81/LirGgeOa4sN/IWiZL
         XH8B2ekxDPmxc5p/5dSY2MNSof+Yjkib3mkIHKpMAw8xD6Yi2XztMlJNGeZZwQSfLtJy
         HtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017196; x=1783621996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=o33iOSfx6GM8smqP3uFNCnLhYPKColPSoQbecAXxQ+2d6WvoyF1VAZa7jctew2MKm5
         fRDCIzCdWqzJSoMsW7dht1I8bx5HQ+Rr4aZqRjsSRq/nzRX1eewTw5mJMYeqD6mY3v3H
         vM5Cs7dPUS8H80FinI1Xy2n8rBw4X/q4kpass8LmF6z+9jY51/yaTWqYFDTBD69JjZ4C
         ryzPIeNLH8YPlKoo4mI1oYcXqiEpVNDeGkXhh2c9s+C/MeSizQA4KTt3dl6XMTUhS6Rd
         pHO7L6VuKXzmsC52RKRkBs6Q85reQawIHw4u3QoioObktH79sx3f837zdDiw2kNfwwHE
         FiFg==
X-Forwarded-Encrypted: i=1; AFNElJ/1hK4ZSnxLKfIazM6DSz2ke2boX/fohpWUs2P27h8E9BkEgZxdIcdU+K8P48jNrtQ3xFgsx/GqZVs8UW0S@vger.kernel.org
X-Gm-Message-State: AOJu0YxUR9KSkvQ9iY5XUR50u/eiTBTUp1ctDJpjZcsCR1rzRtuYr/jy
	/K1CJPg3LJCanYgL+RVPcXkavsQinTcxB+fbg41hjfAef7BAkyOWS7m7CNOysn9AWqmwAlW6kaG
	/NkUlDHq5bbc85zRh0tD5yeEWq7orZNI5xR1j9vLXRVccxSV9fc3fq91PfaZah46jKaCV
X-Gm-Gg: AfdE7cmYuImiqPfLezMsVeljMeoZZUN1VhdlMtSAhzM9QNthoTLe3ZxtdWQlGkuQFXQ
	bHoc7Pu1s5eG1HSbugTFFK/Nyy/eEUUk90FwMQWAmbC07Csgo6vb99I8LJEeUvj78241nW8kQjJ
	nC6lmss+oWIIx8cM6DHKQtdwiJ2XgmTnHpJ/oClHJvyeC/tYuj2EbOlIOeIBmQY+luCeyYCFnx0
	npGflO7onswI6aBP3o/64yv+GGeKkM2pcPN9NBRlMyM6EspWuyyoo7xGfbUkiSvUkWR2bS0mEtu
	vJ1/iJ+2g3d5WIs4nsewK+TKHT1XIFgUmWQ/xJNHrAphb+F0lHszz1MbSgVjfKElsxDO4hHt2Mr
	zxo2PmlYm97A0lQoe0e0C7cGrkdyO2ldVZ80vZXaTng==
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309459637.16.1783017195595;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309415637.16.1783017195161;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:26 +0530
Subject: [PATCH v5 04/19] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-4-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: q0XdCuhi_T2hOyhbDxOOO_pW3s-ygYd5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX0ZnQp6ohX7bk
 1Xr/d1RUFtXrGTXM258nSjOK3nS/x5QNhxyt2mG9I89AYaB2IL2mEjgPcoSW+HfvtPsBeyOoBTU
 N+XTRZOWHrHCxHJn5Powl2+6MZue3FU=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46aeec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: q0XdCuhi_T2hOyhbDxOOO_pW3s-ygYd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX+vqkq1WXlHbS
 bamquTg3LD/rDW3DUEYsYDSRpTc/PoOknNnb9C2RLeA1Pos0FtdpIBKUTrUy8/O3AQVA9WH76he
 XYWmLmMovcqLjcgG9JcQZq8pEvZB8aHOvcul+qQN9U4ctS+Ij2fS2wV/N9C2PovGhG+AiKDCpRi
 LAn5EsniopHCc3CI7cmm/XpmE5HLpUOedQ5fUOWCWObomc3RXcCUgUX69byz2ODYyt2rdlBYZyE
 YmxSPwuB62JAkIuI3KeOkvpB07jxnneCm2/MhEt+lH1OCzeWR7nS87OoqZDjM0aeJj/ajRdXfkM
 Dn98GGmNt1PpYmt0WAOv5RN3LjAqFZntnq6MQ5l86GBoIJYKbpJa05Gh3TNmdt4CLwC7RxWwh8Q
 hcasPU19xLru4CAjq3DsL2EocIPXkiFPTaNuU6qI5C5oPUtPQO2tYERNn65ocDSYutZOLUHFVPg
 HQFcu002CK+QcxqPWDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 257676FC15F

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index fe49d7fcbd4985adf340945c4b907758abf7ea10..54d56bac66d8b40d1457f2cd1797b19cc9133686 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1


