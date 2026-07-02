Return-Path: <linux-arm-msm+bounces-115909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8iC2LME8RmokMgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C26F5DFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SU58JKpZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P4TAIKDU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115909-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115909-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D1EB30548AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A53147DF8F;
	Thu,  2 Jul 2026 09:51:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D6480DE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985862; cv=none; b=hojXIaU6jBE1/zzTQKvP2KhDdLnQfTQRHG6NeQRm6KAfctB+YIMfZ/ce5hNpj3FGnz70M3x9qNhFYekoKxfdBM1mL4kUg/+rTWNAlkxIImECvx0WElmCXuwsfgiwGRE2ZxOL0L5WC/Hilicf84SJQfIHvecKBJ+Jtye6BWRfVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985862; c=relaxed/simple;
	bh=9nJ4RWVS4xD358qxJqQ8mIalRRMghPwYWOD3PcvvDzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6DCYp09DQYwAr05JE0OaeiHK9AKyxmCSGCpLP0H1BC12Dm9vpyjU7vXfVebg0cw/3/Sz5I+U1KvuEv7FMi8XmABfnMNvoH3gqy7zZdwOVilHdkHqszflihB4uBdFvOY6ksgyhgez68pyE1pljcOAn5RP23hfhjvqwaLLvEUT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU58JKpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4TAIKDU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KJsV4115130
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=; b=SU58JKpZQ1TjwFrn
	4MSRJTjLcePUGT6AUoeKIzdQrUEvnAJXDd7F3ryH+xEBPSxxRPpA0xtXsSrYsJNX
	4n21fNyCVtfmpUzZVNZsJHqY7O2d7BB085k14JZQkNH74+P5dubFlYJBBVQgmbda
	VYl50ymI6+a061XPPp7VVcWyN3LW4KUPs0aPCl5f2G28WiLdSvs0pI68kpCllgGd
	hK8Wa6Azb/v8gxN8+QZGWZ/k4rWfsGRi1+0rh/qMUpVNVZxOohs82UWkaxKHi1k9
	1GZbW9p/DxJzw7FwyokH8HwU6iNC/6sb11kZM3dAtXAS5q1EbW8NmeU9ZlujX9RF
	AvRKaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9403qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a483ea41so735256b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985860; x=1783590660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=P4TAIKDU6wwojf5cQ3AoqAZYNm/zFU4rawhykzLBgxElve5yARnHdj6ID0QSVeLqBx
         HDrefc4bD7K9LNGmSrTDqykWADEpwADwcoyoMgI6xfVFQyK/K1Us/40MB2CCF0vakeSj
         U8ZULWuONkgL51TC9EpOwXRTDXTJp8/Abg9FhIF9gcspxHOVxwfFGi39nVg8fhXX8NaL
         eu0fohNc0dx+po78m692Tk5v6s+W2ViIC8ivKgfIWURGfUEZMRb0bJhckh/LZqWpEYVw
         xTi+6XNXMqwsVO2rqJ6AITC6wWik+huTjYgA/W+c1S+KB9JIuhNnOfJibvFeC7fgipmN
         VlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985860; x=1783590660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vFBCjbnFRk9zVeIvP3tFUd0Va5w1MdMedUCwfWkE64s=;
        b=dNxZ40+zGytt/A0CVQha1NHlb68q2rC59xfu0DVuma1AWeZan9PJmsp0/C+9kpkhKb
         LHHGXZo59WspC4uNuMRbojhwOICiMjgzCwsAo/8j/X+9dpuRupVWQwRDixLDVCXPvSiY
         bJGAlsY+T2S0Co1UQfd3j4ibxeCKbJR25gmEdMzvdibL4j2Tj/Q3p9a9jeBaQg7PL/Kj
         sWtg1NoKgLRmLfzT01dmo8B7X7o07ZirJ2UNGGtSi1zv/TmmKNg2PTf5sJLA3YiWAEBB
         Q3K0XEvlKQ0U8smrMsh9D/KfukfzSBjA85BWAdAx5GxnlvxkXCFxs/VI+tMFq9tRtgtN
         a21A==
X-Gm-Message-State: AOJu0YyuYcRiB27Qs37a93OVEpCgEj/4nfkCVwMpYcn1zAl1WJg5L/ek
	FAy8POBADgPJq0IYY0B6IAs4RsHiYSEIdJ4A8y6ONHS9nrWld/XET7Z8d3WPVOc6CgKm9SCm6D0
	ZVxK14Ii2NXJxg0qRyUTA16DEpiuEz7cmLespI7cx1piYTNHJKLpI6saZrAwkpw6wKpcswT4GV1
	V5
X-Gm-Gg: AfdE7cmbtIeMRWzvKVQHQ9PcdYaPGa5g46xZCa+uE49uwmKiHHwfJguKugVANeiLrWw
	UjYOLQh30krnSRRAFB8QGUaaHw7/nF57qT7paJnMHM9jY0+nkwkWbeOVUHrIHQV90MVWOiyWXUr
	XkyRGVPanLdsFSwfKHR8C2dv11VIxWhWnsMmMVwJXXvzb/iPhe/6s94RkXtZdXqjnhTMieNM1Ub
	ZYsrlMDmzL7mlTlbhUBLXjdA7SodTgk3yfdTP+8ZwqNLUvG9jtIMqf99rSF1iFkwcp/NOoSDyD+
	Lt1eIODybWhxYHuE468U2kzUXScd28Te7TyXeDItKudTZFLL142TvB8BoqEBTDd6LkFBeh3TKAS
	FnF81RuG5hasfAqkf6f7NMCp95A==
X-Received: by 2002:a05:6a00:2e18:b0:847:8704:1c57 with SMTP id d2e1a72fcca58-847bfaa89aemr4615512b3a.31.1782985859777;
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e18:b0:847:8704:1c57 with SMTP id d2e1a72fcca58-847bfaa89aemr4615487b3a.31.1782985859351;
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:50:59 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:43 +0530
Subject: [PATCH v5 01/11] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-1-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1132;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ie2wM60+tAThpQPFlruvov7NzPvO75/SEoFhbJfHGt4=;
 b=ZIP1YiQcXGJE7g4pWoGmEXtb3ewqdC70YHVWz4xY5O6bKf8/cGA0aXgvVCmfw/GSOvWdwZmDR
 qnvxbdh6KvUBh6CgpQnPLnXZMjWULORJiFdySKPDwY1W465wv0Hyjhv
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX1bcbdYKHtqys
 t1U98oAzffZ/vxYPT+8cb6PSW+DTLFG5bQc53OQqHm0eJZJfS75TjM0KJDpqoBitxlT5k3r4A0x
 RG7wkFpYIF1k67QkdGx3yM52voxf5ugPtQ8cWbeV6+MwPQf3SQ9tgTO877iRxRTLjBxflUQLHk6
 kjNi62yc/WaKjSTrl2AdoCwqN4YfUA1NZpgohpEkAIFQFNVjfGREc01ooQlJhx/xhkFN4/Tv2qA
 EIzbV0ZfAXsgTKujK6oGjfxZsKoEBUUMJyY2U6XI2irhInpBu+xYX0YUfjXCuFvzRghvq7XmMEn
 RmwFZzTA7/Y3s5O9wRCdDH3nzD6q/kS42Ytw2b5Tp1gjyBmuQREfw3P62Aqq6WpXd59Ig6oF3fa
 6PODWK8MvaV2EM6dX4zBL4bWSfHGJixrfxOMt4VMjI1KN8OTb96bIPtyQtz2qSknZz915i/Eu5P
 pqWkEANOoM6KW8aXd4A==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a463484 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9N4CRngv7EVNxCKLGH8-FHVM50-s6SWg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXxkO6J5wkaAD7
 xtZgGkUidxbQxH+afNeqrN8oMhEGEVoYPmBBXFjZU24ieewA43FBI0gZAdkT0Eja/z+8Ja0jyVQ
 uT3Aghj+jA8rOaNMQZTa3n9K98ieUy0=
X-Proofpoint-GUID: 9N4CRngv7EVNxCKLGH8-FHVM50-s6SWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115909-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:sayantan.chakraborty@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C6C26F5DFD

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1


