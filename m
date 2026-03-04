Return-Path: <linux-arm-msm+bounces-95304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F0NM/ssqGk+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:00:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39E1FFF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A0A230BF9A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBEC25B2F4;
	Wed,  4 Mar 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aB1i0GwR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwO1OA76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DC2566E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629151; cv=none; b=O7Q+avQO6Bf8ybRloaivd0hh0XivOPoaOoSEWgy0LW/733GCr+jLg7FksYynYZe9rxsh32/Y3JzCW3FH9VHKA+cayh83JzZ+i8Ntjd02WR6pCl0uU/OZof1N8dNanFaFIzOB1moe9JfYDCkY6faRNR4RndjkwKai+1IXE0Zo7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629151; c=relaxed/simple;
	bh=l29Ss9SJIhO4qjfujBR0enQVoRBoec2OVkwK4jqjjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9llVjlGKmYkqFuzp6LQ+49DlI8N1EgqSl5p1m2Cw+y3OMl93i5eWI9MwDhaooYqIYfJr88AgAoT2KyAzAcWqX5Ya0BzZcfOZ/Yxs5z6jKJJdDQXW1e3c4b4iwyBxQSUg/JcszWsSdTRgs3RN+YwdizrpukhS5z9v3iDKPhn3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aB1i0GwR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwO1OA76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D7V11203235
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=; b=aB1i0GwRvylOjyQH
	weLQJGwIMkb7W+fosiCXxs416UaQ48PerFCmqIMWlSBa0axDBjuwT+8386ukASPw
	ky1XI3Ndsv6UzjV0ulyjrnp4cMqeHDba19HVcJghHVPWFbNtYVWvnjE6l7KzjbM7
	eUA2b8AbqDflI/y6PDxm0DZD+/4/2eeJdRbuOT6vZd3p//AablFKguxes+AzBakB
	BtKCZaL5UXjHH5829aCitANHvFtOmDMzDYEgpJq7tt2QVZosIi4WEupMR8CCLaln
	/y72ontcJVP3rE2NqBHczV5NaffRmutbSo/9bKxC1gyPXOpqGISJkhk7AM0udNz/
	/HCQ6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c196x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a116bf0f8so90010016d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629148; x=1773233948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=;
        b=fwO1OA76Yybb4r4cg9TIS784o4kXQT7uWYzRd3zYBdQReGkDYzgaEMWwb9hgZx8FFp
         B46WTUlXkb43CEpVwTRBn5Gxq1zLqFij82jn7FjIUO7FF5T7+ToQDTvKpfgVzNIUPoxg
         2+lztWgvKcKapla4fpgiGzF65tBgXYe/Gt5ipjB/3lBvIfPzAivyBXSm7EmK9TcUN7LK
         6GjdIHqskLSUlPftM3mzJUuIVVASDOAk+x6xcJpybcal91EknKPz1oz4CiCaW4A8hSRX
         92LEYLpjM9nZbbaeqHKYWaEOfAcwsWE1s5AEX6DheFu0BRZ9hnD5Tn5uiuWSw89ilEw/
         ir0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629148; x=1773233948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJT/jlt6WGpWPuKdsNY86PLp9xOP/TfxzIK7ooP+DVY=;
        b=nuo+zcmxluJulm8Xgc5nPl0dt3Xw5y5K7z/XWdsbd/fvF9Z2Ig6A5o0AlTVLm3+L5C
         80dcTlH6HirEco1wPTE7uRiB8NURe2LaLAtfMPDf4oYRbli/kz8ZVw0TVpYM6iSpXABu
         BE8jgIe3n+Suqbb51gP5HyXEQEpCqi8eOkVIFexLc/prKbTbrmSgrsGpyjEHkTrDnEbA
         bj/jPoJcjHecdxShYuSt1JKA/12LjWoH9jpambWyFz5rQj+61zzb2qz+Na9yMK8kfeTk
         l4wFF17DORJsfpADY5aUSp2ZAnVThtd1CF/Rics7CNSI6ZIvTk+N437RnE5fj7Ozi/QP
         0sug==
X-Gm-Message-State: AOJu0YwNNN8nuMDMg2/3EwwzDMtzu/LT94QfrRLZNjK5AZQD/SYDh6a0
	bxjQRG8F4NwxGYDoDBBS3QK5cXxDmQ5UxtGGsW/+XemD/X8pR8+duDJIahRsucoJsWyt1WLJHUg
	Z6OMf06Rtbv455zICvxgxg8gmeIalVdlUa/mGQvoletV1RQjdGaGEHzJJxJhDiBMIiJBW
X-Gm-Gg: ATEYQzzGMnYAC4L+XE0ehy3xo85GCEolZdSByYaybgHEf10Pmx82Cl7gTFSVExJcHhU
	FIMccoPRwhaufrtdK+eU2N1RNsA4T6bE6HKkqDvbf/RD2xKEVGue4bGyFwK272THH0RqS8btyaQ
	sGdcyGe027cipncyTUOoMBOPA0zQhbm3yGFpRLX/jkNB9yhemOhKr8+/geidiUpGJ385rc2aFxL
	ZkY1MblnESuzrY5tS/eesPR6bqS7w6mzgooKnPNGXXipaG0a+fXW5h1rQIvaI4rtve/y1q++aoP
	/ttljsHqQq/3bJtjoCerQUiCgv6o5FslJXpykdaS3X5M5dIfyn/0mYFsyiBExVIOMiDgyhx24BA
	e3zHcMDfx5nQxnVJkxym1KFM0dsuXltTGY6tCVu8aH6wo
X-Received: by 2002:a05:620a:29c5:b0:8c7:1af5:4759 with SMTP id af79cd13be357-8cd5aebfc4emr212739885a.4.1772629147909;
        Wed, 04 Mar 2026 04:59:07 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8c7:1af5:4759 with SMTP id af79cd13be357-8cd5aebfc4emr212736085a.4.1772629147439;
        Wed, 04 Mar 2026 04:59:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:45 +0100
Subject: [PATCH v2 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-3-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l29Ss9SJIhO4qjfujBR0enQVoRBoec2OVkwK4jqjjs4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyMxtGH4UqF3t0s5/Jx4pXDebCtGrpYwQFAf
 aaOr/FlidGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjAAKCRDBN2bmhouD
 18fLD/9XlqO4sVbDgv/pz42VJ+ny4JFHmqR+aXF4szcl351j6DFra0EbKi2qGbpyKBmalzbThZa
 4TkWyPRH//1hejiMruNUuic/e+IBuQmBRvFiU+QddlHGV+awU4NzxjvgkawUdnlQsAC1znlA+XA
 c4cU0JY+dps3xQJ2wgYcJ7qYBF/sRj1t0sXkLTjiaS/y9xLO03aB0dj5twPPioz2Ox0mmBA6630
 I/k54GFsBoIPB8BRU+YzcK8l0zqub05ciak3Jn4XnK2AqAxOvWTnCf3z7osp6tAVTC0tczqrt7B
 BYcleSdkp1HWNMH1bz0ytETN9p3KQA0dzZX/LzxEMXhTB2okPlKEStmg3SxzbXD0h5HTd3ErX5r
 FsjFjWkG//GZbrnmrpqRzww+xg8urJpLPVigmDVywB21lqcy5XcAQ0r2J5T2vHnBhB4fNiP7D+V
 Xoxi1YYfURP4nCqG3ZZ8keC6mmhm06CPzpw1WgXrg9PY1y0iRUsIjprN+QW6SKQz40TPj4yHy+O
 /0hdStKy0MgRpIaHwhT+msFpIChO1b6c4b3iLJIOxShB5R2BazEfL384WYgBIvuqPOEvjmF3Yts
 geB5YJysXDj2JaqqnGvrXjmwNhHcOvTzfA9Xqs6XWGtqu5z2a3FlIXBIjRgs5ogzuTTDT99w+Ph
 5dBnkNgPDessr9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX+f1TGKSznyui
 oZfyu9y1OxPe/gQVaI/hwCbjtTTBPv/VWePWAMuRGIrN4QtnjHkf1qdn6Mo5hKH2Qy8AaH2m7iU
 1TNEjK19dl4p5fDf57+U0VwRxA3BnygsGMvuoXxlhMp0XHE759KlIVerOADv8uG5pwN622NTryh
 REf23rRtRXNYC8ub3dQsNAp439RGhTaPnRiNEBSDurg4AsYH5HBWY680h6Q4L0aQnACfqwoPj+C
 ZqyKMGYNxqolg6u81pUrD1jjmicFcz6Lq3x5hPdNskQ3n301GieYqMDmFUvKz1N6xM2Zf+KZx2z
 hWRY65YVmjg2CbtsB1XeRQLj3tXVlwmPIAfp8R/dWPCoBl2Bk1MD7y+3bsASEobjzdAUzF9nNKh
 p75sL3EBT22m+xytQzmrW6LmGSCSx1fnItJgfGP/tPRuvHS7BApJC85NTMQ6Lf9R9+Jr4nR2rsK
 stiXVZlfAFlatXiWghA==
X-Proofpoint-GUID: 8BSYdGrCCw2hLvUJ5SjzK4vgaKlnJWj0
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a82c9c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o3bpWG-eKcXMc0DUatEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 8BSYdGrCCw2hLvUJ5SjzK4vgaKlnJWj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
X-Rspamd-Queue-Id: 3C39E1FFF7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95304-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb08..49b8b6db45f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -51,6 +51,10 @@ properties:
               - qcom,qcs8300-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,eliza-dsi-ctrl
+          - const: qcom,sm8750-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible

-- 
2.51.0


