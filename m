Return-Path: <linux-arm-msm+bounces-111711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U2e2ACJpJmppWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C9653595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DJ66Fx1B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hPIUFlq0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7102030214FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8BE38D3E4;
	Mon,  8 Jun 2026 07:02:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2638AC79
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:02:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902135; cv=none; b=odEQjsvKGsAbOJwPKPHTS8GkEm8TWT1gUV393kmZfWRvPVSBVyLenHV6T6AQuhlVeF+iKOwBC9mXW6Vq2u96LwpDczlnFKgDAwnssIoTcfVX7gRN9X3+01F9sRu0r/+ZCyz4xwtJux3qjOErai9xAyxbngiALuvXeg4OvYn7hCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902135; c=relaxed/simple;
	bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKjZfaIFqlKr6ORJviv1uQUwmKf1VE0TFB2O4l+OKcoxTOWABpkuqK5/dnYuvSJVydNj9z4jNlV+3eTG7hpCc69H9veh96uehV1fRQe07h/91k8byfsCWVqqJI7jkby7lSbP6gVdQJ65mG0WZO9IFw2FZEWSrkUple5O1P4EFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJ66Fx1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPIUFlq0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkWd2382843
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=DJ66Fx1BswjDUyEg
	+m9kBhO7qIXWhbLthFaXsPksqnt3w589fO8O6xJ1eWkLomEpC2nrTxxZ2t3o7ZhN
	DfpXFai3Q7Vby04dgnfSrdHzQcHaGS5O2SQ1stwlgogRAQ9hB7SSEWJBR+cGtYmM
	5MH5CWg23cSuXsBcLk31zDjKxgfCbYoOUllAbLTjgBHLyCbFEMyfFZguoxbnyFvH
	shA97w++ZxMmstGOOkcdxsjUTSaKsKsyTZRu9KCG9d+NwJqm6jY/E6Q4g4HGuscN
	faozQ7bHiIUUs1t/9pwf9mh9SPeVriOcvw5R9wXPDZqKpHIW73hSgapKMA/pzOMh
	asULJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxx0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:02:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a366b61fso2327663a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902132; x=1781506932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=hPIUFlq08TGE9OuOyGklVBbM83US+gMRiMZaFwsOIcE7vSNnn9sBSfpPBSFxNdlnlA
         NTxhUx2ODT1nzjW4+TnQQjIsX9+RCBNQ5ibTsMtCPxtIoCpl6pz29tNgs9Iez0SpfKwI
         GDxmhyHQ/pr47o4ZI0ndD4eyhajHC2aw5Ue+HVnIW7pDR4f64OVF7VucAKhjazwVeT3+
         ZKJHt8O7V9vWWnOFnmGYkLob7Og4+VgDBDxeLXopV/jTb+ksGE37cFA7ifnFYq3ecAAV
         bFYmk3unjNOnL98pNH0pA6OPp9E2POFbUIiyzQ9GWcfqyP3WDJjMh0dfrlI1ij00F8fE
         Nfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902132; x=1781506932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=hbvoJHDIfTXuiHlbGlKmPdSlkxuQeCcPHE5kBuE9G2UfO0E6hI6yqwGsH9wqJd5ugI
         lL90pkjag9yL8MjXReK7tK1r16ZM9cB+3G4ZJIHLBQ9kWcVvVQFOlzsrBYJwckyRjX6T
         IV+4Kfn7lRV/+te2Ophqz3FfU6QKwHQTcA8vDncODtUKcueT67KOi7B+mgSz9OFSprZk
         1fJOF9eGR/biSQWjlHt0LG5843i65pZEU0EBg79k7MTkWZLv1xmj7mlhc4ZDKdzck2/d
         3nRUYZGmFLlakc/NQx2Z7XQB3xpishiIREJoENzzIfn2OAnR/sNEQp0Ud398H3vlD/4p
         MnRA==
X-Gm-Message-State: AOJu0YxkH1febxYKaj1K6l2lPhH2jv83FHD4m3S05hYJl1t75ugMqEa4
	ftM/OFxP9Iew+jbCArVbsCXVhSQvJ/Sub67GLqBBuB/JhHFwoYHB88YQaFWpt7T6eA6Il9kbkuz
	hHlB947MUNDr72Ppk110kZCo9z5VPnE2dRb9+1wzk18FWvyRqgUJhf3LsqEQNFFI30ooL
X-Gm-Gg: Acq92OEQWFj/0jCiC3b4jYAPbH0y2BjB4DpXX4abVFbqbj+txxfaDT+rzA62E3NZIgy
	VXxW8TF27nqSXsLVMApyf8n6yHgFi7XIxw5y/+28SIhhr50Spqzt2OIZVMenA1bNojfmzfKM5IQ
	5Q14QPY1gj0P88X0Cp12QvZY0Zd6XqVHRDiwzNFAayirQesud1UxwEwnRDI3gKnaUPSMjLimAEA
	S9+2FUFAqNctHaYmkDyC8JtdclmhxYmswoHklVmZBzXxTuebGmseD8ImVJp6wNDwZCpVlkEa4sw
	suspEpAegrkJCREoKpPyplq39l+qMnVaWAB3nbVH/Q6lhKbXPFjM0lcQYPGAyrPQjVZIyzBG/ty
	tRExq/fKsOUySSDm8FWU/SXh370+wKmoHmyRz5tP6QlfjiGOV6sxQbBV2dZo=
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783347637.11.1780902132550;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783282637.11.1780902132028;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:43 +0530
Subject: [PATCH v4 2/2] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-2-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=ny50TIyWUidyGAoanv9GgdCfanSDF9NUNBpKf2lLq5HsfD74oor5jsEU2fR/ek82X97Y7wl5a
 pQpTBxFfCAWD6I+WS5VaSGpScGu+HZgiinG9WqdVvLOmKN6/XspjrnE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX1WwaSzLBtH0p
 8ysEPQnuzMfUUE7bw1gNpgjrp3+/xTibI5rxuEJbgdW8nTaD1UZ4LEPYuPAmyxZVwSALfUvb44f
 gBeejTLIoijlbqxyl1oHaHSDJJv6eKoWRcGcWm0xLFVoMNzRfnZIa3phkvhhVXehFYUSRoP6bCg
 Kca2EYlkrKZ4zhRDo9P4nyoSt6WMBRpVdmjSCygpEjuqyXx2DmXxSg270X8hYIK1MgrrUwTQD46
 iXCYzwscAMrlXSljDdlxbw/nBfr3Xsi04nCIFX6VYV7VSZYfv0NqrjggxKufezO9yvrDqPhjHpi
 qGny/T8nJsQS9Hz7h30t9K/OvWDNn9yH9953FWudlI6KfyDPiWK3ls1XPkdWSjZ5XbO7zpplmeA
 BNxdjD14vbG/O+iNgEk3mzuGnJpJUrmRZHwFBOHNCq+E2/oWg22gdCAL8BemFtVlkmrQFj7Jba5
 nxT2/ZWN7Qj4O2YhhCg==
X-Proofpoint-ORIG-GUID: oirI1EBjNxVDlYlJMprlkpm8J-H9SQ9x
X-Proofpoint-GUID: oirI1EBjNxVDlYlJMprlkpm8J-H9SQ9x
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2668f5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8E6C9653595

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


