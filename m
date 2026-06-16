Return-Path: <linux-arm-msm+bounces-113278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u+CuA8qTMGqZUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A529968ACBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:07:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FfsJy/xn";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j0aZyNrJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113278-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113278-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67B9C304605A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB2117555;
	Tue, 16 Jun 2026 00:04:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677B8634C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568296; cv=none; b=IlIJZjqgHD6jxChKzFLtzkGt0MU5D7D/HX1OJDr4g+S43DfCpWBuYmihnl/FSTy1vDW5Ma3cKDDcDNiLtk5nVzBGcZi7xw4ZDpTwxLTByHSwFKXwfg0J4TvcR4YtEyvj21dsG2VIHi8h8md7XS86V2YURfON46olKP4yYmUpmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568296; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooZENg2S6+tcffifjIkyD8l6nAtiXAP7qJXi1hgvP6NALiqJgjGi0lNqtCiUScfrbB1q/2A38v3pc5xH7H2Knaca2fdjJqo7UesuLEpdKGw+MhgfFADDCU5+uQAIkMjh4yuA2IxnlJbnxs5HyQrR8zzzJ+CdDq6QJhOONj9Iam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfsJy/xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0aZyNrJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx7WS884046
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=FfsJy/xnufqnSeKf
	Xze1sj8sFewclvbfiDjIz8b1Ey0OQ2aQD6MfQa55DRAYX2ltfl7GOeaZg1H0bkyj
	1cUb8/PIroEE71i/ytKj5ziy+KZ0/w9Nomc4rQ08Pjso9zMkTlsJ4LKVrtKPBsqV
	d+hr6RmmeQO90PdA6HZYYLkAxFCAAKKisqTDz+oaP8irI1M71la95XCQ9AfRuS/o
	seEN9YqtyNxGLiZVTW9qxrJM3L0LkBXoP7SErURtx8/P7kDFRGoQyKMuL+M6/IUQ
	134H5d4QNOscV4YE2mNCRLO3bRZPArHHzHIyCun60VzKyvSCqStl7hu2tkY7dxSY
	WEeEMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73m2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157c8eb597so629734585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568289; x=1782173089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=j0aZyNrJvnTGq++YQsXSWFQ189kZ/8jPAOWCAMduKcBqv2Aw7k6wd1FlXOnp3O392H
         JaFW+yx1gbcJG2TXHsEYqkf0ZRCgjgCrjaHoaUclCAi4thNcHkpgL1A6haXVQaEkHM0e
         z8bVndarZIzPNxt1+W16VsuBZFqy1wEGvlmps2RtsCXWLYKoh1tG87Wq26sEBpaNrr97
         cFziqlwqf6QzR93UIEKg3lOAmpZbMNql9IKzTM1v5kbvJtcEhPO0Od/dKDitekjM5k+y
         CScR+oBIvHW+y1f7UxRfO0lkUJu8t58c4QVsThP9kG2sAI6bqDce+aYkLFoiopTjojRN
         OiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568289; x=1782173089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=nPc6wdNl3akDzIB3ao8yMMJCsgBU+4XGhHFExqcxX8HwcrcZNh1+qs2eM+X3s6SQiB
         Q3W2cA6I0uixu+xlBGHkRUZKeDajbdo4AOPzy6ps/lZEFtI6RCZsEbs7JejqpkR0odE9
         J4ToeSFJIG/Nq0jmOJdDUod+ZEQ3UGMWiIvZ41Jahk+71yaWoKaWi38Fq0zBEUEIjm7D
         fdk/edd6gw+BZwJ/HDaOBOSlHm10f49z4miDc2v4jbTOhNRQEysXbgwVgXp8CmshQrP2
         ELvwQbwJ5UsWR32Nke7EtnR0VHzOg92/bHOWGRRCnLkQPd/nDex+TDe2pvgT752u0L9i
         BCbw==
X-Forwarded-Encrypted: i=1; AFNElJ/7GkVvJcRV1HW2Xw+ZZdH7BjpaxE+z4gzlq2sBZB7Y+Ftk+IW8iny0pcBI92Ynsz79Qj7LIVjDItkEHdmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgCwow6ORswi8Z2mVwqHvY7pK73b4MVTy/ksB59vyrIwb/Xq0
	K2wOJe8coOVlA/Smdkd7Lw+djN+alYBw8RuoatxCfH/sS/mxP/BsDufUQ5vZzxcxpUYIiV5c4pN
	VpRiVtTCHiWjnYv/psTsPGHTk3C0dbXtdYXBF7y8htgTyPO7AgSwY144Wt1DD+/E47p7t
X-Gm-Gg: Acq92OG8N2O+r+2hw0MISeol+HGo+AfsO9U/ut/bUq9LYRy9hL9yfkzPzZxEak+QbFC
	uUlrPINv7QsD1w0qo8uVGsHKBUXSDPTcS2Lp9bwJGxNi4hgZ7pyO582m7SjEjaDqTN9mUroJkXm
	6JDh/qrUB7nFCeehApv23UDUVHGikmRUmLXfqUK8MqqE8PtKk6RmlKu7StZywe7lkOry8DoM29j
	YaMhOA6mGw3Sxt3jAQ0YFgnxhPXHrENOGeny4VJwCt4UG2WI9iuFm4+6rbdxLTXrO0buQ7WdQ9S
	m6nFpO5mNKlqWDN4wrwQA1KT/zmxfUH1UtG/OSTV9n1KvnaY/hidWgU4MZe4Ke8Loutp+Fwy8WO
	K8A5WkChjabVCm8fEZqBcmTaQQpd4o2Wz2RzxFjUuYqC0YgpxVjVjHFxoarxWs65B+kdl7+iFpb
	zJ4sIR1Nclxl1ciN++WjrzfRDejJDOiel/+Mc=
X-Received: by 2002:a05:620a:2584:b0:915:a762:2735 with SMTP id af79cd13be357-91c47799fd7mr210617885a.37.1781568288721;
        Mon, 15 Jun 2026 17:04:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2584:b0:915:a762:2735 with SMTP id af79cd13be357-91c47799fd7mr210611385a.37.1781568288243;
        Mon, 15 Jun 2026 17:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:30 +0300
Subject: [PATCH v5 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-3-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMO5NJZdxcfI07EHv74CzfYbRVDgOfSBpbS8
 806WVLBtjaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1SjLCACJ5iSuZLJwO8U75b0uzLQeYt+gmFY3mI/wLagM2FIkoI0BQ96Lwsg752FdWyVLN/zljXb
 khsPudaw7J+KmYEAAgzaUXnZvddLDp4vDrOI8t/4YT/DnxCZnkplOkz354R4JLctbM4EHkFUMUk
 UnksLH8SLokRxeJjTHQmHYPI/N+XlNmbn9o8dJTzFApDyGRyADxut5VoQSuphwj/YGKiMBegWjQ
 qaD7iEG82M/szol637TL78y8pZl74VbLnDd/RDyMasQbBSPucTgQAQgIS0ceAYduk5TzHXPwnJE
 tXNL2gg5CxCPZhysCmC39A2p5q7WrWAPk5Qla8sqRl+za7ID
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jW-yzhjRkfMNZPXB_onY7qguysA7X4Bq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX8ByO/6G7R52t
 e4CY4Xgaek0B5AF5Lwej3i5nvlC8aOz5kxeX49tI0H4DodXnhERume12mvFOsSwrPQtZCtsGcLM
 Vf0RUAHBXcBq3qVwc92CdIfs3zVrJa8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXz7fv736M+Thm
 ututVJG9TCvMvLolHystFsCQL8dbpi1JjdLSXQydD/e6NlDnbLWY67+CXeBuWOxHMwErQhdaq34
 +ljW2ey9+8X1SHfIvQzMM4kfg20Pcl89UmcVOzsN6a5AXPB350oEbnBUvhhg2GJ1S7DUjndZhYs
 P0UZNBt+T/Owh75+Jq74YK4gMnNGqbsZbiOtw4Bzd/k9hqJm5xYOYblLHM5rFJ5Hu29sCbN0XgZ
 NPoITpd5SQr5rM9wzI/yEVbe2u15MwNHdt8vH4qKkwm3v2abDBH+ipXnWGOLXPGvncn1muR2gHw
 4n62Dj2FEspwrOTX+0o/GO/JuagnX/O5CtI1M4FZF34FZn5Ij07gdLV5llcjCaZz5/r9KGiwoPe
 C43iziWcp8GExM+AK7t2C3uexuGBedgB10wI6C6kV0UwsihxZ+q7WJJtQBUor8RHF5KROdmjIk2
 OrH8DO2SfHCW7b7kCCg==
X-Proofpoint-GUID: jW-yzhjRkfMNZPXB_onY7qguysA7X4Bq
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309321 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113278-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A529968ACBE

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3


