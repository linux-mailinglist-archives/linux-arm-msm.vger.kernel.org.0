Return-Path: <linux-arm-msm+bounces-118101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hlo9AZn4T2pArQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:38:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F7B735107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:38:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gu4wnLBc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U3XttCL9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 158AF3034EED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B73E3C2788;
	Thu,  9 Jul 2026 19:37:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3A3B9D81
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625837; cv=none; b=Pa8hdG8oJtudooOI116sl2ZzwnA0sAJNugkJXAh4iWllHbYvimFW5BBPzNYDl0gQOFeZtiKAENwe8vHKv8AlLc90EzDQaKFR6AE4U+s3+4AM2Fuf9cjBYsIXc7r/96kOKIbt3Uj3OlhqTRDNHROhi3bI3TgKRjU3/7OHJqgx/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625837; c=relaxed/simple;
	bh=/yX5qqwc0FwDwfzLIeoMUNSa8oPTYi1YpRWwIMheozQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uvhSKvZyPTmSPYKKltKKUNXubR9hGp0rcOdREIObgadOly3tCkHmRXi6wDqLnQ9fQJqguFhw9Tdh4Rl28UEIkfI4j8nXCGD4Kxp2+uWHZMH8FEINcik/X4RRjuDCFMf+qAoMI+AxZo0WBdIUHCg/fbaLAa58dZ20eXzYKVhGix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gu4wnLBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3XttCL9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXVeb2389118
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=; b=gu4wnLBcZZpzd1Ze
	nC5EAL9kZv65BfGn81Jfw7dOslfSI1FvG+FDOz24FF3nxgFlH1G91RzBRy0ffrGV
	CYBuYk9qO/aDI9ldVdMB9Pg1LItNOADBGaUSTb+e6mdu2wN+c66vqDjQDQYFAk0Y
	NzG9xbmVmBt6EiBJepP89ae1uGboDrZTLenyOzx9QZQiiYNsMvbcc6yctUKdwUDJ
	CYu19R82uUmYW2JnvTKnPX7QHgrfc7pizmvIyBPZdAZRq1i6WPfbEzORvJdLY87B
	NQ2B1oRzVJ04CICmHmAxwu4axwXTls4dNDH2RT3Ccu/sWZ91Iv0i/0RBCouC8568
	fKOUxA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydvpfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:37:13 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7377e2f1a62so66286137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625832; x=1784230632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=;
        b=U3XttCL94dUeQ9T9oywZ+gGMqEDL4wjAV751sEgQ5FEzrtnExouvvJXGNvn1E7IGMI
         eVlDvZgSRXHdQNzZsu73Jh2MXRNcIpOPh2WI/Es5iSJyH7mtwvl+rUPxCBaDZf1sGLHu
         UOmB/ENVVfGPprmzJl8D/XMhBJV9MRAHPRriZL1cFT3voua5foUF22Ik0pE8t4armkFG
         Fm/TjoLR5xB3wGys8rP6tIE2iLppJf8o8vo0S9PB/V1U+7KC6gRCBhGHF3yaFR3u1ENu
         VC6pnyf4kTVMNzhm5oF8BtnpLa6EniAgo/nXha01vJInctREBgy3u0nCs6H23e2hH1iL
         kjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625832; x=1784230632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/h0in8AC8WcWs2ubAUt9BJaWYQrytkWk3f4Tb9JaVLE=;
        b=T9FXBGlNz+vR8KK5pNRBhQHcLFYr3T02tRm3IWcl9Aok1QMt7enptpl90hUuAiQI+T
         8gjNcsAg+w8xUwnNzZZWxsUDqQjAzp3HqhrO5ft0sHt9GDKrbvv/Zs4koXpm3gd0q7dR
         ZcgV2/0eAPkjOVBDdfiRN/3ooHMXdCC6FS2YrrWO6iwLVwWU8g23t+w79QjACsxaHKjC
         pOMv0+LCWB67eYIu2IkYTVzQtPEIUPWGdIJ40UEUhF3TopcVEp9n4IWVwL1HCYrEFaNU
         PaQ37pOvBPe3lJMMj1tlMBg1UIg+qA0ZXLtW3h4mWXoUA1dMkxbX3BZP0pEBdA8+PtqT
         ffsg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2oN/QCHjFlFNJ4PdV+RPUz1jAW0V4p/8CmgmMvSLV3OELNzZjPhPFPLN/rZ2vrZVzFjI2n7oYTrRS46S+@vger.kernel.org
X-Gm-Message-State: AOJu0YwufQqQuRpCE3flzOJlbBxsshtKyoy7NyO+kWfIS9tDNdswMtf8
	4V+0stt1TrJ72FQ1OFoKxX17zbeJ0XjNpW5nmIHM541hadXY32gX/YBFKaNePE+I596SUOKUC4X
	5G49yxRa5tsffLuLTTx9crrj8RZs3DOX2/3booYErJolwi190zyGeOyaFvix4Te+eKeuQSO51SA
	XF
X-Gm-Gg: AfdE7ck3D4F/zU0lzov4V30sl4xYqVuFBTz7dlj9nhuovCBPSJxBKqKtsSukLgevTKY
	MOSfMBmjSIT+p+iP2vEtMT8ty61EhG+i0hZzpStaAyTb/WCmAwNZVCOnQkJY46dLxjG3+Lw4T2L
	OZnGEjBTstNd4S72+StK+SkU1QUVzLZTgygu8JmKlC26NO+10pzECFt9H6mhoVUhBVtsvOacW9V
	Ugqb6WX56hRX1WX6HzfZP8tFTxK+CD6NQ08sJFZGizeZClt4cT528vhys6qweb0G6ooo2ED6tKI
	JLjHkEoca7sfHgB/cWnEYfcmF+7z+vBXOgplFXSQIjrsYMVObPsD2RKvoCa37+p4Snm81C0agca
	9QG1OkjmfQqEHkjYfmWSgIHPRzGtH52uwkWytHhNTTAvlMNTZeRg29je4OeIAsT6SQAjgTgnJlr
	ToomS+lobk6bOu3xYDNdekG0kP
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr5415328137.16.1783625830169;
        Thu, 09 Jul 2026 12:37:10 -0700 (PDT)
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr5415302137.16.1783625829641;
        Thu, 09 Jul 2026 12:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:00 +0300
Subject: [PATCH 3/9] media: iris: add support for interlaced decoded
 content
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-3-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/yX5qqwc0FwDwfzLIeoMUNSa8oPTYi1YpRWwIMheozQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd/dkVhmw79DxeguEZlzh3VAfnVKsMVsTmU
 4JlU+hRdIeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1RhbB/4lWopNP5iVxyB8+1/qsq1f15PEbkFe4MI/OonE85gIpTrHFLs42E+OXGZCBfVL90HoG/+
 qQYSIPYvJxlrgn93j136/co1cZ9jHyLQG8adAEyYi8wQfRi6mbJ5hPaHUpM+fGc30H6pmpuYtpK
 77+Hf+D3W6tKgEqTkUOqtFW05jo2ftrXUEk9e/kGXzERVCDACUm4hPeB+QlwOixNB2Dq1TSmvD5
 zc17gHyl4ipDtja/3rHwtPoT8N1e9A8pnJht9eXnshUF7d7z0/qCLRBpZVZmtIAgANkNUFZkP9E
 bhWQ3njanj5LE2rUqQZ7MBHL5JZzjeRZ3S5O0x+fibAsp1zg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX1ZbuoIkhZrYz
 HB0MlS1kiWj7xGQqMFiFvW7VgAqS+IIlWXcO02bEa0ZHLzcEQXQ/XaqYDVAqsm9Qk8BPgA4+C7L
 pe0n7DTc0/DXLSjfxYIDpTDmui7oD5M=
X-Proofpoint-ORIG-GUID: MqpHieGz2rSngcnY4HUvCcHEvV1mUgVJ
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4ff869 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5v90hXcHZB-AQrEjmJcA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: MqpHieGz2rSngcnY4HUvCcHEvV1mUgVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX2ed+KRUrQg8m
 P237N6S4wK5oDnxZpeZIQya49LgiDSK8J5YuDj88xeNoMqf6zql85sbZlj3t1FkgPPyGaA3JFwP
 /GVecW41ULtm8vSjadc4YIuaaQ9PC+MHGIf7lp81eSpnDziNYo4KJ5kBkY0uLcyvYJ4xHAcmInb
 pVaYauqhoMlmQRcFyc8qlzgi37826pfYPZFU2JVgF8a/SDj6GEVzgDNKFbWg3wWzZmWZ9cD/AyZ
 7NnFxsqCrp8YRWpMwGO1Zj2DdcdiNJ1eYa0KbKc8SPvn6S8/884SA0eJAvlqzHo3ebZ5B3UokfD
 b6dF/nNrG9B+tT6IOtIcb8Heq37PTCuZLo8hXiSW1vwaLqy6micPbJvrYJUcyRENnPbcKsTxJm0
 0n5JN5yWstk8B/MhpyCk1ObEeAbrfqs4Fdf/E4Wi7AgA6b+3y4jfsET2084AZvbC3EnofTP0yxW
 Q7qTIJjii2QqnoYu1wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118101-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71F7B735107

The Gen1 firmware can report that a decoded stream is interlaced through
the progressive_only field of HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT. So far
the driver treated any interlaced content as unsupported and moved the
instance to the error state, rejecting otherwise decodable streams.

Stop rejecting interlaced content. Track the interlaced state on the
instance, report V4L2_FIELD_INTERLACED on the capture queue when the
content is interlaced, and skip allocation of the bin (scratch) buffer
in that case, matching the venus driver behaviour. Only genuinely
unsupported content (non-8-bit depth) is still rejected.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c             | 8 +++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_instance.h          | 2 ++
 drivers/media/platform/qcom/iris/iris_vb2.c               | 2 --
 drivers/media/platform/qcom/iris/iris_vdec.c              | 2 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c        | 7 +++++++
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33a34573391a..c12fe724dfb8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -517,7 +517,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	u32 work_mode = STAGE_2;
 
 	if (inst->domain == DECODER) {
-		if (iris_res_is_less_than(width, height, 1280, 720))
+		/*
+		 * The two-stage pipeline cannot decode interlaced or MPEG2
+		 * content, so fall back to a single stage. Low resolution
+		 * content also uses a single stage.
+		 */
+		if (inst->is_interlaced ||
+		    iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 7ad6f0bb4677..cf2cf31d5b61 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -103,11 +103,15 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 		num_properties_changed--;
 	} while (num_properties_changed > 0);
 
+	/* pic_struct carries progressive_only: 0 means the content is interlaced */
+	inst->is_interlaced = !event.pic_struct;
+
 	pixmp_ip->width = event.width;
 	pixmp_ip->height = event.height;
 
 	pixmp_op->width = ALIGN(event.width, 128);
 	pixmp_op->height = ALIGN(event.height, 32);
+	pixmp_op->field = inst->is_interlaced ? V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
 	pixmp_op->plane_fmt[0].bytesperline = ALIGN(event.width, 128);
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
@@ -165,7 +169,7 @@ static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 	dst_q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
 	dst_q->min_reqbufs_allocation = inst->buffers[BUF_OUTPUT].min_count;
 
-	if (event.bit_depth || !event.pic_struct) {
+	if (event.bit_depth) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
 			event.bit_depth, event.pic_struct);
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index ffdbbd20901a..67466b4d0896 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -53,6 +53,7 @@ struct iris_hfi_session_ops;
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @is_interlaced: a flag to indicate that decoded content is interlaced
  * @last_buf_ns: start time of received input buffer for current one second FPS window
  * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
@@ -100,6 +101,7 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	bool				is_interlaced;
 	u64				last_buf_ns;
 	u32				frame_counter;
 	u32				frame_rate;
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d..28dc269dcf0b 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -260,8 +260,6 @@ int iris_vb2_buf_prepare(struct vb2_buffer *vb)
 	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		if (vbuf->field == V4L2_FIELD_ANY)
 			vbuf->field = V4L2_FIELD_NONE;
-		if (vbuf->field != V4L2_FIELD_NONE)
-			return -EINVAL;
 	}
 
 	if (!(inst->sub_state & IRIS_INST_SUB_DRC)) {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9fee5f28097d..9169b1335b5c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -251,6 +251,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_src;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.field = f->fmt.pix_mp.field;
 		inst->codec = fmt->fmt.pix_mp.pixelformat;
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
@@ -290,6 +291,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
+		fmt->fmt.pix_mp.field = f->fmt.pix_mp.field;
 		fmt->fmt.pix_mp.num_planes = 1;
 		switch (f->fmt.pix_mp.pixelformat) {
 		case V4L2_PIX_FMT_P010:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 00dbb091c54e..88f130d09a6e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -937,6 +937,13 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	/*
+	 * The bin (scratch) buffer is not used when decoding interlaced
+	 * content.
+	 */
+	if (inst->is_interlaced)
+		return 0;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_bin_h264d(width, height, num_vpp_pipes);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)

-- 
2.47.3


