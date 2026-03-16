Return-Path: <linux-arm-msm+bounces-97941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJJSA97zt2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:13:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6F29941F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1B37300767E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DC42773C6;
	Mon, 16 Mar 2026 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IByBTVoB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiWv/4yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1021DFF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662987; cv=none; b=QzQn9BwZqLz3g77l03G9J9vkAOJxVQkVAK+baMY0oEYmaa619JKSXTYrWTld6LpuB09ezIt0Jua4WCYedLVa46J6oAaz1iT6dImjt3iPaatGW2qDSWaJGeUdMx1b+o0ZgzknRUIXffIllXxg4jo/nsN5G9IM6SrN6gR/bG4ApNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662987; c=relaxed/simple;
	bh=Mr4jr7VaeHkNJbVF9EpiGyTb+KSuNeIPkkYRQ/waVcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j9clSslBMSASV001x0ObHXH0BWGm3V52/i1BkDtyLaRiwE9XBVoWcdCFr1PbdGakDsxvcU4xNCdbut9Lt+8H1IFF61ph5dV73IVEB0ibZyE8X1lfJ8JVllzo8n0bLHV44yjdQtvSTl4zH2+Xn5DXXbz9juF6/l6qgVFiyFNccxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IByBTVoB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiWv/4yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBgU7Z744013
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y3pUbnnl+mBhrEyuyTClXn
	DyRSB/VXGQ33fxBsW6LSs=; b=IByBTVoBje7/JIzkpBmHXj7ei87ycSxHZM9vuH
	caF5ksjrByz4OIMIDMOoWjw8dUvBk0IS+BbiC4fT0YqG2Xy4n8jp4gMcTuIpRtjr
	XhrzPxLinCXwodUjrx8tuL5dCuW1Q1KBY1thm+OdUsWTlY/FYVDkozMRJlQ/SbZt
	Q2oAz5lfSJiAy1gNfCkJz4cV91SjIP8+b595Su3ZuzKQSnIn6yKJJ78Gq5NeRj9Z
	bqyFsHjCJNIO7PxpIgjWHtdnUWHSosRE2A5p4fvm5FNL2ihLVrVLlSjIOPYO/0dO
	75lhLddMwXfgWJ9FRDqWQXRt+EjxEaiZEVKXqp2LNcjERsTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdrg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:09:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81c571a5so2910523485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662985; x=1774267785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3pUbnnl+mBhrEyuyTClXnDyRSB/VXGQ33fxBsW6LSs=;
        b=TiWv/4yHXsklwgTe83GZLhtvpLmyIUkrg3vm7acng14FWyAcGYQxdlemg5WfSTMzwH
         Amwk4qGtY3MGgWSRWs7d/sQCQHuh8u3Os1Qt7cc5t6Rq1plpknTddkw7lBPwC9ct0cQj
         0rpv2ChYvnD+J5YPryBnDi1meATOjNyAz0sRGjViSPJee8aG0gqctxbji2lSvckBGVL8
         cw8kIYvDAk1k7qMN9n9ZkRN9mQ2Xcrn9uddAzWhFqCOe2vUWtIxhvorcKFtVGVZMjA8D
         VJcjP0iKmHwvRR9dzSJHFJgpwumKJ9/uYBEKUBBXaar4ELjbzSJhwWeM79HJo/MQxOHq
         vJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662985; x=1774267785;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3pUbnnl+mBhrEyuyTClXnDyRSB/VXGQ33fxBsW6LSs=;
        b=sL21ZjP1miWaiQC8ezeLza0sh0+2gZZ/d8mac3HXhPr4pdYIAk9XG6Ws4Wewr/O3zw
         hgKocuu5U8P2IIH3iBWh2h/7lWztaybLv5iOUxoEPFl+M+7RfTrAmwMEy3/0t1jZhXsK
         odj/Zam3M1a99LjDQLMzeTlA60zruzgM+h2VA3qItVQGG5BEF8Ibptw1Nkef5m+B2kTe
         L2sCIjXiVZ72afhDAxwC/lXLgnVT9R0Y6GDn9iJfc4Tujjrt74AekKOiR7AYOWtkTX6+
         0oTxmv0W/u3ujF+ffY/iT8HYQ4FncgUEz1WFoK0M9AunHoSEkEeFQ0KLO16AeRAovxsD
         Unrg==
X-Gm-Message-State: AOJu0YyJUj1aLjTv4CrSOXhu4H7Gw5pZGqq6e4O/6IN0lghBnoxmMdex
	Ah/XOKJo4sn2kk9wCCkvq3ja0RqqMUhmksi4h0caODfR6wV9Yx7YLzxmhm0sLrzMTZZ8WHuyXOw
	OtpxQMT9LVxg77chG+YwyI6yacIa+8ipRQIdQBnqofp0fqfxPvKRv6UiK/BjW5HQg6u2gAy11nf
	kk
X-Gm-Gg: ATEYQzzDBbOe8Ib8+HDs1kvRuGGxGv5+11S+Xk+LhQnMLii4ZGXy6WPcLt0egMqzE+v
	SfgdlqyhXg6/s6UanBJGNjjYv4Ey29NGusd+84fo8PCigqxMZFvNMfqIypLxpwFO8XG0lvDv5r8
	j1Vy5EfJAAlkC1NO7tivK3u4+lVuN2EdC5zXM3V8fR1rTDJFrYMeQPWD1JRkptc7l9NG0i8Ivxn
	PQIQ0fwvovrjXo6OR09Id6G85ONHziSDEhXbljCO7zbXAf3jFlEwwL1tTypxT6Jb8LbVG2x3ue4
	a70cArczG6Os++6uFifMl7Tp8H2oJ+OSptzhinVRIW4/gD4isNIRy/f8DfS0gF1KERSKYHwoPDE
	i5nXpANMzeW5P3du8b4XpRjucw7w=
X-Received: by 2002:a05:620a:a2c5:20b0:8cd:d0b2:9c72 with SMTP id af79cd13be357-8cdd0b29c76mr378622585a.48.1773662984950;
        Mon, 16 Mar 2026 05:09:44 -0700 (PDT)
X-Received: by 2002:a05:620a:a2c5:20b0:8cd:d0b2:9c72 with SMTP id af79cd13be357-8cdd0b29c76mr378616885a.48.1773662984318;
        Mon, 16 Mar 2026 05:09:44 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bb90sm43922212f8f.19.2026.03.16.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:09:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:09:36 +0200
Subject: [PATCH] soc: qcom: socinfo: Add PM7550BA PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-socinfo-add-pm8550ba-v1-1-d75fda3553df@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP/yt2kC/yXMQQrCMBBA0auUWTuQ1CaoV5EuksxUR2hSMypC6
 d2NunyL/1dQrsIKp26Fyi9RKbnB7jpI15AvjELN0Jvem731eE9lRi1J8lQwEOEyH5wzMeDgmI7
 WxsGTh9YvlSd5/97n8W99xhunx3cI2/YBlGxGyn0AAAA=
X-Change-ID: 20260316-qcom-socinfo-add-pm8550ba-45ed911b46d6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mr4jr7VaeHkNJbVF9EpiGyTb+KSuNeIPkkYRQ/waVcU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpt/MFbSIU7aGqaHBVJjXJuHfUewE0iSUL8x+Ra
 zrWW/b4IQiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabfzBQAKCRAbX0TJAJUV
 VlPCEADAvyl497MQYXAW4UDfZfuExGu1toQXNE3wBN1Hq/W7vzG+lSn9ZS0NrdwbJXtnoZ1cvBM
 8JHFTcJ0np3pI1bR65FThXI6Qj4FYN7PL7drSMmqoqutslBoQ7cJ1RgGVp6zgr18y/1giXtGlsf
 ieryhc5hXxg2Mat+1CM9dSCMwzBGUV3ZN3n3EmBUqqdbahfkwXa5cS4jCDrr1fw8OgEBYl2OftR
 O0Gaf79OeD0UvZwl0GUnOiZmc1uvEM9E34vCfmMNNDgT67bIu12XwlDFy2vTamembECEIoWNbAf
 oUpX9cNq0P3zvIphI+OiYbiGRb+lE+LE+BFnDgn239CTCxKuOWZDSA8FyNlORz7AjuUWFnK9U5i
 GJ6t2Y2eiePkMbtCO+GI6ZzPYeUDu1CmoiEQAKQHW3qNGwcAYzcRXJW2Y/sA94Ffj5ZHATisPi1
 8a5eNxC+aiVBcKWuH8tO98dHbaJRSRE7tljjbFC5TE7gtIsHLxvqDxeyJEHUNjxiMrhUzryxYDJ
 PSU6xZVVKmVVEW4VJI7x3UoA/U3ouNzn8PPeAQPDmh7JnKlBtITtJwMVW/3ewk/X911p3hE9yfr
 eVx1+NnW7/+wVG6fGQ0Xc2houlA5HD1DZcoowL2NPp9PmqdXXCI5W0fdbNRiYYyT3jR62H7ONvU
 k2VnVxRRZavX7CA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7f309 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QBbM5k6TNJwGK6OQ0w0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX0X5v4i0evxyA
 uHdhXbICYnRxV5jqURZCIcwV/VEOJAWG3R3YtdbqzcM2YwW7bDfyKaq8okvQ5KslUmFDrnYJdZp
 cBsQ7ua32F8839bQ2yP2gYapMH1x8ZCEy7v9hpfaKs3/pqvmWkyiPgJ7rM+A1x+qtokiMqp17d+
 3hkLQCwlVtYpmYP3x0Da7I1DnAwLKIsTdSQbXpYWp/OEdwgQtls9agvdEUK9gTwCLz+wvkrmLBJ
 ndmHcCxXBebUa8KFpTZoyDclLLZ2MtU9TPZVPUtMtR0qkzz8c1rXmRKCW4wasnSSw8B8Tv4L2sd
 yEMFHJpQ8pjVYNIKGGwfR865MAZkWULmsrEN0HYnF2FxBgXxPNaOt4ZImKuZHmti4RJ7nuwrO4n
 /tzqAM0VluxRlzG6xDwjGdvzsaaJmb79mHtRfHJ2jJ8FZpSStJblmJoLeoxaDgxNbLO3AxvKNFz
 YaIK/J65vR92jtlMGew==
X-Proofpoint-GUID: QyXU3grUMVraG5hLnnuyUaDdaNJ6Om4_
X-Proofpoint-ORIG-GUID: QyXU3grUMVraG5hLnnuyUaDdaNJ6Om4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-97941-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77B6F29941F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PM7550 to the pmic_models array.
It is one of the PMICs used by the Eliza MTP platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 41867601d250..6a1c11340fd6 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -182,6 +182,7 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[76] = "PM7550BA",
 	[78] = "PMM8650AU",
 	[79] = "PMM8650AU_PSAIL",
 	[80] = "PM7550",

---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260316-qcom-socinfo-add-pm8550ba-45ed911b46d6

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


