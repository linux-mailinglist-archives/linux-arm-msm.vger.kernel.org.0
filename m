Return-Path: <linux-arm-msm+bounces-112102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xUFQKQ/jJ2o64AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 093DB65E94C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BjptCqzm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MNuBV7+b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 215E430E9350
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442DE3F20EF;
	Tue,  9 Jun 2026 09:47:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AE3E8346
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998431; cv=none; b=HTu/rS+MonXNwAiBLJ95pPPA2jZP/IHXapcoP3FGhD4yfd/m709m4e7kC1vOKjYjdtEwjevN77q03cYAXYoS51O/6SiW8hgIK07/T1RWVOa4MEadISoOWam2KeZhnRl/nRaaNXiOB7SqEbpcEv/k9XHyTJ/Eo4OhPnl2LrmPPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998431; c=relaxed/simple;
	bh=ixgmYJIVCgIesw8IPUX+/UcnW6cdOBjM+XPZmes1+Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/RpiP4UpT66JrvtlHUIzsH6q2OnK6885oUf9CtF4s87erukxSSD5B6PzZbWRHz8dKXBcE2XAstOX863P3Mfo+FBQ+VyLFV1QYwof9yuGdg9ExJsHM/N5Kgw6TxQv3lh5ffTAiQ7yVRo6H6TE2FaajSJ63yvZNjwdn0StsTZ3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjptCqzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNuBV7+b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598Wh0e2129869
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=; b=BjptCqzm590Fu46S
	SjV8Z874hVOI+rjjekLFtOZXE+FSxibiZiuAXMkC17tU4aFExizK3ZTYazEtcJZm
	6SwzytzkilEe5Keoea2/p06+1/aeI4NSX+Uf32stiHlMPAR9zbDTNU1QSa8H7RYE
	e0xvFhAc45JRq9zEeTWzJKj5YIVeyDfrSY2fPM0c3Xn9xjo8r2Xqgjrv1hmwTKRA
	DikfIdaAnQJ/pho12WAh3nPuKTnh3voeaLw2AFxwUeIfMjXVORurRvUfcVQ1Sh7U
	nn6EdL7a873RSbXiljHrlWu3N4ZqAxJ3gkLFkxJCJEefSWWfilCFVnJQeSXvQypt
	J/woNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0a41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91571300242so1341365185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998428; x=1781603228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=;
        b=MNuBV7+bwW4gg9aoGCl3Y3fGOc9IpCZVHI28aXzNDUVG0RjTFkvRKCj4tjWj+kBzBq
         mV+U8wSRKdmMtmxm7hY+WCRWoSfiTEE0qqmimLNMp7nauIEkBmgDJG+FzvDTvn96UJDr
         HO3F0Y/aJmNbPb2U97KxMrsXHq6Yd2PZjdK/GuObB5Yxu4aaBnKJCz+EIot8Wyt/j9dj
         igNijsxaGMmkBkRTd/QzNFUTS8ludWwlue/GIIQ9x0YkKdPqvGPZZy3bIhz3LTsbTlRb
         cJ+3zzYr7pk1sPaGrOwiR22xLvOmM0MM8iDj8k9lGeuDYYPRJOf3auioHiZxiwftan9P
         6O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998428; x=1781603228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=;
        b=W/jmGOgXP4h9uODGkYELY+/1xhDjhqUGR3AKk7gmlFZ6CsB7xVkknLou6WdmyS3PBP
         v/PbRG8CQuXmGhV/jv4P6ITBiwuLhClMS3zIfqgwK23ricZWzcjbcJhwWXNVuWjLV3xI
         BbxRLkHmissHuWsPgIKbXSPPndlse5uqK78hO2EWk9ZmTRqlCSqrtfT9PwpIGugUIp6U
         yUaxKtenIZIXVeeSOYE1fq2hyHPPdS50hM4APCQ4CN/4z5b/JffnA7ZOMM6mhx03HyX0
         6LU4YIcHuAINKczNhKEIV2BUvAJMalFnX8vO69UpIbAhMcS9b6gimQL5LqtMblDO9Lc1
         cjHA==
X-Gm-Message-State: AOJu0Yxyb40jp7F53rILGsLJ5GIqCGjXWFe/4MiqUoBTptbdueSWB0bB
	a6+jcdQBwHEcXLNxhQY9S8m4jVVvTW2FGmOYyP5puBuN5FP4cDWhFBnk12g3hjyMzfEmPgNu99L
	CVeMQJ0eObB1s20cYMWpTgYZ7dwmolbfCnMbbgn5tJgVAtOpBh/B+3osPZAigZpFM/Wpp
X-Gm-Gg: Acq92OGuCXtmhdPMYrQlaZXaTYhr2bEiCrIAGNZyV3ppxTYQJaaX+iSPcpUsDZR6YzK
	/AjMQsP/WMxAr2G5pzHo4/MndRjxuDjpDi7ecAqFxa1bUVm7zLUZEAyJEDHTo0hjlPAq2KFu6cY
	J4gHG/MPze0aJt/B7sSPccY3rQwK3rdEiToFDzV0PuF0IP4zJ8XMFro1H/QJcElKy+BqC740ZWj
	qiBDXNHAcFuLTQl4vhgBtscSIYXxYt+7eeeaXzb6PXN7Hsak6olORzEM/942lOtpBKWjFaZUOXR
	KKykjSz6Pg6TL8vZjwDqXBzZZJCqr8p/Ovz1HozAsF5Kl2ay3CmIlODaApMmNOc4oB85SPizwUK
	5rnDhfc6GDEP0Q7SAcGPsAOgJPZwmbMWKnIScwyFDMZZWeDSb6I1DsNAKDN+DDC8KWcwBDKOZko
	ue4Fvo/FY9gFH4aX00xQ==
X-Received: by 2002:a05:620a:4150:b0:911:fba0:6d09 with SMTP id af79cd13be357-915ad1d400amr2109080385a.20.1780998428120;
        Tue, 09 Jun 2026 02:47:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:911:fba0:6d09 with SMTP id af79cd13be357-915ad1d400amr2109077185a.20.1780998427706;
        Tue, 09 Jun 2026 02:47:07 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:28 +0800
Subject: [PATCH v7 06/15] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-6-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998392; l=1402;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ixgmYJIVCgIesw8IPUX+/UcnW6cdOBjM+XPZmes1+Eo=;
 b=cwLlDtMB+tR/WNLTbcbaBPeGshrJL5YHvytxQA6nVZvm9k5TpQRKKVCK7YY6UwRqok38qz1YJ
 Oelf+qdAe20DObx4b+EmSxo3RijvO0qKxdXDmMwP5DNx/Pd45ZvEhSa
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: tuDZJCFvXpolNEr40kVxhZ0wP0Cyshuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX4K8KNXYwI2Sm
 l/6r+WC9QrwiIXH7gvwDq9RsnImVron92DQYjIMUENxY05QBr2RCIcbpxnB6+1A0bI9AclGUhCC
 Qnozg+zrTf1HKQiB3xrScFXPGQWpgsSxkS5IViQ9sSl7agM7Dk1iZExo1JlqLQkVh+tgKCO0VpG
 SKo/fJpG/Zv+7IxXy1gQolHGHC7unifw9xQCNa21gmasBkxbvuN4bjmtBEZU8BLoBqvzNfROkWr
 p02auIbOvuVfMVbX58RFh4g5ImhDmuRuKItmoQoCThJgg9V8YX8hqqmhETk8DFWyR8TW4r+fRCe
 zB9gP8M5IWxs3VAkgwJmsKwTnEHu5RH1X/6vRen6DduJj3YWCpTOaK+jOKSJWY0KXbSJR869Jch
 QH3gXq+zCSIlag5r5A5/T30gEawHMYcw+FcDJYxBh4EAfIDC3Rkp/nuVURjOKe3C0dV54ljQfpV
 GG3w0XLwErJgfI6B9ZQ==
X-Proofpoint-GUID: tuDZJCFvXpolNEr40kVxhZ0wP0Cyshuz
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27e11c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112102-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 093DB65E94C

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 71d45b2c4daf..1c2eccec6ec6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -482,10 +482,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2551,6 +2547,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.43.0


