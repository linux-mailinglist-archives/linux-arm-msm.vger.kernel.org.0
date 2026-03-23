Return-Path: <linux-arm-msm+bounces-99131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOYFHWEBwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5862EE97E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01E083031CF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F1E386421;
	Mon, 23 Mar 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlRr9lk1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJK/ubfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E36385524
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256074; cv=none; b=JT97nuVDSq7UMKDMd3CZf57eTPJfScZT0Yj4j0uO5j24X3MGSBdaxRy595nr5iv7NV6Ep2/OqcneWqvDukimd2ZY+ajdl9Tci728M2xfPKG+t2pMuyoO611KlZpppNHfTjwiq3Ij+I9FhqX0RFWs/0PFc12cJqfHEpqpcgWBl7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256074; c=relaxed/simple;
	bh=jPTBQJ7Z/AL4PTM+LAcA/dw+ukqYS4dsNnAXI+f6VoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iey1RPx5wJVy5RopfGHw1QS7QQH7eR9EyflnCtLhnBdg5sMNhEfm8zRMP5i8kQ8SU79WfkjQ8tVm9TQhgVE46au1xbpFg27tkfkMkcQAIKn75+paEXC2iftiWXZlNwDvz5gtvEPzU84+ZPJ2jxKCXHfOjuXO0jqdrLatlSCQjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlRr9lk1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJK/ubfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72l0F3295180
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihKbnTyIXkuHwk6BYdfyOu4DUVsROFPFAoIBncCURaI=; b=MlRr9lk1uUW1c+94
	nk5Mnte/yU2JsPy9hGkTahzccWp8qnfiZ/KAu0zy8+m1PK6XvsYUwYQ+vZ/g/Jej
	vj1WWGHRMUEI4BSacAaGseCBBxyFV57RIyIJqjhhZBdU2rOW87lFsEIL8PseVLRr
	H4rxOgTDbFA5WkHwmInKXW8fVLETBBL6MuupUUDcaW+/2uBlWNBIeuDZXMzmXhhK
	BkerG/jRC/1ZEof4B7ZYqJOoeSMShF+wXTruAdokgse1DtwWz437hyd2JgPgTgJ8
	ULfSTENPT03ToW+ctkNpEj2OS+rT3x2K1ES8yG10lqiAaZb2M0kCxzb347/vjc4C
	ZCbHYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jh44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:54:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so317068561cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774256072; x=1774860872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihKbnTyIXkuHwk6BYdfyOu4DUVsROFPFAoIBncCURaI=;
        b=kJK/ubfCl3m4ZRRx6ZUXW2p1J/6SpbenJ3NMxXwRSlM8J05n0tNvMSzCw9IfGkBFiR
         7gNeNodcE4xpQPzueED7ecrPv5BpGrBEoC8W7Tjzc94e+T4/cW9x1L3sWqVpxZIvhwY/
         GvBJCJB/PUua7aV2MtfzZngSwW389E7K/ujsc1rz4qjhmrPx95UXjSGgXQbP8njc2THs
         TdXTIcfxfaprolmlW9HKwjYKonjOJ3nNLU43VeHIA5DDTLWqtxiOSvPKk3H/Gxgw5mWS
         qeIpHQ6BbRaIh2+coYkxSp5pt6u224mEkHNWE9o6B5dVV4Dr5XQtj+BjGAllUAY8fr6n
         lVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256072; x=1774860872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ihKbnTyIXkuHwk6BYdfyOu4DUVsROFPFAoIBncCURaI=;
        b=pWWOJOmGwNI7xEqcj2BjUpVEbNd1NrNkxJImLSmdnX21LUx9luvQRK1rJE5jjeWkUL
         m1FAG+OBVVeajXwhVe9PcjRSK0JaNCMrXgtru15ZCG5Q/0n9MoATyokWkoyIimrHKmgq
         6rbvT8ax053aRb65rgxiYxICAhd+Huga2SPbb1gUWaqQv0OFNwzhGWK35V21Ul9Vv4uO
         x9Do7JbQvU29Pw3n6MSL4ii4DLxal6RpRz+Q2DxXlkmIWAkZxRY/ZfpTYHTn+nZ2w4RR
         x86uOdXU/mj256NAIJho0k/cox4l7vDiMy9VGqwkmaKzkgsXeR6lMnw1pA0Peh68rObQ
         xN7A==
X-Gm-Message-State: AOJu0YzkyTm07BrIxBjuFcNIkv04bgpLUJnVBphAFhirrD7vGzer8h9q
	7DSWyCxFIAhzPEzYHwsJtSYfVWWHpgKMALyvk8xji3rN4XjtfTHB/pgUKergqvWaJcjLUHX4qIY
	wfIiR0xvm6jVQ4WcoFDW+/As1Y3mjqUuarHYnrTxImLDuTHFXeO2KNc6K2rmkZtqC/8it
X-Gm-Gg: ATEYQzwQYkwFh6YViCavbbgrSnhlBJlUjWR/J94IJYUegpDFc2WZ7zhjQBhxl1LLYwE
	5fxvcD1IHkkEgOYqoOmuwcASmfTJWvTy/9mQ1OVeplbQlcL/waSUkYL1ImoyDv2DcVqr3BAuzDY
	Zvs2koX5JRwy87tQTiEtFvtow17TWoQelwXfYyuZfPEj6NUqmSrfPz8TNl+2x8B13o0alfhbT5Q
	Ayqcv3YFzN2KdBitGq8PuCLcvMXktJOD1QrLVrN6xNgA/SE22t7I77bl0KWJ2C8/BRM88ly0/nI
	swjufM2Yt1T0w7V0U3SABor3MM/9VCqzT70VupInD0gByLXBMnZEmJsSy1YTHv7UIIfDZPrEdE9
	8X02hE/KMIwrj2UFX3isHtRzcoeYUHu1I1pZH1ppwjKNE
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr223821431cf.29.1774256072061;
        Mon, 23 Mar 2026 01:54:32 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:509:16fd:ac37 with SMTP id d75a77b69052e-50b24753e07mr223821241cf.29.1774256071646;
        Mon, 23 Mar 2026 01:54:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm27911739f8f.18.2026.03.23.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:54:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:14 +0100
Subject: [PATCH v2 3/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM6375
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jPTBQJ7Z/AL4PTM+LAcA/dw+ukqYS4dsNnAXI+f6VoY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpwP+9HlosJe0P8z7AINRI2fCZ1gKH90cKbZyFC
 cTl2eoCZISJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacD/vQAKCRDBN2bmhouD
 19lLD/wM2NiSg1EIF8CMBfsQI/FzyDO7vfqC1UzaOgTu2RcEYh5jKiQ5c1w0qgGBhOWDmPaa+Wx
 xC4+tTd4+fIaxTeu4GqG0ZdkGcO/ndTyKy+YY9GckaBYSIG+uOM0R0xD9JNzQLvKh8MJq2fI0Kb
 /gl33qp1dOYXEVIdVSsGkK0yQn4kvwCFpnRHHL3E45c08DI3s4g/dWrmRduxbIJTRLaUyRCbsEG
 abBM8j30p8BfR5qHV+oa8QNvzHSM+jEBzwhhGlN7oHIwJxPpUPvc9tAyp7fBtTNOGzzsyMA6fMB
 vWZH1eVMuYKd4EeE38HFWH/wAz2R+8fX9zHPvGRv2HF1KRP8tHRBZ+XHxgnfBnQtDsuHkVZgUvR
 6CkVEgquVmI9uWIIMfnvtSe8iamh6u+HJpapjPsF0zmFHM2R2qxycdcgxCkCc3CrTiLDEYkLC9Q
 3iIbF0GjVqylFwSPT8NEHD9KYscZOE5cTt6htPvwqEHIF5LZdHPjcvOe+jsjAnwL0Z7J8xICRHl
 NrTn6rCglOuW/bAuuj1ilZZF1Z5p/hgWzCcYKZRouATWXeCkN3XgYhqBP87frOWjcQxNEMmy7+/
 z0xcJmE4zQvRguI6ljI53MQ3hfs7odQmlG+q8BFcqAUKwQ4Hj/lm/57Pl8LyzeQuqNDHV8LJv0B
 ZWE1MSNp4tltZbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2OCBTYWx0ZWRfXxHj0GGRmO+7J
 K4W/zJ/qHSeqEw0YRhe1XFOZi90L0O0HfzO5hPrHWmEQm5NnFsZ8/XuT+ZEHHUHRCZ1SQJHVqo+
 pCsVq9FrPcydeKwL9n6+wZzf/8uJajtQqt7MrkHIhafsGQw80N8vQ96mvXbtggN3Nrf9ADLyAUw
 ap1NDDGz9Ce5eoKrvJO9DrQ2fYsYAX9cji91UA3mpHwig3hZlJGBlWWQFuC19Ih97eSSk+uIx8b
 YX2CQqHsIP1PBS+/W8koy5oO5Rji7XT5B24PTLNxN2belCNCKj9n0dL/rPYU/Je2fQTYizNBgkK
 soMbmVubZVXwswxJ0/r3Z8GQZ0PamqpnpbDlQvmnK8Lnn9Q2+gC/V7sct77Z8L0s4nfqFrLaqv/
 dvseWdpOcN9hoUGOItVkBXSINoPE/y71NqLiM6RGPAy8tGX8Qo3PDeqVz0sUcYQFbs5Ho5kmIbY
 1NiwII6LYRSiF8MQ/VQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0ffc9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=oKlVy7h9z2F4x_BOktsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: eBeLvnNSiDVooeCPCj12w7sdM-vIsrl1
X-Proofpoint-GUID: eBeLvnNSiDVooeCPCj12w7sdM-vIsrl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sashiko.dev:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99131-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC5862EE97E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom,sm6375-dwc3 is already documented in top level part, but it
misses specific constraints for clocks and interrupts.

Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I wanted to add Reported-by tag, but checkpatch does not like non-email
address:
ERROR: Unrecognized email address: 'sashiko.dev'

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 1ad2b52955ee..94eda4fe48ad 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -357,6 +357,7 @@ allOf:
               - qcom,sc8180x-dwc3-mp
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
+              - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
               - qcom,sm8450-dwc3
@@ -531,6 +532,7 @@ allOf:
               - qcom,sdx75-dwc3
               - qcom,sm4250-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
               - qcom,sm8350-dwc3

-- 
2.51.0


