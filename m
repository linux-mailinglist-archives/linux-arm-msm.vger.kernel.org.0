Return-Path: <linux-arm-msm+bounces-101427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACFaOaUDzmk/kQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F33842A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1E6B307EF4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D11A372EED;
	Thu,  2 Apr 2026 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wa2GWInY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kR6L/gpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F437C107
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108986; cv=none; b=Kimhh6N2ApUbWyDIW4CSgIS08ti1WhEcpuNyM57pcKSWEWUeEfclqOyH+KwsBjHRgqiko3sTHAzcfiwwHYYeoqCCO8MXSDs7cMM0QthxV/5TSVkpj1zRot6xFhI3sYgvRZACWpnWiWHX5Y+77K3uQ2dmA7H6CGsjP3j8fMlCkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108986; c=relaxed/simple;
	bh=6pn8QZUNZuwIwx7rZw79zRlJEi07RuDoGlQrFWIxmfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QSFe7HolssdxqCPTACBDgasddG82qEoJfEtLEKnwmc0OwVv0puwz3+qqmmxqxvzwp1Rg3SJHA/dnvcRqAKfHbV57lTNPTOxzjm4XV6IPg9OJYvopC9SFx1WMbS2Nbj7vTtCZJp22USUYMZzfFTC+3YXsACiNSaNm7pzTPJQgAZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wa2GWInY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kR6L/gpv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M47t94009488
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c9KwVpO67WV
	x6EkOZYSJykEVM2NVlk46JFPzeGImNfQ=; b=Wa2GWInYmj6Sq/K7Q2dnbkVFAeS
	jztO22SyUfCCAWXoo7dmciJnXxq1/HGkfv81uU2bQDTZPc5sNeXgWZDLf/Wymfeo
	6Xxgs3OONaYqKVVkqdQdc8/07Vu9hOSZdOEzVVibwCNpTbPk60Neobg5Hf2m9TbZ
	lD98koylv4eGOC56KBjIf22bH3XrPjWUak2V1W/QSHZ+UeGDLeW6ab1w6M7N4HBN
	yxVXtn6CB8qNc94SuQ2RBvWTmx7ZMhjcOdy/RfhSoSpn6sTxcbNXgI9T7y6xeSeL
	Mqvoya5DRN6IZxUHi8GwBvH6tu7PY5KAnO6qIrhWZ1gDywHgM055HikSXfg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e029nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:49:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c6280732so721092a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108984; x=1775713784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9KwVpO67WVx6EkOZYSJykEVM2NVlk46JFPzeGImNfQ=;
        b=kR6L/gpvyzfGCpbdxLRWkFmY+8UXiOJ1wHRiNb+BrSYeXpIYLOU2pyM+a8a2l+Ja8m
         Y/8+b06A3hsv/06vQ6VR6paz+mmKztfa2wiCzL6VWzEA8CZ5aeVkG4c5tIMhjHp4uj1j
         sfmhNgNwxOZz+ryYr38cKkFHQ8gCGL41UWQZPoxRijf2eDLx4euXIzdBb143uWSn6aJT
         tnjmIvsNHfcAU4HNpE+OGvNvr3B3u0853I5Ac0QmWEHQXb7uWAgt1FFarpAwMaizXsR9
         qu+AGZexDHKpkD2YXDilfqkRl2rRqdLjdlIKInVb8JUQrXqRY2MK5xv37BEOFPRjJRlq
         62xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108984; x=1775713784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9KwVpO67WVx6EkOZYSJykEVM2NVlk46JFPzeGImNfQ=;
        b=GpGVEQrxBhsc4oQyFDTfaJvmhZK0uEMiVlqK+Or2Y8iBGgDfcrB4vqLameG+cN7wXZ
         /tvU1+3g9paztKXQ5Y+3F3jsoPRuR54YJ/LqYoF1J1bd5ul0osyN33XR53XUHK/9tWjD
         pk2xxq3MAQV6+DdEzWBem1vj8DblzWd/OBqSQzxILTRvrYSJHVYMGgv27QJQEYvty/XG
         Wh4PhPsToMwyDzf8Nyk1Z+O95CkQqa01Riwt38z2glW+qoBQCbN4slhqznfrKw8pft8h
         DuEBx+bRzLkPBoOp+K/fZ9VmdSMp50CidN70zcDq6kbGs1f1BAVti24yRFW4Km2lxqPV
         aCIw==
X-Forwarded-Encrypted: i=1; AJvYcCVW1+VIl/AxXTedmAlzBwVoTCdDy4PuoCBJJbzgKjjD+0j6qF79CNlKkgYWiZfzdNnMo3xgqpNppabSq/sj@vger.kernel.org
X-Gm-Message-State: AOJu0YzLN0JlB0PN/2ct5efAUl/dcRMz5ZvVjRkCG3xhIDlQtavGOK+7
	DNhKY+xOprpc80zd8E1hXFIs7cvqwha/GtZSyHnZNtCo5PmVtfPdbbgYH9KEZ0pybomEPWsj8IG
	XKMYSsV+fpk6QnsUfy965xZC6wHPVN1MehfQb0Zid8cUUMVYTkVmKPYlR32WOqFToJwp2
X-Gm-Gg: ATEYQzxQ22E8lUImbBNtD3cUd8dCmVEcPrWy2NGk1Kf+ueSlytEWWBHhO6ItQT5AA2X
	vEBR+8yTTHgWefPcFg9XebEd3j6pZZQue6a4c53hBdNhAif2yPfd+USYErA7FVLFMqgD71tZG7W
	vchh+E1pC9eqbW0MTVAGhuqSK1Sv+HTjKM0Zg+dPjqbYKypSrWtKZm57fTcRVkagUtf22BsyNND
	G3pbKzzwoGHlSTCIoDSTkspSERAseHm7lmfCgz66L1d/WaPjJQewobZIUitgRKwdn+I7qXIx6/S
	c6R+e7rL/P5qZGtYLaPQWEwUP+fFiS05ixBhOyTn3u/t/L7TOpaz/hJPtWM++LpiIa4BslW7T7O
	QfJKGewtvy7eJ0mP7K1mgHYy5gV9p5TznZZlbh/cvQKmI+IW/gXW8Fg==
X-Received: by 2002:a05:6a00:a111:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82cfb886170mr2551865b3a.23.1775108983185;
        Wed, 01 Apr 2026 22:49:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a111:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82cfb886170mr2551846b3a.23.1775108982724;
        Wed, 01 Apr 2026 22:49:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm2167747b3a.26.2026.04.01.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:49:42 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v7 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Thu,  2 Apr 2026 11:19:22 +0530
Message-Id: <20260402054923.3061925-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce0378 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: T34e-B6kASXe334tb6Yv-NgdbqIBuTLG
X-Proofpoint-GUID: T34e-B6kASXe334tb6Yv-NgdbqIBuTLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfX28+/yijWh2XB
 GaurJr/RKusq293lV9kJxb4eNW/z8NcEbYYgqV9UynppAqFRigJYIGM9JbGm3vILWlFW49OrXKZ
 V9y5zTUCN0qV8L/2aDIPUgtQvKjP73PKiJBDrsiqDLrrX+D5fAP3nLFNj04pErr7fkVEdk27n6T
 3RTfYwTryDXhhIO1bZug4BbthzU1lImc0dCD9zUYHvZ+i8d87S7XDgpJbaaFJXARgfijtjV/1JX
 WLfo+e9Iu5h3v1E20ZRnH3I+jscamidCLURBZ4XNZVZPLWUsrA7hhKwzPhGwAgy8t7eiCnn4+VQ
 kajnUSqStVmCJaZjKCt//P/nLp0UEQUNlHjj3OMboYyAJhru40J1LqEaggqh+Nv51CIvqkLOAMM
 HvLFaF2N1l3CFcIihXyTah/ZL5Em6iCD0NbJ47zpwgQLwfElv5LcC71lqSsHDbm4WiEX9YLj10M
 oYubEEO86ymWh7X7cNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020048
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101427-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D1F33842A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ce4874b9480e..4363e0cc296b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


