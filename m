Return-Path: <linux-arm-msm+bounces-113219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTgLJ68hMGpgOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:00:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19768807C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lhrRmHAh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EJOPHw86;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED8553103C9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C8340F8D6;
	Mon, 15 Jun 2026 15:50:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12440E8F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538642; cv=none; b=hQQXhBiPFiuyKLZc/KWSBhY2wM5ietFiX0QbgqVHBh8jiNEg7SoaKbOxHkxvoi53zEmZwcP94E1L1XRPUu/L6Ugel8a8jsqmrMhgVnvf30E9tQ4v/hnw8elhgIT4OoCqeal4HOvn9JXYIdykbrekpXd7WV3IXXouWOeB3bzkSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538642; c=relaxed/simple;
	bh=KvKsD1oCE0rkeeerl1Qkrj3anJH4Nry20STguSSstzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkB0rIOx3l1FgQ0qiJX0DRt+HyMBoUlm90rQ5KWnS38xmPKibXT+S5miQ0lNPcELxB2xVRLVPV1e24UWvj7RerWSVQTZJDxa/k3m4BBtOzF2ws3GSykercxnDwGJOdxSd3AkEaGMyHlTw+TD7QVXaeEHs/kM3tbexsN5jq+RbOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhrRmHAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJOPHw86; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLTS446900
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7SbATcVMiFsT79EwQb59/1DavxNWK+xOjZVrckBY18=; b=lhrRmHAhiUuqgROK
	u1glkEfRucS/f8D4qHnrz9V6rdnIna2/QX8H6oY+byq51LEn4lV/KohIDux0IIw8
	unv5wyN4qIj5dpN9GICGdYHCsPoEDX4vWX7llsf0Ej06BPOGP3yOJf8gl4o7hkZq
	wF1mtwS+OeLFQyJFEQcmdUXCEmYrVvty7+W+LgUQxte6oBCbezzTakSDZv2U+01Z
	N1zyoMVRC0BT7KrghIYBGiqC2Cen23/LgOuc+duH3ZzUday+VbzQf0iQ6ikIYsPd
	jGhsZJkfr0G5pA2llcvKLW6glGEbI/AexfgXauvn5pzFg343sihAqYIebvAytw+4
	YeieLw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0hjcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso1434795137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538639; x=1782143439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7SbATcVMiFsT79EwQb59/1DavxNWK+xOjZVrckBY18=;
        b=EJOPHw86MxVlkegRerHO3a4xggw57pmpeOGt22DzrOg7LYAduN27zZ5KZK/aUemJTB
         N3HNbCcUSgrywXGxqY1nLxthIiOboOHFtZ6UIj8RAvZLcA9+9STpNReRu9zIPmya0nAc
         8cUkC0mJFECow4aL6MnE35ay6sihbveHUbqa4+upLfyO9vg/Yr/KLfJJLsTrvTTi+kER
         2iEW26QHNuNqTfn0LHhQyfswv+P2bHUJkuYH77lnxgFd35UcUQ3RPZsm2LMtuY1QBKqC
         xGlKA8yn9SfMz6+hjegX+XdQjo2uuVsL/ZuAqkJ85jD/rUwdqcFOVtHoTBhMqtPoQsyA
         fRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538639; x=1782143439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G7SbATcVMiFsT79EwQb59/1DavxNWK+xOjZVrckBY18=;
        b=czU9ra848ghAhTmLZWo+xH+JL+tq2+c1lkmssa17NtwYl4WWTO/AZQ1Hk1KTzN49e9
         K7ljburRTWewcUF2arJ4PscsvkTnEiB0WwbVNgp86tty/xGOeKzqHPnwGyy73AfKo0Km
         SIv9xRc5pq6I841JKwwBr79okTr0TiaBrG42lNg9yM7PHcGh3A9K6rk79vC/MKZFK3H3
         fZwsrOr1cMsD3teq0qELmEZkl2Ak3SFsx9cPQDXN19nbdaxkDr7WFIK1OOAYzovdchgT
         2QqeeZNl3Y7LizWkofwR5bVAv7T4MBwxf0VEqxJJZkIRlbAWSHVBx9LgpOl1bNRE9+nC
         MCLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E6Fw2crLAgjp6ig718B34qONen0t8dcoBDXC0hk7phF/JLtK2Ku+dcX2SmzgirEJgVembfNBv+CwiOfN1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJx5oSyOpuMMipVmrllyIqCwBx3/bTxrnrIvukLZwjpD1EfWQg
	H3b5rqJaM1s3AX1Wm0h2V88E2KVTrtrnMGEOzWeLUQ9Y++mRGVQEQwnlMlbK5RKXvVMlT4P0VWj
	DZYdFKdDhxWmY+vtBqR1351C6wq2Ezc2Ntuy/HwgSsfOoKRMbIgevtQJz7m645w36yGZZ
X-Gm-Gg: Acq92OF0fDrg8ckey4zp6KTgzHP/yc5Og60Q7c3t/4lc8szuIxYxVdKTZ9NqXTcKw6I
	Xs1MBgh4Sre1WqRXkrnjpW7tuVkI6QKzrVzAHuUa6li0Eu0naWcFc07Ak5yXF5caijF1m5qZQtS
	0SxhTmu5e1bSaHsI26vD7557fKfI5AKN/sfPRgyZhdYbGoojPQ+2c+o5mc+pIJgnlDxw1bsBo+b
	EyErREOlP2etf1KHofy/kVd8YmRB32EHTaeYjC8r+ELX6GtTVZZvRA/5c/4sw+pG4Wutj4lWk09
	xAt2r7w6eSDq/7p/NjtgfHBcrh8tl4LIWxWO8vFgQmgNTA8IvVfaa3Sq7q/XjwAMUxdLk0J8/PR
	Gzk6Tdxej63VqibIfFht9+TssqJnqw4WHKO2f2uDI3n7sBRaUm50=
X-Received: by 2002:a05:6102:2c85:b0:612:c135:1b77 with SMTP id ada2fe7eead31-71e88df2b42mr7328469137.27.1781538639325;
        Mon, 15 Jun 2026 08:50:39 -0700 (PDT)
X-Received: by 2002:a05:6102:2c85:b0:612:c135:1b77 with SMTP id ada2fe7eead31-71e88df2b42mr7328430137.27.1781538638884;
        Mon, 15 Jun 2026 08:50:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7fe3:eaf0:5a0b:2610])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm38643032f8f.10.2026.06.15.08.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:50:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:49:59 +0200
Subject: [PATCH v2 8/8] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-qce-fix-self-tests-v2-8-dc911f1aad42@oss.qualcomm.com>
References: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
In-Reply-To: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KvKsD1oCE0rkeeerl1Qkrj3anJH4Nry20STguSSstzI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMB80S9JUjxQh1fbW6vsL+klslVG3uBeVlD5ko
 2GTT+AMYLqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajAfNAAKCRAFnS7L/zaE
 w9yeD/4oOa+p/BCe7oqls3ipN23ye/CvvP+Hm0YAu/ZnFZ2vYC7CcspnA3KW+BV9CHwth+IDCJC
 WCHAkLVLSWXgkx7Wjg8PxsTccW2uzP32pO5VHclJN+BVxfcYHKOmYZ+oQ5l8SXUFfaq6uMc2cdx
 qpK1EKvCb7900lxcJyVDaWXaz4npFoLCZgAc6pk9QLqlXPF4gkLlEUGwftkILomWdijPP0ZNANj
 SmcRyyo3+1GOXGGw+5775DnK0MWKJzwR4OlrJIwkI5gldeeu7FBt6zahvVXY1f6FCrvPXsvMoyZ
 WP+qZTXfgfiCdsX8oni5ZD8fKJ5Sf1BDBnboqLN58KpGXKxgXEDGASIVCvz/txwq9IY0FBk1SKv
 cf7kMtmIVpPwKlmP40MGqSa/JFvlnT3eapot85VGEXgH+DYt6+by+L+aH/Es2O/u9j4p2BbIXM+
 oirhMjpuGz2/4fWMIHQ0eOyH0Z+27dY5F2lGW7diddEWyiFapPZl+2NcQyHpYDgxj8YpsU0HA/G
 E9oeHikId3AG6kaewRpyhVfu0g063eSo3z6gT9yLpfuZunlSKLpV9N5wzfQCrllNG4mU6H1SeRU
 W1U9xCXAg5H8m8OWvx+lbQtSBvIpHmsPozwG73vAst8wVvHqLXdmZw3KDt94j3yUC4CDhfwvvvu
 qLcpMFQBWlGKy8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX3o5h7iMkWMWO
 +RtJzgVwDNKuNLqSLjtiHzAilyoztgtqo5C/zE7H6PShCnCOvuS7uDfCHolsQcSgZHVEnxXMo69
 TdcNoxQHtyDlzX2/7aqqcZiD+1er2Hs=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a301f50 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX64v3eG24SifB
 wWSEdw9cEW34AiXAUUOVJLUXMEVgfwox113RQwTXyL3hSOl3rVpdAf0GBAsMx8cxZ4jrlmll5NV
 K+6OdCGt9qEnOWW8Zpnt7XCi3RkWsGeff6KyAlxPS6cNh+KI/4P4z5AfZu+Z2l/+sFrWud8JLaa
 qGA1Et//ZzJ14L0kzzyMafZ8gPV8KS39vjl4P7yinpEMFwmxAeqJo1vhdCLH+aMvrFULFA/dpMq
 E8i7HnANi78APbmrv5ZGfjC4+B15xVGsGVQf9R2hPXU3CGQ0ORKlKfXdhV6QnnsvNOeHMqNLWlT
 N+Ro805DGM4344ZANbl0RAxCl+GfngAUjoeMOqeTE7h/UyBTSTfFyJgTH+FEM/8vIEeWGYHf1T2
 /3slcqHALrs6lDFQzSqnBu9ia5I/Lrb2RVda7MMorbX8eFKxFz/1WxQY9OuVhIIKX5Mhf2XeQui
 DwpVGr+4DQ7van6s/Cw==
X-Proofpoint-GUID: 9OrmzdOyCOemQF2gss9zwbqw4_jDVrNu
X-Proofpoint-ORIG-GUID: 9OrmzdOyCOemQF2gss9zwbqw4_jDVrNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150167
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
	TAGGED_FROM(0.00)[bounces-113219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 4D19768807C

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 46d3e3eb53b271e2ce755847bbcc83f81b9bda7e..2f4bb4fcd8265a0f7c2f568dfb8915b8c6b8ecee 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -500,7 +500,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -524,6 +525,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


