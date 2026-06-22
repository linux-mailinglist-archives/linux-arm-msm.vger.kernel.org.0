Return-Path: <linux-arm-msm+bounces-113994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2mBtHlg2OWqKogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B46AFC22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aLepsZvu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GgIZMzTv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113994-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113994-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B69C3027368
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF2C3B2FDB;
	Mon, 22 Jun 2026 13:18:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EA3AC0ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134313; cv=none; b=P5P8WVEolHDemOUkwbd5J9Ij2Fyvy6uqkjJrWt7Y0mvasoqrgSxocMCeBvJDOc1EaBcbNux39SbfWl0Yk5ZIuWp9iesj3xrr+dB4z88D8mYqgVuLciy96AsUrQX4nE41v61ilwKRcnmeNw1IacO12MWNIRFIXUq53nKP8NZHVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134313; c=relaxed/simple;
	bh=Gsf5Y/HDxD+V6bLXZ6WcyrJ5nX++1Wb9U6zu3HGNCFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMl1vQ2wiIfp1chfhOi0rdHEN+ZYOFNmcJR9OeUIboyee9pEw1q3HCqjWPqpONOTqpb2pf7hN1o9gmuR73Hj28NLORWXb7uWk0dI812A/AbGapaym5qHaNnFk3zP9Fnkcuw+pZOldBRi2s1S/otH+at2InGFovI0joNRIJx0LvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLepsZvu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgIZMzTv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGQkq1364357
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qc6SkApcoToxsNsU0a9mCd
	0fcsW+qqqlVPg7o+a1dtI=; b=aLepsZvu21Jx61Ayo/PC3hL9A8Rx/VmuMPhwig
	imm7KpaSGyrujoVKkiYsXGGv75cEir0Y9EnCDf0FDKX94K8+K78v7+WWQd4iIHtS
	IvPYhR/mYDEEK9MwtVP+XrTZgcUKPKTqF7xeZTvvEDc4SVPKzXWDqnDgKqBrOuWq
	9bOM17dNldnc7wvKI+sjIlLkhwROmiiqxIJ8VqPI6h7BbybrkfzGzKJZQvjUqwDD
	xJ3lorpdXCe+8i7vLud7wNpUxQHFR2Ea8/blWAKFm7wZTNfFbbxEWcSxjUHqAD7g
	7IbQKVlRglVCXmvK1b0av5t2SGMR+aynpGvil83M8oeRJAsw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5pr82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:31 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963aef8141bso1137845241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134310; x=1782739110; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc6SkApcoToxsNsU0a9mCd0fcsW+qqqlVPg7o+a1dtI=;
        b=GgIZMzTvPh4eL5X++K4WLeOZ46ohdEKQOiDRC/OgCL7gv6aqdhw3bakiZYpH7apNCv
         bgzRKFoZDQXRhxqt25hih5qethczirtS7I+RBlgNq/vDx6Duj/QoYdjO+rrM8TJ5qwV4
         xehhp9Bu8Cr+oFGnBDksn5bo+WVe62Dt2NpbevmULarmYf3nvJKG1h+KNRMsFQVkhZ0V
         Epmsq3MtTQv8RtskhEBQzM3bujGvRUdhQNTu0c9QS2I4qHFfwS9eRDfA82wLRYZHumY9
         E0vVxASEHJhaIYphR6aYtboZGFGI4aUkbSCbUGjjv+WJJ4kukL4n4KXXRa8RLMHstd3Y
         HT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134310; x=1782739110;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6SkApcoToxsNsU0a9mCd0fcsW+qqqlVPg7o+a1dtI=;
        b=a56RguQn/OwoCOEmvihKzpW9vH0KDtj3kEMlOEdpyMBca74XwTvGG6OABBc6JAmQPE
         ODIQlzXREk7X/NYbJJo0+umYPTWjaIlPbdkxQCvBrl3AnZT2EZqQJNxfvitA5QLeON/L
         uPl7f7iUEU3PRaFa8+QgV5aG0yxwhWIAX/+K6Z3IIcUpHHXt3CG1U+Sqz3lTPj5NkimU
         dO2lq9gCORtzxRXLm71a04JwnxZR8BIoieK9l1TyugNEgYwmhomKTURwR3LhVpk8yDy0
         EE2dUR+omyMvbumJWa/fr4yl/eX5WpVQ17xQQ7uWQsI3XILzO5mr2n3QW7kTMaAEijBD
         G8WQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hN1016wehdpgz3xbC0IxxD13MkTRpijWER0guEVjkPO1p+L2Aty7UUs37qCEUt0cLtitjw/EGHc2EeuJO@vger.kernel.org
X-Gm-Message-State: AOJu0YytcMjgdHL1D3tz5lzuNph6tfIL2keLPPOetIOu8Mf9IcrupTSc
	u8NvVVULNWDUe7VbGgiXraTjzffbs24QFX+CWryeTdN/xolvtwCP9G27TePyzUUsXu6sofxVnu4
	PvpIVVGt3Ccg77Q7/eIMP7xCw1wv/tv1LZwu4OgeS1wCLz0nJdyhR/Xd83taF1Yp29NtN
X-Gm-Gg: AfdE7clD/RvdfIzCHSlujI3DFR+XQB3Eg9RwoW4tAjLrTSu2yzkf+cP2BQE4515erAG
	H1uUz8DIy3/iXefdHUioFP8/rbBATlwXjzfmM3aM62p3ncyZxXp7DjKE0fPsyEAipLay802aHK9
	pKGqLm8QdyVHQXdsaTbWjfecdqg0KkAYoRek2iEZ2xB7Aa8JWo8rCJ0WFmbvt2vfuna41QGA75I
	CuAtlEYj92GiWNz9p32lYAM1cpI+O47cMqKCez30pyY4MDwBABMx3QLrEgkygan36EjVzkgYZ3U
	3DiFo8pWrZd7W8VkCWMndWZz/yrlrfGKuC4+PPPV9md+BzuMpAk3mWB8dkjDhQiOv411wth4Wbq
	gj3aJ0uSv2tEjDMtR1HPuYIF2cgC9n54V+aKyH5vZ
X-Received: by 2002:a05:6102:1613:b0:726:7bda:b8c8 with SMTP id ada2fe7eead31-72b64946dfcmr5164988137.5.1782134310334;
        Mon, 22 Jun 2026 06:18:30 -0700 (PDT)
X-Received: by 2002:a05:6102:1613:b0:726:7bda:b8c8 with SMTP id ada2fe7eead31-72b64946dfcmr5164936137.5.1782134309887;
        Mon, 22 Jun 2026 06:18:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/8] crypto: qce - Fix crypto self-test failures
Date: Mon, 22 Jun 2026 15:18:08 +0200
Message-Id: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABA2OWoC/23NwQrCMAwG4FeRnu1os24yT76HeKht6grb6ppZl
 LF3txsIHnYJ/OHPl5kRRo/EzoeZRUyefBhyUMcDM60eHsi9zZmBgFrUUvDRIHf+zQk7xyekibh
 qwDkL6JqqYvnwGTE3NvR6y7n1NIX42X4kWLc/rtrjEnDBrWmkdFJrq+ASiIrxpTsT+r7Ig61qK
 v+l065UZgmNgbuyaI2zO9KyLF/NyiF1BQEAAA==
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gsf5Y/HDxD+V6bLXZ6WcyrJ5nX++1Wb9U6zu3HGNCFQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYWxmLJ8XGOenZWKbYM/FLlqwhiNh503J6QU
 HfbiysR0O+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2FgAKCRAFnS7L/zaE
 wyo9D/9bZjRyjMnhp5BiyHYsVTqsuqPXoUoD3C4GcPF40LXRB13QhT1/hxqkWPK2BvzAzli3Yj+
 ulHyNoN80/bEAGFSHuq08MTrBhRWHgS77OgguSBpyvhaDqphdyKOeZwPFyCFT5Bq5uwks5Zh7UD
 O6pyfBJvYak/5kX2aBEKlBjkIfaPEOyf2Dd5bg0s8PpLVatKfmGUhb2111A4JYbQn8wrv9tSJTt
 zuLSG8l1oMeois+zZF681ebU7TB3E5cpJ5FIknmwyAEOIrZKr/xQLwvQ35TA6tDHuLe1xITcvUT
 cIlYatk/qAyLt1GzMLhzOIj1AUIJjC55cHjSq7kvicxDuz8JoAnSlkd4U4pXAD+atIlzlV/W1c+
 a4nLoMoDfwtSZYkh6MEagmTHPORYUiZPBWzb8lJCWSR6zrMFUNwtE9VPxcl37oFxfRRgTCYWXkA
 5Gr2wiWSBkvle/0UxIatsr3cHIm5UTi526ndXcofU1uFXFW4h6AtuAk/6GNmQsQCzU8ByNGZqV3
 K1NCFPl3GQaLHGp/0/qYObZQIDCJ4euVhc2QAAu3WfAQQzFRo1P0juzM6fgT8j9f7QqfJF47hyp
 E1UTwVzb+quVJIcynuJlrEKzbzW4UmXDCisOCc+q7AN0qJl/uJsyvQOV4rT8QKE/p5tlYY8PQKC
 UA59F5Pch+4wRsg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfXxRMBKJ+40EY2
 8G9nWH26WyeoGCstIGJl4Xvij1jdEPkkbUR+FQfeUPY7IdyGyfYepIidJraQM4481ONtbZwbsT8
 +Ir0RVEjEbPrSMJDOb6U4XtQ3EZJSVIZdpMq4C7UkidjO1pJ/39RzrwzXordJFG6WuMVogPD5aw
 yiBkWHLS4cSmbFtW747+28vxdTz9bhzld9wrSfHu48TnwTy4unCFI/49CJ2wNjwyJIZvCJBWdgM
 2wcUKf5bY5KJ1mULH7J/6u5vtEoCwXHPrImkRM+IwuURUqbqycJx9rcuGjOqoredD3l4yDB4TPO
 rJhgqJE/FJZdq6/Pi13KnQABp6fzwbaBvEizeADO3yZ2X2kJhc1SGOmkvS0ajoNT7AK+7n08J7d
 /80y4lBLw3XiY8g9gaSrTSRF14LdV4DP1cvaDEVn7y0FXz3xBTOMtTYJ/E7EacGwAIg9v7wLDzc
 lbVmUvCq3rlQv8hFEKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX/Syz0Yra2NIr
 +nCAjk56qRyNqSofOg681Uw97ZA7WWccjvV8fp0/TANRlRLdv2JXqp3WZ7au8CQyfEp/LnuQ7EU
 NjNvaWH86pihprPVxczNRn5UEaXUcCw=
X-Proofpoint-ORIG-GUID: 09Tuo2T59-7da-o10HwlD5zUC3zsO_d2
X-Proofpoint-GUID: 09Tuo2T59-7da-o10HwlD5zUC3zsO_d2
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a393627 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5rERACauPDyaBIpbJ_EA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113994-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF9B46AFC22

This extends the initial submission from Kuldeep.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (6):
      crypto: qce - Remove unsafe/deprecated algorithms
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 drivers/crypto/qce/aead.c     |  88 ++++++++++----------------
 drivers/crypto/qce/cipher.h   |   1 +
 drivers/crypto/qce/common.c   |  55 ++++------------
 drivers/crypto/qce/common.h   |  16 +----
 drivers/crypto/qce/regs-v5.h  |   4 --
 drivers/crypto/qce/sha.c      | 114 ++++++++++++++++++++++++---------
 drivers/crypto/qce/sha.h      |   2 +-
 drivers/crypto/qce/skcipher.c | 143 ++++++++++++------------------------------
 8 files changed, 173 insertions(+), 250 deletions(-)
---
base-commit: 7f5e2941e7dccc9dfaaa23d0548a40039772a284
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


