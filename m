Return-Path: <linux-arm-msm+bounces-112223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G9XyHXg3KGpVAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3326620A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F5N99VhW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fb4pV3OH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112223-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112223-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4CBF3148678
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D134572F;
	Tue,  9 Jun 2026 15:32:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD794481ABB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019169; cv=none; b=f300/iyDYKINzUJ9K45sEvHnUxQ4PIUiPUs4GZmJ9NV75Bt8JhSnIkpdeoJgTodbby+s+u+V3s8dOkeA+lL0ibGBiv/V/m82pY7Qmfne7ssgNHxCEGBc5ZMsDLlHLZANlqarGdEySn/P4F2XzdFcC27Auiu64E2TTAxotC/qII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019169; c=relaxed/simple;
	bh=A7GoQjWhXQ7RHWuKuc9bRKN88zKtGeMVd+Z9hFoM7hU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lHbinZ2gZZ5d8IqGoOTxabQWtz4wkO6RwxMPRG9irqpiJgb6wqp6PlO3jB+KgFamxhrIDK0mjVUKhVPPs1fdF/5aSS3eszB2+aYvE/OPSCa1LkFdET40ug/5krAlICvnzBnC+pTqwxL/TnNigLmKmY2rASOYVWBqf7aThvAXjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5N99VhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fb4pV3OH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clals2247950
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LR7pUiOtXdsZWwJIp+kELZ
	Y/b8Vn5ylhhfHllSjIREM=; b=F5N99VhWOmRfo8hYr4nXO4+1hNWbXfeop7oRQx
	ppyC73YrnQKMgNylTj8fVLDZwuYe4hcelmZwhSmEoKLXljzvra/OLTo67sf0CIzS
	D0HigTpmC+zFvATysi8Eac/MInIvreUIeWX0J1aV1dBRY8BHKtT7ir3irlMX9SOQ
	nuLA5I94llii8zin02SlRhvfJjpxTlC3zpNO2TCWOUCu0TlqK97TyHJce7q4Lv65
	N4Vad5dHv1guKNv6h9A5znEaJf2oMXhiPuNAL6pKaO0ZHqEx7BxBM3ACOFxxlEYd
	sEQMfpp74ftFJ+MIeg8PjNnnPcRhRd7MU0D7hThhyTJInEKg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetjbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:46 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e74781faaaso2991312a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019166; x=1781623966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=fb4pV3OHH49ir70LcrFQcWgzw03LUqNIs57eL3Gl8Q7v1C98wb5/rWJOomPcm4Rsgv
         2L1Lljn2xRmBxaizNLemvS6DTEKMKBTb4tYmkxflrfquElfCm5wiVqhoMavCvGI43I4A
         1wO2YLheSPW2Do49ePnbHS+3hZwCuz1Sn6Kn0NUFU7bT29Yuu6s10tUkuB+MxZmUTuTU
         /aHK+S9t5MOrQkfHwk1F1Ckr6hgPmnzFxfThQwlM1kjZtc6re5eynUUXeesXzC8LYUPb
         MeZYvjcYWtN6DKIKqcjU2Nkoop5RzoGeSyog4TMnx6LGEDTqJprJaPevPr0817g2XYwq
         tTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019166; x=1781623966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=mxVRzcyl2TtmDlOH5imURQM+kR+ylTVUla5xEw+3nsXAvMw+wVu9kOiU3vSQ2/g+q7
         A+oLD7eFX+hz+Zz8G+G7hVG4N6IuVXAfsKOp30oy+OMmY67O0yUHpFA8r/XVHSsHH5Q1
         LsK3hS2sjGsYOXvmpIuQ4zqlZ+gBsfdAROOrLCSYtIQTH7lOVTMJUKKebVFPVTJZOHuK
         COafvADqD2uT3aFUNTstnjqFT+Hv61aojXP9KHqOfRmSYOO+Gw2LVgoCO43jcSe1fEjH
         +n1AtOZLTcTQDfBzg4zsqWvKFjBcQe+H7ojFzT67SOH8c/LubfKCChoVt+y2UmcdtzfH
         tL9w==
X-Gm-Message-State: AOJu0YwMqj53us4slqZkI8elpFptRA3ivBEqQ69vbHqVe2L4t0LZ3fAz
	Lq4tugkemHyHKqdqwes8PZ7EGC9mQf/FnHiT58O7hzNbwAwKw39VAg73fk0vLqoXjWo2BLsH+qu
	Wt58ks21o1VONcF1s9iwAmYsGQ9e/tYPBgiodGkj0JItYeOoe5Q7FkehFR6UBIZb6tr7o
X-Gm-Gg: Acq92OFKFxjDkIxZMuhQyc70xsMx/v7zcGbIAi1dOC3AwDArkmXAJPJJNGqwVrDZOf7
	UCmZP4bPvANR+wwyIm3Hv9CqL8yMxQrBZJo+cykXp3JxEZPDQBK3U5YjG92vFtkPye0Ae4J4yKV
	tktgAufV6CAOaLfxIHcxEdL16tsFsEpTauaou8tp1b9+Xyck9VCqke3MnWoEoZTwaNGG8DNSRhn
	rg6mRee42xSi33+VOYRdHd0D2kC9dFeskf8UzlgyIrwIC/+CRJA+H9ugezJaND43JrlfYYkuvys
	yEDWQb6BVVX2qJdKPtncSZ8xnWOsM8ig6RXWma4cPFcOGkhq5SRlLcA8XBnqimevhhnloJMHEHF
	eyvhSbjpGoMUNrqZOZtOOMKVPZinjkX7TWEJDvq4cf8yoZRDGg8GHXB9+
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303933a34.20.1781019166131;
        Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303885a34.20.1781019165679;
        Tue, 09 Jun 2026 08:32:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Tue, 09 Jun 2026 17:32:34 +0200
Message-Id: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBAGX4X07JJCKD+efA/DAbZbqSKVLhAN4
 d0tePeyySTzza6CyVticY5W4WmxbN0QID1FArtmuBFYHVikMs1lluSA/QNGdE/QZJq5nxhKLHW
 lctNK1CLsXp6MfR/Na/1jnts74bSHdqOzPDn/OZ4uye796y8JSFBFRYXCDA2pi2OOx7npg/aMw
 xH1tm1fz+PPscsAAAA=
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7GoQjWhXQ7RHWuKuc9bRKN88zKtGeMVd+Z9hFoM7hU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIUNEZUAwYJ/GEmRW5xyUdgf5U4Wc9gtJxLs
 wTmKqzs3GOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFAAKCRDBN2bmhouD
 1+OnEACKy72HGcg6UVD/PLQ22Yc8fvpcEZR+fOK6OGFnbp/d7ZmOTh2mqm8iAhkh0o/a50CujSO
 FCQDHuOzRAfxvS5S7doPFrjPXvES0uqQV/CykC5mlg4JiCW19tYiL9x8DSp7cMabSgOWZeGpQu4
 5VIiGZ1UZjiO5mNN/UP7riOYSgAfDEV1S2jCrtQYi6HLoHRXJZrOp07wYeuyIXyL8eCZev7fNP1
 4jEVw+QX2ObuRyYmXRGgNtRD6TmtV39aFvnLpbLWthQaloxj6d3tolvg737enSD1ohTnPi4lU5k
 iZGo7O3NNRyXCfa2F7BN9EGwcG+FpeinNwcO6R5FVQmKmvw8d46xjZp936MxZypIIwBDSTuzY04
 5pkXD39UBVW9MZ244of5roC8dNfICdR7bd0wEU2G0rXGH2rKIvoOl1T9Tjh2j5C8OaQhMefmhra
 T7AtKgnp3nR1iLQG0/IcWHmEFUwSs4xFisuRvjM9KaKeN0iqRVriG0YsqsTXD3N+NMQQP1LP4Yi
 LTscdd5IGyqoKwJMcyk/fZrawJhbMjB4MxA/4VGlSfsgpY/1om80F/fDY60XOE5DpXzhOPk4ou7
 2CdTEnySEw0jrWGrarVlAIVQkIpJlw5zpahFA9CtR/cWlCD6NvUCnuNPeLJUMEEZkEp8Oh9FrQX
 oohsHQUzuv8hiJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a28321f cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KTTc6GEDVJjevZXz-osA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX8mGhIA10UEYr
 vXWwaWnkxZiAhMaungw33hyPgEzJBtp0zFhaIFz8CwMY/6TWE1gGmgsJGS28/MuZeWNqrca6wh4
 dqUWnCR0PkLyXBrI99MfYFYKCOEoHfuCT5gcginFRmEWP8Z9p0BOGzY+rWDcBbUcv8yltJ6PBto
 G57GH3V5TgcDlaLxdIbG06oggbqMbYYIxiW9To9TpCBL43/rWNguV+Cab80Gtv0D8oxFpi0vCyS
 Rekix8PN+SDPCsZnPzD33Va23T8xk85VFbwnJ1A/1BMI2TC9RdHvKfeaWubSPDTtdxNTSU/NSF5
 GMlIM4fqgJvgu3IEQBdah9j7+xR1A5RQRmh1JtbW0ZL8/J1Tdv4KVXQelcaXrjKw1g306wJ4G8a
 ffrL/x9FaiWJ3LmxXSueiXLC4g4UEYrtxTde0r93nYaUe2OKFXsTFUIwzJXvADDQoxR/J3zz4Ma
 E7KKHOHV9kLg8tPekDQ==
X-Proofpoint-ORIG-GUID: EQz8h9SQ6qFlX2UeG8ajXDVjd0aNIAUZ
X-Proofpoint-GUID: EQz8h9SQ6qFlX2UeG8ajXDVjd0aNIAUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE3326620A8

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: 6eeab89909ff9d44745e884b65c8e0964a9355ca
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


