Return-Path: <linux-arm-msm+bounces-116698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1FpmOMN0S2oARwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5D70E968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:26:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f8rGe151;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ej9OUHsN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A938132E2111
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9489141F7C2;
	Mon,  6 Jul 2026 08:53:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F247ECF5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:53:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328022; cv=none; b=shDGOYRiDDt1yOS8uFpM9yLyD/rz3fpPdMc+qXEBY34oG+DtQO3tEo9qL+LuTJTDj1dPQs4GpM4PObUA7Op+Wk1P65EvZ72MdyEtfM5TkTCkd8kOM5P6RaXs7WU06hqhmU7RS7OQI96FDU95S4y2UlscnBfUcipvrdj8bytZ5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328022; c=relaxed/simple;
	bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/LZZTHkZMJre8QqBuB5ufzcl9Lwuoi0xDhvceKkoyi1NzBMkfT97uVI1lcYNaXIw6LHiOCSeJUUD3jDdH3jT3FzFEzTRIUQLON9Yi7Zj0LIBre0XnYaqn4HopedQ64h0Feba39NS96KHPm0XCLy1QvBRaORzA56rFzBC/KAq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8rGe151; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ej9OUHsN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667C9Cw3845166
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=; b=f8rGe151LJsniXpU
	96LdGu/jqjnjIE9VAtNKvKoyKmLrJmqZkJyZsytDw52r2osPlT5depUOmREMAQ20
	0yxKLLrrqx1MsBAitZ6P1qKIARnntyqa/5RUsSF/yrnkGy8/JXXTCkK+0n4GdCjP
	oLmNyN1tgHbSqEy91tvmdOO/9drBRFLR7u+7QByjlAJzv3rgwBWefnpOxkNmL4hX
	ptOAFY9bgE/9vFbVTDmbb9UITNX8sSCc0HGZi0v66/EHFAOlv+XEZWkBUijWKxv4
	D4eq58U+J3g7iWbBvExRkbcWWs7qsmqmDTZuTMo9I00r3TrqDd0iGGwibjKHdZ5u
	ePw8pw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrcyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:53:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a225cd91so2739142b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328012; x=1783932812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=Ej9OUHsNdkJMxblJHcXxpUZc41R+RfEGkXN2sD9EaWSsgmRlcSr9aXagwBAjytA9Cb
         s6axrUidheiDvFIAo5WSSZk2C+TuIE5/fHld0lKE9FQyVpn7l2QRDLlduMdcQtiDPS6x
         VNPEcL0iFxGE8kyzpPVONpNEZ2/SI5TVQVl7X2mFXKO3Rk63y9M9dew9L2cKZ+yIs/1V
         KOKiFNTx6UoiMR8QsGc2Nc1jzo78inSE5IQbESriAH7XslAY5Nnpkl7/of0Wi21wOCEa
         z91rMgcLv02UjhBGSoEusKJBZrJ0RhJSEe7ReXuiBFT2hJFwac0hWu507reMli8PpRo8
         q0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328012; x=1783932812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=r0DPWLXqbm9+qy78By6Ki3VCDJ/rTzT07hCGm54YlZqr2Pepi4N3uItJMMLGwPpZCx
         v4PM8VQslhISdhDbverdGDKplF07vuiEwyBssCYpM5L16S7EBd6motsHg/L/4HhRB3Bj
         Rj00ydqoih1JBMwp13c8wUhVn0yDR+ZjCEH1Ut7opPtae5+zDQWYoJqew7t+DbA9GD3l
         V7VX8WDey3IYWr5Djn1V6uYlcBDCDvLUVvFLDul52vejoTaWfGwGqvTUExHdLUM8gn93
         FPfMR1CKJa8Ps6qtyvVmmu/zDwaHQB3injP0/UrovunjuD+ou5KTCkEOqtEN5SIyLhQZ
         0F7w==
X-Forwarded-Encrypted: i=1; AHgh+RpJIDoH8E5ZnQ3Qw/fciiZJ2l+rBBR38PYSzwf56wXRq25ZfdhfMg+UvVtsKgE2CijaAv+5T4Fa41+58csq@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQwpR81Z2ShNBOKa5RuGRYYKTHiNXrzWZBm9RZcBFx8gMcqge
	Xkc7Bfc86tWhOjN8CPBcadUQdyA+sDW8gHhI6fzAm8TgaO9GZ9iu582aoAM4+WS69KSFzd4FVHI
	c9lQnKTo8LOdCjkoFXmcSg/t4JxF8Lzd7H8LyhbMOBZP6q4avxUKDguJntg0O1aNjV2Hj
X-Gm-Gg: AfdE7clgeSYksSFsDd8RYkPuqzb7wRSjFcf7PbxrSikJ3ibnjdptuFXJRDK29ih01YX
	clAmopopOo8QPFY1L8Jupz3C6i9bdnGVMBWm8q0iui8jb+KAtpv2bf+m/LfE5v7YI79oFSLVyKE
	WbdafHdDpetul2EAbE+DtBn/+Al8k/V9HvF+j9UP78Rj7y/FnPVP2HAytCpq0zWrCoIkkw4628W
	EsAWCc+Mv1QNk3kRz2UdSvyJyHhlURBLGQDiNS07wvgPsyMwNTdoK0nxc7m95txmOZ6U37j7kB+
	ZW6q2RNryTHKDJ6qbqp6V5w/tZulj2wMkRTx/yjzD7wn0DsIExFmRYOsAQGxLMlO6yHjEF7K6Y2
	SZbLmlamaKDDgyQlrYSg6Y/Qw+IZqPBQp7tj09IROZRk9
X-Received: by 2002:a05:6a00:8d1:b0:846:169c:d815 with SMTP id d2e1a72fcca58-847f6fa81f3mr9020092b3a.60.1783328011655;
        Mon, 06 Jul 2026 01:53:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:846:169c:d815 with SMTP id d2e1a72fcca58-847f6fa81f3mr9020065b3a.60.1783328011084;
        Mon, 06 Jul 2026 01:53:31 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:30 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:23:09 +0530
Subject: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=1909;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
 b=QFmAfkS9VAoslxTguMBvbNBSXqWyknyttP23vjMCsCwplLnXi944ZWXmo6yYFdAODXns3ZOub
 /XzkupnyRmmD+41Ciqz5xjENstNf0XZD0vQ5xfPLqFXAp5koTp4fuDt
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: I-4nyeE2Yg2NA8neFzcTyNpZXXHc9X-x
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6d0c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TpI2hjkGOM-ZtQ_OKuoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX0fe9+DMCUQkF
 qXufvNafeOCFn6+xFKzpsfdos/RJaGzSiXB4tmRruMYNOAigLbt/JQHNXOHqt/waL1akJuG9mSu
 p+F5HKRb33LipKe44Bg/zfqghoR3oXk=
X-Proofpoint-GUID: I-4nyeE2Yg2NA8neFzcTyNpZXXHc9X-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX46c8Rh4G62uk
 KBCLb118PYGmPi5xFIN+35s/kHiWn3Oll4lXy5W1vcpdNFIUiFvwhecNnY+AbGg7gy4a2ECGkWh
 6SuqUuj93Xd6dNqKUWZ64yeCmcv9ZLIOuXwNn+jZRc+Ccqwr3RR5ne+93th6iqfqy0K5g2uwbl9
 bLk4Mq9ibor4O1hsvtAJnrKOA0xxmqa53P1pcSpZoBMdJSf2IVrw/P2i5b57/surkcF8A+MucBL
 mqszckARSi8sejh8a/jU5fl3dJVdBfBA3+8T2R774c85d180OXxpTcCujl1GoMtNjK63QJYpE8r
 NQ/w1G6Js+FhdftokCLYksbDUdOJwwjan+c/rrXq8BKFgUfO/mhoEELqcm1nEZq4AqjWQv0yYFv
 Dl+CK8x/ZepbdO5W/NxfrHuzr9TulNajCKS/oNyBAl2vjVe2rnQSeeOmKseos5+LvBpT6NYNs/w
 kClrdNrReDOawyqwg4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116698-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33F5D70E968

When a runtime resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  This causes all subsequent calls to
rpm_resume() to return -EINVAL immediately at the top of the function
without invoking the callback again, making the failure permanent until
runtime PM is explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  If a
device's resume callback fails, there is no reason to permanently block
future resume attempts on that device and all of its consumers.

Fix this by moving the power.runtime_error assignment out of the generic
rpm_callback() and into rpm_suspend() at its fail label, where suspend
callback failures are handled.  Resume callback failures now return the
error to the caller but leave power.runtime_error clear, allowing the
next resume attempt to invoke the callback normally.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..fab38bc98113 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
 	if (retval == -EACCES)
 		retval = -EAGAIN;
 
-	if (retval != -EAGAIN && retval != -EBUSY)
-		dev->power.runtime_error = retval;
-
 	return retval;
 }
 
@@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	dev->power.deferred_resume = false;
 	wake_up_all(&dev->power.wait_queue);
 
+	if (retval != -EAGAIN && retval != -EBUSY)
+		dev->power.runtime_error = retval;
+
 	/*
 	 * On transient errors, if the callback routine failed an autosuspend,
 	 * and if the last_busy time has been updated so that there is a new

-- 
2.34.1


