Return-Path: <linux-arm-msm+bounces-115138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6y4L56DQmqf8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:39:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 384866DC27A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jZ5C+cra;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VT8608kc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D33B329745E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB1F40E8FA;
	Mon, 29 Jun 2026 14:16:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F17C4192E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742561; cv=none; b=gtrFBQZEmFucziwLU1NKi4DJS7AeN9Lsxscz3HGrCMW06eE4YJ7i5fnIVl1FTKBy+ixsWCShEWBoptainDZrcfh1XFJGKJzKuADVm9DJHsW2DkVcKBTrHLa+0zzbKVKxdlhj50qLQ6hl3NQuleikFyGy9r323E77ALzZndYwzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742561; c=relaxed/simple;
	bh=aNYD9OMPwNCeknvqoYVxnTIvvH7ZaraN+x/3sRKxRdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss7CUuT4u+oONSrSTgdJIdCRaRZHBDVg0zCzgsr1mRnptPDO4LJ2+rhd7o1wpd5hz1d6LbEoQ0aR9lbO5zkdXNGLWUagmMAHHjheyuRd19UQq85tNuDnu7iHe5YbdLO4faHwrnkUuyZ/7Mytm9Te3Y86irw4VPtIgMfttwWWMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ5C+cra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VT8608kc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATE272579108
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=; b=jZ5C+cra2hvfEX6F
	7ksTjtp1szfj2k5MxoMjwHeqOYVfM1I2QJ/KDqup66wOkEP7ssUctAC8d4as5/S0
	Pb9MBBrL9J1NnvHTk+ox5ghwryN5CNfiC9eXFeFTGlYXdWo65zyIC/Ub2zcAPUAo
	au0W715XfwHbcJsDtaRfnm1MtletgB3Ql+1t+lz5oAGfjOLlYo0rPJda0fNLSFkv
	V2dFrLUk2O26v7R8lGN/c0BhAmWzr7JzzcVtQs3VQ6G631+pt6fPBCvNxnWCm+Ek
	5JA9zFM0wxLY4eb5ZuGCuzJ1xU9+6JPBlnz2aT77OzT/TUqIHuG9JAD/AhtydFfy
	ZCmnzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hqus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:15:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso871736685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742558; x=1783347358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=;
        b=VT8608kcFcwrX7oS+z3M7BgHRuYSi357lq3yaHJWpnuvRbaKIvR72ZFYiCmlMf5ACB
         L4AYhlnLFGNWwvp3Ixt9hqOVqJEcASPYkbJCJ093Pq8rMnekSNrZNcc2+s91jNWbcPf4
         c0AZgUJ3VOJDl4B4noNuKvc+hDvNWJf/n6HDl7a9aZzH0lbN1aQAQmZOqZ2R9gXYlima
         g6z5AT5LVLaG7D48xaSiwfJ+FI+DYubvbJJxJ1o1XE2PBKyBKjHtfM7XEdh3Iqy2M3yS
         Mdk8Vun6Vz/AWS4rwzpt7FdGh+PN0ofGkl0tfh49fqFY8LQve6iGzuaWBPHPNwhOOXhx
         mnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742558; x=1783347358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1CONgWJ01NtWeyqUGCMrIIJYd+vBD6kZt60dnrceag=;
        b=iZANvv7R0ShHTBRu+9IvFnJW7Q48niOg+mtCD7C+cLfXh90vvgZjCmmMxU00bmyS45
         QhlpU4Wmw73RJh63HKNByPTLAkXccF3wKFKs/m7Ne2Tp759OE5VtRNZNqfQ/m6xWbahX
         CSku62648oimD9jG3FFth9d7tsetUYfIQqH6S7+4sDrj28F/m2a4HriV3K8RkU1kNVvh
         sZGV12xLDKzIcTRdc3h7pvyE0uSgEdrs9FfSPHrBn2JkkSbkbCbeASMI2WR7JCGyyvFq
         UPcuYG1+OJb4/DxzJAozY1Qpfc9ZH7jbbfovn7YdPcuNGA/62vlbN8qV2msMewmcPujX
         yXHA==
X-Gm-Message-State: AOJu0Yzy0Rg30REhZs4mvtjJByFrc+w5PJnQ6rJmMoxL4nFaPWzt4+HE
	1IHg5hoiupW6nBnLlC8XL9gAFvXCPG+TCs0+id2MWXVznoNZI4JC3UIJXIPnfggAvpodpt8tPvr
	gjKh5OX7leIuLWEztK9GIfCjUySijUfyxEoFKFIf/JkYAOB7sHX0dR1zhjQaJdRmf4JeZ
X-Gm-Gg: AfdE7clUAGv6Ff1p/jW1foG6M53ZKc91h7PGUwry7+salAX4BrPlxzer2qZM7ojP9N3
	i7fbEPYzZzKEX2UI6EqEMyXjddo7SGDqyBFpxevzsmaYDrAHQqdf8iTBnDvIy+HkCBiD11q1f2w
	QGuBRAsFz6rONJpcJSxg6fRmuECinFipy00e/geVztaFRV3FE3sH0L1ovksvzD+1wc4mKvWFm1k
	dJTPrDgKbjcL3HbVFEWDUj7TCXOevKjTyVMHvT9gB5h/XdShWZds3kCCreJc5XRqr8LXUKVCiSd
	t21y9DuhAZFKn94ZX3AG7Zx+5J8Pjwchk4UVKaZ9IYWoahQN4UMkA4PXn7gYkYc01ILEgpAMP+c
	nErm+NRy9R7yVhkeeVel9f+opTNI41IbTb+jBBZhY0ZlM83fFB2ie4OCsfDoXXHwbSs0Ktg==
X-Received: by 2002:a05:620a:2684:b0:922:d336:1990 with SMTP id af79cd13be357-9293a6b3700mr2639054785a.18.1782742557648;
        Mon, 29 Jun 2026 07:15:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:922:d336:1990 with SMTP id af79cd13be357-9293a6b3700mr2639046685a.18.1782742557023;
        Mon, 29 Jun 2026 07:15:57 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:15:56 -0700 (PDT)
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
Subject: [PATCH RESEND v5 10/25] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL for MST use cases
Date: Mon, 29 Jun 2026 22:14:31 +0800
Message-ID: <20260629-msm-dp-mst-v5-10-2ed6aee1867a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=2539; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=NN3ZQ7RQKQ4IPtPV9Psg0vrIOb4voIVZosbAYDy6STY=; b=Wo0n4ZkKEwYBX70C4SIo6eYGpFXBnBHwd+EEq4+mLkMkNwPLRgJcqXZ7YtksKBSTHl7xTTCQ5 2ZcEikVCzbtCuI/H7RE4pOEcKodV8H9ERY/4aL3o9tkxJTKyhvtzGJi
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7Y23yIuv+ItD
 VaNFXqbm68UULgloDqRE/pA+fvmgnNQieYsNqycs52jmG4lf6r/oDhIPTtYDGPgDIRITY0CXAZE
 XeT0qdv0l9jvWx4+v4HOqgv8L8RSz/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX7UZYFUicriBB
 hkHfo5JtB6Psdu+xWjbLjVaeOSbRyTMb7i6Z2GmpTBuuwfu3ZpNZSijpNy+iPszQM3cY5YcdG0y
 jvBudSTi5zH5LWga/4pdthE8iqJIQL/BReRX8IrL5CJhLgikFLPN9Ie2Ra6RYstALJXLdqJpxx1
 OSGywiEehNlQ+azpXPg1Avaj9BVIU7w3dEx8zjGwEX6D2GIbLtV/yUVRZBIZiMOUxlyUHvQld1f
 E8J59H8GvGn20rwHtDFtT5hhZB2HsLiUWvVjDw5r3f2w2slbX9A/ZqFMSbXVv2FuOt3Z73EAeBp
 d4bMC8RlUHG/7cXbGk7uCrhKExcdh7iEH0nt8jLGxTGvAHfc2CVTDKJgD7nL98EotWmZioJnCRC
 lgSe/V+mo+/ztkU4E11eUc0o7x7PkUc5K0txMA5dpO+CBHRbbkPQuR1PY/j3DsE/T3r6/lymgnO
 x+g0jEi/Th2WmjHSc/Q==
X-Proofpoint-ORIG-GUID: _uxsl6BMQmSKV26tTF0vhB1_y_WuAkTZ
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427e1f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _uxsl6BMQmSKV26tTF0vhB1_y_WuAkTZ
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
	TAGGED_FROM(0.00)[bounces-115138-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 384866DC27A

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. Ensure the register
is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c4f1a68b1210..80116e19fbbf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -677,6 +677,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index cbbcc0dbf652..ba5ee2ad8924 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -741,6 +741,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 				 const struct drm_display_mode *adjusted_mode,
 				 u32 bpp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 3e78af9e430d..edc39ee5268e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -73,6 +73,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0


