Return-Path: <linux-arm-msm+bounces-115162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z9YEO8qDQmqp8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:40:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71D6DC290
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gBzHC4NM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QjreSUoU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115162-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115162-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC35530E9DA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C2E416CF7;
	Mon, 29 Jun 2026 14:19:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18B138E8BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:19:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742793; cv=none; b=N1XMsJTUGV22qTCb0MhU1NpiAUekqX4ezXfTe/iM1XUpDEH9RNADOnhofcoYLu4kLWftsqhiIcgGJy4nyUh5YP4j0MyhjybPYHO04YaLqluWFOCa+g2G4h+G8FHWf4znhwUXdx5CmXV3cGj+KXJMLueR6UCnDoaBwsKIihRLOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742793; c=relaxed/simple;
	bh=rQgpm1LAp8Ze9rYCKHTd/AfGOAZNzp9NuWlsN6coBvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEeQdVpyLjMdkQIWtJGZy/RNZUQHsccXjrEnhC1sgke4LdgSAkeanD/HoeFuanhfhjs+mnViOeF2x5SiV5QUbqs9G7c6fjrJPEvo7RRv29vCrl3C7Vd657Ejaa7/sJxrsJOWsMGdlQGjYE5oVvpHZDgslMbWkjkwBIZUkEDKiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBzHC4NM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjreSUoU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRx72592811
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=; b=gBzHC4NMLQE645GF
	cX2OP3JmhrauRQHKiSu7RolKOIXPS+Zrqn/tVtTnIXC6TQXZsFFRqQl937NYtKw6
	F347zd5H4T5cQriIXhmv2zaYLL0hKKramF99Hbno7/iNUyF6u88+gETP2kn6vuJY
	BRK7nxtidFAOFT/ML8eBn/PuvjLv06dmtRgA2kPxd2MUKAr22WmJcycwt11GF8Kk
	TtpuNTWHYprPfIJJZK5htlamj/WYMYIJQXeFJzGdZq+24C+TyGc0CdMjiL4kIELc
	enmkU8Ih5amhf9yvzsEpcZS28CUGr7xnrR+f9OdQlLEeIjdwuUoUGLyFh0RqtZ/D
	ri5Swg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vj26j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:19:51 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8003dfff682so60386817b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742791; x=1783347591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=;
        b=QjreSUoUWYg5UaLmLoPjJNMt8h6hagRirqryaLJq3OMXHlQnXMFMuejGyKAc1Bsv4j
         4ngG0THc5x+rynvJx3ENQV5OULo7r/caP7sfHh8LoLUfdWOicPtQqM7WG93jZly9JyS9
         nO+Hre4KplAgqxCsTeSbJ+MQW+HPhSQJZaKMU/3jcxKWcGnhAT82YWMBeMrKAUGnhRZn
         kSTQj0DPOjZ2oaHhJuyySuQqt3eu0kFRvjhUBv695snjggeG8E7cdRZ5s3KyC+wP1kjt
         OeIh8C72V1Fu3KgMzBllMDX5B8psuM9RB56ssbJIr4bF3gNzF36ceKPOYGe+qfWGHgPa
         y/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742791; x=1783347591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etscpkg68QaUhE6Xg8B3jE28O6TP7KNlNL8MaZAKnRE=;
        b=Qzk7WQc5laKzlAYGeZmyh/duum7W47Mbi4EGbanXkQXD1QKzyxvwP8niyS4IXdDPYW
         k954bed9rFopBLRwceWARAOdt4HISo1mA9j7VAL3DVo6p34Vn6i3O8e0yuVfWccIwWMI
         fhAoQsmQ5Eh3HMWn7cETZdMtw2prT1XFl0JuGi/E8s3Ik/2SMnjFlhdaCEQv2+oVo0fU
         6FA+S0t1sXVnX2tdX/L78qMQpHXUkHzIYmfQ8F3xDzRzl9oheFrXvAqMWC+iIpf0crb1
         ApqX0donDUuzUKaxp/umEcqmgHA+v09c/dbnf5XjY6iOgJ84BnqDtkyA5myxgY7tjFGf
         OlSA==
X-Forwarded-Encrypted: i=1; AHgh+RrWjY53TYumoquphLMlz5gn8qL31N6AAgztqTm4j3W//yUSL2TcT81K3KN5dKGTbn/0s+DzCclz3c3SBlL1@vger.kernel.org
X-Gm-Message-State: AOJu0YyPExVXBiQUBr/lF5xlwHHx0VN673/wD5augnFzYbaxo37Wq2rw
	fl+1vWPNV6FzgYGQbOWooDNGzZTnepAG58GMsHymasnZAKMokWuulX+V8ts/tey9Z/JizPgqLeT
	F9AZv3IURq8gOmxVR+Xy3pepCmngKTTYcLL27HBz9rH01w90m+V0ALTYyl7mhlvH+XIom
X-Gm-Gg: AfdE7cl8E6EqxFLFYbxVCJ92pr21ncPEOErSa0B+I7KnjG1AcEaFPxgBeYF5WQ4tXEE
	SS8/kC6f5Kd500ROGnsK+Ip/3sbSfTVjc5f81xOhQowFa/evhIYTqmw5VudCN9kfqPnDXPZG5E3
	dlsw443pGf7Xw+wPVzYQnP+1ffEZA2ZLucOeS/afPTXZfZd0qnN5aJS3JE0NwuZUrfrvuDPmimp
	Uu8yADhNvt4NtDBjzDRlATzqBmJskoFbu/WDxmq6bu2ojTtMI1WUvvNkb0pPrT6UFOxjp0KqXP5
	HWxW86B5XfwfaAhoTm5g3xju1NjIO3ajXwag3/hbI1GMyduN6axU/zlnVcpDGseeMC64tIhXfkC
	hdJ0zOEho/zXio4iKwZd2MFt46CF/oXleBkNhN8i51rYN/eC6D+4khdn7FIUIeog=
X-Received: by 2002:a05:690c:e3cb:b0:7dc:6863:de6f with SMTP id 00721157ae682-80a6af9b959mr174914127b3.15.1782742790944;
        Mon, 29 Jun 2026 07:19:50 -0700 (PDT)
X-Received: by 2002:a05:690c:e3cb:b0:7dc:6863:de6f with SMTP id 00721157ae682-80a6af9b959mr174913757b3.15.1782742790389;
        Mon, 29 Jun 2026 07:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:b450:a0df:5898:4058:3dfc:f588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80efaab844fsm14562427b3.6.2026.06.29.07.19.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 07:19:49 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Date: Mon, 29 Jun 2026 07:19:46 -0700
Message-ID: <20260629070903.1341-1-jason.pettit@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com> <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com> <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com> <20260627190612.27271-1-jason.pettit@oss.qualcomm.com> <e7bal26fyufjh2f4j6rh57bcdvubp3qqydk4pjagq3qjdz3ywz@wtfsiff726zx> <20260628162913.66306-1-jason.pettit@oss.qualcomm.com> <159cefa7-63a3-4b94-8d09-6b652002bcea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R8eUtIVJWuyfTNnWRtl9o1K0HI0ic1O3
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a427f07 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=f8nfmbKWDvjpq20I0osA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX4D7mwE868Oh+
 dG2eOQl8JaFlJr4het5rmE6XjGQjpsu/5qGdOcuKbxEIa/qukgX2U9gnDehDiLMvWrCg2pecVTT
 cv/20Ezt6xfrctY/BMB1lD1lDdM0kAs=
X-Proofpoint-ORIG-GUID: R8eUtIVJWuyfTNnWRtl9o1K0HI0ic1O3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfXzlnDT1Q0vMsb
 hClCciNciNM5jYAyGSSo+VJNJOLeQdXriJB4TbtkT0O8ijfl0YOmbj+VW9T4+/K7qG9TW/Wui3o
 aaMTVuZVgaZBNxxuukTWbSyIXMEOp9QNkAnSZfnvzQu37x+XteUc9WlZt2m1ehsDUJTBW0Y4WOg
 p/nhEB0mC8ykWt3eQ99qPgy+3DNaW1rY9fROcd9PBakJwDYbOtyn+qMj+k/0upivmsU5odoEU9t
 HFu1ddUHI2jYKB6R8n3NVpJB5R/gm3BQJxCLzAp4ewZFZ9WWiLW4EZaapsS7q9DC0ZiSrWN3ixh
 UpkANoKAElZUaNbd8LBWLSmexdkixZhuGKjx3GdUTAKe+x8y9ybezLjm8wbhFZ08kr/IcBtxnyN
 IhcZDJnO3AYFUsUiU7zjqownwfE3QuMO9FR0bl4yK+Iwtp4v9vB1nQhOZNwf5vcTF/CDhiMAEnZ
 p/OgjClUyMhRv3aNddQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115162-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C71D6DC290

On Mon, 29 Jun 2026 11:47:52 +0200, Konrad Dybcio wrote:
> At a glance, this seems to be different vs the reference data, could
> you give it a spin?
> [...]
> -	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),

The prerequisite this v2 lists (the Glymur DP PLL change,
20260419-glymur_dp-v1-1-ad1067a8e8ae) already includes that 0x04 -> 0x3b
change, so it is applied in my build. Just to be sure, I retested with
&usb_2 and &usb_2_hsphy removed, and the same result is observed.

I can leave my v2 as-is and wait to submit v3 if there are other
patch series pending that I should wait for.

Thanks,
Jason

