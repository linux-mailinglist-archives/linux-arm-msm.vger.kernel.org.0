Return-Path: <linux-arm-msm+bounces-111709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dv0lFuhoJmpSWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:02:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B3653544
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dq1qXWvz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OACfj7No;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7276E300C582
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896538888F;
	Mon,  8 Jun 2026 07:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087F35E1C5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:01:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902118; cv=none; b=LG2rv6M15XzwvyyatrigFQij9fouHlABrw4LpWdNlDSPDfU6o8DOsnguqQ7QYFo+e+qRXDJ0a/Dc5YSwo2aXVsJDaCJZO89fx1Mr6P6PHCTWr/IoqwXbulYMvJ9HHiQ4uzGbx8tit++wlpFPD2g1RUovE3JlW+6OlGSXseNkSiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902118; c=relaxed/simple;
	bh=qoPjmohCj+qt+VnuKdYhqh4uHy1Ot3eveLLAi8iChK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qolWYYxtu4SHRo6s064Q2lr186FnNPvIP4m79zIPj9fQWB+lXCgsAUHi7tlppbq8mUUQXAjJVqMu2HUKX/IJnY061FOs0drgI5MPRA1AoRwTZoDBTA525+ACu9izctVFxowrJ8+8s5RqW9wlOPgV+Va72e5XDz9xx11AW861NAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dq1qXWvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OACfj7No; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ot152384454
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GQJ43BCxRXT3sj0FEby1LK
	Vsqp3NgRy9qYHkeoXHJ+Q=; b=dq1qXWvzVvalAJasL/vbP2x5I769P5VN64Yb6G
	R9SCxURObCDupJhqTu9kS1BN+F6oqm0jOtLrGAQ/edcecX6v0q3EYKsMZoMcwCcT
	o5w/ttOlT1hQq6RwUWTeGQrEGY+JtYnKFlpr8bw7GX8Mvs6a3jQtN08QxggxQbum
	qRG8C85BDtIKMEj/vh/mdTz6H27vgGuu5iHwLKT6JASWtbyVYDQThDw2ftgGazjm
	z/Xe5M7I6OgKbXzytR0zR1xY4HLawoqsEy1OI3kelQv0XOl4PIVWfrszgq9+E4Kb
	OW5Imw+NvANpY8vtugmqUGIer8iB64ABptv6gSh1MSi7LzqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1ea0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:01:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85c530ddebso2427124a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902115; x=1781506915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=OACfj7NokKga/6ls7k7afS328Gl920USopqM36hudHOpfqWdVotMzw8Jrgqla6AplR
         BZ2AwSLxpUc+hnuSWR0KGx0YiF58maFA4IejjQturJIFxVnIj71+fhI04CQt6guKj3D3
         S/DIGBqJhQMJbKXM4cQCigAy7oW+6tBbYbnSZbMrUgFdhtdihPUV/zFzpiFMlnLihei5
         LZ/9ORjdhnq7SCOV6f6PSTAlWTJkFsKOW2wSZ6g1lubea+MiHAJrp8hkDerr9qg6Ugdm
         cZpAnAJPrLt9sBIhoEkL9jlTcT9GTCKQGbbEdJqEgjAopak2Vq45tBnheAno4iMT23Fl
         HvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902115; x=1781506915;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQJ43BCxRXT3sj0FEby1LKVsqp3NgRy9qYHkeoXHJ+Q=;
        b=YkaCygSH/DC6d/xWYyCb1qU64YIuWcuterZ+84Wj/WjPOkm8KQIsOIIsPdeYJXUt15
         ovK5sFwX+rdnnQkr7MgmCZf9vtqcGuY8GClNuOK0gqnYeQncEG7WBm+N6GVb6FaqAKMS
         fpMwN5S27EMgABjStMdzbUluC2UANfuHiI7yWPLdodo/OBeLSq6cm//u6FPTANrU7nZG
         iHaY8ObXwqcSRJp8pY6eZej7GRgDSeX5LDTtRxaLQK5WZN0mPuYYajNK11ujPRcZ86jI
         7BLBhDCQOQWpGr8lu+2btT/aQtSDRaNSVVNYnQVKECePo9+Y11pfZAb0JfjBCFkeSdMI
         VQXA==
X-Gm-Message-State: AOJu0Yz0uoRXZEhCaNKUb//aB2j3szjnyr8gsdA7kwF2APoptbY+kBoX
	N/uL2GLY+Bo8hPh+OOCOO/wjXgjMr2CqeNoNUQ2xozPkc6gZi4xbSr/85Oodp1hY3xx5emlJUnY
	UG89HDV4MmYcgWiBrFhZsJ0Eb3Yct28Sw6enbN9jQ9f33kASmb29H9KwfDnaUznCvFExg
X-Gm-Gg: Acq92OEn3sna7Y4PVBHsbXQMxMA+MqcGi2I4m7WdpSjKe+xB7DCJguGKFpwKxUavgJK
	bVRoS9NEyTxxwHzJn/vrV4oNvXo1HozPpZGLRazCaP7URqJyyK7GOSxu+PsBw6vvRr3V/gDSDay
	v+QLsAda3+Fyz9C51HCdaUPnwPgkt0g/tq7YIA8nXRjWiAZk/7ztDARIzIuFcYxb1P2aiM4cYcN
	zv++a0AJPvyxrVJNYSgvxM2OOXOrk+/2cOEYsFj8qtsx3E0n76n5mdkUVVMyH9qmCiAFGqRqjtB
	K/tHFJOQ+cU5RpsaJRv1NKAHwqEBO5f1iioXCoDJBSx+Ldb4B14mpaB9plqSlVT2UukjwSaNpFq
	PGxSa1Eg/lSFuHOTgJ60d/VvkRSKtYn8g70RwT/vHcfMW2TbYECDOJc+7d1s=
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902125637.31.1780902115457;
        Mon, 08 Jun 2026 00:01:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:be86:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3b4ccf7fefamr15902049637.31.1780902114854;
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:01:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add Shikra (QCM2390) display support
Date: Mon, 08 Jun 2026 12:31:41 +0530
Message-Id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANVoJmoC/3XNTQ6CMBAF4KuQrq0pLbTgynsYF9MySP1DO0Ikh
 rtbcEOibiZ5yZvvvRhh8Ehsk7xYwN6Tb68xZKuEuQauB+S+iplJIbXQQnFq/CkArzzdzjBwYYw
 2UhQ1lILFp1vA2j9ncLf/ZOrsEd1jUqZG4+nRhmFe7NOp9xfvUy44ILjUllkNYLYt0frewdm1l
 8s6HjZt9HKpZF+KjIpVEZFWG6zcH0UtlfxLUVEpi0xbyGvUKv+hjOP4BvJD/NZRAQAA
X-Change-ID: 20260603-shikra-display-07767208fa90
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=3551;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=qoPjmohCj+qt+VnuKdYhqh4uHy1Ot3eveLLAi8iChK8=;
 b=GggoWg0wf8qT155TttrTaciEjH77CjKueLHxsW41Jlb4McBcfrIRBKW+Rytru5kPA/RgJ83qb
 BUv/XSFcBNWDOtsjCayphHwV6JyhMvY5Cu1GGuaKEUk+Xkdannknxzg
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX+dMSOPYzPYTP
 smbT3WcYFU86RJNtCyuNNQVz8U7UYF9D8QTzzU2xtqGoTvK+OeNLazrwV5OIQH07QR/hGTccDSc
 4EYrJ91DAzhxXDXa7bk3QTNSic+rXSbFthkK66iQw/OXH1m6Q5E118oBJNd1Axbx1kD9O89j5PW
 uRTgTQhSfCPHxJMgoAKO05CsVnY0B5aOgkzX7/03siIbzJ26sm5PJ1RVKmWzrkgFyuVw9AhL+bW
 Jm4zw2ZBWkg/rzKnUxRu4z+DvXCALiGfdjE84ujgSUiIdsUCe6a5hoBAuySYB55ylSRCAMFhn5o
 hr620OTXEWihE2BjSGtBfgIXN993uzUH+lx5H146VXVvzcw9MKx9kF1ajtPflR6uSUr7a2nnD9Y
 CyU2lexChRLmivd7ugHKHWSDiYTI+rwEFp+BTJpn9be8aR0Iw4kmWYW1Mbmrzv/O8TebGuyTVOh
 AWbQPplF0Bo7rCqis7Q==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a2668e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_X6I45OPZ5LLD3mXDKYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WrdTkP9VAw7YNHBEbWrdfLDSIydC8Rqm
X-Proofpoint-GUID: WrdTkP9VAw7YNHBEbWrdfLDSIydC8Rqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111709-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: A36B3653544

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU and UBWC configuration mapping Shikra to
qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (2):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  4 ++++
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  6 +++++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c							|  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
  ---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v4:
- Fix sort order of qcom,shikra-dsi-ctrl entry in
  dsi-controller-main.yaml
- Replace oneOf in qcm2290-mdss patternProperties DPU compatible with
  contains: qcom,qcm2290-dpu, consistent with DSI child node pattern
- Drop arm64: defconfig: Enable ILI7807S DSI panel driver from this
  series; will be sent separately alongside device tree changes
- Link to v3: https://patch.msgid.link/20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com

Changes in v3:
- Use a fallback compatible chain for qcom,shikra-dsi-ctrl
  in dsi-controller-main.yaml instead of a standalone enum entry, with
  qcom,qcm2290-dsi-ctrl and qcom,mdss-dsi-ctrl as fallbacks
- Replace oneOf in qcm2290-mdss patternProperties DSI compatible with
  contains: qcom,qcm2290-dsi-ctrl to avoid duplicating full chain
  validation already handled by dsi-controller-main.yaml
- Drop unnecessary select: block from qcom,qcm2290-mdss.yaml; default
  dt-validate compatible matching is sufficient
- Remove self from qcom,qcm2290-mdss.yaml maintainers list
- Link to v2: https://patch.msgid.link/20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com

Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (2):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
 drivers/soc/qcom/ubwc_config.c                        |  1 +
 4 files changed, 22 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


