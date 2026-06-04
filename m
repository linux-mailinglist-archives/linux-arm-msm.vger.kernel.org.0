Return-Path: <linux-arm-msm+bounces-111159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ExOwF3E0IWpyAwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:16:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A909163DEE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="h/+QQX9U";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="MkoWc/4p";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111159-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111159-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B9E30BC2A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E1E1A8F84;
	Thu,  4 Jun 2026 08:08:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC00383C67
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:08:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560525; cv=none; b=na9DsD/IGMWwWd1gesiblqiacEJ2SmzQ1dljgTQu23zhtAVO3NPcPAyTsgudxuiCclYVXiMMmnmy8MEKiR0XeQAlH4J2M7/NI2+epQKznSnBy147y1QhUF6QEOvRANkPEKs8+IkqtYLATVImA1XvG+nAHWVlgAQ1kelTylI+iG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560525; c=relaxed/simple;
	bh=R6FZOcCMcMQPOEjJuz1wW0gtCOFpXybWrlx8i13dpWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBKkHEdb7LdzCg8thj/XEr0BAa3PBTmNsoFLGBR1DsZ2s9OG7qI36z2fneKJnKXM7Vah5DHW86Dt5Yno2bouN7V0XqC9J+sXgVsRGoOJjWXdBT24FuG6OM8KHsBY01E+aeqQ7oOsg/1kTaPOZvHTA3RzCzOqui/d6mF+XAjbeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/+QQX9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkoWc/4p; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65455VT51039270
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVbcebMh6Di5VhpLuMDSJYWN/Rb4djQcDc2Pn3rowVE=; b=h/+QQX9UtObTkBIr
	3whzket8t2XN47q8TBQVJ3q3SfySf/dKAH0e2gBBH5KL1b0ej4ToJn2FvN83Jcwd
	OkIf2ypp/3V9Z/nPJc/mwTntsvLh+PZ6kryJqS/GtLIK16oYhZiG8Dwnt1A55MXX
	Asp65VRQFNEqZp5sLl+bJLwt72qBHTfdgYxKZkHjKOqx2EAmHo03+e76eIWTsYuO
	jI/dLWAaG/0Wxei/y5w84fQkbi/g++HQ8hr6CzZodZEP00YX3E/MmFev+tGGs+XU
	D5syeduUiVaecikqEvVo9by03226rqxrK+7sjn9BEAmwWvqoECOqvUmf+jh2j7ET
	dfD+6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8jay7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:08:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915976b2dffso7804285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560523; x=1781165323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVbcebMh6Di5VhpLuMDSJYWN/Rb4djQcDc2Pn3rowVE=;
        b=MkoWc/4pnWDFKWKXlcZ6cjT+COspdj8pheEowwJUdRISZZVQbJT5h2s2WVcg6OhBCv
         Kh47XF0HN1fvertBUcdMVYOL5d0AtAT6Azoi3kV1emZG8ZFq8vJHuCdma9FbVKQ8Ectj
         OBirbLFG/sHFyWCQfAZ2DUon3fqwQnsxycNG1ipLIiKS2G+ivAKlnzT/C0Ygb7pHXzAb
         xEeRYPFS7oyRbTMb5tA+iwC0wCVkWth3v8MnUd3wi/tCzkUQkKu4pu0XDYeg478tNGf6
         IQ6J8ZThlXowKYdzpwZyPP9DSQl5D1cJI45Sbcib/ShTbL4TnuXi2zzlw5cDGye9wGWw
         vGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560523; x=1781165323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVbcebMh6Di5VhpLuMDSJYWN/Rb4djQcDc2Pn3rowVE=;
        b=bVaYN2si72tiEGWPMoiRW2WERhV2wJBgAtdsm8HIMQ5YSyFTUNv6UACX+3zpSHL1xK
         rlAwlJ4psHi5Zb/6YgIWPfrSBmeERd+acCTCp9i8Nm3zXyngxm94tmbWjOUDO8ogcirl
         luqbG9ns2zeeXYdk8N7X/n7LGCYknWA5+zjZ0XS71sMzLrtZJkwEfmxqghUbYeqjZUij
         2RtGfopC6XO1hFcrNRE/91Z6kAKKeeFjE5gEDnKfRe50tf1s1Fu5VHXDkTEJzunpVI4s
         yrL++lphQ74vpBbUB5uvPwu4WNpozHoLFPYBZMW6a4k3jCxHuGgrVg47F2AnpHUTX7S9
         bH7A==
X-Forwarded-Encrypted: i=1; AFNElJ8GmGBaadyOQfxH9bqqvmqUorbxfJTxaARFmtRQLljD2FRorwGmUpGbzHqyfyAnzIk50DC/bmFYl3wC/QRM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JsP8qe6uQb3iXNGUBXmQCLI+VOrh5P+vJ+qXoVxzaI1OEpZZ
	jjGxrEYe1O9VMYGGwPKAcs8a9tvUHh3h6HvbqsFlfg/73/g23Ph/7xRbizKmun6+vw94Z+2g/3G
	XNNWk+U7NtL92HrSNhyMahOcTFjgbCvVOguvew1u4muBaoFJlb/jbOArhWLThLIdDSKlA
X-Gm-Gg: Acq92OGKqW+f3ZlsU1mC6zBVY0HW7MfYwtxsqU8cMeJ1jOWmnkXpUQOrqSoKk7Z+8un
	cqJ5SB2DuAscWePyvr017HtF1w+nQRs/qeziyFI9+yiJodzW4IBJllozHkh2H2FCaxxGra4jBBv
	AtGWP46e6Lz+h+NKgm8lOwF+WrpTWh50v/cLo4tOLKJ9aFTVddVK96yJBbd7UZtVfEHCzozmrw2
	hNE30kxqqhzDjrA1mcqadI0nBf78LumBA2uzjmzFDewT+2RBUbZpQXRfIwPAf4+7jBnYylZF8og
	fjjnXrJ6C9JN/iLIT4tIQWe7UBUpPcSGFopQIC2FvdsBMLNnWOe/+6Rorr6wBrYtYkAoPawc1DE
	jAnMJ8xgItV/iCHz87p+M0gic8R9D49kowrLQJJOqv4ju3e6EdreLq3VjzYw77zyUKzCtHinCJu
	FaE8PY3D3X
X-Received: by 2002:a05:620a:1999:b0:915:776d:52e4 with SMTP id af79cd13be357-9159e3519c4mr133788885a.8.1780560522613;
        Thu, 04 Jun 2026 01:08:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1999:b0:915:776d:52e4 with SMTP id af79cd13be357-9159e3519c4mr133787085a.8.1780560522124;
        Thu, 04 Jun 2026 01:08:42 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:08:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:06:57 +0200
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=1001;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=R6FZOcCMcMQPOEjJuz1wW0gtCOFpXybWrlx8i13dpWI=;
 b=3UzD5s8LpQciKzqLHwUPKSZ/9f5DdpeCV+exqTJNvMDnsE50v8T6bcgPcxVh6OQoh9Aidfxz1
 58XJQLwOJq8A+N8lLyjoUhER2XJxlNJLkB9mAZrzBaSEV8YgtsMBdTD
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: R_Mxq1OJoRsFpFRtz5pMSlUn128k7Ipz
X-Proofpoint-GUID: R_Mxq1OJoRsFpFRtz5pMSlUn128k7Ipz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfX0YklKfO3PBDU
 XfTbhdbIUjl4iFIi9F1KX2U1zyI2uRKrlade4mCVJ2jNvaW3Yfa4okMSOLAJLRctqhiboCZGvgk
 xNNgp9RgxDQZ9ZGV3vy/IcFVA8G6tABMr2vLsFF22Eq7Wx/GNxPWR0bO9jiYOIqjzB4oaSFBOt8
 gXRxcJ/ytRtMt/C7Z/6qWBFni0oYepr/UwqLjEhxhPl70cRwkrbABBOaigy8lrxdkGPZ/PjjqfJ
 cq1CvtgWsK38To7OliNheAG6fZRwCAR+nliWGJUVkgepH1DAaatHYJLxW4CpmawnlQjWFRXZoRm
 8t3x4UzwBPaUjBjzo9eOqqvlKbSAMWF6pUZ1WG+HA3d3Os0tq0OUk3FqhPdvoHH2AC+aguXBWaB
 D/rFLRVns8NOC67Hxn+Y+YiCsz8JsUMX0XZLseSoLEqVsKZWSo0Rvm1JNZ2FFo5ut9oparvVmfv
 s+ZPfbHdmX96So/2U3Q==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a21328b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cNJI-YeLJ0YrPzV7rEUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040078
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
	TAGGED_FROM(0.00)[bounces-111159-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: A909163DEE9

Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
as there seem to be no issues with the firmware that would mandate
disabling it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89dbf04322730aa22fc9590d180a383c..fbcb9dddfec68e32564e3a4209c3b6f471e0fdb5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2304,6 +2304,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
+	{ .compatible = "lenovo,yoga-slim7x-gen11" },
 	{ .compatible = "medion,sprchrgd14s1" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,surface-pro-12in", },

-- 
2.54.0


