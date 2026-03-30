Return-Path: <linux-arm-msm+bounces-100694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N5iGYgzymk66QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:25:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15B357172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9E1A303E754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048E63B3BEA;
	Mon, 30 Mar 2026 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgpXg1/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3HymKQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662E3B2FD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858913; cv=none; b=sKtYy5Rc52Ng5I4iaEKPGWoI33cFyI3e1gPufW6uSYqiGtY5VeydIGvLrJQX86G6NMMU3u2+bLpwF8MCYmzlZjQDlCcZDCgpqmyJtu1F+TrxZnqoTVJ/TLVVI4uprE34EQbvT3742wF0Vqa3QZaLsOYbtP6RooyhyRbmdiPPSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858913; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIeTTZGOK54iKZt42Q/J/4wjcj29tLljfJh5XhRgAornZHkLx2wXlMOvL/TPdpLh+PXhorGz7oz9Y0H/MXw5ZiA3QLYHbQF9K3q3GmTYyd0yxQPHxVH1RnYKg6bqd2uq/FebOHiCZ9bmneT1Yb0bnTBIEf38GX5FkpF9F9SsgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgpXg1/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3HymKQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4BFTp581063
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=NgpXg1/IkQtlUVvVJV2usXrnLZg
	vAnlUIbsLPW0T+za0MzY4z50hv7bvd2pQm+kgena4BJJp/LLKda7hrOnO9w2vTlD
	ajG37vOR8nrDuvOoIM8D4W3Dm5Xnpal2j9RJPXwojFoP/rZ/kRkP7c7df+bjuwZ6
	tBEmdg3W6sxSMIG00W+FT6SIaDUysNiLUZLLRANA2VEVaVV6FCeCm32P9JPyAVFv
	eEd2Y7iePrAJjnE77YoJvc/hZk6z+WFr3nt3fL/h0uSz27TibcF6DIIPKkAmKDUM
	5WejlukzlZJ+CQN6d3LNnPGPIeGmZ5+RmKmzzy3AwYlZ5IhpLBcOzaXTb+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnb6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso135539131cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858910; x=1775463710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=M3HymKQhLgIjrfXK63ttmbk2TerakC+HhPnW+ExehTVDFKSrxRkz/qqqCvRB6YTDnq
         4zkklLOCvDfta1mGiskae+oF7/sqY2wbilin3N6QYMXcIGLdQ0tR1KXtjyniXIG+MJ8p
         zjg5OFXju/Sn+ndWfuqza2O8dW7xWGPlLCCtt7mKNs9fUiorHPUV+6nKQOJgKCEgp1E6
         BzC4s1HU5sY02R8mEcp8Ec7FySZ5CN6koLRO5tDJmx+Dilr9pOjCsH99PlmIiN3gnSgd
         5Fj9b+pO2xh5PDLPbxTP0Ayg8+UT3dTwZy0Aj81QPAjF11dK8PNyc3XXdH+ucpou7RZc
         LEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858910; x=1775463710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=kD4K7lyRMDcI2uGeTOHIdKRGQjyp+eTH7R5ybCd8aldpI1Q8FJYPOLPQXLelpS0lXS
         IT8VRnWwHY1CuxhfKeGqHCVVJCrGFkvkjs+V+1E+C5olPuCfHCuPiDoi22psc5uBAFP8
         SE3z+iyNNLV2TgWyUTsBVJkg7gSXm/yqHiQfAVbfXNq6xYll+evFYDdBoyUz4JwtZ1XS
         bA9GlA1/K7io79gvcd1ftr5gWO58VDhuDcNzyfiWhsJt8by7GE4XIgC8IhWodppinbqS
         EqXQ1C3///+lLy3LxDpG+lpcJktmyUi72zQFIty4zl9pNf/Z2c1B+IAoK1py8JapXWJX
         y+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUtfMzF1RHUQkwSzN09/vuyePah87YMci5sbQ/ssYFegXGFZBqPBsap5ob/L9rEOmVAyULwVm6o6uyXSnCx@vger.kernel.org
X-Gm-Message-State: AOJu0YyppFj7emyDG+kQp32tq8vv9CSP096QUSKgD52d56W49ZSBaqBA
	fbVYIQF1938j/xVIze99JcMBJBsYsEY4gaJejzpB1fwBzjGzC6KLsA/M0+eA5+7LKCQTXqD0GKo
	d7rZbQ1dL7bid419U6CCSqky0y2+dU4J+/UPtxGguqJVJJanFcgPKHG/et73sFEeskGIy
X-Gm-Gg: ATEYQzwx1A+k5V90wGtBHQHTmJeLY/3YzqfnpLSkR08nHvrwtVoRElYkouavi8hiomO
	qZWYFDMBlEtHI6TdjYgZMStZCuHK7sadxZLAc8uBqpKpypcov40Mr4tckuvwpYSAmYyM92a0WBZ
	how66AbmwavQ9fCAU5rULyuck1C5Nxo881u0/or8mIu+D7i0W0gjEZTf1C4A4WX5U9ZiAjMe3Na
	nzeEZFa3cf4Laf2Euk7VDRBHXb5uGpGmBlO9FFC2G+gv/13G1uscK239KX38qZHc331FkEWoarB
	ygaTPZTh/+B6ZmDlRtZ76Y1sGyOSTf/EB64m9HF/Ip4329XBDfQ768bJmgJwi+F2xmduCU0p04L
	DrwFfl6b1TyxwrjmZu/jD95rXYeLKbiIaW1vEFRI7/hOziqbhI/aw9vg=
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748801cf.56.1774858910498;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:50b:4eb9:a988 with SMTP id d75a77b69052e-50ba397fe8dmr161748671cf.56.1774858910050;
        Mon, 30 Mar 2026 01:21:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v8 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 30 Mar 2026 08:21:02 +0000
Message-ID: <20260330082105.278055-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: quAF3bxShFsEZ3X5UU5bWgIpC2FJNB2Y
X-Proofpoint-GUID: quAF3bxShFsEZ3X5UU5bWgIpC2FJNB2Y
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca329f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX+S/InjJCOXoT
 RUHnePHFtemLFphmM3GhWPQycR7naTaq2BJ2N7BUv9pRhCXcnGSYCv34jlh2V4zUlKDJOjBEWPa
 MTYJ84e04E8R31imPJczMt1Sr5BaBdJZj9najZay80Dle0kCuFku4Qd5LA06n3XIRklG4+zmJsK
 NrrVPAfTb61T4l7CcELrBGchQj78z4KGzKJXgLA6b8MV3w70XvtgWKxSkqZd80KRR9hoYT7oLWg
 zsOv9LpMkspmjR2DJaqK+Y6z2KN1rpUDXMp2/oscFFt6RpR4ZQGnLiBT86rAGnoZrdo5dwrUn5c
 9Og1HjNWgpP6yLXlHzEN8EwANUXD3mBmMg1/0GJLJDenNMFtGbsl7nj8zfr/TOnLSzgHf5ZR7dT
 z7/B0Mmk26bp7ckbwixA43T72YAPd3+zUScnSdsVoCJ+YPSOfIk4oNjGVxfKvQPBDglu1Vhwy4v
 9QzOLNkYbxBNLoSyulQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100694-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB15B357172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3


