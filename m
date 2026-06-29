Return-Path: <linux-arm-msm+bounces-115135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gcz9DR2BQmrx8gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A275D6DC0AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:28:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XYtQv2uS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="GuI7qa/v";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115135-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115135-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE5FA3238F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8A4404BCF;
	Mon, 29 Jun 2026 14:15:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06459413D95
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742545; cv=none; b=Q19IpgFvbST0dtBLAUk0vAoaPIUeEWp6B9vYcfBZChu+SFyT+eJw9VhFX9u4wNQ34vI0lOboo/yMYuCbHNKoYWY1v9ejhu9qBF2Ch/dD+r7iORisUHDDpvkHTWxU+8G23eZ5roZ6nAmKijI78KxbfUebQ3X6B7oAAbindqY8dWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742545; c=relaxed/simple;
	bh=92SBcbOJz6iW/NT5A9l38IM3GJXtNmfe6y+JjRLW9Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1MP1U4S/nHELt7ycZsnnZVuU07zq2zsMsCniarCb9BBIv934DhWCbHhmVDATVVmYDoL0DyhW/FdWLk0AuGf+fhynX3sQy43ldJYWRuHLbltOoh9+n94YIgCGs3LacTEMl+FeeEISm7p9F23Gv0/ugRVLApNfD5R8lvWqwkMIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYtQv2uS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuI7qa/v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuxS2640954
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=; b=XYtQv2uSmGPl+Zox
	y2VrjvA0N9uzmvVgMBzrZ79FtpuY0wFA4RvfwTGoPeS4c6DuQuC6vBx1SZ/D97II
	IAow8yBW9dEle6DTqNjTJIW90ZqkM8RFgoUPv6j9EMo0+nguGxCNwP8zPSChmhDe
	BAus4mR3yqOxbrYBf+zHhAd7mkwwVgnbCoRnZwnsnmPxS9q4ti1OmfOYB7TrQsfr
	WXpylbGQ4aox2BqqVNMrp80xpfayAR6lcKoJUFwVuBj4dnYamqvd3abv/ckj+pk5
	F3Bl4GsDTzXifw1yC+HvdjPmAKSdXv9pxvVp785hKt5szqiBvO6IB8fg83p54uxN
	zZCbqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1c4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso34326871cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742542; x=1783347342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=;
        b=GuI7qa/vfLcGUTO995fhjJdVborEW8p7KXJuxgkZxrPFsMF1hneuoKFY3Fy9/iT2E4
         vmyWw/A3DbO+C/GoqtGM7YEozY0kXXMo2tf+j2lIzszmUHfeWPj4w5ZUA6SHOftgECir
         Jt2g1yjuzJRT/h1zy/VyHx4uYGmoqDBkJSziB8Oeea5BMf7K28SYISc3VdYJGIDyrbu1
         LUtWSSBqGeWuTT/rPToAYoZjRVN6uDX6MhfrA1b1hjwP37l/Hh8v0u1I8pWGpDciJPaC
         1RoKSZS7lhztK4ky+MYjIgoqiv2kPIF8alTbOrBTxFcHH3VyQxeKuM7eBrJsKyQU4E0B
         SBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742542; x=1783347342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5iB5ejigL/1+7eiQKKge0TAmtZoQNU5D3awPHwLiWE=;
        b=PDIRS85uCyMWu4SrkFy+jFZoxT7poWnkoE0chpKV4vwhyL7trlbJn5i2X/DQzfTCz3
         /trqnXcq1KHGaU1OdoZrUjH0pO/odCSGaHBl6s5VPdImvd3V4DSgMoa94C7Jv8wRyZr4
         ++dnWLDDvmACjOO37uRm32oYP34pGfw/lxzdv35xdZRM2mE2K/pwHmBztdBp2bEHkiwC
         gfAPy90a3MJvvxL7nkhCMXfl5vvv6HCPMCP553ZuOYJpSXkMue3FtVR7KeLcXcxBSW/7
         DQVismS/aHuFui3wk4KII8bsrkMYedugF1gwrXhN89WyPcTsshn3QcagPlyXQcttlazg
         B+iA==
X-Gm-Message-State: AOJu0YzMBBGItdXI+b8oa4TOEDiQCaHMjq4PlsB795nY7vI3OJPncS0U
	rLzZRHz+8P+gEagl60UDYMFY++Tg16SQ3xSw45KWgEwYNG0AubuFss0KsvwrGyl5NgXSYdHsgol
	5ai63t06Yvt5CS5GaxDTzeWlf062VZBC2XbQjxU7w8w7HrA1eKWbOTqoFRcYWDP1yrtuI
X-Gm-Gg: AfdE7cnCjXJB5lnA2qHZx0NMfcqBxiS3skLQnrpF0dbyUeaOGYyUdXxHB/4qcCKOV4k
	eTZC62VGWhzYN68ieKG+n5afoqu8qBhgTPY108nqIi0O3mT5xTk5koE6UGCZW3yuwZGDBmMNTRF
	TRPVoArROouBUroCV7oNea3MYULB2kR6IfALjVOLxAI31hx/ido8zjwHV6c+imxAOMtDmK/OKCI
	AzIYiMZcZnG0spPMepL3NtvW4TfUf5l8ZWSmj+iROd8/ej2AUSiH8skqoorSbjiDNYOeyQFbJmM
	i3igttGMh3I37RaM3+AHPiR36/gS8ToF1k60AN+svmMgG0F1hr/LJaPP+DHhgil2tJd87MhMR13
	qUJnREB7AaXa4d0LutUr3/eid/Ydad+KgIpzx669sXeVGWhiX2AsvfZCed1s0VFkdZKiqVw==
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9293b56debamr2574614485a.7.1782742542065;
        Mon, 29 Jun 2026 07:15:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:90e:2f56:2f0b with SMTP id af79cd13be357-9293b56debamr2574571885a.7.1782742539230;
        Mon, 29 Jun 2026 07:15:39 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:38 -0700 (PDT)
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
Subject: [PATCH RESEND v5 07/25] drm/msm/dp: no need to update tu calculation for mst
Date: Mon, 29 Jun 2026 22:14:28 +0800
Message-ID: <20260629-msm-dp-mst-v5-7-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=1019; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=hs6YElQtz09tmRSdX6C0+/uz+2FoQvn4lT6aOIb3i/U=; b=a0/B5qGVbImROKqW7HAWX/0q6e+2EsU+iQYHaYgGRbLSjyLKL1wAS6ZNeMvivfOwQYZD5CRZv YqT+xnlXAXZDfV6dXbQEG3MrFj1XcCUavtN7wRDrqnIJwjeES4qbhFC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX4hCLJr+1ALcv
 U3+foJItCs2bi0yGY+UHxfimQKmV42ir6ABwna7D6ZvtgXrAN3riN6zIHXOjH79g6UyKglNkLw1
 wQmn02VFVpudkocXLhdoVNyLnU6e1nc=
X-Proofpoint-ORIG-GUID: onDVOMnOV-adquhnXD1Z4kma8JXqglKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX0twM7CBD6K2H
 N1ptyXOwHThTStGTiCy98/ivoKcujQaj/nJZyUkhDuynfJH8yItYLoOEpX9BEvKW7dVWyowbpE9
 Gc4UiDrF/A+gnLChl/WPEd1MxrfaB1QL9UTO7aH9HqmRX2N/wZDWn2j+eauXUFSIk0nVviYVToC
 RxhvFUx4sC0hbKGXwcHfQFxFfLQCxivQA5DPNZq/U/R+Cr4VWxn0JUtg5Z8FjZE2wpkHNGj3jj2
 DdK7/d+Vwf1XtWxaEYYgdZB2RXoFPihQLJ6o6S1lNGYBRiyk5chxKAg042qc2PF0P6bdoW8HtuD
 +gPt4DFzpZplbpP78vPYhhaMoPxhvV/mel5uYEennXtifdszy6CUK3/KXs2AkHpDZ8yL3M1Aabr
 Fsz9DNCCnQyb6nhnmaY9e/5SH9Bsc8WRaDGL3BPpNyMAnliJoWy5NXlvFPHkUi2XRdYp7b32Wxg
 xebfxo1ryhuEqdtC14g==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427e0f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: onDVOMnOV-adquhnXD1Z4kma8JXqglKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115135-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: A275D6DC0AB

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e9aa0e254234..5b5149b160df 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2705,7 +2705,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0


