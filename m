Return-Path: <linux-arm-msm+bounces-110496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MPnDhMLHWqvVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:31:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C1619709
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCDEE3038F7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 04:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848ED32B9A1;
	Mon,  1 Jun 2026 04:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVc0eLdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Tz0W/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F031F9A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 04:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288169; cv=none; b=Crp8PRsq0/aov9+qrveLt+ZEGx2qTSR29OzF0midToS7W9UXvWbV6T33QmbUK1S0mhbLrUv03Yxdd6sfLfXHZzGJ94DX39rModsUqH2MGCxWIZO6uFnyqfCmXDXvEb2tQ6sTgqpXIdYjJrEBeaNEpQ0EegwspFdS79yjRvcjMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288169; c=relaxed/simple;
	bh=Qt2kstaKGrB1yY49mZjobtR/4AMzw9aIfR3UkFARmBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/YA9jl9xmz3Onrw6j7DJ1ESqbkm4tau3POG/oR6ETuV/35kVsdKoBac6mY+juwaw1FJFRe6YndBGMZQjV5UQeCkLDQ6T5M/Id3mhlWFJGFwbbWTGTEJB3gtrREIma7wV4EhbIgZP8u0WcOxQ9ePd5g6dzDXlYDPvSix90RiYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVc0eLdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Tz0W/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKL1K52765496
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 04:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=; b=IVc0eLdK1B17gW0m
	Qn1SfzqlkAoAgwwO5/bqEqTCWwM/zeTi02Tqckh2GdQKLyZaBMeNgIeb9T3DElMZ
	n2bm1a8ZtwbEVZGlzJkENGCYu4DsCbfTJm+zXcq/qsDro8ApyormCn0b7zluYRmw
	5zyIMIuPUQ+8uYrG6eULHgJOPrTTdkJB59XUeDpOY4L2CFB1dJEbKPwO7ezTVc56
	icLu4wmstubr83mW7lVPHcAMx0SmPmlLIABUQKOMsgdXK7x2OPwd/daPG0nJWKM8
	DNZYALdCEThn9n41vK9MiL3lsl9QTAjJTji4Vk+j/ZOaU9M134n2UWOmU80+0bcz
	ie7gNA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hdeu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:29:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so18198265ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780288167; x=1780892967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=V2Tz0W/mhWyu/ifAW0+gTIKzO96xislM8crI8J2RTKmzx+21yik0cUwO+i9GVHHh9O
         UNTW6SZsqe6kBaUfirD72PtKAV/dUwK4+QKxvNANhxpoakJryNWefrQHWhTZK+4QuY4U
         Y//iPHa/zYwXyX6PQl6N0MDakkuNe3r6HaHnRK4X3e3EYDXMoeAD+7VIOwUlf0DNC3AI
         P8N+dQDSEMUCZRRDWajxu/QFEHBGNZVnJ3g+JHD3GYUtsflj2NrT3Ba9Az7qMHNhaNz+
         gFVGinYYOk0rC3hyZcdZUxZScoXl9wpPYwwf1MGP0Bsyxf6PEpfbFGNTXLycN9X/asLm
         6yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780288167; x=1780892967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqRYynkSRgvqP9sDhmtCs8Xxd+0USAewY/2Or+/Dk4Q=;
        b=LVL7ZEPOYcZlQ4kcpwXZ7s+wd05+cT/p5AzvjM8S8Ol2nTOre8SK/5hwbJRp3re7V9
         xYbBLjGgI/XWlFeIZTgNdFfip/YK0gz61SHPg0sHVjr2sfxLizs0a/uYAdQwULYZbIHU
         /mkNIqXZBSqOM2KKirE1Txf1/gtl8hGBFag8j3TbobJR+zBehVIRusSU6ptvi0/Pzi4Q
         WZael3W50P6/C2O/VB8p9Cxw26k7A3XHdQ60rIVSVie/LUxv4h9ySF2PoarxFLrJlbif
         3rbHwwM+MfWaK2+HFoOBUzJoBZnQCQKeINx5oboDT5JskQkHwZzDnxLyeJfBTNT+P+dx
         AUkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dJfF9TqnrNrYn1ep4HtZuwUoSxLC91dShUOQuez8G1mnzLWxM5QTo1VCsplbbwXcsVEYTHRLfzfHzXsDj@vger.kernel.org
X-Gm-Message-State: AOJu0YzZc3NZsyRh8Nudyt1iBOb0wuWdjmRoS1BXa3qKX0Z4x3R5kI0a
	jXtOEKSZD6Lan39gzLTTOO7NeZXp1f5e2MzpByKPhY8okWncZ+6AuN5JX6IThLUMubjo9HGyk8P
	7ALGDb3wIq/dcrX0+DvgolGBsmF0AZoaFFdit2xY3ZpOe64amzW+ljdoqtY+XJ3/DVBKZ
X-Gm-Gg: Acq92OFa5eeMz8m4memZy1pChwXv0ElDl9kmm5cZvofqgHQWC4B7bDr7BGV1+s5US2R
	CO3rEQPJgoWjidc1DzXV4OdW0vsaFgdqOKIN/arrLOprXTKiKX8CpCa7msc55/T8/hKFgu4zbXE
	mPbJ7FFGK2hYbRM02D4IEUzLU70M1Kn/GlwUB/RHpq9bLK/ULQDVv9qx0hZycg/Ms7kq+qyodgM
	caUsHUQLQb2MZJC/PeimqL7qGICIDbC0GdeZb8n9pMaWyfEqVNdTgDw/5WvO0MJd7LWUkoasd66
	DgGvDxLttMfXGwn97jYYCej034NbpNgGvGe4vw47i/lh8wGlJ23cHoZ5txlToyYMhPmtM+XNDyN
	7JdBg5fNiACz9Z2S3ZFLOUUUs05U9cdKETyu5TdJgJTRN9PicPKrfmmajMsF/jB8=
X-Received: by 2002:a17:902:fc43:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c0a555946cmr74635885ad.6.1780288166901;
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c0a555946cmr74635565ad.6.1780288166496;
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm117215715ad.41.2026.05.31.21.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:29:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 09:59:13 +0530
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra
 SoC RPMCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-gcc-rpmcc-clks-v3-1-76c455f5d579@oss.qualcomm.com>
References: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA0MiBTYWx0ZWRfXzSW6/KF5e3Hx
 T/6M1OqWKf7tnRI1FLsfwg/xeYA34uTPhFetTD2D0OvKELCyJmFGuzH3doQIb9GjMntQb3FDY34
 Ds2QDMkvyLdNZq+Rhiv3iIf62NphMMVrZ4KVwuO3hT68wcCiTUyYmU+Pj2pRsw3YrmwiRYr9Jqd
 CT/ltHZCL5fNqgGSF0dIGfVtAno2WOAWULlVyduwiF1aVqQHfPqq7xmolXP7vKtySX0LxOfEJRp
 Wlb0N0zxYQDx0ksDfkWw8KepJ14qnZv+JlEm0jDZBqxpoeQeLxc3KjjjkKqk8fILucgvvVO5jJb
 b3IJRn43G2omvUyyjhTNycD5hvteMVZEUq+UwIQzzrpblVP7nsxvAhqDlkUtGDG6mlNCFgfCTqG
 CHiqeoJMpr1xVBy37wOfHWLsxKS89epT0IxXGNVNPTmrUsItk7PS0ThEtcCAC/S0glpAF2dOoUX
 8ynvbzU53EDzrxQi1rw==
X-Proofpoint-ORIG-GUID: jPbCJdG-TwPmb49pfMzF6A1GArO8guI8
X-Proofpoint-GUID: jPbCJdG-TwPmb49pfMzF6A1GArO8guI8
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1d0aa7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5MG6tTDo7b5tcJehnegA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110496-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 999C1619709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for RPM clock controller on Qualcomm Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..b8aea98b00bc22c4ab6da1e6235ad676f200b44e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -46,6 +46,7 @@ properties:
           - qcom,rpmcc-qcs404
           - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
+          - qcom,rpmcc-shikra
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
           - qcom,rpmcc-sm6375
@@ -126,6 +127,7 @@ allOf:
               - qcom,rpmcc-qcs404
               - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
+              - qcom,rpmcc-shikra
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
 

-- 
2.34.1


