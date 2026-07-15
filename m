Return-Path: <linux-arm-msm+bounces-119263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id neISLuaLV2q3WgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297675EB5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:32:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I+l62H1s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KvbEXMvg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119263-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119263-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F26553080821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5F8472789;
	Wed, 15 Jul 2026 13:29:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E3432BC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122184; cv=none; b=hpHUJc36aXvyuZHzfMkeGdNGpaRJzWTYE3zhOMiZy5BVLpcXYDKmXIbYbXEgfymyQC5hqAJmgEDmF6r5dSgQjtNwCI9Pqydz6/yAxM4ashJmd6FtI6zTqpc+G2x7MSjbKU201Gfg4hNVv3w5n9Iraq2lMIJhJ1nBYa77hiQGhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122184; c=relaxed/simple;
	bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSB6Dpq3pii9XwAI0cC8rF5Xa+nMzEbZxQ3et6P2/petngiT5nadzFmOA93cCeY1iYcq+tz5XHa2vcMS6xUg1XBQ69LnZUS0YTtD1S0iqG4yqJX8EduGKVetTM9neg+pxxbIBU38QB8S3v+1jtCZY9jMRa5SftDqO05R0riEHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+l62H1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvbEXMvg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd0lI3579167
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=; b=I+l62H1saf2T1WXK
	1YnkxMhEfOP692fV92c8PL+gTKRVWBRjd6DugoGny0vvSW9T23PNWC1MNmfaiZGC
	DB0+UqrTKIsGnsz/rF3wPfVtSKt4LFBOIyjHntuVY1JNJJIlWr16UK04EUAgiBll
	Gc5xjMheW+WaqiSRQNd+HiYKz2CSA142CSppmtAW1R0wrKeHVbDOn4ekeoxR5vJ4
	2ogx5cclnCzdq/xO5VS8BNAIbE2knIGkxUaFM0OMfWk836J6wGgtubFG4HjeXP1v
	LeKPgPYjuv6iIE/VRTTuZHhioT06u5ZByivVP/J1ZSBx/J8FXp+edw9zcW3jep/Z
	htg/4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk330yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso20675321cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122178; x=1784726978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=KvbEXMvg7/qkSDi3RTE9L5D4gG2kwvi6wpWF2CM79ciYw27H3r9vf+951oNDHf9Slu
         l8u/J0l3tamFv9vOh7g6YtKe3Cxr4IaGrdN10uWshyfAjjTw/n8UkUlL34/VuMy+0oze
         ESHpeO7FLv2xqxICdatRzUOuOpdWKUdXQ0TO+jw8zGg696WllMn2LhsupcLZaBJzY3HV
         rBwHpf2JrdRzRxgM2BX6VkVJ4+aSdFVtxGQ/JeQYwyMgPAFUR1GyR6Y7OwI5bhBLzVFb
         MoMiqIVw9YcXyhxQ2jD9X8yLru5GO8yqn8caVrPeGAYYscDphm1kgfxulO2zhelfbiVU
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122178; x=1784726978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=YdaKGpjYqOAqPxdgEPb0eI9o93nFp4Y3K25OZVJ4dgh3VetSWNxkW1kazVDyx+d80A
         /xt1UpJTp8cwqcBEBQ54OzfBOd+2JXuuWdGmfNDDEWnYA53O6gMt2a210p9MXXSikDjD
         bC3Ps1bf1r8Pmaoum7VdVgEI4/BjCudqztXxn/sKqrsuTiKSEVPVtxPtONhGPi/BizwK
         VOP+Z2Ip5tyjMugbI/BdVAJJUX4KHeI2HS2pbTOcl0cKn39M5SRsLdoJeAOaBNaB1TQN
         tqIBJuyzUF4EWbyCE3OWF6z9+ceXLtNyz8EX7j1a3WTN9f2YY5dx45kKzzgGZ4GUIbYt
         85jw==
X-Forwarded-Encrypted: i=1; AHgh+RpQw9ged4g8shja/rIHXqMcLPgVHz6zoe1w4OdbM6d/0XNE7d51rHU1qx7q3bnTi1sOJuACGufP2z62zKbI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wJAHl9Hhxl+ZuV1A1/LvgEnhGXs3W5H4mPFY1B4JwRuDhKT4
	ZFJQQq/OIrqvtME/tDJx24gNG/reK2vJHlmBLnPRw3JgDJ8NZsnTAv7Bqj0PzL5TXJ1gq3avBod
	mpckM7Lk6pYVbuArKaAjrUH3joLa8dC835cvpArH0Hvs2EeAlkqjHF0eNPsrhbScsukv0
X-Gm-Gg: AfdE7ckPvnGFCqNxeXeIBcDW8Q+pzlgM137MuO60B6ABlMJu3GkcIwMdU+hCGP07E6Y
	rL9kXfyIqoJ0R7mqUKcOoZPKstEEPuBpuUcCpJ9e9mLZpbaadvPzMxJ+gI+9jQn7/ZbIQ3Lrzu6
	hl7qimIwYKlBhHRB/89AsuPsncW9a5PJDjcWK81Hm6sP8uGKIsdWkzH23oxP2WsWRWuP5yEv40l
	m0dy3y1eX9lFP9Ya37+ECMdspOYqqtba6zWLUUM0lRufzY7bb3NR5fbdR/9fbP5J9BGmrUsgOBp
	Z6adBPMAvRVRWpKStPd3X3Yy9R3uoMZJDCC6TqpW0rQDFtDG01hlMCNZ/KpHuLr8YQyN7d7nMPk
	BmiCvIKqCxSV2c9Y=
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652771cf.24.1784122178053;
        Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652281cf.24.1784122177488;
        Wed, 15 Jul 2026 06:29:37 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:15 +0300
Subject: [PATCH v3 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s1nYYjdGkiC1id63RUG6tg4KE8irc3UGMIu
 zXIiVjLJSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNQAKCRAbX0TJAJUV
 VonUEACOCuu0EncUyGXeK64Yp/lejNpaw1V/nThxQSRLtH5ZggNao7RREJuEg8tBVSLWDSvxWXc
 UyBjjxfxGvFLgZt9t/b67Bxi8EdmVnSF/n2CB0b7NpHWCxlvItMSsI3sP5CjpmLhfCijKesf4kN
 IoYo7TfPeTFu+T2yoWjBy29ssdmok5ajRN3GLfKLDNm4uesFPDS4gD5Ah55bW5Kob5uxfQXkiOD
 r8wV8cwKSNM+pzfHgwWV5She/Gvfh8MQS2gmMrWx5oPkCVmdp7TRjoNI2Uw2Aq5dpksIpwrnti3
 WR8SjUOvRua09RV7txnMe6fimqPFncsy0E44JhBU3BmeUuBDcS2RutvU/TUfQbFn5dLsyKcpe0F
 7tXL3vbzXBzvz/BaGQU0OH8QhFPqSAiglSp/3Wr3uva2LYZeNfiN8uqVsE2M4FHe/nQzgRWMcJg
 GfFokVlNLearVUOrS+YJqnIhLdxEfWEv5I81ssZhIQJdvcGo7xNrZa1EyCEWd20BtGVOFBjm1HV
 NEELaiOJMwAi4bz8vT/QQJ0mRVxeDBe0CxUkM30kWQP96+7bC25hTWJIKmBrq09ozv1HgLMswHe
 B3Cz+O/EwkwKWwUX7wrVWalaOhlpXA/G7HCTF+ff/7w+8C49c/ykJg2kIIDKAgVEvyM3MN7UCdM
 oLhNkbQqgw9mn5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578b42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9hK3m3bcuVkS3A95VCGHh2gCnQk1dyXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX4+CR3L9wXaCT
 2V5MehYvF1b4WHBhOLv88tH7lqiFHeWKDXIZrWOgGzrlVqVe7hPNOSte+9EPHtrA+tjLzJ/LmGM
 7J+u55YXT2oH+5WTgHqYncTsDH+KGk2NN6oYrWrAVXVRN9OpSr9TIQS7UvLkQrJuRO8wLVy3I6u
 mE8rxSaBXEiHBL44yW4RrOcHXfQXzvA4f9HZTLmWd/SQ6JpupvlRu+FL9TH4n8AqlDRc+7kfEQT
 mLuEW/lz54nJ7ms7g6akAuhLHZxWCVuKXhwn2FFcSOpbpoCkia9DyY0hQ16aQm7kFLHKKz/KKV0
 0J6JhxPavLQP3qcGrbJFIoNlLDqMNeTgbhIF96AJNtlLQCjFQGKOINS9UoivzY57oeDzmBdumbT
 lPTUhHD1d3w74o5ezvQ3Am+Ud9nD1SMpmwds1Uw8SZbjTEKIWwbxT+T3I5kQ59XFhSQnZiy+4VE
 KX9qLHezP/d2rgwwEzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX+N3GsYPmzMMZ
 zezohWcwdYkXYZSqxLyFrN0GKnMKft82dWe27xXD0dH3ChTqdwjZdZ6wtI6qRmEf0uq75fcIbfh
 wKj0yJ1d5KTAoGuGB5OVD3DuuTYwsVE=
X-Proofpoint-GUID: 9hK3m3bcuVkS3A95VCGHh2gCnQk1dyXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119263-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:abelvesa@kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4297675EB5C
X-Rspamd-Action: no action

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 6925c6865089..2ee4820b6fdf 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8548,6 +8548,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.54.0


