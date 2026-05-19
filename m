Return-Path: <linux-arm-msm+bounces-108507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LsdCyBjDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7086457F6D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6947F3018AE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C135B4CA260;
	Tue, 19 May 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzw9QqHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7BK5u22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553C63BCD24
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196533; cv=none; b=fvUH/xGIiQ5/BXEiPQ0jH3h2oaDsV67ALDR314HzZPCRP17m3lnrR0Oa8xiJ/IBMois1G/toTMDQ6k+czdylO+7COus4KNtM1k7rJ74VNN/wRZts441/MVHAdNOdzbBL+rA2UilV39qxgVaQEdUccXmnOKdwO6CUxFKr29JcD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196533; c=relaxed/simple;
	bh=F9A5uHoE8wKanyYSLqjbHYE0CiEcbG3yokKwREAWEUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHyMw631CQUT800PbWC44dCYH3xEgyOZUROL/ZYUQ+ZJWrNqNKiySFfSwplgYQwPGyxyOmhcrIivjMLwYFtvXBZY44tnzxW1hwvPGabepkmDsGPeHzAeBdqZ+C3SECq8tYGf5JAvtm+3o/N/lFL199GbherhfFkwyVfderEAddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gzw9QqHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7BK5u22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAEOsY4131344
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I/Mg2qHcqH5ooQaIbAmhiJn8WzcvuKijp6i
	KyyQFDOk=; b=Gzw9QqHcxwKmhrZFoy/x7hS3f5XzLz67HkNdpWbz3fr8NIOZaxW
	jLPMdGZkpEvCjiSeEYFhlmFepd1JCKen5JXMjFwNPWkn2U2Q+WkNB1Evh0ZJJPW7
	42XZdlrfWbq3DIYpqT61fwYMUlqtPGiwtMSYPQrh1Fg9rczH54usyHJNyskgtING
	I+uux3n32izVuLi/NxXQsiIoJqVndoFXQK2tYAWTfVfvHj7Jw7KS2vCmUeaRrdzR
	tsle3+/6FAwxrz6go8W22LNzRyQYIvAU24sDfV1cu0HD8/cX3jYXiEyhjIQWtc4/
	/ouppGw/61ongo4rdujYcBVv5V4ciQWT5Hw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hvmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57584c23424so9393325e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196531; x=1779801331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/Mg2qHcqH5ooQaIbAmhiJn8WzcvuKijp6iKyyQFDOk=;
        b=E7BK5u22yR74PueMnH4l51tMRN0zDVLvuueju1AdIehlgj/S0yfGtXW4EQbd+Jfm2T
         gyJ6wqCKm/E8jqHafvrfQiffVC7jF3he/Ra3yq3C1K8TRyd8kzj1klKsTMxtkejxhswD
         WUB+JwWrV56lPrMIryelIoDOpfL3nudDWVJ4zvGpiyC7lEvyx/jSNporhZlNyF0vhB1b
         Q4QUbFiAvGh0V7hCmTGtzjbB8zsevHLdVSVzHEnMC8ciWJa8vpBFEh+6oId4bdud/KEn
         doUKDxbJj04MmyFCMMXNfRMWprXBJUvPCd5IFXsvIFNAWcw/wJ5lULAlC+GaAFyW/8ZC
         f/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196531; x=1779801331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/Mg2qHcqH5ooQaIbAmhiJn8WzcvuKijp6iKyyQFDOk=;
        b=sC9y9erwgf5/L06RGWkOCYa7GhXtHQ7umB10Vl9aBXyiwHdxxtZfyDMiklPogOEkoY
         D8NuwoC+MwnfD40qFklzExF7f9t7OmG5QEydKfJe//D/4G4ntpiolN4ZAomkwvKGnhAb
         XN2S1y5+dIxa4R+4DDLx/ly0G7SEsQZnkDFRKTl+4OoIqz4tLcAlKgJ9tPCSOBowpzkq
         uDjG/SmRbQo9CPcm4rt01QNF8TCXYaslDRtSZvIaxCOCX0dUXtbtoR4Qbszth4Ap/3zf
         opXzFx8tVQRgTsnIvbKEYOAiaqL4jlwmM6GS6lMFGdTxxCZ+3bpwm9IrBAhVtlxd1R6b
         rwcA==
X-Forwarded-Encrypted: i=1; AFNElJ/n3hSG8+X9pbpit/Ma+PqqwaO3wulDd581is7pdpEBw3v7AAa+fL0D0DTGxntm1n6jY0N7qeFLVw3KJ7FO@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJUagl7BWzFQVfI/F2Q7JCHJB9CC6ovb2YyZ2m7LOxkGkRFv/
	6VP2Xl7YsVCO4L46q+MKbLOnNfNDqD9MmxPXj/N16cgmnWrg1OTFdZDBBteRTd+L6nmZWlsNcjj
	j4tRK9SYzr/4gFH6Lyth9/PKADZflu763G7xDBEhBtm1kcJMzGzyWacVPqHnDeb9NfjPN
X-Gm-Gg: Acq92OHMnOTo6w/8RJfLz470uJgOTfCvTZDCS5uaGS3syTjFLUrrOWPDc2/j+ZOAMzg
	aP5E3Czu21U3bro7okziP/pH1hTEZC70WigWEZApyJDs70jPtOFvgChcU+a5HDJX73bWa4I8tJa
	59SdOj+iftdv/CaKuPrhCZkyVKc67N9isno9Uae+tPyiOIc0Y0LtJa/1z57dAPxiACFitI9t8iY
	tXfJrXal7eyL/7llFNoQeRHd8v/qx+td41wFekjMrGdk9/UwEpJeQRPiviZX1INbj7uTngVVf1W
	afOTGp0ApkCrMj8baQP5OHXhzdZcJgelUipSj0afwisDIfdN7Ug6XhjwbYDh8Dt3imfPDKEdIjx
	DtpGWUq85KIHBzD2+7RZmCqMdCXN4DJpTDrHyE4651ARzBf8j58EwIaCR7Ndux0DUIA==
X-Received: by 2002:a05:6122:2881:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5760c00211bmr10925154e0c.6.1779196530600;
        Tue, 19 May 2026 06:15:30 -0700 (PDT)
X-Received: by 2002:a05:6122:2881:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5760c00211bmr10925076e0c.6.1779196530178;
        Tue, 19 May 2026 06:15:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: qcom: qdsp6: add push/pull module support
Date: Tue, 19 May 2026 13:15:21 +0000
Message-ID: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c6273 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=0nXk2lb1qRGC1R-XhikA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: gmIVTqFCas4KW9FgD8jXrFHNIlxAuR_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX3QuWEpKz/SYQ
 nWk10UtvVlFVWTYcGO2gV06qEPAFJXf4actPgFL4hT04z8oVAWVu4PidE+MLFE8s+vbfZraMV0e
 9s1dRcUrUDLm2KW510w9LcvmaNxmI/eq63ADh2RG76Q078vs9cgzg97PYSpeBNks/AgRrL16Eat
 OBS3x60SahYWOQHq2ykoaBGLKqFvlcP2cMAdk8693tjgBPXE3NxCpcmVBTWONgWVuqyfWmtEerf
 QRpZZPG96ovz6Lw+qTNcRvMjc9EG4CmjQgxQ6NbaW7jwE4R/XBtAyNz9re8cV1rAzxfrZlu+bLg
 vRwhxDTJ+AAZncR1lViNx+PyDyc45P2yJwF0sJaCRM7DTMJ5MH48KsSSRbNwQXm7FiIIhr+bDNd
 k2vGMEzbmATTN9KPmq7YFp6bxHB3L42g0+7Gmd0mLzH9hOG4kRjg8vjB/IeuQkJcxpG6+gK2JnD
 GthvChF8Ukf8fajH1mw==
X-Proofpoint-ORIG-GUID: gmIVTqFCas4KW9FgD8jXrFHNIlxAuR_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108507-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7086457F6D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchset adds support for Push/Pull mode modules.
Push-pull mode uses dedicated shared-memory modules that allow the DSP
to access the PCM circular buffer directly. In addition to reducing
fragment queueing and ACK handling in the host driver, 
This mode exposes a DSP-maintained position buffer that provides
fine-grained hardware pointer updates. Unlike the Read/Write Shared
Memory endpoitn modules, which are period based, where the reported
pointer advances only at period boundaries, where as push-pull mode
allows .pointer() to reflect sub-period progress, improving pointer
accuracy.
Also the driver now can queue buffers which are less than period size,
which makes tests like alsa_conformance_test happy.

Now the pointer update visibility is around 1ms, compared to min of
10ms with read/write shared memory endpoints.

Along with the circular buffer support, this patchset also adds
watermark event support to provide a period level event from dsp to
notify about period progress.

Tested this on T14s, Arduino VENTUNO-Q platforms.

Tplg related changes are available at: 
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/push/pull

thanks,
Srini

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: use cached shared memory module IID
  ASoC: qcom: q6apm: return error code to consumers on failures
  ASoC: qcom: q6apm: remove shared memory IID helpers
  ASoC: qcom: audioreach: Add support for shared memory push/pull
    modules
  ASoC: qcom: q6apm: add watermark event support
  ASoC: qcom: q6apm-dai: add push-pull and watermark event support

 sound/soc/qcom/qdsp6/audioreach.c |  79 ++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  98 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 144 +++++++++++++++----
 sound/soc/qcom/qdsp6/q6apm.c      | 222 ++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6apm.h      |  13 +-
 5 files changed, 467 insertions(+), 89 deletions(-)

-- 
2.47.3


