Return-Path: <linux-arm-msm+bounces-111846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hbO0L7uhJmrwaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:04:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32476557A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:04:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oSQbd58T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BE7PryQG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111846-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111846-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DA2A3014B09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C9F3546E2;
	Mon,  8 Jun 2026 10:51:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50504352030
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915862; cv=none; b=PexLhoQGk3EDCngVcoDr1iDpPD30KjqNOxkSq67CuO5iTXdpRuYu+XHzctidiFEOinDb3WcwN/9Lbe3CzdY6hDwRAEK6z/pbqzEn9/VSuuhaEs1BSo86p/ExMYb//hpZv6gzhHgc2f1ECvkPFQ5+YIP3GxQHzJG3aZo1A/esOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915862; c=relaxed/simple;
	bh=bf+fGbp3y5sGKr3yiqtRUsXOaqQPcivjwUqgTaaStbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cI5+6M0wKY8rKBkqzba+DsGjkDk6d8HLw6satN6E/YEzfmRtRcz0uoeX/lT9OCVMCogWHCPOD/ZmOsOPZLdAO9r5ZWGVzOydgaiibpCmy1KtDU/xzL39ZWM+DxDxzwrp0Zj8FnUegcBziq8o9En+nJycEyZjIP5T50VKGpllm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSQbd58T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BE7PryQG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3OuI2848053
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=; b=oSQbd58TS3J4fPkh
	D8NBgfSqRE4G0ju5YPyk+rMa9ZL50PhSoGPPrFDDTcZhYBJDZEHkCnYuwgTMaYL4
	pjyrt9NcmgY7izp4qSZiL96gHSu/39EgZVUcTY/mQ7dtlF994wYMaBgULVGyyINL
	cST6PqqkX56lHDjQ29ZOstQ64nLHTtjSDmkf0UUjxxcK00WQaVUKDXf3StdVFNM7
	lqfpuRjiaPZ111Q1iRkcG8e0jN/7YtRnHTTmVU6M3l7EEEzzUzYBChpcrjshQPMX
	xA/Lop3FruBRkStXGV4C35JvHQ8SjJFhR2ncI8PEpNUVvo1dhNXaToiaV+CDYVpT
	UGb2kQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna86qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:51:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517ac42d958so31447481cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915859; x=1781520659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=;
        b=BE7PryQGom6D2rsDNtpeWSalOoWoR9fQtRVSBYYKyRJreSHKSzyAd6K7Q6R4Ix6QQ2
         DG9k80UU+NixQt+ZiMykx+lsBVS+cybQ/7C+/Cv4BBTrWudR1LcQrWIrl0uZeqf6XZWk
         zJpuPgblsKok+wkOciafUhVXXJa+jDZpVReqlDZZ0rLAw7cABIPwdFqSTuf2AWq4kHbv
         WgbZhOZIUHPFKuWj2sbhwYXfIi4n69ODAWeSNUZ+yVnCEXgM6lNjcHThuBixmXCDc4dP
         tx/3hWZF3IlZnqi3Me4HnqKOkM/f04tQwXYm4Zb8IZJX0RoZMceeGYh3+/I0YnXUZJws
         Dd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915859; x=1781520659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrd8MOMRQbi5cop8RgeayKocEI5pMrJ+hTvcAwk0fUw=;
        b=tQTbpV5mfKmVANi87LEtt2hrmGqzJ1aTmEYWq4W4se/NUG0/kc6o0dcir1JmdhNHhy
         Pf66qJ0EnIxBeY7PgxHawpiL6tYIw1DbFrzzZRsjQg3lwDAO3+9nAAlpU7k54ljQEPya
         RjW7EQxpC6Ma9oz3GVhS7TWIIGSxs0vOtaJeJ1328zMJKiq+ei+pauuZJWETmCIU4pdg
         Wz99PS0f53fONsCWFWx7TNtbLb7UnuUc2hHFRj4zf7tnYmvsaJPBnlVwcc172xtLUHgS
         VNjqRtzjtEzTgh5G5ErnVPJ0oCoEB/CHJvjtdDoNENGkytZfik7HLtugYbQXALHH/3cK
         XK9w==
X-Forwarded-Encrypted: i=1; AFNElJ+r7oiiLB4923q0RIMMx/KD4CNfZZ9UEbw67wzXfuGb12h+fG8Ed7l1p42pWkwKefTfMoiUOQpAKeXvTvFp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzork9XuJg5a4BNveui9PH+G2ccePnuUwWiE+sFsd7WW5URauRs
	+xgU4RT7lG/8wRtzpnO/LlN5j3H9u/yg76qklxIQxZR9eUoUglbgTDNHokdP2CfIMOp6asE3kwR
	/EY6SQwrp2ombBYUheCMp82eaxA66B5cS5ppnoBwPKB5uqzLE7e56WZdlOIdWt/Yfhcyt
X-Gm-Gg: Acq92OEfD8Dw99+iyzJfM4mZ4Rz1fzOTU2R7ZxFa8d6EHuFC13r4XCzuC6xHDp2ivaN
	idJ34sLIubmTANlTZUeBjuX3Yxm5owxDlZquJZEMus+hW6pj+PriSAJZsxBbvqUDdOSxF0vAsAY
	0JjqDYCq7sFqKfb6OFusrEv/bfPFQ41LZqjC4r0VaTqWL6VdrjaCdBHS1iGndsLUPFyYCxBEc22
	nSsqnPUWgHJ45x5UUcC+B0DfQfCD0YG4QASJFZQgSsYJAmWVE2GEtUnpsELVoUve+HqFLCxmCQG
	bCiEvdOpAL6dvTSihyo1eCpZ+7CYUephQqJ1ZwTy0T34ppbzttCt9xn6J9BlNmW4/FFhYmuqKk/
	vytWQcIhfFadyUSpIjDhhmXTFxhbHv1efv/KCjgT/cgTtpOUcVIqtlaG5mJ9fmn+MEaVCawGmBP
	JsDtdVtwgMR1sf0+sbnv/SZIYdtwnkZq0rQjSvFE8S1RGF+e2LVnfG+7b8pDpvjXA/mLQ7m53gd
	hWIxlwZdTNi
X-Received: by 2002:a05:622a:514:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51795bbf29bmr200722301cf.49.1780915859484;
        Mon, 08 Jun 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51795bbf29bmr200721871cf.49.1780915859023;
        Mon, 08 Jun 2026 03:50:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:44 +0200
Subject: [PATCH v3 7/7] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-7-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX5igDqnnh5u/h
 0mbWG9Zdg8FHocCl/YinVtSXAwE7kEWnGtHXx07ZEDdjjP8K54i1Y+M3m7w97diw7UBOSnNmvkZ
 5xRM3jASruMnbcT66pZ5igDeNtDaGuPbg2JKo1EYcciTpJVxTtPvAsNwHFDcYepjmBy0qhv1A3z
 fMxil76XpkxywWOU1a7gnowDLGTudkMeb2W5en0TGgH7/64WhexIIah99nKMEHraq/SAQJltt+j
 N7/DnvBoQ1X7FHrAfAu56RfyIUSAhuQQ55699wqo6AvpLyEQrduPTiQNs9JmV4c4Y0ueLpyuiuc
 CWe+4WZwwWhXzF0EpuWmlb7e/eiO6M+78zmMnGxqGri2nkkKZr7VXYDdDUjA+8bJ6wEcFgAPH4r
 LzDZS3SsPWqIo3+FGsB/SUscE62N+NgA8B2Dgqy3dafw4J6oM31TMbbh/tfK490XXceFpqBxZPo
 +JWZ3CTzhLn8HfePuHQ==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a269e94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lrwsl_vcuUQb-XtIoRIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lZPRp2LDg-B47yHjyB-Ov2W97nOCJrx3
X-Proofpoint-GUID: lZPRp2LDg-B47yHjyB-Ov2W97nOCJrx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111846-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F32476557A6

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..128c7a7e76b5b089044745f5d6407d6391055fc2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,40 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-partitions";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wifi_mac_addr: mac-addr@4400 {
+					compatible = "mac-base";
+					reg = <0x4400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					compatible = "mac-base";
+					reg = <0x5400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +545,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +593,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 
diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


