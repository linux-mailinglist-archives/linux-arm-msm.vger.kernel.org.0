Return-Path: <linux-arm-msm+bounces-108147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPshIBfcCmpV8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A2569BBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116F53062941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FC13E6DD4;
	Mon, 18 May 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgxHecbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdmwoB+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F603E5A33
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096248; cv=none; b=MSYi6fZFi5dMyeU5QglIuJSS18fA7irjEMu8Q6eLOa/kJuvJGB/BqqMJ0oXQ0JKejG5DoVSduKtfZfz1PQnp6/W68K5mokzWhzLWP8RLuuzIaJN7BN+2t6OxIDanUw5/oHWbthzulMiZy974xPaxBEALuEbaahpzJffZ1efcQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096248; c=relaxed/simple;
	bh=yQnj7TVBLDmn2Qy5AALoRYVF8NDQjV3Fde9VEu7Oq1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjqEzvCMG1hCE+m/QZlNsPAKEwak+1bokk0LinAlUsgsXGigTJk3PJSmdUfMpLgTz6oUVT+qBk+ECZ2ICXr3jy200sf4Zn8HSMnryydNAACxG98tIsfSxKJ6g2wRskQzC3+btdjOnDl7WeMwxeMfyET7nVe9OrRUB4cN/rAk/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgxHecbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EdmwoB+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e8lX2892872
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LE2VOebIUqd
	tVT8e2EHlDsCGbbYuRW4p5TNYl9S0wKY=; b=kgxHecbtnCluImfLYNf3hMtcMj6
	PRwuIwFQdp/Cg2skHd8ggwRrve79d0Ep1htRbJ4SXeJZeVP6IftMYlgegY9OFA6f
	8giW5bw1SComsQbgW4MlbBHJhaHSrA6I5luu1R+QTyFIdGFKIFHzx5lBGJ9aWUbq
	oMfWPBldDZWFZOjIedLIkzs8TEJB9enb2/U/kYIWg+IqrORScAScIOGIU/RyB3t8
	6202SSo+iB4bv6/bWRH8I0BPzxWvUQFicYdRV+NF+7zxRkoGy3YDMpojzEL1Y4t0
	KmsrmCGpwmhfW00mP4PjgJcMPBgnV9L+ALtOTnUoqL9W/d46KX9s4n0roOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18efy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so56680641cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096239; x=1779701039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE2VOebIUqdtVT8e2EHlDsCGbbYuRW4p5TNYl9S0wKY=;
        b=EdmwoB+cctq53xwjMUqGmuKs3hDM3UP54otxODf8+mzDlrM501zdvvKu5Mt3uO20iX
         pNOlcWH/8MxanZvg5e+cXKSpa63rTWD9N+ixXFHk2+gOmx0Nfj2Q1twyrpsjXK0prkMO
         HVs0gwUMXgOR4K3jzQ6WxAbzIxlwv/qwJy6tK2u7eUBjwGI/hz8fMIZ5M0lf6lR4I/YV
         ZdVQ6adBGQpHN9dbrOa8DuzF/oEdUjkykZodidothNpRlbWgNPKJQOMyZ/lOYvvjWpKW
         2iJcOJofnUalnbK1Hoxks9Iln1lJ01uyJfd4imkWVvlRqWTQxH1KEZ4hyrRlkhzb22kh
         cF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096239; x=1779701039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LE2VOebIUqdtVT8e2EHlDsCGbbYuRW4p5TNYl9S0wKY=;
        b=ra2LFX5Q2fDB7nNQHrRNsCsJdWOYbsPHmh2fLI1M0mMImqKbnR5vKQXGUx5ImvXIzp
         COSxX0m8/qjOYfSxFc49YX6+k9YZL3zUPZ8Bl5CM6f/0XLlB+CBVHI+zHTqDg9LjYm52
         L8Yb7IhcRDclvty5d1DkHubR8wQle2RHFcxJVuF2JeLityZHL4E8HKtrvAsIex6kTlYz
         /AQU+jmisQbfY8YYXcJdUpZcPHIzAxQapGueoOpAKQ9so/aIs62oACu8AMEqggYM6tVE
         ABR3sKJaScVb86HFNlgICkWpIu0FeoyD7jVr0fntE5jmkMdBsaCKmFbfzlEHCaDvIDRx
         jRSw==
X-Forwarded-Encrypted: i=1; AFNElJ/H/oMDubivjseFLs6+piyfLxCl186frfxx78UdjjWk0+RWyd0RNKQ9wKI7Awb/V/kYv5y7ZbciSbENl6qk@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlEsnI99vQbqJjKK+BDh5ZBGaalEE6walCMO4fBA11+cI/s/h
	xPYKtJh6v44nJ+32vBRHP3VN3DbAJVp7o8phVbqKku6XBGJSALPeV+IsnwjUdMOeQ030S8vhkG1
	89NEPLlifquBi8OT+YI4P9ZgpRu7oQgQm5ISoRs2hJA/ChNMcjR9TQ9ZzeTfuML7XkOb+
X-Gm-Gg: Acq92OF6KsfRbSUf4r3U9/oUtZT2H2o9WGQAy8xpWJr/jnJy/O8iacP1q2HvcIxX2li
	/G78vxMA9F4T+FipON/bPOY0WFXywX7VS8xrettKUGpgKKbsOkafJIHq7pOBR3zCQ3qMhujnB3T
	zn6uNVQM3r2ezNiGaTSlHNkcb1vhVXrgoR+fxe49EknNCAhMBuAUQ9KUbOhZrazZvdeYwAkF01l
	AdrrH8VYbSgARktmMo6r74vOMh/BZxwbh6PJGpyubgw6Wab/toMY+4A/7wsvBX8c6CNYIFvTmo+
	NZNrPgd4BgD/HbebV4L9pUK/zOxPh+xjde72un+/ZGLpO7AEBCd64wdTUUt96CE4xljC79mhpqz
	lOEYM0KJ/dqN7IAQsk6C7Gtz87WJqe7G/JkevESa2ZuLCYJbfo02QnFQ=
X-Received: by 2002:a05:622a:a911:b0:50d:a644:699d with SMTP id d75a77b69052e-5165a219a81mr162055771cf.46.1779096238626;
        Mon, 18 May 2026 02:23:58 -0700 (PDT)
X-Received: by 2002:a05:622a:a911:b0:50d:a644:699d with SMTP id d75a77b69052e-5165a219a81mr162055511cf.46.1779096238246;
        Mon, 18 May 2026 02:23:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/5] ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()
Date: Mon, 18 May 2026 09:23:47 +0000
Message-ID: <20260518092347.3446946-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xDD6BW3Ty_trUWMc-emvNbbAYPgGr0LU
X-Proofpoint-ORIG-GUID: xDD6BW3Ty_trUWMc-emvNbbAYPgGr0LU
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0adaaf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ka70VOZtGcZw4ZCj8HQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfXz6eVkf9QH0zp
 R1Up7wnfjMq6/bMSMCctiZT85yr3IGvHkhjQj8XDedGfZ5Mgg9pC4Nk/dDxfaL/aOqXKRJCPwuA
 FS7MYrc1jQKFsS7Fx9DYg9/lZCD95eAlguMSaAOnLTOOS6X9RfyO4NJfYtLEvqsj0mAxc0TVG9C
 DE8GvGoih/vU7OlFm7ktSYQz1/EgZxBzdYAiEBKa4cIF3N5v+jcy/wcu6cHW0r7fHDBZfEozcxz
 j3mmE40Cq50PWWd7UctZs3jjd/TBtoYf9ReWc1V7pgh6GiDo4aZCxEH7FeUG9ho337w5U4X2lpS
 OFpsKMB01Zvuc8q/l8wDsrZAgDF98NN8W2j2n+Qe2q9gQSlpfNkmeqcnOJjDi5B+zf4vVeaKwmN
 gP6X5MraHaVewR7iurPC1Ye2JUEIPE9GeCdBcSOuayupsI5XVKgU2RSpkHzynGofWVdrnfzkCSs
 Raix61Os/IUnOrjDuOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090
X-Rspamd-Queue-Id: D63A2569BBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108147-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use kzalloc_obj(*prtd) instead of explicitly naming the structure type.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5774c2611197..4f09fdd40905 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -383,7 +383,7 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	prtd = kzalloc_obj(struct q6asm_dai_rtd);
+	prtd = kzalloc_obj(*prtd);
 	if (prtd == NULL)
 		return -ENOMEM;
 
-- 
2.47.3


