Return-Path: <linux-arm-msm+bounces-115183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnIfHOSJQmqf9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:06:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9266DC71B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:06:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jXoJ0vdn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XXEMZ4Gs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814D932F9FB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F69541C2F6;
	Mon, 29 Jun 2026 14:49:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B941C319
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:49:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744547; cv=none; b=Pv7Cc/cJVMhnPkVilz/S3UfVwnQUqrSrFCa8MYKWnT2KgaOx4c2RA7gN8ITcBm7BGjrdpLAOYLoBySsZzYtXYgqFdi6NuMgAmxi2RaqYM/9nYX7Xwwv4yVn41NoWNoKzeWO1T6MK5EwZwgeHerTgv+4kEUd6SFOcZQjp/8Zmx5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744547; c=relaxed/simple;
	bh=P6ysjma33fFr4Jhf+LAK0Y2tGO90pVRAbJrTPxrwqaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUMe9oSl5260Kq09nlZge/5ixSm3IgLy5J0nr7flGWSVz7/itQb+f2XYOn5X2PMYQvHTlfOgRJXa9TWSOCcS5tEXIWVOveiDXD+11/BEUdcm69EIIKdlmYZY1mGhgLu+2IWK/axAJ57t9F5uapHhCyKgccK9EopXu3MAqKKGurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXoJ0vdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXEMZ4Gs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuBC2601194
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=; b=jXoJ0vdn3ImZ/UDX
	dWASKy1lxZU14FYk954F6jZtliytAvjPzt7xcSkI8uO9c/AtgD4aPEXhqhZJdlKZ
	LCbMMBqf3XMIjwgV2072Q+UveQzlawXiazHtcF33MfoHk9f4REBpFNH8VtM8bTGj
	0b+FbF0ex6FSB5I1PPvkdHDnHEarRDWX4gULsRPlOvZg4NEIsbSrTuh103ZgTxSw
	EyhhI1qF8Yt3vb1VoLOKsqdiCRpD3oaSCZTWhT9LgTmkyarlETsDrpytDw3gT/Kt
	TFKiLKo5cmpfiCUbaEiKtMSSUAnfdLvQmBQGS21/qhmcEoU6HPsS2nGJk6NFbTfJ
	yjZUeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw9d7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:49:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so55877585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744545; x=1783349345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=XXEMZ4GsPrvchi0WweGDfrzWkR0E7tEFPzQwz7XgSf/wJ2LsJl5QqKgBUo4832/SXG
         h0mSGkD+6McoIuhRLEoVNEls0+7u7yzgKPc5rDraDBmuxEYHKzCE4JkRTgguw8gaA+vR
         bfZiO4fsTPzUnoezhofvr5vzRkqBa7efJTcvDmqmvjhH//FNj0zUNx5f8irjpHFkqeWK
         sBxpC4Rm8J/Izw+cZYA/otItHaHUdVEiaH9HlWinOOsw8FPpyum9yLUoir1fPlXlay7T
         XugYTMgWYOGAA/omd+SpfZFTx6fIoYOgS0o9oU/LyAra8exiqMTbLDMGxxUrkF+6CRx2
         EjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744545; x=1783349345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Riz54V+xwrmHrcv0C5NpeAm+dHdus1rR77mLS6rpysQ=;
        b=WDex3kf2ntfs4mjZsdENEZoxP66+WvTA9caWy9Zbat/YxOcus2TH0wViBEc5qCTuUg
         zv4A+ev5uVlGnHBi0Pp33Ex0rrLa3Y5/bXFUGtyQFymnDa0o43236nWTUMEekN2ju0D+
         P7Ydsd7N+sLNr+It2Z11+D+61VRBWAKu+nGSu04T0CMNXqSxoQVR8z/mkk+cJdCpnvp6
         13j5mFXuD6cLhaqydJ7zv5TQCApXQJMUeJ8KY5dk4/Rj3JgjL8xySOGaVRWQwOOwRjXg
         xGvG1fsmyOamQeN28p1BCw+0rFE+DyF0sjoJkm0wCzAN93TNMDB2NvzUsNh67XlEuQ37
         E7Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/ZfdfeYd3VigACGNafJ1Acgy7PtSl0+6UukAhlg9y5GSoQvkNpV3YNddB9PXDT/orH4c7bQF6nkcLcjy4K@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgCouqyYFaTRDAZ2mRVA/5Rtyw6pCaSnM94zFzQePf27YGRif
	8w+SOsjoo58eESSFYXfANBhnCsdML7L4RD+Mgmr+6bWu6gzPE6Emuktrksev1w2Hk3dhJjeq5Im
	v3brnh7tHnqHT+i3f+S9wjo1Q9/m3mBydD+1olxhJXU5XOns4MDnewUBqm1SX4+D6fIvQ
X-Gm-Gg: AfdE7cmyiu+oiVrb6ZaCAv0NSAwSrcD57XEI6+8jDkbNDnt74u95MKPYoWBZq40a0s/
	NePi/8EMqDladl0KqXE3votN0iHO5RZzqm42IzmhP3na0RBDuuTT2gwoxN6QMABI5EmNtwGxDdT
	ZcYtyiLbCguPyIqwB2FAHU9m7WOuxs2leHOmHq1uCG05c1KNZIMH7PIL+cQpacQRQC9ZA/Ht0jW
	hnEL3peNp5LqKoKU0vzC0e4Qf5j8YGTUYP4sKlYHzjoSIGzpwt7h7wpsO+PZo55FjkW7OLQSJYu
	g3bWeK24Tcz5cN1+QUiIVksy01/FodZL2eM3TIajBQf4zeJ7sedVtn/koB5+N7T19V+jgA/skOV
	ieMmK3d1+IPzTwNncsYgEQ/JsM0j0oRcU4ngGW3r4ZBZ17F0MzuqCI2+dr5YZrEqgpotguZOcHA
	==
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618701585a.25.1782744544721;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:912:bd42:b46d with SMTP id af79cd13be357-9293c11cab3mr2618693885a.25.1782744544168;
        Mon, 29 Jun 2026 07:49:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:49:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:07 +0800
Subject: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=1355;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=P6ysjma33fFr4Jhf+LAK0Y2tGO90pVRAbJrTPxrwqaw=;
 b=taMUim1RCi3Tovwyu/g7YUOegrysAK68tpUeSQ5Cm5voOFpIRC7PaoYhfsOcPSnmVuUPZOtog
 FPGK/+EymzKAfEqmi8WrHew0KXfVt4LhxvzjsyxTNcY6DSQa90FNREx
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXwIaqyh4YB/7g
 jHk1Zv7e6qgEELlr14la93Yer+wc4yltciALil3d/139fLUcEbknoin6bjESPXxHoaUxADF+K9I
 oRA7kGVKEesTnBDPMAMnOJ6kY4zfXAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX3vVOO00RJDGs
 FwNh1E9kBb5ittMq725znir4T6tbYzNimsrWppC1LffPYlPbVIM9Noo9rzybn94L3oPEAQdXMLj
 6KHCNqAnn7hGowTOjljbMWqHz0hiGpedUJU8rZRtxm/bxh56CgTayOfdM1tLg8FT3RarBYySxZ8
 jGkPShptEtjo26K+W8cxiIfqAHValNy7NUcbfZwKRCSqteNtgbn0tc7pKCDhlA9CP9RGgxZuGYR
 GCHUrj0bha5si5vvTI/foUcx0MWKyBtWInYNsU6UzNJsyT3wvH2GCdu/OhboJuaJ+08h61fpeyM
 KsM8MnSEpRhhu0GqkZY3iGShtAGcsCcn8txnf6zYyolmpWhpiB1xNNr7hvwad6MSx2EsYI+jLgc
 0I3JuH4mtcAPGtvUdepMpkUaaOibeRh/p5zP3s1b8hHCrabH6PNp9SudRwyT3QsQ3f0vET0rC+T
 V2Hjp83X8G2vf8oiwsg==
X-Proofpoint-GUID: 4IfqFoWPmzsaw39MusMRbszhppo0NK6w
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4285e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hI2I0KHUTEcuU6pApIIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4IfqFoWPmzsaw39MusMRbszhppo0NK6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: BC9266DC71B

When MST becomes active, the initial HPD plug notification updates the
SST connector state to connected.

However, the subsequent SST connector detect path reports disconnected
while MST is enabled. This connected -> disconnected transition is then
observed by the polling logic and may result in an unnecessary hotplug
event.

Set the SST connector state to disconnected immediately after MST is
initialized so that the detect path does not introduce a transient
state change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4ee391cc7165..f8ca60d6d714 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
 		msm_dp_display_mst_init(dp);
 
-	if (dp->msm_dp_display.mst_active)
+	if (dp->msm_dp_display.mst_active) {
+		connector->status = connector_status_disconnected;
 		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+	}
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 

-- 
2.43.0


