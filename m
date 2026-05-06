Return-Path: <linux-arm-msm+bounces-106090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJraEXkK+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:31:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BCD4D8A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93B0303100D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADF63E1D01;
	Wed,  6 May 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejjIvvFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ib7wBIfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A533E3C45
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059744; cv=none; b=NysWe1cy/+K5DZtTS1zHJxNmJAnLmF7OFKeXEeAt0CAo1wG+TOs8/q4w9bromKNq1U6w3xxv9QWrg3yxRPjf6iAR7TB4ysQlKNGQFmZ6KCHxWRwMMNJicULHDoJp7yYzk3bMjatjk+nCCNoGoL46Pu7gv3KRAokPRe/afW+qpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059744; c=relaxed/simple;
	bh=T+Qdv6cGYj+oFuiX5y6rbaqAhKLYbtSn0vXuqsnWl0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Liw6bFFY2dLpWLYkzli3eJQdl52H4nXtWcEZ0cGDaokRxxmHKrnYcfrS0iLmE2YrsZVLwR6rT8T6OIjFHNgf8uqCCz3kr+5t1swnVDZ9m4OMeJqnk8ycoA2b1/idfNx8YPbEBPW7dOfwGAXvOmSOSjaiqan9kWkmp6h82NzFQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejjIvvFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ib7wBIfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64665QvJ3501563
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JeW4btdKIDofU6NevdnM9/
	25VmX0N3uGE84xfxaCPNU=; b=ejjIvvFUyhXhWvtBfTaeP4mDD937gTBKBeHX8b
	pdvEP+wxnzAlL5pliZn3qURicwheV7GQLHp3AKyU3ZLqvan12GE6s88k5WnpmwH/
	YlTuQ+Xe5/bAu49xdQrUHoJLiir2JSR6lywf5l9opOLyN9tmMjigZZLAsvBtEBGx
	10oFcz2h5Nill29gD1d8Uw6AvDpKx90IHwm+BCOvthaAFjD5cq86UsGfiowEUMA5
	8CTPtMFDT2vly7aJA5tztxCtAGckkashmN+YE8qfNA8h5Za4jrKP3TYICu1XUsyx
	PSPedFHRtDBQgWzr8D7X8s15HsEZxuA2XMoo42Ex31agzjbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhqfc5w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:29:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so8660358eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059741; x=1778664541; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeW4btdKIDofU6NevdnM9/25VmX0N3uGE84xfxaCPNU=;
        b=ib7wBIfvbQjM/60A/zvxau1P2VDth7ayHIcbChWq7AYBasCYnSr7gkyOi7ckUDiXCa
         Tg6V/fzMjNJURgwy+VRHcV84k9D78yDxcmDeymeDCcNvQmpZDrIy5JWCtq/b/TH735ZY
         59zppJrQ+0nIHqgkw37wc7k6GCrxGyST05VfiV4KRRtPA77c0vGbN0QZKGrlZUM/eoGx
         G4F6qMsKsX8J8eij0y+pDA2qqeZc4icXjLkPszIWmMSMPfe5iDL+JUoFiFP2A++ljUI/
         bIWd8ouFFU42vRbPs1ae8m9beAGHAQZ6Ift79KM7QykSsUG2A8l4XfxTJ2W1/t49zJdI
         NkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059741; x=1778664541;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeW4btdKIDofU6NevdnM9/25VmX0N3uGE84xfxaCPNU=;
        b=d5quM70dpG1jUjGnM4fmMSXCdZcVsPB6RC3u7CKb9QIc/EL+iL7rAVUB7nFoP7dD6E
         f8MyDTRuRozSaeHiiqZZpFTUe4A1NYJWBFythQE396w679Sr2HD93WkT4l+DB7pB7luK
         mQdBrsSC+xyGNsfZ3d8TMz/68TH3VwajpHA5+tihOPgMarYFtQGLKGNQGhHBPFgg+GaS
         8UwCQl1MdbruWNHpbxwKzZ/8hKLhiPssSpuAxAn6dM2WLWo+Z7YThG+OtMneVKZ/4m3A
         Jao50cMPSTQD5R0UiA1+sVlq8z38d46S0KnqYBRVApcYKYzNLt0JhNRvoSZfXfYW/HmQ
         /0Bw==
X-Gm-Message-State: AOJu0Yy6IgkvDO/MVigJRWCw/3Dyfqen5ISEwSFEtry7Kb9mSw8v5U/4
	7nTm7yVY+y/xS80cXqitQJhbOrl0NpztoW5A4G9YVWOR7KjidM7tRF9hswkOqoYx4tPjWNdaKNy
	wFamEVdFZKm26mukMHDf7BHYYkqIbMBlEKjKR4FfkP0Gt5ueVfqczgVDNk1DxZUTJn4ARpT2wIc
	Kx
X-Gm-Gg: AeBDietKfbMbGPuL7KWr/IJGL2SNOrD+m/HTL8lrqP/fTjgK7OMNb3RGuli2lXmi9yp
	zGo4NLRCl8igY4oXydgVeoXhpuwrl7f8kYRgwaOIIHz0hZXE8fKB9ACEGZrOI3EOgqhz/CGWeyE
	/HyM+G/dDlpWziWqQAnkFOkA5jMpZlq/9DVoEIOCNLtuL7vfTgGmVkA1rzEeFwHAdac+J3PIbVn
	3eHKRHY588TEdbv3pHbG4XWYwlWDzV5dB+dEMq33Vled4BQBdp3jMNNqihWJuQBAH6YWlyu/VJD
	m5jrl9Skjj5JIe524D3TVXfXISurpsUo3RshXivRI3kdK481Ufee80nBowCt7J3UojzNQgAr7i3
	gtvJmg7I6TRkHjzgnoeLeF+xBhniMsKO2Pu++t70BQIcyzwp/0m3BKpNvjDlebktzDHeCpBM+/F
	5mhOWhZlkA
X-Received: by 2002:a05:7300:bc1a:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2f54a87e870mr1105673eec.21.1778059740144;
        Wed, 06 May 2026 02:29:00 -0700 (PDT)
X-Received: by 2002:a05:7300:bc1a:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2f54a87e870mr1105659eec.21.1778059739579;
        Wed, 06 May 2026 02:28:59 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f891a56sm2831375eec.14.2026.05.06.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:28:59 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 06 May 2026 02:28:51 -0700
Subject: [PATCH] regulator: qcom-rpmh: Fix index for pmh0101 ldo16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-fix_pmh0101_ldo16_index-v1-1-cdc8708b01f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANMJ+2kC/yXMUQqDMBBF0a3IfDcwiZgWtyIlGDOpUzRKoiKIe
 2+qnwfeuwckikwJ6uKASBsnnkKGfBTQ9W34kGCXDQqVxgq18LybeexRojSDm6Q2HBztwquX1fi
 s2tJ6yO85Up5e5eZ9O632S93yz8F5/gAQYdLgewAAAA==
X-Change-ID: 20260506-fix_pmh0101_ldo16_index-f28b6075a3bf
To: linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778059738; l=1464;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=T+Qdv6cGYj+oFuiX5y6rbaqAhKLYbtSn0vXuqsnWl0Q=;
 b=exJYFx9j7nNtbUL0KJxyYp64MYwQUi5DfPkf600no40lpeS1DD7UDhMaqZIc6yNnVRfG9p/9T
 l654KK+vaQgDJKYGitwtLNfvsx1b4KjntH8AeDgq76BzdSZFuVX24wt
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MiBTYWx0ZWRfX3hk3Kq6jyYr9
 yTKdrT3dlot4SSfFuwpUPa9YlkjIKUsvjdKHY9hsstdSHKQddTvPdAefsLTFiMR1n82BO4ggEI+
 lE2GBE6rOZXPN9TReNl2MAjDaW3/BszVw5odFzLfnC081XGxag7Rk/MAuwF4D4YX4itqK3XSuOP
 EGFRbRKZ3oD/qMnXsYDPC70DEmgJNcIqm+cUaqBho62AYL7sVgV8gVxHBeZlYswF0iBQ19PNswX
 QELlLEBoKoAWcr7VI0SEvl9F1KCTSlSUZ3fPlhG79sYLpPP7+VnxByEdGhT1bV75L/5R9R+bjrz
 R13VaWtC/nq/VN1x99ALWodZzju1mSrTQmKC+0oWSDW94NWWQTN5muXwhwIR2GD9EzBFKYsdVx7
 pVdhndt+frNnMELLEqOe5fQn4kTcXQ3NfwR3e9gvNcMazafqjHHVzH8ZejWEXpWFctm9xF7IgId
 YkeGRecAhlFrbyVQHZg==
X-Proofpoint-ORIG-GUID: gRPSzwSYoBQobA6EaBg7gTjX3ndkY44g
X-Proofpoint-GUID: gRPSzwSYoBQobA6EaBg7gTjX3ndkY44g
X-Authority-Analysis: v=2.4 cv=NPvlPU6g c=1 sm=1 tr=0 ts=69fb09de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sl5TNEKav0rFBXLhlNQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060092
X-Rspamd-Queue-Id: D0BCD4D8A36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106090-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

The wrong index is assigned to pmh0101 ldo16, which results incorrect
rpmh resource being used when the regulator device is voted. Fix it.

Fixes: 65efe5404d15 ("regulator: rpmh-regulator: Add RPMH regulator support for Glymur")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca..0dcb50bf5c35 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1512,7 +1512,7 @@ static const struct rpmh_vreg_init_data pmh0101_vreg_data[] = {
 	RPMH_VREG("ldo13",  LDO, 13, &pmic5_pldo530_mvp150,     "vdd-l2-l13-l14"),
 	RPMH_VREG("ldo14",  LDO, 14, &pmic5_pldo530_mvp150,     "vdd-l2-l13-l14"),
 	RPMH_VREG("ldo15",  LDO, 15, &pmic5_nldo530,      "vdd-l15"),
-	RPMH_VREG("ldo16",  LDO, 15, &pmic5_pldo530_mvp600,      "vdd-l5-l16"),
+	RPMH_VREG("ldo16",  LDO, 16, &pmic5_pldo530_mvp600,      "vdd-l5-l16"),
 	RPMH_VREG("ldo17",  LDO, 17, &pmic5_pldo515_mv,   "vdd-l17"),
 	RPMH_VREG("ldo18",  LDO, 18, &pmic5_nldo530,      "vdd-l18"),
 	RPMH_VREG("bob1",   BOB, 1,  &pmic5_bob,          "vdd-bob1"),

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-fix_pmh0101_ldo16_index-f28b6075a3bf

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


