Return-Path: <linux-arm-msm+bounces-98009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EuBAoNNuGlHbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0829F1BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD0E1306FE36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBEF3DEAFB;
	Mon, 16 Mar 2026 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCpfyXzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1Lz71bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE232292936
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686089; cv=none; b=Xf/ttZIFXtJCh+sLYuLr2/8Mwy9DXU2cjzgtja0zpVg10YAlN6x5BIEGO1GIWl43qwAcyLfcPs4zgWXQXP1wgQsWeINQ1hYZlpjfU0NgxVDQ6AfFgAB8vKBFW21H9hVPx8BLi7N3XwiZRCc8Fd2qXUkuF/yw7n5JgW4sv/7OANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686089; c=relaxed/simple;
	bh=5qoYW6Qmr2Kpzbwy+C7Cu2uK8CzYCv3Rgmc/2Kw5qF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtJalDwjgafCYMISiyv3ByYYmwL4PHYYF3hKFw3cLMsPposjZXlZDiofmFQZellLT7RnDy9UteI/4DhfH5VhxTAkINRpgENjiA1DBqyA6q3dUp71nf3G1HtdbgaNo3RjEIEkrcBeh07njlg0sJstqQJ5yrXfk2d1gqQ4rj8N0ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCpfyXzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1Lz71bj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GI4Jxs2671865
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m1D9Dmm2J0D
	ng+TT2FMOHE2ImiFt99EXWPfgN08aVsw=; b=WCpfyXzlc58aLG+FocZN0DPY9kA
	vSTCyuMaRPP1Nn3odNy7odvc0OS5PSJ9+J6XGqyMcDftQtFNwQeiqN98uOPJlzT+
	J13fF5DGMJSgmMvlZROp9aHxKRXbJYPXt9N0VVw0Gnyz5v7nqXg4sbBoQOBGB6KA
	LZHTmwLS64FuIDKvJ0sefqZlztE1XG71y5C3vUZsMhnVCi8Ut3io5nbWLmL8kn8S
	10SLb3P8jrHetwqg2+FHEDHhkUCqMJnDcXNgetL9R8L0Il1V3+WYEQjQx8y7DAat
	s5FLZDru9jUcBh/9cc2ZYH+2QCHpzi8XVw8hdhvvtcc/0PuiGREMJlcgdTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf28pks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:34:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0b5cf34dso5257628a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686086; x=1774290886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1D9Dmm2J0Dng+TT2FMOHE2ImiFt99EXWPfgN08aVsw=;
        b=a1Lz71bj9+8EUPyXvwKn3wM97zcMstL+z23vrQ8+zMuABmsky/OtLKokoEEdJGTAjT
         z0blDOSPoLsZMd+gL/2ezu0J0kGqsMAZSq/u564xXGzARLBr4oWWHT2dC8ARDZWTs2Ns
         pAORmibQTEmkV2wVE15BoUX/Vc6vHDmv6u52RYRqvRNU7lGIOsqYfCruEPmyRQSOdvlW
         j52wAWB+Dy5h47ZuPbbSx4YHn6KwdrJGxP4Y60uJOffDU6SIksJ+qoQIXsb0C5RRYNB9
         TrKwcyHfQFDXPkRiBJFDrMnYN8/Eedr/QrsSu5BuyJjMR0wgKmf1Z/bkY+NjTD+F9IEp
         /Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686086; x=1774290886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1D9Dmm2J0Dng+TT2FMOHE2ImiFt99EXWPfgN08aVsw=;
        b=DyLtx89RB4Nd/VSsEUt24cqIoc4D4dr0QbSnv8d7Gx/pHQhA0HTJwx9L2dCmXbxHJA
         gnlYywW07H0zhdQeNhuBJbfOVJ8MN2XYjcNNeGEWX3bcLiR+u5XKLCSncmZL1hoYmueM
         02zWPIOwnLZ9HcTTBdGSXnfRhuzYrmN0bpqBJmSHiJUOMeF1rYbRvlDKt3yx3zXfPuB7
         EhUcrRKteAiMb8ab+7w1f+jFYM1FPlEa/+xhElQChR0R3EdN4lvjJoGF+p9prx2/X38h
         SO36nKuHmiobZxs5vzanQOiDC3pmQ96XbSzOx2rldPhHslLTlq62Sj0HHh7O/jWbOP/H
         IqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVillRvnqv77u+noiKUJUK4UIx9Uq7Cjswc4yA0JMxmTuiitqiWC69Yjl8ttox+ZvA1o6j61bmmU7J0f6a@vger.kernel.org
X-Gm-Message-State: AOJu0YybgKMb979jU8jMSLZf5TWazDxfe9Y4b/fCJbBQW+CNH/WUaLm2
	s6H+2GFRZyoHgN2ImMczukS4UFgB+K82BTUT1qFf39vc0/X5gCNQde33KwTfO2uYzlPa0WyA3r8
	2n62TLMdcYxjWq8ZU+3gDtrtty8tgvmsuVzgMjfiQJHBSt64tEq5Q+gis1guKlF2hvkmS
X-Gm-Gg: ATEYQzzoGiKmUtjdu9BGwXLc7Rxmq4fhW4NI0PBjAmPvroIiTCD328ltggYbY5YqCjc
	r6iaukzheFQJ1FmL3vjE8VtwrnVDUObgXbHfyZVy3n+fuDK8nn55Nv3EpAhFw0IGEIkDOTfa0yN
	cHIRMJwoHSDFVx1i+mZtsstJgJdJBFJq4bkbY4B/R4STo0+s+goN/Z8ChfcKk4yyTYu7vWBajkG
	uCUM0C4fsN7ogDgPoONM8AS9xDwx25tHnnmO8UAH74iZ1ngZSO/aHWTjSgVfLqRuxv8vC5A7Xfe
	3C8RKbUdNv7ihKARU5feZ5W1jGSs286DbPeTR+N95p2EnwRleARaf2b03ixcWtUi4mIaUYWnsVa
	ZbLJKAnU7oN5lcpKKFWNaBlK0sbI9DFAz
X-Received: by 2002:a17:90b:2687:b0:35b:9ab6:1d51 with SMTP id 98e67ed59e1d1-35b9ab61f3emr4284406a91.24.1773686085971;
        Mon, 16 Mar 2026 11:34:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:35b:9ab6:1d51 with SMTP id 98e67ed59e1d1-35b9ab61f3emr4284382a91.24.1773686085496;
        Mon, 16 Mar 2026 11:34:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb996257sm9671910a12.9.2026.03.16.11.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:34:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/a8xx: Update GPU name with slice_mask
Date: Mon, 16 Mar 2026 11:34:34 -0700
Message-ID: <20260316183436.671482-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
References: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W5bL2M0guMz2nQzXC20CTFW6JOKvawxk
X-Proofpoint-GUID: W5bL2M0guMz2nQzXC20CTFW6JOKvawxk
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b84d46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=8lTVeMJbxB4f0FvlbnAA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0NyBTYWx0ZWRfX7ipLS4stYsDs
 fNh+E1AfzvHqTtTqIArW6hFw88/Rgk0iQece5DnUm12UAC2gMRBcgnhDzqJiFKDsWnQjnHfwHvc
 x/Mxowq2KoXRXFsFknYfU+0+m2bvYRSR5qom0ULVIpVGi9jgYTvWaENGvfolT06e4yCPL9CzK9f
 JwPItaMixLtGgklbRzfhQ9vVcLbShEBKWRlLiW0yrPO8faCQcNfMa07vQ7RtTlHxFO67zg7kHZP
 CgATcbZxrMMG1dB2eN2oauVl4USSt1FNdKuON7hSqoPWW6Ge8XyARswO/GjORmK5STwmfW6VBlz
 auZGd2zleUN/dyhOCADk97E4BewP30ZWV3I0G2oOccpYJ981RgXc1iUJFS0Uu9+3JM5u8rljYal
 c34eyRQB2+U9n4QO/sHIO167Uf2j9hYIL2hjIvsJduYX44WDWhCGYkhm54T/4kUrV36XBXxYWWz
 M30rhLv4yLhYemnro8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160147
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98009-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DC0829F1BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Once we've updated the chip_id after reading the slice_mask, also update
the GPU name so it matches.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5a320f5bde41..fb1d92095db7 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -87,6 +87,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	struct device *dev = &gpu->pdev->dev;
 	u32 slice_mask;
 
 	if (adreno_gpu->info->family < ADRENO_8XX_GEN1)
@@ -110,6 +111,15 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 
 	/* Chip ID depends on the number of slices available. So update it */
 	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
+
+	/* Update the gpu-name to reflect the slice config: */
+	const char *name = devm_kasprintf(dev, GFP_KERNEL,
+			"%"ADRENO_CHIPID_FMT,
+			ADRENO_CHIPID_ARGS(adreno_gpu->chip_id));
+	if (name) {
+		devm_kfree(dev, adreno_gpu->base.name);
+		adreno_gpu->base.name = name;
+	}
 }
 
 static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
-- 
2.53.0


