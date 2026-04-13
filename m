Return-Path: <linux-arm-msm+bounces-102947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wApQMLfg3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1F13EBE99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2040A3008797
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89083C3BED;
	Mon, 13 Apr 2026 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqovQJ9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6TOmlYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822563161BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082727; cv=none; b=WPE6RPRmPwG6eEzPgBECBMepCNcgIbV6mCIJaMsx/pQaxuBKkTFEAqjwkUmjDxwAhd/NJM9SMnW0flMdLZ3Ol7CSDFILZIPYHzkr+GvZ10j3Ev6shnFu+jOXaYek1JtKLGJ6X7eU47GaMBJW5ViRcRkjBfudJ+eX9amx/804FPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082727; c=relaxed/simple;
	bh=Cwg1+vByOg2sv4Tg94ihraEmYWWy9x2jxIZ544ZXcVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dZ7GZAZQQ2ow8AmLea3oPZcKTpdUw1KhrhFb3pxr3A3XVFq5fS2ZVsodNxvnFCadYdnN/EL4Nh1tv3Sis3Qwlt4qoGtpxIIjgwqAXXzXThUVF/s36jf/n5+3ZPFiK9uDNjjMYvzfvsuJs76GeRA5bLopyPhYX8/teUGUcHs4cSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqovQJ9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6TOmlYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7FQP01496441
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3
	bvPXu9xs=; b=cqovQJ9Z8Rh4K9LrgRFPzgE8wCqVel0wBHGX4PcNqID+wiPh2Aa
	M3QwW9qxsynfW9ayTjTSxRGYCIGjgIKNXIyFuKpbPd+holOxJBS9G9gdzC/Ae7O/
	YGVeBQ+J7NT+tv2Jq+p+vMjfNu6TdK+Rylnd5tKVVdA8RINYxjpMPr8RJbRK70uf
	hWDFnnwORbLVQawC3uG4r4NQG05dGYYrKlJXZTQLDoG/v8m6ux8SS17R/6ujJ42d
	AocLrU+FdEinYiCz1HfYXgnKPyTHCvAbLBJVZmJFoH/rNOrINOYceVFE738IT9IY
	UT/j7T0y4CBI4xd5teqEiJxM7e3LtWaLDaQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfw7dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60558a8571eso1291164137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082725; x=1776687525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3bvPXu9xs=;
        b=a6TOmlYJwuhct5heLSWT43Zr2JHo8hrHdVPsGuxM7nRKEEXh3Vhwj8TvS9cb1QDl41
         Vhb9ASlkoZDw1y2n1LXypzojOUot8oNIX2OYBacAZxSZhAS2g6wO9BT10BnnLwL22mD2
         8aL4thCc9vOycImIkrcywv1m+mNjyhRfUrNvBQNn1SqX37GMW7llszy8VasT5XdNJdeQ
         9so6Go/+nuBvb+XnT+Eedbdla2HCwFwBQR7kE9swLpzuaBiSRL9C//lCpUKE/qhgQWkD
         n2rTHsSG1BdI9FfMQXExlOVn7Vy6LFVRJnCFP6e/RhzHLKfxO4kMOczWw0oR42edmGor
         +GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082725; x=1776687525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNMZx3Thj/Vh4IZ5qumE5TX/VQZLtZF3fa3bvPXu9xs=;
        b=XZ/QbZ837mI2Y2X7sWWbkJMpqtKb20Mii9QAWm+oNPJAFL/YPuNMAI4uixtfwZtds2
         EhM04/skn2iojWHvIpCLcDU2vuiwMS7uG3b2BIJMcZ/5c0lKiUQ9Tfyq/wQRXOOOyX2x
         6p8lyV495hBTg/jRrNGrt5rOdSOoKuKsuLF0ZObS955CbkpCfossti2f3Qs1gjIldwYt
         PAo2N50W7bzlJPUOmppVxJtRPG6hYRyIx3qHoxPUhwnCSTAV1DMOw5IuNlLnkuMsUvYL
         +5YiSVB2Lj16Y7qLEAZGn7xoNionn0J9C8g1T1aHgb9lE+cundWtPXzkb0/W8treyWRs
         j3yA==
X-Forwarded-Encrypted: i=1; AFNElJ8+LMv8sScfbJnMNWjmqUUjX96d4P5w3UfEq+Xb3Na/oYkhMzW0wcR+X6bSVNprPm1XzF4HKsh7TNq6u+/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nbAoV4n2t1dilZu8/kSpMbUPObK04TIxBNfUEqqqcPSXPmyB
	PyJmsAK33dzzraqZMypwx3m6/mcVN+0DttLX95z12fds2kl32suU7LwicOda+F8ZlvyuqN3zxn5
	A5G0pKrwfUtJ3L9AmUNf7eRNuR4DL5zWBvl/0tTqTSlPHerKjJXX0tnI8DUX0QoCxDiUG0O5bsh
	ra
X-Gm-Gg: AeBDietWnJ7v4bfvARxPdNCWZ9xT2mlO9lDO31fWLlr5IDLh66gcsoDbn98mHJhvYOy
	uEgFHIBSKJz+jxXtFQemBGbjNGybbD+wUDsOBVzGpDiz+II434VO2KGGaYg2m9W/XyakPUPOxAX
	SVGaRCBjMuW4tOjCECbwQy1YfmyEscF4Wa1VJDz8M4zL1u/dv6EpPt2F9MI2lSc5dG2ihQ0IQhq
	jJYE/GKEwHHr1C8My+M1J0leQzP/XOwgsBHNGSOx+HeYp6ygrdjvCxErgDzmYSwhQmEUh19Asdh
	D8dfhyygIChfS6rUXmbj3vRhQGvcwnU6DKcARjAUPxzRG5OjEQjF9janSwMxqPdBtwY5Br9G5++
	VoH0FTH28xmcKt+5v98zi2amIG5QgmpdkMDFqRmFSS14VUxJmiA==
X-Received: by 2002:a05:6102:4bc7:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-609feaab474mr5155913137.10.1776082724695;
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc7:b0:5ff:2569:cfe7 with SMTP id ada2fe7eead31-609feaab474mr5155898137.10.1776082724329;
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:44 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 13 Apr 2026 17:48:21 +0530
Message-Id: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gRLH7LV-xVQVtMjEsMXrodNyU1aRVRXY
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcdf25 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=AlpySQgKZDKZOEJvUu4A:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: gRLH7LV-xVQVtMjEsMXrodNyU1aRVRXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfX6uRsWnE2tkfg
 uqgrSz7pnUuDj1uuTTBG/5Th+1GCayzX+xNzMNUmb/ZWDupRtJZGtQxR1aGrfZzQws6ynhQ/Vuv
 oVcwZEpk2zUr2KZcdPQAgwPXjjsM8zxuLFKagh1m0mPWNPpojXQwrh+KUv6byYal2yb2ti5SQ6C
 VLBlNb2kKSvqUAd/bCoq6ImP2tWiGGk5kL/a6LxF09/8KsCTN/Nl1aj6h7Bb4TcWydTFHXJDbPD
 7xq5RhJKSvGgTYh4X/8T+rNaYXaRcXi1j16HXJjXLenbCwgDYvP0N0N/tMyYmzhDbM9tA+b3uYo
 H1QdhTxjPq9s6iEG1TcPg48BGsGPHUsLqoFquHKm2P6vs4miKvwW1DIIdB1SEWv6mG7K0PF+rww
 VDmsAj8COkM9+k9Kz5FoeJpg8jhkCfmwiljT23y5BpMDWYhGQeWeb6TClCgJk8am3fL/RoawqoP
 yf9r9UMMIl2qzo7OHEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102947-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C1F13EBE99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series switches Qualcomm LPASS VA and WSA macro codecs to use the
generic PM clock framework for runtime power management.

The drivers previously managed clocks explicitly. This update adopts
devm_pm_clk_create() and of_pm_clk_add_clks(), allowing the core PM
framework to handle clock enable/disable during runtime suspend and
resume, reducing manual clock handling and aligning with upstream PM
usage. No functional changes intended beyond improved PM/clock handling.


Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Guard optional NPL clock rate
    programming

 sound/soc/codecs/lpass-va-macro.c  | 120 +++++++++++++---------------
 sound/soc/codecs/lpass-wsa-macro.c | 121 ++++++++++-------------------
 2 files changed, 93 insertions(+), 148 deletions(-)


base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
-- 
2.34.1


