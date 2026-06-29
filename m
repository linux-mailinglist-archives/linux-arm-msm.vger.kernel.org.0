Return-Path: <linux-arm-msm+bounces-115177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pHxDGyyJQmpq9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:03:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2D6DC697
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:03:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="p54ouE/B";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZWmvGqrP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115177-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115177-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E7FD30AAF44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74323CA4B6;
	Mon, 29 Jun 2026 14:48:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CE3E8C74
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744502; cv=none; b=Uo4oO4Hnq51wo/nqgnagf1hbFExvZC0cC+pltsKXyRfAVAJu0QcXwiWYh+zjl8z5be5UBrBLSoxSgmtdITFvEXNhTvk9YIuYBocTVsjE82KC4KBwl4pBP0B452wuMEMcGXFJf/HOz0C5yhpZMpfoBNORC2GDKZJZrbUadwzc97Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744502; c=relaxed/simple;
	bh=63mgR/WEomQ97sw6tki5aEhX2JKiHSdLLZ99/CxweX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ujH4raje+dxsiufkaqt6Xkd1pMKML2YvlCkWOm4LZR5RUtrWRxgiSmDczfESlOGO7H14DHaTQ7k30XJkddzXZfSIELlbMdD6MA17pM39eH3Qkd6fZnByKF4fkZnxVGKWqTpSbOB1nfX1LXoQN1KHMc/8YM2BxrTAv4aWiHTWff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p54ouE/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWmvGqrP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4XZ2646955
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1f/yR+lvP1s2Ul6gheXSvU
	VeiUwZxWmL1UGyP4EwcCw=; b=p54ouE/By938PV2i87guFfNFF5F9u48ybF9ryL
	ATYPO9X+Z//Xd5wTvNNfsYgrGNuYhTvYGrBDcRkrKZ/Xjosl2IrEa8s8eYYnsHLP
	MB6A5aOr0eq23gpF3OogMBPNiE3mVcYekBVWs9CaPtySulap4CymvBDn/ogm2DUN
	EnihVmyGz80yy7nWeRj3oYTiguQDteiex/eG+0PQ028KBVLFIGurODXNEONvynNd
	X6nWY+6V5mGJ4dQEatrVbN3wlVLJpNZ8E/eDhL+nbuWfpubsnqnGJLXPlv8AyiXN
	BtkDVZT/sXVngMWCbclUnjTQcbJhRciKnmlDrFXMDxfHI5Qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsu47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ad11e2197so666836085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744499; x=1783349299; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1f/yR+lvP1s2Ul6gheXSvUVeiUwZxWmL1UGyP4EwcCw=;
        b=ZWmvGqrPVTS/uW3ij3ZvkU/mo+xPqn3YSOpKtFb06Yf39LqULRtD0pLGWwhWy60341
         EVMTf2OC7b3XU2lPK4T/+jRfyahOr3GjL+X/7okgAbgN8dNy8ZvnZoEo/T+Ck8bcqiuy
         HmYfnnYNsmKHfU9/SIPge8EI128IuhGel/VACh3KzKsF0s9dthCfUOhfGdG33dvLcbUB
         HcJmt43bCDCyUsYztcoXtDBJkbGJzyk3STTSgTENJMvoYUAQuTUwAm7lvi3ANUAgj6oT
         ESvf6IXnNw4gupz7kJeiqjnC1uleioRqTf8ijkgHttnPwWFciKikC/qBHIcJhs7ndavu
         fkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744499; x=1783349299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f/yR+lvP1s2Ul6gheXSvUVeiUwZxWmL1UGyP4EwcCw=;
        b=A3stk/CLMtuXwM7fF7IB/+mQLPFW1MVwufNihpcepx6yOUy+mg1kwWmB/GkSuh1Cgd
         tGrpNzGAIJx+s3HXghqQq5ONL5F5sU6WC/XDklbFBU5r6GFBp940KwKnz7V1f6OvU3HR
         Rmp8k3sBDGvi4Yr9bHQRxZlWvF8Sp3zgS1WPcDcB4LaLmF7lYA9iq4NgIFPM/QoEx3UH
         ScF4I4pvoQjn4VUvBTFArU6T+Quwo9q7HtASCPjSNTm7DigahK8UjY7bFtr4VuRVhk4g
         hOfDqtv9OE4YTBb5p8TmesI0G8JXZDdQsTeFtwQ2qXItiZfjsajRsCXlrM6f8EgwL635
         n7+A==
X-Forwarded-Encrypted: i=1; AFNElJ/zgu+tymxttIvPXxm0RzUhfSnBbVTP533v6zCZVa++7E7dogODTDwInxpzf6AYMNkHm10/lbeRGid0yN2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yylofmr9FJIo8PsXWe/xcAHdBnt/9BkwozT4kSr0yzkjZW148ze
	f+3w5TnxXfwrs7yUteOgtDZLRNF6xdPczZsPuNSj/q0ZERsrsdFLPqL5uewISVXFulBD1WRoYBZ
	ZtBW+NLYeEcbbT6O23WdNBLDHeHfthUFDX5xgw+A9nIL2d5ey72uUQPggxhXvOkh94hpf
X-Gm-Gg: AfdE7cnJeGZpLao0nKie/LAEiVQYGd8P+kerOyrDu+mtDrgciluz8vhDEv+nKScUhwA
	8oFQv15ppGx1B0A5GR31qFUw9sjv46fFWoPk1wdqfsFL2rEFOzq45227rGN3SNmTGayGQHRuSqd
	j9QBr+xAozNUdWNVQbDz4lShe7qdjpb1Nq+mlfXx3fahTyD7rfimXlnPNWNWUEK2xzKKBONTXMV
	B9DBTGd9p0yqyXHza7+D42ezTtBVIOm549LsAr27KnnPxwbnQj19W4bGhdLdAGca51MXDXdNvzM
	D/5yoiAbQv4GLc9W3o9X4MbCqJQ/BygLSaoh7KlyOj6OB69VlWX+5BpyBZZSMCTWD5z2N+WleEB
	3Ct0LHUUJIkValIv2njhAcXNCqIbIxYsljJx6GuQcJfWpoORAgvlF6+XYS5TNP4J21BvM01+Xdw
	==
X-Received: by 2002:a05:620a:460f:b0:92e:4687:b84c with SMTP id af79cd13be357-92e4687c54fmr947131685a.25.1782744498327;
        Mon, 29 Jun 2026 07:48:18 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:92e:4687:b84c with SMTP id af79cd13be357-92e4687c54fmr947116785a.25.1782744497096;
        Mon, 29 Jun 2026 07:48:17 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:16 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dp: Add MSM Type-C MST support
Date: Mon, 29 Jun 2026 22:48:02 +0800
Message-Id: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOFQmoC/22Oy2rDMBBFf8Vo3Ql6WZJFKf2PEooe40YQP+WYl
 pB/r2xvsshmhjvMPffeScY5YSa2upMZ15TT0BfB3ioSLq7/QUixaMIpV1TxBrrcQRzLWpa/EQN
 4yWlsdXS10aS4xhnb9LsTv86HnnG6FfByHEmHObsdbKv3g0sNXMYIaZ4AV+yXDKsECoJ6xb0Qt
 TT6c8j5NN3cNQxddyrjgzx3tNVOkow+NQRRs42Bxhtp13pzvEpvyv93+Q9XdD2sukSjKywm0HA
 hXkd7lxG2S1pshTpqSpHJRkhUpjVKCBNqxWhouUOtdGO8UoKcH49/Jbfnn3QBAAA=
X-Change-ID: 20260629-msm-dp-msttypec-b420df7da587
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=7157;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=63mgR/WEomQ97sw6tki5aEhX2JKiHSdLLZ99/CxweX8=;
 b=wjq7YIex0kYDekGaGwDyjO7xnuaglLiq/ijsioGq6BUUDhn9QXcIYwvIeaMWwX0DgTUSZ0PmK
 6L9D4PmILs+Apo317L/mQssy07FLxfaFm/NSWKQqHJ26zQ07yIHX/QD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXxNUDDjCnfd8E
 r5Ai4jc895GnpmHQ2NGSbCifSVg3/P5QYUuZ+m1jq0Uowz3tDRMozywdPP8mzwH3nTOBiTI/yZh
 NGmxWQ/BAX4Sd2mhxEFuwi6LAI4y94CJb52IcTcJ3N8oFZgOBg4OVCBSD0LWTbsmqCNk0snhUmv
 8c4WZnb/F6XzkEZSF1VZ5l3zN7iEBR5roslepnMj9E/MYtwUEErkEBa5bY6hqXMA0LoK33zteU/
 rcqgG4BcIwNeQdsIuS1oiMSJxbaTIf9adVOHjo2qfcl8Qw4i7m9T2DlrxDCfiyRrdxm51odKagI
 JQhK0wqj+TqmRHlB6jnNhIkUyiqkpoHv8vx/Bavuvvfzzk+zwyKZJmox0+nLiAo50O9HwBeQ7wW
 Rq/868c/xjAis90JLqekBlEIKysXVhh8TKv2rlFI5L9qbRrRdspqa1DwVQ3xMgePXZIRDlEi7dK
 UqEeTxtLedTk0phmG0Q==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4285b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=GNgVbCztR01TI7U4TXAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX210P1n03WXcb
 yhrv1GwI2w1Ad4NxBBv9OBzu60gAmdHQhNN+U0hafZIkQWIosv0dwU7K+bY0VO5rmwtldrf81PF
 DifWMYPcuP7oa2avWt9IEq6bnmLdcTE=
X-Proofpoint-ORIG-GUID: 6YJ1QGGJ4SFgjQg0j8DCbwsq2dwRwSOm
X-Proofpoint-GUID: 6YJ1QGGJ4SFgjQg0j8DCbwsq2dwRwSOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115177-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,patchwork.freedesktop.org:url];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15D2D6DC697

The bridge connector framework currently treats every HPD notification
as a connector state update and emits a userspace hotplug event.
Once MST is enabled, however, connector creation, removal and hotplug
handling are already managed by the DRM DP MST topology manager.

As a result:

  - the SST connector may transiently transition between connected and
    disconnected during MST initialization

  - MST IRQ notifications may generate duplicate userspace hotplug
    events, once from the bridge connector layer and once from the MST
    topology manager

Introduce explicit support for IRQ-only HPD notifications in the bridge
connector framework and allow bridge drivers to suppress connector
hotplug events when those events are already handled elsewhere.

MSM DP uses these mechanisms to integrate Type-C MST hubs without
generating duplicate or spurious userspace hotplug notifications.

Testing
-------
Tested on Hamoa-EVK with a Type-C MST hub and dual-monitor setup.
Both fbcon and Weston were exercised. No duplicate hotplug events,
connector state oscillation or display flickering were observed after
hub attachment.

Dependencies
------------
This patch series was made on top of:

[1] drm: handle IRQ_HPD events correctly (v4)
    https://lore.kernel.org/r/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

[2] drm/msm/dp: Add MST support for MSM chipsets (v5)
    https://patchwork.freedesktop.org/series/142207/#rev5

[3] drm/msm/dp: Prerequisite cleanup for upcoming MST support (v7)
    https://lore.kernel.org/r/20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Yongxing Mou (5):
      drm/bridge: allow hpd_notify() to suppress connector hotplug events
      drm/bridge_connector: preserve connector status for IRQ-only HPD events
      drm/msm/dp: suppress bridge hotplug events during MST operation
      drm/msm/dp: report IRQ_HPD as an IRQ-only notification
      drm/msm/dp: mark the SST connector disconnected when MST is enabled

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 31 ++++++++++++++++-----
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c            | 38 +++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 +-
 drivers/soc/qcom/pmic_glink_altmode.c          | 14 ++++++----
 include/drm/drm_bridge.h                       |  3 +-
 8 files changed, 65 insertions(+), 33 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260629-msm-dp-msttypec-b420df7da587
prerequisite-message-id: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
prerequisite-patch-id: adc6d802a2f71d23c077a5cdb9a257809e9db50e
prerequisite-patch-id: bbd956a3b65a90c1fe9e884bc32c49bd83fd3129
prerequisite-patch-id: 014460a25c380d089764ab4e1a58577ebc1b9e71
prerequisite-patch-id: fc03fb9435b8c60321f9ae28e396a6bff2f347ae
prerequisite-patch-id: cd4cd57a72c798fc95afdfdeb9b81cc7a2dbd25d
prerequisite-patch-id: fe431fb614383eb6444f6bfb928e7e40c2de951e
prerequisite-patch-id: 2a058aa8309016f424b1d4ca19a9b20e92f4d8b6
prerequisite-patch-id: 64c3616bb979b663a01342d1f217588b347ae8bb
prerequisite-change-id: 20260410-msm-dp-mst-35130b6e8b84:v5
prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b
prerequisite-patch-id: c6a9aaba753b5538864f7f6e065d910833baec21
prerequisite-patch-id: c73c1f6eb16b2a6ff11b20495fa0981683bdaaee
prerequisite-patch-id: 94957394b3870ec63ab766d682df592da978dd19
prerequisite-patch-id: f27cba0cf5f08d21f59f29a0c9ed7f197ddfa2c7
prerequisite-patch-id: 683855949a9ed37bc0cc4d1899373e55eac4ddc3
prerequisite-patch-id: 9b3a2b526476c32c8a859824e551e23412674766
prerequisite-patch-id: be866cf2acd4960f31f0dbd05e21f0722dcb70ab
prerequisite-patch-id: 58bd115be590c0d892a72e06794f5b244dbdb7f8
prerequisite-patch-id: 87435a0f6827516f4e2b5d8471a2b289bb73a88c
prerequisite-patch-id: 1064db7111fc77377dbf246eb0fdef90c18c46ee
prerequisite-patch-id: e112aaf6088f2bfa90bc67feaac86a4fc1ad23ca
prerequisite-patch-id: fcc0f2ee6dc0358d62593c1295d26a013fa11223
prerequisite-patch-id: 66364b8806fc6abeabe1a0b871e4e8c841ce2aa7
prerequisite-patch-id: 243046f52a14b416caead3469d580ea5b029f9bb
prerequisite-patch-id: efd8014f647a6aa5fadc9d62a6e1920d76a6c80f
prerequisite-patch-id: f4dbd5ae84a01ea89c7d00ca39fd76cd247bc353
prerequisite-patch-id: 30a16a45edefc8769b10d90a7807b6522cd31f15
prerequisite-patch-id: e12fd2908ca33de1f1265fd40190eaad8637e569
prerequisite-patch-id: 3baac076fdda664d00aa9a83481f76ec38c07e8a
prerequisite-patch-id: ee6a93ffa2d5461ee7b07929ff21626a14773b7a
prerequisite-patch-id: c8d444e2a6512f106da2675d4a42a92208d5c6f1
prerequisite-patch-id: 0491a69feb036cfa2e75401e093ebad387cf2846
prerequisite-patch-id: 707e7a3e5114c86f5bcc0b36e7cc8beb0c957780
prerequisite-patch-id: b1ae90d73bd7c3d19cfe4371b5dc9a816f1316a6
prerequisite-patch-id: 4c183b8ffd599169c8d3c5f3aad5ecc467b150f2
prerequisite-message-id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


