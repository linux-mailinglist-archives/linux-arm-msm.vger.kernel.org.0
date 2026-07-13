Return-Path: <linux-arm-msm+bounces-118845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RrE3CkYqVWoLkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:11:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E574E5B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:11:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GsxGMpSm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC09300D95A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D9535201E;
	Mon, 13 Jul 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F4913DBA0;
	Mon, 13 Jul 2026 18:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966166; cv=none; b=NE8EUhZIxz4pxVxIfaN4M3P06fglvPXe0gXlb3NI0e5S1HR7u3eK/rKzi3c+tVvfVXTtuQ2aDrLbPkRoR/GuQDY0cJ08j0ywDfLvU2YvcuxMzpghevs/uqxzE3JKZ4mBYdhQ6VkQZNZjHHG0pjl5IygtJxkaX+PmN87r5iAXNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966166; c=relaxed/simple;
	bh=XLpvSMQJ8cUNd3OKXYoVJoQ4mJ52DRNorigDSHOQyDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SxoztuEr3u/YJ1XjyQ9fgWmVGNDwOnrLNsIUxmEOt2uGfQt3hJW96EzKbqMHFijQiKmvOBRwgQzRZkR/8OWcKScZ1irNwpFUTqbXgRqWfCmIR+cMOBOUiM4wY6cmUdUTdiig4Ao40eiFNoHzQebtKweVK6viQQ7fJS25G5aIZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsxGMpSm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF85Un1701329;
	Mon, 13 Jul 2026 18:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6YqQOsEWJmLGjXf4bqRVcj3rCgTu5TsOBii
	4lsv5t/w=; b=GsxGMpSmIv0shpPzouozMeAvWqDYNFBzQE1sTYG8JFAyKIkJu9x
	xyzsI3xiwaAPWaM0nXT1iuseNvJ2/iiCdKTv2lV1eQwVYklUV9o7MWkkzLy0OE9g
	foS35SWohcldM9+H+PScY8sxeXjhoj/VcW635UHug2BUv/MkHNhI9NVLhJHUaGWj
	Q5HzsuF0CJn6pG6hBJriSzn7YPHWvFUrjU9ZAamAIQX9dFlK8mijaeq/AscFun7I
	a2bPW1/BQ1FntG29stn+KG+Mjhj4H6TOFJK7Y6iNvivi6L4qVBApVkO9WZMFJDOi
	P+UxevN//+bdgX8Z8M8bBljzOtbr/kG33iA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3j1xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DI9BBJ007200;
	Mon, 13 Jul 2026 18:09:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewj8p3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DI9A9I007185;
	Mon, 13 Jul 2026 18:09:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66DI9Aii007179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:10 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7258E634; Mon, 13 Jul 2026 23:39:09 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
Date: Mon, 13 Jul 2026 23:39:05 +0530
Message-Id: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: UHSbUhoMrjxroedv4j9AUoe8VpWMlPHq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfX00zyWRmA75rM
 g+wJg5UdovKKISvte6OqP0c6tGyyQJcaBJunb+hh/4PicNC04WnYRTLQofCNTwt7nxibc5p3H94
 mD069C/JuUVmmE5PQ+3oyGilqkokcB0=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a5529cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eekZLy6OnP13HXqYzzAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfX6p9MsQtgd79g
 meu3jp/N55nWsnaedaFJztwT06GWltn137l7Thwf3Po0SJ/dJIjq3/P+9jWRq+DslkLcB1h+d0h
 lAiomagY6vszVUHYNBln6u9j5TbWHLGOVCbngc9zFPRA+uTxduXzR25wmaODF1uNt5qq27jJIqx
 jFz3n5MgEnt+byYytnNjMbwTsySdrCG79Zb1PFTnzIWUJVuEovc6oSIYfXWpixs/W3OU+8zEnDM
 I6eC3fnMkv4/oIAQRzxEBrEaxtX/984YFdm0ZT9mOHzp9FqdBLrCa27VRzXCNB+EIFf0NvvgxvN
 ne4U4Ra2EWfmREAq9nzQnki7i08vdyrrlDVbh/YWlRvno7OPRW56M6tg0mssexfVHjUSx5uUYYa
 c3tZLjXHFMS1PX6kOdJ8X6wCOPdr0d7TIxjOIywlADqDLtx8/I8YwU4Q8nRBxBZk+4p13RzGZeL
 SqdUO7usMyLPwaZoQ5w==
X-Proofpoint-GUID: UHSbUhoMrjxroedv4j9AUoe8VpWMlPHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118845-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E0E574E5B6

This series add support for sound card on Qualcomm Hawi boards.

This series depends on:
	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/

Prasad Kumpatla (2):
  ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
  ASoC: qcom: sc8280xp: Add support for Hawi

 .../devicetree/bindings/sound/qcom,sm8250.yaml         |  1 +
 sound/soc/qcom/sc8280xp.c                              | 10 ++++++++++
 2 files changed, 11 insertions(+)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
prerequisite-patch-id: 28f571976819748d886ecdd32e1ea3976440374b
prerequisite-patch-id: 1b00c4a50852a4058eb2e1e609769ba067fd8d4a
prerequisite-patch-id: 6320a0e2ad587fa5c7fe999ae168689af724a4af
prerequisite-patch-id: 8f084b1c85f92ad8c726a638ef9a28adb6fa517d
prerequisite-patch-id: f34f221540acc83a62421cde5e5d0aeac7b4027e
prerequisite-patch-id: 1025f3d247aff3470afec2790e09909987b94d6b
prerequisite-patch-id: d9710a6c2297f5eabf3433b2763469e8e47c75e3
prerequisite-patch-id: cd11059f673dcc38d9ccfc50f0ebd77d6646f1c6
prerequisite-patch-id: 94805c836fd3766375a7110dfd90f94f48472b07
prerequisite-patch-id: 3b98c7c5d3802ee5c5ad4a11004d05d969dc09a9
-- 
2.34.1


