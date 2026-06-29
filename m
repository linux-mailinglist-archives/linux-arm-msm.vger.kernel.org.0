Return-Path: <linux-arm-msm+bounces-115137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpIGOzyBQmr58gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:29:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC406DC0C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SA2t4ZUt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LrVP7Iwb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D10730E93F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A93C416D14;
	Mon, 29 Jun 2026 14:15:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1471416CF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742556; cv=none; b=kgWU5Du87m5T2eeg+NOpn4udU9mtTo8NN78f9JChnlLLrbYytMUAHPE2Birb4krNVDnbWWz2Mabsb4hn9SK4NetYEm3GdtH3jds9qojPDkaMQAwB1CFrr6Q5H4SqENXb5VLFCWmIcs5PmRDjNnOdUH/QglWTEnEvpX61q9GQI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742556; c=relaxed/simple;
	bh=lQ8XwqN4jWvRNOv1dfCYkUO2PgqLEmLGJMFc/jDV06Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bttru2Yhqw4ljC8gdr9v1YBM5rJxnb4uiGZrh0EjVk4Ih+jsy4ytIYXauf8L78kANyE/JGe7S6t1/f7cd1Y9zYxACb5q7320N1nJYj+O9sp5WQ/HCgVmH3vgtluW+oM06yXNvBiWiv5r3q1tTqVoud5lnJH4tCXXZz8PUfrGY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SA2t4ZUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrVP7Iwb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJjn2656107
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=; b=SA2t4ZUteBgd1rj7
	exIOfEuL+Aok2ShujCWlbvvvda6AhiJ40hpur1WIlL3dkN38pWH2G6ugvSrLRVAz
	K66uClc/53KCsLXztoWhIolhamg+xHzgvgSBTuTBATpNF8r2MNfnAbPpEQAY9yiB
	4aUtszoLhmFp4aRpcMRHcldGJIYUax84xmGcF4NiH7FOx963TxVkSuvTw1b6HCOC
	X8brI3y37VyPh2Fl46EeRKuXeHG04bs082sFTVWHSXdCVSKb+iSRZVNxc8X7LfOV
	o2+jKlRoWjxQxqJRFAIG2Hju0LumB600cHAO86vy+JVxvvO30+VpiPvGDHRKVdbH
	FCEkkA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7h6vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737cd7b76ceso612053137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742553; x=1783347353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=;
        b=LrVP7IwbkOzqaxMjYkVIhJTzy5nBfGK1ZSLQ5CEqsuGojIVMNHUocGsZYtoUIYn62C
         JbFB/Rp2Jjti7rXG07bVOdBkpDNNSuDfVKjV+hiIKhUmCNk+ZKpchhuqNwU8++iCXZLy
         MLNFV1Rw6DjqXVtjrIGJX2kVpBqGVwZpVEoTpE2KE9bDWo8c7orPRpm5zOOIdrtGOKbe
         Mg62QvmJ7s9NfOVkVLeHi2V8laNAXLotzJrBZxRBgjJjqa97sSsXdee5ZQL9sRSfF4j1
         UgmNRziP7cUXOI9c2nX0yDze4TaVG/avFV/xUMJDzyXY+7O7umtjPZ3fqt1L25ImXPfq
         c6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742553; x=1783347353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCpD6xAZSemtTL+9Sj4aRdpF6Ft4cWCqG/pZrWlkyU0=;
        b=bZ96l2m0oUab3uHtupZt3r4I5c3/pq4g26IAmRQPZdVwtz90Mfifj1QTqx2udYbxJo
         SuxVe1OKRDc70Xpcky1ZTs/RRvdtb0rdWl9zX/HWZS9Q+Vqc4/pJqL+rgsx28fH0UF8z
         fRLCuX/zsOWy/7XjU5oDYgJ/oWlK22bMDVnpZubulDpDl1+y3InbrKixiMf/KnmqFDa9
         k8NGUVxQoOISRlvAgskodvKNWHu8og4sQNkt+v/3SmXZGA/xBBBzyYf2F+BT+5EJuomw
         Rj+XqP7A03HS4cPMNr3CYWDmk0fT5p+SXSyegf1wSQwZREsR7k/i8tz5XrofgWE4mgwU
         hS7w==
X-Gm-Message-State: AOJu0YwmLOZtCY7lDdnKj9TFv1sHJKvWWQ+GtxLbPKpL5Gk9XhgJRdPc
	HoQ4lFy3cSZo670nMQ2mGz9mSwS36qP+0mIcqafB8D9OtH22PitAPb01Lc6CB4aIrjtSM0aWXp6
	WkhT+ulp6NtgkCg3GpG+i2+hMtvr1grKG5lEidJyf2Z0NxCuwB8aRacCV/nzM1ZNTDhck
X-Gm-Gg: AfdE7ckIZYuiW1XzDNAYGaH3hgeKmWueC5IGiaGR6j0fd5odgaCmaosQMz4x0YIXGxi
	xjh7QccLhUvuch0mOvPAgNfC1wli9w9ntwFcJIYfEPR9i509NBiWe0l091uZeDm3m7DdgyqDALD
	Yv5RheX55b8MijYq+Y1Fc57Bz3QSXoOZP2APnB+AJlWyUya2ambAe+l6VgGNN80+Briu5PPBukX
	3+J3mfmohokOZP5i42eeYX71SoBYk1OT2HuJSK8YFUPHurO2HMiY6Q9hxKK9Z0T562YG/AfO7DJ
	90Cy+xPZel4TkgQ6e5Rm8k4SFob/8S6K3ARsnH2+8ESPKbOrsB27+dJ/8puufGlDCPMQekUWJac
	VpGd3wLHsN+YGRMmde0GfY8P6h5If42vstZ62gaDFto2C3Q4WB5sOXp+SEETe+5Wzqs3k7A==
X-Received: by 2002:a05:6102:5124:b0:738:e37c:9c13 with SMTP id ada2fe7eead31-738e37ca631mr1294246137.5.1782742552737;
        Mon, 29 Jun 2026 07:15:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:738:e37c:9c13 with SMTP id ada2fe7eead31-738e37ca631mr1294157137.5.1782742551820;
        Mon, 29 Jun 2026 07:15:51 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:51 -0700 (PDT)
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
Subject: [PATCH RESEND v5 09/25] drm/msm/dp: Add support for sending VCPF packets in DP controller
Date: Mon, 29 Jun 2026 22:14:30 +0800
Message-ID: <20260629-msm-dp-mst-v5-9-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=7616; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=kb9DHa7CnMIQxIpNCRuaqgUzGVz97zztaJU+4N6igXw=; b=favLKT8z5ADUipsHj32imlJm6j6wQCmaSDU+332gCXCCvvS0jpI2inIiu1tfuab5guoHk7rwm 6FNsCd/qFGCC6SH71S9JsF6Tn6e+jXs+2u/fIBZOgC3wGo2tjuZrFyh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXwjWeboI4UAbC
 xzosrhN+Kk6bfEGdPhfvXXOcuVfcYQ4FtbJ6vH7+8PshVF/QipmG/bBWugf9TVGujITqCi6m9y9
 YeKXqFnej6XUPe2Nlaixeqgyh7Tl57kF021IBABwVr2z9D4g5/HYxBBzHmGes4kD+fLfGzoGuDw
 kxRkSmLd3maoop/xN+P3KWG4x7h7dFPHofS/G1fxptmE4hNyISxS2jBzBfkBfVKHENEMyWtgjLx
 Ik3VD5AMLBGBSkrF2I4OQ4jKe9RzxeB5kMcnpmleSYdl8rCq1YAJiTVIWOcmJ12dgOibArxZ+2n
 0iOg6tvvdQ5prpI6b7ddrlOqWkTI8CWkCesODnueW8hJZYVNGUgqwly+9thHMe4qDpRL8SeRT6i
 j22RsSzQEMkQh34eG+sXKnHfjRUar5I9ngaDHa4xaDYaEzl4/alsd3DbfU09RJ6xgsh5U3gS5br
 4ZWMOgCbsJkOKBEsdGA==
X-Proofpoint-GUID: 2okKkm-gTslTmH8jdDHdn_ND8EVKY3k1
X-Proofpoint-ORIG-GUID: 2okKkm-gTslTmH8jdDHdn_ND8EVKY3k1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3yKE3d51aFgW
 +FpMGkxn3XcJZrpWhkb3uSdhIBqiIHUDKk1j0Wf40e3DoClbEJ3olLzBTiM+XcZ+qApCOtgjS40
 TD7+1SlyChY9pdyzzWh2qhiC6vEx+W4=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a427e19 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=unrKvF7sv23klRea54oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115137-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
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
X-Rspamd-Queue-Id: 9CC406DC0C5

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The VC Payload Fill (VCPF) sequence is inserted by the DP controller
when stream symbols are absent, typically before a stream is disabled.
Add support for triggering the VCPF sequence in the MSM DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
 drivers/gpu/drm/msm/dp/dp_reg.h     |  8 ++++++
 5 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 15df82a0caca..c4f1a68b1210 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -65,6 +65,11 @@
 	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
 	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
 
+#define DP_INTERRUPT_STATUS5 \
+	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
+#define DP_INTERRUPT_STATUS5_MASK \
+	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -398,6 +403,8 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 			DP_INTERRUPT_STATUS1_MASK);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 DP_INTERRUPT_STATUS5_MASK);
 }
 
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -407,6 +414,7 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -426,6 +434,20 @@ static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
+static u32 msm_dp_ctrl_get_mst_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS5);
+	intr &= ~DP_INTERRUPT_STATUS5_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS5)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS5,
+			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
+
+	return intr;
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	u32 val;
@@ -525,6 +547,34 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
+/* Must be called with msm_dp_mst::mst_lock held */
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	u32 state = 0x0;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		state |= DP_STATE_CTRL_PUSH_IDLE;
+	else if (msm_dp_panel->stream_id == DP_STREAM_0)
+		state |= DP_DP0_PUSH_VCPF;
+	else if (msm_dp_panel->stream_id == DP_STREAM_1)
+		state |= DP_DP1_PUSH_VCPF;
+	else
+		state |= DP_MSTLINK_PUSH_VCPF;
+
+	reinit_completion(&ctrl->idle_comp);
+
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_STATE_CTRL, state);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_VCPF pattern timedout\n");
+
+	drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+}
+
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
@@ -2994,6 +3044,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 		ret = IRQ_HANDLED;
 	}
 
+	isr = msm_dp_ctrl_get_mst_interrupt(ctrl);
+	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
+		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
+		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
+	}
+
 	/* DP aux isr */
 	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
 	if (isr)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index e1d10ae20f70..88a02d52f61c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -27,6 +27,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 36857d6ed313..1af56c84b82e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1524,7 +1524,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
 	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index ef2ded8ec4ea..cbbcc0dbf652 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -39,6 +39,8 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
 		return reg;
 
 	switch (reg) {
+	case REG_DP_STATE_CTRL:
+		return is_s1 ? REG_DP_STATE_CTRL : REG_DP_MSTLINK_STATE_CTRL;
 	case REG_DP_CONFIGURATION_CTRL:
 		return is_s1 ? REG_DP1_CONFIGURATION_CTRL : REG_DP_MSTLINK_CONFIGURATION_CTRL;
 	case REG_DP_SOFTWARE_MVID:
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index f2bd96f3bbd0..ade7b362d650 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -42,9 +42,13 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
+#define DP_INTR_DP0_VCPF_SENT		BIT(0)
+#define DP_INTR_DP1_VCPF_SENT		BIT(3)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)
+#define REG_DP_INTR_STATUS5			(0x00000034)
 #define PSR_UPDATE_INT				(0x00000001)
 #define PSR_CAPTURE_INT				(0x00000004)
 #define PSR_EXIT_INT				(0x00000010)
@@ -143,6 +147,8 @@
 #define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
 #define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+#define DP_DP0_PUSH_VCPF			BIT(12)
+#define DP_DP1_PUSH_VCPF			BIT(14)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
@@ -368,6 +374,8 @@
 #define REG_DP_DP0_RG				(0x000004F8)
 #define REG_DP_DP1_RG				(0x000004FC)
 
+#define REG_DP_MSTLINK_STATE_CTRL		(0x00000000)
+#define DP_MSTLINK_PUSH_VCPF			BIT(12)
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
 #define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
 #define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)

-- 
2.43.0


