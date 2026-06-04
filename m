Return-Path: <linux-arm-msm+bounces-111245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVgaLMmpIWpZKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:37:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D179641E71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:37:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kUgmbA5Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GAq6uKlS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D933307A077
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD048AE33;
	Thu,  4 Jun 2026 16:22:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0848B386
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 16:22:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590164; cv=none; b=uIGbcXRxiAcibj4KLqzGnx6vVFPtjT2QDFtVXjjAPC2O/ZnxJDgZ9FjAvM5quf0i06AIfmFElO36iG5LkD5Sfup0+/9jVE3RzT0i7TV1Rq/VI0l9WoX5+H7JjCQBw4QvbcvmnZaww7q5m5UjFfgtMVZOvJ0kEctA4B0NPzBWxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590164; c=relaxed/simple;
	bh=XKrmOUE+ITe0K52I3f+8XQpNgOZVciYbk2KqzJHOOj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofeXi9wHbb94WqRXKIpWrZsdK8PIIYUOTBNhPzbvr9g2XKb3nah+6IDPy+6ACypgQPmEjd06CFiX34c+EgAfXU1wSrdYjRMoYuhvbNsjszovO2uSlpKoCQFXON1X47b34582alSyyq0B016tIhMPKjT1XTTvM25gFh0HxRQq3So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUgmbA5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAq6uKlS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJrJn944524
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 16:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKGI1tkayHJ/4zmc6j63m1NJbgsynd524kpMerhxDG4=; b=kUgmbA5YPEkzYKoJ
	8qEBlEWgjXCABWUgHI5lA1iNEqxpswvx73fZ3pKI0rMWEeVhVEooj9FElOjGqZZI
	HeBL8nTBCopxi/mS0LSpQgVgdNrj1VZC0nq7ztVCj0ixyNvvxCHqurbnIJ18WdV5
	jRPtVo/etZ0eBRk1Y6TXfBb7PDauoO7ZtwkDLkjTwgSmXtDx3IJezRZanCEbTEPv
	9gG7PE26dfrBnP9vDkQKKSGUz3MlFHoBlYkYp+IjpFAZ7GT6m+yXTdYuwNx9Jgl4
	Q3N8i3sgy5BHPDvePu9ZEYH2Ugfe8lh9V+2b0SWuZV5a1yDTntRGaw8UZYpYr8k6
	mgOZ5g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d51d98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 16:22:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a95e1250so396568241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780590159; x=1781194959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKGI1tkayHJ/4zmc6j63m1NJbgsynd524kpMerhxDG4=;
        b=GAq6uKlS/LVbsnOxL+dwBMsSw/tr0PTpb3dOOwZD7EFA7YcTm4ojYVJsffRFacot7u
         lUzDky71sJTfjlIX6sxje9eKlHk1j8y8MRoIkuIPkHH3t6WYuEMN4mR6VbQ9kJ3LE6ax
         0/9c2X+nXYP7aITfrwU19NRKXpExHYczRcSqrj6xN45kU0mYMivviNhZs7YPikpJfIdD
         NQFkHd7l931EBrAethpwAR0s9N35qBG1Y/pIKSRmNktVn7GnX6UGKGKNEBWHSuynWsvr
         hXU3AsE+X2QUtxXOkui/KF77Yflwkw5bM80FMmPKGK62IggjjMqLQ1XKsarlMpjSE9L9
         sAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590159; x=1781194959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKGI1tkayHJ/4zmc6j63m1NJbgsynd524kpMerhxDG4=;
        b=Q2UcAKuhcoBHNA2ihMmTkAOWUi/2YXJFwWVYs1XSa8Caq3DWzf6QbJFN7x8fv6SpBY
         NGFYnYs6fIManDqaRXwi4lsbyP6YieGCFBeGgvQ5OHlWmKUfvJjowLU/dN8+iKLBriUo
         vjQVsm3sSUzD/Nvm3Ohn1R903pQQcN9Ve8Ffp8/fN5S9osdVRvUeHK5I9QsAAcigA3kn
         VemsDOzhdX69lNANoBS8jDOB02gd3qw/Ya8kJIQDeKlSV8j5ZFCpm4hxERqp2G3EVXh5
         gyd9MRIVnPUTyM0YWSXdOqYJCK+VPy5hqS23p7suQ9bWgWfY5O3wFHsXpNFK6H1qOcKe
         wt8A==
X-Gm-Message-State: AOJu0YyTyw8flR/I/WaHmiudYOITDV2upc9cM+FmjHl+POyMV85zgf84
	Zq/+3ccy++9mrZk0KlcZnpOEpJMDbXBQdK5+017hcUn5giJCnoTHrmlFJdchNf6wMAvohGNlKY+
	JgXTUSvO+O/lYEU6aV8wC0CFU4LslkUp12JAmZz1wxspTRXAfxUUIPWESFo3JSAKkYy2H
X-Gm-Gg: Acq92OEOXIKIw3m3ASOkozUuBfZkgOIPQNr5Zu1RRWzbv2Lja9PlxsVubgCDatBYIZE
	yxFSRzJ8yZHjmGPoE5Bm9Q/vi4eFCHOWDIV0QJkb4e08LlhWSD/RoRshouBEQyFjzPhFW/iLoC2
	wfLtbeUPe9pOr+zRovIVsu/9/J1cpOJGJMeogtlRDL3hEx9qeAHnK9UMYjcHUqfzKdxbglCGyBq
	71uP4Y8OyUqFkl3GqMHXIhbSvL8CYg07QUSD1y20qBAnh96ovNCuSnAkmwKSv56vcSVZQy0aEDC
	4HJoTtzmonAyPxgod0y4TpmY9MSRX1qsLbLpMYEeP41dHl8A2T8T9/cDeBvekFPqLbN982XZwvz
	Gmhu0OHPCJfcWTrcUxKgYH0Zyn76MLINEZUZTMU9giGJ9Zq4AwrjsmkDFQBMV3nLjTe9lIJNtQW
	AHBJYB+sW7KGAgxkDp0nHkTGK2PdkMH5PfEWLaCboGK1lMUg==
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr5618166137.6.1780590159143;
        Thu, 04 Jun 2026 09:22:39 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr5618115137.6.1780590158504;
        Thu, 04 Jun 2026 09:22:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm17591591fa.29.2026.06.04.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:22:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 19:22:24 +0300
Subject: [PATCH v7 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XKrmOUE+ITe0K52I3f+8XQpNgOZVciYbk2KqzJHOOj0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqIaZB8KW2EJaZslWv4cgtu4BtIbj4ClbJQflSg
 BNh3H7S0HiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiGmQQAKCRCLPIo+Aiko
 1b7UB/9WRsG3yOEdy2z7QpRpAjy5xLS0+pDuTCD65G9a84L8W1/UozRyuhxDaz2PvTKPYdOspLF
 EkOOglEk96ACEuMTjOzPgecq+ozYKVQXGHp1txCaY1NLQCnT3fSYxXX4/lYILH/9KDUWCUBaXwS
 O62zgRGLw07XXOees9Y1+VjWsKKEGosLGUGCNAcW0ZhhSM9Kse1PYWBzgE9m1v+veIXnhPiv3yZ
 gG9dvuM/PDW6Lt9ywCAxrsm4w92z8pVoQGUcwbc2J88dIu1d3pDHS9F0mOGNSqqQ716CF1TIQD1
 ed8wwf9VgAjjmDk9+utlciBkdkszso0LYBvr9tg5ypn1P0L5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HbgRSbWYBxBFlLFIfW7MUJVqPoUDm5D6
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a21a650 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE2MCBTYWx0ZWRfX0br1IIFSxQuG
 OuYQu3VDbcDLB8/3guXAgAJC0eFB03Svdk0doCUBMvxnJINuHplxDJL70tylBxfuKg34WV+UVSz
 T04QQwO/2uGQ9uGVFZ+9915TlGzVNPSA/OflZCWeOaS7Ohx51zewzJlKNFcEVlCnYYYa6So1cGj
 DedMOliTMpz7ha6XiftKrheHXbYJfYLDxbtf3pgBUjLryK0N8iMWmL2KkEPZ4P3cNhrMpwNqSXj
 EC+cV8DnsFTAcPD9I+6Mc9J8NIvAMEjL3KlB4oKT3K2QSSW/31nwVJiA2GwWFJ0sGOUSaUvabcj
 qs/MqKoPAjRg22tDYVNqOmGw0LlV4pwDHEkI34Oru90V8GLYeOJx7lRBaZlIPQmnippIaRo725h
 ABs48lS4cYpPAPasJPgnTzGiW1r7fBNKVEbTkuZaa3biaj23D2U6u4J4J/Px9T+o8D2NyB0KzvS
 rSPAvdNRxp8pshooQ+w==
X-Proofpoint-GUID: HbgRSbWYBxBFlLFIfW7MUJVqPoUDm5D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040160
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
	TAGGED_FROM(0.00)[bounces-111245-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D179641E71

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 6150380795b8..f6044bfaef87 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


