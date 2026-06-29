Return-Path: <linux-arm-msm+bounces-114896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YKNIEwE0QmoC1wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:59:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCA6D7CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e13Tz6kI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ca4Tmo4i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDB88305706D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CD43F9F58;
	Mon, 29 Jun 2026 08:55:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2B3F86E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723338; cv=none; b=dk36VZs7eLol+0dhw1wIcufnTTqA6+GsQCtALJQhs7wZC3npCn8jMGdDvG+dlgpPYGmIu7svMQBu8POl7WeJs3b9LIUfydIba6xmNETRzdN9LBnnnRqgaUw/1NnfqKwBwh5mtvkhZFS105paC4XTsooDrbLXGlr/u3uFStbknn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723338; c=relaxed/simple;
	bh=GWTkfYePYPEGTpO3+RiqLPCaGCSmezUWdnppwKHAMqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFI+sBSQ63Smp+v8HdD6k2BKLTlv9X3xKD27sqttWCBRVi2YydccvaBPRrXT+0rMjFs6zc9MSaRcYNB+FNKLI3N//TDpd1GpPrDAYOoGI2WXBUfWmhlzcUh8UzEupfyEFMk9/LOQEcanUvHVY8k6mDR6ZHI7PRMi/ULwfb2cn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e13Tz6kI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ca4Tmo4i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8ODJj2348630
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=e13Tz6kIkamhMoyB
	AqyCH6LK7ijdeJzi8mw9q6lz57F/Ow9TLcusNIY3p57SGWT2u+O3U6K7e4UB7J2G
	ogjrH0OPfQFELQeerI3VUViYoM8y8m4USavzVNaAoYuLsxluNpSG/txMgDsf/w3j
	soMFqHdivw0sh4npujkwEjn4ywL0M2WOINtCmvuMk+3RN8roI3Q/p1jcob0NXBi1
	jlzY74NPlvYVX651DVAZ8MHYeUjX/IBFWNzBBSssuaeQe3d/kTe/iIJH7tLotVma
	oEtxlmnY5BRC2FXJSh76izJsOkfO17fGp4LnUdj3HMwytP4srQVIf55hWj4iikQi
	CkCOnA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s04mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:55:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d34a0dc8so1572956137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723334; x=1783328134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=ca4Tmo4i6lXCOd01xghdY6huqHaXrkDHBJG+sT7dFZr7kht+yzleiyXvdiUgAI1l+P
         +UiqRHGKfdNomhQWIzeIzdGpWdtUjZdXlCI/Z/FRNrsXSG0Fp+eeZkGE+PFS5HgDp9gM
         eASij8L1s0m/nFSl5d565SYdimXMM+ypLj0BWF68SaR1I1uPET0m1sd2i1XufwShNeEW
         rF5OKO+EOCHcJAOxT+6nloiSOjKZvNgIIDVz8JmtzRx/GimBX02gdRHT8JU5XCJBVe57
         8lpSsMzy1vi2f3TJJnp9RkNB4MtRX2xOggqtvwGTB5a5hrDSV2HiCIWZNvAvOJA2UBzQ
         TOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723334; x=1783328134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=CvBflAjfP4THa6cdVnvmBEQ9TTwdiPrSodhLBOCr1KLKtc7eE6HZ+J98Odk5ao5Ygk
         gbvOe5BK488byy1H0E5V5POBLE5wnBtTLbE9nF06rHDy+t/UtiainCLOy+4glodgKMCM
         mgpEcaasF5RSrfi2kwfUw1YroJcrLlwl2uze4a8Iac8XD+sT8UPE07Lqu2Vw/jCQvfWm
         i0eRtD6p4aq+8pkNeWqgWtc0jUKQMJlzpss/jRUc9i7fZh7py7UQd3Ak72BIgtIQxnEN
         OWCkGD0SHrNC7ZRR05bQXIQ3y1lKG0pcDvtXeS55Tvv/E5fpY0k8+E30NHU7DmhPNwU/
         AhpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrASwP08xeU1+TfxS8gEaEx5GPUtQqV9k8SRbNk1Au7+EEYFUxKc3xT9DAzj+UP1Wj4jUwkzfIakf5+P4rl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76k9wLXx+bPAXd3sFzmvEYZxMpFVD/4VIrJxaD1isRRP19GqS
	E3IGhH6gBqNKdLMMHNZKJ0lKMIQtaiM55jEE5fWXLGKq+mGHK90jtQIdhbKadKu6mKqduFtc7Z6
	imV4RTHJ1iYB6xXmyE+P0iwHsC5XZwNrxi/joVOkFMOGPVk1Zc9qmtrHoDTJIE6wUlr9m
X-Gm-Gg: AfdE7cnx51WBhQjdXMuv4NoozkXyie3PHvzhnvjsKvuUiRlSpd9lFAisksovkilkcAD
	FuQaW3FG0mu44r7X6gHJT7Pt7hRWbV5udd7luwDlIRfKoREJTyxaknTrsdldGxPV69wr/us1oHK
	WdxXyUZfL4+/ZkRzvkWtbeStrXPj7JGBTTibxPeXt8RxVTXScnq+oVwvTlFasm5fICiXFj/FEot
	ID//auV4LP7sRu02uizSAHtt6vdy098RzLEGSqFWlMvQejIH33gz8hk3xJ1ugcU6PHCjJBVgAFB
	k16cnlHvUbJUnerhCGL46C4koU1EmGX55r0Z5G3vv0Zss+fiwo5jhcMPV2mXoCpoLb9a+7Ao4l/
	pWyv+x35L4ptcFwE/Egyhfeg1LohNwx0GhiKBpAhnMQLJncJsNBcp6mKnAa4s7Q/Pa7Wj0ODgar
	2ya0rY9bSJeDphbl41YU69RiBja25MRyfSuO6CL+Tx9bOYiF4mbIdVH9wTRRWrTJUfPfuvZt9zE
	zIVfDzYvB7UEVodHvHG
X-Received: by 2002:a05:6102:80a5:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-73435d8a3b2mr7432140137.17.1782723333428;
        Mon, 29 Jun 2026 01:55:33 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-73435d8a3b2mr7432116137.17.1782723333025;
        Mon, 29 Jun 2026 01:55:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:22 +0200
Subject: [PATCH v6 3/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-3-f02513dcd46d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX/XsxGPMCFMUI
 491zy6mQZwZLXva9uVz5S9y/oToFNxZ7JJ1GUR+MW7SsO1LAkC97ehsNxzvxYgg68fMdrgfMzkj
 /qN8yTEiQ6VUqSiiP2uSd8rrHXS17xc=
X-Proofpoint-ORIG-GUID: lZUAiENpgqF18zkbDv7l-VKYgz_yUK83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX5YRzXvffm1xO
 4R9Bb0LctqJ4osDZ6BT3j+edEfCMa5QRBXcfvFS70/rvff9DQLCYelgpV28Hcy17X1hlCAV7K/9
 keTwkYyPSrVLf3TqBIHPR+mGeY7lwPNOvNNbVsfMFeHo/eOITC8qRA3MuQ5Im9ojNYykhJPLa4L
 H/4rXY7Xna5NyDc43di3gUhQuRJRUdUShV3Ee+eLOIhIf9qVqFNfsPW7g7T+EHg9koxNw67QnWn
 hV/uqOFX0iTuTOhbLbpDYUeP35GK6HpmR1BF/d6Mf9+qpHKsCiQ5NDRW0E+RzRmoTLYKwD2uoxH
 ruCFlfhBEWxLyoLfbe1afdkDawvdGfKupeYSkbHIrwt7285C/UqxHau4X1fbB+17uElnAdR22B6
 eXqF0Henr0B2hXtJoF+/n58yXNg1y1sb25YHqM/M8qL7dCNEjhEYV9mWuRSkalAYo+UAtRfe/UD
 3EbgU5f/t5nEdWuW5sQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423306 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: lZUAiENpgqF18zkbDv7l-VKYgz_yUK83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114896-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:ansuelsmth@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@
 kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: BCBCA6D7CAC

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


