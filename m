Return-Path: <linux-arm-msm+bounces-95305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNaRNRQtqGk+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E691FFF8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2832830EE908
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF622566E9;
	Wed,  4 Mar 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC99rWbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBvmqqI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA42417D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629153; cv=none; b=mh7YtPwb+tfykeJ/m7oSZmt0D+uJ6IFtoL+gVRYXBn98alzoPdgyUyxQdBGnj1/IuqRFLwFvD38x5ZIMrfrVbZVHUm0cEcRO1IK7j6K/6vTSJ5g+ZHCWSCqheSGMrprior33D8JAQ35M8uTaIYdFT5ci9H7oePTlJpd4zdRrkFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629153; c=relaxed/simple;
	bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGxv0yk80POURypFJHh8t1/i/nf+imnpSve3um0hey4HV/8RJWL7NJFFi1dCOA4nFBmy5aKTwirUQsSXqjPft52uU4BwL7ypysUi4fG4H4Ily7Jz0ctO59/aa2ZxxdDGZwXjUriwZE/ComtPgzLYY5CnpiVjkiCM8XnEfFPRvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC99rWbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBvmqqI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C6KhM2306399
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=; b=BC99rWbC1RHWWTPw
	9sqSRX9ASnyzmLaaihIN6domAI3Nj2nX2pWbTUj1Xgp2vUvkIjnV1Ei1QyFJUToL
	40ZfC06McxI5vxYq7YJQUZ/VJBH/jY5klN950P+5B6L0EmqQg2AYo+jV6i6ftd6L
	X14RicKKjxfDyis3+xLvE9vTu6i+61MlM2uor77VXQa9rfsWxg7Sy9YlXHlyTsMf
	9Mc3SPsVyRZ3BE6oi67J1wuMcX4h/olTpQS+t+HE30npaiJB6BVWmXJQU1ZGBBxG
	+14UeRjU+TlavEVMFtvbsY77YIERN5SPU6T9EwZ6YRfpt0OT08H4TJ3d+JWM+5Ht
	y4z3AQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8t65b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so786784485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629150; x=1773233950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=YBvmqqI3LdJQBddg7jGSgwMET7kx1dOrXyHIMxSAoudoWXrajHuI78H86O7oO9yTcg
         U4XcCJpT8aGKR52ZUcUI8vfaRv2yR9WKa1IjMsZAyQELtPxLE3N1oSZtWu8U8fhXIi5Z
         TL8BlT5cLI6lOA7EuvJ0AokZMo+YDthVfGOtXSGApxHf15+5qkhVaBOdu0zJqXYrU0Mi
         YkLUsHLcy8YsLXAsn1YzUNsR03tviXpDVrEgQ4igSSx7jko1UwtcH/orhc3IXpomaiym
         8o8RtO6xQO8cEJwVhl1ZVCAr+X2gj22cvOglG+4vz9tjvH90k3UIdWd3gH38m9Z0VJFj
         majg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629150; x=1773233950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=dF/lNpBdx9pcrsDwW8XZ4QdS3ClC8dgeniAcGtsbLVf5VdDJqOL+4aQvcJrhRyGPnY
         7Uy0F1SSnP0n1QZZ2S47yzvcixgRB4reeE82CLX/vTUPsit9vJ+olcZ00elmyHWg5Xwf
         GzPY6tVCo421UYYBwEQ46PuK+OUfacIBB6twpa3WR3uiew7nfO+9Iq5M/JSQNRpe+dyP
         +4tI3OUVMwGA9ebEEpBFzGNd+hS/+U9HbvweSBFVJi8tc/YpP8xIKWfWKF8oFFeLPhfW
         3TiDh3ecIP10Ddqf1DjDpCP0cHSj9UgG+SnLYjlRSF3zVFZXbm1UA3LgJD5fwD5/6Vnb
         bwUw==
X-Gm-Message-State: AOJu0Yx0fzjUBuNrU+VO6g/7cYbm5/XCB4OVomCYBCopmiey/PQOiHop
	u17eOwgee4D8XQKbFn7OvR2PDz4pslPk+IANiLCxYSdCOCivNuWRSXWvSld+uCcqSiljVBUfUQL
	Y5TVUKY4FjCp3J+VMEKolhHHpFal3QkqtMrUEZt3pa/Ljoj2Vs7yT4ZKkS4qxCAD1G7d1
X-Gm-Gg: ATEYQzxp1mQbbuVDQAq4sTG951tJqSCs7mq9AmDQBefPZblUTW3t/j3fjOqIH/1jtQI
	6ZD2/AYSP2tGLoOrvJqI0tkoTPukh9HpfiNZ/OGYmdQ+Xu6oz96ZBPxQCBoK+aog11eUHyfpjuz
	fKCVNjcwu+YA+UKu7WgBtWaJ97pSL9uXGxZSrquK4aN9rbHyktc2njzwqb8TA3QXORbERreJArp
	6BG4qnEs6mi/mlb4KOLhM4gCbQw6+NMpN5HbA4Z83XoJZbx+fl8fg9VL7tHKZVq5EQSWjuK4XsH
	3eWUW1OYkjCgSzk90UzT3CjG+4qg8TVwqJVoNo3O17bxHsHjTg3kNNKAPWKnXVNVULmu1ktzhL6
	v+LD89kWNBUqu/Al2wbrvHc/bROVYiEmIYTylb/baINzA
X-Received: by 2002:a05:620a:4148:b0:8c0:dc64:bb9f with SMTP id af79cd13be357-8cd5aef1d04mr214755285a.18.1772629150349;
        Wed, 04 Mar 2026 04:59:10 -0800 (PST)
X-Received: by 2002:a05:620a:4148:b0:8c0:dc64:bb9f with SMTP id af79cd13be357-8cd5aef1d04mr214750985a.18.1772629149834;
        Wed, 04 Mar 2026 04:59:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:46 +0100
Subject: [PATCH v2 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-4-ea0579f62358@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyNFFGrgGGf3uysePnQDRdQF4jzYWZyeLrTH
 9JbAk3tSEuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjQAKCRDBN2bmhouD
 1xz2D/9LtoRsVFYMzBR5EeYzRWz8TwNykcr9V+b4cMz+iCNXX8zzYLiwFeSqMQKC8RCN+MsSrV7
 6O3GuJvu3InyyQ+VhEe5wWvvCll3IZMGnrtE+L+S55mS8P8nzNzeaiRC8NBG6WCvDzLI2Fd6ucH
 vpvoNlUUCQegDVyGJDVtk93tNWdOLxSTEkJYth/oXBEg/5rZE+BmBYas+qm/mixyrMYJcvkehU7
 JT7kCNQ1D22UK5yae2z9hPlSpgfw8CBYWDyykUUnQD/tSKROTo88rScDbf3JU8xJTlqXyJ+UQ4b
 Qu0gXmpOhSa/tZK3+fEperEosgfk3ypQUhq2mZK8KxuHbAs02Pu0rKrpua/giCIce4AVXQNM0iH
 f439PEwDsrHUYHqezqYdfZ1BH2WzfLeUzByLFIgMDaDh0lo1RuSIwPCoDMQfsqWF6HOZm8Oyoc6
 qBqXtUOCHqeF9nQbcDDsSzrFvWeV1l7uBkUl/4fm+0wRCxjRsFGPFjoQayWyoeD10ny6MNsPD++
 Ptp1E9BfPiVXRIVb57ac38KVDOTjpsnWdnHD+RIw9V4Y6sJHZ1Kkia9baGZ4SElA8ZMyN+3uzEs
 PLIicCFZRvjUq/3a36cbXYjzwA0oGtQaDmpIK14FVQz6hYcL59qAakmpMb6jwml0syEKI9wOAuG
 YuIBvZN6actXj5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a82c9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GoUmjBwbbK472THZ6osA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Hs6MULpdB1txNsXRVIMT0cCz02PhwTZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX0gf3u03x1zYO
 9fzqqNOYfiubne0jACQNa18QMIfUJkl4BOV6GIHI0QSKUsyHwpIagZefWuA5TvSFFfPnHC8OnWe
 GFVokVZs55KhjCT6Y7pu7uh8Jyao50FAJP+ahwFZQ2faF90j++BQeNZA38DXy03UMRF9ydahrcu
 hS1R0bRMN9pBB36tadtAM7yjCuXmesrlNm2rbNbV0SKUCqTAbM2/CREFoabz2ffZXuPj5T3cAUb
 yPN13OX3HeYiiUZi4ItgNOT34UWUGa7qFTM+2xRnPL0Mq06dj0iw9L0E7hVrFFbjVsj8nXrKMtZ
 Q+I8G4pqCT10VSei+T5cHtmXa9Rsv8tsS33+VJnO02iGaFx7RGOMA8RC4xvGvfYhweTbz/pXhrI
 BFF2GeTupzY9i9Oi7wvFfzy0rHzALynhpjM5eGYzsT9mYD6tGDxQ/CrKWXuziLovhD34Ov/TCUL
 si+499/mUi4VyqklLwA==
X-Proofpoint-GUID: Hs6MULpdB1txNsXRVIMT0cCz02PhwTZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
X-Rspamd-Queue-Id: 74E691FFF8C
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
	TAGGED_FROM(0.00)[bounces-95305-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
against SM8750 (v12.0) of mostly removing blocks:

 - INTF_3 paired with INTF_0 (no DP1),
 - Removed CTL4-5 blocks,
 - Removed VIG2-3 and DMA4-5,
 - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
 - Added HDMI interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index e29c4687c3a2..dccac525d202 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -15,6 +15,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu

-- 
2.51.0


