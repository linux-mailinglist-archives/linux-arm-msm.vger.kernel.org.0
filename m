Return-Path: <linux-arm-msm+bounces-104320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNu+ICcL6mnFsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:05:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BD451BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 584603053894
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0864C3ED11D;
	Thu, 23 Apr 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7c2DpDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6TV21bG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93563EC2E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945664; cv=none; b=dr0YIbqXaSwA2nn03wvU0v7Oq2rcYq6KMzaZBMJMqum7XRQiHL9Ob8CwEy48UNn11QmAYDGBi4NlaeQg+T12kPb4ZHAHR/1fyd8N8RRgWH1iGhy5/UT+RTogGawhfoGbxFA7LtiI8wsuYQUvbOTSs7GocGrKoiI8nPa/lJycEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945664; c=relaxed/simple;
	bh=HeQbfzBZxtAvx8sqFyD8eutBlpfwbgcN8L7xmMcTs+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gdh9n+H5XDLD88FxIZrj+tV49zWYszXOEC/CCTtx0G/UtYtqjIfxdpOWJ//aXlM4BrwKL8rC+yoDRK7eD1oEm8Sdqbtdh/S+qxeya9BpiEos175J3Mg7ezEJebQoZbCepiITGXCVj57Jm51EtQk+pziTfkfjAI3wauEEgn2LfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7c2DpDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6TV21bG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uMeV987864
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=; b=n7c2DpDMENbdI0sa
	+lT1nQZNEnnswgXt8ucfdHMKRu5TX0OGaDf700iTylJrifGL369rjY3aY2dG3YDR
	RUeM7w6A7TFQf/1ydEOYIIJmBsaOmTD+Zr83acH27y+XCSg66Ued3tgF+jzo77In
	UlVuo7V1YPm0qsOjqvIfnCnd5dwbDTzOerN55bZ39pRIcz82czhChHKPldmww1ps
	RieOS6+hwV82EQz/47wCslieDuIOJ9iMnfeOF0OT9+Pd8GeSTT2NpH+LQFJH4HFE
	ReSXTBuIO+O2mvZyGchcGNvwVQJC9Ldfjx/u2XzyceeHYZru+2x2yMp6QPaCUxXR
	YvU5Fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3u5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:01:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso46285525ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945662; x=1777550462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=;
        b=T6TV21bGJ2SQGZMJ2Xh7Fx0cQ55KhmEXBlPyHFoYceO6Gp6grCAAMB8ZH/EXUCCRTt
         oP0snoe8QlCk8kUWKzu59V2JdWQtj+j1jeiM055pIhAMGVy1dn5s+I5Fke4d/PGH2PSX
         urbFqodp4rNoUumbrdvvShvlaTfLqHDKOPR6d01dV3vpIbJ+2/U8PaqyalekuVMv8qtv
         Z0m/JSD1RSxr2e3YOqKvXY2Rlh0nsafyBvQbXmQ+M9Mc6ounqYpE1JxqaY7IQl/tQQzw
         dfjF77NoiYAw20GxAPXCH4YKSsTQynMOtS0l56iSISG4D9m0+XqVRCkAhD+hHCrjC8hv
         Hhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945662; x=1777550462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWu+M18Oh4d1GMifcY3gZ9BMwszgGFVkypbPKVidZrU=;
        b=RM3GnnlJdU4WRaKoQugGjXWKTEqtOs1e/kwEoKykYhMXCO71T+cPEpcxRNYfKUP6wB
         H0q8s//8JZq+cCQpDkjuPGeUUq4FPrLf58rVS6wkXxlOpG+mvik4acoOAtZAiG3RCAJR
         u8iGTYoSYRcTigEZvTYVxTvABKKkbZMFxUjU+STb7KsnhJeoXqv2lJbn52VwnM6NMaUO
         9P+UNuIjP2oRciB/GH20U1ivJI5/zgF23xy5xC6xGqJtbZc++ueqHeL2IW+ZMtlehtWN
         QNdLDeR69f+Xt26XVC9301bdSin0VlLJcO2V/UBHjehjwtPOj0Yd26ifT8Io22CZP0Sl
         bI3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9T4BE2y6BFAR4bPN7VXeYkHFwAJ2eXrwr/far5BnkXz4MKYgbYOY1dFhKJt2Xdx7hMKzBc6uHah+sRnLzN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjgn7LGfSjAgbAV69XLfne9sN/zBS9cEQ3ut2WGfiH5Rp/X2QT
	sPER8HyjhvcE2L0fOnG7VYqkqgj3aRtu9vAdbeCGBVthkyjN09pd3pJCjJgyXkQDLvkwXqUrHyA
	mueRoLqSvLLnhCtC6c/ziIk8xuqqkq388sD5vGT63+Efe1xBfQyfgRV7jZ68d5ClEq72t
X-Gm-Gg: AeBDieve7VMtXJer2cInj9UVPJLvRmilnNE8oxoFpjSD9E4KMfr2gTc7rSRVIc6IS7r
	JVD5DUZfNxsq19NPx3sL7Uvi9XcUiV0TqkiAPVDy9QlTXAVMqCzr2w1zdOD+2i53sTmtt+I/YAi
	HLHSnPctu3xjP5kXc3Prs1elVdYpdYyfsdyieYEPVvaC+jaPZ/q6DN2KdKIMMce6s9LPdFOdZWi
	t7Kr4wocsD3C9OVxzPGl+LJ2ds8OfQOY1g0IPspw9j/Hgf+Y6mHJoPPxu5e59K6MB7MgfVCM/fb
	jHGmFvxI/7H690csYsDrEDN5ZXAVFp/d0IjPv1C3cOwnv53OYp0yCeMBgllopXVZbQTShJC1+km
	OmVU5EnZb9/TCwFb2CmMGwAD0zg8O4N+DWa8rmsgqMPmTB46b8D/g+MmGg/3ET/iwFgafvQ==
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr281095125ad.27.1776945661728;
        Thu, 23 Apr 2026 05:01:01 -0700 (PDT)
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id d9443c01a7336-2b5f9fd21c5mr281093675ad.27.1776945660319;
        Thu, 23 Apr 2026 05:01:00 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:59 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:10 +0530
Subject: [PATCH v2 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-6-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1002;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=HeQbfzBZxtAvx8sqFyD8eutBlpfwbgcN8L7xmMcTs+4=;
 b=MFvb/avwBQUHw1mATjVUho0TncKBj6ZokRDF4/aZOYG11kpwd6toJbTYSSs2elkAbj4U1CX5M
 FeqFDF1noxsBhEfT5qgpmw63n72ftCdKD28DQHc1Tf9L/K7jTGEvdVv
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea09fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TZpohm96M3O9q7pB9U4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZXmF4sXkwJMgrrgUX2ZRKIHOXSYg3cy6
X-Proofpoint-ORIG-GUID: ZXmF4sXkwJMgrrgUX2ZRKIHOXSYg3cy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX5+uFLmqrttEF
 ZFfmmA+mNkaNcu0MdGXV21qRsAL0rbIlTL54Nx72ptq6hLxiOdLBBVycwyT6CBtldm8UYLZ7/6V
 4ZAdua1jNqEC3i2wmgVaB+Nz8nQHTn8OByNhd60z8drMIw9YW/QhV741Q8NN3RR5mh3G99+QMO3
 HrO9bH7OakLV+XRGu8fPaPaKgzKOfHWPyxi8lg/0JnRKbf5YaIUCc8kWmMW3wCTyXbg1ScktSj6
 gAaQMWhG2DwjybG2M30R1wL5G+w650ry2/R8gfN8tyHLNOZd308Ja5nCsYs5VoaINIh9qO2/J4K
 jrt7grgUImLUJWu2r1IrWy+rzqWIDk9amtoRM36dl5SukOD9r67sRKDXynakMcwRRmYGmQeWrov
 0Ci3WoGiemWRMTBJhRHfQ+RKYhDISMZOapWcNWF8wEtIGo/13Sxzr+Cn11z/x9CbBIHLHK5Alo6
 B0c8OiTrgVkrO7zWAVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104320-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 056BD451BEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index cf3386437102b814cf4b042a0a27f25a886dcf36..693fe3b34b078b12a738ae36fd12e9b1edf4a13b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1


