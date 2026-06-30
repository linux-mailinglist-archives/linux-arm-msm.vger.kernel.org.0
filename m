Return-Path: <linux-arm-msm+bounces-115462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1UWzAcrPQ2r/iwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:16:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC96E54EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I0UQOzQr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkyvSnRQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AED0304C6E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347C241C2F0;
	Tue, 30 Jun 2026 14:16:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16FA31F9AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828974; cv=none; b=dj76xv2n2SBD9TRZ19KfZ86m9atoFIbkBy+hgi0Km8+wloaxZoO3TXo5FogczOqSv9EU3lDIUJs3/NBx5HP2aIeksRXAxmuFW+Tts+BhqNZ/8igoiyng7H1Wykr/soU+kOu81nB5tUQNy8lmKbWeSzQV7hFTgUuviNT+4CyUpz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828974; c=relaxed/simple;
	bh=PP+eO0GGVrkcXxcUDViMSrIOmtbm8bbCSnGTZe+XxBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RN8l6g+NCgYZ2WraIb5ERatvmSlvU6MTFQsG1C1yE+fLNgjSDBW2FiiGcQTcOIyV5/s7XykNXaKIrSgKEHEJ62YoUU2iT0uNON3qeHesdWXgdxWfL4CCPtNxwI9sL1QZqI5wKkXKzwZZU8ODURY1zywQNtbq4RCtuHxk7XesP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0UQOzQr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkyvSnRQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDGRY2149063
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=; b=I0UQOzQrj/5+tiUR
	IXqiuGbzL1tq5aXjesymfjoRrRtSocVxHeRXyRgIHaBgR9he59OC5IgR1ROId2UC
	saxIrwqQVwfF9lubVPosAxgHFclWWYa0pioApX2+wUgraDQW7E3c8J6pbjXbb1vp
	OkcNzg28sR7hOeQFDvIcgRVcMZsSQI8AR8DvT65llTVkAM0VZxh9P9f8U0KLzLgg
	baruQP+dlhAw/zjhUdTueBtlxxXfDpLDTxXC4S5jYPT7c+Hre7rdBcqToq6fOE3l
	S+azbq4DEEdyFdHNJ2Kqq6GhsuurE58b2PVlhCtR9ft9JjpwAXg7cnJqF6IR/hx7
	SIi0mA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2vrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969330d8ba1so1021716241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828971; x=1783433771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=EkyvSnRQYevkzZWEmJLzuoIDfNzxW1jQVwO9fg8b3GlzhrGmt+cxw5kSKJK/lRGJK1
         ItHEAEpSvvNu49GYazTUlwwlUyZueaXmNHnnzfdyG5spsnpmP86eeLLLnG7S/LeCnSJB
         GpJQyidZr0zI0yOtaGOYzEcR+Vy3vb60mKZKS1U3IYmYt7zKO3uN5QwbhjoapO1D1UI9
         Tg7zgjjcwZ7sjYr/PU6w9/n8x3WaC/zoMLonUrWW+akasSs43ueMDUdVhkf9eIpihyqQ
         gpQb1NuYTtzqdtkMPszceYbjBpoKzljXQL/7BjrFXxVV5XCMCZg+fZ+rNhvg4BUHMr1C
         8Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828971; x=1783433771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuTeDkPIjXpd0ifTlSAJDdqraFMrGLJdsMfuXYMtvhM=;
        b=f6ARtiMT2jqbQH6fKuII1ETUgJH/dOEPT0UtZZcWIH3Rd7UIrpBtqwsXFoNSR2VF5U
         Da4Cq4s+s2E+bxj7Hz9PNX8dLBKxxKA7QlOu7zY/OJ1mrbDVo2Q7Z79TGjM1AMFcH4FD
         L430v/5+sNqN7u6F+YS6/BJ8AdDgA3V5zqYUkCGheApEFGvoPgv+5vrdnUiDtGnwhoUU
         /GtrPwC5b88WNVHm6QEBmx9t5gOA7p8nf2U7JXqYjT2ziM/fnuyrdfjq5jGe/hYn3TxR
         k0s1+SUt28MUEMFuXEafTRzuA4lvvpYMAQjNsgtFNeiVpdvFKV6qFWjDGxYItbpTTpIa
         1KqQ==
X-Gm-Message-State: AOJu0Yygura2+gc0aNnih2dMUfvQ+yggd7g5q4d5SNbqV5KECl56txv7
	IvKk0j7VxMgPEFnULAyv7m/1Ob51aVVdZFoH/684M88ukOAqIh8oOlQr5cRsJCQ8WL2oxxjWTP8
	rYtShQ+vNt2luhC5+ea3JeI8X3q26PniPyeMXQ8xc783XabhSZ9Gr2GsEc6GRfMTuFxHkkie09W
	9PPbM=
X-Gm-Gg: AfdE7cknwuIQQt+TyxQTF51VWqF9HUU3IkIWWcZ1DlwsN4UwnWOrUlU+Q7WIYAQ4vpo
	nIlcKP4g69TCazEhepz7MI1VygpY5HGwag+kwNcBtdsLz2Q8bGo5DD513Nw8YqlsYidnav1pzFA
	SoodLzOdEvvPJDHVn9gUiV3MWDX3sXuuASrgvnFWtpU9PeZEq13gUatdMwIzXeCQE8TTq9xMDpM
	r/j7qXIiiCYFOZER17YFEhFK+6ebw8fULsrJxRZa8qfLozqPU9FLOJvRUfgl3ebjXasB8z0kvKH
	kF+xUv5OcHQbIJ2GuTq9oZGglCG1d7UbfOyljOVz1e/LoPbjuOZeVD8JQvL6+lQWnJWwrgk0JUP
	4TKQAEfpKF+TSMpjrMK+ApOft9PIPDVvlbHdh840=
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324369137.1.1782828970590;
        Tue, 30 Jun 2026 07:16:10 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:737:4cac:52f1 with SMTP id ada2fe7eead31-73cb88bfc85mr324135137.1.1782828968537;
        Tue, 30 Jun 2026 07:16:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb1bf712sm34105425e9.2.2026.06.30.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:16:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
Date: Tue, 30 Jun 2026 16:16:05 +0200
Message-ID: <178282896299.21974.11820844634980571758.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8pep2BAF-DZoDCYNsEOxdlQhk-KJ8MKX
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43cfac cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=no4Ac7NHiWzU62rghnMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 8pep2BAF-DZoDCYNsEOxdlQhk-KJ8MKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX4g3key+l9OqH
 eRJvfmYiOyROKNGu1iR9debKREbckAA9ZISp49UfZHcqkGsectiSd8RYqpTgvhTU6VPDTJTiSBg
 oYpXZYYiWlNHq4vACgYr0BKzMeCYjUljYecu8grQHERxox41C92CS2ONUKGJdon6VTFPChEo5Un
 rObCO9No2F12Kk9kkY51O/OUVxat44Ugoi787q8sKonir/CRH+0dCc/hMn9qZ/JTJj/GoPJA5/E
 M6LAOOGqqpxumj/51drreo0Z8yxp/FgHGpDYJZx6X9HZaL3qj76kQrMimVlsWy53SX+FcXZAIwz
 lsehnv7toVq3I3UI9oliWz977Hn1t+cf5ZPMVL8k7msKZB/6SlbClyBOvxAbctyKDe1h9iMveYO
 gAlSuUvCwTkZXVMihUu9/YX3l+69rrEp0t9QIIvKppNNOHmEQxAHYxathRd+YHyxrAk/csObZaR
 mKh8ok4Wp0WbYQYi1hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX2jHJ4FhynS4Y
 lNGt6FTWJwfHJHwkc8TLsiIwzooRaqjAgvo0HJHtVWM6szl9lckjNGUD0k3bYWV3ksFTqtRbkik
 mcK+fp4O+aSSghXHJAd/FsOZ3bsOExs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115462-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fenglin.wu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EAC96E54EE


On Wed, 10 Jun 2026 00:05:45 -0700, Fenglin Wu wrote:
> 


Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      https://git.kernel.org/brgl/c/32bd01532af59cf0cc6994e2794e0aaa9af5bc8d
[2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
      https://git.kernel.org/brgl/c/8a762912365d4e7402fb8942934681acd0a3bcd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

