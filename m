Return-Path: <linux-arm-msm+bounces-103317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Eu9Hecd4GkPcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC3408E3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 267F630E096B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B93F318BB5;
	Wed, 15 Apr 2026 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5D+Jlst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETeJzQIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BA3264C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295361; cv=none; b=soWexqe8qUXKFJn1J1jQqySMI2OV7es6rUGBFJxpF8mfmWnwhrzBzUFYoqDxqXZ5+4nWIYPUUnyhWw50ECXoiq5N1cw3LRWkcYyKbOjOTk+xpTUg0+37xhgsPQk201hPQQsA8LZpvEJY3UWo1QZBeYjCT7Nuj2nbhElyh1PkEb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295361; c=relaxed/simple;
	bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jsr2e3ma79obk82lOwkpCDekgAPv3ubuQgzxFPSuavefy9NtEJ4rtYlhhwaDCgMQbhI033Z96ogEf++oTjrVJpQ8gKSdh1GOAVuloQK9CES009Xme7WH84hdZComIJX65gEI7VyU6TorZwpd/c3dbJ3rsKPC4ARf9D6XkHohKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5D+Jlst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETeJzQIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FFQDCe1702344
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjrAezVeYmMM4Ps1ry3g2H
	LZr/7V5M12bVqxCDqfRuM=; b=m5D+Jlst7zIrpNFlkcMehTxcctR1022cEwiZvM
	OV/h3ebwTZAAhMMWwAJNnlFxcecuZp+eiZSj7bwThxGkGCjNkf434v8v7zRiq8dK
	V6sHHtJo4FYzSszeuAuUZvonwryKRYdoSzCO24iP/r3LpfzV/QUob/tDgY9gvTpK
	YGvfl1oHuys3HNQn4Ecwn630RdL8023nZ+9I4Y07yKbBHNBTi70yWrlXLo9cm3h9
	2Ow5JQpJMP8zFagj3jwRNsNR4SQ+csPvOS3o3X6BGSz0O3IgQtl5WkFSYek4Bpkv
	WysoB2M2xHJmkCDEBJ0WQ3haLX3EEMmTyWlt4hPLL1CTzaOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamhcya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso202205971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295358; x=1776900158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=ETeJzQIenRnt09UGZ0iF/r4h+A5ymPsYudoIBSLF9roxDYylrXGlrt0hJqPSgWtzXu
         aTGmM2Ez+OhCnT6FJvPVFNY0/Z7c4koLHf7e+ZlK8xpV5HCR4bWdJfWxJMN80xLG+NQK
         H8GsqHwEmPrQOL2SrOVooM7T85520vFUxMSxXvHu4kbxgxvmMgnx9vRsWCnhP+mZ/S4/
         hfW7UtS2VoW4X7zG3gkd4MH0kzEug5JVd7tsvfGN+bGu69vjd6P7b5HYuAAow94wDFXY
         XLcdWtnKekonRVsbjcS2/UGEup+qFsp/s7iy+jimyDOryctECNuGEDnuwYWWJuy4qQBZ
         eahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295358; x=1776900158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjrAezVeYmMM4Ps1ry3g2HLZr/7V5M12bVqxCDqfRuM=;
        b=e8fcN910CnP05KiCIMdYD5zYuY5s4qHkQ8JG8ODk14NEputjRjtHSNZ5NTDXF7ytzT
         R9JiL7hXpSO+C6vxJgYc3l5dG/b8loOaFPhRI7Ijpzntpx9aSt6Hp5oRHrK1EkP7fyVQ
         Q2otX5wIU6CYch4Yqoz7ohgXN4B2VPqc82ihd4wxs6UOHWM816ZHbkdtZSZ+UFM8FiJW
         eA0X5hWV26FPUn4Y5wdxecXuu0q5pq0APYV3jAAf2akFY4t2XAdqD07yQmeOFI+tUm5e
         1ShcQ5aWSjCXjxKJhVCxNjMQ04VZUNExsz/7IPaITeECGSHk0kyQicUNsw2Dc6id4mPN
         0Jtg==
X-Forwarded-Encrypted: i=1; AFNElJ+s80M5gbvhxAbe3dPRaks61Le8paa6mLQg/0QoPmowZCoth/ewKxYjIMfkd14tSMzdfuZy0WlVRTy6SmWo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6O3T38bkdc+6kwYgtHzdVgmsp48IV6sFpyvlexhTAIT2HcEVs
	3M2/ZC1EyAr2+VGfcuMSmaZovcVNsiu3XZ+kCZo1fpL7S8yU6G96gfixU/ke07a3MFOK1rEqfU4
	4ZQkRSOrpCkfN5gl1R29u9mfYt/xX6vs6qMXQWHDfgNNmUS++zj6Me6m0KEU9gpzbOer1
X-Gm-Gg: AeBDievcomWXNIsXxKpLHqC7FU94fvKhYfoCY6OOeeGklSNjojXjXwn2RzIZjKcgrDq
	J9qs4kVj8xm9QbkO2GI1tBVCYBRcHcJA8v0xOwnpJRTMf+EQanDJgazOhjmhXWMpoHgZTmBlxUl
	9Dkrv1LGprv85qJLngd7KuFTibz3vCwIdsC2pM6hB+Gi5eOJjSBREZv4issf6s/Kohm28wQHmmb
	K9Q/sld9KTlvN9t7hkw9rhc0StH6hvRa+xzjGYNfOPU3Vz63JUGfvPibl8MnwDhh0We1DJjpJtk
	qOp0jyMx78AqnLldFu9ocTfPbWLnFQo1CsI0BLR9CT9yooi+tLvSUu6BPMnxp2p8evbiuIMG2AZ
	qoqCboHTGfuYAy07iuseRTdDaXbBJExOjK6TMj+dcRNaUXh4+RurqEbnDeKIVcNuNnZRgXX/ywV
	qQFldNyVAX3SGasOaOsPShrQkNWNZZlQ2rybAQslESqehw4A==
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629731cf.20.1776295357599;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50d:9174:cf27 with SMTP id d75a77b69052e-50dd5ada552mr341629291cf.20.1776295357086;
        Wed, 15 Apr 2026 16:22:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/6] drm: handle IRQ_HPD events correctly
Date: Thu, 16 Apr 2026 02:22:31 +0300
Message-Id: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcd4GkC/yXMQQqDMBBG4avIrB1IglXoVcSFxt86XaSaURHEu
 5vq8lu8d5AiCpTe2UERm6j8QoLNM/JjGz5g6ZPJGVeawhY8Tj1LnBkbwqKMynXeVGX7GiylaIo
 YZL+HdfNY1+4Lv/wvdJ4XXIgi2XIAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DGTBlD7qs9HNM7qsl6CaN+vK2gHbwUw1l1hWZUAKoYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25snfl3bH76DEACoBeVZy/UCHClRy8lnyw3
 uY/zfPUoHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1aaaB/9c9WKgA+3medunIFAl2CwuoCesh2/joS8gvRUa71/vNjPKRaDwhbLm5jO6MCbLgig4onY
 jF3bCfXqoO2RrZ9cTVrg1MKZqpXlRdW3BQyhT/DOIKfGPRMdoNyCFz/rU3cI4D0WrGSbVX+yC5V
 51IV2z4RVS6XNUX1aZNn+vG1dHT6XeZoCywbYQUMUEG0OJuZotdNHy1CPjDAGr2m/227RZM/vVV
 hlvH8a3N6EX4o+ASH2W4NGzsOS2dg3yKZKRR4CWR8ReMTZqXsj/7qZfOV2nj/S66/Dj+GQzrheb
 QBGq4goO9Y68lpQRcQm999ISp8uPQr9FshsCDN5JCmNeMCo+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 43jpJ5ejUmxm_BJMtrZRZBHf7ETxGQ99
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e01dbe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ST8Y6Hw29dmLQzsKkX8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 43jpJ5ejUmxm_BJMtrZRZBHf7ETxGQ99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXzXW/yypAO3AR
 D0sonxD/ItBIpa5ub2RC77LOu0ao0o2PXlmE8damPxBYxHKMBhIKBDBgwsfLc/PsAN7QGog/3Z2
 Vo6msbLrkMyC1rANmrqZ+kBnmoQkYC78bKu4lD5ztnDXQExKGEx4RiSDAEeOiDhPpD7TEmL4GQx
 bS0mGG1zkNvkwqngHaljDiOh7fH1Gde45n6mmAiZKwDkmMmbCl3FyBb8QmoGJiRsEvKG4bee309
 MG7hBxvhKHN7p6tbn0T5pzmPsZsETepOKUlE5G9y8wwzbl48lPW78AGESJhG0bRvbTSrZCxhh5s
 wqptASVWThYapKpqrKGar+qB8dnxnOIhpVyKhEc8yeWTXtg6FXt7VTp5Ale5dwz/N0ZbHyWtkZF
 Oz57UB9LmatJD1HE8F1kW5xG7ISMGdgbzN8eDwSX9qh4D2g645UyJN8vzSZr/ELWFIBXsYT6FCJ
 wskNEwXoDbnBzRlGrtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103317-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2AC3408E3B
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
Dmitry Baryshkov (6):
      drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  9 +++++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c | 21 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 18 ++++++++++------
 drivers/gpu/drm/drm_connector.c                |  6 ++++--
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  4 +++-
 drivers/usb/typec/altmodes/displayport.c       | 12 +++++++----
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    |  9 ++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 30 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    |  6 ++++--
 19 files changed, 107 insertions(+), 48 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


