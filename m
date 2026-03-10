Return-Path: <linux-arm-msm+bounces-96485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGT8FM2Zr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D22452E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29DBB3144F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CA53CF687;
	Tue, 10 Mar 2026 04:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5wXBrjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebzbju4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C872F3CCA12
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115762; cv=none; b=AgtFuwpWuuQhhxpoPjuva3VKe+ed6AQpe4lMCNOdsAobZtbQgdy0ycKFQf12SJi5RjcQ40jyd1k9Se/OFi6odNmY8fLrCohUsWHRBPYtvO2bT1XJTr5oAOdx+P14dHLHSiKTopNsHFW2mWe7FvtjuDQWtO8lEe9TSJFhjo+i8PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115762; c=relaxed/simple;
	bh=yHNRVHvntJT7Tx36zVXQ9h+CerzoqsLrT3e6rWQ+uvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LN8adQbveF/8+7KEh4AEO5Q6GSDw249JdTFXsu23G9SgiNt+cUWFl93tLCryeUSUr15kBbeGYOxcOrnOEEKx7bY0Tsd2C2dgrVuPQ7fcp9vCgxAX6dr+ysFcCSY1xIG3nfh+KTJ8K8FyQvOQaXm1Ihto/trLhsY+UvF+PrYoHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5wXBrjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebzbju4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EOsl2817421
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=; b=l5wXBrjQqyoBz3uU
	6gf/eCMNp/mjGdVJ8KTy0Wvk5GkdlgcHtJW1Zl7kLdwkUl+u9gYrjT3BxgA1uGu+
	hmfZNTfS15JdYBle4FKqZUBBHo9134xMioO9NNhjJAYLtC/eOYcK6HKDgmHXpQ8p
	rm7+zytQ9VvMIm8CNQXVHHjQBDanpP58fUjbES4MzAkGtzZPGVzovKILXsKTC/1W
	tk0ttfTVuVoU6Q4iSW/zwSARL9uCHFVXc83Ml+oprDz/8I4W6l8FoBjLif2dFQjp
	k4uZfGrlVIJkS/vJCS/1IbAvTiXfd8zPOuuyXU+MJ4Upd/+LHv3LAd+TTUvcHvwx
	iv50cg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr42dnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:19 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-41701418411so23553932fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115759; x=1773720559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=;
        b=ebzbju4SqFP7TpK4FmpWjuVZm9Q/FawHMmP993ID3ihhQA5rFudzYyhus/QVcMMBU0
         5GPHasC7svaKYkE//jtDW5853lcoghpqsiS/BSwKA11Rr9mtJnCAOQgVDGFNpdLwtFMg
         20MJKzTwn6moPfRN5uScLyPbyJ5lp5193yWUUIS880UvKIaeNabm6uYxH6VLDiJ/jymx
         mR/8LU7oW5TQa/FkSK/Pr3Yx39N9CUxbQuzPm+W3v3DAq7u8pViBgBUeN/rpXfXvfzxM
         +21evcAkMNTELzmGK7oPv+yTfxdSHu+st9WbOEU1ttqK2gF2PYbd/mBbkBLelTNG+I77
         8eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115759; x=1773720559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pEqfmW8mEjrirhyyza0kcOBf3SgJNAje+F5NTIs4Z4o=;
        b=v3YKH7Vll/KxzHFRNxg7wA0nICJB0sLSrj4F0RH4rShHNOpAsC+Vo0E5Py917Boyy7
         TegVFaBZSLFglEFnlomSw7Z2W+xJM4n9xHbs5GMzyWyk26n+h8Kz7aR3nACOpLiOPnGE
         +eV101PeKN+lERe27leB74pZ0kXJb7VO/8NOsgIOlkBdNtwWznBWw059BmFlSIRuKS8A
         mREtVLFX32PZH6T64pvRX/BIWFdpDU8qNRnGY5OvcOK971QgC2Sw6/Z85EWwcIxl42DF
         EtCUEdDbolxRuggs4LoN0x9znOQdroWQdk4Tthzm9uEIsifCMaoU1QPX8cSed7U7gC+x
         R3dA==
X-Gm-Message-State: AOJu0YxZYgZqe5N4JVRa+A2hAbqLd0qIgGRUYIZk+BP465bklTzbR2EE
	iGzNuyQPylLGcB9eQHYl6pYUho+4v1NJSbdvrcyrRLpW/5vv7vO13rENeXtvApBdZKic/MgPUpb
	TY0uFn9+y4fVvgQ/dfUcOCmGPXcd8JkrUsYw4aX3MzHFAdJCNoQL1ciXDVfQXesPh0l5J
X-Gm-Gg: ATEYQzx3LAJ6dhjEUr3ftc9t1ZNhFkv+qmf/6ESdXoYO6Pz96UfPoPeiQba4n+ZxTSz
	OCFazAi4taUsgFIi2FMnNHGt/KWfiV7o3F8EZdDzPFelJ9v3MIxAx8oVX+CXfwequrSHC3S4qwr
	HsjUPir3MYq6JBdmr6On0yz6FP1eDCAqE5TViDZhuGhDFdfYezcJmt057Y3ct1KGn2jraPNi4gU
	yFq1DNbZia2JlbYGzlyJqRYregu+jyQ4Ir+wt8Tgt1qmbf1lJavwyxvd2cntZAoffZL0sgRq2ul
	csyLzQqmBea+l/aZJYRdrg0IAE47+RMkphoPVoIj7Tm5wckIqRTS5QvUFTbznd6mKNO1Ocjkn/x
	yu9N3xPxsv59HodsmlZraRPTB87JzeXXgHp7d815NYsQ=
X-Received: by 2002:a05:6871:56c1:b0:409:e3c4:6027 with SMTP id 586e51a60fabf-416e45d1749mr7785238fac.55.1773115759216;
        Mon, 09 Mar 2026 21:09:19 -0700 (PDT)
X-Received: by 2002:a05:6871:56c1:b0:409:e3c4:6027 with SMTP id 586e51a60fabf-416e45d1749mr7785219fac.55.1773115758745;
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:18 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:05 -0500
Subject: [PATCH 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=yHNRVHvntJT7Tx36zVXQ9h+CerzoqsLrT3e6rWQ+uvA=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpVAa+TCOg3EjuGeYS5AYt0paEICH4mxwWZ
 /SYhTOjjoGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW1Yg//c2ijG5PGehgPGqcoo93wCG32YQwPz9wBoF7H7Qf
 ySYaXYLQ3odq/bPzw7M4apMwn0Vb4JSElZlakBHLe0kpqqUhkJCn6RTpP+ThO0AdW4Vk+H377Xm
 V9K/tYLISYZ0fXdPqdgLqtUP2Z7WJ5bC0/prNEQJ4mYWx8y69rsM/RnQYrlxB+U4JxNz1fOEzR6
 VxAhJrGTx6NWXJKxcZpOTNJuLGFmnn6x9PUwwid0GiHeiP4sWKOLdcSzzKS5ll65Zvhm1F3BkZT
 UFDw3cRNtyFbBPoV+OswTIRiaBMsJnyW/bpgZCPBHQbrrxZSnCKLKn7GzHCDGp2K8Kg+x+mQ1Q5
 eFerFu8KkjO9JmjV1HBhk2PolKy3cJ5C3U/ePcmbN3O4Z/LRUUL/6Kwd4pE90HjE3X8xb0ekvPy
 Xfh7SRmxWL+hHkgImR2Sfjp7q6ykho97cz3/Ix+4OeH3P/UqYDUIidxJcaZ1ZjkJowmybXxmL1U
 Ln9hsbv0LhDaMghILgJyBgxlSV8FXoiE1bKCRu4Pl/E2CVgD1mAvs/v/RWD2JQw6TaTk4B6CV/9
 EOR75En7FGN6KpqMPQTgauxtJ3BMcR+P+szTGmEasToaT3RYsw9d3sZISElPh4PHjvINVMWiY5a
 DxruBzZ/HN/9PQ45/tlS7Wjdf+yMeRnZP4wNgj/VGI58=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX2NPxaK4yr7AU
 x+q140Nrp54tZb81XU0tMI9Wg7y87kzygzxyy/ZOZJ63EV1l/Sbkc54ddg57nL/RCRkmeSzxG2O
 TEee9vakklFApLtTXkYw4sB4WJViQEzZVjaV3xUTySm1kxGhJVkFpnCkP7uMR11MVBJ0zbJPRgf
 IfxZr9edv93XSfF0yNXNXn0YPcOfbqRRPJ1QGc13Q8CjfLYWCC0t/+ee2DmtITsK40MdthgyXlN
 NIMd4iVbGsU9sfG34zLo0G9H/vGIgK1+P5fU8fK+DDEi2tS3raV7WUSqlSJb1lF1kiHpnT0utoP
 YOCWrJR3DN/tjN/+DtZRXq060FEJBpN9AnEfVs8ijoY7TnrAQqp9sp6P8HxK8L/ZV7yMaUy7qxe
 178PHxduSqavAamiYqXRPA5wmlyVMxnQjYngwJfWm2xLvvFHGGrAxeUOTHJFozQZLF6AvUgAOSI
 SEzk05I3cmMl7gJ+G6Q==
X-Proofpoint-GUID: -UF9o0ym6jxEjNy1ZJbda_2pq2ZuHdPu
X-Proofpoint-ORIG-GUID: -UF9o0ym6jxEjNy1ZJbda_2pq2ZuHdPu
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af996f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YGvZ9ezxgrw7oyDE3t0A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: AB6D22452E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96485-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When the remoteproc starts in parallel with the NGD driver being probed,
or the remoteproc is already up when the PDR lookup is being registered,
or in the theoretical event that we get an interrupt from the hardware,
these callbacks will operate on uninitialized data. This result in
issues to boot the affected boards.

One such example can be seen in the following fault, where
qcom_slim_ngd_ssr_pdr_notify() schedules work on the NULL ngd_up_work.

[   21.858578] ------------[ cut here ]------------
[   21.858745] WARNING: kernel/workqueue.c:2338 at __queue_work+0x5e0/0x790, CPU#2: kworker/2:2/116
...
[   21.859251] Call trace:
[   21.859255]  __queue_work+0x5e0/0x790 (P)
[   21.859265]  queue_work_on+0x6c/0xf0
[   21.859273]  qcom_slim_ngd_ssr_pdr_notify+0x110/0x150 [slim_qcom_ngd_ctrl]
[   21.859304]  qcom_slim_ngd_ssr_notify+0x24/0x40 [slim_qcom_ngd_ctrl]
[   21.859318]  notifier_call_chain+0xa4/0x230
[   21.859329]  srcu_notifier_call_chain+0x64/0xb8
[   21.859338]  ssr_notify_start+0x40/0x78 [qcom_common]
[   21.859355]  rproc_start+0x130/0x230
[   21.859367]  rproc_boot+0x3d4/0x518
...

Move the three registrations of interrupts, SSR and PDR until after the
NGD device has been registered.

This could be further refined by moving initialization to the control
driver probe and by removing the platform driver model from the picture.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 52 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 09ce3299e15c25b1b9cf6b1559850adf4aa20737..76944c515291a62fb9cb192bec5cd5c2caa542f4 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1613,6 +1613,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl;
 	int ret;
 	struct pdr_service *pds;
+	int irq;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
@@ -1624,19 +1625,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
-			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
-
-	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
-	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
-	if (IS_ERR(ctrl->notifier))
-		return PTR_ERR(ctrl->notifier);
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
@@ -1659,24 +1650,41 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi_up);
 
 	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
-	if (IS_ERR(ctrl->pdr)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
-				    "Failed to init PDR handle\n");
-		goto err_unregister_ssr;
-	}
+	if (IS_ERR(ctrl->pdr))
+		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
+
+	ret = of_qcom_slim_ngd_register(dev, ctrl);
+	if (ret)
+		goto err_pdr_release;
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
-		goto err_pdr_release;
+		goto err_unregister_ngd;
 	}
 
-	return of_qcom_slim_ngd_register(dev, ctrl);
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier)) {
+		ret = PTR_ERR(ctrl->notifier);
+		goto err_unregister_ngd;
+	}
+
+	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
+			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
+		goto err_unregister_ssr;
+	}
+
+	return 0;
 
-err_pdr_release:
-	pdr_handle_release(ctrl->pdr);
 err_unregister_ssr:
 	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
+err_unregister_ngd:
+	qcom_slim_ngd_unregister(ctrl);
+err_pdr_release:
+	pdr_handle_release(ctrl->pdr);
 
 	return ret;
 }

-- 
2.51.0


