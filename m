Return-Path: <linux-arm-msm+bounces-102088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IW3A13P1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD123AC0E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 012F4303DF5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C9A3A641A;
	Tue,  7 Apr 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0WCVjDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvKg6+N2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6D3A545D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554314; cv=none; b=W1wkeptPgVET3H77/Vjd27v9/GreC6Lzi55QTsp69QRBqqpDaCn942kwz/PLewWFJZ3n+frRb0cJkfUNwDNYXB4rUelAhrPn4k5dn8g3KPZdjwzmZaPppJNxYNgVWwMrXQjIyqpZoccgGwDk6D+BzxeG1KnbDi462AUEc0uJMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554314; c=relaxed/simple;
	bh=akcdbGGOHDyFpDJgNeVO17N4YErBzFZbupPDnt0Ff24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVvYh3OwOo1L9pMzBeTw7oK6zZFIqcnPXuHptAkP2UcUAfV+r3C/Xri81NV6BC1fZcKL8JCTtMwd4jxiYjjPQELeMtXNtTCrpx7H/ny+9SJY105E5OVLXMWjrG46wZ5FmJGNsF//0ERaatpnnkTk22MGGStkFQ4MZjkxf/GLFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0WCVjDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvKg6+N2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hNEa2580434
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=; b=G0WCVjDUAL1pV+8k
	VG85v2CD80fqCz0bNic7LL2/Il0Kd0hyyElJoEqG9Pacvcd/hKsBuLqjNLMTJhLm
	QZHRt96lBTeBERmtSP+oMIjKOXepDH4bMUhZTnQI+GWZtKxWF43MMmx0AIzBcnQE
	qUgsFIWLeV0+9JniJJ2u+V9NYilQbP7O5NVDsgVjJ6mMlp7JIexY+2aPM/RpfuGH
	Hj4gglURXYoq51+IyDb3EXqmSmGKAA6jJkWmrrzifu6GnfC1DwNpV83LUsqahPYq
	ol1Ty4AZ8w8pkTh0rWPn7+Z6rk3jCPyuoKKyjiCtISyrOwC4TJh9fpm04MAu7GmK
	RhR6nQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf22jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c30b51bfso105703615ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554310; x=1776159110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=VvKg6+N2g4aNt74udD5934GasTpsNVWONkx/QH1c8YTVgnILkZcGRxVDkRNgH28KUR
         bjb08BFpgzJazBCRWl+WSMgJn4kLrBepcFPPpqexaF52jPrKLUgWsm6YjBsZLwo/7/as
         S+CcA5Dk7PJZ56ijLS196vE7JpX62sSawSXpscRnWtMdc3ERB7Q7eUnu03IbmI+PTw2z
         paN00ONnT5WKvUwLSDgCChcbb1gKIRO03RqFb1ndaogRa5SPCj2VP7hV3njKi8kuqLkg
         utn9idhy2WVIltklLK+ZwfNfAiqs98EPn4jCVQq0UtUnZwEg8C+bIot43aI0OovrLfxV
         D5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554310; x=1776159110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSBQhnmXvYIy80xyS3AQSG288sQxr/HSk95H/lT9kno=;
        b=rXXE8tjTKrwk/Uv9VHChZknkw6nQi9bfTl0+9tINSyCXtvkQiVH2Kq44dPYC0kTuMF
         1wOBoiq8LgHGwT2um5R/yidXFA7JiPxyGDf3nGwyefvor2v3XfiiILmXp0tAKx4ERfT3
         rWQcVcaoxca3p/947Od0XTzbx4mHK2FCvdPLyVN0y+wmdRVYNkSFbJf0dSLXbOqVJ5i+
         QuNmPj5LMPO6oXW1oxvkxOqd2J2cdstb7agwWDkwtBYK0tRFPjvAZ2MoqbvtBDYds7/w
         grl+ElpYj/Sx+P9Je5jsQ+8PN2Csv8OYMUqxldSbH3ek6PHR+N/mNWG+pfe5kKErxWax
         KWMw==
X-Forwarded-Encrypted: i=1; AJvYcCVK/gPpkfXJlDNXlUmJaglLzGFVOHYZxiUYYsucH60jNSDlWdXY6026knY/D2mu2n+yFfVuBmEFPmDhsVCq@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrIMuYiEF8SeSIJ89N5botILB0JHA4bD8xOEMxURUmMkZmVCD
	VhRNek/phZ069GY5KnzU0ag466WqjEprPQyI29P0vVZ5q2AdwphLTP2YEpK+HesYi3m72O93Ayx
	FXMF2+zAGt31YMxHCsBdAcexJ50zu+8XEAfbPXq6hTD78YD2op3gA+g1yTcf4Mljfqt/M
X-Gm-Gg: AeBDievn4JtwQ+jUPbtiDlX/HW3MKlnULiPIXuDZ1jmXC1hDqtanWn3bGHG2adbsBBZ
	nK1/7a89MCc2YBoj5koGTA7xvUTmXGFo3cNlWDpeK8GZePc6HsZwfmhpfE7gRuvGtqEC4eGDepF
	9w+q73Z8dN8u0yBlZZ+PFjm5RjGaFb/7X5nqULMx5BLRYwBJZRWCAfG7p2pLG2E5fdgcR+fN0sV
	+wK+6C24ckUngeQGSrpNfdm9OMWOsa35VRaAKuTyWWkgCC2W28mjSAs3J8mNerxQoo7oewsOwj9
	EBD08gLcE4nlsZgSnXGwAxgAtRN+/4/Wos0zuSFmAWO+4FpYwmTSolKaz98pgZQpaxluUYEz4dE
	VlgADZc+Z9mwxrwHftyPnVhVk/7xQ4X3klTN4JUNWLIYr4g==
X-Received: by 2002:a17:903:1984:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b281801499mr167754325ad.25.1775554310561;
        Tue, 07 Apr 2026 02:31:50 -0700 (PDT)
X-Received: by 2002:a17:903:1984:b0:2b0:72c7:3ed8 with SMTP id d9443c01a7336-2b281801499mr167753945ad.25.1775554310009;
        Tue, 07 Apr 2026 02:31:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:54 +0530
Subject: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfXymKBDamiFUn/
 YH+WHnUBRwLfK+ayZ9cBJLXRyRbnsownggR3WphI+K+GomEJLrMDz3SpZP9QVLInnXr0z50eBH3
 0ADPBy55NX8TWdLQ8GTvOBTJb418HbUOoZ2XPkmvjCsak3XH8G6/XBuLhHxI/fOleIJflrZgMrJ
 Ro1jQg8QRDoGktctF8JfpOXsJQtdfos9yVxrMjyZCuCk5NrphF1Krg7X9SCOzwCOrV0NGrIsmeF
 w/ftxdyMYO3WyX1FghbTnHLk9qQ+8HxR2+r9MnKfkaNoKd508dalim62fNaV8ahZqBSiugdN13y
 cX6wod7Rg4DkXBkicD9h/oLxIeIKoOF8ym9xS5Bf/KqVYyyoVl7+zo0IQojEUTfr6Fgka7uB7Dy
 LKSLZXCxt/pC8AWsOM13HwL59kHovOb4MxvB/lUAUKi85YozCJafilhgO9PvHLZTj4Xk0kFQT6g
 LfuwJ7GS4df3RbqO59Q==
X-Proofpoint-ORIG-GUID: td6i5u2yKQhd4vEaSQWKy19bv0IbAJE9
X-Proofpoint-GUID: td6i5u2yKQhd4vEaSQWKy19bv0IbAJE9
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4cf07 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TmjMgu7cwLfWQ02JmboA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102088-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FD123AC0E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The GX GDSC control is handled through a dedicated clock controller,
and the enable/disable sequencing depends on correct rail voting.
The driver votes for the GX/GMxC rails and CX GDSC before toggling
the GX GDSC. Currently, during GMU runtime PM resume, rails remain
enabled due to upstream votes propagated via RPM-enabled devlinks
and explicit pm_runtime votes on GX GDSC.

This is not an expected behaviour of IFPC(Inter Frame Power Collapse)
requirements of GPU as GMU firmware is expected to control these rails,
except during the GPU/GMU recovery via the OS and that is where the GX
GDSC should be voting for the rails (GX/GMxC and CX GDSC) before
toggling the GX GDSC.

Thus, disable runtime PM after successfully registering the clock
controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index d7cf6834dd77c2a5320ffb8548cdb515be237bdc..d470ade11b0d11eb40843fe84c809e71646dce27 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -7,6 +7,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
@@ -61,7 +62,15 @@ MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
 
 static int gx_clkctl_kaanapali_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	int ret;
+
+	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc);
+	if (ret)
+		return ret;
+
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gx_clkctl_kaanapali_driver = {

-- 
2.34.1


