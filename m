Return-Path: <linux-arm-msm+bounces-110448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAMNBTjOG2prGQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 671AE614A26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 07:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E766530788CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 05:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DB07DA66;
	Sun, 31 May 2026 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORZwSWsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDOrb5M9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940393093C6
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206953; cv=none; b=YUfY3z7L2QXCaZWLGKiA5e8KfYhZ66gb75AQJudDL+0MEHvm8QK08iDoGCIa2MpfOumGTdCAeyT0RiTmASGhffwQ21gzES50sTWWCO3/L4OSMlCzlWnhO3QRQ9KusBjqHIiW5+Au/JIeI+qamFKXX1K4MoxvPJu4FEy3UYAdoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206953; c=relaxed/simple;
	bh=+qL/hBSTWBuxNiFK2MIAANTOJ8DrM/Sqlp9Ov3W2cvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6yVPrdSSzfEOW5ULePsN3cU7WE1EvF9xTNssE06HuV7YHC9vOqfgby3u3LpTsx803fLU0ve9m3IpsmvcSAHAy4CMI+iKB5p0Lu0saK+7zmZTE+MsRUMLq7PJ5pPDsw/W4H9fgL8sG7m1CiwK6jopirHKi74W24jPwz9VNen+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORZwSWsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDOrb5M9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOKN4250010
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=; b=ORZwSWsjW37wyi5D
	TW/ayu8nhicAS0ZqJqFNMJwNLjAcCf3AWT2J9cohKjvbsxAFGN4834fcD+om+eHZ
	yLr173AphtU3bkGnOSUgwlcjrLZ48vTSB2H3i9ni5vuczBjLvNyoxj+w0m14Hho0
	xVXWUfeTEooxAlEGGBSDLqMH3BRMaUHmBfwIlENXwDFKHqp+84nt8ONZFRTgOQh6
	Pib2cEJlWOE8YMV/FaBRdz/KeyizvTD4vqmbtzLUn+CP0yD6IeP8wh8J/5FSHQFX
	+5dF/P6hi6NZ2UwZPlQg8SNHpOi9D01Qqkjtt9VQtUDjk1M8qYoauuLr4aBLE7sW
	Tcq7Bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux52e2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 05:55:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2c305d0so141376a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206951; x=1780811751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=;
        b=DDOrb5M9eDnJut9rC64hiOcXCo0ZouIp93r1eZjqzKxhTspTINHEzxIgJtXjuQI1XQ
         p4KfNuM3rapwXaMdTIXHocPkOlvHBZnk1K4j6MPwGb9h5HjqhkjcnGa2ckdSZkbwvCK+
         Tnk/ACwCezYTqo8451P3V9oVvqy7XOkL25x78dTMMMl+PXJ4RhCWO6v537hyN3ooX/nE
         JJniKhZjFpwLx6DNvJJ4CRIYwqHnRIxuMNGLjv8HsL8PFmHMexqnflC5RyDKS5ckEyXC
         RCKPp1dwx6U2ImKBX7KoGhSunRvHlZBhxVA91oivJrX/b5Ug6vUIJI7EIe+V/hClS+5e
         4aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206951; x=1780811751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m48eV0xUesXIRVTMJrkjrvdiGFvsY6A6Ikb+qrJ/+rg=;
        b=bTNBAuHMl59PtsrpFu5DMfa5bIhCdFVAZlbEt+Toud4a0Yx0gvrCrSDsPhObJvIWj9
         Ol/0miPzg2Wqt30/p07gmil5Uf4eZ3MEOH0PmKVJ3ztHPxol3o0jkBWYpV3a/wJOs11Y
         RrYTslu69/820kD68RA6muQ9dodUhZoHUrDDgOpf2Sl8ChLdtaQ6fURdOtqqEKVGUntg
         S7DUGb5AQkMziIq0MLZwmwAmR66GS+YxP4SHidOdBqV8KMI2mb9nKs41ze5Afxi/YILN
         MW4Rtkt5keCdbCA4QLRrU5JMK/bhy7KDOXuJK7UYVWVrtueoC6uHMfXBVKwkbUM0l/CC
         jdBw==
X-Forwarded-Encrypted: i=1; AFNElJ/lnR5yEQNSspYeR+2/66+1OjLPqQBByRV//7lLYWstoSZc/QFULbU3ydeoIFQGbmh1uTanKT/t+V0T5+yo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60y/sKXM2Xo7UApMc/d/9GVW0M7BEaz6UEeqFx/2ZAf8PAUgw
	0PH8Dwf82N+xhMnINopgz5MlTl3f+AeFyx2h9Lm2WW0xkLlnRVoPhHx6z6gsmcsFHaIz4Xlr+mP
	zkGPX3hfOvVMpWCkwr8GYI5S/dX3KZCcuxg571ybGaFHzwvgviYuUkx2koMpqpsd4HB4FxpMAKU
	T/
X-Gm-Gg: Acq92OFgDxV/VAudyn0Z/1Au8IjusRKUBqpSd8cO5blMDkCZsxLsD63/1lUIe1MQ58c
	qeFl+YYgGA7tqsR61Xyulmo6TT2fDIr9d6+fef8mYE2g1ovHp3pGA1nuIjb6Y4oMUU7reA9rbkw
	RyZnrp3oJoaAWbXOu6JI+BWhMbj8EKWxD8pXirKgfOF/unbYPXnnQ3yFAVls/GFLU935iiT4CYt
	vio5W2+Hz5TVq+HMXmLOY7Q8mLnE0lCfAjJldfLBxIZTh1+G4d/irO03tObKxrHSqZ3LGhrjPyx
	CJMmUWQ2ar4EEhQWjMKS6o/18PPDt7Iz44DF070AEIKAfHwPDQvd8k8m4xAvqegWqsVueCcOh8X
	ZheZoFINTJ0QTRRrDlL43uMLLqgGlPppUfqLuCQr/g0g9N5e7scH8CUs+r5WhwwRn0g==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr73823645ad.34.1780206951174;
        Sat, 30 May 2026 22:55:51 -0700 (PDT)
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr73823365ad.34.1780206950734;
        Sat, 30 May 2026 22:55:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:39 +0530
Subject: [PATCH v3 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-iris-code-improvement-v3-5-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1365;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=J4ckhmDMHxWwy+HpYLt1Dv45ile/JlEk5pzQRopA4mA=;
 b=nkOUzQg7r0oO4vvuYLPQyOBJg/0FtKpEBP+kJyu7DUXnzstucOVW24t5WDBHWnhSrroqr2Dv5
 xGkDPSOY/kVCuhTp4Qf59ARpmySmvvs/VYu99Ee2p93zAZgDKr76ey5
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: LQ_LeFWymEAjIcRceCKMT70AIaOBJLfs
X-Proofpoint-ORIG-GUID: LQ_LeFWymEAjIcRceCKMT70AIaOBJLfs
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1bcd68 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1vCIiHQokKioWWC5pcsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX6I3uzgZlidVa
 CjQGBf6xro2wGc2VDgk4utkd4okeGErczPoJAfdo2W2ccqDSqfNsdAAenvlqAe6f5EEtAJrBs8S
 mdRWVwJkybzIsJRMKg49N5vErAw8rEXRoWrO0At1yKltyVMFYHZKoLSdfIWidxE7QBWbzNTZ6W+
 5Z+HRnYZGVhad+72iJZM6SYZzlahrN12n0PW8qw3jgQAe6LkM/ssl4h0vrQwz88QEoUZIY12S8O
 mxwI9u/ZbUmC399FvC6XMP0oXft3YkSNeZNnu9rXdnCEKmFGNXRh/0eoLwOCOQLrexsh83LFxQ7
 VtJv4CfXskIOVUxFux6/YRCbyLDvX+2SeCaZzs+R81N4dPl668GNe6zdPjRK5pTVB6X+HWvhrVq
 A6TvXWd40Wn6kAWXpc47ESqUkcPGvUKCPtms+UoYsl4lsxCmr8/6kpGfHsYrOAmztyekeTUvec8
 uMBfPHeDsXofviQEotg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110448-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 671AE614A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
dispatch table, causing the property to be sent to firmware twice on every
config-params call.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fe67ad0ffb4f..516bc468c72c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -623,7 +623,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1


