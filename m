Return-Path: <linux-arm-msm+bounces-118611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 55jyCK8nVGqAiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C074646E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B5kYly1o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f6C2AYnb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAFB73014669
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1F538C438;
	Sun, 12 Jul 2026 23:46:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5B384CE5
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900015; cv=none; b=dudnE44+TdjDr9MJdRWhy5KkkHaENqiqv4GhUh0jFNcydFTXbE3OaQdiKz4G7JyM/a53ViGwGNiThqK7wF/UOVAwH22Qin8YlIl3mSImJGSlmsS1xUAeJutd3UAvB7L0LS0TawiV9kORw90GN9QTJxtEsA0JjINQ8e5XsI6v9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900015; c=relaxed/simple;
	bh=rcSVXBa40Hk8wRjirs7IHACX8e3iJayHF7bJVStLKls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDr+4A6fZnSFn+rawiRYDrqLwf+yvQlw8UJbRBpRKzHABK/rsIAd8HABOCXDQtkAsRkU3u06bOmG/kgi5nEN9YLpaUY5ILoc9hPh9/y+Oc0NTz87QXwk4furJQ1j48wxaBJeTDl7aXxdESrw6tDW7g3pqnIZDQxGOlk+p5ODujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5kYly1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6C2AYnb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNU3nQ3961078
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYV1vviYmvv18rlHbpJk8khcLhfX/RfZkk0vj4YXymk=; b=B5kYly1otcGPDCYb
	8q7zTMc8iglLa6qIZzyq0FTbqvDGRoThhUCgzX2IbYCnWMaZTu0/fOXLUVZhw8Wx
	Upy7BoOdu6dTgbEEWcujNgoPFl1UiRmXlB1uO4XyVVyU/Gf2HDzmHYtMqjVqa0I9
	JbC+98CTnFA+lcphysAsmKlBDkJaHaqRxBhb7zZo4fWYqOlGPouag2bAD8F8nU9v
	noXF296oGLIqzffKCiuNl7ExY4aLakK3QHSyZ92NdGiYMYMGmsy7r4re+9lA5wGG
	1CbhWyN3JTC11GyOs7MxVYL2OdnGjkMsIspp1aKBhIw26ZqZjSBYIXYXC0fbU6gG
	h2iieQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm060k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90284139cceso26092586d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900013; x=1784504813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYV1vviYmvv18rlHbpJk8khcLhfX/RfZkk0vj4YXymk=;
        b=f6C2AYnbalzScJP1vrDmLAN9ckzKbAxO58NJxrPZRJNsdDGs9rNstYqyRIfJ7maLR6
         jyOkC2LccKHTh/WG2yd+5UNMNOuj8N57HP0nw/YEV/UTWgl8k+2+FPayCd2RHd199XDm
         IVIvH7nOhhm5/NXMXDxV9JRPMggP/RX2KQYSefI1jlH4nM+hLGdPkBzezwUn5Y0z6wQb
         jPH2T1vyHjUcONj3emGArGq5gMSYUYFW7AmBYAOxbjtHYYldjtPjXu9a6AXolY/9lTc2
         q1v3S6Mdqg5nU0/SElG8Szy9QhwneQ9Kf9rO8e106p5X7EoeLLwA5wGPnlFUYx21C3z1
         Cd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900013; x=1784504813;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYV1vviYmvv18rlHbpJk8khcLhfX/RfZkk0vj4YXymk=;
        b=FJJZCPw2H9HWoapO116MfBw5MCRlh2VcnlsUOdtX2o5ne7rm5qX4f6dTxu5gg2/mSH
         APuEXOkiuHqVwu8gZ49NxKB6/drZqtOUEXbdxCXz3imqCKDytnUwZZrdUFgDxeW1f0E7
         lqvnMECvc2GFK/h+hq8eBoNzN2emNXfnf1ldQojNDHjMLKF2aEBo8otayAJF7GJ/Txkz
         w8PbSOdB4Uugm5aLm/jMheaQHq2JvmoJ4OE/BAa1Fjlmu3R5xLGdFxEqdI5asSlM77wV
         OzvI6GEgQn2VWKjTSX+VI1HVZN6zG/HHVJWbUiaMlqE6PiWOOaXFlawrN6VyK6TAuapK
         S0jg==
X-Forwarded-Encrypted: i=1; AHgh+RqDZQYo+FKsxZezS6HhyNsncSKllulB+Sk7UyPLkaYHSWjiQf09PqQcboq+/tiYup/TKwfXmKEdp+Tq3jJ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61RDpedR/uaomI1iAP3EgDIrOWmiArJNeZXiuGhNLzRVxYUfa
	rpQOwqZR+LCiIsQhyE5X7oyT9VIL+aMW1xJmvBQa/NWJRNpvPP3f55XVOSj0Ks+GatcGBR/Zgq5
	VFrGF96X+J5xINCNdiqLBb5xznHEwgZu/okWxN1AHNmcs9C9vbPZNlPScq/1lpA2kGf91
X-Gm-Gg: AfdE7cnWK1tybQ3TVP7YObdqZOA8spp+1YqPVyyAkql4eBBUNTC0zXIIYhSSaQgrgmV
	kBDTE/2Oyps2m1+VqfhFsUjL4nQ2R1Bp5w7u+qmhZkj4MgNEi3ZyI9nyo41PubiisF+XIaiqjiP
	Ls6WsyM77REgc9EKv9pUlYY5i6N38wZL1spE0xMOm3Svxxk8TbP9qz+KUkapksVxApmgOq4Uiys
	VaF/onvPk79AUNcOLtjlWC3IJ5i96T+7429520JMECH2Z+z3LyPRMpkeG/fuuiGM70lO4jLC60C
	fmXH36N0rx4KBbCJp/s/T0sIrSgGuzFq0640wUu5P8xaLqrWv0plHm+gMREQApd2GAQMZRlD0Cv
	qI5yiGt5v3EcYzt3lYnn81ov6TTPRhmk3gnC3GD6qMu2D0SIsLfzYrEtUO9hIJ6XgXB2uaGekDk
	tKOhSimf02eUdWYYtmS6MvawJM
X-Received: by 2002:a05:622a:4089:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51caa173e38mr122326741cf.34.1783900012665;
        Sun, 12 Jul 2026 16:46:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4089:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51caa173e38mr122326611cf.34.1783900012272;
        Sun, 12 Jul 2026 16:46:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2371357e87.71.2026.07.12.16.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: quic_abhinavk@quicinc.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Kavan Smith <kavansmith82@gmail.com>
Cc: sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2] drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
Date: Mon, 13 Jul 2026 02:46:40 +0300
Message-ID: <178389962794.1434604.86942707756896992.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707013240.681012-1-kavansmith82@gmail.com>
References: <20260707013240.681012-1-kavansmith82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QUbBu_Zzs1eEv7LyAEzO1dZUrtnztQwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX4gWJdQuSu963
 T18s1NulfXZqIIWOI3uggbdFX4qjQ8G1ceObUPF1niEliQjrlVClCoRKAZJYhsrXW+rUOhzJIYW
 FadTuccp7484noGE7L+GC1z+Xg64Xhtnb6ZRzhQmjGWEk52P5ySuhK9X567dUV9DayyepURZv9A
 IM2IWh3ZLOZHgxCofHDMzhkJyppG7z1hWwpALTrWdTl5w5a19lH6pncALLxSiInx6edc6qSkFDo
 58nVzonz1LldrO7MrdJXVJc/dgngGoKj3/KhfwgJG9p2z/n4cAOcjsyt94LnbZRWwMLREX3M72H
 HmGVzgLgpjXjJRz4PITDvK74QgT+CaChgqs9yJU3nchI//hZ/c2mtIIYKxtGlDsjBaPPHDxl5zC
 Yu0dy+KT6N+iYjSkhUf6A1Ix6dTciiUs4O2oA4X76BNcmeiTG55msJnxxEslhi1YCO4AWm2siHf
 +3tPIvouaYRL/MKLl5g==
X-Proofpoint-GUID: QUbBu_Zzs1eEv7LyAEzO1dZUrtnztQwR
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54276d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=TRR5xVq1x4uEjgd2TI8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX39I7ca78V8nu
 tdYNsXU+Q9o1CooWQN5/dF4nxnCFrRQlGqcW5i6UNNq0jINIhcgKRZ5wJGIGU4FVz+m2+wT23aJ
 Tc/9aqwYRvE90znkiRrtPv3wNgdJLgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120257
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[quicinc.com,oss.qualcomm.com,gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:quic_abhinavk@quicinc.com,m:robin.clark@oss.qualcomm.com,m:kavansmith82@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:daniel@zonque.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,zonque.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD9C074646E

On Mon, 06 Jul 2026 18:32:40 -0700, Kavan Smith wrote:
> MSM8916 runtime DSI commands still go through
> msm_dsi_host_xfer_prepare(), which re-applies the link clock rate before
> enabling the link clocks. That is fine in principle, but on DSI 6G the
> requested byte clock rate often does not exactly match the DSI PHY PLL's
> realizable rate. For example, the driver can request 56250000 Hz while the
> PLL actually runs at 56246337 Hz.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6cd33b6f4155

Best regards,
-- 
With best wishes
Dmitry



