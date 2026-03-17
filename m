Return-Path: <linux-arm-msm+bounces-98133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNQZIQInuWm1sQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:03:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 541DD2A7740
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33945305A6F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22CD3A4F33;
	Tue, 17 Mar 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0pXMY+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGrSvj+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674D3A1A2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741629; cv=none; b=Du76FmdFHHQ+yEYXRzAvEoBCscZ5juT25pCUhnc/rryOvR+lTIEabSI0wuuRwBKBw+XVrThs9cnVhYXCLH8XJpoqjJ2x9vLoH+UXm9lw+c0HYCQWCfysRYyZ6mkwQqTwmql99nDXpFzspBPtwDu7kbCJ39Ia1/vRT4ijGPErL5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741629; c=relaxed/simple;
	bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YkVHXNKLO0VE3iHqYx9wMP7A9LsrLTO3wtDF37HKTuhDXaSPCPAgwgzhuCjmdHdeqYi+hA041i1aVp7xFCCy/7p7QkQKolELGU6qd0yRTgFCfj/jxgMgzuDqmvHNZ3LdvHMgW7Xgykw07S8I7WXEAYU3o+OnneDDLkcAU5mQTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0pXMY+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGrSvj+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RWIO2906159
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2vuUgZ4TxHnG4OMEIKO5YN
	b3ELbxi8ENT9IyImnX120=; b=L0pXMY+R41JyA7hwWVwmDPmELZBSUK6PnTCHi2
	L3/mh774BXy2P2e+HzrQimEQBhfrGATk9JNVURYEV5+Gi5txj3zSxTWrBUash8yH
	sgP9xG59miK78wCnphS+beLEaAdqtJig1VlrvgNVEY43ViOp2vHVymS3bG93Pj+b
	niBWIEqg7b9PeG/mJsbwDf+5b435VYqFcZxbyvchzV+qEiQsYwwU/HZuxeZMB4Xu
	+Mh7zxR8h+wdiddClSFm4sc/0k94p2fOySfa2VZQvXkAR9wbFxcq3PE9Q7K/BiwL
	2g3KtLYGGPAKMXxxjNC/o4nJGHmCqmGl9a8EI8Qi5WBEIjbA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxgk4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:00:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954803bd74so1779496d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773741624; x=1774346424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=QGrSvj+JeLPWV8Ks3OUe0UaxHlOMOVuDP/oANfNmTEH/Zmv/T9LCQhtlaSQ4yNbdrG
         GKtp7jA/d5sKNgdZRU4nfaRAzEFBiwJzt6yo7cmM8kCQrn0BCBA5fJnfWZA93ltYyuMN
         ns5t2I1PjiD86MfP3mXULAEJQKzjMv7/9ilyOUAjUH4x1rC2Eu6mUIzzpIowJWNhD79W
         UNUUoQnzRg7L7xySJnpTg3GISzGkIssvV8wFCfRrJED074STbNiYIU2lnXOxOq3a6zB1
         +wbg4eW/8aJGFW6tPMXACuAorqwxIsNn6OCLHbrHU0gR+5jE30C4lvrVgPo+VqEAs1g9
         Qdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741624; x=1774346424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vuUgZ4TxHnG4OMEIKO5YNb3ELbxi8ENT9IyImnX120=;
        b=LG0877QkjE+dZufrnum8iijqKvOPswxRgn/7gmTPCnqriuDcwRqDurOOoIH/m+6pyG
         cFClClislIhI7PFXHpRVPPNL2jl16R1lrB41BkH7WuiJrdZiFueTY5XBfdkekiJkvtSV
         8PgOMB6QNup+mOp98gHOhsnGFJZ6H1eIVxoX7HHHLr22jwCgrULRBTUA3Sk7sNP1VuIn
         IiOD/XJUVhnANy0PoVsaqyESXhX9bSPlJUtFXTsnkPgyRuTYkd0Lhce5jggGWtr86PMF
         66pU3i8XSyv9w2mQqW2l5OVPy2P+FFOP6rNWtyZnHv74IZhsjsWXvUGo+KPvYELPI9No
         1spg==
X-Forwarded-Encrypted: i=1; AJvYcCUHZoMNKsihsDwl2CBfopJ9QAB0Mr2rySxvcOoGXfPOS0P8j6G9HHn/efUGHifsB1WWnm/yVFwv738PeJZR@vger.kernel.org
X-Gm-Message-State: AOJu0YxmH4oS8GLr2R7sr+B9pr+FlWGav+qySCyo8ltrnMbGAGBpZC0n
	XJUKnYftom5qTJ3oUPUVMQ5YtZmP1yCTpgk0ss5UGG71uGADu2lu6al10zTx/iT9LeNiT91q5gm
	ak/T64kOG7B/3t/QdrVuXABx0nfyhQMpcP9WW/IL9nxoH/EWsLsXsSsgy/vqA3sjXK9W9
X-Gm-Gg: ATEYQzxzc+g3IDGSnFWZsri9z7tXtfN4jPF99xf0tAi7BkCPpsiYGzlyqadHfiPlcx8
	EbrFjF0J3Ac7olK0zLN6f6O417gHaDk1McDOSsSVnrXLmsnUt3/fljXRAyIK8Fhlrr8siFwHeUu
	6DUpcCEJZdl68y7M48J4UMcGa1JRTR3mttS7i+LGDZW3izLOA72whxnoh6fPD7wSL/J41qZAM8n
	xMScC0azHnnnSzJqVwJi24yxfJmyDxV6UnJKujCtsaKrijs9L2o4zbh4K0Bkl9H6t7raMe8sUBJ
	Z6To9AuRPO6dWONRryccPRbLMQqFh1VghM90PIx25x0IRBTRToGFGaQ/Uq2P9l9cmCgU++XOS7Y
	fgEjPoRkJPcBN9jRmrwv6PfHZmPPbAb74DcBQIh/zjNRWwDuV3CDYRG4DfslwKtAobVsXDWIikW
	AImHIcfPPAz9Kv
X-Received: by 2002:a05:6214:27e5:b0:89a:b20:9f4f with SMTP id 6a1803df08f44-89a81dab56dmr196282316d6.29.1773741619629;
        Tue, 17 Mar 2026 03:00:19 -0700 (PDT)
X-Received: by 2002:a05:6214:27e5:b0:89a:b20:9f4f with SMTP id 6a1803df08f44-89a81dab56dmr196280946d6.29.1773741618591;
        Tue, 17 Mar 2026 03:00:18 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a6947c4b8sm137119786d6.20.2026.03.17.03.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:00:17 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Tue, 17 Mar 2026 18:00:01 +0800
Message-Id: <20260317-camss_tpg-v10-0-915131315f79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEmuWkC/3XQ3WoCMRAF4FeRXDeSyZhs4pXvIaUk2awGuq4ma
 2iRfXfHn6JCvRk4w/AxnBMrMadY2HJ2YjnWVNKwowDiY8bC1u02kaeWFkwKqUBKzYPrS/ka9xv
 uJTq0xnutHKP7fY5d+rli60/K21TGIf9e7QqX7U0BWDwpVXPB0bTY2s5HRLsaSpkfju47DH0/p
 8EuWG0ewOsbtSEgBK9QN7gwQr0BzB+gBQA+A4aAzsngwWgnwLwB7APAV8AS4K2wqo1aSeX/AaZ
 bQTkejlTyeG9pms7Wl2WPggEAAA==
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773741614; l=5022;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=VAZhdg+zVss/xE+WERUH4w/ELcCaISL+YhNMQXFHIU4=;
 b=rnNQchDdK8AQLaRpXeV0tp/ckW5A9mdFawKlnbw6lRC55E9cmbF7SaM9or8jc/k0+2JLkULAF
 +Ta3h6wZK+zCcmztYyK9YNOjbj2ioTWh8wy9/z6bnnQ8NtdhlCJs600
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: YwdVZDYKRC-9bLMUKqcA5LDCcTtoiHOA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4OCBTYWx0ZWRfXytzuyU4ohu5i
 DawRQkHbU7hwoawOUxBgAosevRAlRIqKNAnXT3TPTpcutU5gsFmIVfSALvd5DVugFcmuCgzS/sJ
 glSq4EHuJYfXlaxyibRReUMdvGrjSov1tM9LJ193vF4plYiSg336sziNV+01byJB0jOogzkLP9l
 e6iADD+pyXcaUaWBI5cjHCYEbEl3iabbNsCTREXWv6p89v/G2HEuQ/MYXdm/I4kQqTJ2vcvxYYF
 WE913Rbe5WIeVEVKVpSSlMfvdym7vzcILaqx2qEuvKBlgApqDAOKRtc+nJ0Oe0d0nLgfhPm7Rhs
 7W2D+SpjWQuolxtD4HWdZ5/GKjdsFa0/BAlDC2jww/ESSNPngGcS4cTOIhzmuCmIA1W+lbJ5GUy
 DwdBiLIbDDIbD5AGrfVn3aGXHchxgPREzCw8tBL/b3v9JzyR29XH+ib4KMcLu1zBpLun0CUe9Gx
 P4sV1em6OJ4QnD7j/pw==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b92639 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=9YuegPnT3h674dkZU1QA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YwdVZDYKRC-9bLMUKqcA5LDCcTtoiHOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98133-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 541DD2A7740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

Have tested this on LeMans EVK board and qcs8300-ride board and Hamoa
EVK board with 'Test Pattern Generator' and sensor.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v10:
- Fix the code alignment issue.
- Link to v9: https://lore.kernel.org/r/20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com

Changes in v9:
- Fix typo: rename TPG_GUP_ID to TPG_GRP_ID and CSIPHY_GUP_ID
  to CSIPHY_GRP_ID.
- Replace DATA_TYPE_RAW_*BIT with MIPI_CSI2_DT_RAW* in format table.
- Simplify camss-tpg.c: remove kernel-doc comments, TPG now has only
  one source pad.
- Rename CSI2_RX_CFG0_TPG_NUM_EN/SEL to CSI2_RX_CFG0_TPG_MUX_EN/SEL
  and use if-else with phy_num_sel as they are mutually exclusive.
- Add TPG mode validity check when tpg_linked is true.
- Refactor tpg_stream_on() to use MSM_TPG_ACTIVE_VC/DT constants.
- Make tpg_stream_off() reuse tpg_reset().
- Rename TPG_V2_* macros to TPG_V2_0_* for better readability.
- Add register section comments in camss-tpg-gen1.c to segregate
  global, VC-based and DT-based registers.
- Clean up resource tables: remove vc_cnt, camnoc_rt_axi clock and
  interrupt entries.
- Sort Makefile entries in alphabetical order.
- Link to v8: https://lore.kernel.org/r/20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |  12 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 231 +++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 519 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 118 +++++
 drivers/media/platform/qcom/camss/camss.c          | 172 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: ec4c8f012802e4654892379f627ce7a1b95f8ba7
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


