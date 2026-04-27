Return-Path: <linux-arm-msm+bounces-104610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JQsBsEF72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DD46DC35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A62D5302C17C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD6B373C04;
	Mon, 27 Apr 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgR8RwP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWAqtXtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03DF361DBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271957; cv=none; b=oO7tlhJrGeGa9f8j+WdjjnxJedTqqNOO0XdqL36jLgYcQHSXORUvMSfDa6TLLJS3G4aykoTEb3crP70tIl9ITHEeM2UpvMNrBSwrEqrxGdzI4dKHkrslvFfEp8bVa66k7p7ysJ+cpuizsZiT/iUrBDYzc+8lh8hS/alCdY1oWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271957; c=relaxed/simple;
	bh=aXHT79v/7oLdbyzrr1UpPfg1SOQCQEJgRDXGeMNs4js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tgg8Q82DScX0cLVFNakF2/y6XRNy4o9KPZ/AH33V+iFvj36o42Qk/KyVqxAo5hcc9Ybmkau2JDPmK7av308aWuP14ZrT68/I34WR5kjhojvWnmGpe/K5DBAWAUFuyJchSgc5KZjskZUKtXbOPwBfgiPnyELm8+zLDxToXICxiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgR8RwP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWAqtXtl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1rPde3294067
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=; b=dgR8RwP9qtCg4A6a
	DZGZ9pucnCSCHA2gmipBUsmnY5zoWFR5Qjrk6oFj8bxAHag0i+z7sqlflL4Uu6nP
	hPPZ2vjj8TvRXmcXVQijP4JnNn7cbHamunNP9sYd8TNEAcMg8CSyj4t8IJZmVPyG
	2JDE8KeFuscoxeF8JGA4g07yrX73kWmpq/5Q9cl+yvLojMnd4oZc16pZN92+p7T9
	B814gmK+FAe0ozK9TcOrNBjCrzeceqmFg771t6NYUI6Ysw0BOCEWdkMHh8ytq01p
	MN20r4hGlSKAyr1vlJSlzMz6GUx3i+fYd5ZA9RRCxRFqSooAJNs+GyenP1bHKF1U
	kMqb+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4utq1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so11582123a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271954; x=1777876754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=MWAqtXtlXwOyxoKHQv7obKla/A04bxtTo0MDuPIyY6uec+E5Q4GNhy7WXAnJ4w1Tlu
         yc2ENfF+w/BmLU8XIiZ0HCg4Hd8r3tFbaf5meHeYBO3dNWztI86/DPH5LNO9S4xRHUaj
         khfyL4gXYpzuVI4ng+QgpJXfpmzHtvOtATAslLuWPY+tfig0j4wh9mmqC8YnO7R8bJlQ
         uUpI5eEsCylL5BJEIt+boJjUElVyhoa3NWHJiaZanLYxArWfBxQ8LDnccwOdMelc4md8
         JToT7ek0GRgoqf58CT4cmgf4DKIHBQOGSSq8YrvphBC2fD84HY9wvwdMRhjFt8LCGQHr
         7AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271954; x=1777876754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=ltLo/2/5qapjzTHhRj6tok9aCWd3mDa88nBBRWknEiERwOfVJ9Fpvj8N+M2X5OxFDp
         12QKvjkEg8lNWRcM2NzQ1vRC44AsHsf9ucpUK/FHtdVGVLkaUD5V0XbM6FGA1pGOiC3p
         xGiQkEZJL3Ui7mj09YWmd1yhsFby5iXTYyRCu0AQOjVQyUmJDi+/N2CvXZL1VujOM+EW
         fqsHMIyEMmb+lQcESxwyw7Y+bNsYYkPuXCFI9gZVKTgvsfwUaeU6y92/2q45V6TfzAk+
         rFNS1Gk778NG1nJhH7o2fu7jOjzGsXUo4i/Xweqn2pYr/fJiA7KL/hiF/0590iOqvLal
         pIAw==
X-Forwarded-Encrypted: i=1; AFNElJ8jpRWH5QOaAeIrIsOHydnlVAv34RPwpCnKymHVHRSz5SY+a18t1HrfYaKuECg1okYdwu3LhBWUe/VdPu6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5uES385VqseRtqe0wSw/pobDZ6iiU25JzOY8ze0uDPDMGbgje
	AyhzTA2RLJ+RAtdoCyOCpTNGZg7KDy1JWPlEqq3RTUS8FQ0IG1e5k+sFoukO5aru2oYV4n4YPch
	VxcsA4p6r41IsN5JuwHYY8Qwwe/bbnbKVb1gLmPr7m4ViuBN+bUzx67+55aQXh8WTW1qu
X-Gm-Gg: AeBDiesmnxy/tPXSiqi+tq+rLG5LUNbg83Ry2Xisz/1GXkV0DgGkRmNjQ9Zmg+x8RBj
	PDpLd1eGbAHsK3hIRejvIO7IyxMPfn1VRq3p09QhIZyT2PK6raQAszA8QY4Nl8aZQujcLl4rqBI
	lb0+SYV8fkz2KY3OtntXf7MmCiIL0Of/rpWLX62pGbDyfwbSobfvzJw6G37TFWG5Wk66iEuxWVw
	n459Gq/ttmht2DkTRtOUFYumUgFx+AG/CEuK1sFMm4+37mhbUqLH5XASAtWOhNm8h4sF39VShJv
	nE2fOyWPsEH6uwJnu5U08pMt94ZifBs1edUaI400ckJPSvdowyFETmos6/VHojIUG0W/p2TQ4qG
	miVBLIixJZBss5aX08eBHa+ecb/lk25L0qp/AGtg6w/9gTILu5yyhxT/g
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr44429959a91.10.1777271954506;
        Sun, 26 Apr 2026 23:39:14 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-3614040b2c7mr44429904a91.10.1777271953943;
        Sun, 26 Apr 2026 23:39:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:55 +0530
Subject: [PATCH v2 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-gfx-clk-fixes-v2-1-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: XekfuCj9dLu5XiSxgsdJhZFTmbFv8icT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX2uFdgG6clNu9
 +lnDMTpJFskVsOcW+I/h2ukiuf1uZxR2iezHDoX6AxrUPEZ9yJ89r4ywvq6JoaIcu9AYEg9zCFE
 t4cBCmzZWKuG08Fie2HL9bld1rwHuIMj2Cm2DQZkvJYWCQtoAqbdXSTxb7+dnSNuIvSVuFUD6Qn
 1zj/5yX6lRvjasyFWY97cLVP9KI3SPw0XXmTQELp9yQYm0yDqtfgr2jZCK0SlXztm88XYnz7yoF
 2YJIXdpDOxBsSTHiXmpH86WAf7N3dwtnNE6J6x/4sVw7ORJU7awdHbS6t8RqzrEnkXM0ORGZiR+
 zBGWgekhdvEnAVXbTwWGoSlM1v5O+sfsnsDGd7gJB/jiuEQ5y+7eNHJ2mZRPx9y9DO7c4b+21SB
 Zpp6A9V4gZmbwVlQumux33EPyTz0Y/TsZo+IBYhnTi8OlIsmtsMu/1jlziiVQafaV7eWqZiOrNk
 cfvdAt/64vfjNKfnisA==
X-Proofpoint-ORIG-GUID: XekfuCj9dLu5XiSxgsdJhZFTmbFv8icT
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef0493 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6udHJU8j9nUP921WRPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: A16DD46DC35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104610-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

The GX GDSC is a special power domain that should only be disabled
by OS during GMU recovery. In all other scenarios, the GMU firmware
is responsible for handling its disable sequence, and OS must not
interfere.

During the resume_noirq() phase of system resume, the GenPD framework
enables all power domains and later disables them in the complete()
phase if there are no active votes from OS. This behavior can
incorrectly disable the GX GDSC while the GMU firmware is still using
it.

To prevent this, implement a custom disable callback for GX GDSC that
relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
only during recovery, allowing OS to explicitly disable GX GDSC in
hardware in that case. In all other situations, the disable callback
will avoid touching GX GDSC hardware.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gdsc.c | 22 ++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa071202455421d818171d04f95d15e2b581fa..ab5d741a2e2351bfac06a6814c5a8ba7355bc8bc 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
+
+/*
+ * GX GDSC is a special power domain. Normally, its disable sequence
+ * is managed by the GMU firmware, and high level OS must not attempt
+ * to disable it. The only exception is during GMU recovery, where the
+ * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
+ * disable GX GDSC in hardware.
+ */
+int gdsc_gx_disable(struct generic_pm_domain *domain)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	if (domain->synced_poweroff)
+		return gdsc_disable(domain);
+
+	/* Remove parent-supply placed in enable */
+	if (sc->rsupply)
+		return regulator_disable(sc->rsupply);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gdsc_gx_disable);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b2f30e6d9e978681580016333839d..495daebaf99519ba0571070b41d133ee867c4fd3 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -88,6 +88,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
+int gdsc_gx_disable(struct generic_pm_domain *domain);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,

-- 
2.34.1


