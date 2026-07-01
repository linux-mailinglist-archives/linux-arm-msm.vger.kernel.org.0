Return-Path: <linux-arm-msm+bounces-115559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3iBrJ5lzRGoQvAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:55:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 419566E9207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 03:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o5EZ128S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TxW0bh9y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115559-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115559-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B75A30A3E20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 01:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5470F36167E;
	Wed,  1 Jul 2026 01:54:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A6361651
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 01:54:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870871; cv=none; b=JRNKdfY03jAkHuicVP1iL4BezfjIA5U/cvJJAfNZ/TnhaGq/wS9G98mb6mi5NpcolrIEyA3m4vfwpEq2jiTFDSPTszWrNnhBSpC3eNypuqctxkWNKtrBxgg5PfbTTgWUXLJwiZdHqE/ezMXbk9ZOiwDglP1jgElOB1t1kFbdbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870871; c=relaxed/simple;
	bh=jPUYlzMEHul9CNoXVAyvw1WxSAWNAF1m3Kd9igZDHK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/YJM8G1KbOHmuZ5gX5m8QoD6YyCnjmAS2H3Q3ke7PfZDYIWRToqAPrTjpEvVcQpm5mFiISyQLEvJQod91tM6/1RnUFoAKAfTNz4KUBFmqbziiwevHxlz2xGONI269IW9yutO8ZJEuzdoYrwwLMqQaSeReQZwDZE9G/BilnNgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5EZ128S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxW0bh9y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMMvp3472745
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=; b=o5EZ128SMcw4GUHj
	lP90HOxkso3lbUvP20Jgu4xk7NpIujDz5aY5xqz9yTM2ESCqg9mIpth9plJqGgkY
	TiC69bkh7zAlQgSmePqJSRT/BMFr0SXlb75hM6T5mAV9UakfBltTw9879Fnl+GuY
	YSDisxHzI3yQ2jGOZSgEvEP38+uAYj731sZuj5Ww3wjq2Ude2H//fbDB5xJR8wdP
	ypCg35Du8LmuIr6H+mu3gXJbV2zhTZScYxEVJDq2NV52P51wCFc+E6BhuiRKu5bp
	3Wn4nVUJe8dmKUMVcG9b6uu0xRHb0OHNQqIxByfSlR34f1oZ98qrEPFdmh33vfP9
	ai70RA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0arv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:54:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9a700dc0eso1421485ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870868; x=1783475668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=TxW0bh9yjeuiUJsL5ggbFNDeGUUc7wLHa4XIoEkNP9hB7HFU0KWJ3BuATr2ezvYzVJ
         YHVEcd/lM8x0fR6xLHrr1psbeYahz2uF8HzZSfp6wiZ/drodnDfA5A72SFrtu4/zgX3Q
         Kn1/9py0wuRwZOX0VhUVNpGOrL4gOKtluhWT99FRze6V/xmmDlLDOPNeuoptSCfX+nPJ
         HDERRzqWydmW9Z7GeCdfhnmAN705KPoaV/v/lRrLADrUcKAdOROH84JOIoOnWUu6YQor
         61M2t5K5KE4b6D6cGZQNzsl19E3/6kkVwTWX7XbBSHEGVGguGc1tWGWv5vB0nOP3wHKp
         379A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870868; x=1783475668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=WF70FxjsCW0Yv14th+x8RKd9AX6PPZ/sf9RqyuRGfhzbzro3FQbzymJm5VzOPEuuBa
         k8beRWXCYFzdks2YG2HqfrXrgBdrwttE4jQ5AZfe91mMkwDEg4AuNuaCZvndHac2yIRZ
         fbju2QYqT0QYbfTQ5+7LXgczpXdi0Rpd87rR6eudpwY1uDpBMyJ5GZAIbCQswN+hm2ej
         AmKz4i8Igx6PO2qJmvYOmjVKevZDouBwlEOfDzjEk2kINLt7gzlYXIYp8poczVQMNGt+
         tsLEGH+bV6QhWbyAs9UH+bFUVr7AC/hCO7qwELmsYQ6tvR832DgeoUyRd1eEBWfGdIG9
         wTgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpi1MxubIG8peGHwNEEjUz2lfHlKxG3EUT/7uC1UiqzM9y08Ua1S5a0r1r3y9kEyCzwHg8LbMRVudQz9o2a@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwxbGJLY9gvEA2nhQhHtoy9PKDqBVE1uwgeQFaCxDQ5uVE14m
	zavbPDjvNaWi7Ej5aWcnaxdMI2mzCy62+iHSdC/5wIWUfX5zJ6d1S8AVhEVsEOnw7/9YPWpNWLA
	9rimmxiJvVtXHYkk4vyv698gbDysC6KlzwwPk0S9SFgpOFdPXXno/KZvLgHaXeI6HLz84
X-Gm-Gg: AfdE7clKy9fQEDA3sTGopYTIeBXFwRxUMz2kwQlh25fQfGURxCJulKwNgAHheVf29nF
	3Nx6hau3uO5trPcreZDSkL0QzvKb7Ndej/qM3xBKK96OPi87l3Jgm8GWMSUheBOW2A7/j+EfcJl
	LvvobTKtRb1gdz/X4Bk2FzkvE4HZCZ/MzGAOel27HWCmzD2AyXpbt3eTR6eFeKUpXwCqqaWqM8W
	MF1usuXAEZgNk45+Y3g+d2IyQ39XAKVp3Vw8zEt0ykBn/QSEGO7MCFbD44hHf6J/J7rLuwoc7QB
	XUSFY8U7qCCFb+YT6g+9Wl0D4A6tBz4/Ejs+GiFn9ESu1Savpk2IHdxgxAmcS5etzt6CzeLssey
	R6yW28dh74wAXVc6NUoltClTa86VTVPpgxlCe+kxzwGbDZziOs8zsqtuZpcBnHDOvRWDaOtLTHw
	==
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064955ad.13.1782870867686;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064595ad.13.1782870867202;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:42 +0800
Subject: [PATCH v4 2/5] coresight: tnoc: add AG tnoc standalone compatible
 to the platform driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=4552;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jPUYlzMEHul9CNoXVAyvw1WxSAWNAF1m3Kd9igZDHK4=;
 b=OEqkorXAE2d8ScPpY78cyBhpnWxbNw8WGkA7mG5v1VHqkug/8+KCAMspKvF+rul3OJeFxzTkX
 kLcJShiMV6iCxwnZGsJjEz9rb7WJd/1fb3OFFV+u87mJbJXNm3N76lr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXxwj7oyGO/6oc
 N7sfRQAIq5BiFgh+QK52KRZ4urSZOTYJhgASCEgHxuagSBm4iHwmgwtwfx9DENDdLyWdvzcClHS
 AdVjRlY35WKWkWbqo6ciXh4K1kTsSDzhgSPeeFlEcZ5O400BGWS2e3iZTRbgi5sadr2QfOdQmRj
 sqMTu9Mw0sWLnN9oG/PhmVZxkfVJ+UbIVzvDANxfcvzo+hVKoI9HP4ZL09NA1ev6b/MGQcUaVr0
 Ajz2b6SYAxtDwoi7gt/iN0xH0FdrAY7ynNL0fKJ8DrRqZXzoghUVhcMrIoAHK5SLGmAvbeiXxeS
 yUIGI3xTFdHm28vxBYIdxz0wN70lAGwZ4QBbHVwUmUliOXVceHM6l1cmhrcBV2kJFJaMG4OuuSY
 qOPGn0LfJmQxoldgdi+u6iDSLenzkv4btIUozENpZH6UczEqT9QMXZvolSmcS5Tl1O2fOfekV/6
 zgxxzfCdi8/Nn9ilvqg==
X-Proofpoint-GUID: qthu8SXY3IRy371uP7iRtBgNxhim4p-f
X-Proofpoint-ORIG-GUID: qthu8SXY3IRy371uP7iRtBgNxhim4p-f
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a447354 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H-CQmrK-EWR9bHiRmqcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX5wJBeGZ1FNaN
 pTSMrxRfAcM6Xzw3snuMYKSs1Eq1w73V8kPe40GhOHzUrYziz0m05I18EioXSKH7V8/yqrnZQCR
 IUqLvbZbjXifMSxP+hHYvoIotFesJOE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 419566E9207

The Aggregator TNOC can be described either as an AMBA device using the
"qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
platform device using the new "qcom,coresight-agtnoc" compatible. The
latter avoids the AMBA bus and the associated peripheral-ID probing.

Add "qcom,coresight-agtnoc" to the platform driver's match table so the
Aggregator TNOC can probe through the platform driver, and rename the
platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. The platform driver name is updated to
"coresight-tnoc" accordingly.

Restrict the ATID-unsupported handling to the Interconnect TNOC. The
previous check disabled ATID for every non-AMBA device, which would
wrongly cover the standalone Aggregator TNOC. Only "qcom,coresight-itnoc"
lacks aggregation and ATID functionality, so key the check on that
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..4ccd5f38b92a 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-agtnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


