Return-Path: <linux-arm-msm+bounces-113709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sX7lDoC1M2pUFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF569EBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Ab9ZY0S/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TTPytgBp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3F9130B6995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A97D3AFCF2;
	Thu, 18 Jun 2026 09:07:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E13A7D74
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773629; cv=none; b=qd8V8V8nU5W7zZdyWHAZM0XMN7o7+7VyUY5M25KjSdgPln/mM7l3RDV5zUwqlOQQBhJhjrOr9Fx1Zek8A7ahFZqN0nM25xL9i7UbHCcReMNoj/s+VfdhzScIaeEhWtHbJP3meWAOq5/x3MnCl4ran78V2HoCf0dFeEVs7JeBi3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773629; c=relaxed/simple;
	bh=9YWKqHG9h+azs7B5xT1AGSTkv5a4OvLQRAny2OdFtmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhCpJfVH2O0GTCKap7rXvmWNcvJ7HrBDaKckwN0FmlgQZ5XPPwiUGYcvpvOaGD5LzY83sKAF3U1Mc+EXbo6XvOJuDIm8s8VSPoQL8ZwWkZXL8gIbxcXugcsqgtilXkqf7AFykc+Xezc5S3ex+pF6QkWKdAJhsxcb6DS/c5puUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ab9ZY0S/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTPytgBp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FSrd975790
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=; b=Ab9ZY0S/VgFjCrwy
	aWBhllKfjuhMjFY+8zxesXfn5PDrVrNNrjgAsaR9gLudSHLGHB3X4mMR7SRZVV/V
	U9OlqOrfn0mGdnLDPNJBEz4kt2Gdm6k8co8cph0BoRyXnBPUb5RcW21Ri0vPG0El
	Mqhm95WPmppQjR6MfVcfGaO3ICQCd+AMjdQYuc4jhpBpwyh+4rFlYiFJ5scMvUVz
	TBKbDoPaBM+Qgyzuw1/rdVvgHzv5DqtMYf2on+rt7ArEgQZSSSzw0CxCnJmhD4k1
	DhrJ1DDQK96JU4/fP8sAYtogTZ3qvowjf2hSkJpvArHWHRfK3hiRUGE9+QE/ibWf
	Afo8hA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2ffe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso10122185ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773625; x=1782378425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=;
        b=TTPytgBp6hnedSG/5nOIg542atSsNLcNZHF11K2fKDQ/iEZ9KppA/z6U8cGairy0Q9
         4Hu1qY6I7g+RzkK433bOT+xM4ue7DJgNiuinjb8LsCHHs2gxH5ybBKaUsKD4h2lraY1i
         gDpUEkvy7KfWJaxCy1ET0FWLOqJP0Bi/7ZEIv7RHf4Chb2T8i29s60Km8ycFOzBVRFyL
         w3dPna6g85/H3IVhO4RzjkVyixyq+ZrDAd89yxAN1Q1hJgwIys6K5AaeYjWfrzAEOIUY
         59LCLt6Q/Ay7d2TEPbl4A4oXYJnFrjP4SGxea844QWLqnzz0JTmAXvI0o//aq3oY4Ju2
         wvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773625; x=1782378425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=;
        b=DzS74GGFpOpaT7OxZy+Qmx10mZ3ZbyOlomHAIb382d7zHQ/0ob3V/cUqPd+8CScBlV
         6RqeEZX9YjEZqgPBzMEW/E/oG0ivJLhIQgMUrKj4HEzCCGcak+/y9akuMh3MBQ9NoaSD
         Nf4EXJJRiRzl1PMlcOdZ5lEW2PktK95TgxebCV4QPw7SsqDMPpLZEiS9NBFn/P//Y0Oh
         BznXOPkNCE8YYDcud5Lp3IZS5rVf5joxuVyNAhuLVRmxUe81K0w3RpWXsFvmyDo/whKh
         weo7X6jQyuUUm1v+a2UFsd+OsDQr4o33oJ6Q7rgJsb1OjKRfqqj/lw1m45pd1ewiEYRn
         ELew==
X-Gm-Message-State: AOJu0Yw2NXgVVe7nt3q7nLnZTbJYKX6l1qtem6ZjVIx5BeTRFTN75zj2
	yqELzczvRXMeGZnbNd0OKU5ZaPw0s9uColjxNfVm+ZfdERuRYWtudHrJB8zY4QvqxaCgozz66zn
	IbUreygTIgsKxXU6QRrEfNLvNKUAc3e2S/tT6EbDOkz6TMvp+YRyiNQv1V46ZaXflvDn5
X-Gm-Gg: AfdE7clPiusgfCg2KTQ56qkNh7iCEA6WCjcL/R6Wklz8zJfTo2jfEpzkSrFNOEFOff1
	bybd2//xO8T0L4kJIGg3qUtpyRtogibcObmXcFvhzKDkKNjIRXTszbs7YgRzu88YfSmO24TRIvb
	26jZwWAmbZE3xA0NMvgOzgO9r5OhkICOqDK+otwUz0WY1lx6+4bfOSBXO4U/4y+31qSvRBfl3Eg
	q5CnwRKlB0bEUeSt4jZYjA5IF/aLoLUg52XguU9pVPAmqyE5tRQ23DLDp8JEQXr+oK1kcwqlEuJ
	FIXYPMZEhICjnYv9FfAxNTBQwGj4IleoGRI2hR9IVdUC8lYvH8nvIZKxoMidlDO/hLinNGHLXwf
	YNmEZHppCe5P7tmDM7r6RhZVGGXBwseQx9NUWzA8eDux3
X-Received: by 2002:a17:902:e844:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c6f340c894mr18082485ad.3.1781773625448;
        Thu, 18 Jun 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c6f340c894mr18081975ad.3.1781773624753;
        Thu, 18 Jun 2026 02:07:04 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:07:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:40 +0530
Subject: [PATCH v4 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-2-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=2697;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=9YWKqHG9h+azs7B5xT1AGSTkv5a4OvLQRAny2OdFtmg=;
 b=J4I53N1i41tzyPhhs7ATLMiLulNR4q3N5bXGGJ7vdCNkUxLqQrvApk0P5NSUI0hMVkZBGVQNs
 EeqeBruvSUzCMou64jZwjB1ExfXxtj9Dt5F6GnlliksNvvmFimAiG8/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33b53a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 62hbcnkghn4QDDddFa6QQSaXVNen7XqE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfXzQ7omVt/jkIb
 8JAc3tmyp3UVFo0S6KfmghJ5G5TNijEhGNsSUfABciPQSfiG3fgspA6g7/3qiHBX/OFhYFhJFMj
 XXpN4cpXKV19stUeKVjNbvZpwkYPNiY=
X-Proofpoint-ORIG-GUID: 62hbcnkghn4QDDddFa6QQSaXVNen7XqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX/pb04fr96V+T
 aukxUVKK9MIXlGuTKC8hINkojBTewqVggFOr9epehdGyALzhUJl+14xNk7poP4D166S8CwqnQlO
 HNnehjJY31JoHgV88A3keu7xQQnThRVfRwKOxKIoLpScINP+Etzk7/gRdPgp4Z1NokA63dU3uk6
 54DWHCXUJF+uouWsuBCS1km7QrMriBCrZSxoW2bEV3n7GYFW/648HfSljlprNpn7C3nQqJm1DdK
 fgy9lpGzHGj8djFnlXEgiFzfpXjm0mUpvqF7ytiRfknfJdpEVKEgXguKgefULSzJLGV6DAoH1Sy
 m287nJpw1zATu92UBd4jo6OkeknqPJbsXTr3u6+87XLS+pZ22iJl8HVkSJrAM0R8KhLp2OK8kv/
 t2TQgpVFM2ElMLzS034hajJ44OGyKCv6Ayl4yRG4IHEOAZasvJfyeZ2JJjvg9hBpDpBu1Ytmg7j
 ZGz+GJT8jiSSdwGCFVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113709-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DEF569EBA6

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..09feb6577efc 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1045,7 +1045,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1060,10 +1059,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	if (device_property_read_bool(dev, "spi-slave"))
 		spi = devm_spi_alloc_target(dev, sizeof(*mas));
 	else
@@ -1079,17 +1074,10 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.dev = dev;
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
-	mas->se.clk = clk;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	ret = geni_se_resources_init(&mas->se);
 	if (ret)
 		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
 
 	spi->bus_num = -1;
 	spi->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP | SPI_CS_HIGH;
@@ -1115,24 +1103,12 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (spi->target)
 		spi->target_abort = spi_geni_target_abort;
 
-	ret = geni_icc_get(&mas->se, NULL);
-	if (ret)
-		return ret;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* Set the bus quota to a reasonable value for register access */
-	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
-	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	ret = geni_icc_set_bw(&mas->se);
-	if (ret)
-		return ret;
-
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;

-- 
2.34.1


