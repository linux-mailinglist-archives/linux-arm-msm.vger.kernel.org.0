Return-Path: <linux-arm-msm+bounces-114897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GrovKx00QmoS1wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:00:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35C6D7CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:00:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F1Fcs9z1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AOBEQBjK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66BC3305B583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30083FA5D8;
	Mon, 29 Jun 2026 08:55:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7293F9281
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723339; cv=none; b=VPqKUY0SXVFKlEEVQNHQjv87V73ddOoE+rwjCJHEZNsPQNVFy8ZHgmrcVyT8CNOUb1Fh0d2gSYMW5uM+Q6f2eXIuT1QbzGs0AC1mzTw/nYC3nFiBsOo3HDB2mC9AFiXy25Qnen3+/ZImPCxV5vIxRZfS01rqHAsKEq/SQ5Y8z+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723339; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eD+0dRqX+QUYVLjQx55kx85UL5Sd+JxLyn7ls29SXftmlQsA47hBMDCGClimgcZNIwR96NEa+c6UXbBXtqnvHc4eughJNTgHts0NRz2l4fAuQQhluh5izZal3yyR9oiamPc008S7w0NaJZuuYtyyxAQKu96AxtcB5yzd44sLLsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1Fcs9z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOBEQBjK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rIYW2097150
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=F1Fcs9z1Aw6XRZTs
	Um7fEWGgX5KMk8DW9SYSLWVtVnGWMJoda5P8TBu5fBZ3dVMgwzv6NR9VP+2jTMO9
	F9h+ZjaDO9PlssYceWEKHXRrKeR2KStUYV7d4vpowsopRKjKBUAzdLPtVtLtWLbY
	fDxJri626kkWHDHjJmKmv+ksfmW5/EqibfVeuYrF/4mLCNM4Ot4/R1kY5GmT0knZ
	E8//UYQO8q/RRHP/sc38FkSY62FIrSbjWcgouKPze7dsixwql/LsXLDVr0HdN0Fd
	qeQ/zpD0gUl6oTpQwEdeGYE4Ew8MW6Hsq1+kAIhSwnMR5g7MaLJRA0WXT+K+2U/K
	0tmChg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7wfbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:37 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd954154b1so706076e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723336; x=1783328136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=AOBEQBjKIgTnXwJxyvX7rCT6xzjLuyp80J8/Vs3oqHsJBHrG2y0KRGA2YEtOpOS8vt
         JKrtwBT+mhW1wkE15eEQ+mAcCo1Q55vq/npwcu2Fr8qUMzkSvW4Uc1cTfVxbSwsc6pKV
         ceVvKjgUGZjr+k4I9USXnZ8GYs0G5NJioLGrvM4apFa+4lcwFDIzSFUf1oU0sANNeIaj
         DGDi63ucVzCqndpqirmAtu3S6tTrBFiOS/sGM+IHFz5IfWvoUty8zOuP0Qvam0MozNcY
         4o/o8ImtsDLLcyOijuP3I+TlQ2iRO+lG2AlTvA3x758nGQWkk3t4A+sAigeXxqU0HGEA
         5uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723336; x=1783328136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=NVYwF9uN7nT9zkcN3Ppxpue2hbSUZ2WIkm5u+U0H8Dq4x48ZVG9k6SOXC3Pf425GyW
         JK2FV0uX5Yh+q4VXcEJO++HUc2enlY/7+6GOCYICmsTd1W6X87tuhUVilxrFt3Konmrv
         vfPURBm2mTi9NfnIj4JEOuLy0DWYoG9VyXeIg4MHuy74exkSQ4UNckJlRLdt3jmU/zqU
         6mEhpUnK6TaI3ZRZMb78Fm8T35YJAtCmZwYosrw1m4bMrhNBrMJ1+cHgzaABIjJWAmZU
         o7iCHCCX6R6/W3j1w0Ar8hkFR2ciPYlQO2FSmFHswLu3m29Kt2Yl31v3aERgoIoePYel
         lUtg==
X-Forwarded-Encrypted: i=1; AHgh+RqfCHj6B9LsI2iI5hjteW2YKTmUJlVeL6WJcW9and4mi8/yPJ6u1vkwqpwnBQaawZIRhHOJoc3cHYr9czt/@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWRUB2fRbByeVW1FvwLH8Sf/IPjvJQsfk2j4s6JJwC/irO4H6
	yChOr6qt7j4Wn3c5ZEuVYG8zdw3Qt6+k3Td9Ix0sZaAFa+u1RlP2z8hHh0qaCC30YkEros1MlpI
	bHibFdRhQGPrf7v0qAigY2Bw3pWA38W+2x9fPp4BgWHZv3CzDz7efrM1Mawz0JuV0+NXC
X-Gm-Gg: AfdE7ckWmvuaaQzqYZhEsSA+G4AdkzVbo+pLQo86M1BeAVQqkFaEZJdod0t6vPqZ1uX
	f0nNMossUDyQ2On8w4mKRfVv2A8TjMaeJKLaFCmxynlP+lx9kssPsrdSuzkzcJvv1a9oZmUr7s7
	BZhSckjgb1OGiWbxGnM/X35zeFVnsYYWBiRbhJEvmWt517d36r2msrxVbmao1WgUzEA3xaaVo5w
	VtkeWminprGn1xaYkEkgc2IKu5POw0+/bH6nSURCwrIjn6JAFxbDYJ8ntZ4bZwRpeEAYXDYH+vE
	TLMGGCjlQqQLKqrNd4fBkCTj/+fk/6V1hR0C8S1SwGrIAap4JxZBXXN050O1yz4JIWiSFmjagQD
	hfQXqbjGmcNszPYmr1A5mo5eQ0hTM/XfIhmIs/4aJB3MozQWew3SdQIqYDI9k20+4xT0nVmMfH8
	nJaqhWY5V3bSE6W5SK7liWCBlqKzjhA5OLmDvBdINR0WKv41Fo2XxL8SuZAZuC8G66gN2IL3o3O
	7x0dmQoiqRU2UH3xbtT
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6342996e0c.4.1782723336530;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6342973e0c.4.1782723336048;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:23 +0200
Subject: [PATCH v6 4/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-4-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXxSGF0VYQGZnc
 6vW2NqlfygNQfK6tyHfyCS9xAfo3d2lg/Rmd15wlqkbep9VXaZovDs3U5XD6wvghBo5icvoJc2S
 jFKQcXVqkmINdSu3QNnJfHvojoMgRd8ezsTiS6oGpO0iuf8HYQySEjFNrx8Td+AOhugxOZzxbJG
 ywgwC5Y9SjfVYUexUl9jxSkhWyQppDarUdYly0OVXVaN3qbdvAkH55Gtj6cgK0grKkS1krlVotz
 Ajctyz86LmVbcXaxt/4jaEapFZR5CxpicgIIca60NAvL6XTr8rI3fZt+7mWKk319GBSwq/biOkz
 YsAiDHClXp/zUcVKcWD8MxUE1E6w6zlF4IMOpkRekIFX3wWENKUNxYLDvarOw9bgojydGDTTldH
 kwnRC38OzIeae++upB8VD/TBkUS7F7AmJUFx6yKxHua3gSpjrknxIebUY51Ddizs4NFMgwLnV0/
 b2Dw4Eg/HDD4meF3ECQ==
X-Proofpoint-GUID: TpEaJsM7An91mAcjzYhe_lNuF90azxsg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX2SfqIvByHYX3
 Ml+CchAdRO9rEqSK36tpaiYKhc78JLBXjCndh7uC2Op1XrZBK8fFeaGMRPuWKmDNRIZzAvJPybC
 h+6VwDI94QNmHflwid8EQ/9HDUtLtpQ=
X-Proofpoint-ORIG-GUID: TpEaJsM7An91mAcjzYhe_lNuF90azxsg
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a423309 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
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
	TAGGED_FROM(0.00)[bounces-114897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:list
 s@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: ED35C6D7CB2

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


