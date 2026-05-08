Return-Path: <linux-arm-msm+bounces-106660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK44GX3K/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C94F5D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5EDA3011056
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB878384234;
	Fri,  8 May 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4rVdddZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/nQCF5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDD1547C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240121; cv=none; b=qwa14KFPrBryZBnEc71LPYTAz/r+oDPUviPgJCExs/2cZOSLFt6D5uTrmsZGXxRRPce0jhMZeWzVQ7/I2Il8HPWB/YmDEoonKbYGTvu2mN8Ej1TvJeGsPcBVOxnHUvnnnpl1RuocdLkYFDV6txY59jwgz653zSdHP9fqlhn1eEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240121; c=relaxed/simple;
	bh=jKEViRlBVDcXO/+pJjAbxj0Cx9RvUSo/rDsw1uWkgXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i3pvafFJdKn0L81Jrm/J5VM1DZmihmvlRheZYwXwjNuVWlublKnP+J2behvGpc+idhgNLybThL/j8iG0ItbVcuOW3oVkDva3LgW8k6zC7CvDHYyRkmQCTukx0tYiISGa1oJBKTIO/rGNfCTqyz+YmlrzDX+5rCUdmSr05RO7wPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4rVdddZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/nQCF5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AhiuW2199536
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMva
	UboBFk+8=; b=j4rVdddZKrZ6MOdr0pdI/u+/sCQk+S1kZoKXi1zdfXq8A4PRqKh
	0H+ayn/gZqn3/gI70uxpI57aFiH50mX8mO7lOiJUish7m7IN9bzyZEnIUhxxIHG9
	f260mFputdg8pC9sZ/E5T6662ERi+LktB25DpdJrp3meCQ8v/Tp2czzhZ8ccg1OU
	ou0mFD52AnZNL8WcLJ7fLYTyXAvgRXDBRjhLUp59AxW7oY1SkdquVk4Hh5pJQBXP
	cG8BHRMYB9SCvvnL+zgC2xjcgww1nI/NNwUD7McgWS4krpKvQPcnLDcK3yGrXA6o
	u8a5iwMg8jmpqcIAVZJrhgXO+A+V+tfeGow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sk45p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:35:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso7613415ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240118; x=1778844918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMvaUboBFk+8=;
        b=a/nQCF5qR5Mb2TXqPKIhDnzC7bIWLdEBh/cuoMuDcCAxblm4UrPkoDVdUTiwKRec5A
         7rzuSo5eD9Bm5ovao1tTprYlqA/4I8vbD/7ca+yDiG/tR/f/TGnXsneSjIujqbPWdVyI
         PHqi0FqpOZ3wMZnAk8GUP5QHw4saDGTmmROGzifaM9mIZX1KP30Yy2FS59NWhSm4/GZc
         hEOJn/F+pglxViTTQ7iSN20CWbrl2Ft8simAsOh9dYpX/QasOXt40EE9S8Cd0zi9RDoQ
         r7w2pCKK7weV+qR9+hTP8GVzhX3iw/KyEd7J5os6ONCnX8qYg6/h3+E6s9RInGI3uF4b
         Wvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240118; x=1778844918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM+qNnuaOX5MkM8J1WAEVwH/p83LvDIlMvaUboBFk+8=;
        b=bnUakL8VCAaNLmpbhR3UnNzi/D7A/Mun5WGyNNSSEkzhsnGKHqIXxpnxzTGRpA7qYn
         PyKDQQ3lwcW58MXrhGflb60oW+24QK/ilgximwV0+QQJzwJR7SiM/XGhtgDmnBc4mVS7
         6jobrAP0IfjfMt4b0FhEPT/QobPxNi2JQcrWikR8fpCrsuNbPSAkbzI8glSJQS+C7Taa
         FnVF9XGMza3442crnMPLqP9RfezCHUUtoWuHRlir5yVMOR3rJUW1M/kv/TeH38BdsowT
         GhHfgoAfyFU59VzGufrJAvpOEeL2SYGw15LtZhn3qz8HsXzUR2oE9gFjSX4ay+O4LFBK
         O4fw==
X-Gm-Message-State: AOJu0YzKyF4tbUTFxHAyDsjYv0UddojZLLksV/wpxdhjBETWYkv0Qfsw
	RAnVny6JvAxul4TlimEMo4Ljd7yySMacs1Jztjszj2NPryYF3dWto1C7oDm0LH2Xzh2eEduPTig
	HDl652uj2Dm4tk+L6crMkCquk1QN+06SmNnEYSc0umgAeQlUFbKyGxhnoX3o/bgMPKcif
X-Gm-Gg: Acq92OEJNd7e7ebgfQG1E/cHWtc6YOUhx8R9UB3VdpLnQyTyX+2sW9WJp65J2BMxv7U
	ILChkA9MiQiR/eCSkeLKfBXapKR49ATarwPbPN3cyTLWbnfuAbqE/7npy3yXeSKPUgLK8I/sXhS
	yPTvyyd6ZTrg29y4Wp/2pjFD6TUGpsmtvlruZqtASmidAFMRq39DgaUoIU8EACzOwTWziqvFyGH
	RkolYJeRI4qvsy/Cf6ohqnb0/ZOpWpwgFk+M7Mv8Wmbx1uoDGNzo38MK3n95sLGa11tgNEgMCvZ
	WIryF7xc+ptGSUZjo4Q37g9v3592MYg9I1b0hYmQSx60iejdsftKT+zusJcGz496yiOQX6/gY0S
	3b6EYwzUaz7CPYs9Qd1iIDLv/POvFTfyNz8W3aiEblRuEewq4cg==
X-Received: by 2002:a17:903:98b:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2ba839e1af7mr125659645ad.27.1778240118382;
        Fri, 08 May 2026 04:35:18 -0700 (PDT)
X-Received: by 2002:a17:903:98b:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2ba839e1af7mr125659195ad.27.1778240117872;
        Fri, 08 May 2026 04:35:17 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:17 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Fri,  8 May 2026 17:05:00 +0530
Message-Id: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfXyg4sciTqQOLr
 Ap0TO0cFkUoly0BJsg8Jc6D6rZcV8udErd292eFMhA8hTxemjrC6I44F4E1Sd1NDQGBBoeeOle7
 zOaMzse6MgDB9ldqmq3OAaE61kZZ2U9opKBsTXWyzDq4osF7ghZSCNt/Z9UEOIioEjMfD8mBSij
 /91cnyUduzzpTgm+E5ZS63F27TodCHxT30kFLQ+bF7xcYoqjYuRfgUoouxUv56CcVK8G8/gDw95
 Saup5K0EbwAyNCKepvly0q4km2JcoA0d8krxLMR+LQ/Q1FGoeLnegC2z6XBqPiF/dID7yzmXgtj
 SgzHJYLcWb6aOWygSf4ifpy21ml2zHH1iAimutVKGuzqoh1jLz/eHWI5hUGoXQhuEpU2gZdvnpW
 dslbutfqKHr86+tSd5aGhqKXCGVuAzoVb3HK6R2Mt6Kc6TnepcI4TebmSh77pVo2yyEMQB9gtlk
 5RZbEaf5WfHU1B+2zvQ==
X-Proofpoint-ORIG-GUID: y8QEQC1J6MjGFPLnxDq9JfqoDKNjpJXx
X-Proofpoint-GUID: y8QEQC1J6MjGFPLnxDq9JfqoDKNjpJXx
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdca77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iZtHHlB3kCPTry1w4UcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119
X-Rspamd-Queue-Id: D10C94F5D2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106660-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v2: https://lore.kernel.org/all/20260420122843.327171-1-ajay.nandam@oss.qualcomm.com/
v1: https://lore.kernel.org/r/20260413121824.375473-1-ajay.nandam@oss.qualcomm.com

Changes since v2:
- VA: drop redundant put in pm_runtime_resume_and_get() error path
  (per review)
- VA: switch fsgen error unwind to pm_runtime_put_sync_suspend() after
  successful runtime resume
- VA: fix probe runtime PM unwind labels so pm_runtime_disable() is only
  hit after pm_runtime_enable()
- Rebased on latest linux-next

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 121 ++++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 113 +++++++++------------------
 2 files changed, 94 insertions(+), 140 deletions(-)

-- 
2.34.1

