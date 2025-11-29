Return-Path: <linux-arm-msm+bounces-83867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC2C93F08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F4C034815D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1263F30F955;
	Sat, 29 Nov 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA/mqe2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPOHVjn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF23112B2
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424991; cv=none; b=MwsVyVocaESrrRJrI5I1OcY1SYLgXVXe4AEwyzJJOKGV7n+mvlE8YwJa0qc4mTTHfBZnQQlDptpNNLpyA1FqsZnT57ZF4zwW3X845FvS1oc4dN8dVF4s5XG4rHaCixP+L7gsVsZV79iYZREGPX3hKbIoxYfmtjK47huov9f80y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424991; c=relaxed/simple;
	bh=Uh8OJJhQouGil3zYUiOAr2BWbxzrgTvVuHg1TGtywUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af6TkmpGrlYN2QxdTMxEmF3lgdPSU7Rxiq7sBzSZzTDs0VnFkxph0Xj24uOzuSq/f4LuU4JNN2Tw82kR8hGXOJNJWUfvVhDc4jvoTJi7yP6mWb4KLOyfPt06yp8wOhSJ+lt77rQpjROkq3XPEwMWo8q2aHILeUPoLw3EDlmu/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA/mqe2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPOHVjn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3kDTg2118671
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=; b=aA/mqe2s86RZlF+T
	qCeK2XJawk6QnKdVDABsoZkdDtlcyeVHcRQPtULbuaffjULhLi6yLmNOvSZUvUk1
	3gmmEuuB7q+dzSM06a8C0ei/vxLFSqZ0Mwg2bxrt+GL5zyU41cbNw1aAyXE5erpd
	edsEke02wqyjR/uQ/2o2fVfq0jRmWQVkNvZmo9VrEubVVdzqDR9icM+maX9wSpvj
	tYNzPgC+tuoKBUGEZJ6hXaQ5pc7/Vz9hnThNz0dDbmwku/Wf2gXraeN+aiVWrUc+
	4+3lzgBLJ9Y7SLFjj50yU476OrORO1x5PNs+Hka/EC3NFaXxir5ou9XBzG7JMrxM
	UDusaA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs78rr69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:03:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-559597352f9so1343533e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424986; x=1765029786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=;
        b=LPOHVjn2GiEb5HUW+jNqxBN0cGlFXRASTD0/28L3PIz5WxllPnibptKswi07Q00H8X
         LyLZNVzHlpbpiwwh/lUObotY97MytyFcWjLoC2T8Sbjalch8pu1aRd9VCPatYxUFgfO1
         lMX+DBt0Fi8N87Lhg1AJPOl5SLE7P4N248LsfzSWHFvEIe16XYmusqp0CCCHPi6CD8SS
         35roGcOXX/bWIqzjNk+j6NE/B3XQZhwcSvMMdsOL9pkImQibs/tSPvf4QmfJtB+RRgKb
         Aw71vyvQdBTHYRAdmChnPmjN5INF57FSTrpRX7lmiyvOeS6DtevgeiLZRUyuStnNe/vT
         GH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424986; x=1765029786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBn9TsgNDmvjax4JXmC6W7uKKCA5IQjJq9VNdLP6D1g=;
        b=XSPifCj+SOWN+ac1KkvKY9bO0O/BcjNdRvbwTEILoeBn5xH1iuSXIb10ckzeu/YQPO
         iTmyvmTaGnx3KA8zPnQyUv1DnBFo2I4x/7o68SnHgI7H+E2HuPYPs9RLSroHja5o6zaL
         ZjDu3U/fcsXUJKHeaxx840HR5DGRmWQGUhe1LI8YR/l6HM2OCICJNXabzWj0wEtodztd
         dpBsBQVeYcbk+f6kpImofiIr0zNwO6jYe/P/nYcYJ491xxpXjVs+Uc2O3RWDKllkNTpm
         Qtu5mskBn6rbswawN5Oz9adE1LhHKuqtJoEangC3xFXj/RFBT6ukAB5KA6An0XqS9t3M
         KZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCXsBik+IEYZiruojcmau12GDbq4hRd9zYSdMryPIcrbgEBjo2vFrq7NylpjUSQg+P9uwRASECqBIxr/Mr+W@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLReKQCiPDG4T22BUEoLxpANwBsWd5dAuwkoRdFLsWnxy+kms
	xYnPleHw3BSuIbCaggcdiLVce4lXRv5wLjMFblC+AixoUURvSrYSFH+PyM/q91v5AWC0QtOcV2d
	gMVfo/jrVYYpPW57UI2kjEfMPulvlp5+rVuGuaEKHL+LRif/3mx22rPbBZpK2Ru6VwtI0JmgmTg
	iM
X-Gm-Gg: ASbGnctGtGJlgs3t7Ty6wT0hGYHn/yq60C1c4QBdWZ2eVO/H1dmWeX88uJ3+jXRaY42
	spURj9QzCtBLuPb3rrnrP0wRFo+WcAi5NNv/UIR5XlPFNBi897vGKnHCL2ZUyfrJVjGAte5/C2P
	ZeM9yTpPRmb9DHEr2Bgc/OBhAG026wD1bSrVo3NAyP+kFMB+ogiu1UOil23wuH2+pDNJjsIGU/4
	4ksngWWtza1IlAP2Y6kZXmhEWPNLoLzIGn4f7xdG/015nBgrYyzXJ4xBNKjMliB3IqN8IZ54CCy
	AzAKdDuw2qDIvHuz/GptITRDYsSzah/fp0aUgNzbdJJvimt+p5LK0UTUOtN4m/vcavDil/k2xYJ
	qigGwsaGCIbaxol80tO8GIN9cY9lFWwHt+A==
X-Received: by 2002:a05:6122:2224:b0:54a:9927:7ab7 with SMTP id 71dfb90a1353d-55b8eefed87mr11187373e0c.4.1764424981804;
        Sat, 29 Nov 2025 06:03:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpkmdrXXPWF0WiAWH3OAz3608v38FLnkyad5YOk5ObUmJUfouiwgMuePXmWs1TEMHBF5mXXw==
X-Received: by 2002:a05:6122:2224:b0:54a:9927:7ab7 with SMTP id 71dfb90a1353d-55b8eefed87mr11185892e0c.4.1764424962108;
        Sat, 29 Nov 2025 06:02:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:31 +0100
Subject: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uh8OJJhQouGil3zYUiOAr2BWbxzrgTvVuHg1TGtywUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz55y/PVilHoj7AfbnqhjQ5K7jUPXBcXtVyX
 v+HV4KZSQyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8+QAKCRDBN2bmhouD
 185LD/9rQ1QOr+t1X8ZMDEDNnH2CT+Tk9k1IVV6S8AzrjYDwyVZD0WFr9d85uiWuTq1+MviaUWR
 MrTF8iF8Db/FfO1nnQCXzRKwlsopIi0drDIT9SPa8awJGenTh6qoJPhK1EH2igTh5hLBIjERxih
 hgIjlqa05HFqErrIB0uI/vKDKgTE4LKTaUYSZI0hjDNpdsxQrVl8Vo9G/xanoTMWIU7klL2Cihm
 Lrb1+pCUZ/wekjvi0JdkN9bjllZWdeHTGEhBMFyltR9HIleOdgE3AzPoyg75CVquvZjRvXuNJ/3
 S9SPzGLFr3JVEdJ5cqq8k34zjQ+z+F/SVlSuh12p6VTicmAE6VJKQ2HNtUj/RvzTCjfsPjVBhND
 nDVSDVzUHw/dRtVzifawuq89duAixtfn0fkkSI+Y8QEdkL0CYoAGMGeq85yjIsKMqMO9CNZH+xw
 kLyBcoQZsM9P/L8QJQ6j5VmOUllmhLamdAWBnppq4REbXDWvPFZJoqKhPhkbJog95pXngmhcUKI
 F1IgkG7aLQD1zz835/Mu2f/w1IF/ngTfOpNpIFSyx6eOipVYHA8dohHAH5bqzEu67xp0sR8O9bK
 Lu1cuKIZPqfiywmqGr5Z80eiifOd90SCM5HYwKz3Guoo3ABTw8zV0uB9l9+HVkMzMiW9KMYvdaL
 aA6iHteXHoA3iag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Zkzx7HTd1F2ZzHjN6cocm9IDVcvkiqdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfX11LkdB8HN51B
 MkhPkR2KblJM5HEVzsXh/4ynYLud2dZKGisXIncI+TOPmeW3rRq1d6iA55273MXohwnEEsGtG9r
 xajqcyPRXe8h9Ansm9JF81mddNR7hdUB45nXhA1P9FzjbXpi3gYEGraLdhP5ePwVy6aIwEXkWCh
 HZ819Zu683Y0NAgj0OaMo/ap+Pa+g5Ybkwky1hHBh8wKK7dj2NUpTwd7aVJ6YTCUrEjeWw14B0s
 NTFiTG7BHbpH8bnL0P7fxdujwcBlEx1h2bZGwdNQ8DOeRylpPJo9qFWC+yO8CHkkrbrUZFdzsa1
 /HlT50l2ionjWaJr0VTHERKPxplqNBewIs0iYgUgFQpVi0Pyqombmn2L7t2uL5sR33zWBv7HHw7
 wAQSDDuiHfy5HEKpOEKus6rpb8idzQ==
X-Authority-Analysis: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=692afd1b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FyqqiJggdn_6IRYEkYUA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Zkzx7HTd1F2ZzHjN6cocm9IDVcvkiqdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511290113

Simplify the audioreach_control_load_mix() function by removing its
unused arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5ce6edf3305e..5d138a956ca8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1203,9 +1203,7 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int audioreach_control_load_mix(struct snd_soc_component *scomp,
-				       struct snd_ar_control *scontrol,
-				       struct snd_kcontrol_new *kc,
+static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
 				       struct snd_soc_tplg_ctl_hdr *hdr)
 {
 	struct snd_soc_tplg_vendor_value_elem *c_elem;
@@ -1256,7 +1254,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX:
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
-		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
+		ret = audioreach_control_load_mix(scontrol, hdr);
 		break;
 	case SND_SOC_AR_TPLG_VOL_CTL:
 		sm = (struct soc_mixer_control *)kc->private_value;

-- 
2.48.1


