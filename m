Return-Path: <linux-arm-msm+bounces-116331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id svWsE5m/R2qeegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:56:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FF703248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 15:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KRPhwA/o";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rj70q6qs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E57130A7F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 13:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD483EE1F6;
	Fri,  3 Jul 2026 13:45:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054C3E5EF2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 13:45:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086348; cv=none; b=qBUKgJLwoVU+87AO10xY7LIPew9ZOdfChjx6pnHBf1gbNa348G8OfQrg8TrNKZje9uRynw2D0f02E2+fxo0FaAojdj1y/ztmNPReL3HH4XqKivV1bogzoLh7yxjUondpfK+jQdR3Sw/CI7pRJbKUAigbFUFwBmJaTSag/VfUY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086348; c=relaxed/simple;
	bh=OKx/GH7ZUq9+Mjfs4xDvFsGX2/Vn8N7/Q0k8/BzXAPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMmjS2++XrYPLnlKmvgdSHzM6/rTmdZA/cb81h6+XpjnKm4Glqhln6P6AvxSVPZ1NPVv07aNtDk8NoBUQo9wC3+COLN4lnZneG03jZT+Sr+zvZmeQWpiJCRieT0akGef7ETNFJMklzsfYGHCe171qBA+3Sc3u27iewLL3NSSLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRPhwA/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rj70q6qs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D160A053899
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 13:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=KRPhwA/oh9GV+uNe
	1MwR120BO+YSIq3ukMGeVBkcNZ5Kq3I5QOL0MKh6GD0UGJx4JioKC0KrZhqHprCX
	/upucVc46jPkUtqpoIH6svQnEQiN1ucR7xoGqS+6VUkQk/x4I6LXRFd2C7rngb35
	bdHPBxAI78RtRL+1+im0WisB2E+fI9770b9Gh+5O7PM4nIxpjTDS9eleXZVGc9kE
	cvk64B0goHWTRwLh9h+RBZZRpzoJHGAvT5zlKLBHvOqgJLfDQdAxd10A/CUMDXUl
	cEl2S5PfetXf8QNlHbKCosSTnlVM6DKsZaOdZZrKZk6CzVLKZHDpox4ONUWWS+Em
	cPOfJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkg4s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:45:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91ed0e140c5so108076385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086343; x=1783691143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=Rj70q6qsx+bZ6l+AswC7+k9Ht7zn215LQIncwfzfjFTWyP1tQIIp4L1fu6Ldrsb5ZC
         du6QjPOsYSn/inr0AcnrvxRaN3/udaRVic4j9APkre0fFQ7yaLnSCS74kO4LrUevlwqY
         pfwg0Tmkhix1kdF2dfBCZ49+oWOQf7qzW2utDUPPMLkaGev71LV+E+Ctsb7jmkjHHaCY
         FCcXqU4lTE1bLAKV/RN2SNRDcNYXajfdNf/KoR0VO5wJOI47Oeu636aZrlwOzVPQwRzk
         2e4Gf655Qx5PpAEUvB6MVhtpfp02qyXtTDGATWtd7fyC6bS9FVnnUZtzIE4nI4R+ayiG
         XLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086343; x=1783691143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=ExlIlLZe5b5QbtUR8UwWNleYZlFs6OUwIIy7uo1/aWkRNp5xK+FkZVEWsEhKfWFbxo
         4ymG5/ok6J07V5KVcF+0Uo3ogEE90Ss0CFbW7NtHoeeewdywcKIudFIfM3a8VriU/sa+
         8WBAednkLbHPXokutJBmMQMaYP7TgeSgaXpVxyfdIyjKxHJM9HUbjDYNs6UOuuUWOGUr
         oSHWu6a1YI2WNABG0+wQSK7Wro80qT2FyzQqqw/xNzTJz4ZZuNbNP5N0o5GGLL2KzsYT
         qRSM1u+UEe8o39ycA/tbykU3S1daxZcL8HkEAVMuYGXtuz0RfiDr2y3n0FqHwWRpICw2
         tmaA==
X-Forwarded-Encrypted: i=1; AFNElJ87oUEyiQlKKII9DXmpZjQpixn4jklzT22on9v198BJ3AjL4MzlNvBA/MP7f99UvpSg4lNYmpUlQB4NcXr1@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3xVwMrXXVZFUgHxmL6pMgOzKjMjzkIU6LivuYiO5zQiE4eYA
	hIfilB7d43vBznLbl6ZtN6f8ZtfokVetLWGVCnMlKeDWvqjxnw1Xy6cbeaK4g57wA1bSnyUmJth
	lnJ9GchmGhF5jcX4m9CUeiT7GHpE/bcja6l3b4w4+OVhDvnSw9ovDSl96/V24/BwTsIe1
X-Gm-Gg: AfdE7clzAhuQUJ2Y+f78N3IMG1gQc8WQgxq+XX70xJf6kDYzIYqoSm0bkwDKrADZO9l
	y9HRBDtB/mutSBDL4exTgvtIqdDKPhoOrwxOW43aXUyJXMP0Hxq5cOyBPJiyjTPS1e1hsqoN66C
	1CyM6vEBev79JrJ/CfMfO2B0H7iMpUqEpNkuNhZqovJtG+VT+fhbRhlOvAmLIZ29e95bENmmXko
	uj2/chTfyBUZ9idMX+Q/bWn8L1aQKmTO9PX5PfzqG8bFTx55n6AbLBSNn8fa6nbgKPH3uYN3bz1
	J4m86vNXBn8zMcqfu3lpLh0hHtCdQwiUYyEXCVL/YkNQiRv1xt0aTMPkzVspxNo1RZ9e014tmpq
	ODTIooK8UCiEFZGi8xzC0QASKbt8p60fswuKseZq0WG9Cy+xP4MEgp4I5ZTLBm8LypGJOmf0Ns9
	s7cas/idVeRJ+Hrb5oa8m3p3ut2hglQtA0oOL/opeVLNJhJGd4qAM97a+aBjFwji0=
X-Received: by 2002:a05:620a:2847:b0:92e:64a8:2305 with SMTP id af79cd13be357-92e7850c4e8mr1401572185a.57.1783086343098;
        Fri, 03 Jul 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2847:b0:92e:64a8:2305 with SMTP id af79cd13be357-92e7850c4e8mr1401564185a.57.1783086342473;
        Fri, 03 Jul 2026 06:45:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:21 +0200
Subject: [PATCH v8 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-8-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX+oFkxGq/fxIA
 SEXMadM/mFa7mb6tx68EzzNu7pnH7RhIVzpcFigAUD2rkwimBY76MMFbSeT+AAQF2zvKAeb5MoA
 aW27jJ63v/NtrFVlFEqN/ojLOXjfyME/WvvQo3DnZjVf/7V4RqDC06iUdLbAnAcHIhyxqLan5C6
 UsTLtyZEW2+/j41tWcLL9YxSq/4niyFITldG+U9NgmsQiWcEMvCudWXwcImTSwC9WAxrSjjkUL0
 cmHjOdGbXgkz1HIHuj0x+6mbiarc1CVXE/B+ZxR/claaGNGOm91TFXqHO6eXoN8xrkKD8amwfHH
 y8JQwnuTT/71K+XrnYdsKXLQsmggV9rZRRNmNQtpPCPdZR/Wtm9FT/gG9TjWeDxMnCj7gj4IVxI
 8tyixHwj1dmsJdM5orHi842H0jPUD9fYlKSadwXn9uV8TxxgiO5r55QmfF/hTJjIUdqtdlZwJ58
 OjIIzWKnKUTpFXvDaUg==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47bd07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bQt01WYRe3-ft4momaHFDX3s15ElyG6_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX0iTen1H0qr+c
 xq+zQge1holFhpfHcB13gKDurjvuZjO/72HGLXhx2uUiqIhCf8Cr+N3HomQFJmLSh85Wor3i0U/
 lcuJc6TL8jor/y81OHHGCE/z+KeSh7o=
X-Proofpoint-GUID: bQt01WYRe3-ft4momaHFDX3s15ElyG6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116331-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:list
 s@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 250FF703248

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


