Return-Path: <linux-arm-msm+bounces-97074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILvGFz7OsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5C269E59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C65603028F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FA2390CB0;
	Wed, 11 Mar 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmytrwWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJdSj1Ss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185843909BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260265; cv=none; b=IBqSsHYIwNb3qWhuOnHvTZfRI5Q7Q2hIL079I+VeG8+hFbZpkgU+J1pqAxWsr2UJpDKuv6L9J7lSo8z8kSgh0Tp5NlrwIRDHaplXEWMWl7iLkW5F67JGALygfe194YltM3kAY37z+KPrlQLhsvypCvtMkDd5LA7eSq/fVxYAEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260265; c=relaxed/simple;
	bh=RQohQzLIQf3hMORNlnLcz8kcaLrfjYXvfR01RWX3LTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT/HIwvGGnr7PumQ4x/I3cc+LCoA4NcoprNDS84XMv0gd/2oW0MD1LbPSwILiFdiy+pEJNUsQ7m3zMzCgwrV0jxyY+WCxG0vfJ//iBdrj9XwIzFhJr7xXsQbpH93k35k6JXlHl7xMPLuJF7VLewuty2LjYqS+yH6oAS6jpQ7kyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmytrwWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJdSj1Ss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BIErTn2030905
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmOhKe3gw//gTAh1/BLAwiMCIzc+UqKCl9Set3+LH0c=; b=TmytrwWjyv5Z2BvL
	P/9nk8lDH1JQQn7Yy5z+5LuW7EjUyD1CGgTeT5bZ2yOLwNaXg/P+UEhe9tNX4pKd
	AmjeGGxgXSf/OWuG/t34qll/Jo6ORphgxHY147jCV2Qck+S1RJdM1DACSk1lLjtD
	RUYw21Th3vfFhw84WH9jkXxlwCUM6baIC525FfGW7wfUSbHbDiJyg0mu/Hjwq2/H
	yUO0+06hfQFgh4ob4gBHxB0vsSHtJ0+3z1hJwQANu7t/O2ViyCYF/oxse3++8rgL
	qRe//GMxtHK3ipB1608A5MOEIeHhw0pcH1zE6AUaVWDPUzL3onsGLnVrNR1FUX/m
	+xbqTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h2sx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so141447385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260262; x=1773865062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmOhKe3gw//gTAh1/BLAwiMCIzc+UqKCl9Set3+LH0c=;
        b=QJdSj1SswgHMKSKsgtvOSw0VBlM9p4TD6jNovZXW82f8tisMXV5vLUB/LOOFsmgKvP
         0mE9Yasn09g8Z4lo2LoickvY+fL2diGJO3wY0XV4rurpExNcRxxknFk6YewyJ75hxIT/
         O8JVquZsqTardwwXFRUJthrXxAQJewgbet07+TXHdqZ9k+7gtFlW3kO6WjSRP1fiY5vw
         tIbdoMsza/JgeWcFjy8WRi/9o30ZELz1tPGoDYlxqUulKQkK7rZLdRgEAcOAwKwrmnHu
         v1T1jV1ICjVyM9Nt9L+4DIHoXSo705FiHf36KbN8wqPGgoGPmAqGbSHsf0LLDCMgyftX
         6FxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260262; x=1773865062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmOhKe3gw//gTAh1/BLAwiMCIzc+UqKCl9Set3+LH0c=;
        b=akC+8mHCSBkoA5nATWIqZOaS31dr0oyWc6IGC5SJOCFcC2kIKRQgxYQKdj/DOZk7aX
         Dt73DvqMRwUfGQPq6RnkuiTv1PnQBpTLaGsMt8TeX3T29MrdQ8gKGrKlE0K34AGYY1A4
         UCINrQYLOUJVH/+BJjzxpzhpbSUFgswPt20oWdFpd1PRMbDiHOy9p4ZY7s+WY8GXyPXV
         N027wPhFJtLEmungx22BpctRezvWtwv/IE9RUBLH+aUbfCEYxUMjkjgvyhAYC1uNe2TB
         2eZa1tFEOpWwdYWLsUeiuIpQUZo9lzzchKDeGiwLLQ8yL7GwYxv5o16g0hjq4V+FelZ9
         aF+Q==
X-Gm-Message-State: AOJu0YyHjqUi+HnZI1IQmEZ+Ds3vXHxciARMm4glC9h8bQ8KqSMjgG93
	ncNpLnZldOseuO00RWvWOsXuBmW0xCCO5f+g3G7XbWKfJrhr6wzsPbQSIi5sW2yUWBvMkyfbMRr
	nNcN+7tPmRniP/VXQXLaCdbQcknhGPYHP9h5uMMmTDlPBipBvMm4HFLRjK5ss/FAnryhggxdkq6
	Vh
X-Gm-Gg: ATEYQzwL/BMZVUms0Q/iBXti+LlN2qm+H1n6FgypOiuT2a5aTT7Kb0yBacTmQxG/yo6
	bRZjJfIdtBTt3SN/9XEoa+2AQikSEYP6l+DpEptaGHhbc4YotC+hCHsatBHiUZT1JqwmugozNE5
	pDo5hlBFR0gl1jBeGpk3VN+c4n6erM9R6sRtIn9TOg/Nz2C/kXGBy8aGtEWFfdM6+OUnf8EQP0Q
	S1SX86l4GjRjmqaOMy9gDAp91KJOxDCG0E6vHbf0GJX77m8Ojg+fPkCTn8Sahzoa+IoMhCemaSb
	Knb0CcGonZQDFHCM7fjbNCp+jrsDvpLIgXG6qm6TBSmVXraRaeYoLN0MC0sdxE3iNFZdgd6PDjw
	XOaWW/LSLWHo5Er+GBWt9Q/Jly0DWn8qhCINs9edNts6+
X-Received: by 2002:a05:620a:4551:b0:8cd:9707:6315 with SMTP id af79cd13be357-8cda19ba6a7mr469640685a.9.1773260261791;
        Wed, 11 Mar 2026 13:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4551:b0:8cd:9707:6315 with SMTP id af79cd13be357-8cda19ba6a7mr469635985a.9.1773260261325;
        Wed, 11 Mar 2026 13:17:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:27 +0100
Subject: [PATCH 3/7] drm/msm/hdmi: Simplify with local 'dev' variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-3-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3444;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RQohQzLIQf3hMORNlnLcz8kcaLrfjYXvfR01RWX3LTw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3Yqd+dsT3DIQ78iz24qnrZhhO/+ftSvRWOQ
 HRQNVRH8PaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN2AAKCRDBN2bmhouD
 1304D/9qVRxNtpbj1sx/tzTfek3tgBKdMTq2Rd9dY7xQthxc7+l1w0aOLM3kn485m3HbmKQFf0c
 ZKD5cywiRDL0qiR/AVyx3rY/60hJsq8fBv79AFUP/UzAx2teDyOML4f4JLo/kb9dz6+CE5yV3UG
 JttKc8rYlWBkhnPIaJacRH4I+boerfgSbMzRkJ8Mx/jM2jbYSGI7ufW757n048YGaWlcOyVeGTb
 E6CvbuLM/aav4NSueabeYSey2QNel/DFMNwPFQL5NQ515HAtqJA1MmPGNvRpjMCaeQ3Vaa3nUVT
 ncXPjGluz9K+dVxBjwvYgAQmIu1Qk6bBRdKkYW4zo7Uqop4NxH9dVe8K81laegNGBzJJ+KLdMae
 kHqAp9iginpThurWsPVU55XXLYhn0IsIyd8ha6ZjF+kmAp/qenpHAjwS7jBm8c3gRz2DzL5x7H1
 xe+iEjm4FMAlGoht4MqiyeMEjwyeHR2BTmRpTSSeVLOyxg0H+gH1fjRHUJ4nRZO61Nhidh9Vqmh
 FCFIJ0WLS7AQUU0aQf8n5ayEuhbYPUHSEwDcd3u9a3oqD8AvknXZJ6n/4qvE2HmDjeDbNdzmtTL
 9+iuVKr8v7YQAxLKZfP76UyIpqMlc0QzpBFZuFnIyFmAanYaRmElEZ9bpYq5L0q5Z50zMZx1Uvv
 c3X3/tiRd2ZvpjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfXzJoiA9avZ/Ly
 8bvKE0vmHzDSmncyT5SS1mEDkDWgoGGdS4qKl6H8GeFTomwDlHa7SJfcrCzBT4lNvQwXuyemO/N
 45rExuVBarek+MU9/zKfsEafOj07eRnMgxg6FRyeW0AkOCJDsZfrxuHPI7ayUm6zgOWDgro49BU
 X9HKTJoxGLm2SS8zPeVDJUP0ag0Y9XQzszgP8OLIaq8wHDkFxIqNVhhzt3KEJuuebf0Q9seta1F
 7ZDuPUoYCFArgWmR0zlPQcERU+5dkuTHWpKBSeTFgsJj8Md4VoZAP6kkjP/Riku91oaYOdoQIYi
 dm1FIOJ0gTtr+d3velmc5/OOg3XhnxBI9l0m7V152lNC1EbnmzlsYn/tjJsmX3SXOQYN2mc+1up
 ZaQ119Fz4mwfR7gAYzRr5or6pOwD199TGYFuVVCDhZaF/2whhnvDOy/bMkSKTU7ebjk17gTujsC
 DNe7o2OZNTQiQDD/nsQ==
X-Proofpoint-ORIG-GUID: ZgGxiDYcwr__E1PpQcTWu7sFku6Q_YiG
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b1cde7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Gs1e6ZCtzmPehomhPS4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZgGxiDYcwr__E1PpQcTWu7sFku6Q_YiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97074-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9E5C269E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm_hdmi_dev_probe() function already stores pdev->dev in local
variable, so use it directly to make code simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 02a87bccab77..03aa29dbb2f5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -278,7 +278,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (!config)
 		return -EINVAL;
 
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
@@ -304,7 +304,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
 	if (IS_ERR(hdmi->qfprom_mmio)) {
-		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
+		DRM_DEV_INFO(dev, "can't find qfprom resource\n");
 		hdmi->qfprom_mmio = NULL;
 	}
 
@@ -312,8 +312,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->irq < 0)
 		return hdmi->irq;
 
-	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
-				      config->pwr_reg_cnt,
+	hdmi->pwr_regs = devm_kcalloc(dev, config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
 				      GFP_KERNEL);
 	if (!hdmi->pwr_regs)
@@ -322,12 +321,11 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < config->pwr_reg_cnt; i++)
 		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
 
-	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
+	ret = devm_regulator_bulk_get(dev, config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
+	hdmi->pwr_clks = devm_kcalloc(dev, config->pwr_clk_cnt,
 				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
 	if (!hdmi->pwr_clks)
@@ -336,16 +334,16 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < config->pwr_clk_cnt; i++)
 		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
+	ret = devm_clk_bulk_get(dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
-	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
+	hdmi->extp_clk = devm_clk_get_optional(dev, "extp");
 	if (IS_ERR(hdmi->extp_clk))
 		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
 				     "failed to get extp clock\n");
 
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
+	hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
 	/* This will catch e.g. -EPROBE_DEFER */
 	if (IS_ERR(hdmi->hpd_gpiod))
 		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
@@ -361,13 +359,13 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_put_phy;
 
 	platform_set_drvdata(pdev, hdmi);
 
-	ret = component_add(&pdev->dev, &msm_hdmi_ops);
+	ret = component_add(dev, &msm_hdmi_ops);
 	if (ret)
 		goto err_put_phy;
 

-- 
2.51.0


