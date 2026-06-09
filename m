Return-Path: <linux-arm-msm+bounces-112096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AS33EK3iJ2oe4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:53:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AD65E927
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:53:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Htq4LEXK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hTQCjrnO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112096-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112096-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E8DB3022F61
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C9D3AB26D;
	Tue,  9 Jun 2026 09:46:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907935F19A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:46:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998402; cv=none; b=LtNR6ahfhyZUDQbihFU4Tts7Q9NilKqkHTXI0Xske48JSdwHywPSfaUJUV/Xjm41IfKNvmCqS0TtW1wOP32Wo5Pub19mLfSJN+c395tZQofkXVsmaTAhIMfzm6D1pVV3FJrplp87T6HKQeDlHTYBoLUBZsN2tM2i3itwwAbx3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998402; c=relaxed/simple;
	bh=Be/+PZJfQrdccu2rFfueIgde382kPm+vs/NQWA3++Hw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vw9qKRkC+nUutq2MpNehyBxOdy0qHZM4GDZ7MZrAVTg3blixDgPRCW9s89jAGXMK3o45XbeovBJRX5a/LmmIgSfuJYon5Lukr4I48s3FAvV2n9O9cHNYxlrGdO2QdF2uoXgJtiVM2R6+XiJjfW/t4UhKg12o193IVEzp4XRWnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Htq4LEXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTQCjrnO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rdmh1958611
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=41ORP2MeswFXH5m5KFacwW
	q0dcdcSXNSZxua2whrjlA=; b=Htq4LEXKMmyVYnH528VzMdZ+JVZhrlrxAhZJp+
	CQSEEp3FJX/DXqOS/cM31xpUk4DYKq6DDDNTmH0CELTKcwHoVzg16l5ATrarYdxB
	HahCjfgfAWPslgGN0moX+ozbD9o+VJq+iRoSWQCbZDTYnCfKIeNBphwfhxZYX2L9
	X5jBYWgiDY0KL7nIvu1SfKCri/LNg7k+IXR/ni7hWz/ChyQkRV9TYpkAyHX5ssZb
	R9LwONB2a/b6cUX7EEApcxFoV+cmux1OvrWs+caiL/4HYvooKNM4yTjoPfYVvdC2
	kU//oS/mqM0OlAJUvoAYrv9TVwYQc6k7rg9YjxyLkeBQVITA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8ven-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:46:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cce1cc8cb2so125725386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998399; x=1781603199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41ORP2MeswFXH5m5KFacwWq0dcdcSXNSZxua2whrjlA=;
        b=hTQCjrnO/B01jhPWIADdix9+h2+1NOQKB2WIt0WbfgS4i4ZI7eS3FsL97RQCMBW6jJ
         pviDGtLEq/WBH8Peki7y3xQY10qEd5cd0CETJ9Q4RnLF/WukJvT1RdKv1XdlTMF0QWTB
         l5Nl3vmfyidwhhw5viGQ7R6o8uCBpMQypRUDyw61CewxaZOVIQJMbCjYvnj09ZkXR+bl
         lR5BVXi269I+U5YDDdGUOS9xbMq3huf8XjqtwcIyh0evYhFWmzcJm6pSNTmBEOkpiLpB
         J4Gt76ChGRslKdFgVzOgtNVlSrNpeqckSUThiY7bd5hKwp/3fqKkYMYeyi5nAe70AcG7
         XCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998399; x=1781603199;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41ORP2MeswFXH5m5KFacwWq0dcdcSXNSZxua2whrjlA=;
        b=oDUyi/INUXp8AZbr4Cm5v3hO8FUXBWzlEtLJbmY8TwJ7/BqzOre3sZIP8CTIqcJCC6
         lNGSiK8vAhjUSx5096wD/jxRuWE62m32LEV6fCjir7M/R/ZUd56u0SDbXkXFAf+hwWAI
         9BNXg2kpfeJXzutZqt7TpKKwjLKi01adP7+nNgBzFqnV1po55Vj1G+tczteSR8BcZqqK
         dbLl8r2vHUYQFngtPSpHNryL9C+O9tkRxRRCfXKQeB7XgJXk+etbwE81LttKcZrb5HrR
         JqJJMTp4x3CVWRNOnNULojGn2eknDXTkZ/E6Dhh/T8tUl1kHItpA8Tbxq9OZpuf9drMT
         DF2A==
X-Gm-Message-State: AOJu0YyA+/QTN5gE/glIR4zg1AUEOooQ0l+3dPm248lY5jE5B5P0KVFG
	gi0JMWbJVxuTncIwjpmtKeKmrj+CCuj+b6SqPgQqlFii5KyNw8k5eZiNVmo2AuLC8Dpc11PMPO9
	fBNjZicY9WdkJiq7fZDHrg6/x2ixrnMvlP2hWZuMaSItXJ9b7PsLEo8yk9aZF/eYyWdc1
X-Gm-Gg: Acq92OE5xuC0Bdhg9jjvF8BcXSpHQOwin4xYSabkYD5ThvQWzeaeaSgDL0p8jp30saZ
	BzWybQGZF4dgrtuiTwK2nEBZ4ncTzMwOovmBSletuyNO24Ch4Qe/Q5eknKMytsLsatmYp7WqVeL
	yl4xJGMTluy5DgPHgQMFHv764eCV45K5rulyMcOdZQGfqgSKZwkimLlshWs+K6fV6MLGjJNqm3V
	TL77xLuAsYZUlImbTVHkAFIryYVSi2Hi1oUG/d5s/cE6UpaqfcCOst+lUz8azP8iduFh34mPr96
	fhNNE9BqZFs1oc2RsUK21qOqsoFcTnowU5XjM4lr6rh47c/SU82CIbPNh2gqfKvu54U9cIOzhu8
	whGyZwDGVRsI1icswKBJI8xrDuAaL2hpKj2BCQhHICv2IAqe4daZPnlmIOaCm3EqjiClfCrCQ81
	HZja2GkgnjbPX746Kf5g==
X-Received: by 2002:a05:620a:1794:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-915e82543f5mr233083685a.20.1780998398879;
        Tue, 09 Jun 2026 02:46:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1794:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-915e82543f5mr233079885a.20.1780998398298;
        Tue, 09 Jun 2026 02:46:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:46:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v7 00/15] drm/msm/dp: Prerequisite cleanup for upcoming MST
 support
Date: Tue, 09 Jun 2026 17:46:22 +0800
Message-Id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7gJ2oC/23OwYrDIBAG4FcJnteioxm1p77HshRjxq3QJK2mo
 UvJu69ND8tCLwP/wHzzP1ihnKiwffNgmZZU0jTWYD4aFk5+/Cae+poZCEDRguX95TiUOZzJjzw
 KpwN5GzxoVi8umWK6b9rn1ytnut4qOr+WrPOFeJiGIc37hkxvhCCpndKENlpUyoYWpQgRPBk0z
 naIij2tUyrzlH+2oku7YW87LS0X3DsAGWSUUXWHqZTd9ebPz7e7OjZuwT8CBfwnsBIQpIlRC+8
 6eEOs6/oLW/VZADwBAAA=
X-Change-ID: 20260528-dp_mstclean-f094cea8ca24
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998392; l=3468;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Be/+PZJfQrdccu2rFfueIgde382kPm+vs/NQWA3++Hw=;
 b=yVfbiBr6+L9sSo2yi7XTtFRsXQuPIPyYRDyYy1ANqCEi31RwGrI3hC70IBjGklX5BMjQ3HOEc
 Fkr/Clx8tkTCReYi1JNpS5pWX28Nqrg4YhOkSqxCsQak0C83/I8U4qi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: j-Xs8n5oW6O7J6Hh_AoJr6Js2AKcrV3i
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e0ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vykuwZLdp5Yjkddl-pAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: j-Xs8n5oW6O7J6Hh_AoJr6Js2AKcrV3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX+vWSkUWwfiqf
 yDY8USQEPCMlZ97oQ7ZM2LGCkvBXF7fkDyg4+W4HWtcnSJsNH36hyXwjR8ZGMn+sPs/SYOqHZiD
 av371+LR+Ubdl74lonViKwAiHQofgOFCzRPNolscxA3k8yxywG4gNWLn99XhaL2gZfk2vlsrXCh
 9BbURe7Y7Cr6L6Ao+iY2pWqqLFyPjy/hqnShPPUu8XNqMKrHBEyJv3xuF2c0UQjgTiF0qWmXuNh
 mMwqdS6jzMQpjKhFPkjVK64YwuMobaA1xX+qZSIYDR3CzutHXoZxac4IwjjX4TyREep1JNrGse7
 yL+EXdn6wmfkFHC5muYK12StZ+uTk9NriOYW80AWMd3293jHsOsLrRlNYct5iSO/UlH/wlCUwlA
 /RadC0iZEk7uSHchugcriTYv9wts4WKR4I6XU/bESGUjhfMzpcCtPS16HKxyZpSdaa0bHPcPuOr
 HoHuVT4unx29OCfsGwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112096-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E9AD65E927

This series is the SST-only prerequisite portion of the MSM DP MST
work. It refactors the existing DP code paths so that MST can
plug in cleanly in a follow-up series, without bundling the cleanup
with MST functionality in the same submission.

SST behaviour is preserved end-to-end; no new functionality is added
here. The intent is to land these refactors first to keep the
follow-up MST series focused, smaller, and easier to review.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v7:
- patch 7: Use WARN_ON_ONCE() when pixel clock is already on. [Konrad]  
- Link to v6: https://lore.kernel.org/r/20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com

Changes in v6:
- patch 4: fixed the RMW comments. [Dmitry]
- patch 10: do not rename the existing struct. [Dmitry]
- Link to v5: https://lore.kernel.org/r/20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com

Changes in v5:
- Split out from v4: only the SST prerequisite cleanup (patches 1-15)
  is sent here; the MST implementation will follow on top.
- Rebased onto linux-next-20260527; adapted bridge callbacks to the
  new drm_atomic_commit* API.
- patch 3: added Suggested-by: Dmitry Baryshkov.
- patch 4: fixed "splite" typo, reworded body, added RMW comment
  covering both SST and MST paths. [Dmitry]
- patch 10: drop cached panel from msm_dp_ctrl_private; pass panel
  explicitly to all stream-related dp_ctrl APIs. [Dmitry]
- patch 13/14: introduce bridge wrappers and atomic_prepare with
  drm_atomic_commit* from the start to preserve bisectability.
- patch 15: fixed pass panel inside the func. [Dmitry]
- Link to v4: https://lore.kernel.org/all/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com/

---
Abhinav Kumar (6):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use
      drm/msm/dp: separate dp_display_prepare() into its own API

Yongxing Mou (9):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 382 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 273 +++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |   8 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  43 +++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
 drivers/gpu/drm/msm/dp/dp_panel.c   |  75 ++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
 8 files changed, 451 insertions(+), 389 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-dp_mstclean-f094cea8ca24

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


