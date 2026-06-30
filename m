Return-Path: <linux-arm-msm+bounces-115427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wiOkFLK7Q2pCgAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:50:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B236E4731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:50:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="b6o5P/f4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L1mHIhpD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C7530F6F99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3119B40E8D2;
	Tue, 30 Jun 2026 12:44:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB240C5A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823461; cv=none; b=bWvgWO3EBjHJhd8zALLM2dBKXorblDrWB+RQ6nTAH1HBaGR0h8BPz7DZM4Sg1UanpXuGTFszCB0MHz2hAIAT6NraRINhesbrsg5nk1uPbVRbcJVRFtvH3KaOjsBjHYiHNXQnL7f75hnFp4cb2egmQSoaTnECeZfHe5jTiMF+N+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823461; c=relaxed/simple;
	bh=5NyZE/pdk1UUcfMYTWurDSt/bJg+fnkkgCBYJNkdRJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEEytUf/+3hNoUsLb6/uA/6eK8ZsV/SMLMUXZrY+ERTGkwjDXM0cQIGQLLdhrJaqD9swGf/9CNE4clmtarHI/Q3tD15MLvn3Mk+Y4EIKXE9K+vTK4T/HJ5QEA2eyUUEoc2ewsDfBgbnecJxGuCezLnvIjkb+1EZmesydoJka/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6o5P/f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1mHIhpD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqfY1611606
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=; b=b6o5P/f4dub0N+sh
	VloUIC5/nznDnJpdi25/JuyuvwG2UEzSJKKvywHK0tZrtZT9KUZ/5rxDpzkAbK35
	dsnM/t9aZuxSxU2dRGIZe6jSc+AjUnNQpE9yweYJ2AHh3rx+0/GCQrqKHV9iLFJd
	l0GX/TT5eBf9LEmr4iI2JoKQon7GYA3eQBuKb73gMscfC3mX6KuyV7kA0Qrm0VgR
	Sx/9IGVhVELkU+ss5iFzAVhFhfcrFPin/yM2k3woV5wD5lCojLKYMgWCTLttw8p6
	JC+Z5uAr7lpj3dOpru9IIxbKchWQWwxRHb/JJjqzOKMn80zS9LHcEIdrMlIPnKRX
	7BmsvQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtnbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:44:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738a934c5daso68181137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823458; x=1783428258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=L1mHIhpDJyhyAD5WK+a/yfWPlCboP2MsfJZ5XTrUE+Bm8mHjciwfwjw/VytDe4TJeI
         lHSP5+Wb5h+WsX7ilaX9GOhD5UP7vnr3VQ9aB50Tm+oqc1Fqw3cQNF1GjQg396Udgi1y
         a0yvDOnl8TxejxLGH/lzvDgfWZoqk/AHbMfFFLTsDVaIPpYTSrvgFTAmqKO9nBJXu1C6
         XMGmVpqeJBZp15/cFMzoe8ZIS/eeR7R4SNRTJQ6r5O3m0yhnCoW2avQfHwMj0sbaIriR
         gPQTOgn2uqYH74IbT/wkMlYVvFIe4MWMg5L8DZB393Nf/LXkKhufRp64BV9C1YC+AuGO
         BC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823458; x=1783428258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=kmukZQY2PTgH8F3dpFIq4TziN3Hk/wSFvwxfoHEKOdky/6mnresWYIgeB2Pfp0JkBh
         hlMGQgI1FAbcbmICG9+s4HB0RwqXz7sov4050cBa1LzVDAugikHO41LwTvjj3phKtHgw
         nw0JOTvYtcmpkW8yTK0CH1lBgyFw1XGmIRzha2V3nFtB6L8/3cCkRoFgRmv07wQ+8BAp
         y3KAxC9Z9V/eKqTgYMOavM3OJpluPT92drzVeLQM0wOxLiG71eDNuMMxgdWB7/0uyMnW
         ZtbcvhBmdM/ZOGoRT9YCciUKyQ73kc2Z8LAbv2GfoH5EfltBbkGWtG7M3yrHI4DwC3vI
         cV3g==
X-Gm-Message-State: AOJu0YwoxYFuuMDbTs2OKaUK+TwqOvLfGVBNw33jgDhnyVkmGpFxghHa
	6QrQZNJ9vSkxMEhS3JiSUOleWfA+9FQ0PDxA9VD3YlUNCqC3KHPpVUZQMD/TGcXdAL1L5aGizB2
	JSC8jzWIQZ9vX0TFULhqDBI32s1LKcVVABP3FDwQVSSTqNtV0gusN997aLf7ojvl6pyvd
X-Gm-Gg: AfdE7clXHhWIWd8oJ5Io6z8I88YCSDSc/N7C9NEgxnW2V51xQ83gv/W8RpFwzJY3K6U
	gVYDcYfYio0Tli6qMBgekZeRXWWe8K5HXUKPRbmNTVpWM5cQpxJ/VTxlxAU07iXrvj8ciCksMG2
	adDfhYkhuWTRIMxCo68ebvSv9Fh/I3bA/sDG0zPQPrpSEH9YKpsTLtT1/FsOe4f4W2XfeDp7HN5
	UuqNXZvW6C/prLwNe9h68XqVvRhHIHZ0InWMMEsUrMCXfQ+zIZ9PWvXATsibwJ/omjMNtFkobMa
	cU+vmf7GfibKzdRBxf/pZXXOEnGhNzFxp7VCYItTMfQHsH79hNIj0+M9Q+F/Q7QsmqLmnJY1GX3
	cHaFm0sJPTubSmiCEWBJcredIyLedAiXgYVk=
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524347137.5.1782823458302;
        Tue, 30 Jun 2026 05:44:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524326137.5.1782823457846;
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c950732sm1117239a12.22.2026.06.30.05.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Message-ID: <ae6518f8-bba9-41fe-a97f-de6001319c0d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:44:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXxAT39Z0khmXb
 UES0zXusHKkjXxcaJTuHh5zgNcXkMOVyuBlQhq/31SzA9iQhd6CLLDG95DpEO48utv3R/4Lydti
 2zpYvrrSGnU1/a00Vw1DxGjx+7CAb8w=
X-Proofpoint-ORIG-GUID: LaBxlV7YDFWiazug2xcI3lBYGtfcwBOH
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43ba23 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AoAzlOJtnLSqI_VYGEMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXzpzdW9b5ZPxM
 YC5QYXmdJgDm6mXwCqbIJ31h1JUqnWOn47mibxZOmZagzcwdH+l2nSUGVfKEMNSvOfqlm4krhHZ
 S9ksinrKaBoYxPDEiArUJpEtt+O0MeZv9N+3jqG0HJeWEid01XYPyMQV7coBXWLeBrOI78aI6Xu
 WvZ9yG7rg/HtvI1UjLosDlbJLDHSfKZURHa/ij+G2usDIYeEMnsBe+GWiYPBCV8i3b4KCnHpt6U
 XaZuq14TEOAEZ390emGbacxgNsVfdRKQaC6sXm4t7y78Sv0aRpVNdjD0WFnYLmLfT5sCZ1gAMpo
 cRsUuLTp+ceKkgNI2Fh7BPFCUiACWGtbDAE47st3b5tGvovftVazAnQUds8Mbc2i5+ylT27d54U
 IZrXHye4VZ0W8q+rQ2ufNMB/pSupBA7QEjv5tBPTEtp0wOB3ZDDz7ss4wI7SRt2AHf5mceCxo3J
 gbAI7nHBubBho/b4pHA==
X-Proofpoint-GUID: LaBxlV7YDFWiazug2xcI3lBYGtfcwBOH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-115427-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3B236E4731

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..0d5d1c55bfc1 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,7 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"eeh"

[...]

> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",

"PAS" - it's an acronym

Konrad

