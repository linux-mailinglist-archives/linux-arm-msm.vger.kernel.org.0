Return-Path: <linux-arm-msm+bounces-114636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PwUGAV1kPmrFFAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:37:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 956626CC89A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W47d+RMw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U+NHnjqS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11CB330A0698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9013F44E8;
	Fri, 26 Jun 2026 11:30:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0653F44D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473424; cv=none; b=iFr/atUYY4IIBnQlbEkYzdgIYexcCXeXIrKcTwSc0U4gM5tYvWC2kIGO0sFPJyzTj/fnAsjQgMbGKdojaPC/tO6xqxB6ONsXYSEAzJ0OvxsPT4qEfGs0U/NIaC76xajbsAJMrymJAJ2dlK9FdmPSuMI1SngXx6zxdmTzIEKHPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473424; c=relaxed/simple;
	bh=xgMVoshPZPknzHZ+9CuinjN4yQSdGGJbwz7w1W7rtkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlTDiDjbROjAEWCwdurIOxdmvc55kCo4KGMjSGXMi/k/QXViVLSPS5O/NfLRGWz9zW4p4mSHcP+h2z/HU9LIPOW4AlXdmI73ydIe+Fa5QNnGQ9nDLR+2bUk853+I+tX/DPyhM92xhZtURvppYHTckyBUCKrfHSqe5yTXOLwRQYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W47d+RMw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+NHnjqS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcmR91190041
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=; b=W47d+RMwTjTeZNM7
	xMtbtiXinzbPJz87HGvheabfsgn3iVn94I2ENTawJkdofoNGG8fc4ivtY19cieHG
	aPhRmH1F3YsHIfFuvzxwXQkPPyDiNGN8W2jG35fI9XP3rT1pIeUGG2px0zMXPSC2
	th9sHWIccMnG6MinJeG0xRFQZMlrM1GNOz/g+WJXmVurl1MnrUBxgO3zXlmwd+9v
	beu6+tllmi1dq77WYXqQqTJGs5ho8iQipCRjFcEUSURA0nMftySN8DhPJmluIFa3
	NH3Qu4TVsKkljVBBKIvwwbWTgr80/uUr4k2vyMwBCuCggR4iXVAJJZU52CZd8ibd
	BSa3mg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asku943-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:30:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73580bf7bacso18705137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473417; x=1783078217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=;
        b=U+NHnjqSWHSnWqSm6a+nrpFTXYjjijBenODKlghspEZOvzHb8ip+vBaLQmgKWckQIe
         aU66QLA/STnYPqEr5qqAhb1KeCmBIEFCf4UdVPO0/tM5DbB6n4wk23dUNQCZpzjzpNr5
         p/p8EmpYELMJkvS+ZELmouq4WmH2bU12LnvNZwvYj6qKp56wFrsx0HvEEAnQFOsymnct
         Wo28H9ZEmTCFujdfBLOGjHeg7edeMZsw082Ka6K1nn4W2kkRufNBfsLFs8BNLSpgvA1K
         b2q2bmNlaT/RoWOLmT734G/uDJGIFdssOsIyWqLsks33VmCyGL8n3yQp9ZYLY5rJ386S
         WQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473417; x=1783078217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=;
        b=a0WJGTB0X4rq2mQCPnnbQS1PVexqBfCmsRyQQqVnJGoZZDWvd99JUr2H1aT9uyXda9
         2zrUudO8EDzB+OVvP+7DB/WwNyf+YPmZa4Y/0mdhVyhq8ufcLPVi6593BODfsnTRIqU8
         zbazoKmgeQbDrQzWYqDiKhmMii8A8bk8GhaUOcu8tKbjkVePGyDzBQ5OuD/PWN4fgT5P
         USVY5FAiKXzQoLd27n8QtP1lW3o8A2AU2vfKidcV4liFanx+W/22k77lvEk28ErwZe5/
         5znxHVk/sF3K1Z7en8ZGqKmOH9uNMIljhAOWgTshAIKBnX8+6kDPwVhECzGxqTbP7HdW
         pS1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6bPv4G+/i5y89TcCOIlAFex2v+VNSdJ/PEkYyCuD7WmZQQJYvTalPnyllM2RXrGf7gyOHT7mK17I80U2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYfLqFLsndl1WpnFf+4dLp1GwzWqit4NeIboU1Qoh34S1KLJI
	surSlSwU3fDwhj2/EW2ARCOTvX2OBrFBE2gJ8YxEl1xKlX84KzB+UMk3NCBRE2yQPUCmrhdbQ6Q
	MJMVxYpDJwEyyCGQtzmJms+ZP5xwI838VU+fSZBIfRxuqubXFtMX9auuEI3cXTDWbtKBl
X-Gm-Gg: AfdE7cllszBcy7PK2CWH1Z5EGq0vIho73YAw60lOPGuYnEJ0CjRztsIIcQK/SF4B6ik
	h3PiZjCuaaVT10PUMIoz9l2ycvLqe3Wv2taHfciAJRune2dx1V/kODaRi5pSrkOaqb+1AVd8hsH
	C9qCVIBfjfFFIC+MiUs0HgE92dD9CbroxysIN1tJBsyg82HMHMZMbz+3PvIvM/KoDqJ8sWf1pqV
	lWeKrewyxuE4DFW4M31UdaLu/M4YBPdi7ZHpJV126tGfsuXe6u5uYRMVaFLRS1Ga1Qj+j/xIBdg
	iTlIjoN8h1te3n1JbuUwsHfwVqkoj2mFplJeClWUHRqLQ1wUujWMMbZUgkHpTqJaxlYq+Q1pRLB
	kFpAtqq/yOwkE3w6haRb5Sd0NJkp4TP3SKFo=
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1074132137.1.1782473417314;
        Fri, 26 Jun 2026 04:30:17 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1074124137.1.1782473416719;
        Fri, 26 Jun 2026 04:30:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac4774sm2774228a12.3.2026.06.26.04.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:30:15 -0700 (PDT)
Message-ID: <0e0fb3af-968f-46d2-be6c-18b76c7d2a1a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
 <20260626-discerning-light-swan-6b599c@quoll>
 <SN7PR19MB673692EBED649CF6DC9833A89DEB2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB673692EBED649CF6DC9833A89DEB2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfX3YzQsiPDOJmS
 Jq98hAEryAalkNqxXF0/apft+dn0MSpjOb6Rgl5V3yU/JYkPPNXEKxiUGJouPZwwDWTXIh0uSGo
 qWUrGl9v7sFqJL7Q0GP0pfhIl5Ahq7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfXwQdYNO+uNxxm
 ltCFbjLX1r/oj8/g49Oei/w2yOnV30Dl5Dw26Lpw8AuN0RWPW9OwtD99VoCILujW3uQ0C2gSH+3
 jgZPRc6fcDzrEOR8CCKWokUGILmg70eOdAV0t0brDLnRC9KCAI55KyJ7YggJ98Y3/n+kYF1X8qY
 k+aEvORfscqhz6yO+ZvzPJPosuL1X+e5PDJEpoBEq7JL7r8k4SzAUXO4ildIM7U7snq6wBLexxn
 blem2WpQqlEhcjDHKMBGHdaKwGbrbDN8KvkYORfjic5c3vI2n2iLaP5WUeJThOmBBeIynONU+Nq
 kry3VOCeRHhYlWpGcwyDC3kVFbamA/HoBwahh8OD+nfmSmIcBxvDOJbtF2m2FJz7q2B+kdaxcrf
 l4ivvMc6fueL0MD8Ocpds8Y72HXJLAW6s9UqDeQ/tkhFXsjh3k63amirWdIqBcFRZlAY8wUNVjQ
 Ro7FWZN7rRDDV2yhAiQ==
X-Proofpoint-GUID: lULSl9azxMcTQOuzbTHBo-qCC1XePGrR
X-Proofpoint-ORIG-GUID: lULSl9azxMcTQOuzbTHBo-qCC1XePGrR
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e62ca cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=Q5Orqy1XeLiTHnkJztkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:krzk@kernel.org,m:axboe@kernel.dk,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:saravanak@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:p.zabel@pengutronix.de,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.dk,kernel.org,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,outlook.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 956626CC89A

On 6/26/26 1:20 PM, George Moussalem wrote:
> On 6/26/26 14:53, Krzysztof Kozlowski wrote:
>> On Thu, Jun 25, 2026 at 06:10:08PM +0400, George Moussalem wrote:
>>> Document the Qualcomm IPQ5018 Bluetooth controller.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---

[...]

>>> +      compatible = "qcom,ipq5018-bt";
>>> +
>>> +      qcom,ipc = <&apcs_glb 8 23>;
>>> +      interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
>>
>> No firmware to load?
> 
> firmware is loaded by the remoteproc in patch 1
> 
>>
>> It feels like remoteproc node split is fake. The property qcom,rproc is
>> even more supporting that case. Shouldn't this be simply one device -
>> bluetooth? What sort of two devices do you have exactly? How can I
>> identify them in the hardware?
> 
> I wasn't sure how to represent the HW. Should I make this bluetooth node
> a childnode of the rproc? Essentially, this is the transport layer
> (using shared memory space and IPC/interrupt).
> 
> Most QCA BT controllers are also childnodes of a serdev/uart node as
> they use serdev for transport.
> 
> From what I understand, it's simply BT firmware running on this
> dedicated M0 core in the SoC itself connected to an RF.

Seems like this rhymes with the WPSS remoteproc +ATH1xK_AHB situation
- the Q6 core power sequences and manages the wireless controller,
while Linux gets to drive the device as it would if it were connected
over PCIe/ UART respectively, just with MMIO writes instead.

Konrad

