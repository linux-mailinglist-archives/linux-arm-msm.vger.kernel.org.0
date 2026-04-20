Return-Path: <linux-arm-msm+bounces-103856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHF2CN235mlJ0AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:33:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75311434D77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 01:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1529F3003E8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 23:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F0362128;
	Mon, 20 Apr 2026 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFcxKqyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgN65T2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCD19D074
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728020; cv=none; b=neR5J9OiNscFgUwZCAz2dvHBIADLMD6EqB9UWjJRjP8Xz+ir7myXysngg9/8T0b7Ji100YppAaEGSjdkPbj4A5vffQMjj1QEZSPHW5efAOqlSrINBWzBnOfP4HL7CrzYwh5G0xUSaesfsNma9kQNgeap79W7HOqjMRAqky8QTCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728020; c=relaxed/simple;
	bh=YINjf9ePwOc1LBKz011yyCdv56U3Vxqxsj8hcJeg9A8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FdRHbe3e3Ez0FEOWboEtaOuCTcXxQ+Rp5/4WpUpKfwIG605Hm8m5P4ITNDn1/JRndQIJChAwWCk7LOYqF1zMw8Hd+QPcsI+QrlsM4hrLTup8GRePr5v1o2LfcyHeRtTw3P20xFV3MJZKPe7/QpL2XupOsPfjt6IEXlhuBlLJwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFcxKqyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgN65T2X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHOGsh3015227
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XQsfJtP1gB2TJ/00be02TM
	63V5nsoWhB0nnFNGctejU=; b=PFcxKqygGKhdobJN9o9FgmbwQc/TMPOi9rfgG+
	Q/NVPVsNdgjToRzVfKt/X2S6m/R7a235lTLXdfCcnxHv9vcCial2Ogh7IWsOHxgW
	ZzVwbLr831xV9YbwVAaxB4XHFz2IMY/WTQmr24UsVRfxjrfO9VxuHLfRPhJR4Qm/
	8bsQF5rCwsWIAyu6OPzwAdWNeQc1p4flIHWY3DZXKE+CPWFdgh7AWkA2fZskIfEr
	z6AmkscJQSyQnUa/dJE/raTS+UrYWX0GTJA1WczDTswpvskyzSl9hZWFdawpR5iP
	dpakKMTE8I0sFlbbiuIHQy315FxBNBDmi3u+sUZ812p8azBA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuktggm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:33:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca154e2b5so9235396d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776728018; x=1777332818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQsfJtP1gB2TJ/00be02TM63V5nsoWhB0nnFNGctejU=;
        b=WgN65T2XvbTU4jgXU07UUd8kYbT9Db7NvmrRTFtpcLah2Acq1uZj72KVF96fIYdXb4
         l6WEJmEOo50VICV746sexIrMuPiZAoDd/newIx6qggP19bwQLlpO1CVDmLlcX+IePVhd
         abdZ3uR4uKwupVJZyQtlU6RqpX20fr3tpcCmAnlN8eslGaZk1meGBoUGRUVfSiQBcvj2
         9nGCYtSnNRNMgVqMEpOdAqMkSE841nMZht3mmqQkGhWcRgit3n92Pc4pfwtFGSmWtkAQ
         mArX+Q/Ekj8qGZvICtvpZdF514fpfN5SXmjHTXjHXWtXYIcmvE1L6a9gDJwuq1QEnc+F
         UGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776728018; x=1777332818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQsfJtP1gB2TJ/00be02TM63V5nsoWhB0nnFNGctejU=;
        b=pzD1RQa2/55CmVlP7y84WaaZqzdedHjmi4PLTeZAuTnMaWVZNEWSObRzbR1CbIAAu2
         RmU/3iTxYTQpJij8PgbnhY2o5YU/mpcSl2HyEFavwxQO0clkz8k+U40Hobkq78qrSTVi
         /8nJVW/L/wYUhzg/K3OmVJ/S0nNnoIuoVkwhflYHwrNutT7lo6+miCaAur/8M91qzze5
         RnvID4BB5h79t2sgfpZG73nIG1F7ddTIdzAzkH3h+eF7DGqATWJRbH0KKBoKid3jyTp6
         SFGyzA3+cJAl+L9NhsJnrdN8WfBkahxN2aIiuuOtXdqbRniWPAjBKreRSUmBTgD7X9uW
         s6hA==
X-Forwarded-Encrypted: i=1; AFNElJ82kg7B/JClSabUuy0ItPcYrivOg3RHGG2gHQEYXy02q26hAUeLpM1AZqFvtmUPAVemroFizgxXql3X/c7x@vger.kernel.org
X-Gm-Message-State: AOJu0YxkgFisGaR5R9dR/RjtPh7q7sKhgtvke7jRyvq6J6AJFJGJsQlv
	rK6mJJbjFFt03rdsEFbm06sLVRRIkjNYJFWzRZt4LWcsXuG3RDQUYqOpl4FtGWQGTKpT+Sg4f4z
	Q83RVyJRriVCMn6BgqyqU5QM02Q0tRBWo9aESXNXcz4PRVO+BnfTr89pLy2pi6hooAzOn
X-Gm-Gg: AeBDietwW4bcbYl6W19BJcc+8cVzxXTGvaQyTpn18o1CLLcFqAuMUhyVWE7vPn+gxQV
	QhKL+7yoVqvoxpSdGMe0GAYisFJ/snrbEec1s9B8V6hQkaz6sJVYiH+T+nFxQay4AalOflhIR4V
	Ux2B+uNi5lBmD36BoTpGu+Tgh/Lvdc54zNBxibP+oSgb/tGUVrmFjpefzJQjTH4wpzqtoGx1v9g
	rMnacGkCvOJbtGqt6XgCYaW85LU0awHJZc5mJjOzdDvLotlrHBdg4Gvs6RDhNvU/oviDkq4fkOQ
	lwJkr2AEKFfiK5e64W1SZBVH9tHEuka8V9bmaBLl2jO8LsUEp39dSZ4KgiA8cK0g9gNEqgo/Bb/
	kXNH2buDtK0+6YxjUTOG9C7a0Fd925lYd1X9GBUfBQ5fx4AX3MZ4q4QuKv2X/qjqZ0ekdfb5P/6
	UnUZG88uBsRYIhnDxhQRDo2HSi5ww3ByH+TNNn43ettYehzw==
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr227233971cf.42.1776728017693;
        Mon, 20 Apr 2026 16:33:37 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr227233141cf.42.1776728016992;
        Mon, 20 Apr 2026 16:33:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/6] drm: handle IRQ_HPD events correctly
Date: Tue, 21 Apr 2026 02:33:30 +0300
Message-Id: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMq35mkC/23N0QqCMBQG4FeRXTfZTqbYVe8RXWzzLBfldNNRi
 O/eZgRR3Rz44T/fPxOPzqAn+2wmDoPxxnYxbDcZUa3ozkhNEzMBBiUreEHbvqHGDRQDdqOnWIF
 UrCrFTnMSn3qH2txX8Hh6ZT/JC6oxKanRGj9a91gXA0+9N15+44FTRrmQXHOlJUg4WO/zYRJXZ
 W+3PB6SNgJ8KMB+FIhKwUBrhAprrP8oy7I8AT+kHYcLAQAA
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YINjf9ePwOc1LBKz011yyCdv56U3Vxqxsj8hcJeg9A8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfM+HhKIJwr7zvWAAoLigezFercScFRQkcYR
 +GxFkPgEfiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zAAKCRCLPIo+Aiko
 1Ud/CACAR7O1rCWEq1Pc6b+zxeRIfcw7Z3DbjXG9qUEQJnR3Rn066wXoAYd+w7DM0pHAGlXwFM+
 uExom09rZXGybkuk8RMUF9BhFvGeoU+/wz7IQcuu+xNpMoRGwVhH1/Y9hFL8/HTg11Loub3hs8s
 zN6hj/tAQ8eOiW87C8joLay9NhNFTWFRWzDW8vkYckf8QkrsIVzQ7NGKujxaHDwVim7lqB6GMpY
 261dlrExN9eHCDfui4VtxbRB1ghcBss4hsGTG6LNDCvIPYH9L2Z/+yxgVs/eLAKPcJUXhqTVTu4
 009eiMwIy2t28uElKLaLguILuo04eghoPAfPDh1EnKmz4ns/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g5Bbbb4EDftmDlVj-IQBGNuJHnbQ8Lwd
X-Proofpoint-ORIG-GUID: g5Bbbb4EDftmDlVj-IQBGNuJHnbQ8Lwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX1cjISR8capT1
 HakL4rddwQ1UKx3lerF07TuuePNoFoDiqvccL+vp2omgHLCir+Nl0/ZcMblNxvvsoXb5TPOQ9sP
 e0XxNoJrwMwPRKxWEgQ4M+I83mNslDwpyO4fnbkMHAWVzJGD4wyU+5NW+UKaEJzAstenMRpqgfM
 bM5MI5Trg75nPDnz5//0MjkRd717O88UwQMA/2dgdBVwLI22KKNQkcSD0r1+rRB+lg1nGhZgXyg
 qHc8wKOxxJQ6FsgzHTmnd3rWFkhVUxDmlx6qfVGoXiyLifiXkvcJ2mYFKM9goFblXrwjvCVAnAH
 h2rrNnJMDx0HY3C6sQZqjB8QkMlhEduyIV0aU/PmZJBsLyqPfuvwls99ekIYdwZMvMjy5N7fd2S
 71s4JPLhvjIvh+WIzwlex7dpw1NudVqu/O9yihpOFr7oYMBynWh/8aGbqAtxCRtDRgqGL7mHuDJ
 4fr33u5WKFZ30iYxfJQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6b7d2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=52TPwIQhNpV4Ze06EwUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103856-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75311434D77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

---
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  7 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 15 +++++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 22 ++++++++++++++++--
 19 files changed, 138 insertions(+), 51 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


