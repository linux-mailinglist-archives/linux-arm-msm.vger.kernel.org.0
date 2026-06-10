Return-Path: <linux-arm-msm+bounces-112349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8B63N4EhKWq1RAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:34:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578B667374
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:34:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cFcIreQT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jqvqFGXy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6191830D785F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF83AE6F3;
	Wed, 10 Jun 2026 08:32:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFED358D32
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080341; cv=none; b=YKyiDucOYahzUPuu7pb/gzgSxg5FAbUA6MuunE9vYfjymeMJtqDTV3gnfkoZpsqZmduCQx9kIc4n6gfUbnYqLDvwVENNHwUb/mh6CjiTU8ICziWI3KSiC+SCG57Ch+/QjupBOFj/q2mltvGKo617X/rdsODVGvCxW2N7U3zVGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080341; c=relaxed/simple;
	bh=ZMZ0haLnYHGr9lz2l/xLLeBW3Xp7jlOSPcKxb6XrxfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOuANRxG0y4y7I2sy31mH+1EQpfa4VcjaC6yZpNq0MX3YZhju1ta2xWswH1r4nGQrzLhlhvuunTafY3hJUboog7FuNIOcTiQwkrbxOYhDfOlnGF0ABmKQ8XmHAW7MwpQUGytM8e6Jz858NZNhh6P+vySgRIwmXirmNtCmca6Wfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFcIreQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqvqFGXy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnXx530869
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=; b=cFcIreQTSpc15f9r
	Fh1rWdYgxQO2o+PloPdWhJWVugh6IMzLTOqzRSpOYrzRyuvPEvJhqbcYqQvH10eJ
	wIA8YszVjKD7c+5hrkz6uMtXOJIb8b0cC/AWsHNZrxYrR2XSXhWFb5rEVEL7knO8
	kGGchkimKyBRR1yjtNI2OOGNwdXbdZRV6vkIbQfpIZ/iaOSK0y88s9bS4aUZYqvR
	dgtgcZ/UPFtSp8On9atM1p+iy8rSb/lYR5M/SUts6g10SejZYFID6qLmRinSV5Kq
	Wp8bQnuLsU/5Z0cGlXLndj4fu+PV3wcBVi6nGsdt0hRkU8ybhaHfM2ndl5dyxNnQ
	Hf9xOA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1hyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd83d58d9so104796136d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080339; x=1781685139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=jqvqFGXyZaD89yTaeSeQlA9wtXON9loqzPj42A5zwm2vAXBD5hqZ/i9GdTOWHpHsXv
         IPMO73iH6+bwDPeRH+YaWpK0OZKfj7HY/bp42tbQC0XZOUlXU5sVEKooaj+KRg2WRveJ
         TnxaJ1h3JwZ2EtQiuVGY6H13EsXkXNfGbiJp7vkuJyM5tkkuuKHZTNYW+e933ABxk34S
         GbP/HfALxdmOGv7EtDVwf/zLGt/WS7iDYYGGt1CP9U+Fb49FjSOBE5evER1Z7uZgjDje
         5Fs8X8gS3KJ5r6vrdVi6IVyVL8/PRqgFAWny9GOdhSivvcPxmaDBFy+7EDj/puOPF8/0
         t33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080339; x=1781685139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=XTRzAINlvRfnxCTVQ3gYjbCEi5aMiEbte6R6H98Ykwxi+iFoAO+AQOGJqOfvbcg3XF
         ZF/lsFiGbpOpkD2HF9oj/8UyrakDZG4YdFDSJOKEyYWNbnVHjniwfT7oDc7+lip3CrCg
         GPWzDTTmREYeBGRW69hYuvq3jlPRqK93q5XbPE0KF0BtXtfG7DQKUzmTIoM92KnL2dU9
         MaNsJ8LRtL9WPhvu0ZvmwcxC9dF2A16dSiC5daqIqmRgY5s6v9gXvHLOvX+ZdqeUIAkk
         DP+XEkrXZX9Zp192g6wWuMsKpHObZxadd+HsAYGCZ7b0A8EFVJOwfrCyMavZM0zuYqd+
         41wg==
X-Forwarded-Encrypted: i=1; AFNElJ/epTeUtMffzAaY4lavqtqdO7YKdoSahhEoPcJah3NflK9aJvMVtMgqZeCWlfjdxgcgrSEIzBnPSfraqN9n@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Vnz8wDWjyvhij/QhE6iJrX+U8Xli6l3ZHVuKdg/UaU7NjUkf
	g8gVI4JPB7HyUl7kp9kpjg2dnoCwwYmjKNuOZMN5YJ6rPYhjBHdkaVMrN+U2mdQMTEzm4QvnS1R
	ojeLoyvepfnVJxDfP0Jq0yV8g6FZpJT55IHmZYn3xhFimYBrhvw5qLrPBC1p4CIyikkFu
X-Gm-Gg: Acq92OGfUr/QKq7mlIMOx0AI2vyYqV+r7VBBvzTxlvqDarW/kP+wjmY8LFDi48BpSFF
	VM6ILxRTx/jbrMc1JaQzlP7BdKwyauZpdeTTqG/jcCgIAopIN+s84kVO1weecxxoexYjEYaJ6F2
	aYdtL6MShLN/mpz/D9W9BD+gLalp7NqNmWrvxKVK1Vm5xUP5HbYInPrYhwtFfqJQaF5uPnYTBIc
	s+unOtg0IHVxddEGM7hYpjyfr9luvU+vApZLCbq7ey1z4YpGAwMnG02QEBbubukisFa1dzbJCZb
	In+HO8ikt6+m4X4UKSpThs1m0VIw1AnAptoT9jUweNAaz/c+hPjYFHHb0LwOJcrutnAhfWe84Kd
	i9A0Ot/aI0ox8PpQ5ojoB+yqfvNBUC7knO/K5IkfIKUtEleBH4At/0osidEruUBc4wrP20nyBg5
	FKN4iS3Ym7+ClH18kYEIbRwzdGyDlxAbfYk3BVUrx0VsZV5qf8Mb8fKkm3HB8tPhP/1lYm4phjJ
	ybv/jP9cQnK
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136471cf.25.1781080338717;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136011cf.25.1781080338186;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:13 +0200
Subject: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX+Lslx6EQSE2j
 gQFkRvN31PahbB441UxDuHzigJ2BMxiwOX4wJF+vBSnaslK7j5uz4bGe3Fd6V+ZE+oLaAT9JPxy
 PS7Og/LiGgfmjmiMIttKyA4vliL16/8L3GVeBTP+oIOxOnmX4UhiJRYr9bQ2N+8RkXlOpoS9XmZ
 xP94N6kjKy6O7zc/zHSm0WV2S559/C0fLMRKiIdLD1Ql6/9JXQYSK0r1Gsrr5aRszVt0wXgEUL0
 SiEf8uHuiB3AVWKomT8sur9581rffG8c+W/Ya1k7NplKyscTUJkS334WfydYzT/rcc1G2yckMaq
 Uk4HkDMQF77kow2dOzo0vyQg4XuyyjkJBflPZPEy6QlMzAuSw26+4CtSXrOIzbheBbWroF9d4xK
 ifwFftepDRPOmdsVR6oFhFZZ0EfQexqmhRpSFVnD/uRkBQenREqbpTJ/ZWi2A/e9E2kkc25nA/e
 NEA9iI0QsA1X/ZwliFw==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a292113 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QcpCrrypq3z5zaV8IXQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 4Kw52S9fKMci-0jkPOE8NpjqZSPG0ydm
X-Proofpoint-GUID: 4Kw52S9fKMci-0jkPOE8NpjqZSPG0ydm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5578B667374

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a30888c9156b977671b3c48937d4ba972406ae91 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237

-- 
2.34.1


