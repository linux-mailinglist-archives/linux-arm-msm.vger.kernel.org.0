Return-Path: <linux-arm-msm+bounces-99872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D6PD9Haw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:53:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849633253A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62AC631219D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D913D6467;
	Wed, 25 Mar 2026 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPDNDY2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFpUM4qY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A73D1CC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441026; cv=none; b=i6t/mJ1c/pt6zNRpGhdGKkR6q/u+qcpKecdfThtQ6qJ2olY+BbOT1hsqeZ1Sdze8PIwqQrh7weJv1nrpYsLtZjN4yPUn8rfQTr2EkdkuMPT6gyEcLsuW+72wEu5mxHH/+b+LQvkrFISs/LQ0ASn077/jhaTnZfqWSsMgVD2jIak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441026; c=relaxed/simple;
	bh=T8zgB8+aRfT+5AeJiTxBNx19VfBz7bFS9oT00XLMGD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdwUkIHRlbfp69IER8+F9ZfYYby1PWKqUAmp8SrC/6g5KqPLpYs8Qwbq1ceeo5vKihI//cQVfO6b87nOcuipzGAioa8QZ6UQUhJbbjFxdKoN9RCl0Aaz1C2Yxn3wnFVMSiGO0Lr32+2sUZTLOGBv39ZMTjcHPcEhK2tqfU63tcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPDNDY2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFpUM4qY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGWv4051645
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=; b=XPDNDY2dWpDUBfOO
	CTJZ443m4DJBldJ9cqSdcPppx2b/MYe1HBYfNb5fZQDkX7vuqxcdr0zkc90U64ZB
	kYjh85kHdEE3QCGPj2bUT+ZdSXcwhSkDZz41MqDNOccTg79nm0muMGnsYTyfLIYc
	nyzOUtv8AqpwVC7g2j/sqF1mNKNT9D1Z/+vDz4yA4LeSRFc92dxXOV5x/pb7nxrV
	rBf8ox+jpN+lgA1ggUfk8YxfeayX8O8uKcCmczvqp44jZJamghOC/i1VkVv3QzJu
	PiUbWm5Y1kPNhWgyxGoZ6DRpJxNcH0kQjj90Z+WFpnkQ3yiOc7Hk8F4CLFW8jCp4
	8EJNYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1yp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso28171151cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441023; x=1775045823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=;
        b=YFpUM4qYldqTpiXgfER7ZApBIJ75VqryurtDcyUeEZtmenzhV2jvu8wvM4OH1tSeVh
         1r8BxOpXFrNdhsyT2AVwxLM10ijAiRA6NpJKJkqFSRNscgA1DH9jIB0hb+ADzD1Bdu69
         Zh2+uw+lMHAjn6cORHXfxBIOeCp+4XpWs/QpssbfiI0fkTsSnHCIXATZRfhHZ68L0tFH
         V3VfL6weTpEkU6HZRyo0WHoWQ+RUvtJPxhOg7nv3FO5VAh7S4vrMYypZX/uXEZ4sHAzZ
         UXHQaNC3FZsDRTJlnfkxVUUYbVZMwO959XzkJIqa3zeOAuQ4UhGFaXG0rVvX/Tic0r8A
         9fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441023; x=1775045823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/EytBvPv5krLcE3pGnumr6rWcvd414N87RjUetZm0M=;
        b=eFBvt8pcnr/+xY+0IjTrTzbm4nSVps1aO9SF4Drt/HXvlnx9kyuZzvLSSURGqLIegM
         y3bS0c1WPVZnjSsmuzFf6nGAY4HLbgRnzWwlT+9enmGcarrh8rp8Gb4EU1YPOurBnh8V
         +23VqKXeLb6ovj9zyvEyYpITthsCl6XqVZhzLXA4XozYA74GIUNEDtsO+JKA1eNKIvDa
         JHZc3wEILHL5LM4GVKL5LVCiD3rCNsjgXJ5H+VUzkg+kjUQbmBCkUP1hQkwEOx16yqPI
         5RKUnRJ+0W+LU2FlwMl8BuvNC48k2Skf3Pj0pyXm2cqMD8JKzQ+B5WUFqykfRYHdIMNX
         I/Yg==
X-Gm-Message-State: AOJu0YxS6QO+N3x6BNzxOaSYPfjhnqGY+hgchnnPzRrOwKJ/FhLLEx9i
	C5IFFg8PrKpn33K8SxgH3i2eVcDMVj8h7ghJohkI2KK5k79oYl5lYkLpX2HN17Sv8EuB37WB1/l
	WEc72lgtXjWJ+RQ50x1no9JYOBarfNpo8rSyq1jg7vsxh8aseCc+SgciHV/Goma9EQG3y
X-Gm-Gg: ATEYQzy7ZO8syex0Stw9Uatk1B6doxSQQcHa4b2Pmlv2hEPlQVQxbVgK4XX7NfrYzYN
	NHZ97bSlZIo9H0jh64o5fa8Dy432nVXnUgfHgkhPcAv+5Kdd16TlCOz7LupEz4FyoZaJHw71xB2
	64sZGC/jhNyqdtEV4qIgcdsn6ciOEgBKakY+fh5ZjSGp9lPt3OGD3AEBOYxODo6BwFescIjb07R
	pPiIQUHesIYvPDc8Cf4ZRy+uMsIaqcfNt8YTZ+y2Rv8YUefRAY9jZCU9NM26ginqct+EST6rNkF
	LI9ydQW1c1IM4fMVYIjibiy83htNhY7EMmKCRWnE0MhZ4+7WgxQdn5PZIDJmX5f5vPzkEyS1Ive
	6LHp0u7wk40QpneUgB+4Ij60yVy1laaugn0IIuMtJzhf/
X-Received: by 2002:a05:622a:1899:b0:50b:3e4d:7feb with SMTP id d75a77b69052e-50b80e8e3ccmr44316751cf.53.1774441023347;
        Wed, 25 Mar 2026 05:17:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1899:b0:50b:3e4d:7feb with SMTP id d75a77b69052e-50b80e8e3ccmr44315921cf.53.1774441022655;
        Wed, 25 Mar 2026 05:17:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:43 +0100
Subject: [PATCH v3 2/8] dt-bindings: display/msm: dsi-phy-7nm: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-2-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T8zgB8+aRfT+5AeJiTxBNx19VfBz7bFS9oT00XLMGD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9IwWzQn35Ru2xnyoNqStmOhgmM+uhRnVQTkA
 3UTeAn5Ox+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMAAKCRDBN2bmhouD
 156ND/4tKyi0MMARxBprR3Uf6toY6PWWBWH6Sj2kk3iFW89xaIZt8YdR9c4Ko3gq3QyT1FiLEqA
 LKLOC0a91JCp05gplmeRCcTFDbpwFA2qAZJCgke37C+LRT9EK0meJtYyPJT9wmcEs6I71/mgY8z
 dYB11FB4W7H3GKCpjeoecYVqMOI8n4zD+Fl8a+JKPQNi85ZfuAlBU0GZsH97TGorRoLpd3y3PX8
 YxajvWUWL32WBDr3pgBoB+bf2OpCgNABajMhssAmYErh9JNQ+gNxxMw5cdfavXqGfFyHuidBnrz
 67tk45g4bh+hzP5XYwLLEqmzuXiQA6WbCAZsDBzLTxQYp9r9qUdrdElbcxK43QQ4HBPEXbJYr2d
 +6WHX78xHGWQK2tGoi4Ws+7RYMoZ4K9aidAKRquZ7zohLGqJmuAfafk9dUMh1ERutMJdAM8pkGD
 taBq4lfsdjxrhbNa8KrJ1iFnle9AitNLcjUeTxW5pR8+zX6VgTCvuto0C1RvSVTKXS16NF6R2oa
 O9tL2+yOWgJr3BDxD/jmUSCYySW7LE8IGDKHEb5lMu5sEgacMQJgGea+eX8MZ+NwE8gk8qOGQuZ
 9Qr8f3aE/A87CK/n8SHy+CpFvgBo6iGgJQNpGzI6tSFpJCelItUZGcuuP9dymWfjMJTcvqIULWD
 s5kQkZz+d7zK/Iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ynJNSFdQxunY-GrkmwU4MFK6c1qhnz5p
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3d240 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ghL60u8iUD4uIiEFN3gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ynJNSFdQxunY-GrkmwU4MFK6c1qhnz5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfXzpYXLz4R8NCW
 kr87YNEVgi42/aUlcYgFP8QX+y8r70t6/WCZSwLqIiV5vo4gLTKUtm+rRgZ1oZjqrD+jmrnxn6S
 wr3VQ04/TMqAktgyfcFkG9IqexwjzHZmsLimjw/ULTOtfz1lYPGJjR8hg9nlt/TGBZMRd1faqeb
 fQeeaJjfYFuAE2Qin093ZkGwCYB/Gbd9InMqZz+imXCX7XGky3OerSKQBWt96fcvIrkFTbitOc5
 9uY2lny0cIRih4BpFTq5HnyZ/e0UabNlyHk0JsnG6i9f/rfLMzxPc9FtKrGx+JLk697LKq1eeYx
 edXcgxOw+jK8E9QKVj1TUAVeOlbk8x4IwEXvhVui93U+1bKK0Rt+eEHaRot1/VB+mdJAkMdnJnQ
 5PUufTxJmgxvY/pV4sKdvyFGGNZ4eGS+DBzOQdkBxSo+uggW7zgnDlUONCn3KF0evEShfKHQfyE
 BIi6iBwLy6Ugr4MP0dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99872-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 849633253A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DSI PHY 4nm v5.2.4 for the Qualcomm Eliza SoC, fully compatible with
SM8650.  Note that this DSI PHY, unlike the Eliza MDSS DSI, is not
compatible with SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf43..3ce8a9ff4555 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8550-dsi-phy-4nm
               - qcom,sm8650-dsi-phy-4nm
               - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,eliza-dsi-phy-4nm
+          - const: qcom,sm8650-dsi-phy-4nm
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm

-- 
2.51.0


