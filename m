Return-Path: <linux-arm-msm+bounces-95890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILCsLScGq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF872257DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D53E9315F231
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F854279F6;
	Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo8Nwd3M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZW5aji/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730CD41B360
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815663; cv=none; b=E8JF+5xVJ2qIHSqhVHrScsTQ4p2xyXFzmAkMr3Rx0ZjFccs8eWFYLJKG2Dvdtm+jeLUijc43rvHXhrxxB+n2sY0RnSaydwdqzk7lKf7WdGUq9lv2Ne2OJfwwGjsJvuu7tJ+o2i8wTmBmWJOYN+DDfBrTjT9wqamhsKcM1XTGhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815663; c=relaxed/simple;
	bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWjbca/9BKp/0yRUFhSnx4WLR40CUUV6JE3OZWxyGcTqDAK5xXkaoWKbr4M5A0bipL61E73Ig6kAKIcAV/baughV6zkjPQOBBtizMiPUgQrsIMFgOeF9SOuq4nHO1dvEGJvhgH8IoHJWBcVyGPBwCEvGQyLip/89YuConMsbmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo8Nwd3M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZW5aji/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrMOZ083012
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=; b=Mo8Nwd3M4MIJKTJH
	gMRjuGDEY9pr/EtnflqEOJFHn5zQOokp2UUS00B8IUA32El4IZbjeKVe/17IQ0mD
	OF0VgTVl35aI685dBjmUWeEC/+wGbuBeffmfZIhhtamL0Ym0FJQPE2ioNOafJGuu
	95tsocTXyJ5CGh6+90m/qwrefFHYjDZ+a9vjkrZm1lsdNXyG6YMDeH97UKL3jfY6
	cgyTwb65lUP9pG666Fibfl9Ng91HlW4x49tvHlNE8TnWGv6u6Qm3rVJDD3zeOTuc
	woa+bCuzrCKt2TkNlK05Vz1e7YOg5kIlBWz54Z7YYWPASjT0ip1oSuuFqFIEP5q5
	rweDYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4944118785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815658; x=1773420458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=ZW5aji/L3WaQBlE7SkvGfkmix1SO64f1p7sCrkNfxfu0mWWy6AK9IMmqDX4UmvYocb
         rVi316Nnlda35PBJSBHSXQ76NjPaQL6avhCWNbpgy6xjgW7LdquTt2WQp1jYIlgdMKxB
         NbAblhyx/2piy2HFYZihs6EOgZWj8wZv5Z4dGM0kAlGwRl4EJk9iUg+qj9IdoqXef/7P
         3dbE3vETdw7a5ifPFILWHDEemQXDjQqdvpwpqdrAyYtQQw4N2xvMEvnkClkvSHOoV3EQ
         PGYHuxCA/BBnWj6imMVBChXGGw4cC1oGu7h/aCM0Kn8pOSxIl49R+2J7vWS3hpNJNVpe
         mHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815658; x=1773420458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
        b=bXQZFTDLjRUpBltO9T+gwOMQZ/nvlKIq0/rJAzvUkeF47N0RXmLrRd2BFt+wvKL7ny
         g7D4eTVNVLpq83bK9PWjgn9a6fM8BHceIr9yf11J13hxfV0Jai8Rrnq4dRKS0gnQH1sy
         x+hwURFqhrraeN//kVihxk1XKTimRswBhptY1yCTHhcF7OUnL8RgmluoT6DrCiTtUGBp
         +uhNHDQoAMOhBx1/oiU/tRYZcEdM4rjhlxQAObsDEtvLk3MBlm6ufIENW1qVfAQXNxFh
         49F3d10gHVb1oy7X4EB7tk4MfonIXeMmIRrAPOyVQxai+UbNlo3nTHYOIza1MlWYuAZp
         7tng==
X-Gm-Message-State: AOJu0YyagKd9UY+WZ293wxZ79nWVsp+MjXLZWpiogNSKmY7j2IOGq/BD
	pdptRuSoZPetVttlAM1iMQeG2ozY5I/Q3ocLOuZOenJsbrGvAnPYxZNwX1+0zS7cB2RnEmw7L0p
	TB3BeodZnAy2DRtHpnJa1YR3Mxr3AWtizYutvLwgnHyntCUCWPzPpur0LfkfFudVb5fdz
X-Gm-Gg: ATEYQzw++Ru1+KI9crdj+8e6bMHn4J7fn4q945EbXdH2I7DnHlEe1D+jijdQlxWr9cK
	ytuTJOoktl6QuSQmDadI8nHMU2SHu7mv4KefTdB2Fr2TXy0oofDhcyoQ1QM2rG4kMvtaJyJTX8I
	tJJCJxmH0OLX9xKdLG5TXPBw398H92tkFXGoNMSFgFdv86Ur7fhKYx6w6vc1rDKi5J3nI9BCqXX
	Mt3YNP1tmnJoGRB5frCTj/nwEPG2cIZ3r7X6q6irW/a8fcJeN7kAtkE86MS7ScdE9tx3dfFJg9q
	uHJTCKKrQUyTgNqrhEylcLsBvTOeeE9xiv6Zd9xHUUHrz7HICi35vIRXulFTZ2bPJjd3G7pVvaW
	rdVNYoDT+NNgpqYvaKhSC+s4trs1s9+1S1IEKR76Ki7D2Dt0v7eI9A5toALOBpius09oX+cDy5G
	pjDHWlHnTqfnrajWziGOmE7Ov4P4X/hQ8Zbhc=
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id af79cd13be357-8cd6d44199bmr345356885a.20.1772815657439;
        Fri, 06 Mar 2026 08:47:37 -0800 (PST)
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id af79cd13be357-8cd6d44199bmr345353785a.20.1772815656971;
        Fri, 06 Mar 2026 08:47:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:20 +0200
Subject: [PATCH 14/24] drm/msm/dpu: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-14-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOe72d0ff8IYJr6eCZASzSx5JMmxu/GZKTO
 1j+DdC89oaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1TZRCACKEJlsDwLebkHT5WKmGXXP6U/u9hsEV4J60U2+TmsXK/aV+XiwJHwzs1I4E7yy5PVl9ny
 U+9WF4fLO2dsaHD25UhmwpzZ3tBbs831aoqZ/U1CUQsB0r9BzKWmmTuEWZD126W9UmqaJvwEW8d
 eIGjzAc8XPMHhTD5/8EtZeNWDAAP7Kqu2Zg42d7vSObGox0Tb4x0irCBRkjCI3huRV7PFuDOT+y
 A96mczQNmJ+Y2W16vL7u82ql87bQKRm/RX3e6PGEJEi9mGKxfL12n2yM+E0MbckaMRapt0BJ7bm
 AXVNaEahYhJ98K4LLbGsG1G/F+YDfZptgq9if1CaA4ngG7et
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fbUFESiBwYip6QL4cNZMFfQOJY2VJ8IK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXzb4LVFdZihvd
 1GEyCIkdlLGHvDBUDP1H2bq/mqigBVwEkA+wIlAdjxRjq/7uujJwCAhdjerpFnc7iXn28ZwtAHl
 Fa7IC1aTgutRT+AFMZMClMJ9WBMaMud5Jj7tAkEQzrVwvSrPD/lpfaUuZqiIQflreDr45RfW8bn
 Us6Wz2PXOnROG3rNwsFYZTWHy4NkiPg+xdpgTw9uk+qU4v0Se6Uf0kykiNj+hiI2pLOrSfW212b
 BN4nOyrwgDr/BNIvtVHlMCJFrthimN2+1pz1vqJDhMlHmTv3M2x7CpOImbUmC/EQn64Iwpg40D/
 TSnksFgTMUy/Ygd2VDrkjjYQg9EagkhxCtNHZPnaZ6qb1LazFTO3gentlIYGQPOOo9sgKxaM1xE
 csD88YoPC5as7ftSYNDworX/P3ltWAQodCcnvnXqpbOajjKQ7cW3q9iGnBRiMbU1h7qvuIcQPAt
 DJ8VJqHfrqLDeeuUFuQ==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab052a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fbUFESiBwYip6QL4cNZMFfQOJY2VJ8IK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 2EF872257DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.924];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..f424be5ad82b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3


