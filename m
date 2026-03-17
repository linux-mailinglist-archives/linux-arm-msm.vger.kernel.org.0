Return-Path: <linux-arm-msm+bounces-98167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOpZIhNLuWnG/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:37:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 913912A9FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5ED7C3010918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46133C3C0E;
	Tue, 17 Mar 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmxbsWPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPCj/Zk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FE3C454F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751036; cv=none; b=OVgkmYnt6YK2PD7u5yNlLOpV0smG5v5rmfmeQsf6oPMik/C4OsKt1R6X3ut9MKQMwT5UlVED8HJk2XgEbiD4WV9TUc2VrS1z3ZFWoK7tgzUAtGvAHuWdrc/Cpy24cAHtQBi6kY7WPmvvPI1Ix7tHj4BhQqwTmgxITKW6A4+beIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751036; c=relaxed/simple;
	bh=ZGaNsAO6/SWilsi2TVuYP5VxbCn0rn/v0fIwUe7gK7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL4JkzfhMxwcFmrmHa9HH0Wo2mYC22/mBfV1XYE/OcnCzCUjKDHVAzHE1tSCobHB2z/uXSTgqqpepxIuegTPNabgiaZd2LHN/xBPHnXEQAei0BAho7EGIJ0N/lMb3jBGgkXQ1dVvG+qkkFr3l7UKajy/jdHHUkNaT2Z8zPDWYS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmxbsWPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPCj/Zk0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RWgL2906159
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=; b=bmxbsWPsiiKK1sv7
	MAIjjzQGA6Op4Ez+yNJNtT0yUpe54FD8rLVAcdlkp4yN3Nn37ghPw9Xl69vFIEed
	kplsOXxKGglYkMIohmP3GYibKd62/1XpfC2Ii/EZq/p927zTqmcdARCJQ4QBzf/j
	PZjUDaiCYDhsYkDi8F4gtMy5g5cbzCCx29uj6/pexDv+q1ehSmmI6R7r1iNTFVXI
	TYRhVJK2EKQt9WKG7X4mqBR38jwppv4MWBG4/e8+s16BkJY7de3Gv6I/aWJ7mk9X
	ZG9Wo3qc+xoGir/fCOMor5tUcZX2ECRu/g3XdOYU//7jAN4OCSGwASDHrbha6Vdh
	oK6AtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxh42d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:37:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd91c0262fso757184885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751032; x=1774355832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=bPCj/Zk04siuFAt/+BOd9azkP8Sns/R+dipOJUahtebDVaQaTlgRk+Jd2dyaf5fCLG
         xuXOU9IAE4/Us9555bdGpFx3Qbdvp3xcJb1pDIWlUPWlTzbxW2Akt40niIDkZI9+95o2
         bw+qikl1h7I0tZxS+vBZVeHQ8svV3JkR39qy+q6pZMMXgW4wweiBbLC5RiKfSoZsa9qS
         hv05RJNwFESQTPpKQfZwYcas3ziYJ5Z+IHffXGataO4T7LRr2FQ5GuGfSWud8I8QlgXV
         ZPBUhVHRzUUSOCTa1u9ZYoooX3ZoOSjjBide8YiXdpI95zkmYrtpw1w4m6v1p+kQecML
         jK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751032; x=1774355832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CY7V8gX74TZqrDxFU4lOxNwDl1sUPFKbOeuUpjzoYZc=;
        b=RaZngHH0OZFe80KmTM1yk2BQzK7Nba3eWo13G6Smk2xIFEv9zCVidmkXsPPdf4BGBF
         qpvVwKNrx73JiV9aJypHWY5CQTJLIR3CGm0IG13E5BiDFHU8owK4GXJ8u+nmT9o39AeZ
         FfqBHZfdqqs56ocp8s8uhf8VJU9dzP7KQfco/DZEnEVd0yhJE8P2IFYPNVDqZZQc0vgJ
         OVp74mZCXDueYt0amdXVrZHOmBjIN7CMP0Rd9zOUyRzVbANUS7Obu6UObJdTAyLBL7C6
         QAXf+nBcNNQOsekFN5mw8K57N4nxLSEov8Fev2O9dulEsVKAbenzEkjVOnVZUgxecXMC
         Nbdg==
X-Forwarded-Encrypted: i=1; AJvYcCVKcAuN6cuxnKzrSDKfMOeVAolVnFdtWJHxip69Hxt3u28e/HLQjZKXuusJksv7kUfGo26M2ueioj8A/bB+@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLnt9UT5wjwAulHbBmc4JpWruO8/AcKHi3UH+UKVEKj3x/Php
	IG1B+LN3AafVs+sPRqAs7sY7Ubd6IkdqBHAoew0OeN+wwKK6WlSTYBeJ7+UplMm6sCJ0rtGQmhs
	ttfcuyYoiRTS9i7V5slxlXHOm3dSwUSQkw5aSk3fyCiFJyZscapDfrySMVa5oVFwT4jsM
X-Gm-Gg: ATEYQzw8DsoBqDOeX5sj46vN3IsO3KgE3GmA/hvY90y1OQEjOrgjgdxK6MR7HsSHPj1
	Z5yAeu7khpReBs66u5m32MO55QBoswU+Yyepsp9bTjtbjUmW/0WPvaUGjGqZ+Oqc+aO1uqagukF
	uX5K5+dVAxNDEtRXOUNFjR1P+MAhLvaSILx/H8b97DTl1eWvkidoZJB2DfF7bVe8vhVEqHdwmZt
	XYLBRddj/fJMwpI42XdB5mzVXaGSk6wD4e8Duo9cmxoKU2Zquf6pGkQx6/LRp6ynlKIJxcg688p
	J5Z3119wfP8cU7g6kDcabKRI1Xd0yZ8RO3odddcJ4CABgBEUyTBjhTxoBKxFSNYcVqQtd7Fzd6G
	NW88d2mA1AwX7O2VlY1laEAIdQXNUepT/uFrR+k+uI3YS
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171252985a.47.1773751031482;
        Tue, 17 Mar 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:8c6:a034:9224 with SMTP id af79cd13be357-8cdb5b1b110mr2171248885a.47.1773751030947;
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:53 +0100
Subject: [PATCH v3 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-4-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZGaNsAO6/SWilsi2TVuYP5VxbCn0rn/v0fIwUe7gK7E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrpKjAofV9NFYyslhVtg3eHvNPA6ap61m6fl
 5lWEvWjp2SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6QAKCRDBN2bmhouD
 1/kED/4imG8+I9OWKdgGF1mHR2e5RwwQa3uvCrPu6Qx4PoY20Ahr55T0gbApJbEYUeAG8PigeMj
 LtznsMoQ1QW4zL6ULOlc6nO31/NJq5HpGcmjWGYgvPqN6vB/FEhUgeYv2JF1lkvbncWLnEvzMgM
 2KDPbRUZbY9v9sO9dg8QFhRQnUtWPvB9aQY7h365y8nYk96vj2HGnwoN0IfxbDwjNgs0z5ceP2q
 mHVNVCgEw48tYM+WzM/NNhVLvCPFfSnvFicB1mcrpHNgpfsqz+TEcmGU0jtMDMKbiiYuT6J9ZcF
 /anoRDwwKdrw67UWj6RZXlpSr3COQ0sqe4d3ey/w6Q2hKLZ6uH91YLbJZ3Ql1zhV/X3t/rjmUu6
 519R0/5bkegtNGqCtcIFW9SAVKyInWRUl71QP0P7stUU8Y2ljB0Z3zm1x42M0OV2veiAvbjk5Kn
 1GpCKfjhNHwqFTeG9u1v36c9SazZvbs8+lIjsvynNvEzN2EFMFCfx6Es4PwZIiDg7+Z1Ux6wHj8
 lC9/QzoCGVxz1PqmoRJWbg81XO+4WCA7xAFOn5a2pShtQFZhVd2aphq+HE8ohLSn7rIzzx6BTSh
 7YTjJerhe5V2lyQVY0ZQXQXkurlQqlhm/Mnlgf6GGlSFKSvGogqyvCNoTIBtru20aq2EuLgTyPX
 PRkYwDHw2n6+kwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: unZBLeKqDc-Mr_ThqWOM2X48AozTqIgD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX11M/SdKXrJER
 4aMwbAz7v4EhgJPK7rCz8BEQsYF8/RA42oN3QuVvJgybsWMuQFrsfBSucd58+MRIFdJUraix57o
 5hlKLowYjDpMnAleA0lWXmRqHWqQI0DJJ3cKD9Rgm/aeZK2N9wgH1j2fNu3tn3ezjnXERbjyNMr
 S9VP1EtjiZctbSk7MWYd3rksFGiaumWsadb1rNXy2U+JaXl70A/KUGhOz+TYZjc+EdmKosKVHAw
 4tddHzCRO5ib2TpjmtWEK+/ePRvzEg3xwC+ht66fCtdGt+a3s/Zj2GqmJHCoEQzJB8vFKSk4gqs
 cernj0oxcbDQSxA/FVW/Dut5iowvl4lM9clFlacWZoZkTGsuE6RI+ySq6QFquf20hbxkKynN+BP
 sPmWHK467q1Rc/EkLVWo2bGJez83vEBxCoVz9/wtsMocjzdENGkycTcBcypd5BlcfpQGaIiNX7k
 95OnuJba8HE/75NwnzA==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b94af8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: unZBLeKqDc-Mr_ThqWOM2X48AozTqIgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98167-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 913912A9FD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 78e72379a6e0..ea7f83916d8d 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 6e1b1202e818..58fa1df96347 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.51.0


