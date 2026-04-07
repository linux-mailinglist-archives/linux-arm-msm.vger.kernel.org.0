Return-Path: <linux-arm-msm+bounces-102084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKhkJq7P1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:34:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17903AC157
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 899313055DD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6757A397E9F;
	Tue,  7 Apr 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzmRA1WQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLu3Wrrb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B3331A77
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554292; cv=none; b=KZwGi8PCJjF/rD7QD0DNQkw2B5kdCHtDkVSIVNMX/J8hlcLSMu2MrqGtaySXX8RNEctEqAetwOWExqzU7Jmn61NRPTi2xcvPLRODVoiG7H9mvdnHSdNrFxocMJTsYOklCGYyVyjfoN3MrEIMWKmZj0t5PcxUUvwTDbGCoJhTsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554292; c=relaxed/simple;
	bh=aXHT79v/7oLdbyzrr1UpPfg1SOQCQEJgRDXGeMNs4js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlHfYJlxzjfOwV6Txtrk+1cl9jaMJbsnh1oaVgIG9hJbI2EAIotCEeQOAWG8H4u0X2RdEhR8gVcpEUr61VfspRUCdllKxHQ8BROXPY7QJH8UdJccPodKs5tv/NCNFaxNun0wKq7tOXprXejNRG7ksiRUcDA/IZ7pLHt+iQw80ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzmRA1WQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLu3Wrrb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376tIco2549916
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=; b=RzmRA1WQC21TiocN
	GJ0ald+eVXqwFx9+c/RuktHOrXgNsFoXWlk0PQrx8zLVS7uT8Jiy8aatFZujH+M+
	GOrQagM8No/lWDadgrDj+ehFnZTrwqMsrEswI4+Bp+bfxr/K4Hh5PkUqNCdUcKUF
	QVDfi45Z1yktVIUXq2U58UFdsHUiRGNTipu8fPF7ql8ZnwghRblLXC4YhecIWjBb
	GnnYlOde/eW6PgESM+v3CQ9bXEGF/pnzvhZARGERUMxlN89+niNEe3VV0FSJ0PPr
	toBIJaorlDrlughJaGDEJaNTUQozTvUlQJE/5FIXHz9dyhNc0eDlFZ07+KxNefep
	vDs55w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea2n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2523e0299so122066505ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554289; x=1776159089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=aLu3WrrbJV174WMqPUI0k27/CwD1R043xccskwtOr4HSjpTHm5uQWcWadhHsOjD6z9
         I0FfD7eabNnnF2wBJNhQt+20VNVTZjw9nWu8EfOmz3qQGctS7R7Krd6H/lyCbX8DjKyj
         u4l4ZMiPPm6BKoaYMXHwBNvQKnq8xoucMKA0V6vYq5+eiM39swwU8k2kKrc7EQdedHxa
         o8qaxcxrlg5BtZ9+8XWx4aowfwKmFuvpoUVRzNZzUPYjoMDWHzBZy6uV53DYIc5rj0iv
         6OhUFhgZy7NJli21/HJHlg5iEVvtTanmPK09XJ9C4x3LkDCyqR7+RBYlR4MvmxAlVvaR
         ZlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554289; x=1776159089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjxepcNfcMFp0kM4FwikjtT6M4X71nel3jc1Rp4eDPk=;
        b=i2qot/Q3XkPsv5vOzixXbWGyKCjVMQEL2/iQnbJ8UPYZyhl6jRCmLVehUcqmCYJRxi
         xSlHU25Te0ZGmL923nOxx3deMnuSPrW7+Cogw6TdJZKt5alPLUPi4yPxF1ysrMNHLr9i
         juc9JCkRveNmucRe+kQwZUX4/nuH4poCCPlc2kcgtQbfsQ+1ACu/4DeBjljQYSApwv12
         JhI2zkwdpW92GgPb16e78XtHHFU0OiR4pawUjjyFrnm1UiYrxaMZnepqJvnWwmFqQoYL
         RC6JgXU20cvyFah2RI8uvSLiUiQ9dASy3Pix178w7FpfKWUs+jB76PbeS3tBp30x8cmR
         7rfw==
X-Forwarded-Encrypted: i=1; AJvYcCWryI3ZUDAQeAYy67zkjwxpiCoFjAEnx1JWmKF2ZSZmIoml++7ZjKnFnCYLkq4vFHHMZxTBHU25MiqRhtOo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0XodBfohge6x1gGLXKd9hyXfuuxrhkoc4y12kNWmeqf4jyv1
	t9xMZqYLz2/mZAP4eY2EUmI6ebHbmLw4jJEYerrL0yZV/cX4IfttTy4AhAhD/YMIdKSydaO8vut
	uftL0Vl+P2sRITCBKWB35M24ECK1zTDF8sclgKx0IoZtJNRVFHvNFLED/wSDRXqyylgQUKgLXtZ
	dy
X-Gm-Gg: AeBDiesVk4LvXjHqQo30F4QFTPUYId6PwTxZ/9HcHS8/cqWshR9tX5Ndv5fD5WostEW
	u6bQRlqqHQaMf1bP6GrzpKRrK9pwrU0nRARq+3lMb87Q2Jim7XrrK2YXELdDJh+ikpiSu3SzyrS
	sz4q87A3OXGRxdCg/B2tbMbnZGJAlbpkdENDa2WXbHstfr9GdCzXd5v9nOHtVCgmCMwWUxUZS24
	QoWW8yC66D67dSciQmnc0/5GHV/6vquFFW7tqyNspwVZ5RDCfCUOGpUHSB12rb8kPQn0c2m1D/F
	cxm+d3DvKs1r0+M5pzvEBiOBZqaacO0jNTpLLs9fs7VQUJp28UrWkcAJTV9uggxOq0+0xilszF2
	pW2wzhSg1bZUGOkaDdmnRXUXZrlRYcoz4/F/5C52DWvwWuw==
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr176450025ad.19.1775554289477;
        Tue, 07 Apr 2026 02:31:29 -0700 (PDT)
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr176449715ad.19.1775554288963;
        Tue, 07 Apr 2026 02:31:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:28 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:51 +0530
Subject: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4cef2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6udHJU8j9nUP921WRPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: GHBMEkduUAooULjfTGjHDAC2dMhBoMqP
X-Proofpoint-ORIG-GUID: GHBMEkduUAooULjfTGjHDAC2dMhBoMqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX1t3JpYxgdsoD
 JsiLBXrD8Jdb9mSwbzRYiEhdbwmBSZkN/XRsAlwNcausgv/8qHYoryCKEeIGH4MGNdhMexyftVi
 s4TWgqLXvMoxe2EI1mgenqxR1y8r4gZjvLl0+M2NLKrOq4BRorLeqW38JdkFc6dBmubW/SY8Ris
 MVQLzVJ2Gz9Jtd8mLkU7qsCWcRCwgp06mqRtUJ4OMjW2lC8WGY6ZMvtJgOjcTl2yraLE7DBBKdx
 +ubRzJvGvyHEBwriZT+JgxPCW9BK8YuTNRdyzjvPHhkXkM/dXwESq3Q/87bjoP/5tDcmlA33YVu
 36RS9sXEdhZskY8tOCIIiid82E6ci+nB+UsjOnUPZRQ+bCm3KSQtiRr69c8bOnVOjcI9oKuqWY6
 FlkKSe+Q41xO2Hp4Ahf3+cJkJO4ZIJ8RThAcEX+eDl40pBl9VBQqWyyHFg4sFiqmRU6qvfGQCF+
 mGKwcRMoe9ZVxRgxDxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102084-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E17903AC157
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


