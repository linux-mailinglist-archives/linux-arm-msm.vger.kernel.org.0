Return-Path: <linux-arm-msm+bounces-115179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/8UHHCHQmrc9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E96DC56C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WrcmkiIp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KQUMhRH0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115179-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115179-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 278793058188
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DAB4219FE;
	Mon, 29 Jun 2026 14:48:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9D4219F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744520; cv=none; b=Ym7ZSB1KN9yXqMvqU2taBCSuzNoZgI0sHk1YdFaZ07BjyePI1nuavUZjQn6UVUrWNZymVDDRi6iTiCi4zq1r/Pa7Dqlc587kqbbvpirkak7qUbBLxfyfX+ZiA/08i4QJ7ZZtN60UrG7tAOyc3JvPRL1F9uzvyFE2ld6Ju/7maeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744520; c=relaxed/simple;
	bh=zCPPIEotdSUHd8PwFgThC89TK/453vk/QVgAmXnjK4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7Mrt9uE/X0C4lSJeT0B5mQDf9C65iT6Ae85ZeFj9HWdYmQWgoGxTEnA6H8M9OQjjetzhJg5RXa0xNcuHo+ewz6SqYAeQvDBYxKsAuQsttMq99NhP+DjWwFnVcoM2++FRmdOpkoTMTxvqyioM3Kv7VtapEplEllTDfPBdZ64OpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrcmkiIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQUMhRH0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKcY2579321
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=; b=WrcmkiIpDYknkEZI
	H+j2O7fO40qENvHj6R6oHycIx8MDrjWg2Qkq/8s7DWV29k64+lAn9AzTYRj31N2Y
	vQ+sN8R1BxmqGmR2GDUvLY/ZXrmCWye8DbhOrAIQ+luyLHQKsWv9OgKYatTr9BSg
	HxL9iTXwG5g7HmpNIYSadf5xaVHoBYYFefgH/Hw5ckX8GheKj6UUuykNJm2MFT5/
	Nqn2Snu94rZIUFsy8bVhxRPWlaAU40zBs/0dv1OkNu8iTIAMRmvPMhakqYarM6SK
	jsCILGRDadnx5edi2wkVcg95XyY0RJ9Mpko8wrkwVcb3kXeBZIu11DT7naqhBgaR
	vt4HXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hwe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e59b0e0f4so69416885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744516; x=1783349316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=KQUMhRH0DbA9gvr87WFhjezdVU0sSaKGDfE5JwHKCXxkQyg8kcvHsztmbx9Aee8GrV
         C8r3fyykTfxc1D62rORkZRUtfJbUxGwQgpYQYPLOXYTKTvv0szD8KhMn0DX5qJJvV6lL
         jvOeSAXShrslIw0/kS7AO8XnzM+qavWKtFPCzy+GTqdBoaeVVhdHre7qS2ts2vLcuZcC
         NtjulMk0TXg/4bXjpvA6Rq0oLXbYLE7VJBpitLRUkBCdBpy5d3rOWOnWH+9ebRTasjaz
         9Qsk1PBOq3TWYAuuIHUDPPNeuQWYrs0seVpsRnEQJ0kn2HQMVrVj0IHT3wS73SG+59hP
         OtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744516; x=1783349316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY2/kYZwMHeTEPu+t0diQLOY++1sPPgUOB5KtcADCTU=;
        b=c8fYRPodIGijJZBuz32IeTbFuw7Kyyh+yd+bMQls9gIaGskvnx6Fs8CDIywrve4CkI
         6spnqdj2f+kyiHT+Hdb/XYZQdYt6/IcNM1E79EVX26+H3id4fXA4mgt14h+QNB0fFlB6
         V7CSFyzNMB+nZjLQxkfDKRA7lnFDYmYEIDyocmAuQSBmcM/jasMhBOBbbkXf9oocd+Tc
         yfpE4XE584uv1HmKdJe92GU+Lzn7DGhK1dDiEdlu1F1Xd5m+7kOZQB/Hgbl2nHsANRIU
         sWGRJ9UsTY5+70LMcmHH8ZYSrdNuuhZl4OzsO9GodWeXldb9jA6d5Fq9gmcDnYzg01rK
         MRIw==
X-Forwarded-Encrypted: i=1; AFNElJ+cVAP8kNIf46wHaTMVeysKxZ6ihJhoY5+cdrIZmlS/PBsCFWLKUwq91uMkgfypzNBzfAZCkdy80I/RGWfO@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZGeXBWCE9b0inOe7W/aLfwfQ51Pg3ge8HzgmByZ4/U5lyHPZ
	kIndjIUZ0le7KHZGS8Ze7UOrokSdKSDrMBB7rPhRYNdK4jiqKdYfzya8Uq3Sxv6myaEb7AMypvR
	YGwvD2F3WGwi/1X7gEtf4FAFBNzPS1f0CFgNf1uYpxvkC5MRMW4eXmhZ9HW/PcYZAG1XF
X-Gm-Gg: AfdE7cmhnye+Ik0UH2auXqp0WUpkyXN1YZatIHcFFas6jdDwGcqwDtqj1uFk4tlk1vU
	DVB0FX4e+wu3v5b/Apn0leGG+YthT3d5apD/4psoG05TEcL7PmXqc4rE3fp8gBgWCvbZLHCcHi6
	BW1HvTq5JvQ5J/mv/01p9lU4WExmE9NuSfkej9Y9suO57qAANixjIZnSp49ztE11YAkuqZkhY12
	GHU6s/0j2SPmUQ16yPfZ6ciHfNRoFik2b5bvC4iPZRHs3adaEey+A+NeSLsTGsrXv93NztE5rIk
	26LfTRUa5ccx+ZpMI7TEGilVaVpaN4GG7m48pni+JValuJ0cYTDCOfJxrHxkcVsC5xP4qgzbsUH
	pwWz10Na6AN48FMUCYT2vxDXw06S275SafFuBvOzt3NXjpEws4Uf2UljlUy2pa9JWTP3oj6s3Eg
	==
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371992485a.59.1782744516519;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:92b:67e6:8ac1 with SMTP id af79cd13be357-92b67e68c82mr1371987585a.59.1782744516014;
        Mon, 29 Jun 2026 07:48:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm2087974385a.34.2026.06.29.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:48:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 22:48:04 +0800
Subject: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782744487; l=2538;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zCPPIEotdSUHd8PwFgThC89TK/453vk/QVgAmXnjK4c=;
 b=EFccj6BHEEeRrzlWUTbw8BogiRwObxZsIqPHY+e7jjnG7UU6Nl4UC2X3L1RNMqKmEJgNMp3Fe
 JQsCWBXPtSOBQ2IDWOHleokIGMiYwdCc2UgAtX0nE8b8obM54A+uwE8
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXxTqQV2gqcWyK
 xxBMUiOGkFoZW22xPpAt2z60eo9ozRxfcbxwMgntyoAEUO8oNUrz2MSEayjVwBDInt557BB5276
 Arv6FevbOHsFFtTR3ds3S3QbJO488nE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX99pcJLfECmI1
 t9EsS2otWd8KCQCK/TpMcJthkpUG0OoIZhKqlXIuiE/iLOsDHQvYe3MkSZ34LqAAyRfEUg6E6Xp
 VMX3TNc1tT/1TmNHijV7WN4J1PuGIIZTxYUZMP5fEeBZ/DdtPyC1Zt/rXFhA5vZPHKjzDpDjKj1
 YkZn1gFf2WhkQk+nt8875qZ146PCkdx/learxvUxH7gIFDh7q4pdCWWqrfjKtXiWPSf/dYMJ+tY
 boVqyXbVx/oGvmyqPQ/MJzRzk0c3GiKc+4nsi6NXoeC44fYnDrfYIQ6jhx2T8uE8rmTX6ZlIqCS
 PZBfS1xrcTEj+kS4yDnl0+g5g+HKLL56cHyNqIlzE95p2q5fLnZig1i2B33TX6ySo/9+WaJPawe
 LDiOtiRdJn78IeexFIqOQr1It/EwUHWHmn7m0RRhV9iksvbKxwsylG9evppJUFd3SPv1xqCHBtr
 IL6T9+SI+c1h3oPMzVQ==
X-Proofpoint-ORIG-GUID: ytUlplrHkQ-ECWXd1fp6avlgVSdl-eVU
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4285c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HhJCdNca9OzhlWWnlXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ytUlplrHkQ-ECWXd1fp6avlgVSdl-eVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:yongxing.mou@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 127E96DC56C

The bridge connector HPD handling path currently updates
connector->status for every hpd_notify() invocation.

This does not work well for IRQ-only notifications where the event being
reported is carried by extra_status and no connector status transition is
associated with it.

One example is DP MST. HPD IRQs are propagated through
drm_bridge_hpd_notify_*() so that bridge drivers can process the
notification. During MST operation, however, the SST connector attached
to the bridge connector is intentionally kept disconnected while the MST
topology manager handles all connector creation, removal and hotplug
processing.

Updating connector->status for an IRQ-only MST notification may cause
the SST connector state to oscillate between connected and disconnected
depending on the notification path. These artificial state transitions
can later be detected by the polling logic and result in unnecessary
hotplug events being generated. Userspace then re-probes connector
status, potentially triggering the same sequence again.

Treat notifications with status == connector_status_unknown and a valid
extra_status as IRQ-only events. Forward the notification to bridge
drivers without modifying connector->status.

This keeps IRQ delivery working while leaving connector state management
to the component that actually owns it, such as the DP MST topology
framework.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5edca47a025f..7334d6677604 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
+	/*
+	 * IRQ-only notification: extra_status carries the event but
+	 * status is unknown — do not overwrite connector->status.
+	 */
+	if (status == connector_status_unknown &&
+	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
+		drm_bridge_connector_hpd_notify(connector,
+						connector->status,
+						extra_status, NULL);
+		return;
+	}
+
 	mutex_lock(&dev->mode_config.mutex);
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);

-- 
2.43.0


