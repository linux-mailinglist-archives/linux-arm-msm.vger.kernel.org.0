Return-Path: <linux-arm-msm+bounces-100265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ7nI3Rcxmm+JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:31:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AC342921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8F530A6E46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A055F3AC0F1;
	Fri, 27 Mar 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOVJvhLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agb+poeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29019347FEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607094; cv=none; b=SrpgXKndJse0W4kt4Wb/hJhm18xUllua3d7llqhd4ougNyckfQQfLT33j+HEubkLJkeJDjHMMMr+Zng7oneOtwJXue74VoivJSgcwdj8UAxtLrubss0LZFO98kaoMfO5pZDzBAd0i3EEnJirWdWNNjDGAAL5Lzf9hXzdb0gp6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607094; c=relaxed/simple;
	bh=QptwI6z3j37hX8AHtjzXh+bGzHbUl/D8vt513nvFX1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsJtIRBkr6VS8G1N4/a2PDWcroE2hg1GqknOUh4XP9b7XYvwKZXlCTYOITZRxPGyPgQNQuirvD/yVsao34koOr9kk60Ey94G57PtCWgZtrVuB7bXVL1HL9D/xwRO86QRUwZvPZhDXcY8S0HyYbzJWHP2LczM+lA9ZFlNNbrZ2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOVJvhLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agb+poeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vreR3713868
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=; b=JOVJvhLtmpzqeEC0
	u1OSqNbClIwN0YUZ6k8he59Ye4JYjIoz+Slxv0da9QvU8B+MOJ65sBaOpqC//WXh
	+NqmrfjSEMKdAfCNUNZXjN/xoK1Za1K68l/qFJvzDsOyGMinM2rasCsYZK7Z6FJP
	8b6iGHxW7sH+xvI/YkKig10/cSKlYFIrU4xR5XbUe5aEneKU9GtZtyrW6t+r10Pf
	05LEv6zPRRdDHrFvqXJoDY6Y5WK4QhSBTcA1ISs2SggS0+j+it2fk+/0/2VaKwTI
	FJFECPYbLlyh7nNfYFr7vZuiHF3NgjrYEW64KudBrqSzuD76hm0aSBVj3soceSew
	h+zEyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapsp5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so76316eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607092; x=1775211892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=;
        b=Agb+poeTYH7Wz7GYf+j0FIRQ1FKKr4rfU/+79m0S6QEhcN+xMhAgOG/XY+Zuosvz5h
         +O8Y+1Q5KplfphKyXwlZnWJEZiibAZGacjd9iOCIbkE6VAAAlB7wea+qi20s8B7wlSQh
         0jKoFcafeGb4KGD+twTA3eZAfjXUR71cXYX4BVZm+M/meUVBu3Q0QBa8PP5pEar7w4hd
         qiA3NxW10MGgcwXVPa41m7qIz82l3sPFbfT6lcvA+55HTWnLRspjP9KGht9I3zBPhlB4
         Ul/YiMUIkwth1Mo/rUdj4bFvsfGlfPEWfpqLqDwOWrW6/TOdKokauZvzwiS5hQxbeC7x
         ilmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607092; x=1775211892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuRMSc2rWOzVRyif4RpXwrzheKcxW5gqhQieftfkZaM=;
        b=Qty/ws3ggAteSXCcLhD9U6+dHmpu6dzOCdfaqhwGruGo7QM5YCz7T68ogYNzukeyo7
         JLTjh6zlb8pkdnEuyNmdJb5ocM4njS94VUBlm41d/Qt6hFETAoWvExqA1m5phTFqUv+y
         CDwGIshL/JAOt/zfIO6sLggJ1FfszpTrtJur0eyBKsVc8ZjJeYroPizyXYbtAnMbcKCj
         Mom7ojgSVbOiRZRXonbHkxiD/vesuIdzV4uTGcRiNJ0kL3iXYQfto4GOl5vUve60kXi/
         d739KtBpXvK6c2s+I3HqPTeINw8vXSj9lSHi95aMyy/5H2XPK15f044zenD7QkpLC3fd
         jKdA==
X-Forwarded-Encrypted: i=1; AJvYcCUfQX9b4C3kMx7Uk1/6dhRSaxhn7ewfW6UKMHAC5KmY6uG3yg2vl6US8Ey82kadDMcI4cbHfImGu02fGa+N@vger.kernel.org
X-Gm-Message-State: AOJu0YxscVfAoejshMgcBUtBR681xzRAOQIHhDOtUt4zY1ihmbf5D9o6
	GBURE3yTAiqFiTHB0gF2OFshol7JPAve8TRvoJihE5v004sd+Nwoi+Z7wq3YLL3rCPNeN/fBgtO
	j/WtMZeAr9+xrYt8JtUwoG3ygCm9kZ8+PLIiQyDE8CQnOroCLdKm/SWKS4D50540Tf+OSYbrZwO
	0a
X-Gm-Gg: ATEYQzwJ5YOzb/90rqgdoYtK2TbXq7D1skkBvA3tcTCZFLbkxpvNw4LcPy4Gx5bBBMu
	OZt9ZAUYQ5cTOBMePm4yCYB4vy003rDEfyl5IDRGl4vHwOSUjggqbdCrKq0+UtomYlSOvrliEji
	ciixJ8B53UNerm2m3P7G8o9zAzI8njtNZ1B3rjw7t0droJz6+riBW6pidSY6YWsRVzMhgSjt/N2
	z2xHnQbHpWqIoM/AqTfw5AaAg3bfAK7uGK7wB7b+jsGN+1MK2i4U8Ply/DYV5izO0cmhxQrAUyY
	Qyp4Zk/bPTRjsPc9zekCRClBLp//LclL6j1Bdwbu+Ekzu2LtvUoDPkaXu+8sOea3dxX6/U7VBeS
	9VHKxi/W9DBa+GpAzYpN+iim4mfJoSMQoRqNgvOKojSyTDxSDdV3h4NcCkcCLqUbIa7pWEjY=
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr967862eec.23.1774607091689;
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr967848eec.23.1774607091218;
        Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 03:24:35 -0700
Subject: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
In-Reply-To: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=844;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=QptwI6z3j37hX8AHtjzXh+bGzHbUl/D8vt513nvFX1k=;
 b=r80m35yXtOARStk5G+2g308fz/1+AdRshEcZ/cekacGqc2AUePxK1rINXl2oiHhdrvty46J4M
 dowv+xG3kU2CC5cVEVdoM1uw6BxsieurPoyl8GBTRI5zrBajkgpWfPw
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c65af4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vpq1ZMNoxu35JrZUYIwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX+BJ30M3+/GbY
 c+Avc4sQV4vWcL7WI3RLIYxJIuWkhyy+wTHEvGiy+z9jTBm31HpNrtRnfL6MOdzWMdSydkvLKIu
 u0Ums2qeD89NDb/vyw9Q6vCeYqIBR9BGn6m52AKITMbs9nmMRZAyoKAqnFBrt6gLAdh8EdlRXq5
 as+JL+16G4yDOjalJ+Cl0EquoqVkg9+S7Ji/TIQfnNzzr4tr+rSimiVTa7j9p3dP4U7nK1QvS0h
 TVkwaqCcjReSbCwf1ajnwIcDAdGazz2b3wbg6xZlRDksvdPTsZKjCOAok7j2Pyd9soezyAJxy/e
 5IO5t0Sw3+OUF0gcPy5R2zWIKG/18aOObGXWWQ1vsR9vGMxUNoedN0U1pKXKIFsIzJh1F2fUzqT
 RkDeKVHjiYs6q6hOEULM95G/FBB8KoRod4K5VjvGZFLzVPi1WOWqyhPNkNOTYBXYlHihp+x9ozp
 dfHSlpjfAZs1bDwc9GA==
X-Proofpoint-GUID: MuQ1ayGqmDdrwWGa0CzpAYJrIeuPA5FZ
X-Proofpoint-ORIG-GUID: MuQ1ayGqmDdrwWGa0CzpAYJrIeuPA5FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100265-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 096AC342921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Qualcomm's glymur IMEM, a block of sram which
can fall back to mmio-sram.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..bd62711dc630 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,glymur-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.43.0


