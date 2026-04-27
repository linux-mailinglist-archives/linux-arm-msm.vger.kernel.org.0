Return-Path: <linux-arm-msm+bounces-104568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CIeAJev7mnxwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:36:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495846BB3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6303021E47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5509213E89;
	Mon, 27 Apr 2026 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBE1YaA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNpIZV0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591A1A9FB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250151; cv=none; b=pnp6fvcgcSK/1pc9H8ua/3uEwU7zwoBmPndqT7f6jBCM11Zd12COMmv1B5maK0NgIi5gHYALBXsFGtT09qtWpochz+37ys7pBrvvIKUa2OAuuCOkeB0UC24B509CkhYWuRNuyla+hPqK6mIWKA0fecr2ozVjnxtIQJJy6Wyz158=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250151; c=relaxed/simple;
	bh=TVFoh/O1QUr/hyHCGQA0e2FtrrrITFxyb/9EX7mlAvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWqhmgz9FoK5BBghD/E8OgXH532gfzJ4wD/UFa+PxvLWtFOorBdd1+u7gw6BguBU19BcQs04T1L1zrgzC8BvAKvgSd51lWkZQztJMBGnSglWjJHBF2cOJDSzCZts7MykjGcVoNJ493lqHE94j9tuQJxUjnkZS7XjN0ore4/nflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBE1YaA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNpIZV0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q8vRwf4186675
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HmnfChetANX
	bsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=; b=cBE1YaA9w0SkWWEXtyRMqErK79Z
	4a17OqRk+B0XdSH/wTPsWymKhSQ+dp/snx+mv2mro2STB3xbd/v40puJKEQxXQbg
	ehL31oha20rJx8oDUJxfqo8Y43Ts/GAAX/4aM79X09pH2ew2XS1baMHlFMgybMvK
	svh9oxFGy2Ee1mg/fbCK1Tsov3jVZD3L4r8dO000COQ9r9SM6j7pIG6cLdg6LdZQ
	VR1eLyjhFSXE6WRAKXq15YfUPjkpuE5Kak4AW5N7Ngr1oo9uyCU/syJWieGtIHHE
	3pBPo414EPHn/3Ahyi5qa1zYIzvm30YDttPNWADjZ5WQHd5tXXXz+QwmqtQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3sr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eaf70f3b5fso1619922eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250149; x=1777854949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmnfChetANXbsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=;
        b=eNpIZV0cPuZhgLvEkjI3ByZ9MMTJmpouEHoq3ebsxuxsJP+zGqRtUHz3lx1dUw9YTi
         Jyssdy/If0S/D+bhvFJKU3rrk968H2rQ2AH3+PyFO4gpWQIHeQ05CsDcAez7RX/b8wYi
         guBjw6vFp7h2oaoEhQX3wacM2gXo40Bxm/9E+oxdW/HGjqp16aJcbqiQwt8gv0Fmy8fx
         Weq4Go8UBnA+zejsiD6ykzruCXMq39qYx67NBAJC7zDuk6KR/n9g2vd2zp/WmWqXktF9
         pzTNwfXTkX+TotZ3Z9A9s5MbNEgvK7kEWCrOvL1BxwnByhc9D0FVY8vVvlWaOp2HS9ZI
         ZJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250149; x=1777854949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmnfChetANXbsvitvZCwI8+1ngUdoYYmu7ffZcpry1A=;
        b=QyFxzL5EgpshbIjOXgHFQqzGyLJVrLT3qaFJoIGbpUeher20evHjRQDuhpE7Q9kmmb
         lymewuqgjJWFtUGhCMIQS0P0xhWb/BN1ksScnAe+jVoGe2TkwntviAfcFDkoCWglvuWC
         zzirt8Hp9O+WYg+vizMLegDs4LGTff7X5ANv29pivby+lE4duHCb3ha+6t6JL0Nb4Ni9
         cbAORuR5ElKbVPTvWQOv4hocFCPFTZC9DY7kz3jVz3tB5a0Zu56RYj+bSNu2ZIbz10Es
         UinoIHwfhc+e5zeBr/Ci+7MEeGbOjjEzNLk/NscxyyS4ZLcjY4Ca0zmI0zrjF/38UCLO
         VVaw==
X-Forwarded-Encrypted: i=1; AFNElJ8G0tdrdNJjVgoG4HMXw98aq2JbENko5eoMhSg5nu0luKFfqkLauffvNuV1+FfM7vScn528n9tFwg03NJM3@vger.kernel.org
X-Gm-Message-State: AOJu0YwVW+uYLbaFcAgu8o30P1kw/pPgU5b8G9R6s6J2tyhfv+caqgAp
	HAG9RJywoApGRSOFH3/j4Wp81J7clPLVgJEf9lAhRuJ5MQ8Zu3SkhZxcTS0GZHs9rjeHmZWmRUS
	n6bOyB+rxSY+QW8NM//zcT4UDa8mV+VvdyAsf1i/codB4vGqquFk2Zwj5jUHOGqYMUIX4
X-Gm-Gg: AeBDievXAPve9oMH4AHJWppEhnaVyE8uRG8S/1RuneqfteZejOFM8powIoGb8cVz7hw
	T697v7iM3gkA1vRtsZqWo/Ak34LZdXkdcyyNXOsjCGbQ1sVpt0eWRml5HRc2iKnNJTVVy15h5wu
	9Qa6o1B+7ou4jntJ4VYknjDQFkHTMythF7ctIFHbokmrOlH3oNBnSOodpIQwHHmDhCwqfF4Lx++
	JMCkgj6N4GoSg66X0fSGbds1jRTiNhL0XyzU9/HWrCwdgBPjNI1H1U0kdbQCQGiYKEBAiistU+f
	GQGUTKJLe9mkSi2QExnEBbdpWyiu2mkKKqTq5iYzbIOgNuV3tSx+Uek1s6hN+QloaU8qMgU7VcK
	hmu0b328vLbZgROalnbOEwc65+0OdHtE3lnqXfBZkrQgJY8KN7csK39GqRY2IztZl3Qdp6FAACC
	vDWHu5AgEn9EXbKkmX
X-Received: by 2002:a05:7300:d706:b0:2da:1a81:588 with SMTP id 5a478bee46e88-2e479c042bemr18972452eec.14.1777250148657;
        Sun, 26 Apr 2026 17:35:48 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2da:1a81:588 with SMTP id 5a478bee46e88-2e479c042bemr18972429eec.14.1777250148108;
        Sun, 26 Apr 2026 17:35:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:31 +0800
Message-ID: <20260427003531.229671-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gicCKraDizcITR2YwVx33gzgN5apI2YI
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eeaf65 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8lSouUAgmXO8ZBFbqGgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gicCKraDizcITR2YwVx33gzgN5apI2YI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfXxc1lnZqjXtD6
 3G0XVccsipNypJruS85zkwcRwWb5JuX6aISTCBewNgs8BoSO/w3VYiEIRQxpmELLc0TNKS/knT6
 hELQWginiGwvs2oKph1cI8Nb2Ts6O6NitFQnBNW16tsnJoH0gf8bO2XRcHRWVkEk0NuWQAmWptR
 gFcr+1fXTiYzcfsquetNCu7G1+dHc+mnE0Rt5wfdINFSCwEGukpBviNozCGIjMqZxSIVWDtAhYb
 ErI9b05UxxirHtJndlc1MCcJ7KFck2ly35SJ+FEwefYAtb/C17/nUzM3EM0aVKdJudKlXW7sGxP
 pSeDE5r8XFsjAvauThE40USv94AvAU+5Acd2k5eBYGCrfwU3XE53cqDG6hR7RwV82HuPWSuXxBa
 Uuk9pzYsgJYZROHOeKCNLKo5dVrGGjs5mWEc5Q/sJLr2CIPjt+9v0K82VrGg2q8IxZaRzmGOHWx
 jkZA0FQSo+N4OQ6Oi5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004
X-Rspamd-Queue-Id: 9495846BB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104568-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3a35f0f6898a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -526,6 +526,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(IPQ5200) },
-- 
2.43.0


