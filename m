Return-Path: <linux-arm-msm+bounces-103322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNo8KbUe4GkPcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07406408EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 01:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AEB931025F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E913939A5;
	Wed, 15 Apr 2026 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy+HDyD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9Ii9cnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609539448D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295379; cv=none; b=eIPdr9FCfUy9SvgLP5YhRFCzZ5EAQtUr6EUNq6srP1uFYA3AKbU3TYL+zVIIOCjOcfk/PQNeJIoJY42GD27c/PtfwNbbl4hiSCGyh/0beqveMVtw+R2v3PNxH3nHi8gtb9OWIs7uk/qsDHPrabu4oM5GqggOa8YG81MUifs+1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295379; c=relaxed/simple;
	bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GD2v5dgqWqYtQh7ecNT5vhwBQwdqlyRUr1wQcN/4b61oawce287I0Gauy5ow1RqXuzZCm0CqxiqRpRMICei2jdUKN+ZYCcNruY/z3d3conpqzdiO7t0s9NKIQTreoTJFxopH8IpVLyi9ynddFqBUKjput69Y/nq93eDZs/3m9RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy+HDyD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9Ii9cnU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FF4YRp862281
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=dy+HDyD8rosMW30L
	FUNS2GM/lG+f/jTnHznm8IJHSBbRKc8RhizcSnMXCOajnDCwPJ/IKZK3lnQYIZiR
	5VKDEhgK4DHJVakIozsfYZg7KlcCwAMoGQOmkhSGBjTFSmCtWANSVh5S2uR937Qs
	H0E459ajMWPkg3SVX2V0hyqHbN+cuo+/M2f7gOfIlX9gb4gOjGTiTivjV/7Yp08h
	F8AQkM8ppWipV88ZV6NJ/dxUwcEez1dQlF9I1+cOieWmHaPGJZj2fhGu6Ty/ESU1
	0i2Ir6mBYMoWn4ekLksWwE/zbLXb7CbdULcLrzuFhEX1qItdysCZyXaSC8yRLZ6b
	MXl3cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0e9f51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 23:22:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc1634e43so859731785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295373; x=1776900173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=f9Ii9cnUW8HjhwUOUbk0C/OCfIxPDp7uQp3c79YJeFK+p66USXvaxKaOF3m/ywewSn
         kYT6CQ7Y1hiLdqHEx1WEXDBmQDNSjHKka02Cwu3PiRK3+n+UMpji7eitD1sCc3auntHw
         s77v8jWdfcwzT/tuXdkk7fou43CQB0SBFrnMD5TfetmZxCYPZEzktIfSlxV+s3gNkRGu
         KxqRDRTMR9qOAl5OuvBcQxCkRW47i+W1+hdgdTGeNbhCWTN2SSifEsOH/FoDzjEPz1V6
         vwDUCyC3RZwku2n1xV2Hg/yCcF7GkzSrB05wmZ4NHuwhVIYiG+XQjeIKlWlbJLcABWmT
         YIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295373; x=1776900173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=d3NhdDQZI2AOrPKdP8Ua/f5t5UxZXTFpfkdOvB3fbty5mBawKJQD+6Vfn2tdYFS/P9
         Fk2A5L3D8Q0ruYBR0HfFAw5ca6J4Gl9qVLCZ9LPAfHdJTggNedJsHrzj+lukXjRGVR2b
         oxfKwr3VIQdRQC5m64OtZ5vTB3migM4UnDY+dbMoUqazcm8iraamXUCBAkRmZeBl5hJv
         3VhbC278ckh5Zaweg9dxMue6ckSFcAXq9wNgUYV6qMMbDsgYpeQQFGXsNetn8ymP32l/
         gYwXgSz8Lr4eGi9e+Z19wjpoIumZMNShdZBWMcgQsFXjwdrMsJKRXuMuYRA58XR7GAfR
         FncA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xhh8cQaSwkttizIcrxx1efVy9qbZ+97g5DdZbahw1Ucz8lebIK6YgV61yqz1WSpP+/cEAEG/u/HSV305r@vger.kernel.org
X-Gm-Message-State: AOJu0YyBU6W+i4dv33GyIVsX1zPygj0SAE9UcBfrsVI0gOcqdUVneQBm
	/JCyVa9OeOazyXP7b+qrOCCsppIIKeIMbekhl11jlUZlb843r81xsAyTTVbbdb/5ztdo/hJcORB
	4pMXjvPAaLWKuibhD7RM+CC7Ec9cte8lyEr9lgxgm2PbxnzfrWrsySIOzgnocos8z/Yv4
X-Gm-Gg: AeBDietf/cO6ZMFV0EaKzwUZcuMwH+ZTcW9PKDZ3HW/HhfEWMtxT3X0N/zeOWQ0Bn0U
	hUqLK/HAsifDEq06FffGNSOgETatPijf7Pb0GGTLa++d8SRxxjeh3pvYsvF2xcfYRCb6/IBC46R
	ZiihemGDe3KGDuQXsX75maOHZTSI8UZnIovE4NAGH6lddFI9FLyLZu1Y72/NZbI+2L6pnBQYGvN
	ZCX0lNAPOwDyY1fg6/Mn7CxjcL8HUP24DAbBei2PKeuRBg1aF0njWyReF4XoVWqjXDqQssnI4E3
	SupzBYun0mKjd/jgR0MXV/EIszZ059G1lNmvxBh4JOG8zVdPAaR28G2FhkHO1iuooObC/jtwpWk
	btzL8pMvewoe/DzhxlbitpMjnJCxmSxLCwgEoIGpups6MCUKL3hZeZpEu1FrIP0yzOvDrobi43r
	0OepFbmuKTNCG1S8m/hMRSdqAuakEYtdM6tnlYlS4Jm3SXBw==
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362529361cf.20.1776295372936;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362528991cf.20.1776295372491;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:36 +0300
Subject: [PATCH 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-5-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25RIprvup1/Ku4C5KowC01NBQ8O5kpPwx4h
 eobWONDt92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QO1B/0SHnYn7panRBTo1IS+8Cr8do8q3/z8CG8T6fTAgUXlq7xy/zOnHoCF42M0ieXTyV7YQ/z
 cQnWdqx+Erjt/bwe0xRuejxplCDVdRnwoqJWlkTQa3RRpVC3Pv1J3HETUgH9dQxAe2InJ5RdKbp
 I2lxInSBYOdMD30sbJs2NfKL+tcRKO3hy5lap1+JKBCjWzIKj4juaEgZcxleBs1mdIhAWgzZGUD
 nLFhYljjrwhvhv6dvi+IXD9E5I1faQmchJFUq7tjgSod3CPzjUL4byQJIpqrpRZRYM4mlUzY81g
 41iEJM/GZIAKEMqXIyPiU2UPMeuXPR6g4go3iwvPkEoI4Fmr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: h8yr68S0FgefdbPm562RZM07S7VfEJOh
X-Proofpoint-ORIG-GUID: h8yr68S0FgefdbPm562RZM07S7VfEJOh
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e01dcd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5qjnEABnMYrc5H2CFY0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX0P3tKHcOZgg9
 I3dfTf0VJSgWlUC8jPbEoGPS8rIymRk2gudTwxUf5ZoXjB2819w0vu4r7KQ5b7E4YTIxwkKYSv0
 SHInlunBAq11kV5q3BHDCX30YxeSv6U2Zyj7b9a017MWbVyACD+AF/rOzBESi5eq4Z8zXQO4Nae
 QeeeFqfV4wzPF17qVsIEFc47ORDEqkmjAGv7BBwzR4njxdGa8SI7zMKoa1+6K11N1mBNjQ0eZyZ
 XiEV0xeZWw5mT5+NPfX//tcuhzbqVJIsI3j9AyE9OpzO0AMXnsHvcY5y8BJOic+nRclVnaLfpAG
 f5yqxIsG7ZYd7p65hDaWdMLPdLEHtgPkPst+ahu6WiUG4basmqVGILqsEdWZd2yUeF5YrTcZTEO
 MXXVzMg4agXw2CZn/J8aIBq+hD/v3OqgGOLjKZKj6MVvL/4WLWFenFwpMn6sz1yOA+tyjHgcxt6
 bbCtSaSEPxK4YLvWpPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103322-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 07406408EBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..618dce748316 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_with_irq(&alt_port->bridge->dev,
+						   conn_status,
+						   alt_port->hpd_irq);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


