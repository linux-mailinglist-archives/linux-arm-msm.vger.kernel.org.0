Return-Path: <linux-arm-msm+bounces-111262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kLjSE6jbIWoFPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D814D6431B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BFkww4E7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iWLBoyvD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2246330347D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE813AE703;
	Thu,  4 Jun 2026 20:10:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C83AD503
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603814; cv=none; b=WejQD1WgTDTKtmaFPzjChmY+pKZ1x8UKtXoMI/nmntbzKXd6F3ue4rIEzBnxNgj+1e10wFYSBe5Ui/EaNPbQCPmEz2pYuY9l7SPhJBu2yh8AeX/lrQ52Tlbu3HNC63ULRJS6A5XBnLzF0ELKbJA5f99xnLrvgbszjL9H8qqKjDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603814; c=relaxed/simple;
	bh=+zvEwI5qWeXADBSn5KQ1PAAxZHkjGUPloIsHC/SYsTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YuRFTDcvtG9gPnfQlqoUPiRC4U1M/oZGr/yuF9+kzmdZx1fJbu57lvJzC925o1aHYcZYnSYp2ShV5IsNV/nUXivpxkh9iW9+jM/kSzKM/OAFplSC4yxDSwtxoIH++dEfJxL6GvJU5DyL/I8A8X8kaC2rAV8thwbwvse4LBIekHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFkww4E7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWLBoyvD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EprXl529671
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWmDJM0N9mm3A02aZeVYmXR6PbCLJg/3M0xQs4mdPe4=; b=BFkww4E76r5J+nhc
	RJFp1m4kVxLhSh6s+3PZc4TP7yxQng50Gc20pAM17T/QZYJEc+26nQYuImhwgI6u
	Wv+dz3JpjJfpasuf6kyEpSpAi+LeVoUIIN7G7/EblkUOewrWJbmKM7U2o9hR0fFX
	1jhGWg1OPQY64dLohg5nASQsy1G3MvbjceED7QqAsd3uzzJ34U+q+y7n5ry7a1WM
	Wzc1T8+fEwsulNdqvqzgZiwhqWY7sMFJMNWBo7cFcveKYnRAuwjhrLqI2cr0HcBK
	uzX/A0c/Yfn1kWuiQfb2Zh52hAKBGU4hd91yIBDZrdrYLMROUlpij+ep+/+jHUF6
	Jmxh0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdshm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f24dcedso1378925b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603811; x=1781208611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWmDJM0N9mm3A02aZeVYmXR6PbCLJg/3M0xQs4mdPe4=;
        b=iWLBoyvDoIdxN3hdK3iJCq+b6KaoJ7i+EN6NfgiOkYplo3f6yqOqZ8y3faFzhujrCv
         koxsW141Av3ZYLAf85y8JToaFNTD2S9mcfOhwFFGVa6sg7Ms5iaHGZrJm+95jZSbIbWk
         8SHPRAbv74SK+DT3LxQ1C2swIt07IKWN9QLqW6g0LZkMjlHj51I2cAjTRttUlhGOfXyZ
         XQFLzWt2Ob6yY9o/b8Bk/QtnGkEeQRukK8/dNFTSVa+tEVaE427ddcCtWRIgDPQv+rZp
         u7Sx4JYVcacvekZDPrGCNyOHUwtGxZPiHYEArVKsYflV393e/QVwEYZ1MWML8fD8Tcav
         ahEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603811; x=1781208611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mWmDJM0N9mm3A02aZeVYmXR6PbCLJg/3M0xQs4mdPe4=;
        b=J3c3HHO0kxxKnmiW4MlVhQaaZwp1zH9dbOB8HR5RUCsArAyRGL2cIVAxObQAJg9O+1
         M0ChXXsTwpe9ZXrWNgU4XmGujMZRH9tD0ax/fmSt9x6K2e8zyKwMR6xYRUby9XZh8eYF
         ICi+Ag1sQc5SxjANE6WXXZA3ZVda28qYfbU2kkTYUDqRXWy/rvWweRYlRHumYRRIqAG+
         QJLrIiu0IWZ7Lm6KxR8a2KfbmUqc/PaXApl4ewkUWoMSRpC3fvQG+Tkj6VCj6VqmfIRX
         7bSa1beOtFbbqiupoCzLk8guFu4MRUjKMQItpOv7dqcITlfPWxr6xWJk6l9NCNn15J30
         LTew==
X-Gm-Message-State: AOJu0YyKoK9igO8+/TfhgpYevMzT0XyE1KPLRi9ff/FCM4gUfcxtn3k4
	dPusWo0TJDQpl90XbrQMaYGn8X45RTqAP4uc5ggMr3sMUNKuaGskHwOTrypaFlmLJ+DTEFm2Iug
	gaGmU0pC8O+i11GhtFq41wU3RMAcGPiWLRiK2mclfuuR71xI3h7rcYjtt4FqgomNNeFfD
X-Gm-Gg: Acq92OFUOEM+4MGjAMNufi/Gr+vJ19ZQaeQKr6SgrweI3Y+iRTaQy2ujO3TQNTjB/pK
	GhqpqMGdjXs63GCEXH+9fTek8U5Mf6UdvAEuRL22LUqLPCJsSk/E5Xj2w62v7ksoc7t4smZ6tAN
	eR41/HuOu5rESUQXIFF6B30iw7KUOobDBb9OgdksAdzH0zVmR0Uw8VZ1ljGCgZ8LB9FRqSa1Bn+
	3IjIW2tAajSSrcjgmZZ2xD41oU46A0HBWixkpse5DZDlNZHHAq4rySYCpaC2TPteElXcTCv/bYv
	53isWXE9FyNXi9UGrmicMsFBV72j2RpamGErnhchi4xjABM7lfuimccvnfy0Kk9btUvq7p5Uwjg
	vC7QWAGRLnpq2jENp6WfpDUFznynNJYZ/wqaj0I1SsMKIVFrdtVHfaDjJ
X-Received: by 2002:a05:6a00:2449:b0:842:38d2:a358 with SMTP id d2e1a72fcca58-842b0e3c6c8mr236284b3a.26.1780603810785;
        Thu, 04 Jun 2026 13:10:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2449:b0:842:38d2:a358 with SMTP id d2e1a72fcca58-842b0e3c6c8mr236248b3a.26.1780603810290;
        Thu, 04 Jun 2026 13:10:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:17 +0530
Subject: [PATCH 1/6] drm/msm/a6xx: Fix stale rpmh votes after suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=1319;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vnWI9LofjIKiQz+B1zHq69+BxcnVku90YJ6k3gZAcg4=;
 b=mWPf5hC9/oifI5qgbqsc0PZQgowmTz6CJSuJvIDfT1BB//5T/7oslABaYdw2Y3DCO9W56FEwj
 JVNTsphmWo3BmF1WMmk0jVcmEqbG5VAHnu2f81rVewBv3Xuzl1wESbj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: L84eWKICkxQYiXQhZybsDI8au8nUX2EK
X-Proofpoint-ORIG-GUID: L84eWKICkxQYiXQhZybsDI8au8nUX2EK
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a21dba3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oU5QhpEZILUeHJGd72wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX/upKsl8yb1TH
 30Lkcj432hviGpx1I031yFEZWJ4opX1q/5R06KgVf4Bw19E1abGxaEPpLZIy4ODZlnGkvhTjRUs
 aBwg+rBkWBa8i3R9UJO0gzTmbau04o1njBB+n6+HendNvmfi0HZl6GA4K6wJhuh8dMO2rP3PbNl
 K6trbNjHF9U8S5U40qVEUwsKVYHuksMH4O+yyp4HYpg+fGMujT0uhwBb6FPh/nNXc5ahO6RbFG5
 XtJvUCxW9fbH3bIcwoUOZ7ixrq8W11oErWW4+UASGnLirTDoi5qdytGYm2Ks3CAooMiWF48smip
 snoeiXZ/jpHR8ulg2BT8NLxs7nhleuGLK697ICw7ZYmrXfZ/u2cn+4kA3oKdCz+n/md6o0Yu4PO
 BrKAMVuS1w2kUHERZNhhcUs4KbETFXuAa7jUP6YDUaYZS1DjDTBBGKg0Vs9a0ApdjGlqSjoP1az
 pueDrbh4l7Zm7AvGw4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111262-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:shivrawa@qti.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D814D6431B0

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

There are stale RPMH votes (BCM votes) observed after GMU suspend. This
is because the rpmh stop sequences are skipped during gmu suspend. Fix
this and also move GMU to reset state to avoid any further activity.

Fixes: f248d5d5159a ("drm/msm/a6xx: Fix PDC sleep sequence")
Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2e5d7b53a0c3..a2f6918c4f7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -642,7 +642,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
+	if (!test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
 		return;
 
 	if (adreno_is_a840(adreno_gpu))
@@ -1465,6 +1465,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	/* Stop the interrupts and mask the hardware */
 	a6xx_gmu_irq_disable(gmu);
 
+	/* Halt the gmu cm3 core */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
+
 	/* Tell RPMh to power off the GPU */
 	a6xx_rpmh_stop(gmu);
 

-- 
2.51.0


