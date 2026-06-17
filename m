Return-Path: <linux-arm-msm+bounces-113496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pze5Ix4oMmpwvwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C5696843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 06:52:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eQqj/Yvj";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dse32bW0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE72F302704C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 04:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1CD33F8B4;
	Wed, 17 Jun 2026 04:50:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190533374F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671858; cv=none; b=t4T7Hn6lKfF8VKXo9REX5M58CpoM35fEk9ffJ0QdRmtDfVhlWmJpiIIq7e0FQTkGXYkqSDkJpHt2c3zVvXh9571O591SSwL88e0wlIUlEgqZWPFNCkRjUgfi+qzkmWAQJR1pKsC74orgtpcsS8U125WPrYV13LpJU3nNPUBVIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671858; c=relaxed/simple;
	bh=4KhfG+zDzzEAbJv3mjGlukzOf5eF+5cRrvevXSzCXag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfiMqWMFXdjEoEppMdZzScLKHb4XFPgkLBsZ02KlGxO7oL0qLjOGhPbzQH1adOiV/g7bdh5kn787uxGO3AQBWumwYqkaCpaXbuWZtMzwsCbkixihGfoYKT9o3GJqA4ApFOjkaA94XbB8SnpX9SEOfs7knYo3sXAKR0RhvF3/QIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQqj/Yvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dse32bW0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLU2tp576653
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnaK/CJH28AagYHdX66BizIgavWZBttjkQOL6idtDFk=; b=eQqj/YvjoNzkTrWD
	mcgto/2Lu5DcD6buDPV7rbzIkZEZYaA0q5D3GNGP/45mGz+0UEtjvem5GC3aQffb
	jTg1raqmnhsTXqkyEpxjl4dbvRgXPCmSm5PEsqtwIlcMX5YgnPM6bwR81lz7EtJ5
	NpNx6sEJkwRtIcFQvNV7J0cBNU3PHW5CrDyUN3RKxW11bZT2tFe7zH8YZhQ8e8MW
	iYnQ7FAGz4F61D3KTRDiYUQwetexms8hxlPcLA/60Mb7551jKLFFWx4AyuxAb7hQ
	gyxfavkUhA9Su1WYN7WpCKP/XvvXQ73vR1zGki8Um+SJFq6KCnOo52/JVje4WRB2
	kaWZgQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees1cwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:50:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2f19558so2925871a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 21:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671852; x=1782276652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnaK/CJH28AagYHdX66BizIgavWZBttjkQOL6idtDFk=;
        b=dse32bW0n12ef8/pk5BxjGkJjNBn8tujAFN1bYh+n8Wyl7/mFZipfPsrNSgGG4aT3Z
         g+B3hXzipnm+YDlY8WZziI7sicr+AtEeeujjGZNDRhxX4Et5WOfJGNt+v43FVPIGyEyU
         61TlcN6B09eZXGh4avq3Cs/N7vzQBn0NBioqpxc7eJuFd8nascalLpt4aLDuBYxRPfFE
         EqCahivKBUWZ78MHz3XysBOkvcFxKco4m6wHv2Lt4bsaiuNoiip2lYY1deQfAj+yeF4z
         nBJK1BxVWtbCmrwIFGUVxG7cNtNdTLhUmYIQ28TnFvXOrmcHUF9wFrHaZonWOZxbt6aw
         B3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671852; x=1782276652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HnaK/CJH28AagYHdX66BizIgavWZBttjkQOL6idtDFk=;
        b=BpkWZ2NNPmAB3X2FCli7H+NQrjHo0vG7Hbn+D5XDHwPothu+OyZutPRAR7ihOeHVhT
         fgi1C7+SERjHJwP/Cu+mN6W61vWhF69h3Co3rQGtjqwtBz0Gk8j9EIMSEbXp2BPDm54J
         6XhYZYk9fSCH6OtaPY5MocYib8tgJc/tAmzT2oel3IaP+CYFgg/nIwHLmxsCDpHBs/fK
         c2NGKeHve2xq2Mqfh/vwM7oWXIG5P8Q2rOwSMAD6bodLWw5frmaqwkVHGLy2eXHFH1FE
         4Ugc88cbWEV4HBTDljcbOeNRKM5qeMdJaCsQyJ/P7Iwisqf8uUvVvmwIKTiOYnjqgxnW
         LKyA==
X-Forwarded-Encrypted: i=1; AFNElJ8kDSjjPHJLw0hpwS5bk3OBiS9XDAur1iavAW1Zso6FSJ9qWuLKmYfHVEBH+B/T+orP5bltQtw12iR2A3ar@vger.kernel.org
X-Gm-Message-State: AOJu0YzOy5C9lZ/hQFrDAL59LuRgWPVMDPI8Na+WqQiu6VeNrru98EIA
	h+nKA5+ZlI9e2QseSqhYJQsZaCfRt6MAZpRCsD59uzQXaBpqVSreyHhg7yxFnc81vwOBmE0vjA0
	7LNBoL6Yj/LtsQsysjIVx9Vpu1yBKGL8beVuHxDq/XPl8u2OuoaoeYcTLP/QPPbV2K+LH
X-Gm-Gg: Acq92OHr/yxpm43OJi7OFT+n2OdgaEoGZ8YUgzAIWbShykUHslvQt47cCnbb/q8b1Zh
	GhNYeEuvpzTZUa1TX+l2Mhijn55+A+gSt1UgiaE/H2ENlBN+9XUmlZ/QO6RGmMxKE/Ad+34gMrx
	nkP6aggc2nnAq9rb19vfLaEOX6ekGNz6RLkP0LJZJhXUUu9sD6/UXzahu/sJ+l5VdMEvFvPMUr2
	Ts/eVD/fmfrTH8iypA4JcLVC8ELkRnKFypv4m9Rnxv7QLwjGLx5/MnPrk2E2SygQZEQ6sfI4rR0
	PwMlacL45jn+GcNyUE6dCPVBNGaimNkQmJPIdIkF9B3/BID5oROpQ9qQs6h/dbc6pN6txfVz0Rr
	oum1uFzY1FFnjpnjJxamlXBTEDRia4XH9NeAs19wHjhnD
X-Received: by 2002:a05:6a00:92a7:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-84524446262mr2138296b3a.11.1781671852398;
        Tue, 16 Jun 2026 21:50:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:841:dcb5:e6f9 with SMTP id d2e1a72fcca58-84524446262mr2138280b3a.11.1781671851878;
        Tue, 16 Jun 2026 21:50:51 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:50:51 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:17 +0530
Subject: [PATCH v7 3/6] i2c: qcom-geni: Move resource initialization to
 separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-3-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=5098;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=4KhfG+zDzzEAbJv3mjGlukzOf5eF+5cRrvevXSzCXag=;
 b=C6mmfEZ0OTEt9RwuBJokw0VsI++siG7nMNvB3A55S+cWa1pRO5DCHxV6sr0iHra5coVOd7yfe
 45LQuwKDXqMCG1p3AL6fo6+9EZtFM/a3UAKze92iEFSqRz6+bvXNws/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: _TIOk04Fprgu60c6hN92iyu6_TFz4akd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXxhvo2MyF8vQD
 8IY34LfQ+NSyRZOfnGpmC2S9Jgnnhlllsd3H4zeBr+TBZKCVwFA1Q9pkYcqPvm3M/OMHqBbxejP
 ScCBFK6RUki3lEaVkFbdoNPW67mVvob/gg495crJhPyoxMpUkd4dfRZnInyztkKhRArON7M5WIo
 QRwefrgzJFyBU91N+lN9xExz3XGGjIrixGrb0LesujPwDRoN0sFVt794WLkSLfTX4h2kMZUPpMQ
 5+Y/xj5zGiQtnw24uk5aR9479vQtpq+bjLuV/6UheMemQf21H9LO1ls8o0s+XPKAkxpAgAHkrvm
 pMPjDt3ug4pxcpyIIwcFfgIZ6Yqfbd7VhQmd3S0rNmAp+eGLx1jLK8mOgBb4ParrOtvXaijdVPe
 9n+Z5QlLMLRlVMXNKC7Qi1OpPLT8ICNF38oEgySKoKjXJ8dvMz4BOjAO2Kej5HbjAmqdhG1e5un
 EVFAodtDprf0xiEZ5WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXxQy/mhum6YG9
 tTDy6/lWqUVpV/sD7920iISczVBGgXHnShFbj+1K2P2D4Z+MkHq9pYps2rjPDwCmlmZLTOQlDde
 RgaoZq8TdOf9xZp+kI+6O+pGNqB31S4=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a3227ad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=T4QVXHuY6bPIseVWQ88A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _TIOk04Fprgu60c6hN92iyu6_TFz4akd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113496-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:mkorpershoek@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:prasad.sodagudi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D80C5696843

Refactor the resource initialization in geni_i2c_probe() by introducing
a new geni_i2c_resources_init() function and utilizing the common
geni_se_resources_init() framework and clock frequency mapping, making the
probe function cleaner.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5:
- Added a Reviewed-by tag.
- Removed core clk, has_core_clk and icc_ddr variable.

v3->v4:
- Added Acked-by tag.

v1->v2:
- Updated commit text.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 64 ++++++++++++++------------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3ee0be228d7c..a7672b6c2bc0 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -107,7 +107,6 @@ struct geni_i2c_dev {
 	int cur_wr;
 	int cur_rd;
 	spinlock_t lock;
-	struct clk *core_clk;
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	void *dma_buf;
@@ -124,8 +123,6 @@ struct geni_i2c_dev {
 };
 
 struct geni_i2c_desc {
-	bool has_core_clk;
-	char *icc_ddr;
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
 };
@@ -1058,6 +1055,23 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+
+	ret = geni_se_resources_init(&gi2c->se);
+	if (ret)
+		return ret;
+
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -1077,16 +1091,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	desc = device_get_match_data(&pdev->dev);
 
-	if (desc && desc->has_core_clk) {
-		gi2c->core_clk = devm_clk_get(dev, "core");
-		if (IS_ERR(gi2c->core_clk))
-			return PTR_ERR(gi2c->core_clk);
-	}
-
-	gi2c->se.clk = devm_clk_get(dev, "se");
-	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
-		return PTR_ERR(gi2c->se.clk);
-
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
@@ -1101,16 +1105,15 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (gi2c->irq < 0)
 		return gi2c->irq;
 
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
 	gi2c->adap.algo = &geni_i2c_algo;
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
+	ret = geni_i2c_resources_init(gi2c);
+	if (ret)
+		return ret;
+
 	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
@@ -1123,23 +1126,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
-	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");
-	if (ret)
-		return ret;
-	/*
-	 * Set the bus quota for core and cpu to a reasonable value for
-	 * register access.
-	 * Set quota for DDR based on bus speed.
-	 */
-	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
-	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-	if (!desc || desc->icc_ddr)
-		gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
-
-	ret = geni_icc_set_bw(&gi2c->se);
-	if (ret)
-		return ret;
-
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
@@ -1192,7 +1178,7 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
+	clk_disable_unprepare(gi2c->se.core_clk);
 
 	return geni_icc_disable(&gi2c->se);
 }
@@ -1206,7 +1192,7 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
+	ret = clk_prepare_enable(gi2c->se.core_clk);
 	if (ret)
 		goto out_icc_disable;
 
@@ -1219,7 +1205,7 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	return 0;
 
 out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
+	clk_disable_unprepare(gi2c->se.core_clk);
 out_icc_disable:
 	geni_icc_disable(&gi2c->se);
 
@@ -1260,8 +1246,6 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 };
 
 static const struct geni_i2c_desc i2c_master_hub = {
-	.has_core_clk = true,
-	.icc_ddr = NULL,
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 };

-- 
2.34.1


