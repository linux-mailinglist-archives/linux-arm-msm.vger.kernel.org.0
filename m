Return-Path: <linux-arm-msm+bounces-114102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isdtASszOmqi3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:18:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3DB6B4C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:18:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PYje8aOu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Di2Dbzyp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114102-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114102-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC94230517B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D46345752;
	Tue, 23 Jun 2026 07:17:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF53C553B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199058; cv=none; b=u6bVaL0kzFpMApBIhuDPszgfq4WPnMMQ30edCJU3Mxt8CAnWMxc2+shLLVWjQBbe6s56S190Q9nCB/0AACvdmPyDvGaiGxzNw83ZwxyKouLDKOAV4ilTIQ7c6h9j/5tusTVuGonHyhoHfvOXiqaa/6ZDBUI9Rq2LsDVxDBYyY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199058; c=relaxed/simple;
	bh=thq9wo4DnffvLwfPbwYBFKtMetFuKw6slUjFLdQaF7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CHbIVyVCNhVbANAjKz9AQl6bRdKp60zM/YMT6JE/omjKtWTo0hqW5pQ3Cq2Dy3JN3GNqdZfzvtXestCbrwWmVECp3i5zcXTUsnl4heG/u4DJmO3cLxMg2JfYfZdau2+qo1QBySztoWH9yJH/sHlDrUcmC2lkN2F/G5xnfm+4EGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYje8aOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di2Dbzyp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cdgM3338372
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IK
	Te+H4Ymw=; b=PYje8aOukzKBl//Dqv+xd+5OIdYVDgooBmXnzeT9/AmFHtHMsMv
	6U6H7l+Rd/uQGr1DijnEn0la7Ctkp6ZqWdeq0q05YI5jVOVLDh759ybXNATP1WUP
	QOwC94gp8Vu9s8sZbC6wk+374blmTRz4l/UG1EIN/CtZ13zDg2+Kk0mQf9LdzTRn
	dmh1awv0i5KKrQ8fkSbMi12krUtW5BKwXk3CmMLeQkET5r6urLfniri2sOJVs5oK
	MlsEn1+IuHcu5HAwmKS9BNcyIC5X6l+f2RNVki+5fJJCvhBE7DHhaZZBPLzomUnT
	qYqvhNcB5aGYRL2mY5FhAj8UtZZNdCgSpdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjh24d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a20348ceso61510785ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199055; x=1782803855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=Di2Dbzypsb7vrwGFpHjLFvVu4QxyZavYqhRGaCSHB39m9TZ7C4j48w0fz7XwyXottW
         w9S5sgStwgLwRt9u1nRMwmmboctT0QGP76axPbGejJSHLeyEO+JhGcfW2WunBmyvjuoD
         BnX996ncbQIPvQ8TZQfL+roYRiLONHbv5lfD3sNW4QNNt3fuh6TRxJAW+FZSEX2WZVyC
         4XnQyFYXCcoAWiDh5IPN7G1Pfsp1GOk8TWUMR/js/v8FkwOwWnOp7xNSb7NYM7sFr5xe
         ueQqXuSbnzS5OzCJCdcfA3QqNVrkxm70rWlDJG+2vJ2nlc2IYva3QA7wclYqB4kDJyAQ
         1JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199055; x=1782803855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=k0ZqolTzMzUzsTJSauLtItMj6e86SAEDLQgTE4/pTCXY5Pdp2+LzBeovWN53w+Mgpb
         pvYxXc+oU5r2kcAtGirPLAy3eRDPAUBrXQjdhEuN+tm0MQohbIk5YI96xS5YaG7UfAku
         loogdVf7LSgCGqKn+vH82A2MeJpuoabo6KewZl/k/rKaZuL3kqPxyyCDy9Xo/gwfnw/+
         MMO1xEVOnI8I353b8Za2taX0+7EB6S2F7M7ToHPsjAGfFBGgGqqE0rlLYRn2smB7z6ga
         tyZV4bnMal8mNI+cK4DVIFy0pSYy0qpP8KrdGSgFSXkknHJsVSBjzX10rEkcyGahrnd/
         KHtg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6on6bqHXe13YJmsGdkoUWtxj3hcrNrlRmKfy421/5OFBR0Zk4OsNjKN6+7MMx93mi7URLpX8tZiaKitAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7V//D+BDF31JoDOVK5nJfFIflCfQjepjWW4z9NmUuAj0pBUs
	TmxxYUkCIX2u0NpdrWLK/MSCPppwMBNIdPTIHKrml2O1NCPLdmBpxJv9VMMEtMoT3C9jv3bUYqy
	c7gHMIfQgU5Gw3423G0MXUlnlOBFFTLtROvftJxSZrgi3ZHo5PYNjoTsb5ulKJcMwN09j
X-Gm-Gg: AfdE7cmllELT1/Y10V264ESR5+ayEYbzezAZXeu6zO+15PWesv6nzuR58rxtDvomhoB
	pkGNa/CaozUdP0eTbZvJnQaha5Yr3vAoz523doqhrZlfMfP56GEAhFM5dKiQXX5xagHkWQp0Uch
	2SOYPL7q/anlvC+G6UPMlrUd7R2iRrtEnuP1ryC10ngrGpRQf08pS78kgd04ffXqRHaYpXjWZ1x
	PoWlaRIgloLE1jNJLIRn+eIYg5YTJ6YM6jF2zs6kYvlzWiRPBhYF8mdSe3FFtthmhP8WPiGxNIp
	qBIHw7CMquVVkFGvTr1STt13vXfgVxsSHc+UpgVJDdWJRXbreuvJMzgssZ2TPpbVpH38rLZgJge
	mjZY3e31ymzi71OkdGoMnOTW/Hca1jqP1dJYVvl4=
X-Received: by 2002:a17:903:22c5:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c718f99a20mr173888765ad.26.1782199055296;
        Tue, 23 Jun 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c718f99a20mr173888515ad.26.1782199054853;
        Tue, 23 Jun 2026 00:17:34 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:34 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Tue, 23 Jun 2026 12:47:08 +0530
Message-Id: <20260623071708.2822269-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX94nJS6y7YRys
 hpe6QYnoi95AssncGKvcP3LXJ6a+9P6caRpOjyl+Fsa/pui7V8BVbElua1yq153deF1pfd37PiA
 K9gCUD8fr6ggSjm4J9xnt+f3FANe2XEDG6lEDfDB4BxVempQ85J0T8ylMcQMePgLCHVm/W1+XU1
 hDoqXL/auX97SMFKODLloRHzE/VJdrdflFthcyuQ52B2LC/hxViqraQliBPFM30q7pQ8XHX96Qg
 2VkEAoQIClZK7eQVjpNqG86lBsfugxghI0xrl9A3rczVTU2OsEXpuYy640iv1p2Lxny5fI0I4US
 M3ploKvbmOcLjnAydtJ9pDiI2G09T3rfKHwG/vdKUuZuN4fdF0PtkZbQC2fkmvDTmB0Z/j98L9i
 sBYmgls/OL03Bm+xcGT0FSzEY7MXoH3hhELK6fHsagbnQDAfSNxRIMVALZA7imaIywhLYxXuRPH
 O7zqHLQjKlscCaciCCQ==
X-Proofpoint-GUID: jltx0vsmZszyiiiivla0VlFfmVNPbXE8
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a3310 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3zrE_5izju647JJH3MQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX/pVPNbRvbUc0
 9u8w2th962kTM80Z/JjGolqrtiFHAag1tI7NqfjyOe65dnm5c5CZndCnP7pPN6fJPTYEX7JSBZA
 qjciozxshxNar4sTtIc03W8JB7AVfkM=
X-Proofpoint-ORIG-GUID: jltx0vsmZszyiiiivla0VlFfmVNPbXE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114102-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F3DB6B4C9A

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5952bd6638ae..97e917338d58 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1


