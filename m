Return-Path: <linux-arm-msm+bounces-113862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KaJeG1FjNWpTuwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:42:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF96A6C5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:42:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nqKKo+OZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZzPi9fjE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 621123024174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712133B3899;
	Fri, 19 Jun 2026 15:36:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2583750C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:36:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883369; cv=none; b=enMZzt2/wsuXcj2yuPUNAepZkhoscTu+/dOkYd3139PRZt1dtkb3C1tLNcCjgVBAsQZHJIcl3jyq5hC3h9f2mDOJ9lQjoI0tOeQsEbQ6W81IR4Tsfemtpw14HmB5usgW2wMLKHGfuSsoq4hwGb9SFSl6tPnC/4na0TBIQWlRj7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883369; c=relaxed/simple;
	bh=WWMgmc3pWDFzNjHpALplyGUoNQyFXAmFTY+nCYZD5pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omoukDKBd9EG5tUvKTFtp3vB7UXNxrlTOASloxUMV52/FzHx5xXxy+k407xFHRm7dICo9US5Fo5WThVhEw5q4BV3RUQbZu3pg3Nhq7q2UNUp2jnz/5/j97RX9A1nQiR53VGr55fWXi6X00gljJeOt1BWYzWhnsrjEPpRmN4F9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqKKo+OZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzPi9fjE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9Yol259748
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=; b=nqKKo+OZzUp56ecg
	B2EaiUda8xPEGteFnjLjQ3XhQ7MQYLe71yHd5c/3ZbVCDbHLe5sco0c0uNtIU0PW
	LdN6+sftHG5rNyynZUSjmSsZEx/57ucdB6hel8XocLUNfn5qwhS+SUjQpk+f3M4d
	vjf6Bc09tQaKh8p+F+UIIszmvZsLQyYSfHlkffiHK+53lO492zYlGJECyVEeQ60p
	XWcFIdySIEAJ4NHlmn9RtXLf1xxtyqTD5vr+zxPb1fCL/9hRpPFymoFxriesxmMI
	lZcTenuaE95TwZ+kxb//uHgyoMDxh90aAub68Zvz64Ik/MWH5HMUvEUmGvCMsodc
	IIGiAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp673qx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:36:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8de97bd8459so3057336d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883366; x=1782488166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=;
        b=ZzPi9fjEVjHbt/d70ZSgSFNKmbss2MKMm5L2bMoc+x4pjm4chT3jryvNmNLupo+utZ
         FGATyfnl2ghxRLAlrg4gdMoTEQeTzF/g48U7pBoPQN4RCt506ihY/7mOIxZjJZtvK5K5
         vkx7KrsHeJ5xmm4t/ErSzUiCkDTzbTKpFFIch/jos1u9zmGdn/rRN1P8ldhsTAnW8UoZ
         sU8myvjBEFYaezD+EviVZNRW860bYNxb/FwUhOzy5SC6FY1wiG5cgHK8hsc918esGuyy
         nDM1dDLlxWBDLj6eStbgjSWHbJ7EarDas52b9VyMJxgBrYzKnpUgv94Dj/32M7pQF02I
         ynHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883366; x=1782488166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSw8pxMBxC+u2l6NL9V+vstZrPiyUBzd9HC1eXyWNYY=;
        b=DLSNoq5SQkmze393L1dgPyUUOgac+GdSvg5RyIa6OI5/ShzNCKV+Kd71RSdVQ1hUH5
         qlyByfHsO5pPVOnVbPY/Uiwz8YgkaUCUjULlmQMS9FRoKroW70264onoRFdzS3eP9NRv
         iMSe/ZYVSGr8rHsCNRS+AipU/FTUzYDNeMy0lUUkb9xMwMlH2x8TH89XoqP3slUmZIb5
         9wjnFVLoUd7JAfKk/ohzzMAKxQ9VucYLo/5NdeFEFRHbMT3Rl5nHXi6PlUqOVwQ5JQ20
         zsJxBkyS1pSJRObZXiArO1IQFIoU5v5uO6UrzvbzWEg8DYRaSBanmNeU4w+1MMZshDMJ
         1FiA==
X-Gm-Message-State: AOJu0Yy6/NIS0gcENZnqU94nhlaHoqvRojDpiS/O0ry0AJDNcNuuqHmL
	IHjD7NibS+JR5PSLjTHcsxwHHCvE10luH74uqiDemSWvYaZlA7Uxt8fRt8htq0AHGHjbXV0WM8y
	l9MzEuIdvLEyStCJPz0APEA7VDttSG+lSy33z9jVNOpEg8DrYvq9T2T51JgtKHhn9VtGG
X-Gm-Gg: AfdE7clyfocbF+5/W2ZeEyjvMRVRJER18yc91I8qDQd+qGf6jXstqrdE23sZOn8Ez/j
	+bcTSE9PO5mCv4XARP6aO46cjGJmmeGKE1wkDdkm9lwGmoe9Oou1DiAhgufp0HKlBUT977KKhpt
	n4gJuZoT0AmijgdC6Y1qQza6gW5ADqHrfOcW1CNfganVW9xyGmvt02coHrmJONZnXXdfexBZ+11
	Sk3GVSKu8ye+qL4OzpghMVBzKc+6aAf08zow61kqjCQF2ZJIDz9IY6GgU8qQJPaRcFRVg6iC/JY
	dKiQi+RCv7fHNJ74crT1qAPBwbfXwlbSHSwsMUFJ2qRijZK7zS7q2/Gze6VEUe/A1dJf0aGyV4z
	rbMFBFcePmYo5HdbBZ/jRZB0GknVtYPuHyfQ=
X-Received: by 2002:a05:620a:2608:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9218389098amr123174685a.2.1781883365818;
        Fri, 19 Jun 2026 08:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:915:2b2b:fbdc with SMTP id af79cd13be357-9218389098amr123169585a.2.1781883365370;
        Fri, 19 Jun 2026 08:36:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9aa2712esm98621466b.58.2026.06.19.08.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:04 -0700 (PDT)
Message-ID: <90cc4922-857c-433d-b5d3-27eebe3e4b9b@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TuEMMIjneIykVSJ5efzPRhjLXXpxg7n3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX8X6AwPhlYEtc
 HmzkqgiHDUaTBONFonnpASys8mktZSM5sTgIgjUUOZmANG5XZtDn0gRWHeU9efsCx6k443+gJ/l
 hKrVDAb2Y0M10NNKLv56/lmBqhmY3Aodxhf+wnW2s+aZnzQpRIUq2z82YtLW91iy4AJvAN+RW5R
 xGI475AcOk2BbSpxhnYjvDKUjty4NyaopBEVLaSsymaUdqHA+2U91jmBUsjcWM2G485VfyP8RYx
 gBoEOhgyb8s8gZfLRJZzViBnk5kwbfigwqfIowarJsTwlW4vgBMf9iCGRPeC8ihAC2fvtLnPbVj
 ImM16Sx/0sTUV5DC2KKka3//sJb2XRS8RGfi+OUKIf2bNLypaE8w4DgILBBsUf2GuVqaFpMGlOh
 JU8ImtNoxmDOEPJJhvqc3aGtmrZC72Vf1Cz2qqi4PTVx77u5u9BbwiNYp24aPNaVVS5LHMzu0IU
 yUN7jppejEpvG96884A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX0gGyWHbyCeCw
 c46Y/YnRCzqjK9z0mew2wiaQ0jgA18jxgmDTySiPCH37S5lm5ui7L919Z14IfWeZvWqIqq+6sZH
 ORjqmmys595qsk5c5S7QUfsOo26qp0I=
X-Proofpoint-GUID: TuEMMIjneIykVSJ5efzPRhjLXXpxg7n3
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a3561e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Am5VatSTG-OmdDoZGaQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113862-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hangxiang.ma@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2CF96A6C5D

On 5/8/26 10:36 AM, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

