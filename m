Return-Path: <linux-arm-msm+bounces-95142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFvaH+/dpmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:11:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED11EFF74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8371930B92A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D0F31F999;
	Tue,  3 Mar 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpdVb0GL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpUDycrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C42426681
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543319; cv=none; b=de705ogasnA9KBDe/nTRV4g5d1ICHk4hIQn2WI7GcJh4fsE+JNXSFPfCPUUQYvmgTX1U/K1fobTiC25BWk3pcR3ZOVX4xdLY/g5Csaj/JDqt+QGdq8m/iM5Kr026yl8NcMyoYzK5MiJ7ZyR/U0rjZWy1IRg5z4odV8UwUhKimSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543319; c=relaxed/simple;
	bh=KTWS2/nQAIDRZvl7DcGCjzqb9vEvLIrn0vkqqdeMxEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6FDPvPvHZv3Hk3N4qlZutjWidPoGQR5M2ttKCSnn+LrUePkSw+O88HqI+IKg1RswMw3t/CO35idJBfkVqsmQXRBEm5GZ9G1zHV6GR/xLZqL1mWc2zRoYRpHkHCDSWG7UpSvcjZI38H8lnYb4k9UEWNPQchMe9aiO47mRVXFOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpdVb0GL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpUDycrf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mqMt2307649
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=; b=lpdVb0GLWZly1IzY
	63EeO8IhXtQccBfzVeXZo2T8IksXE7oJQTmDyjaurXzcn3DQmLP5OoP8DgbB3XxB
	KYjQHf9SzSuI93qu0dJYyn2YNcVUqw0uqvMcPHsMsfEzwOvQGnEKnH1GT4sLrkOf
	TrS64bizr82rVcFtk0NM1Zmq64aB4VuFgScJCEjsNeZNlAL9mgLU649uSWM3l9kh
	VHrmE30A/vPqUrpT9z0iwi5KPRXsc2rZppKws6YAQqbtgPICegt8XTwOw/9E66Bt
	8FdsDi7S+jQ9emGHVP73n+E0Wc7CDDp1HcehKFLVw7ljno0CDDO/0KFjTE1wnF/J
	4iAUzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu8pad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so569495485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543317; x=1773148117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=;
        b=cpUDycrfdjse5rJkP+krI1OGZppG93slBYI2K8aDp4d9UxO5ZgNon1hmP1B3TdANwf
         r1hmb5hprAaxSMotrBgm/ravrFEoZFniL0i/s6KUcEqCYIBEoG6RBcKnZ7tReI7MBDZe
         HBgPzaKkbxnLmID3soXaWU6QDExcn7GG6G/9IXfGDQO1vx9hqHB9NBSHhiDGArDKFeEc
         OchLuT0Lu1r5yNGzUVbVLOuiI0aK27xKtHsKmFWC320s0sP8/n8OL8aJlbP5tsj11k5g
         r0UY+7R4OvYYVt7r/PgGhfSHN3nWwUNNyYJ3oI4QOUSUrvcEw0ynssBFjcNHWBriSTp7
         oEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543317; x=1773148117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAxiKpKoU8oQrkFg3AZzsNbotCc4DA46qILCX15kAZ8=;
        b=DyRc6XEma4QWCXcsIjXm1fge/cHA4yNPRq5+S6VZreTsqQrEYNJPfl4q0jmApjTry/
         6WQvTv/v0BIN+bMJh6dGzWqI+FF5L/lBVBAtWMo3TvR/oHJO3lyBaoPd4bBvkNmXmnUr
         tCHZlvD4exQb89zGA7VRGdwtD04D3eEPzkglQU/HcgZgc3Q7TeyJXfSJlF31N3oJSxWC
         /4fO23mGtCSdND9eyjz4ONtWFd54L5Cp4Fx1WwdmnOfCUdTjUq1IJ8iEu/ft7xD9+HOI
         1rLbt/C5BGojSDOAXarvkxbNEqqhiIvYv7Ox9xtpBd/GhPE3jSTNS14IAxl/lGuctneq
         VmDw==
X-Gm-Message-State: AOJu0YxaZtJ29TL/goIVRAfTKfUUY20o+x4Dg8LEMi6ncfuDnBKvP9n8
	JrXL2G6FIlY1N1K0wreElXnpLweEoDklE9195ir7bS+zP8yK5PHvxKnENqwHV1G/UziOD6Vp0Mr
	Grm3vJ39yNC++qEg6hTC3HL5LOzBlsfLeC9q3WCWN9YFzLlMb1MLOyXXpSX7bk8VIhSu9
X-Gm-Gg: ATEYQzzWPa9aMknqihemKl4ucAK2GDrshrbr0dJRFn02jH+QxgwFi9BirjtubezwIe+
	5yj7pvmlAAYywVXE6oGPsDiKbfos5VJcxOEw/jfawt7Nt5Owaxa7ToZvYFQpddNBC5yc1ux0++v
	+A3gGpFV7HDlCOd9GN6eyJCi/N5esUT/rBgmOqkg6CXlMtuot5DMl+YK4kmBCizhy0hv/GBjojl
	ABU3mfui6DTZgrUfPgVyWvK3PjgExkLhP39aei6AGJxR14WGGTiO0C5KeftGkq47r45v2VpxsZ6
	ar9yYErEmJUzxIFjCuT86qHVEgPZcgmH6pv4ngIKMhM/qmQvszZIp81MS8xyCh7LwS/Sjbh97d6
	Ht+DCVPz9aSbzKhJmWhqOmfL5eQZv18vo7ZLGAP7MCbAE
X-Received: by 2002:a05:620a:4503:b0:8c7:a84:d0e4 with SMTP id af79cd13be357-8cbc8e8d4d3mr1962864085a.24.1772543316945;
        Tue, 03 Mar 2026 05:08:36 -0800 (PST)
X-Received: by 2002:a05:620a:4503:b0:8c7:a84:d0e4 with SMTP id af79cd13be357-8cbc8e8d4d3mr1962858685a.24.1772543316430;
        Tue, 03 Mar 2026 05:08:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:58 +0100
Subject: [PATCH 8/8] drm/msm/mdss: Add support for Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-8-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KTWS2/nQAIDRZvl7DcGCjzqb9vEvLIrn0vkqqdeMxEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0yEBXhsZJYHmIm0EGwPLW85L4bV9td8R0Qw
 WmYX7n12EmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdMgAKCRDBN2bmhouD
 18/sD/4vBA+Bespo+c0WRMvGbITPSlRpAMyo+GULQADhyiuqs1LjQpLBYAanFPKKaMNOUgDX61l
 ZqkC+lHgrP3xYJh+6FD2qW2WNs8CzUdguJAyJciPX5ClkP6cVCXWdbnxa1FWqwzVp+LM6ZwzPrG
 qows8KvwxcjJk5F7VsKBcD06vm2rdwiqqiOo7HV0T53KuB7F5NxDOgRbp1LeMjw+Qed4taLxiLv
 EaWves3j3a0W4vS78S2iavnAaqvifF8DzJCntUpZltzHATmE2Y9Vu0EmymmJx2R+/lBYgQOf251
 H8SkTAzFTBKtevoDciv5xf/sWNC88R/m5+G5MR7ybgx9xL1puvLn871GymVWnj7SvBJKQ8RSGzx
 XzTXz1LvhG00ojEargOfNZpPbHqYTswJYmXeB+liDzb6itc51bhTDCAKrofcwb9yWs4JMxS/Oc5
 6zt7wUsU7CNjPz+kpKbdEeH4Mt9kofSC8J7EOkxXrQJDGZ/bjLYlAHlEpEBfzyG9Amv5+5l5rqM
 qMMLBJCE+Oy91ngU0pFfBW7SPUdHsWrdPXWusXMXdUNvn4CW7CR459dI4rxa7y+AtuMEDSC8kUX
 AvrTawzjzvGmaawi49mRNpUfDedUKfGFFvY48WWuQJnozd0pHZalMhriLjBbjebXpB8JMLW5Vpl
 m0TX5cPFlk1AaXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Vi22cuEBynDurYl41mzi8qG5cdqeAh2M
X-Proofpoint-ORIG-GUID: Vi22cuEBynDurYl41mzi8qG5cdqeAh2M
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6dd55 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fVstoq-JHv2YdypUvPQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX0B8hbKOySdqY
 YR3k1G+xwMsqq2O8Gs/rn0LysZbwcT7mRk01povd9kPyP6u3ZN9R03FKfLmcMut1Rnt4KDDuiUp
 WdSjWdn+6vwhFlEuXQKa7spVdbECx8NBoBvTqa+lG0FHi3ULlZYtorya62Y1GmKwIla8lG74CaK
 QFdyY3P0EwldW8N5Hd1BDHyFldktXCWe2Ik0fj3+oLF5w92nW9Ru7S2l1XWvBikOwtc04GI8dyM
 9qIwDBSMCcSm+FC/xuzIoVAG1WTVRDj6ki5SeUnMkjOSw3fqCdLjPj2lGrJCqw779xnqwHDA0W5
 pxqq6AJiZz/6aA4hwCOGYeGnM/Sdel4byXIaDDYnnWqmwq9ovxGDpG6jFFAIPbYRkdJzyWnW0By
 omL/hToKOT+H0UzQmR1M3YzvSAf5vLbK3HZs4XCbiqEspFNtB0uzLVsGLyTQBLN6MVJDUCsai4/
 rTDMtfC7nNGkzErlvTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: F3ED11EFF74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95142-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the Qualcomm Eliza SoC platform.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..a86776425f26 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -560,6 +560,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },

-- 
2.51.0


