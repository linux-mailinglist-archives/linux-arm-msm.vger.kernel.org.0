Return-Path: <linux-arm-msm+bounces-111358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Rk9BUSlImrDbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:30:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C74647578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:30:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oZEblcQN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eo8NPbMf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111358-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111358-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E71963025672
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6DB3F7AB8;
	Fri,  5 Jun 2026 10:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E83F7896
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 10:19:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654783; cv=none; b=uDYVytirQZEygIgXKNs+7Z6nrkvXhV13M+79AdDulqfVBSqvPcDynSFWf+SYGH7Qxk/eIMj6V3fjMkjpsiKfDx/qHjrICxlsncw3Pl1+Xw2noWrGxhrx26osiLuDlkiwXWQdMrerLoY8YkLap/3EJdzn1rTQW2vSl1JrYw3AUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654783; c=relaxed/simple;
	bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7D8+c/o8s3NpXrbtx67OeLRy6JlEGwaKXOrxmVXE8Vkysplm4/bH6fmBw+LsOG4Eez2M//Gokw7JpOhqMECs2VLM5nqbi8LG0V2il0QPHLBvx1wiN8kqAnvWFbnaE7oduVOP9fzG8wNiP/LkxyZlSKryeQ51Ww2T8Khnse50Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZEblcQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo8NPbMf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559mDLe3016235
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=oZEblcQNWqkqEQSh
	X9TIIJWFvrr3+sTd4bHurOifca7MU9O632Yhg6hpI9JFjGCAO0Gvdczd949cun+i
	aYnuOpuOIK3uokao1T5xNXKdQBcnRdLS04S5kRzkrxlI206IdjlfXxiOj1eX9xcB
	0QBU3D5B3mDyEfMxcdaePg3Aq4P3w0WPjeFt805S49fdFmdTzhCWSHULO8W3nhNc
	3GqqXIyK2bjO4DBzVw7gDH5b5Hr1+ooPRL+GH6E6aEgqSGR1bvt69lIaghpoqj6i
	NKFqDsjklb4T+GBRRGY0cl6/lXtqZ8cxUaPXQ++VN+fndJqaoWZSLHhwA86XeXVI
	K5Ud/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56g4bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:19:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so19770465ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780654780; x=1781259580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=Eo8NPbMfPDXm928afiDOpy2vDVMRj8gdHnNyOP0l/L0AX1c+9cfZVpByT91iDfL1/5
         FYX3Hk5XwUR3ff6Oofj2ernF+I7scOn+JfAqYZYcGQjdvknsl6Hze6ytSQ3kjFv9lprQ
         5cspYquSBdoNzEAC7z45CSWAPi6JUKKyhuk2IQMyjQ3OpnVRkAkmSfZMc8aT78HaqVg9
         XP0qHmp+4Bd3fyxhllUop/K/Ecayn7c0wESJsVeoV6KEVWWDAawgVv0xVFSqrlh7mw+F
         vMpSa4I8QqvByWjh6QsKLeUGnutrIUqrlTqXE8ceMa3d5MSA0X25upe3Q7GRLvZKduXp
         t6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654780; x=1781259580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=nMY68gg7HnCkR7GvHe1vfkMmTHAA/pRLfvn2utpRZE46bUjNe6PWJiARpTd9FYS719
         KFxIBqryOFjEDXGpdCZNT2JIA5W/0eePm+/Mu93C1vlBBnfGTcCwbmTi0l/8s5io2h6y
         y2SUbknbDZb4kvlMywIPEcRXpxL8AGYku1hFBJ5b80+Y4l2fVF7Hva4FzVOS0+AlJk4k
         PlXzG0NPTZycdDxqsyXS8tbJdDjEcvWNk6eL62cxAnYRB3ZQpMmqzErXI/ktCFhrii16
         YeLmXCsnIEf9nclgqKls0stL2qxuJkdhXJRIqymulIeSyOeuGZr9j4X4tCKu6WgBT0O1
         e+GA==
X-Gm-Message-State: AOJu0Yym0a/DhzKEEs3neTbrnTxM39ho9xXmCHE3Zqsr8uQCZzOwkrvp
	HQRC90rlZWi1tVxsiQ5MyvS0j6JM4FcYIZpzglN82HD0fa9bB4e5EtYqsWOXmBgGLq1iixARMDR
	TeAvKEB6bXnvPo8+ORotX/fZq2NCuugzk0+CC0TWYtoDYtFGqG4JMdPFYaSW32E8UnIQM
X-Gm-Gg: Acq92OEyXgppF572Zl4Z0r6x8zEcEVTML0GQZkx6pM29tBWsb4P8SWlBQVO5B1XiCLr
	uXU5p1nKxJTKNyR7gKw+/OqRlJfzN5FciJwezWyE+ooiX5XipUblR8oZFRG+P1rS3ACFB2b96C2
	gQhcQu0T5Z3d1mVYhKjwflZU/rCROcSjO3dqpwKPGonTOlVcoO/H8APt9pR2T+8Hr8uUb4VLY6E
	LPXrgf767elKQ2OHU71qnPipV60qlDm/hlCgcVArDP4tYPyrgIgZNg9n1ogreRlUuvcGAx6zO7v
	I7AzerpFPs+8sk29SOcs8SykfPNxBWaGhMol164vmQdDXbB6rlt114i8HRbWNbpDnTy871Jj9xc
	DjbYjX+PJBKvMeQxDShleUEms5I4ghCjefG3OdyP+XyeE4OhMKQc9xKDPDj8=
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151645ad.36.1780654780032;
        Fri, 05 Jun 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2c0:bb11:19c8 with SMTP id d9443c01a7336-2c1e820db02mr32151295ad.36.1780654779579;
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm89741445ad.33.2026.06.05.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 03:19:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 15:48:53 +0530
Subject: [PATCH v3 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-display-v3-3-9846ba5fe635@oss.qualcomm.com>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780654747; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=7rX2EC8uhcDt/DiMdC/pz/WYl5oqxXXseJ2Vos332fRcblOHX5myBQRMg8/MPOkIQQLugj07+
 GhyQMIiwGzaBxX3jfm0F9vACJHj7WKL6YaYot4dhEnVPhF2JXqDCa4V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5OSBTYWx0ZWRfX1ZXih8tt0oCA
 OdBhMMnnG+qEVp4uQEiRyrm5y4Cpi7Uo+SsWYsGbWPN09jgfTcKEe20RjBz+NcMZGL+2+CcnUxs
 plFxVy0tialhIAjW8d2PtOqNs9dn+HPHJgj1mamiRC9Ii41HlMCp9lx0bKXFbJg2pGwNgUdcp7T
 Y6zSERyKSTcAZIDu1xzZpK1DzPkFlauwCmuTJ75TOd3NIHvSVDE6vthce2NGQJM9wlC4sZP5sc9
 BBvERefglpxX58aWdBJN89ypFyHzpnkyxLcudCWtylZkfo15sO2GeAaFLiSB5Lncc8rmncyKe02
 Sv5PRKUZ9KOP0bU1X2NJl6Fb5YhOOjk7JQYMOC5G8C8TZdHU7h1yPLGYFOtcSLkIgWKI2SJ3bba
 KV+sZ3ggphZ/4J1aKJUVlrz4XJpYxG7lwh+UnJ+pOeEyzrQ/7DwgIcccQKAmoQrlb5Uwo29ETby
 ptJpRmXxKMIRK9ayZcg==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a22a2bc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: oHBPjLU8y_1oms-iJoqeZOWBasQSPF59
X-Proofpoint-GUID: oHBPjLU8y_1oms-iJoqeZOWBasQSPF59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111358-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12C74647578

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


