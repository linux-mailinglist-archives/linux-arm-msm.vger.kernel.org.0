Return-Path: <linux-arm-msm+bounces-91952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHINNr/QhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:17:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E956F5CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5338307BB8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A62D43D4E2;
	Thu,  5 Feb 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WstSw2k3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCYDeT0w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687843CEFE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311662; cv=none; b=nmzbX0+8gzbPpTRtCCyezRkoUSv+oh2EaI28eUnyRs2zHBBcgEcgNxkPQ2ikq24E+LnyonLEkxn5cXwA7pfhGVbiWnd9iOPvk7DRVFdFcqfgo6N7SuczvbQ04UOJJTn3C/xdW5F99hHaGopVMuOyyu7CqZlObAxpOx3GjruQSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311662; c=relaxed/simple;
	bh=sSGa26gpWdI3zubzr4vR8voY2ZZ9uOTTFQpEZo9CUFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAGxCDU6aAPuUifhiILJT59EhNRcwCX186rVh19duejJdv8nSBnMUbFB/3VwoS7itnAEILE2uJpPwJVZ+kUBw+cXbepUZOAN4TbcC9J0E9wGjOQvTpB+qIsuLrVCO1cMcteRo4kVXm8MW1iuEh5ZZJSnLoM8Eoh0ZRkq6xFA920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WstSw2k3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCYDeT0w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Frb2k872365
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WhVePPPT+SN
	r/7D2LWKoUshhH2y0lkEE57VXfglAsco=; b=WstSw2k3qVqbsDmyfc3XQMJE30O
	eKRUT6op5W/aIvPFhuFYlWL2PIvq3tNcpdA4JiEpt7+luT+fkgn+8oR3bEwh7xDN
	CSdUXJNZW4uXIWDIafcbYxmDnq522IrYw0347s1G7abEReZJJoXuRfWcmBNLtmU7
	nn4kjyRnG9EVAUOFP3fNpB2I1cYfw6050R8xHkCltUh4056EiU6nrugwakHUgX+b
	YAZRP0mmcc+FEM+fizga5fVdgjq9lPbhNdDrDxtKiyZf0v9LItsxNL1UNAaq2OI9
	SRkSPNm/yv0PD/Hk7zdXGV6Df7lr3reKhh7v6AlHsQ1iN2r6djlY9+19Aqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bg92v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so346312785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311661; x=1770916461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=RCYDeT0wrbtsulB0fS/dNVMkcxSqmB40SsNIJf2t/Mo5p78gQqCznS93e15ty12um/
         8Pg8TXxoy/kHCPAFt1uXnrth1iEi6gts/U15n9jasqkayEnNigKQVS0Edc0BmgdfU6tv
         Gk3QGNx9JsEc25kgh0ULiGy8eUJ05aX4bEYgwt//L2vTS8t+S48te1RFYzxNCox4ujAn
         g2R8765Zaibzqo0mFrkD5kXKWD8I5u8xgVaJR8AvJUVM4HF6sOk83xTkrby9ZdOcL29I
         KYgQVDETtOv/pD72F1ggC7XTt+7baZZ5Xcxk2Zkd99z3yBvHQ3Liwvfa9PsGN4WUGWlf
         JvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311661; x=1770916461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WhVePPPT+SNr/7D2LWKoUshhH2y0lkEE57VXfglAsco=;
        b=k6Qij1SSmaUQ6hS4tEwacO3R92sts6KpmQ/SokWNc1l+kSUlEfGc7NNT7Sjjr4rvqj
         Azq0FuE8iHbPBuHewWQ3UEyj0LBnzSC30TZKMzrwkpyHlKkj5YIUwm06kJ1BjrlUn+6y
         3iXgOJ4YjpuCHF0u8ihomCzJ38wzyApGeB6NtWWqsplPxUZhuWn4uXHtvAXcvc4Eh3JL
         TRLgpgEP5gi1zJwo9lBsx/JQhCqSOVLjlcZl2hRJsWC+q298NHizv0pVJPaWUkaKdfra
         2U3HB2JO8nC5TJCpTtzffnXf2YMkD1J+/Qfk1OkjCpYEgsgH0NT/gqclkzTCLx0SBEkU
         AHtA==
X-Forwarded-Encrypted: i=1; AJvYcCX7/+T12gZSuE+JYH6GrKzbA5BwWZ2hgGGNXVe/y8IIgvUiP1M92fb4UfELKP7TCeV2ujnSlzryfkKQvKwi@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRVNWxYXTb2bln4jKx8Krb33NgQqk4Eu2vptEqQruv4VS7mb6
	FFgwb7CcLypdzfq7k5KQuJbtJql2OUa8E9yx4q4PC+7lnd+H+b7Ea2AzDZVHKTjXh1aI+5qL66S
	EHzZimMhdZSKNKsHf43ymdFjqoqAwxvE2tkSfF7w4y+o2oIyz11TUQp9C2K0f/VVAwxGT
X-Gm-Gg: AZuq6aKp4qz7fyJsmQ0CY3P73yJ+tJAaurC8ERfNtXJROLEsOaFpKu2/9ngXG8dTsQ7
	pS9/fWQnxc/LlsbTe8suLJJk6+SMOYpiymOjC/FZoaRDPG97zgW4dlH8K6N2M195Ry4ACbv91y1
	rLSsO+mBoMKDVag0Lq3h5u4/ze/8SNi+1ziTwTcC32s32LcKpv/9Hgza043eiLGUo59HIltZfZ+
	sSll8bwFkwoTQ8cwgbNpPMDhgTrnDyXd5lIuYScHNChcS/fyd9D01nH8fbPMA/CoJ/DwP5vNTPq
	KRa8RGttwpWpxNQ5wzGwCfLpBmBorIa0+JrXAu894rS4DsALlk9pR3UnlzuYKjaoahXsdrA9m2S
	CuhwNCBWYUKcC9bAvPvNbBTVk49EWvZGWjqZOkxFVkE0=
X-Received: by 2002:a05:620a:691a:b0:8ca:450f:c389 with SMTP id af79cd13be357-8ca450fc3bamr291868385a.62.1770311660830;
        Thu, 05 Feb 2026 09:14:20 -0800 (PST)
X-Received: by 2002:a05:620a:691a:b0:8ca:450f:c389 with SMTP id af79cd13be357-8ca450fc3bamr291865085a.62.1770311660385;
        Thu, 05 Feb 2026 09:14:20 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 04/10] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Thu,  5 Feb 2026 12:14:05 -0500
Message-ID: <20260205171411.34908-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6984cfed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QkacBUY9L2qTTJrEq-kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VpCFBJYDJr0oE3vMp96q4R2aGeDDrMSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXwiWC3/mUjbis
 bgQCZkhAQbO8h303aWoogEv7MHrNwc25j3Zg2FOlK+2pMQW/6Ua44tUlS7yoYdP7K/Ug5Vc5Kny
 TyMb6zm/YEgjBMupIpT/4NnkEhA7AE3iPXUUst2lTZLdYPvj3w1VYnRR/R5C8guuUZGcqK63kLa
 xc3cVYaT7KNjlqgJa3sD5AE5705tqj91eA+KVEYVO0ue0GYhbOLWgEzLJOwVqbF+zx/yepnlY7/
 imAHilXotJ/PlHVgXREoM7kT2aBFMmOQQEtYWfotWXlVf7EAN1DnE4RXAdQH15cp4mCooU2v/xN
 ta2ESIRfSes8Etj0K5PH7cviexljbtdkPlU5io5qZMOob/UWS8/4kvuKrL1q9Ax59KXj8Kr42nZ
 dvfdVtR1r0DMV3db5oKnr8A+KqFpY8zZfPyMmTXxuTmICenF3Q2Jz/9bji5wDXprnrOnAroKo2l
 SH1+auIRIWC8CseJQ9Q==
X-Proofpoint-GUID: VpCFBJYDJr0oE3vMp96q4R2aGeDDrMSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91952-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E956F5CB4
X-Rspamd-Action: no action

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index f68d4b4974f3..fc246485e326 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3


