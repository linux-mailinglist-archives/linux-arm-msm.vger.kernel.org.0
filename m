Return-Path: <linux-arm-msm+bounces-92213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MpNJL6PiWlz+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:41:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15010C8C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADD8A303A137
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF292330D22;
	Mon,  9 Feb 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvkKQGq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CPLbyd7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A52FD1BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622764; cv=none; b=MGmjgB7kEHLhP/Sme2DAVJEMXeD4dOwUeCMOVCwy8yhzJscb/UG00RbfdawEMX2dJmu0OWiEesS5ldc2XuDSsIiyxyCpdCFctwGBcvJLgg2P4KYAN8LZGhRLyvm2Kagd8zoim7av461wdqZOOuqKuz79QA5B7kEq5HW4g8eBcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622764; c=relaxed/simple;
	bh=YFwltuvjo2/bTSOBXuP6qsYG5TWAbcKhuCp6WGLCKVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WiEzBKfHu/AvcyYPtdvgzIRZn5RI5J7myxPPvXUraL3ubaPW1zI1XvPOESAYSJSrBYraKi6N6nZwBV8iRqI+m8q3lPJlNxu68wzM0/4BIoPZ/3zzz2iLlv/PvxTtgiNLNPx5MGZQMSfdnJTEKH7BvCoHBwWiFWueEWzy7c2eSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvkKQGq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CPLbyd7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195Rull3251913
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=; b=LvkKQGq7xi6bVr6+
	5nzZRQIEJbLWPdddP1HINCojKe80EQ2WePhIqnoSb9ZrXUKrPR+t+QgXdNR8CcXi
	UTeM2G3C8TfJcALZkryY0gO1wQ+UalzaeP6188I1WnfazP0uyXP4lx2Jzg7UM/WG
	8rgjvnlkLwqU+AK4Jb4dLDAhcVlHxoNHs3nNPpQ63Je19P2/m7whnqyjXuiHt81B
	ou2wiaDzRPq6TKBJ8F01i1D6z8SigzKHCfXTFdlzWMpxt+4JLxBhboCKsHtPJ06j
	tW6xX66GS6BQvvo+DyGw6P1tbgRF5Axsqrsw6suosEWD0r+ye3Ke36oEKG42b4gZ
	fhx2dw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f68dyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:39:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7b7f04a11so127613405ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622763; x=1771227563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=;
        b=CPLbyd7C0NHHLnSZKzAnXv3JtlqI0QLel8cSdPc56uU4mIWw5gDGWExsgYgqiEDvqY
         DFNw06joePjYjevtz1rOXKtBOCMUjrzxRX6QzfRFFYJkMNZCA5SrSkbAzzPJWTTlSmrD
         R5E2jB3sfc/XGSd1tWEh0r68M6HzGFxwx4X8RTIafNFe/gH0iuUrHTcGEo1zejlETgOT
         F7sk8JFJEi3QoZMhtdVg4GoUtx0EXHJTLmGJt5iLFdfS2vu/fu9vjRde3ZH9w1jnLk5H
         Hn9hY33rCqdEOlKK8rleAjgIaHD/ULH4TDDHs7jwtzqXnofGqZFmNvK6/qi+oFqoCy2z
         Fryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622763; x=1771227563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhOKCFoYM2cTEdGk465nlwdn7Pnu44jm+hJIP4NutB4=;
        b=VC8ESHYcdaoy1lQs5twtmqqnUus7dLACgZi8h2kSE70fcRlbqA7vedbxWhtqW4I8vb
         LN7WgzGyRIg/wQYsvZAEeBYCNpKzkAoE6/WRkrO1s/x0rmUqoeebcJMGB6ghOS+MwDYw
         UwIxtmk5mUm8fY1Rmo3cHa62XDpJAy8IZlRm88Op5Yt1tg5/1gOE0eR3xLoWLe3ErURF
         NlSwgf+AOY84DUHg5TybRZuaWJjCHqpdeZGlVqfVrPn2LJVvIhha5GV3TgKuLlKodD2Q
         +Srp9/QbjKKY+XQXi0Ilt7ejxHxp0bRARUNchtjwDpVDm11f3f/0Li6UIJcqtcihsDWU
         V9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWecuX3bnkgMvYiam9PnePQsvYlk85GBRvwiBNG/AuGhV2+2hoqa16KuWSHTVLGTDQtWdOrC4u5u/uUkKKT@vger.kernel.org
X-Gm-Message-State: AOJu0YxUionyZbMbBjnQM7NU0Cow9TgNyy4opVCs/G+GlINb5UZV6PPq
	r4gxKtK5osp6aZPwrzl7kLl5WnX5leHbLrw1tJe42kFJsh/1tgmnpuJccq/TiYr9uJBs99SWf+p
	XOKUc4wq33lB/eq2i5frShf9no1yo4hh1TgkqWDM1u5WYDo9wHcPiPyBxIMX1K6rh4AFa
X-Gm-Gg: AZuq6aJnZQZOeppnFNY73+17UVjL0FkgfTxXr0Lv8/9tkHq9GsCjLm/4L7imXZp7+Ss
	acx/3ouwm4P7kCUqJJIbx96Bz8lt2v+sxn7CCo+PbLw5XU2nPDk66O/HZEyK4nExaeY7RzSMTsK
	jTOr+GgRDwKAtu915/F1zLg3HJwF1MvbevsDhanZJA8AErxLZDEXBbgwQ+F1gqjbhCwrXw4xufk
	gWfpKrVGbzHVsibnD2I9wDh77cHleqCZcFo07bDB0XkDXmODIq9CO5nbCtpe70npiNhreHHZPWh
	LCsmHE+R75EhhnX4We4cKX7syFrqn3BnfDDlbST3gDA6SwRiC60PX6x5Belx8NOedWwn37mZYOe
	MT8xfLrGHJE54azgnsiwMvonNNCid4F9AIDipWkZW4FwmhgGQAYTvWEdf1Udw8FYh7qWvrx6DxI
	HQ58hfuH0+
X-Received: by 2002:a17:903:2443:b0:2aa:e574:d7da with SMTP id d9443c01a7336-2aae574dad9mr30817525ad.0.1770622763381;
        Sun, 08 Feb 2026 23:39:23 -0800 (PST)
X-Received: by 2002:a17:903:2443:b0:2aa:e574:d7da with SMTP id d9443c01a7336-2aae574dad9mr30817295ad.0.1770622762878;
        Sun, 08 Feb 2026 23:39:22 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:22 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:05 +0800
Subject: [PATCH 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in power
 on/off sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-3-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=2101;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=YFwltuvjo2/bTSOBXuP6qsYG5TWAbcKhuCp6WGLCKVo=;
 b=0t2prkKudFnllNt1adakYdXwwxu9PLVM22qT+4fNaEpPiV0pvMD0spiX1DIhcrixuFLX/KqXk
 CM11yC+bsFbDFaCoHEsswEhk46U7VyTG56u+0BKYYshsYueJ6pH0akU
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: tqqJIslOZdXxVxZ0PLbRc8nE0BoMy6nL
X-Proofpoint-ORIG-GUID: tqqJIslOZdXxVxZ0PLbRc8nE0BoMy6nL
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=69898f2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Jj0QviqCfRpxDJo41YMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfXzv6/wPXe5h32
 /Vltx7qG6RJwS7flmXlQzzvLC2TKHhjzgnn5vzMfarDdFwy86OsNBs8TtWXa0/uqfXFGeKgrVva
 4Br9Jm0JCxsoxmOwRO0iStl7M4OMhcd2JUkj7vz5X17WqZHYZ8tpWUgeK4dCFI9mQah074UVimw
 /KSodSF4RHLOV3ZpBVbVpRFv3AC+xU8KWYSNjdeHPHEc/mJ1K8sCkbo31K2awlVqIz6c4tHWMPl
 ucgTnDdoqkJ+lD3In+pv0sitbcdkXKK6ArneXd2iDwwQ7GqZV6+hKOH/thEsEiRaanXe2JHjupN
 0Ax85CCo/1SL/UTreHMECTdUs4ZlGr7dDTwPj1nkJ+n3I2sot988nYS6vJ2nterb6/fjvoT+9tW
 DbLZoz7uRf6NHfMzOcG12EfsTixJ9GT/aNRCDjYmKbEAE1h3gYFl7IJdq8C1MBa9O0rVtIQF1fl
 oqcWJYegZOaTEcsjgvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-92213-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE15010C8C7
X-Rspamd-Action: no action

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..8f5cfad87b42f52e49fc25bc0b43c7e1a0ccc5e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -226,6 +226,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -284,9 +285,13 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret)
 		return ret;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_power;
+
 	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
 	if (ret)
-		goto err_disable_power;
+		goto err_disable_bse_hw_clock;
 
 	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
 	if (ret && ret != -ENOENT)
@@ -302,6 +307,8 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 

-- 
2.43.0


