Return-Path: <linux-arm-msm+bounces-117385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4VyQL75CTWrqxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:17:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD671E90E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 20:17:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YlPvGr1B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OwmklVQ3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117385-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117385-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9807A305D6C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 18:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534FF35DA79;
	Tue,  7 Jul 2026 18:15:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211A42EB5A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 18:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448140; cv=none; b=JX6oe++5LMj8T4XGuMohoZLOiVHXHvfA1daMxvrrJO4n14juQmkeEAvYAfYUkcWUOtRVZyupoHccId3bP5ByktFOIMF0KHplbyHXgxT44oa6r/7oRKCuWI7gySx+ONH6gu00rHplj62+qzD5FEf0eCeZsAt+PH09MRztCuXHIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448140; c=relaxed/simple;
	bh=H5J+uIt5XWnJEJtNpEus5E08zRoIkT6wiB+KmpwCzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+UDaQmanEbncQP9N3SXoxbiRrQK7y18oecWd96VRbTbT1fmBXK4nKACsunYnihDylf32tpZieDryyzTppJ7YARBnA/CX8ARN9NJU0cNnkStFA3uQRB9RPokPKkX4Iu1C0eWSaeIZgnw4Eh0/Mjsj2eXprXL4yjehK40ac+RC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlPvGr1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwmklVQ3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT7uG002266
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 18:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkhz1M8h+cJh8NJ8jPMjLwZY
	S3DnJ04E/4zdfvZaM8E=; b=YlPvGr1B34WYLy1LKoSakq1wAV7K8otS/bk6GnfY
	OU6WiHxIPnD2MYtyN0PoLKoInqA3H95pJjjPcgB6rb1fGYVdRBVZM4D5IqMFk4hY
	jIcKnAN/JYvrArEVsrX3z/N/yLh4yKKJlSHINX+xskg+zgQ5+aQ92IKpRMUGFDhz
	ToTtg50CokIlkz3ryxOsMcxplRIIPOx5f35DLdusJe4x2j6Q5A6Vapxn/JaReKcf
	3s7AjuzxUPz6LKT/zgMxuEhADDKEHuKc0TA77J09eRXNo4K7R8PqpYaQJ6sgUica
	/R3k4R2nETZswv8rBJJTKrSL47E5KJSI3639qOS4FdrMIA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0j48x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 18:15:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so1035417241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448137; x=1784052937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkhz1M8h+cJh8NJ8jPMjLwZYS3DnJ04E/4zdfvZaM8E=;
        b=OwmklVQ3SuGmyW+XpUWtfGwMy1l+TU2q8AtsZxLT+NzWharoWXnO057fhxkROJty7w
         iQAHMPGjvjOpdqjf8fGSiAFiMNf4CQ2LXN4RYKYaagxtwzKC/dLfV7h+/TvAylqjFgn7
         032tTUS9cOH1v+FY/fsWZ5qMMvhYYn4QSyqQcVvPPHvpdWw8LfDA0TK6KOBAkTcaHCH2
         wWsyjUm1rmFH91To9wzZxS9SuamDCC9X+saWlEAxHarsfVJGjT7p3TE7EduoyV94Xdhv
         MZD/E4we3SaqGs7LYlucdJTh2KmNpeI4c78E8GNiOY8Gr8VRaCrOb/qA9DbvBssrSW3j
         iBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448137; x=1784052937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkhz1M8h+cJh8NJ8jPMjLwZYS3DnJ04E/4zdfvZaM8E=;
        b=Z0zBYMZuto0s1cEcqXXpnmHDH9N3zNkpH7r6nPIGF6yaJp3Ae1/ZhpgnY+ipRwgScK
         +RQ3afbIzv1905ZFfVKlJQW67iap2tm8s0kRilA4+uDkaXUz65FP1Y/0SpjYyLa6Utji
         NCx/NhgoXnOWEWT4fsyknBrGQSbyf+G4vXReVm0fxh8dHAOc80/PL0LncrhPdoDUQ1Do
         M+9Qnyfe7gGH6ED0awBW6aM2uiEiIYxAgPNhLNe4VgdA0iD0I78Z11i/XMTnO9C2Bvzd
         5eZ+O1ORgN1lc5PHXWGMj7q1+yNJPZ3PJKmAkoY88iqK/JQpT3Re9B2OgDrw58HFHG6y
         fqxA==
X-Forwarded-Encrypted: i=1; AHgh+RpzvGQGe9sbiNGQLREJHqTUSFwiMm+x6yqGSI6KcV5BihJrvsJVgchS7jNn4ZgMn1y4H2h/RPx82voIkXiq@vger.kernel.org
X-Gm-Message-State: AOJu0Yze41n45fOqsh0NLv1sQeRPwLpP3dz7Wk7oAcpkeiLG0CYt6A9G
	OwgR3dcWT2OC+1zG/pfhTSFRN5xcfoppnqez+CEMbC9MG+fm6u4c+v4lQLP24wNBBVdsBaJPzwp
	cNX5JIlp1/7h+TBQ08WTQChZm7bLij+fIgWj9XJK/fO1qJtkVQ1H/zjoLq7BB99sUres0
X-Gm-Gg: AfdE7clVbnRPPZYw/fy60bYVAGdKI+J+G7L5jEC2JMKaDLhiKxraZKX6UPTymT9Yt5U
	q6+SnCNo3LVkc/ObCTt5O8MVFMdT8QQoc2ByAPSXpoB73fbicH1ueK4syTNxxf/h57FiNbobTcU
	h3zElLRo5qS+rx0xf6jCLoMNAIm+VUZPCykdptV4K4B/IDykdaaKd/vf+UlrdkyEA8T7ui9kCyq
	tFZM5ZSH3fg7K7AuM8+79i5eypKvLowPrHjjMjlHv/gmWT5bamfdWs9Rd5WDF8q8yOvHeUJNjYL
	JukzP1r6dRGA3bk0/Km4ThdzLYrATQudtnsvk6Y9xmnd/Sci1krdx2L/uRl4//exdiuzlojWGya
	XdpnT4FmRx5kjA3iCCKJhtx5LZVAiT3cs9KjGCA8+xxaSR6Y6UAPhBRTKmNx2CbA5iWAaqB0Ogt
	CgI2vGKqk4JheeDOq0+b7FsIqx
X-Received: by 2002:a67:f70d:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-744c24bd531mr1899669137.20.1783448137315;
        Tue, 07 Jul 2026 11:15:37 -0700 (PDT)
X-Received: by 2002:a67:f70d:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-744c24bd531mr1899532137.20.1783448132115;
        Tue, 07 Jul 2026 11:15:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f908sm3841895e87.8.2026.07.07.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:15:30 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:15:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
Message-ID: <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 43F75xx9ScmxXKYfVoqyKiwOtmqUdkRp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX4bJmC+V3oiY6
 qsKVXh57heTEkFJPo7ergVjC9ySyAWCwTi2VwCQ9B1KdN5jJxZWfk2GmlbuEO6+RlB3hJ5KfXeo
 E8Ws9pUKaIwIKlWldjXbhaQII2+TfAA=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4d424a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=A81ZHLluCYw3_DbNGG8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 43F75xx9ScmxXKYfVoqyKiwOtmqUdkRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfXy6Mpnddeadau
 bqxWTv/fU8WzkE8efRCXlOnO3BywlZvMLBSgdW8oIXRZVSFIkAKU+0IE9BPTQZSCOeh+drlP2lO
 vj6vPXoo4tJk2xH9fB3RBu8NDtRCYMy6L8n4GSb6Kaql4ICes7rCkhqZR5chg3QGcUzxVcXy0oI
 iQoq2Oxmlr0k8D4FsL/XWJNDSquqwiXRRgIkPWT0F6x6yLrPXdusMpv03xtFtaBvKs6V4iWOWKx
 88xOuOO9rgH3sHfAU1Jh0ihrt+8SrgZ3h2XDYgrSCur2R/69iGxGLTqSay4DatYLLng8dvj0Ohr
 +rVVWBMmqdefyy5J0IOmhME7srWdEzXFUItooBFme24P0f9kCOf/af5uc6Ohel8H1e0I42DC3yn
 VPjxRKkPpTs4vf53xysFU6R+Sg1lYgousk4Frm5U45J1VRrDcnc+Sg73VjlaweG5PEKuio1Cvuq
 mbJP1J11AfZq48nrCgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117385-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,7mruev4sw5vm:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49CD671E90E

On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
> capture DAI links to the sound card.

The contents of the overlay is more or less visible from the patch.
Please provide some useful documentation, e.g. how to test the codec.
Does one need extra UCM file for it?

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso


-- 
With best wishes
Dmitry

