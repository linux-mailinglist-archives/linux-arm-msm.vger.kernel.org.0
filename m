Return-Path: <linux-arm-msm+bounces-115156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3jqrHayBQmoc8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD66DC10C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:31:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MLD9EApN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BHypE5IJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 834233066B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A354192E1;
	Mon, 29 Jun 2026 14:17:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D61426685
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742640; cv=none; b=dwRgleQKZv6vDsBLpeJv70FhBVH5itp2S3SiT2ATXyp8Vl1MnYkvj8S8/MXv0c3NlDCHJDyVMYD+gs8htEdE8Y9leDWEeGf6sZHp8WIuX/u+yqHSD04gPyVeZz7YD8thIjqXMpRCdKRRLWEweCAgvz9HyicfDRIEwJ5g44ADSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742640; c=relaxed/simple;
	bh=jgLawUeJTUEQ/LNV45pqJIuhaVIzKYq8VTCWBkSwzBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+Ssz4imJzX4eCZDFmcmD0KcpHQuCkHJUMvMlvwvShYHz9Ev8WOm4ERr0tqQtaQ4v0CJJ72jO8Bbx1GSkhlUOnK67nux9jWSMJRRHeHkOYsrfIcl4nz/MCRYG6rpekiPafArDAmAPPzpolMBihlBT4aFsNp48YCYUvX0K7daGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLD9EApN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHypE5IJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3uT2646903
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=; b=MLD9EApNBZEhayGF
	s3WgMec8Ij1hV63HGQZvte56NS0Ex9PbhVDV1mZPYFKhgSJktvrMLNBkExLP6v6y
	gVl9b4ct1hVicSTLeNW7LQnEGvDPWboZOrIG/itXcxtyHPbTyOXL1OFLWcUd1xAK
	MnlN6kEPvIZGEHeYa2svab8Lz6UBtJQKZV+pLAuo+1ZWj+A0mpn4BHLWo6uPOCl2
	7n2VWlvAH2qkmqM9JVTAoe+Bpgt/lUvH4Y6Ajt81mzP748H5re8xK2fQ8TzGI9r+
	blfh4NcGqZ+UyFlUD0mtwTs8ICceDuiUTElL2n/TYUvPUG3xqAZovFbOCXJVyneT
	gqFA3g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsnw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee40bceb55so44965046d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742638; x=1783347438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=;
        b=BHypE5IJrlbhy0EdjchZ8jbfrjCqCLy759CKfUbjhiVj24XuYk5BfBPZ8RwSncF5fo
         jSHQzpcOJAB34fRHP6J4qszxo8XukMdInJuwhydnnMnn2YVMwNHsvrVZDMhYnZ1Vntob
         vNNQB303O3EaSO1KqGMrrlwSMu+236RtGe3YG8qbKfBTkyHqhxR/KcW5rSxZHhps902m
         KEjJkesz5D9tKp+jDiRf3rb4EXdVA4BSjmIYojOwvwOBORwxfLwVft0OF5HUWDgTsN0j
         ZMUy6Xp53idizFy62BAk4gvwIqTgiprAqiuNokNBJhOHTpSP7ylOrOef3kvXLIYhAjkc
         3AvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742638; x=1783347438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/u6JPc641J8wBzj5j0oNFgP8pVVYegd9kCes0Z3CLU=;
        b=rOeW3Pmr+HfD8LPjN/Zi8BNozFUFie4DBjsQmbp/WRGvAdgIKXaNSVo+Qj7sqyYxhR
         zYDzrav/P58EC+WY/ufz/m/mJ99FsJONeENC/H/8bL3i6Fs5W6tYTgRKLkLjtkwTMaWF
         gV1MIIkthlXRWDPr6RyU4qebKd+K95zQQk+0r9EUUgtLgEthrL3JIN0blfzo27N04XYd
         G4CjcUAtR8bKC8Mcg+Q5rVeB8+uMuuPrwKV8vSp1yeYAfVNycY1jBwZ7NuhkCVCeAJ3W
         yL0gln2kWgtZW0/7Y1EtYjR/iQOG+2CKsp7H+5cvtpyO+aHv7zpbTwW7YnT6uj6iXsD1
         J2/A==
X-Gm-Message-State: AOJu0YykkcQ5YPV7Tx/RP2Gya4dqTGz6KuceyxGH1QIslDkgbzgw6wPK
	ePZAyDC5PxUNFUTz7blJEZmdzCSyc59poe1Bwz2lVrzBpUYGEnDPzwMgAvmqDfUSiZ0oKtOFTZQ
	GjM74o+xhLihWg9AIWXiAoss3hsNfiK0jaoCRDmsIUo59/M/UfdKV9vXuChp739JfPmvw
X-Gm-Gg: AfdE7ck3AkhY11hSaRaEfcwcSyh8kKSWdcMCOJhLFWEWiSmWCeVgT9qqCus+rId4rXj
	UoAoowMo71DTONuNzhVohHaRaKbc8OZ/GWgOucXlvcE0soFUQYjD9C8zGx3tQILQFarO1iV20Fd
	DG4l58uumRZja0S2yRgM/1mU6OHcXhDzgY/PICjcabMXUVSR78rUSqyXmp5gycDs4BK86A5Cy8f
	S1bygtH7Nyxa+UILf4aoMEyUd5hifsQamFqU4O26h0DC3gO72wXg7NEGnV/AcQim5iLEEh5PzjV
	JSsnxvQ6vRdCZcY8PbmHyqjGf2QaBqGk76Opm2DLLXuKXK7kuymU08kv7HyJsISSlQIV3zWp/tu
	x1AyWYnaWWwPs0p3de9xt7nACdQwsUNjJ3rXEcLtZEHZaJb/yxwt2/dS1grBTUae02wM+tA==
X-Received: by 2002:a05:620a:7113:b0:92d:d721:3fd1 with SMTP id af79cd13be357-92dd721454emr1060537585a.74.1782742637664;
        Mon, 29 Jun 2026 07:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:92d:d721:3fd1 with SMTP id af79cd13be357-92dd721454emr1060530685a.74.1782742637124;
        Mon, 29 Jun 2026 07:17:17 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:17:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 25/25] drm/msm/dp: add HPD callback for dp MST
Date: Mon, 29 Jun 2026 22:14:46 +0800
Message-ID: <20260629-msm-dp-mst-v5-25-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=5643; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=b+G2f0mUuFh+XGa6ykrKQSB0dIdAdRaLzVWlRhztVIc=; b=pMp9/Trp/gclufRffFOYc6B9d49s9r7PIzdz4dDQACGjyqvLHFUEMD3EnEcqyZ4eyM5Yz21EE 0NAmDEiTz71CqgJj59RBm/9Umty2mnt78AADKZo6CL5r7lY04OHnFLP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7bIwX/qBTZzX
 drUPcnW1n1/d5TIfBCJgiT8FIGaCpKQX53ymazWt54DloNO4QKCnEfIAGGWXoewXq29p8yGY5Xg
 K/nM0BgE/3zlXbQiBcklMv6b3qLzs5eWjNWu4GjDZzSSF5Lsgt7o/Ei+usE/QJ3y0Lt2GdPQnCt
 AfUX9oG2D6ZxA+NZJ922MqvyObAzaWn6ekG9peOEHzrd95igkPigQ3yHtAw9DzkaynLTHJ0Yf/4
 TcB7BLOrbu+2QUAO2bdzUDvW1Igci73xoPUn3CNZgsCw4OUqZADTNUfr8Vo6o/rE72goLzy2pIq
 5mAPASk4B87mnWQgCCunPzMRYNRs5WBzXJE0sC/IJQooX5BW1g/DE59/mhEqk9x7j13w31IZaVd
 /Cy41C9dt6rTTt4O+6x6PtrRbHTcxPrOE+z7hxYfqMHOmUlzDhvPXqsSjqOAHswCVp4WFWjSHn+
 qyvBjybh3sRFEySkYfw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a427e6e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cF23hRJ9h-J1zlJA4xMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX5IEOJ3UTvz9s
 i2LQpwFbNzqQw98q2r1hJJ55Ea3IMDNJpIr7jtJm83wSEWZ1RQIeOVtqt2jaEMbCv1++oj+VmxH
 v1MiACZySVCIy6q8htGmucejBlJzwcQ=
X-Proofpoint-ORIG-GUID: 2PcrtnGakH5mVee-0dizuOM-kcjHv4tv
X-Proofpoint-GUID: 2PcrtnGakH5mVee-0dizuOM-kcjHv4tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115156-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: D8FD66DC10C

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 46 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6eac390af2e0..49a7bc5e031e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -455,6 +455,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (dp->plugged && dp->msm_dp_display.mst_active)
+		return 0;
+
 	guard(mutex)(&dp->plugged_lock);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -550,12 +553,18 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 sink_request;
 	int rc = 0;
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	/* irq_hpd can happen at either connected or disconnected state */
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
+	if (msm_dp_display->mst_active) {
+		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
+
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
 	if (!rc) {
@@ -1111,9 +1120,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 				      connector_status_connected);
 
 	/* Send HPD as connected and distinguish it in the notifier */
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
+		if (dp->msm_dp_display.mst_active)
+			msm_dp_irq_hpd_handle(dp);
+		else
+			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+					      connector_status_connected);
+	}
 
 	ret = IRQ_HANDLED;
 
@@ -1776,7 +1789,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			msm_dp_hpd_plug_handle(dp);
 		}
 	} else {
-		msm_dp_hpd_unplug_handle(dp);
+		if (hpd_link_status == ISR_DISCONNECTED)
+			msm_dp_hpd_unplug_handle(dp);
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 12b47a413793..56f7a84e77d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -36,6 +36,8 @@ struct msm_dp_mst {
 	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
 	struct mutex mst_lock;
+	/* Serializes HPD IRQ handling between IRQ handler and poll_hpd_irq. */
+	struct mutex hpd_irq_lock;
 	struct msm_dp_link_info link_info;
 };
 
@@ -288,6 +290,41 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 	return rc;
 }
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	guard(mutex)(&mst->hpd_irq_lock);
+
+	rc = drm_dp_dpcd_read_data(mst->dp_aux, DP_SINK_COUNT_ESI, esi, 4);
+	if (rc < 0) {
+		DRM_ERROR("DPCD sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "MST irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_write_byte(mst->dp_aux, esi_res, ack[1]);
+		if (rc < 0) {
+			DRM_ERROR("DPCD esi_res failed. rc=%d\n", rc);
+			return;
+		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "MST display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
@@ -502,8 +539,16 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return NULL;
 }
 
+static void msm_dp_mst_poll_hpd_irq(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	msm_dp_mst_display_hpd_irq(mst->msm_dp);
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
+	.poll_hpd_irq  = msm_dp_mst_poll_hpd_irq,
 };
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
@@ -532,6 +577,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 	}
 
 	mutex_init(&mst->mst_lock);
+	mutex_init(&mst->hpd_irq_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5d411529f681..08e145399cfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,6 @@
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0


