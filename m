Return-Path: <linux-arm-msm+bounces-110170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAwQJq+QGGrWlAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 20:59:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E575F6C97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 20:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B1B93025D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCDF330B2D;
	Thu, 28 May 2026 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5Yxuejq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKnZRr++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B4B330305
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994705; cv=none; b=ep/PF+bjIAF6A9FOTmk6Hi6s2zl9uFDRPAaQbPi27E68gXlD5sGbyEa5lxmZdO4Vx5hekfBpad/3O96r2tbnqd+jCqwyU96It7Ct70u3jOpiFxF+imiraqqFbhserZY/MNBS4CyCZl+itNMU5fSrnF4hgtnoW+0qvDmm68oGbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994705; c=relaxed/simple;
	bh=t/9S6AeNLj1ovwarBDMWalZlR00m/lM0EbTcNGy2MS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SttNNo/jyrQuPglNO+4OEVx5YCgpCwqCuYXV5ACjqbUvSNMXqXRIRMpUhJ4h7MwoLcKn4PT2XhUJfua1TaRU1ssDfisyzjVVDpVOUgzPApQqCUzdW46lGvJkQmLjLbv2bmZ4rAwn76uRUOFmKD6R5QJLIM2Q3T4U7D4lteOU+fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5Yxuejq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKnZRr++; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SIOL3a1237051
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+
	8Nvzg9ms=; b=L5YxuejqcqfFd5NOC1OHeLZCdgmrWrrci58rvW7RBTEv+kw0b4C
	Bl5wkbaYHqaJeyIb8BaGM0XGKEs2KdgkuIcltNQfhEZ6C0Rd1K7njUI+7JBUudlS
	RmP1W4NjkHnFqRHJ4sdOHLytUJaH92YrlibHToZpGJyirPXiYJxMlVwvHf8QcNqb
	hPW8VEh3uHBO9QBQQ9jGw+3pZC9S1zaBrPAnsyF8FVxMDLh4yZlLyca3yJzcn/Ek
	70b/6yUQkbU2JIhmxu3IFqT5lTJmSndxHicc2zFv2DXZ0ulskALBr8bdvwdNn0NG
	sTCkigYMMCEcJelwnU4CoJ0H60IC7ONZqCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4r3xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso91963361cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994702; x=1780599502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+8Nvzg9ms=;
        b=fKnZRr++eff9IkeZHw9YcC8+VAcIK87RMSVn6vzEy3egIpk7qvwf0dMwjQ9YDso7Rj
         CKdOMgf250qHfkfAbCPW9+0578hcuWB29dG9jkvAOfvBJcDJRuLaGrhoDB4wRv7W8X2o
         /NkNU/jeuoSHjRYlr8JYFHPVDOfAqMHTy5ScbtYI4Flos+FoyvLTh6V0504dfg8gglE7
         Te3HvX7YRVlrh7MuWz4IDRTo9QOGHfX5EB0IFhCaDMOQbVxzzBnXQsozvECPDFzTPgLS
         NxK9WN1/jiFSzzsl6grSphpqL9lIYcj0EVkbKYu41fDCIDrsC83C3FqaIm+19biKJfWm
         5apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994702; x=1780599502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+8Nvzg9ms=;
        b=XlyXoBqbWqJXon36plzR+hdUjvgM9aLpknyouDiP54A8+MqRBevoi++5eayHJLzcGj
         8dXNQq1GYIZH9Z1/hott/tLrxUJpWTufHodAmK2orF3F23jT2vBC3V2pVrYa8Y6i7y6d
         9s2MX8tJJqU5iVfe+o5LWZoEZ7eqmLb4Xi714E93/XH3G6Ge9KuYVqnA7sG6hgZTzpPs
         HlCvbU4ZXBRl5GYbk2aeu1DiE5BD/fntT8E+iWP3dAMB/xrDnGIZFBfSF67RanP2M/cM
         XzvWM6lYkkAPG8aBIRqDCCTD9Cl2xVMypwZqK0vHc1+9CogK3Gdrtk0qZ/qa82rm20xT
         7V0w==
X-Forwarded-Encrypted: i=1; AFNElJ+ltO7Xwmu/vXxrKCYQrIwLx/gSnJ/38ANbrnb8peTHPQAGB7flAykSRtB3mkeCajvSaL3/DWos8qMbpk9C@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqTY8VlASe2gNb3UdmLHAQsI+2S5iaY1mnI9+kD3qN2bvTq7E
	vwqNnb8iYHK0uHgyyg9dmTR246lwFCYVWQVXp/x2rCJY+mL3+vqX2N+2kqeM4jdoIWstRQ7CojB
	CuwZ20K7atM2jYCG8aHpGXCtTDImcNgQkZ60pW26HX6WmdufofyoMUa+eEmLtat73x4fk
X-Gm-Gg: Acq92OEwAdKKrQN/+ZJCQQoCijpKQSBn8B7I+EnC0Ia84Xbtes4szNcm6Suq5xawGJv
	LQTkCHXGDRYn8D7Rjo00CKwK89+p56kTUz8Q3Bq8BL35/MIGLEO7Tta2iYgjSmwJT/9Hftd4wNo
	VbbINhkwP6b4JBnNJFfdHxRhCgfyNVYhQySEW9mRYGI2XHWxjLD2c90OEtXQgcOnnJ7Vz7+UCnq
	S57Mr4/Vev6FxBICw0UJyL3LyHX6mLBKJgf9VjkWDUEtV42Luyk9W7WbWXDZxpKRHUIZqZ7bqlq
	RrEIhxRiLIum2FkJobl+Zx1O6cD+VFpWd0y0NBKjg4k/7B1mck93AyNbyYjzf9gp5X/pluiDMfi
	5ISiG090YhjLCwD2KQd+I8MW/Ap0e2K/5aJuD9QWtiKNhky8WY8ZUoq6X72ZFEjvrfX4IGw==
X-Received: by 2002:ac8:58cb:0:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51722fbb1cdmr35047241cf.11.1779994702052;
        Thu, 28 May 2026 11:58:22 -0700 (PDT)
X-Received: by 2002:ac8:58cb:0:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51722fbb1cdmr35046891cf.11.1779994701594;
        Thu, 28 May 2026 11:58:21 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: qcom: qdsp6: add push/pull module support
Date: Thu, 28 May 2026 19:57:59 +0100
Message-ID: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IE6Mbpii5bDeeHBeXhkwvhhHKfIO2sAc
X-Proofpoint-GUID: IE6Mbpii5bDeeHBeXhkwvhhHKfIO2sAc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX7GsRSYx4rHea
 gQWEEcGKwiJQGcc1gWFf7Ny48vdmIzH5UP52m0b9Mz4b2qOz9eVQcA0AlLarJVGJ66ESeHRbffb
 Ei5FEwUntovep2c/uPWVJ289wRD3p0SNr3Gr33S77yCXXcJvJMyIUizSHBPUf3KQLfnULMm8087
 za+cszUt2cCwIzVAmqVrGOkGWCB86FD51QTFG8CgK86GqExYnCqX7LCppP8aLxpGyHPfHcgET9S
 u0+Nu3c38D+pKJs8ifVSOd92aVTiupLKixjaxGIypS60swLmP4Aqz6AuqnxNF9qDac/A+dVZVz8
 bQxb5lHP8tXkFY22B9WC/NUodnerdsKSh/jzIJF72I6KcZ5DXQV3nYXzjArtLgIohrli8VoRw29
 RkXlnci4GawVoIA+5ulpExGE/qycFAcmMyIwe8yvh6uPUHpwaUYewu5Q/e+cM6itFr1oYhybCX2
 jZZDAfJSNFwpzwppNwA==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a18904e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=3lmQo_yHb_bEsz3NOkoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110170-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4E575F6C97
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

Changes since v1:
	- move position buffer defines to PATCH 4/6 to fix dependencies

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: use cached shared memory module IID
  ASoC: qcom: q6apm: return error code to consumers on failures
  ASoC: qcom: q6apm: remove shared memory IID helpers
  ASoC: qcom: audioreach: Add support for shared memory push/pull
    modules
  ASoC: qcom: q6apm: add watermark event support
  ASoC: qcom: q6apm-dai: add push-pull and watermark event support

 sound/soc/qcom/qdsp6/audioreach.c |  79 ++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  96 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 144 +++++++++++++++----
 sound/soc/qcom/qdsp6/q6apm.c      | 222 ++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6apm.h      |  13 +-
 5 files changed, 465 insertions(+), 89 deletions(-)

-- 
2.53.0


