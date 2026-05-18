Return-Path: <linux-arm-msm+bounces-108132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKy2GcrLCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:20:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D36568972
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0053A30470D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6CB3E1701;
	Mon, 18 May 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWtZY5vP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxEAUTux"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361D3E1717
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092288; cv=none; b=d3kuahFTwJo54TIMWYR4yIQJrIHx4+H+hyfbwGxDERX+lIH32jmMIyqC+k5y/6U1D/4RanX9i8ia7tORI6R0BywdJjyJuSrCqZ+oit4E97IZJTndg82kzKTmhde0UrZFQrRS1Ku2AWnVMu2+qlB4uFkkPrQpSRaMEjj6UeD63+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092288; c=relaxed/simple;
	bh=TZ5Gbdy8MpD0BkDYauXmi2P3QUkOwpzPVQi/b1SuMMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9TI02BqwA17obC/3YH+69LZM8MBWpd5uq8dwAKgBv/BGFgHwMwD+09ktEWVyQCefOJk/CPNh5RxVYg3NaTPUVSdOT2BFQ5FWdsckEr5dOOZjhuvhtOL1hEC2JkFHY5rhmCjZQ/+WBbsxa3xJZHq6b+rwvrtuVE5tbPiATvwgQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWtZY5vP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxEAUTux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I779K33838563
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LU+3o0EUymr
	NGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=; b=OWtZY5vP8CWtrDxnQeurdLvohLu
	GHEuqAVqgXDEoKB+Mj5PCpXx9oA8zsZZGuCOelrKBfc5Lua6Ue8e7RYYy7Pf05Kk
	cCZuSUStCSUKMgcR71VkELH+vL2CeUgUte/qSlbKKstZ+VPYDss4h+weBe7G5ikS
	uYqPlpJr/LJ5zytzskGt/A+dnYeAlcusR1lJkdZCOT4xH+NOCzPNlvWjhPCU3ALG
	9J4/N1PvSb5r1iy72oX4dAtRfV2Nk4BQfZZzegi/+nkvoIFGZfBjEwW8nha5QyIz
	KgXp7Z5xWJuJyevPhemKlFhpOrmc3u+5Cpg/DJt9IEOS9i9x+BrzgmmNaKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wbas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so14609855ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092286; x=1779697086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=MxEAUTuxlp5byTbE8lEGuD8jkN3bzFZglh3KGeDC65VuzKwRjmGtTknmC2FsKaRDae
         Bbov9cA9Ftng4VZ3AJ9YDKCp42Vt1NEOi1Z6nXd/dnrfBX67xgKm7DBB7k1LQ8BAXdrM
         ol1pt+Rxc9UBdNZs/GX1X4P4eyoDM2BLVXm5MDqRsPdyjh10xusewxEzGb++/Tie4bfy
         IvnQklcArlo7zJ+Kj9OpA/MzrOjWv4pK/eYJwCqZu3QhkZDamGRIc/zKL3AbzIvf440y
         5p7RnQIPBpPdD35fwP2hEqDssLNoD7u6Ifr1z1XS200S0DHYDRMt4vZIfAOMML8Yfp3H
         BZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092286; x=1779697086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LU+3o0EUymrNGBvYnnfmtFWJLYjR5wRDEMuCtrEycf4=;
        b=S33iaK2l8qYTG73NCt3+JQSIMJtLJZQye8ch6IXK6MPSvd0DApl5o2G+PWgkQE5xSl
         Rd4TJwzJq5dFklUK0+lcYDVd/gICK6wyWVcFUzN0/YwlUL5985tsNtehX0vfFk6w725v
         RgjITni8y6mURUfOa3h6fCUeGMp8iHKkjedTjfXBD0S/YhcncDZyqhDDGMUIlP+n+Rif
         EphqxwNJOk5JGMd+cpjp85G6OC84SfZRgRen2HIBB14QsqmbPvOENkJ1lG40GQNwgAaN
         1iFiC4g8qiHeaO/6ReCo1P/0+20UUvFihSdvzNV1GdaI4itxUCtgJIsJM50UpZ4OoVos
         tjFw==
X-Forwarded-Encrypted: i=1; AFNElJ+Qo5qKNmdauToDDIG4YflGEnCDH/P9JDsQxFqg4ZTW94H1KNGEUAFaRmrvsnyYtF9Zv4XS3GueUJx3bW1a@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+LpnpIwc7z3NojngB16VHU7CZxQrJg3H9dGKjLkFBB7lWqp9
	+bI4BdA70voPqcX/jsqDgG+WWDsFPfI0XasupoaPNqQ8pI1f8a4szJGHECJHXO0IN1ePRcl59N0
	RHgeKoCsMRFsxKraDwsgQXfwu2iQeHZFV18sj3fYWz24dv0e3e8BpEdajEThzXHY3kh2w
X-Gm-Gg: Acq92OGLUJvuVOOudIyjpuVV8MZf6Co2n8E5oaYOfu2JSH2xueem5m4BuRGkfAS2En7
	rYG7sM+AKYTylYdWT8HuN1BCIZqujp1Ms0bmgXpPEz+TzaOtck5GimKxhkxuux9eoRoU10sHG3K
	nWs7b6RZGM8rRAWxvYUTC2KoHRgGIU3o9uNjbFUaI3xJKv62PK9NtZYOLhPW6PGcjTzouTHeD6k
	y19YRBBrpgQDDGY4yojGvTexuLVbKA8IxsN2XWIjlWRpGJKaY0z1VrW65/hctJ+p72PsIYHgjpL
	xRBd1BnUUK2zNY7v7CqwsdcYZvp4W9jBCkcVn9fWRlP5l33TNF6RegXxKKQkzV4FoLDGXrZtSqz
	ogKR0ol7Qs/4NdQjnzcg6uehVZwHSMCsVkvml2USr2Hj2iB0oWw==
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr112546775ad.14.1779092285716;
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr112546505ad.14.1779092285243;
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:18:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Mon, 18 May 2026 13:47:38 +0530
Message-Id: <20260518081738.2453957-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX0Si1vMLHtiBO
 Xw1khJE34G1ljxbkdl8b5HWfz0iNObM8Wmcaq8DAGq/DAzsnntDS0L+cuQ5haSAByb3MnAKkz5j
 Z/Mb1cIVi6y2MzihN8OW7KAGh9PQUC5REebGmcIrw1eYVnaCLk6EfYKp6Ie51FYpdmVQfFhyUu/
 +YqBThuXIlXK0UzAzFhfOPs+WwVz5gjQ6W9YMSRTfkRJ7nJ7k1Rir3Dnvi2sp9O/eqL7Npc8dJx
 pEst2sF4Sx2DB9KOohMwsrNd7cUf9wHl1WFbpPeoqdzUkWTiB/KkoZI+neptlhSUKO3eTq1tlMb
 LY31GGl0V/pqrJtGTq5aIV1PdVqCA4/SM/Tpdysmlv3lBQZ7UX1o/1xEk5sY7xjUzX0koQfOIJO
 BmQ+eINQH7b8zXBARb0k26AjRTJOOLoh+J6PkF3EoK9dYS/MBgddx4gDGVJcNrVSWqkUmIT/C2o
 vx0BxmBMf/zefHtGFnQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0acb3e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=E7064k5JgmqFsk_8azIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lEWWpAobMGrT66gEwCQ8ZZ6ev9bbF2YI
X-Proofpoint-GUID: lEWWpAobMGrT66gEwCQ8ZZ6ev9bbF2YI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079
X-Rspamd-Queue-Id: A9D36568972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108132-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The WSA macro driver registers the MCLK output clock using
clk_hw_register(), but does not explicitly unregister it in the remove
path or on probe failure.

Switch to devm_clk_hw_register() to make the registration resource-managed
so the clk_hw is automatically unregistered when the device is unbound or
probe fails. This fixes the missing unregister cleanup in remove/probe-fail
paths and simplifies error handling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 598292fe3219..3081c115d584 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1


