Return-Path: <linux-arm-msm+bounces-111154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PqQ6IB8yIWrcAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:06:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1263DD63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SCT9Mfkb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c+Ap7kjn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0E2330420D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C7C3859CB;
	Thu,  4 Jun 2026 08:00:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8703859FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:00:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560055; cv=none; b=opTVPra1OtXYGrjax6hgAwWNJ+6i6WefT/fzUdOsQW5ZURK+5NxN9ncZK782vzp4UBxmnpr/8esR7mO8emGCyf7sjWmMy/8Ng/4Wyc5X74OA4c2IsXin+5HIgffAKl7zlfrHYpSaliDg0gms2NrY2xnCeBDJq1x4QFIDBeTnavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560055; c=relaxed/simple;
	bh=EiE+VHHefro8OiBitmnzA5TNiZ3gaXbD8UoLrYr6BAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKo5DJXDQoEH49rcS7rLsZkzWORb4JXchd4Hp4VZpwOan/IozNcwZjpFFENgfkKpaQwmFIaEIRUJzK5YhJt89s5K5Fd+aFKAxnAx0rqpd0MY2QNXoerYE16g3GIiu26Tno4U9udY0QUJmobaClBknC6qXGsHoCHm0cMwmu+kW7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCT9Mfkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+Ap7kjn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546mrV91476762
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAimtXJVctZnie/d4g9aAMYxEUy1h1YFWYvsr9dpqmk=; b=SCT9Mfkb7VuQzVvg
	wa8mWvQC/pXNJaLBeIafSRD68+pMQrJwnRv/mFk+ucAsMXipYM5zHCmhYU0vmLFE
	4Y5M3t739uiR+TnNOkPT5HgkEsnGB/lJZtyN5C5tkohSoLZthQvI3j22uOxiiENx
	XQ1mCKCDbIYr9MuQaT22JMq5U5Yj40bVz0KUm5a/F+V0dMXFhrmUuwvaLb5DuPPo
	bGEasebWW9mhlqmV18VcF+g2tZsiEI3ccRrRI4ldrB5/IKDIT7MASazpYz8YBMGQ
	Am6BD6MztE4/iawqcqqdN7blpz3KwGCUNyquZipKQvib4GF35JzQfjro8P3hsWyh
	VuK4sw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nunwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:00:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0d0516ad7so5710685ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560053; x=1781164853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAimtXJVctZnie/d4g9aAMYxEUy1h1YFWYvsr9dpqmk=;
        b=c+Ap7kjnlOs18xGttJUnzlSpQJJzCdDcNQY7Zfx+0XlfZtE4swtFxldP1wk0p/zX5u
         8+zdr1S9L4f68fptquqF4E2COlZnBj5LcwFKp5dz01jjDcbR6E3/z4kzRItzSQpI8A0N
         d5x3d1HR344F/Ip1ZBckWqVWfoCVfM04n63mpCDyZYmEhwASOr3/EEXuvEydt0KOUoqb
         4T8Xr708SaY4iCSbGJeFFkkVJMB/JYj6NhPJzCkW81fS0GPFzMYocF9CmutoVA32VDe/
         +RAI2n3vrOoKBcQQALO2G7c9TsMJVjgwGQVAV+MPHRipW579SomliqMByLoBv1b+P35j
         YTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560053; x=1781164853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAimtXJVctZnie/d4g9aAMYxEUy1h1YFWYvsr9dpqmk=;
        b=GJ7vxkNZBdPYx6VDoUpYZfPCgZzyUsxVrg7k/dDWrLkuZ2ftq7IOHlJAxh0SBOK0fj
         YA5waDtKNwrHaU/qTkPrvYpNNfQwxox+1upOjJD6m3VyxzHV8P2BwWfhjmQZqO26pOeG
         RCRhch9PvmPMO8Z8TZ11F6YTOQRuAMG09hqaRe3NnfwxBgpZm09+nEoUfF5/CBKIzYLg
         TgQr10GLwwfgtcOes4tbEW5ee90s2fiFjRy/QQNwNFUMwFzrc2/v1hiWKXQ7hlLVRpnK
         984DWfk92FKW/secR/6LwJ6BmshCTRs6p+djywxwIEKrvIeGH6W7exuRO2/NPMnCVjg5
         OS+w==
X-Forwarded-Encrypted: i=1; AFNElJ+ErKz562z52/6B/YmdAEy12EAKM4JXo0Zf5OBYe4SGl07HoywCvzU7SPaVnOqEBnTDhQim9gw6lH+EyItg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxt78Db1mwcS5bLDD+fcIpx5Lj2dCpzzm588eWJpl1pbbVE8zw
	HJnXQ2asmFVOzJIrLaM4Poijyd3o/mhlfCC9pk3vvwimfZbKLTt/MdcEkHvuADZ/lLMt0MIM+hv
	4GFvheYgwaPB46kPTeuw9Jglx7Wnz5kz14P6srOp6DMZWxmJHTAAj0GDbALgIwBqeTYOG
X-Gm-Gg: Acq92OErRluA9Oh0CJKGne+bvAV/8iVor5ysctdSbycbV4JsOQYGYFMtNiRBCrWujIn
	mUievDIDyo0/vPZ/Xj0rkdPeGw8NRTyFL+/yYQEwoFmV5RupzXxuC0gVx0i8Dt8nWQQ86T2JuLh
	hMrRibdIgZ1rviQs+s1HuSkCZ2llE6dI14Rp/cIE6gwpG7D+mg9QzETz/k/sFFhWxpzhIxOfcQJ
	pQVnUFtXG8gdZuMeDAX9y5vcZ7h2JBAyQiRx0+IjsPE2ZITt0l9Dj1wUFMwJKWXvJx5rCMR+BDg
	42GLzOji6AGjh7xU+5F1EbfDMD481CBbd5XJhfMSh/K3BXWsgSlNYNaTEbewpy0Hg9cjcXToTPD
	FHrjSsBh236WqYGFTwvXBJf8erb+9Sgn+mK/vAYgdNHhIu5d4kEg69OdyegvONGJ9Xe1aH7zDFl
	laODqMAhJTrQYitT1HhHihROLrp09QN4I=
X-Received: by 2002:a17:903:4b46:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c163d8c0f7mr75655655ad.25.1780560052787;
        Thu, 04 Jun 2026 01:00:52 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c163d8c0f7mr75654895ad.25.1780560052064;
        Thu, 04 Jun 2026 01:00:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm49374565ad.3.2026.06.04.01.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 16:00:39 +0800
Subject: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
In-Reply-To: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560041; l=8085;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=EiE+VHHefro8OiBitmnzA5TNiZ3gaXbD8UoLrYr6BAA=;
 b=o9BR39Ke88CvVtM0eF5M+OOnW1cpSe9rnrDpIQQ8WwSFgXNwIW/5cvGvdTbC1WzMCli2VYoFE
 0b0qmL3HZ+jCn7ZGJcqPABL5JWzRV8QfiN65E362C47hyp45a+njJ7x
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: XnLpBWDAdvRpICZypcVnANIaK3hsDXQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NiBTYWx0ZWRfX7fc2Im7BkX0w
 ow1Etq7cGSeYJe/p+MvLGjbjSZZ9yC8D66rKbxpqPGqtuhv9768hhqVvVBJVHKHf/ahyYiN1+2x
 5vPsA8HTU35aCcckWI04OyzPTlnzUv1XZGcDLvT3QL6QjjqRI9/BUuibd+HLMdkYFF9/YjZf9if
 d7vCh/J4f+Wv7vobZhI/a65RExlJ/RbzbnTcOYDMXAHhRctEwgoyr6CN6xiyBRA/N7VzZq9gVDa
 /6Qurn+fwHrIZceOiOmK3fvaIfqMbF2tbYTGnw2rYUjde4NsptKUUZk/M/rlOffxN3en58ZLGS2
 Z+wk0nb4vk9uAxfuPulvE/LIb9AiOQ5XiPrq0Hof8FkboJVYDW5zQMSFVO8y+RO0gIJ5I3Dxs8N
 u0+en3TntlefIlMapDD8HwZw1gHEHLec15FSe7sP+JIx+wdkvYMDuPtqV4AVBYOC6LE3kf4yScD
 C3zYQwk1y2wjoO2uV8g==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a2130b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MFY719BeqwQqaFbi1xsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: XnLpBWDAdvRpICZypcVnANIaK3hsDXQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111154-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77E1263DD63

Add request key frame support for both gen1 and gen2 encoders by enabling

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 8 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35..2918a7df0b403a886648e90ec00968f51c4660a0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		return REQUEST_SYNC_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case REQUEST_SYNC_FRAME:
+		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	default:
 		return 0;
 	}
@@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = 0;
+
+	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
+	else
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index eff9216bb50143c0d752051a6400605bbaf3803e..04c78417dbae33dff1cc7099e6f105caa606048e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_bitrate_gen1,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c49adfaf16b444c8ec7295b230a529..d7fd867cf6c98523123e9205fcfe4b469708da72 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -157,6 +157,7 @@
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
+#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..df8e70b133a12e513aab04427ea96fca22055fcf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2cd5555cbced8e438cb32e87a539c..a8b47e4ceba0fc868125f841a5635476571aab85 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
 #define HFI_PROP_BITRATE_LAYER4			0x0300013f
 #define HFI_PROP_BITRATE_LAYER5			0x03000140
 #define HFI_PROP_BITRATE_LAYER6			0x03000141
+
+enum hfi_syncframe_request_mode {
+	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
+	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
+};
+
+#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ff48333ad089894c3393e8ad45903c2603288eb9..23b6e7676d05bd01725f8e2cfca47b06ef112c27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -182,6 +182,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	REQUEST_SYNC_FRAME,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.43.0


