Return-Path: <linux-arm-msm+bounces-113995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4eopG2w2OWqOogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A406AFC32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LwTYJ+v1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eD7RXBh5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B6D93038A69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E7D3B3BE2;
	Mon, 22 Jun 2026 13:18:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B783AC0ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134316; cv=none; b=jWM/oYBMEynEPm46HEv5vZL7E6SA8si6e5DjISWY5AiBBMqg2i4KiQCafp7KtuwYiiqv+QM7iQDh5+CmnqlQG0uQmohjRgQjcjGhZTAyzs2LR5aD+MOnu67RFw6pA/ExZ4XTdzBLnSu8GVlSJz8+ryPLXmmBfnHfRP+Pb6qQ0IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134316; c=relaxed/simple;
	bh=cQAmMAn4z2yul4HYaXnEKT4SG1ES6Xiyaq7akZnbDKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLoYaqf3OQ3TD6POwsucSngXiRvZfV2MjLqpDPHQlx8zTmuTFeplKEhCECQ4NA5WVzQd231BkUvFl+LkXdEFxnVyfoYQTX+NVuK5tkGuS9WuZhBGoMqAdn5ojObvfohBPgsRc6vyEUL6sAPn66nJfWukqo5e23oIHE4pUw8Y878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwTYJ+v1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eD7RXBh5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG3He1062158
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYhbj5qQerMNaKqFMB55xtLzvSWQrkjFg7EEH82c0YQ=; b=LwTYJ+v1gnlInErI
	jtTsLM8FL4DsywaJDQyIICve8CSrrOrfuQOl8/h6yKPPpAxP9Zflvf0JhrSu7N+e
	m21SMYIeHDbmxQFcQHF2bN+YfC5mq/jVFfxsP7YX63tVGzoaO1d934XAjD/JmBWW
	2Ssn2mLqj/2vkQrhjCBFSSXydFwVExHFhMQdOVWLYPiQHkhu/qaplI6WeyTy7l0W
	ybukPTQrj4Z3g7+sp2e+qyf5v3nwCtAZ0olw1BeAw0Kbu5X72lp6H9gzqnEKejK2
	WJDUTITcze2Pnz3OSPSN/KRwIW4e18iKIfQOmRAOBoH9vdVFCuhn8Mb6Buod+ZwT
	4HqIRw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sn5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:33 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48e2ce64834so661139b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134313; x=1782739113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYhbj5qQerMNaKqFMB55xtLzvSWQrkjFg7EEH82c0YQ=;
        b=eD7RXBh5HRYmaDHYwwPk9gGAVNnp7qDhNlLY88KLj08yHPgaJpI+qLQQ6JX23wvJ7G
         3QKQKoiEgNt2FFKPNrzrOhG4pzFkvgWgNhD38Y2pccHg6E387trbhIG9yCed0nc5lESY
         dHV+6QfuBfBHPi45tTDEf3CzOTMGexlb+OQLaiXA/ZN7JjkX1Wx0KjilKvCLrsNtrzlO
         vQ8gzc5kvy+dc7F1U1qH+QrKnIA2f3NEN7xkQJ5MXHkrAk7tPJPBbY+fy4dEJ/rI/Oze
         +5PUy8U21RYuep/oqlo2JmDwEMkdAKe8ZN/tfnEbZk9dhP+a8K8jL74OAL7PDJS7OH4t
         FZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134313; x=1782739113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYhbj5qQerMNaKqFMB55xtLzvSWQrkjFg7EEH82c0YQ=;
        b=PAPRKbk/L1mjFhJzUJZOkbS3CUi/gSWUd+9XoQc2V4WWDY+ikDUfpsonAXsixgR7IB
         LBUNcasT/m3nsxh4z+1PDpcx9NqwKUL4OSfSiD2/4FCKVPdS/yD7V8O9Io5y/xgv3SIb
         ZR6NYIUCEBPBUMZzTQqMEG2YO3blMnZ1VyixPZdtCsNBBSZQVXhYAX64vXRQDsQuZeff
         2NsKyaIVR8xzGfycx5vrVoUj+P/LfT15hqk56T/D0XtBTrO1Z2QSpKzwbgW/zxhJl9tH
         FU/WscTpHtsMo1Ytx2CbHOmF+3sKi1WPR7KGXYOrzFzjGZweu6zgewOmQ1ukn2x+2MdO
         diFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Jp77B5rfQjRViNF7uPQuYbOedlyq/opicpn7ATgeiKD1mw9hakCcJ9Z4Oy3NvGqgWyRL5l5RCNR/IbSf/@vger.kernel.org
X-Gm-Message-State: AOJu0Yymsk4oElRZgaKyR7TNT/h+6v2AqC2QT3xZ5cP5P0w6wvXOxNma
	EppGADgUy/z7Y3TNSO+yQ6aEzvtBDiolzqDWhop+qhEYDdoOVqGn2WFM1CYxj0v3W51hCgwsYwp
	Bq0yRQz1Ev9vSQxvP+8Pd1jCkB34BYBEZ0a17S6bFjhHVNxFzlX7bSB/r7MenqWPzM1a/Veu6tP
	thvhs=
X-Gm-Gg: AfdE7ckukLyI19CrVb8qCPszSybu0lY39xKULCuXAT3fCZuMMMAtijnGYtx2U3nreli
	AuFHmmzJUVnwEtJWqT2iTT/tcRMdF8lFnFMuHDQuhO6f1aqFaW0dX40mxmpKQCAg4T0jjh1KV0l
	JzxZNyJr4Cc8WrB245hOzSsEvCQLCmpHiZeyPs99VOgjsDIIxBFxmqR7Yiu9zKgPIqRWgru9dyX
	T3BnZ4B3rJ7cSg1u9c4Ys8lBRzk85BD0uRFzAl+yPqrllNFj1qVfXbuOTWBU66Olaru6WfzJPuD
	2i1HEFbwAiCYg5AZuPVd+zPWTvGwnQKo4w+rAWTYmnmKXOKp62ikLTYBr1G8skoc23IUIH43Ao9
	zb86P85Cjlz6OXHCPf4CjCVpILL1pTGC+VuTn6DQq
X-Received: by 2002:a05:6808:150c:b0:48a:bb9d:e026 with SMTP id 5614622812f47-48abb9df89fmr8557374b6e.24.1782134312337;
        Mon, 22 Jun 2026 06:18:32 -0700 (PDT)
X-Received: by 2002:a05:6808:150c:b0:48a:bb9d:e026 with SMTP id 5614622812f47-48abb9df89fmr8557328b6e.24.1782134311743;
        Mon, 22 Jun 2026 06:18:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:09 +0200
Subject: [PATCH v4 1/8] crypto: qce - Remove unsafe/deprecated algorithms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-1-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cQAmMAn4z2yul4HYaXnEKT4SG1ES6Xiyaq7akZnbDKs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYbtRC1WaFsPkBJnD6Bo5FlSQCYb6UZEUv7x
 1FOOdVp4wKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2GwAKCRAFnS7L/zaE
 w+FdEACtZlTZ3ita+x0etiKpOI6QIWyRLXAokr8TgwTw8xl85cV9z8kUDTvaMe2lGDRH+W1aYYU
 XsALMzDbjXsqGVNnF45MSadTFu6Un9GBSVRVAQ2s/PShVsSwzbeDUsQShjhpBaXhLVYtpk6BiyO
 /2NXc7idmbT8+yO4CaRmvvVfA1yiwIA68OZC+gpVv/8iQdaTxiJqgNx/v1Xal51fFPQSUlmkn9h
 GQIpGfSg4UPtEmY0P+c4ds+6XCez2L01iF7gJXLa/OXAFlCQuGWFKs3koVArl4CcFqGMB5zmbp0
 hyQflpouhDmuW4UwD6f5kDHUjEhwKluGgorDWs97bguviC5oAbbbEWmWstwdHoUmQAJ8HkhJHIZ
 pXBIQk76DSOEeZQ/KuKQAm6kJSnyyy5/D3yehWwZnauovSTBc1ns8A4DC8qObvL8wXU/Kgw6GEo
 WZnjKHh6/OXnYDcDRj/PsS3FLDUyZZGQ4cYl0JiG+46s651C80GT114iwQfFP5xvRe9ZJhwEVF2
 CoY5Ay7W+HI7QkODDQioamwTvyrxMPOJiKIqm6CIdcoM7dtC4wD/mbliseExf5T97hDYmjMDR83
 NsZacZceLSotDMuhgPIDf32c7F5854Wm+AB+GK1dicoNlyFuKX1vLqRq6HdSvaad4zgVGE5D/gQ
 Nzxh4j4PDTgFd8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: FS11jJjaEjf6dJ-wvNZgY7woiOG8u6EU
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a393629 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xN7e7uC-HLpvSXc5JqUA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX90mlOlfhk3Li
 pb8UBu42dWt/uxlWNy1gNQo2dJPVta4Fv0c4q828FYVwti/ZAAaJQQ4MfFqkrBL4AQMG1FE3qDQ
 RgtQu3ZHAo2toC0xeFTCz9jn4TLxb6E=
X-Proofpoint-ORIG-GUID: FS11jJjaEjf6dJ-wvNZgY7woiOG8u6EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX3lyDdxqtld4h
 RzetvyrnMKM3fB6o8XzbjufIGQ4vOwxQcE6ViwFL6wgkoEJFqkNNAwkuPZpni0s6vP5uRh1FFNa
 aF2PjSodzJs9ZM48rQQ+XfChEEFFHjYKMnNF6M4Bh3Wo34nV5oZkyY7WUPlAa8pI1hqiMrdWTyu
 Eu/fafzMpP5GNrCnr0Hv/YPLqm4/bof4TmT+V7cKgfwkm3gkoAHRpde6+kZpNFxJoB+hGoWlK7E
 DyVLG26FrcY2Rgr1FB4S46Ewe2hvk4jBZ9MHq7BoNAjAU1BQghTqu53x78NuEFgWsUGC1MPeieW
 Xs4TXbe4Z9VOwBnjHmY3Pic3GwvZ87QbjUyNOzE2XvauHtDWpfdXKtKaSsROnXLH2VdcIv2kf0S
 hbuWvJffot8Q2UDqOAi4QJyj/DBqN8e0JsIgE+/ZyldGQzwUlnRcJvWPyGU4h1QmXl8cVCHfGLt
 uyLUEGYEFthIknSD/xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: D5A406AFC32

Remove algorithms that are either unsafe or deprecated and have no
in-kernel users that cannot be served by the ARM CE implementations.

AES-ECB reveals plaintext patterns (identical plaintext blocks produce
identical ciphertext blocks) and should not be exposed as a hardware-
accelerated primitive. DES, Triple DES and HMAC-SHA1 have been
deprecated for years.

Remove sha1, ecb(aes), ecb(des), cbc(des), ecb(des3_ede), cbc(des3_ede),
hmac(sha1) and all AEAD variants built on these primitives as well as
authenc(hmac(sha256),cbc(des)). Also clean up the - now dead - code,
flags and constants.

Cc: stable@vger.kernel.org
Acked-by: Eric Biggers <ebiggers@kernel.org>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c     | 56 +------------------------
 drivers/crypto/qce/common.c   | 55 ++++++------------------
 drivers/crypto/qce/common.h   | 16 ++-----
 drivers/crypto/qce/regs-v5.h  |  4 --
 drivers/crypto/qce/sha.c      | 30 +------------
 drivers/crypto/qce/sha.h      |  1 -
 drivers/crypto/qce/skcipher.c | 97 +------------------------------------------
 7 files changed, 20 insertions(+), 239 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 03b8042da9a1b4aebdc775ad8ab912abc7b2383d..336614a11377e0be246817da584296124f4de5d8 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -9,8 +9,6 @@
 #include <crypto/gcm.h>
 #include <crypto/authenc.h>
 #include <crypto/internal/aead.h>
-#include <crypto/internal/des.h>
-#include <crypto/sha1.h>
 #include <crypto/sha2.h>
 #include <crypto/scatterwalk.h>
 #include "aead.h"
@@ -592,7 +590,6 @@ static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct crypto_authenc_keys authenc_keys;
 	unsigned long flags = to_aead_tmpl(tfm)->alg_flags;
-	u32 _key[6];
 	int err;
 
 	err = crypto_authenc_extractkeys(&authenc_keys, key, keylen);
@@ -603,26 +600,7 @@ static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int
 	    authenc_keys.authkeylen > QCE_MAX_KEY_SIZE)
 		return -EINVAL;
 
-	if (IS_DES(flags)) {
-		err = verify_aead_des_key(tfm, authenc_keys.enckey, authenc_keys.enckeylen);
-		if (err)
-			return err;
-	} else if (IS_3DES(flags)) {
-		err = verify_aead_des3_key(tfm, authenc_keys.enckey, authenc_keys.enckeylen);
-		if (err)
-			return err;
-		/*
-		 * The crypto engine does not support any two keys
-		 * being the same for triple des algorithms. The
-		 * verify_skcipher_des3_key does not check for all the
-		 * below conditions. Schedule fallback in this case.
-		 */
-		memcpy(_key, authenc_keys.enckey, DES3_EDE_KEY_SIZE);
-		if (!((_key[0] ^ _key[2]) | (_key[1] ^ _key[3])) ||
-		    !((_key[2] ^ _key[4]) | (_key[3] ^ _key[5])) ||
-		    !((_key[0] ^ _key[4]) | (_key[1] ^ _key[5])))
-			ctx->need_fallback = true;
-	} else if (IS_AES(flags)) {
+	if (IS_AES(flags)) {
 		/* No random key sizes */
 		if (authenc_keys.enckeylen != AES_KEYSIZE_128 &&
 		    authenc_keys.enckeylen != AES_KEYSIZE_192 &&
@@ -693,38 +671,6 @@ struct qce_aead_def {
 };
 
 static const struct qce_aead_def aead_def[] = {
-	{
-		.flags          = QCE_ALG_DES | QCE_MODE_CBC | QCE_HASH_SHA1_HMAC,
-		.name           = "authenc(hmac(sha1),cbc(des))",
-		.drv_name       = "authenc-hmac-sha1-cbc-des-qce",
-		.blocksize      = DES_BLOCK_SIZE,
-		.ivsize         = DES_BLOCK_SIZE,
-		.maxauthsize	= SHA1_DIGEST_SIZE,
-	},
-	{
-		.flags          = QCE_ALG_3DES | QCE_MODE_CBC | QCE_HASH_SHA1_HMAC,
-		.name           = "authenc(hmac(sha1),cbc(des3_ede))",
-		.drv_name       = "authenc-hmac-sha1-cbc-3des-qce",
-		.blocksize      = DES3_EDE_BLOCK_SIZE,
-		.ivsize         = DES3_EDE_BLOCK_SIZE,
-		.maxauthsize	= SHA1_DIGEST_SIZE,
-	},
-	{
-		.flags          = QCE_ALG_DES | QCE_MODE_CBC | QCE_HASH_SHA256_HMAC,
-		.name           = "authenc(hmac(sha256),cbc(des))",
-		.drv_name       = "authenc-hmac-sha256-cbc-des-qce",
-		.blocksize      = DES_BLOCK_SIZE,
-		.ivsize         = DES_BLOCK_SIZE,
-		.maxauthsize	= SHA256_DIGEST_SIZE,
-	},
-	{
-		.flags          = QCE_ALG_3DES | QCE_MODE_CBC | QCE_HASH_SHA256_HMAC,
-		.name           = "authenc(hmac(sha256),cbc(des3_ede))",
-		.drv_name       = "authenc-hmac-sha256-cbc-3des-qce",
-		.blocksize      = DES3_EDE_BLOCK_SIZE,
-		.ivsize         = DES3_EDE_BLOCK_SIZE,
-		.maxauthsize	= SHA256_DIGEST_SIZE,
-	},
 	{
 		.flags          =  QCE_ALG_AES | QCE_MODE_CBC | QCE_HASH_SHA256_HMAC,
 		.name           = "authenc(hmac(sha256),cbc(aes))",
diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 54a78a57f63028f01870a3edeb8e390f523bb190..3081d765a0f2c5965065645303eafd0017f8f208 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -8,7 +8,6 @@
 #include <linux/interrupt.h>
 #include <linux/types.h>
 #include <crypto/scatterwalk.h>
-#include <crypto/sha1.h>
 #include <crypto/sha2.h>
 
 #include "cipher.h"
@@ -115,18 +114,16 @@ static u32 qce_auth_cfg(unsigned long flags, u32 key_size, u32 auth_size)
 			cfg |= AUTH_KEY_SZ_AES256 << AUTH_KEY_SIZE_SHIFT;
 	}
 
-	if (IS_SHA1(flags) || IS_SHA1_HMAC(flags))
-		cfg |= AUTH_SIZE_SHA1 << AUTH_SIZE_SHIFT;
-	else if (IS_SHA256(flags) || IS_SHA256_HMAC(flags))
+	if (IS_SHA256(flags) || IS_SHA256_HMAC(flags))
 		cfg |= AUTH_SIZE_SHA256 << AUTH_SIZE_SHIFT;
 	else if (IS_CMAC(flags))
 		cfg |= AUTH_SIZE_ENUM_16_BYTES << AUTH_SIZE_SHIFT;
 	else if (IS_CCM(flags))
 		cfg |= (auth_size - 1) << AUTH_SIZE_SHIFT;
 
-	if (IS_SHA1(flags) || IS_SHA256(flags))
+	if (IS_SHA256(flags))
 		cfg |= AUTH_MODE_HASH << AUTH_MODE_SHIFT;
-	else if (IS_SHA1_HMAC(flags) || IS_SHA256_HMAC(flags))
+	else if (IS_SHA256_HMAC(flags))
 		cfg |= AUTH_MODE_HMAC << AUTH_MODE_SHIFT;
 	else if (IS_CCM(flags))
 		cfg |= AUTH_MODE_CCM << AUTH_MODE_SHIFT;
@@ -191,7 +188,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 	else
 		qce_cpu_to_be32p_array(auth, rctx->digest, digestsize);
 
-	iv_words = (IS_SHA1(rctx->flags) || IS_SHA1_HMAC(rctx->flags)) ? 5 : 8;
+	iv_words = 8;
 	qce_write_array(qce, REG_AUTH_IV0, (u32 *)auth, iv_words);
 
 	if (rctx->first_blk)
@@ -243,19 +240,8 @@ static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
 
 	if (IS_AES(flags))
 		cfg |= ENCR_ALG_AES << ENCR_ALG_SHIFT;
-	else if (IS_DES(flags) || IS_3DES(flags))
-		cfg |= ENCR_ALG_DES << ENCR_ALG_SHIFT;
-
-	if (IS_DES(flags))
-		cfg |= ENCR_KEY_SZ_DES << ENCR_KEY_SZ_SHIFT;
-
-	if (IS_3DES(flags))
-		cfg |= ENCR_KEY_SZ_3DES << ENCR_KEY_SZ_SHIFT;
 
 	switch (flags & QCE_MODE_MASK) {
-	case QCE_MODE_ECB:
-		cfg |= ENCR_MODE_ECB << ENCR_MODE_SHIFT;
-		break;
 	case QCE_MODE_CBC:
 		cfg |= ENCR_MODE_CBC << ENCR_MODE_SHIFT;
 		break;
@@ -340,13 +326,7 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 
 	encr_cfg = qce_encr_cfg(flags, keylen);
 
-	if (IS_DES(flags)) {
-		enciv_words = 2;
-		enckey_words = 2;
-	} else if (IS_3DES(flags)) {
-		enciv_words = 2;
-		enckey_words = 6;
-	} else if (IS_AES(flags)) {
+	if (IS_AES(flags)) {
 		if (IS_XTS(flags))
 			qce_xtskey(qce, ctx->enc_key, ctx->enc_keylen,
 				   rctx->cryptlen);
@@ -357,14 +337,12 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 
 	qce_write_array(qce, REG_ENCR_KEY0, (u32 *)enckey, enckey_words);
 
-	if (!IS_ECB(flags)) {
-		if (IS_XTS(flags))
-			qce_xts_swapiv(enciv, rctx->iv, ivsize);
-		else
-			qce_cpu_to_be32p_array(enciv, rctx->iv, ivsize);
+	if (IS_XTS(flags))
+		qce_xts_swapiv(enciv, rctx->iv, ivsize);
+	else
+		qce_cpu_to_be32p_array(enciv, rctx->iv, ivsize);
 
-		qce_write_array(qce, REG_CNTR0_IV0, (u32 *)enciv, enciv_words);
-	}
+	qce_write_array(qce, REG_CNTR0_IV0, (u32 *)enciv, enciv_words);
 
 	if (IS_ENCRYPT(flags))
 		encr_cfg |= BIT(ENCODE_SHIFT);
@@ -393,10 +371,6 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 #endif
 
 #ifdef CONFIG_CRYPTO_DEV_QCE_AEAD
-static const u32 std_iv_sha1[SHA256_DIGEST_SIZE / sizeof(u32)] = {
-	SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4, 0, 0, 0
-};
-
 static const u32 std_iv_sha256[SHA256_DIGEST_SIZE / sizeof(u32)] = {
 	SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
 	SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7
@@ -473,13 +447,8 @@ static int qce_setup_regs_aead(struct crypto_async_request *async_req)
 	/* Write initial authentication IV only for HMAC algorithms */
 	if (IS_SHA_HMAC(rctx->flags)) {
 		/* Write default authentication iv */
-		if (IS_SHA1_HMAC(rctx->flags)) {
-			auth_ivsize = SHA1_DIGEST_SIZE;
-			memcpy(authiv, std_iv_sha1, auth_ivsize);
-		} else if (IS_SHA256_HMAC(rctx->flags)) {
-			auth_ivsize = SHA256_DIGEST_SIZE;
-			memcpy(authiv, std_iv_sha256, auth_ivsize);
-		}
+		auth_ivsize = SHA256_DIGEST_SIZE;
+		memcpy(authiv, std_iv_sha256, auth_ivsize);
 		authiv_words = auth_ivsize / sizeof(u32);
 		qce_write_array(qce, REG_AUTH_IV0, (u32 *)authiv, authiv_words);
 	} else if (IS_CCM(rctx->flags)) {
diff --git a/drivers/crypto/qce/common.h b/drivers/crypto/qce/common.h
index 02e63ad9f24557c2238caa70b0ec521d49da4f13..9cd2e6ed8bbb0f76e24be187d8ae7e2fe2f7b932 100644
--- a/drivers/crypto/qce/common.h
+++ b/drivers/crypto/qce/common.h
@@ -22,7 +22,7 @@
 
 /* IV length in bytes */
 #define QCE_AES_IV_LENGTH		AES_BLOCK_SIZE
-/* max of AES_BLOCK_SIZE, DES3_EDE_BLOCK_SIZE */
+/* max of AES_BLOCK_SIZE */
 #define QCE_MAX_IV_SIZE			AES_BLOCK_SIZE
 
 /* maximum nonce bytes  */
@@ -33,14 +33,10 @@
 #define QCE_MAX_ALIGN_SIZE		64
 
 /* cipher algorithms */
-#define QCE_ALG_DES			BIT(0)
-#define QCE_ALG_3DES			BIT(1)
 #define QCE_ALG_AES			BIT(2)
 
 /* hash and hmac algorithms */
-#define QCE_HASH_SHA1			BIT(3)
 #define QCE_HASH_SHA256			BIT(4)
-#define QCE_HASH_SHA1_HMAC		BIT(5)
 #define QCE_HASH_SHA256_HMAC		BIT(6)
 #define QCE_HASH_AES_CMAC		BIT(7)
 
@@ -58,21 +54,15 @@
 #define QCE_ENCRYPT			BIT(30)
 #define QCE_DECRYPT			BIT(31)
 
-#define IS_DES(flags)			(flags & QCE_ALG_DES)
-#define IS_3DES(flags)			(flags & QCE_ALG_3DES)
 #define IS_AES(flags)			(flags & QCE_ALG_AES)
 
-#define IS_SHA1(flags)			(flags & QCE_HASH_SHA1)
 #define IS_SHA256(flags)		(flags & QCE_HASH_SHA256)
-#define IS_SHA1_HMAC(flags)		(flags & QCE_HASH_SHA1_HMAC)
 #define IS_SHA256_HMAC(flags)		(flags & QCE_HASH_SHA256_HMAC)
 #define IS_CMAC(flags)			(flags & QCE_HASH_AES_CMAC)
-#define IS_SHA(flags)			(IS_SHA1(flags) || IS_SHA256(flags))
-#define IS_SHA_HMAC(flags)		\
-		(IS_SHA1_HMAC(flags) || IS_SHA256_HMAC(flags))
+#define IS_SHA(flags)			IS_SHA256(flags)
+#define IS_SHA_HMAC(flags)		IS_SHA256_HMAC(flags)
 
 #define IS_CBC(mode)			(mode & QCE_MODE_CBC)
-#define IS_ECB(mode)			(mode & QCE_MODE_ECB)
 #define IS_CTR(mode)			(mode & QCE_MODE_CTR)
 #define IS_XTS(mode)			(mode & QCE_MODE_XTS)
 #define IS_CCM(mode)			(mode & QCE_MODE_CCM)
diff --git a/drivers/crypto/qce/regs-v5.h b/drivers/crypto/qce/regs-v5.h
index d59ed279890621a8e2e6f4cdb20692dbf39f1461..431a7db1a4e72188c2ccca094bda18a03f30d3d2 100644
--- a/drivers/crypto/qce/regs-v5.h
+++ b/drivers/crypto/qce/regs-v5.h
@@ -203,7 +203,6 @@
 
 #define AUTH_SIZE_SHIFT			9
 #define AUTH_SIZE_MASK			GENMASK(13, 9)
-#define AUTH_SIZE_SHA1			0
 #define AUTH_SIZE_SHA256		1
 #define AUTH_SIZE_ENUM_1_BYTES		0
 #define AUTH_SIZE_ENUM_2_BYTES		1
@@ -284,15 +283,12 @@
 
 #define ENCR_KEY_SZ_SHIFT		3
 #define ENCR_KEY_SZ_MASK		GENMASK(5, 3)
-#define ENCR_KEY_SZ_DES			0
-#define ENCR_KEY_SZ_3DES		1
 #define ENCR_KEY_SZ_AES128		0
 #define ENCR_KEY_SZ_AES256		2
 
 #define ENCR_ALG_SHIFT			0
 #define ENCR_ALG_MASK			GENMASK(2, 0)
 #define ENCR_ALG_NONE			0
-#define ENCR_ALG_DES			1
 #define ENCR_ALG_AES			2
 #define ENCR_ALG_KASUMI			4
 #define ENCR_ALG_SNOW_3G		5
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index a3a1a205aaf8559a04809936e2a3b7d564c16c53..0a3f88aaf5169ea7b47a549bbc10ea87d3ae7a2b 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -25,10 +25,6 @@ struct qce_sha_saved_state {
 
 static LIST_HEAD(ahash_algs);
 
-static const u32 std_iv_sha1[SHA256_DIGEST_SIZE / sizeof(u32)] = {
-	SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4, 0, 0, 0
-};
-
 static const u32 std_iv_sha256[SHA256_DIGEST_SIZE / sizeof(u32)] = {
 	SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
 	SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7
@@ -349,9 +345,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 		return 0;
 	}
 
-	if (digestsize == SHA1_DIGEST_SIZE)
-		alg_name = "sha1-qce";
-	else if (digestsize == SHA256_DIGEST_SIZE)
+	if (digestsize == SHA256_DIGEST_SIZE)
 		alg_name = "sha256-qce";
 	else
 		return -EINVAL;
@@ -412,15 +406,6 @@ struct qce_ahash_def {
 };
 
 static const struct qce_ahash_def ahash_def[] = {
-	{
-		.flags		= QCE_HASH_SHA1,
-		.name		= "sha1",
-		.drv_name	= "sha1-qce",
-		.digestsize	= SHA1_DIGEST_SIZE,
-		.blocksize	= SHA1_BLOCK_SIZE,
-		.statesize	= sizeof(struct qce_sha_saved_state),
-		.std_iv		= std_iv_sha1,
-	},
 	{
 		.flags		= QCE_HASH_SHA256,
 		.name		= "sha256",
@@ -430,15 +415,6 @@ static const struct qce_ahash_def ahash_def[] = {
 		.statesize	= sizeof(struct qce_sha_saved_state),
 		.std_iv		= std_iv_sha256,
 	},
-	{
-		.flags		= QCE_HASH_SHA1_HMAC,
-		.name		= "hmac(sha1)",
-		.drv_name	= "hmac-sha1-qce",
-		.digestsize	= SHA1_DIGEST_SIZE,
-		.blocksize	= SHA1_BLOCK_SIZE,
-		.statesize	= sizeof(struct qce_sha_saved_state),
-		.std_iv		= std_iv_sha1,
-	},
 	{
 		.flags		= QCE_HASH_SHA256_HMAC,
 		.name		= "hmac(sha256)",
@@ -476,9 +452,7 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	alg->halg.digestsize = def->digestsize;
 	alg->halg.statesize = def->statesize;
 
-	if (IS_SHA1(def->flags))
-		tmpl->hash_zero = sha1_zero_message_hash;
-	else if (IS_SHA256(def->flags))
+	if (IS_SHA256(def->flags))
 		tmpl->hash_zero = sha256_zero_message_hash;
 
 	base = &alg->halg.base;
diff --git a/drivers/crypto/qce/sha.h b/drivers/crypto/qce/sha.h
index a22695361f1654cc94325ec5d886a158fa4bfb9c..cb822fc334dc187cf1c66e2a332822a596ebcef3 100644
--- a/drivers/crypto/qce/sha.h
+++ b/drivers/crypto/qce/sha.h
@@ -7,7 +7,6 @@
 #define _SHA_H_
 
 #include <crypto/scatterwalk.h>
-#include <crypto/sha1.h>
 #include <crypto/sha2.h>
 
 #include "common.h"
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 1fef315a7105c869e7fc6a60719087b721e78bb3..b27008ace93a8a40c291d564c3fb9d73df5447ec 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -11,7 +11,6 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <crypto/aes.h>
-#include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 
 #include "cipher.h"
@@ -209,51 +208,6 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	return ret;
 }
 
-static int qce_des_setkey(struct crypto_skcipher *ablk, const u8 *key,
-			  unsigned int keylen)
-{
-	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(ablk);
-	int err;
-
-	err = verify_skcipher_des_key(ablk, key);
-	if (err)
-		return err;
-
-	ctx->enc_keylen = keylen;
-	memcpy(ctx->enc_key, key, keylen);
-	return 0;
-}
-
-static int qce_des3_setkey(struct crypto_skcipher *ablk, const u8 *key,
-			   unsigned int keylen)
-{
-	struct qce_cipher_ctx *ctx = crypto_skcipher_ctx(ablk);
-	u32 _key[6];
-	int err;
-
-	err = verify_skcipher_des3_key(ablk, key);
-	if (err)
-		return err;
-
-	/*
-	 * The crypto engine does not support any two keys
-	 * being the same for triple des algorithms. The
-	 * verify_skcipher_des3_key does not check for all the
-	 * below conditions. Return -ENOKEY in case any two keys
-	 * are the same. Revisit to see if a fallback cipher
-	 * is needed to handle this condition.
-	 */
-	memcpy(_key, key, DES3_EDE_KEY_SIZE);
-	if (!((_key[0] ^ _key[2]) | (_key[1] ^ _key[3])) ||
-	    !((_key[2] ^ _key[4]) | (_key[3] ^ _key[5])) ||
-	    !((_key[0] ^ _key[4]) | (_key[1] ^ _key[5])))
-		return -ENOKEY;
-
-	ctx->enc_keylen = keylen;
-	memcpy(ctx->enc_key, key, keylen);
-	return 0;
-}
-
 static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -276,7 +230,7 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * ECB and CBC algorithms require message lengths to be
 	 * multiples of block size.
 	 */
-	if (IS_ECB(rctx->flags) || IS_CBC(rctx->flags))
+	if (IS_CBC(rctx->flags))
 		if (!IS_ALIGNED(req->cryptlen, blocksize))
 			return -EINVAL;
 
@@ -359,15 +313,6 @@ struct qce_skcipher_def {
 };
 
 static const struct qce_skcipher_def skcipher_def[] = {
-	{
-		.flags		= QCE_ALG_AES | QCE_MODE_ECB,
-		.name		= "ecb(aes)",
-		.drv_name	= "ecb-aes-qce",
-		.blocksize	= AES_BLOCK_SIZE,
-		.ivsize		= 0,
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-	},
 	{
 		.flags		= QCE_ALG_AES | QCE_MODE_CBC,
 		.name		= "cbc(aes)",
@@ -396,42 +341,6 @@ static const struct qce_skcipher_def skcipher_def[] = {
 		.min_keysize	= AES_MIN_KEY_SIZE * 2,
 		.max_keysize	= AES_MAX_KEY_SIZE * 2,
 	},
-	{
-		.flags		= QCE_ALG_DES | QCE_MODE_ECB,
-		.name		= "ecb(des)",
-		.drv_name	= "ecb-des-qce",
-		.blocksize	= DES_BLOCK_SIZE,
-		.ivsize		= 0,
-		.min_keysize	= DES_KEY_SIZE,
-		.max_keysize	= DES_KEY_SIZE,
-	},
-	{
-		.flags		= QCE_ALG_DES | QCE_MODE_CBC,
-		.name		= "cbc(des)",
-		.drv_name	= "cbc-des-qce",
-		.blocksize	= DES_BLOCK_SIZE,
-		.ivsize		= DES_BLOCK_SIZE,
-		.min_keysize	= DES_KEY_SIZE,
-		.max_keysize	= DES_KEY_SIZE,
-	},
-	{
-		.flags		= QCE_ALG_3DES | QCE_MODE_ECB,
-		.name		= "ecb(des3_ede)",
-		.drv_name	= "ecb-3des-qce",
-		.blocksize	= DES3_EDE_BLOCK_SIZE,
-		.ivsize		= 0,
-		.min_keysize	= DES3_EDE_KEY_SIZE,
-		.max_keysize	= DES3_EDE_KEY_SIZE,
-	},
-	{
-		.flags		= QCE_ALG_3DES | QCE_MODE_CBC,
-		.name		= "cbc(des3_ede)",
-		.drv_name	= "cbc-3des-qce",
-		.blocksize	= DES3_EDE_BLOCK_SIZE,
-		.ivsize		= DES3_EDE_BLOCK_SIZE,
-		.min_keysize	= DES3_EDE_KEY_SIZE,
-		.max_keysize	= DES3_EDE_KEY_SIZE,
-	},
 };
 
 static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
@@ -455,9 +364,7 @@ static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
 	alg->ivsize			= def->ivsize;
 	alg->min_keysize		= def->min_keysize;
 	alg->max_keysize		= def->max_keysize;
-	alg->setkey			= IS_3DES(def->flags) ? qce_des3_setkey :
-					  IS_DES(def->flags) ? qce_des_setkey :
-					  qce_skcipher_setkey;
+	alg->setkey			= qce_skcipher_setkey;
 	alg->encrypt			= qce_skcipher_encrypt;
 	alg->decrypt			= qce_skcipher_decrypt;
 

-- 
2.47.3


