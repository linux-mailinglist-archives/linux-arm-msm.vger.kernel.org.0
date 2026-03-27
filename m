Return-Path: <linux-arm-msm+bounces-100300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMJoFbd8xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:48:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C89053448CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55A58304D667
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1813AF645;
	Fri, 27 Mar 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXgVTv7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xv5Ji3cq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345F21D3F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615703; cv=none; b=ungxdHqNyGxwVqiGnIuPALQvinqc9PRu04I2s5afWZDZjevGdkBM0IIISCOzZaAmpiq2etVa+xDzoNYsd2ZEbr6+HrJBrG3mvgso32ZZp8vDBYfCOpFFf9S5iz0jk4hZi5P7jTe0KnYd84AqLb1EunRaIKds0kiAE+w8XvxhY/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615703; c=relaxed/simple;
	bh=zrNw37Z9aUjycSTKk87LEf2TU3iKm8zSEt3jmDexEMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nksIFR+g/bZSfV3SxJec3UfEBch9tuqa8z5dQlpjyq8v0cOePPsztGMYL/PXgm5Bt4cKUgVLabFDsNketvL+NNy/+KN6YAjz4JPXzN179U1uXOvZdO/xxpLqxyLji1oWufMVTsrqvoMqUW5DZVL8V7radhumOcT9UAJiG30I1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXgVTv7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xv5Ji3cq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCRE7T298501
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=; b=OXgVTv7D+O/x4gi6
	12YadJ10/hvCS8L+g2cvaJyXsBlPXfAoT4QIDpbLqI04f+V4yEpg+QpIghbW//nm
	M/o13mrZYfLgC1cYK/LJINIdtSHTSkXYu5GNyQlCEdvoeA6g2qVitHE0lr7wsKwW
	8XZZgYVOSgq3gY6RGtir7OMjfZUh9Th8PnA2va/jf3NOOs03V7fAHF861tPJtqCE
	ZnCvCcUPlZYCKx6EnYzKn2/etxo2z/7Suw+8MgnZxYg2waG5C54UoqDu80DuuBXy
	XFgDx6R7goqMoXnd6q45fXxARESBXbnx/CNBYlLgB9HFFuXtVEBpbnopzSp/uGYY
	XcXucQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8u3g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd541c0edso8317326d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615700; x=1775220500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=;
        b=Xv5Ji3cqE4v0q5/22AWb9qPpLjVUjr1K88dVRRcqvBTrM7irbOe8IVviv+MSCNFojE
         m7LOxhjAYjsMHxdnmRgmGJNAgeLuEJUfYX68iOsCJH+63x0BFdWoieizRpoCMYyzCGDO
         QKj8fJqyNoK7z75kVVwhaUcpZ3IB7U/JXYfUoJ5QvLUmjKRdCuT8SVXa9IR+kcR17tia
         1MzLgwL3m0Bl7pbEtZyvr1t+u6lr00ZHU1MRcd4qq3KlnacEMIce06QU42HeJqvYxXit
         Pm58IYZLKpkFo1T4wpolLlq1xa9K97sdBTetXdX6pgh7e9C5qeZntT0yOm5ZdpHBgbjf
         yKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615700; x=1775220500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkeF25ERsaBTPXW0D7Slwloe6k7ZG6bH8zT5ZWMqWjA=;
        b=E53pNS2I9lbS8taFr2YFlK6HzzZfydNQo+L50Pu6l8VEZjZD4pbOtJboKuN1/pKHSJ
         NnwJ+JC5MRMdnZWrniMhIl1CFfyFfYGhcD6up/qwWUvP5A60fpJk2dhVA5BBitEF73Yj
         nQHU1UyEfmxr9I4T2T+n7htRBZKTlXD/dlZ0bYUWNsmhMm48cp/Mbniopd7Ar2EqUl/X
         /l33+GT7UXf8kmjmWUnZV5heF4+852zzjUr0CnuJoSAseA8TM+YK+VjYmIs8TGlTEQ05
         SkpYQ7bNCPTmHy06bhqWsp6d7HRwGOkg0qQZLczmLOapxVJ6mIF7JQPgKPlOV+P3uLDb
         HKuQ==
X-Gm-Message-State: AOJu0Yzc5eVsdTGAnvPB8I4zN5eOzADbq8a8gWduwYePw1qV5JS7vFFN
	5aP0xoFm7WACeWj7IBhVZ0midRgckzQv9uLUGGtLvY4kTWz23vQwV9eDO4f+wKp/nMeX2pOyLRP
	Kyfkh9zD+a2/9mgd7oadhRCRiwvT6RfWGx2XlS3E7Hb8DzISp66Rs6WwCz3By1v8e6s4t
X-Gm-Gg: ATEYQzyqofSj0gKGzcDNWtldLYfc2/Ia9qMIU3GUIs/nqdDxtZpZS1RZX4dHWe/7vku
	Bh+OFkgnO5rJlI1cvIAiFZALSjvrYUyDntWsO+yk5eUCMjoQF6QYjuHadty4ZTjpm8jLXO1wadc
	WEvBUxEzQXjCRI/b8VbZxL9xUVARn10ivwRORFvOiEbOLQhxYMTSGFz5jOOh6nIAB1oBb2Ky839
	Hp4R+bnGvkV2wmYXudA2s7R+c4Evw3B7la+lEt6YjOdZmom/1aAQ/+4vikuQTRjk9vnOh8eQB/K
	jzGNdstvv9bCYXnLdjPmOmd3DjljBORa8O8+1NwFEG06WT9f7yS1MX2lV75aOIJZgshVgWxhnOA
	81URn8aT0e285WL0UAtUzuwrwkO+Zwju7mBoWdXZVJIS+Z4sHSUK6RAeohIUsPQ9xPwfDs8Ukk9
	CEtWs=
X-Received: by 2002:a05:6214:252c:b0:89c:d639:e7be with SMTP id 6a1803df08f44-89ce8e1d8d3mr23215376d6.5.1774615699998;
        Fri, 27 Mar 2026 05:48:19 -0700 (PDT)
X-Received: by 2002:a05:6214:252c:b0:89c:d639:e7be with SMTP id 6a1803df08f44-89ce8e1d8d3mr23215056d6.5.1774615699594;
        Fri, 27 Mar 2026 05:48:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218741sm245644266b.1.2026.03.27.05.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:48:18 -0700 (PDT)
Message-ID: <36e5cfb2-63a5-4c7d-a799-98ae3248bb20@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:48:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfX2hxUSMQhQK7Q
 aAw/qJRu0a0+2vIe8H/MCHEB/w0BVPYhExU2iYRooW/dsmMKHFuh20PrWZNm/VqJvZ0YF3H3c9/
 HuWHC0xUH83SWcQdZD28UgFM05V5IoVQedwuSRKJPVoEaWFoP8cxDkoGz067BTUCfc+Nzdg8S+j
 qlZ4jRw2cIeBtXXIbX3v5BGVN24PC4aJe7i2GW54Oxa+s4ziehPvn8iMqOKm7kBq5XXm2XjxMBY
 CWBSQ6U2sbfj0KXp4sB0BzdWYPRTV6G1kKxxj584Kt+vdVXlxOU8GLC4D3pYO6/BM1y75H2s/wM
 aGAX5jfjF5dEckNcKvEXh6NztejNmZevNXSYO0de6dIDJizdo3KFC2ESSTq4pP89WWNFBoJNugl
 z53aRmAIxbsFBSX+GU3dzjPlOTDgJ1glRFl8ybBDNRKRy7+TKqj/+6wb/hMneEu7i9uK8pu4UyB
 87nmIEWeKUUqUsj1JMw==
X-Proofpoint-ORIG-GUID: rWnZR9wopqKHfP77MkNgzDCVU5d1XojA
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c67c95 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Sgd2lwjIgByo6sUrMNUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rWnZR9wopqKHfP77MkNgzDCVU5d1XojA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100300-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C89053448CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:46 PM, Abel Vesa wrote:
> Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
> Eliza SoC. It is used for communication with other clients, like
> remoteprocs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

