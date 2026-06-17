Return-Path: <linux-arm-msm+bounces-113661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TFyEHpHFMmo95QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:04:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5E69B3A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IOrlRasl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UryMmDKp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113661-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113661-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB253169CBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A734779BB;
	Wed, 17 Jun 2026 15:50:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1414A2E01
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711409; cv=none; b=iJjuC9hbqByr/x9ebsv9+CxZK2aSBuefNDqUMlc3a6GOXXh+9k16vIST8cJcsDcvJttVjXxYQKbsdOSBJ2+yLWRG9EjH/f60DFjhFo80HntW+i6qEO96FSfyyTWRq2qiQQQqx3jKrY2tSNJrMFGNqH4V9JJRS/TQvPEU1kAzJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711409; c=relaxed/simple;
	bh=ZpXcRRX1P/Vbry8Wo72HFVJu88egSE1krlMUW4hDsmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XyWtnSqamTjWdk+jLqyhj3sBpFE7fqn/GzrVOzHwbhkBK+djSWpxvZyQkMqKzWJ5QqKsP5kc8jIpXROG7SX11Os5AV4BD3V5MXrxEJNpbLCCAm8/bRCAjuBW11ifIhK1CEeGdHIzIEZNgrP7parQSk1DEf85OI/zXCtUALmBIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOrlRasl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UryMmDKp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFmoSv3261486
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XPWZkZ500XJwZn26o7+t4Z
	zKCCQCUoNphYUHhoj3vjo=; b=IOrlRaslGlbY1sb26aDp0aih0jQ5+ndws3+0Kr
	X2WmHDPXzRl4a8cmvKC3bMlb3a0tc8tilkGmt9AGP7WPOdqgGL0CbQBZt3RXhvo2
	vHElKX48aFXkYwMtBCvY4rstv2ZloNBQQbuiKGe3CLxa/jo4ucGQR9ZQTrJFEcpV
	5AftKbMTCtmGDWQuDxhnN5zvka5XtfozBhytcxHD6d3D5cRppC00DyZowsX0skOK
	q519RUzfT4Kq1xoX5mQGr8e2R+iD0JGFjD5H2X9FB4mNHMSFiNhb1txYB+WYRO9P
	/y8wooNFlUB53CawSp1nFE4KMUpgwFNhyBkxDU8KGvRpHWQA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jr562-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso2851293137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711393; x=1782316193; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPWZkZ500XJwZn26o7+t4ZzKCCQCUoNphYUHhoj3vjo=;
        b=UryMmDKp+jeV6AqovPpBRNx+uCDIpQXLGsnWoXY6vCFeTRTZ0P1brk3kymj9nwkdRy
         ElDd7hoKLr0Hm9PKt7pHQF0wBiWCYnLwf2IrkYIZxjg2mV9IkDZyl61FGYXpiZQ8EeIy
         4r2TWTJ4WJVi/mWVu1X2HI07HBlzfwL5gt72PbydFZgujv06WFmmYUy4IKpn2VuR21bY
         LfG3YYjpsysP65qQsgMF3wUGww8c7z1/MvcAvKo9r6q7DreqOlj8H6brFpfduMbdeBK4
         BIKo8oC8UABA6ICLb5ScREMl2ytt/pem9tx1nDQMS00EucZs7at+Dk4i8REY/Gr4fVHp
         qNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711393; x=1782316193;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPWZkZ500XJwZn26o7+t4ZzKCCQCUoNphYUHhoj3vjo=;
        b=JtXFF+8BuDWxiL6xyIbPiF+ZuT4gKJVDLJ7RwFJA9ukXwDqD9xUPHZVUhpkKY2nkdW
         5++cnmBhXnwdMSijOxK+VVg+eJE8rGdpmlQ7tzrv+wtDhHA2nhlR7p/l6WgnpOomtfka
         FMF+QBUuIzH2pkT4BKThXFUkiCzSheTcrh4U8Y7to5x65JyDIOgSTd/suWoNwa6eCtAA
         RmY6C6L6rFCACUWcnYuWgROvMf5CSXO6yGBLgkFhE93solwMkp23kHaD4cIrkiDtjvcO
         HvegIChi6b99eVci2ZyvdhlOUYMUFKt2/g+ZKz65dzg6azw+70JQFgMSzNEkhbn9IVIP
         F5Xw==
X-Forwarded-Encrypted: i=1; AFNElJ+X1VeIFq+etx9LlyZgkigyZqqm5x5O2x+2AlL43VmD42enjTKU5FcxETEOe+CPJsIKtCWqkq3kIOfttsCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvQUH0qsf93XTMSO7iCw2RIxZ5Bpe4Eif5eNjY+yebrnNWBkh
	x8CyqOWVo3B9n+IgsI3cvTa3kGLXvmO2rRzK2GYNqlrzERFyfSEf1d4dzyLPMqUvMDmdKmYgAdn
	/MMCnj0OkQrJe3EbvhsuNxTGnUNtLqLwl64vkFmc+hBasm/Hz7iPUW7LCN65OjV+vtrZQ
X-Gm-Gg: AfdE7cmHJ9KqE9Es5+vCGnAXkJB6s9bewpP2yJSPfGPuh4hsrwZa6u17DI46ufz5g6e
	FCa3JAucdvHmJuZWnJxtFPydcIpHdodgJqhfJqTLGTFd2pd3RFRsn1b91ktky+ULfmgpAx/6D1I
	+j9xftamPPD0DhUE7EdIiPJ7KbYSsA53bsDyZxWSXkneiQPM15D1JrhOS7JbJRj8aen7YMbg0at
	wkNcmdSO01oQIIjjpf2Xrwuz2LjXaoeJZERPzjhBIY1AaQ+ILiqu74zr30FJ0ZiNyync2WMtDZU
	U/MeSarFRQFV0653mLjzx6VdYfkEcsu5zWDhI052wKgq7z5RcrTLG5m7hUU4hP9CxmMvoWsEN8y
	R2RM3j1nFF4ErctJwfbqn9jiFzlg7cEcI7qPCbJHl
X-Received: by 2002:a05:6102:15ab:b0:720:81d5:92dd with SMTP id ada2fe7eead31-7246cefffa3mr2759164137.22.1781711392984;
        Wed, 17 Jun 2026 08:49:52 -0700 (PDT)
X-Received: by 2002:a05:6102:15ab:b0:720:81d5:92dd with SMTP id ada2fe7eead31-7246cefffa3mr2759121137.22.1781711392491;
        Wed, 17 Jun 2026 08:49:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:49:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/8] crypto: qce - Fix crypto self-test failures
Date: Wed, 17 Jun 2026 17:49:29 +0200
Message-Id: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnCMmoC/22NQQqDMBBFryKz7kgyVcGueo/iIiSTGlBTM1Zax
 Ls3FbrrZuB9/n+zgXAKLHApNki8BglxynA+FWB7M90Zg8sMpKhRjVY4W0YfXig8eFxYFsGqJe8
 dsW/rGvLwkTg3Dumty9wHWWJ6Hz9W+qY/Xf1PtxIqdLbV2mtjXEXXKFLOTzPYOI5lPtDt+/4Bp
 zGra7sAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZpXcRRX1P/Vbry8Wo72HFVJu88egSE1krlMUW4hDsmQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIRrHso5RRinGMfK9331qoboVev1dMveaEtg
 Cmc9jx60wCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCEQAKCRAFnS7L/zaE
 wy1bD/sFRJTbi4HsHDpTGfTW1y71rTRLPEYEZf+tQr7zD9+h64p0WBNdHUAzq0iGER+zzc1bs6S
 KrTFgZxRFjuIa+sPd20H8JtcvJemtIX/RdnbhoIXxWIo7FopFpLWn3s6i/qe8ikMIOAQlf8K2ok
 NVNJluibGHrbETsjqTwBGtyqWcnf6gfJODLMBYUIfZQeNK3PiIy/C9cAXKV6J6JLqSnADgmVfr4
 u5Xg9WhIQ2E4CNNoUtSXYind0oqeMksahb7tYWPQtd1przzYbVGn8uWkgRDa/bfZsvt+MnJ9cHs
 Z1QVwS9e+OTCCxnzMuhEzmcjW633ksNqqAwNjHtHmRlXGsww/mgX7RaLiOC5Pi4YNV9c+bft0d6
 PUs0Eb8HXC/wqRV5S9FdwdRK76yven+Ma26Q1+pqJnA7zMh06rCEkCJBzKv/J4QL0Cyxwy25Ecw
 wIOTnvBJm+St12E6mppmG/DomDBQ1gQt7XXtOze6snkGNeEoDNXeZv9ZWhsGPNJM2KrlvknHAhJ
 rUrQCcCXM/Zl6IhONHKzpSgLDAgTKuy64zUYXT6wnz4ggIewnetyJBDbnapCiC4qcXmGSUjYOgr
 VAlwZ4B7oShanO/RLT9k0exVBw/I+6XlrdQZ0jrXOt+LwEUOyv22puIsYoY2UCPQG7UzFo0C6fx
 +YW55afoZ5DKpnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfXzmBCPp3y4aAq
 ZEszJZ9n6cog5PJbTWLKFqYnbv1mgVPD4dgwMxF6gDqVs7WxbrCmovLLRhFnREShjJLUuu/LrJ+
 xH2VQy8w/7XkGCiFEiyLKFl0gCgNnSpTPkkhKWv73fr8M0lFPJECNDj5w/BjofnOM+gxMD2reo9
 rTTSpOdVsOVR2viwoDdQWsM9fgLdL+Pb6mH6BiVhhk1hIROY4xVaNPlWRv+xzDFnzBZjBuobu+N
 jQvBoC8exEs651sjL3jx6qHlLklPIE/uMoth26WU6g+Pn6oHxSQZ01RHP2sXExtOWFV0gVEo9IA
 Lu6yU3BawFQ7FS0Z+fmAE2hty36RgGMhTc8p2URS10erWMkb5hvyKdbD7SFNBnB0reQR+dAiCc/
 VwW6T0kadRicQn0GyqpcFcK8x3PaQ5p5J3ClijZaBbTb8iuH2N6JzCl6ornZVdopALQTTOdWuN0
 csfQAlXudoy3MdqVUoQ==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a32c221 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5rERACauPDyaBIpbJ_EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: AjcKYWp8ZXneDQqN3rU1zHu9RaGsTwic
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX+O+uPj1bkT6p
 pPHj8v3BAVnVGQY79/mNCZ/z/yjqW+MvosVtWIEs69h8BF0JYh4oV30T/AkUmunowcS8gwi8EPd
 6xqOTlhZQ2PxbMBQVZ0NQNz0Fg6jxoI=
X-Proofpoint-GUID: AjcKYWp8ZXneDQqN3rU1zHu9RaGsTwic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170151
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
	TAGGED_FROM(0.00)[bounces-113661-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D1B5E69B3A2

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
 drivers/crypto/qce/common.c   |  40 +++---------
 drivers/crypto/qce/common.h   |  13 +---
 drivers/crypto/qce/regs-v5.h  |   4 --
 drivers/crypto/qce/sha.c      | 114 +++++++++++++++++++++++++---------
 drivers/crypto/qce/sha.h      |   2 +-
 drivers/crypto/qce/skcipher.c | 141 ++++++++++++------------------------------
 8 files changed, 166 insertions(+), 237 deletions(-)
---
base-commit: 7f5e2941e7dccc9dfaaa23d0548a40039772a284
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


