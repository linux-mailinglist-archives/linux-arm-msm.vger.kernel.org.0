Return-Path: <linux-arm-msm+bounces-114029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zyZiOGhMOWrdqAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA796B081D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:53:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qvs5ZcVO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P+SiR2X+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA0EB302D4F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EC7318EE7;
	Mon, 22 Jun 2026 14:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6B3115BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139944; cv=none; b=PBVP9t4AC18Rnj8O98bJDuQh7fw0sCYoxDpWBX2xYN+YthCyPlzyZ/Piik6AK5Qo5HIQwUlaYlEbKO3uXfl2j+y1AfUr5y8JtmK60Nkg51d409hb7Ez2SAE1uhLdfmxQ4Si2nBeiAlsEoYwSFXENWBPpS27PkAvxF8y4VZHwtRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139944; c=relaxed/simple;
	bh=6RgOZPClI0alNj5VtNfn1su3o46ooC188/5pwzWrl9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzoUOydfD94eh/K6+ldxWgwN2DHmjwpNY6wixTSiQD0CvOgi5CGsF3SCBxiRImG+kPO/cD7wM/ELEsR/VTGdxuziWDGeLdBv3njmqE9eTBm/I3qvs9nzxpEXotTjlCZSciSjxYYH2diRdYNDJ4g1MFCgii+ajS9P2DXf5u/szxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qvs5ZcVO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+SiR2X+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MEQVlr1521005
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozqx0SScTT48vvKX3IveR+kFbbuGPWgIXovasCAgd+k=; b=Qvs5ZcVOW9com5ri
	TgaGlv0/LcqsQk+6FMF2jI2uPVnylKnm1M6WbwvxNZipbCBYdIrNxDTHMFx8rgIU
	EzVOpAYXqumMqM/nn88tDOL66VNFUF/1MZqxPQ091ndo6qQwh5bJGD1qsnEZNUzg
	NwPcxkFitpLtf1RSnB7jVEeWD5w2Iz9FTHGpZwdbx1FhOvshERNwuSf+yGgj8X+3
	e5It8Ozq+2tCFOE471dIMGiFHe6YKVwTa4N2c4WI4Ko3OjcBGx2W8hxXIikOyRR+
	QzqshzZdT5ZLbEC3A/sjRN+ZF2vexAj0EP347iS6aO8TBcv1mEX0G95RoAsJOkhd
	b7cuiQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmr3mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:52:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1399e7a6d05so584453c88.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782139938; x=1782744738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozqx0SScTT48vvKX3IveR+kFbbuGPWgIXovasCAgd+k=;
        b=P+SiR2X+TDq42egcm2Mp7A5gPgiy57ibRmgEu8DEccnNdTP69n1hY0p1kguK2Wb/OL
         u5BzveTeId2GMeWE3SdFHE3j8bvpguM++5SGnIpmE9mgtuAZsbAaDYwzMzF2YM5h1nAy
         0uujHu43CrxJePJumlOdqND+V/6jVp7sw2So+du/8yRl3apskbCLqkak+aeVZjpwiq+W
         U1ugIoy9jrSWz+ucupNJTgGi2o7y3kGolZ659efeTVwj46PWEsRXCRacQarjAAUViCDh
         SgrAcvl07kXkceF83KzOevsPz+IP5QUYERZNucL2hqk8EsSGvHNgyou+4XwLUD9VwC5A
         u8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139938; x=1782744738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozqx0SScTT48vvKX3IveR+kFbbuGPWgIXovasCAgd+k=;
        b=Fp8OIS3VX2ksNx4lHMCnT9O5DIWp8rXnYep3Pu7wwSPQyH2ZSRrazSfKrx62BHlolz
         ldpOMYv40FmRN/lyOxvCVK39xyMZHIN5pkRvc1YLxFmdfO0y6jQlfAeio5C3ILdXekPa
         NFwWkG/GteyGNgVFQgKyd8xNVcKZDR7xqmhHK9V8/HjITnQnepm0xss2M9zjUk8jWVOT
         0f5mUgjM+gt3+v2/K9UVlwVj+EzDkPLjyoG0tjRRl3Qo52mWihwj7mngJ7iXFmYv15mc
         lTsdqlDeFBqlvJyeDb5AZI9n+7DeLFaqXjgvnFaKsPWNKt4tgchdQbIBdiVD+XRi32ul
         PmRg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8socXid8dGMG7p3JTxwhqcUrxQKqAX+EqeDPgi4L9sAnlzQ2oRFMnV/hKAhCfZ3LgBQ2rpzvmwD4hZ3Jg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRzok2iZnp0+zMHaJ6Uauya2sScsuRm4pIFL5ZTKuWYuvco/v
	yK1ULed0PN9yqQbFIxNtp6qf9dqHbUzN4nbTQ7DtEHMLDx93iwvqK+eI92qhOz3LTjPXZZt8N39
	ixEDGgLutbawFKzy2auxMT2EfZ8Wvws94uO6MDRGXXYjQ2Jao8ljeYsSmg7PecHhEAyuY
X-Gm-Gg: AfdE7cn3s3OpSOwb/9fYNYNIwODVkcuwK5DKlpnoHxDm/tRLi9RpCpQDicQ49MVfAyz
	BzgzfalZDau0uTGHJvZbFuRmCax02wvn7Xb0uWRvsJEo4pd1qyYG+oYPevAwtyaenyOR+7sFq71
	Sf0bekPqIxvL175pAtm8loWeq+Wj0Vgyo/F8GfuPeScEIqawKgiSYLfCsXkxkKyi4DseX8W5bI1
	ole++LLayyfOa6ouPY6mMC2qGi6TT3gFgOKnfQrUuJfe9u5cOndJqAiqFuZqMQadJXhR2lzujLn
	rhIqh9Uj5FL4/Om+58BJxFiOZ5y6LDYD4KotWcf6Tf/4Pr1O4MJ/Fy2qOQQ65ayMP7lsyW7lzvZ
	LHDB8wcDun2bMTBQIwh5X+AS5wI0aL6pcO3aIgNEcvu/xbq8tWLxceXu8Aw==
X-Received: by 2002:a05:7300:748b:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c523ee936mr244826eec.4.1782139938131;
        Mon, 22 Jun 2026 07:52:18 -0700 (PDT)
X-Received: by 2002:a05:7300:748b:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c523ee936mr244809eec.4.1782139937591;
        Mon, 22 Jun 2026 07:52:17 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bddfe34sm12025561eec.20.2026.06.22.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:52:16 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 07:52:15 -0700
Subject: [PATCH 02/13] Bluetooth: btusb: Use & instead of == to test
 bitflag BTUSB_IGNORE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-bt_bugfix-v1-2-11f936d84e72@oss.qualcomm.com>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
In-Reply-To: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfX8xqbgeGbPUf5
 zJ7PBnpR8VFIiuwq6DUa/KwkytSBn4jFO0sTdkSnAkaCj0DEEZb1Sds2Xr9kt8eBzXswW5v/JBA
 lQHeTcJGqwbiOmW/DmRWVr7qzojLJm8=
X-Proofpoint-GUID: 79qOrwtGhlP2y7KPqPi3EgPzVrPOIlhm
X-Proofpoint-ORIG-GUID: 79qOrwtGhlP2y7KPqPi3EgPzVrPOIlhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0NyBTYWx0ZWRfXwM8gEwMLFERO
 xNh7hMc2XlSTQIC6M+lQ42bBRGlrccUxi34kySgrLEGsnR/7QtRvbpgFStPvvXFNe6hULMEbomJ
 PT2tlxWQMspH1fQfEXxRlq7PpNKKj8aXAJwUGSNh03qvRtHzeB0ASULCxkXthC7plLjsKWfEqi/
 Dwlzhs7J4MlH1CW/YKbIRAhNjJPAjm0kpqr9hTVWHN52NllV7b6/hmoEds9oC6LuB5dBvhov1dF
 xQKK7doKzXs27ccGpuFhnrjFmUqhhpN+/QCIEnWfvtMA1rWqH9GyylOrMDoKNfmiIJL6vWJSlOo
 dgqqcExs/R0ZHFdJIKdWuJCAUPLL63zQWJWC2QfZwl3OOZrQTSvKKP85pLcTM9+8Ohe/efBVGZx
 BndgA0rhw/SusCrEiEKIkVhxWH09tN7jvyQc28xWFC1f3auHZVu1VNcxaTcMRCvvHqcSSimP6ng
 0oOEmvyQ5MTZIMJeeMQ==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a394c23 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HKrVEy9w7v3RiqOSl70A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AA796B081D

The driver_info field is a bitmask, so use & instead of == to test the
BTUSB_IGNORE bitflag against it, which is consistent with how the other
flags are tested.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5209e2418493..fa6a223d472d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4101,7 +4101,7 @@ static int btusb_probe(struct usb_interface *intf,
 			id = match;
 	}
 
-	if (id->driver_info == BTUSB_IGNORE)
+	if (id->driver_info & BTUSB_IGNORE)
 		return -ENODEV;
 
 	if (id->driver_info & BTUSB_ATH3012) {

-- 
2.34.1


