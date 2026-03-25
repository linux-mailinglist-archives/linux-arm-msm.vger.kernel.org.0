Return-Path: <linux-arm-msm+bounces-99874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P7iDHPew2kgugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:09:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D832574D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C175933FA710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D0B3D8914;
	Wed, 25 Mar 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7iBbXB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDafbX01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167D3D88FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441031; cv=none; b=iDIhUAe89oxidzbeef3euXfET2UQhRi8YHZQFQ/OPE8sP6/4VzvTCUC4JKJsJcyA62YHEZpm6jU9nKG/7mwqfNr+BJLn+yh0BnPOfz00YJ/2KM3/pcys4D2TFw+Eo1ggQEi1HFdHQg0GvNXwXBeFKkrv3Cl68sBjDV2QnwEiSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441031; c=relaxed/simple;
	bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6PCliz9Ij4gg2QuOnDrItjmwmUdoSopS6WWmr89JANah72sy/Z7btmViIRK7RujX1tRaLtXTGebEyO9jD9oaLHD9J8cBVcPvRKV+Xk6cbbZePbU5HDiv5skL9SPuui6mP4EGF4uWIpSmtFY4EnHhlP7s7LxmfipAbVzSK6DpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7iBbXB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDafbX01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGX3g051891
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=; b=X7iBbXB4iSmXvLLe
	VMujAx5UQUu26NMfnTh0Zla7xAYDAmq/OC94dcYG/UiJi92gURqmkV/+qb2BVBQo
	PZTPQc6YDym72ReWjkGOuwC+NLJLtp1zTM6/GrugbdpF12p2GliohN006uD/Gy4o
	GKs6Ua3KHW6u+ngCOyHv/rRdoW84soiZWqxzTi1hZ2hqwMZByfMIC/PNbRHz2jd4
	3j+ZMFN6BoPUchyTvA7djRlHGkvQEVjqYzNNSLxtA9YQp6VqhpN4H9LxwUETy4A1
	sr6vYundwKOSvjhYuXKtbPUR4V0rfO4jlpgkDvJVYBcbK7zzKr85EtgWBtl77m7s
	TKeRHA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp1ypk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso127707291cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441029; x=1775045829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=IDafbX01PhLLe6Kj7JEanjZ0/lUD9rDbyTidwrOhEOuM2zPaReoGIaxeLy9vZ7LuCL
         SLY+hQQ+txY+I3uEIfacp+nNNfMQqMyugok9xICBpaun/RWedSdcBtoEx6MycfiwA28j
         Es9omNP3EBTEHOq2hHoa1uLiM3qcW+w7T/iyFMuhM9dT3KmzlNYBr8P9ogWTdWmI0r/X
         a5gLFCLWdtcoAzqTsu9zqC4Eb1Rr2zhXb/S8pRKM989rHcc+XuY2yK2B6CkVC8vyI8O9
         31Ag2ZH0Jac30Z3ES6+/R4EgDtcU4qY1/add1OPP8iwnyACYUCfmWSAkGGgK2dWsQt7k
         IwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441029; x=1775045829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7BLAw/RmPfAo/iwjgYNldkWRcpIWvYAH7e6n55Gsx4=;
        b=UHAgb4DMcO2QS3ebRbw5VFafAQGKG+aO402Qf8xq5GY5+YiC6pPnm6qtEt0SaedLOL
         f6J5Jjzep2cTY+Y77lTQXSA1Ves4sKXE1w6Ab4HCiRe1xbNL9zeHzDj57WtQso06OPXu
         SljUz0+VvOcYKH5XhDjBdKsQihkkm+HoTkAV7AbgN4782rjNTf/3KvSmk7Jmhp4jhZGp
         nlmd4o3d6u52Fh2/+ILr0wxyiENQFkeoMaIjhp5H6Kct+W4fdPb+SIcva7FU3RU4FL7z
         eabsNkMUwnAafsqItl9QBScFRDU82vs3TWTrZ9naXqL9gAxGyTiC8OALjddF7ZuQn0r5
         dbQQ==
X-Gm-Message-State: AOJu0Yzk0+AQV9GUGwq15zahLbvh6YIcv2e2fyZ5c1IeUKSemi+f8f5b
	CtW2wcO0oPSkwtlAGNvPI7dbJk8RKNfONkl/hIAW8DaExKWz5WupM4BnDjWedv27hj+i4Ld7pDx
	UlKpuJZjBW/sFlNILOg6ZdjY5MbMZZp3lLsW+HP9RWA1sseuA0PUVAoxV5ZnYcNAm5EhU
X-Gm-Gg: ATEYQzzM5miJ74X/sG7XdPjtDfnIcvIHzFj2oi5PPE8bj3avytub72eyCTN7R6mQlYe
	EKtRy7oB4FYXVqacugJcGAGF7RKU6hKH+VDSPyH+Gdsr1j2f9TVuYmPHWzSXrb/Ii3n+Lsht75A
	Lj0K3hVY7AIwQt7S9JSv5drW6obK0Fuiy7Dq6BsqpS758gskj5zKY7Xw2P5tRUeOVwUL1+YrsQg
	UL5JVYRW4nKcUpDWG46MAfx+NIMURdLi7nD0+X5qaYwTzwEZ1nlx9HTBa5JWrADJGgW4VFNWE0F
	COE4HidS7HyQHSuBjrYMT92zpVlay3A5ZhcJCz7bmq3P6DNsPp8eoxGsTSnBmysxnDovnnDtU0w
	dUB+kJMI6uKcwAPJoWD81/fCDuKmliA+8R22unGWVf4ve
X-Received: by 2002:ac8:7402:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b80efe33dmr31549501cf.70.1774441028637;
        Wed, 25 Mar 2026 05:17:08 -0700 (PDT)
X-Received: by 2002:ac8:7402:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b80efe33dmr31548981cf.70.1774441028038;
        Wed, 25 Mar 2026 05:17:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:45 +0100
Subject: [PATCH v3 4/8] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-4-dc2b2f0c74a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcweX3+xVT2T3dVpuYVKey0ZWpqhWMQNP+vmeo0s1nY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9IyV+PYXVL8EBB0Cu2p+oc+uWpMYSdHsmu9o
 R4dFQkLoCWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMgAKCRDBN2bmhouD
 1yoRD/96S6BZthEozMJyE2gdq+wvOCZf5zfzRlQUwhzWkYiuSLauvhm4ChuA/XJ7ifv2/IJT8l3
 fu/sMfHS8zpHMiXfNoA6ysYh39epnVGPznC3UaonCkNjpaB+HfBTXuik/dp93+hnIBNOXRAlPrk
 jQesbEjES8gE3w92EsCApI29eKvbwP53tHbJF2h8PL/n7CDRnAsJ/b40w4ezp4niZRM0p0stSsu
 JosBBBV3v+c8TPpv+B5CxjqV729JIjOOUagtGrNY6LGHFlkAdrnTtXvTOLaInAW0PqCNUsg/Af1
 LPVTqgfZjo8UAZYqlx6hb+H8+2qQ6zBc9IMJX4cAOXvJzKtb+hMiJRXcqyfX3dG6SLSV5SDvoh+
 JAYNq5rgwUzeqtF8MFfNydkVNAiHpk+EP41iKQYHbNospGhjlmAFw1MPTW0REbi5yunxesn5H8d
 Jqtz4g73qPJv4opiWebLeG1P3uT2IgFStG8Z1AbIAz25Vlt0r0dg/+q6Lm/xyZnmBA7S0ikIFVY
 mXKA/S8/6Dvw5RqH23khPhpdByK5vNPi39ll3M+DjuK8wdPteOWV3ilhXAvPnlypL8i05ByE2Qi
 G38oAc2G8qgU/VgQuWJ1JdpjLOx2+DygSn0BCtdZX4tPNdQALdsPY9hYM3L0YvfKtanZskDRtqW
 7UwChX0VwbzuBjw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 4bgr_aw5dGtooNED9v4_RIxHEz6d214z
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3d245 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GoUmjBwbbK472THZ6osA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4bgr_aw5dGtooNED9v4_RIxHEz6d214z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfXxFN0VBvRo8Il
 oj38NlVl67pgnhwvTfrkXwvXRlg1nOr09Z/WL+vsKYMtiIW22NXCwPS3DdFCqI5z8GMZ7FUsXNV
 DtyF/x0aYFcC+jc9Ow81kcaNmKwS5p9fbH63Wd02jPsN2qSe0ED6zyK+uePfa6izA7IQOIdMQsO
 Pd9evjO62XiRoLWYAuGilBZ8zWxLRQsSwOBBHVYGJhQ84uCe/Pogir9wqNEctm2TnLe3MbwqYEI
 RiOCoRsZoiHxK2999LkQlvCvZcUONz7GKn61ypWbTDolNhrQ2/DVTMm1PqXk5PgNyL0pUkb4xW7
 P4LRg3/tGHfynWpwYKYYFO9KZfjl2SrDtzQ4zQycQ71SbUTAHVGoJSR8PrlXrxFlQmWsPIOhZJA
 QXcMoCivHb1lNhob/iVV03A8+cqEIzWXmNdC+WbUcCbBdj9vmdT7DneQsHcIZBHvDhoPTLCtuEz
 +1pVL+1J++YMkjMe9bQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99874-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 8B0D832574D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


