Return-Path: <linux-arm-msm+bounces-114893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C1PxDCEzQmqt1gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:56:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DF6D7BB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mqAyC2wx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AKo6XTrd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114893-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114893-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2993F302BBBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046CA3F88B9;
	Mon, 29 Jun 2026 08:55:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE43F8251
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723329; cv=none; b=tgGMGqiOXVFzkmClP47rIK9M+v3+KoL6wI7U9SZaGGuQC5XJJHdDojyWS6p0tGok9Rd2dbqJPoh1v1AZjvCvgPJEXmaXE6pWkJejDCVJNiRby1Pjp+Asi9cTsrDjsKFUhIsJQZs+dfgXwSwSo2MBTarxObcFj2rpDMMjvLOCsCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723329; c=relaxed/simple;
	bh=kVs08z+XFS2GVHk2vADgl417lrrsJP4YUMF5ujIk3uA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tq2OOtST0m/qhJuMUM6Tbf4Amqmd+M9bHWdLKlL+2L8eKvm8OTODPgPuRQYYqUvUkbcXoaQ11aZ5XOEGRpBRQ/yduAzct05ekDVLBZxXSkENl6/ct9ITKqf2xKcx2VuVOSxxNXVFkeLjvNMx58/T7xPwTgYUM+6IHauVqk3XPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqAyC2wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKo6XTrd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rIYO2097150
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ROn9v0tvgRhtd8/CTMTZwI
	APSCSAz0ITaREV9z+qQSM=; b=mqAyC2wxQhZS2ovM9mNJAg7mTkn2NP/ArBRizo
	HorI3yy9cIat3+pLF/BEGIMyk7RxiCKeIkAFd1IUpDthEILE1w9X32KzI1gUY8U1
	Sg31Ttl5stwiNLDI06MFwpS9jge4RxzTjDKBnzt+QAvUd59BDvv4eSEeQeYL331e
	UXa1aivfstgStHG5uUcx3/Lri67wjkG4KhjDRHZAd9KoAAr3NbiAUcZKucR7+HYO
	BqeguYzbMNs4xDq4Pkd8p+ZoJ0HAng+AScYFchvItcFG4wS2Dz54h3fLbe4ERvfU
	teDWyLJSGouV36nyZgxyHLvBJhHEugSbwagYZtnAkbQo9ZGw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7wfah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6f09f03aso4003739e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723326; x=1783328126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ROn9v0tvgRhtd8/CTMTZwIAPSCSAz0ITaREV9z+qQSM=;
        b=AKo6XTrdO5+hVuXoo1u8sycAyEeYqkrBW8r5IVVpYyZ7G5oNgUVqq/iA70LnI4zSHJ
         cxwG652mMSUVGbGDHskC186jg/71YLxUWsRGvFdJlradNURXnGoczjhx2WgEkNcppnz/
         uW9PR+QSeNf+gVKDcLpFgRjE6s068cGjdw8bqTd7+MzYsnIf6GDQ2diyIwQBwMdfkzxA
         lDDFHNF2necOJyqlZGH8yTBXWv7YzJJOpCpiFpQw90PXUvcVPUX6kYZ7zta9GKdXTfiK
         oyROBcjST/EXBicV8OfkouStn0sxknCEp77ERXsEBNR5ugZ4Cur00xmrVnfGX1Dx5crr
         NE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723326; x=1783328126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROn9v0tvgRhtd8/CTMTZwIAPSCSAz0ITaREV9z+qQSM=;
        b=NVJwRBxop9iqm9fJYgAAGU9Payr85LXMsa+S7shMmW7Wpr1OOzp/vMS0DpjgH9TQGX
         XWbpc1HqpU3iyVl5D7K79X8mCGMG8YhinJ81oa7a2BsuGiLsjMkXRmyXLV/8Clo0eMLb
         iiLpJ8rkrj4XRrYpJTBX1/BUIwisES1e6XIHnK+9qkDA7NEoVnjV+BsyimjLtt2u25NG
         0Ezy+JHvuiOv4lE3OlUJVzc6Txm3McpuaPVrlnyOJpq5b9TkzjvwsOb6+/ToLf9bk5dz
         B7S4s0b8JcnQjO0VH8K1t0PGm064kxAD0/cFRT+rvlgq65G8U6s/Y0SVnP+a1FwOPn7a
         crrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5nqn2eWJXzQkrfkJg+/dJNLhCZtf84DNwXL9VJWbRqiNJzGO4KO5PQ5O3gUVcNNGEcenrYAoJX8gp8g4L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7tlMGS8DEGoKKN+cj7kgcx4CZIBcT/Qd5x3MZ9EMEQlaPYD1
	kOlFlnGyE9snLK/bZR3w/BYUQNsmpQRmurOEVRgl5idPqOxEnyTPZp4XRSwunwqemwtPpxzrhYX
	hILuRM+2Jw+73QrQMFMONd28X63DSt01nTnNXdaDYw56ZKakYmLRAhv97n+7jc6Mg8w89
X-Gm-Gg: AfdE7clbTJkbrx982G/31zt+opNuWt0QgI14kqt5gqgzDxjyKWQ6iehpAZd6a4ryPKF
	OUf6ak9IXSPvTu6UrbT2SLeAjx/vr6XIkhGiWETUsjRKLdps37FAMjl05rvIazfkkSZe1JSFHQQ
	IRcTEizIHZ70xqIFDHXBzq/sOa3c01Nymut1tQLrY4a+5Bk+fFPh/UfNT6gavFG1/o2X5I4KMWS
	hEgFzPg1DdJNO+X711fPqI8h1Wx3TmvmVUZyCrqgsIHE9wjlxJV+wZ1NrWLr7R5KWszhnnGg0qI
	YiLPKf+WgJbrWIdQ2TGXtTGwOocWJnHG9knTXgkETvb1Nq9/AjdPaw0fDZGJ0J+8Cddht78toH6
	hd49QfCzWK9zbN7IQDizejK0SDx8wyZDIGLp7Z4Nw1R1/hpi/Lu+z3ssoNJYxTYYhqW8s/WII12
	u/QszDksM8v6dw5wiB4ziEM5d1PL39WximSJqj3FPR+1zrEiey4dobZaOnZ97dDqZgeZSrnzxsC
	dHEFWjJgZeVh0wfgy92
X-Received: by 2002:a05:6122:328b:b0:5bb:d0ab:5ed3 with SMTP id 71dfb90a1353d-5bd69c2f7bemr8037534e0c.1.1782723325750;
        Mon, 29 Jun 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:6122:328b:b0:5bb:d0ab:5ed3 with SMTP id 71dfb90a1353d-5bd69c2f7bemr8037516e0c.1.1782723325270;
        Mon, 29 Jun 2026 01:55:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/9] Support for block device NVMEM providers
Date: Mon, 29 Jun 2026 10:55:19 +0200
Message-Id: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPcyQmoC/3XQTWrDMBAF4KsErasgjX4sZ5V7hC4ka9SIxlZrt
 aIl+O6dZJOA683AG3gfw1xZxTljZYfdlc3Ycs1lomBfdmw4++kNeY6UGQiwQoPj4VKGd+4rn9q
 II9dBCYcuRN97RqWPGVP+uYOnV8rnXL/K/Hv3m7xtN6kmueDWR1DYGdkLfyy17j+//WUo47inw
 W5ig4diRLdSgJSQZIcxGqk0bijqoVixvkWR4sA6mYzwXpkNRT8r/UrRpGjTSUAbAAa7oZgnRcJ
 KMaT0BgW9OqXUi3+UZVn+AO4OA1zLAQAA
X-Change-ID: 20260428-block-as-nvmem-4b308e8bda9a
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
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX0+uE3Gobe67c
 R83YVF2g1VAa59LklYDg6j/3dL+0pNX4pDvxeMio20ec1L+ffGhCskpqXzmUZBN0Cykzwg85l2t
 JbQQCJXJHbmW0QaYgeN2ITVQa5U0AelacG5Z149+sBVYqDfjSgRkUKAlkd1+esNNi3J2Ne5UH7I
 yePntTD1ePDQ1SOgNRxCYvaCdrLViiT/fe++r8vo3yZwYA4aVgyL0pwGWifB5tiABfE0k62Ax4N
 3nwyAYbz+pGhxSYcXidXhqarj2+JPTbmU/atdFp1AvRVVBjqIg9O9s+9YfcCu22mKt/87/1mI0o
 Mzo6QdXialhvadKHIsI3OPaoOP1xRzSzRSYBYF7KqWOuDsFxtmYqxhAUq6q+AphlFglMLaCWTyv
 N9+0ANGpD4Sd+Z8j5m9AbhK0wk7iBfEH6mbtAfPwaCidtaGHzZwAJ6WvY8nkSVJDg09F4pfUmS2
 IylhFjKKT+PUfPya3Fw==
X-Proofpoint-GUID: SteEAT-bgxSPjT9TuEmhElLDNvnlyu63
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX85zv19/dB1U5
 aV6Op9tatLRUQGUY6R5ZkIYj/HyfkXLptkT4sFeUldnQ6bpPDCqDxi/v/zb6D6YV1iMGkpSYfYU
 mqvdV65ypJYnJMvHF6sCoSeRmm2YlDs=
X-Proofpoint-ORIG-GUID: SteEAT-bgxSPjT9TuEmhElLDNvnlyu63
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4232fe cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8 a=H1RoBJpM21yDxn_SvroA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:stable@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m
 :konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B66DF6D7BB7

On embedded devices, it is common for factory provisioning to store
device-specific information, such as Ethernet or WiFi MAC addresses,
in a dedicated area of an eMMC partition. This avoids the need for
and additional EEPROM/OTP and leverages the persistence of eMMC.

One example is the Arduino UNO-Q, where the WiFi MAC address and the
Bluetooth Device address are stored in the eMMC Boot1 partition.

Until now, accessing this information required a custom bootloader
to read the data and inject it into the Device Tree before handing
control over to the kernel. This approach is fragile and leads to
device-specific workarounds.

Rather than adding a new NVMEM provider specifically to the eMMC
subsystem, the new support operates at the block layer, allowing any
block device to behave like other non-volatile memories such as EEPROM
or OTP.

This series builds on earlier work by Daniel Golle that enables block
devices to act as NVMEM providers:
https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.1709667858.git.daniel@makrotopia.org/

It also introduces an NVMEM layout description for the Arduino UNO-Q,
allowing device-specific data stored in the eMMC Boot1 partition to
be accessed in a standard way.

WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
Bluetooth requires similar support, which is also addressed.

Note that this is currently limited to MMC-backed block devices, as
only the MMC core associates a firmware node with the block device
(add_disk_fwnode). This can be easily extended in the future to
support additional block drivers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v6:
- blk_nvmem_add() returns int, error properly propagated (Bartosz)
- Redundant if (bdev->bd_nvmem) guard removed in blk_nvmem_del() (Bartosz)
- Size guard changed from UINT_MAX → INT_MAX to avoid signed overflow in config.size (sashiko)
- BLK_OPEN_RESTRICT_WRITES removed from blk_nvmem_reg_read() (sashiko)
- Link to v5: https://lore.kernel.org/r/20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com

Changes in v5:
- Fixed ath10k binding issue + extended commit message (Krzysztof)
- Moved blk-nvmem handling to block core instead of a class_interface
  This allows correct/robust integration with block device life cycle (Bartosz).
- block: partitions: of: Skip child nodes without reg property (sashiko)
- Link to v4: https://lore.kernel.org/r/20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com

Changes in v4:
- Fix squash issue (dts commit incorrectly squashed) (Konrad)
- Use devres for nvmem resources (Bartosz)
- use __free() destructor helper when possible (Bartosz)
- Fix value return checking for bdev_file_open_by_dev
- Link to v3: https://lore.kernel.org/r/20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com

Changes in v3:
- Fixed missing 'fixed-partitions' compatible in partition (Rob)
- Fixed clashing nvmem cells, document calibration along mac (Sashiko)
- Remove workaround to handle dangling nvmem references after
  unregistering, this is a generic nvmem framework issue handled
  in Bartosz's series:
   https://lore.kernel.org/all/20260429-nvmem-unbind-v3-0-2a694f95395b@oss.qualcomm.com/
- Validate mac (is_valid_ether_addr) before copying to output buffer
- Link to v2: https://lore.kernel.org/r/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com

Changes in v2:
- Fix example nvmem-layout cells to use compatible = "mac-base"
- Squash WiFi MAC and Bluetooth BD address consumer patches into the nvmem layout patch
- Fix possible use-after-free in blk-nvmem: bnv (nvmem priv) linked to nvmem lifetime
- Simplify nvmem-cell-names from items: - const: to plain const:
- Factor out common NVMEM EUI-48 retrieval logic
- Reorder changes
- Link to v1: https://lore.kernel.org/r/20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com

---
Daniel Golle (1):
      block: implement NVMEM provider

Loic Poulain (8):
      block: partitions: of: Skip child nodes without reg property
      dt-bindings: mmc: Document support for nvmem-layout
      dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
      dt-bindings: bluetooth: qcom: Add NVMEM BD address cell
      net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup
      Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
      Bluetooth: qca: Set NVMEM BD address quirks when address is invalid
      arm64: dts: qcom: arduino-imola: Describe NVMEM layout for WiFi/BT addresses

 .../devicetree/bindings/mmc/mmc-card.yaml          |  29 ++++++
 .../net/bluetooth/qcom,bluetooth-common.yaml       |   9 ++
 .../bindings/net/wireless/qcom,ath10k.yaml         |  16 +++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  39 ++++++++
 block/Kconfig                                      |   9 ++
 block/Makefile                                     |   1 +
 block/blk-nvmem.c                                  | 111 +++++++++++++++++++++
 block/blk.h                                        |   8 ++
 block/genhd.c                                      |   4 +
 block/partitions/of.c                              |  20 ++--
 drivers/bluetooth/btqca.c                          |   5 +-
 include/linux/blk_types.h                          |   3 +
 include/linux/blkdev.h                             |   1 +
 include/linux/of_net.h                             |   7 ++
 include/net/bluetooth/hci.h                        |  18 ++++
 net/bluetooth/hci_sync.c                           |  39 +++++++-
 net/core/of_net.c                                  |  49 ++++++---
 17 files changed, 347 insertions(+), 21 deletions(-)
---
base-commit: 47c4835fc0fed583d01d90387b67633950eba2b2
change-id: 20260428-block-as-nvmem-4b308e8bda9a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


