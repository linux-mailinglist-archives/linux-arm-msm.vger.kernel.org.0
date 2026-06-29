Return-Path: <linux-arm-msm+bounces-115142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /eMJHPWAQmrj8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EF6DC07D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="C/aQkzxo";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kQC17KiZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 583BA319C3D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A12410D37;
	Mon, 29 Jun 2026 14:16:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F9D41931E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742580; cv=none; b=Z909RqXGoXPZyoDKeOFSAWAnoobKkoRI7SP16bu+6qsUq0F5lj0rqVy2g04Pretn+ea0eLJkGUGgKlBKfU8dp0BEj9w270RbXdFOVLICW6fzhwpRixcbcRdxThY1PRR8sGvjsXI4W2QEfwZG84/eYlP7PUtFXW+SzdR6DhjWLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742580; c=relaxed/simple;
	bh=xGdkG90URTLG388tBIYWOwsvVzPJImnqlIcHGWOZa4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+B2kQoDUixmsTAV+pjGaHqoXeoj70KvIxFrPN0rNeTczr8KC+2Xh2mhNQYlJk+i9zVg1Ep1MDupwVLaBCR+n4/F/TXhi4RP/3dlpkc1ONPZWKLnMUkw/47jM0BIWfslFkAeDnnQ+NTnQO0qjRrcH961rM6lYAgczxw6cW1NfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/aQkzxo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQC17KiZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKUf2579321
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=; b=C/aQkzxow+Uydbtc
	4d5z/IUkDncbMGn/V5100zatjQCd/sEUcK6jiV/tFXfRPokl4Gimz6gSM70dILDT
	pwZUo+xwqc1G2Ok6vRXR/6+Me/+8lYzO3k+1SxaAu1cdzxzbA5Vqm7No5CFIcvXb
	evDuRZIsqhOp/TyfHn2PLbvImoygC1HYrDUb7dV8eYBjTBRBdB1U4Bc82NrIomtn
	09WnDnJI+ku8Xl2lkkGVarIStoER4/Boxkqb8oQrQjk2UWxWambZkU1BQM4egmxw
	1Dy/tYWc+zh4UCYfbIra7Qnu/l5xEZQgClbvZygtEIoFqpBsJafe7JSYMEfJpL5x
	yJogoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hqwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:16:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso34344551cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742578; x=1783347378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=;
        b=kQC17KiZB1Ue3ElhfHFHC3Z4BNdihhXs0D7ht0gOET0cmlPLapgY/6cVa4u3Z9wvlB
         9FOSfAtO0V5D6vuzOpQaIpqJxX8AOeaNt5ez/GFM+YLzClniUhg3MupPhCUHn+yYxFaU
         jnjj4qr0xtdNCemO2gl0p3n4mSTa5EzUzMJRSC80+8pDg45pfqjvykIkirzb6HPlcCH2
         NBngeBpGdnhXuFaOCUrtBUsdFBnK8808N6qlgXEEcKlUm6KWXEvoKB7MfcAosAAo/S5C
         KlquRJkioqpBn1ezh7xF/zFXluUYtbVbzgjTa9RUBJZS6FMha4dCOr+IxkzlLAqgKRwR
         5BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742578; x=1783347378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzV7EjoUtPZtDBhS+QkVIWq9FjNr7Nkm+r9qnzqK9RI=;
        b=FixcKwKSSTN7zs1KGsX2KLWkTlu6BRiEgpnzOX/kCOOE5pX9QLWK37aHLFCeP2DHqT
         W5Wwu+mi4g4cl2BOhes3kdk0GViwF+J+DqfJxQpZJ6sYfeOnKqtrXxtZU31zu036+H4c
         NpCin6aFQLG6DlW8dVNf4qiI2Gbl4w+91pybN28fAMYY5G5YzGVjYpU9DXBssx33i9y2
         1cLAuSJU1TiCLUpNZRGZRzbtvcobut6W1XkWKhsGNLBRSO4halZxTIEciic3PorW4EDL
         DDZWKNWc+kY99S0lVZlwxl33UOmhjXC/g07A7Kiv/dJxKK78txNDGtPACbH7tlmtW87C
         NlDw==
X-Gm-Message-State: AOJu0YzlagDVyzO8oX/mYuSK2nhn1yGhB4TneyzgkAOfYzyMBSMljL+O
	y2iiX1pzY4Sja401IKyxn4OHinm5ZaFgzrcnyPFWLbYZqDyk6ShnRtqrBVMl45xIcA10YJ1kRWC
	DR+87oW2cQO3Xj9X4JWR9NfE24uqXo9E2ZKdjV5NPXuwQNQaqUizHG+m+kGrT87InPTaX
X-Gm-Gg: AfdE7cn4Lbmjbbhykgochbshet75lDSn0htnI5FYJab6PYzy5s1iNmrnri6bRIKghCY
	TVFoWqYTCiavsDPNygufOE5lkjkLCjHjwe23AoWx9oMOL4dWQ4OBYt/3zrAFDGnaZtRpfvi/Rc4
	IaBLttjC9m3jPMBIAfwWTO5cmniwn1yj4LZ8Khc/yDEO8y6NTDvKId26Seh1Gm12jxkjYsSvAo/
	uz+cv1ZZWEh1llUkTVJx2F+JTzAi2UhGKrT+ruE9eBNQc6yblhbztZevycxJzvEzrp9bQB57UZl
	+8cn5xJ3F/ltBaitLozVpyvKja64+ooLr38X0L/fu6+TomAGfy7eAMoKvOR+pAj5Zqj3nIQ7zjD
	iOhnYLBTHpgd/gz68a5ZAF9WVnswUi2EsV1gLOK+KY/2CbPJvKDnNmYiTvkrdOGh71yZYmw==
X-Received: by 2002:a05:620a:a187:20b0:92b:67e6:8ad0 with SMTP id af79cd13be357-92b67e68d96mr1066013185a.74.1782742577562;
        Mon, 29 Jun 2026 07:16:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a187:20b0:92b:67e6:8ad0 with SMTP id af79cd13be357-92b67e68d96mr1066008485a.74.1782742576862;
        Mon, 29 Jun 2026 07:16:16 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v5 14/25] drm/msm/dp: Mark the SST bridge disconnected when mst is active
Date: Mon, 29 Jun 2026 22:14:35 +0800
Message-ID: <20260629-msm-dp-mst-v5-14-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=1381; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=58ED0OzaID2aMTdkIIoG1uZJg33GpZvfm1KUdw++Gl0=; b=NMzV59zGTHfrWhtG10yK8tnZsbQ6SaBp+gphao9OrtwIPYCW0QlpNGrn/y6f3zNEATT90dzgn 0Vg4fKmrE90B0wHxtd4foUZr+l5s33Gq+o59bEZmKv0aNlpldIYi6CP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX2gud7UTmLfkx
 WutwdPMELhS/cBA28J62Z6O6ZfgdYwHCGBWM1aI7zJk0enGCOLaeqadsWuzZpyk4rJzXj3DBSxE
 gI5JS0kWPzvM87tqEVVlVsA8gav/z6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX8ESIiFAn3fOU
 tHiDBC+mshNt/h093U22Hc3m3SUBtKMBkT1Z6OJ7YclDiAY9qgHFUc5NbthkazskjH+849GkySu
 A8HH3qYWcyZg0rJaN+n4yK8ijnkX0CyEHSCam0/P988+0z5AVjBLDizBC7ln9iXbM6xAQihrww+
 xku450U6Z7+xs6XoSMHZtjVcTbM6GhsrhPjMHcElZ579UY6fr0F1eGKmFmkt/TIRrFoTvFYFpVc
 DSFcrZXHPnT4rb8zTDZ9jZvB2vr4tFt8am7QH6cy12gmYKqfknBmN2tlHi8twfRMeDC69Q/KtXY
 +5crH/xTlccV1yPkoyNGZ6siY0u/9XA07ousNGD2n+zGSPavTERJ496xNhHnOshwM1sxIZWQa4L
 GEYbBBxde0ejBC8mH/2LOyjCldaYNO0GVJt/wFpWErTT5tbA0/YRMLZNLB8F5owaw7TMVCEgVVp
 bI0V2mRATtYF8q/yPXg==
X-Proofpoint-ORIG-GUID: NjxeTkMZrRSixwsvTw7YhCglGWtWVevJ
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427e32 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NjxeTkMZrRSixwsvTw7YhCglGWtWVevJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115142-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: BB9EF6DC07D

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skips detection for the
SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d0081ea9f5cd..5786e598a406 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -910,6 +910,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
@@ -955,6 +958,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			status = connector_status_disconnected;
 	}
 
+	/* skip for MST */
+	if (priv->max_stream > 1 && drm_dp_read_mst_cap(priv->aux, dpcd))
+		status = connector_status_disconnected;
+
 end:
 	/*
 	 * If we detected the DPRX, leave the controller on so that it doesn't

-- 
2.43.0


