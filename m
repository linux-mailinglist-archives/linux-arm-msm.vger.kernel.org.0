Return-Path: <linux-arm-msm+bounces-116677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UZadM1ZcS2pgQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B42970DB31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E9dpEhk3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CTWnfoW5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2E373034337
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0B3317166;
	Mon,  6 Jul 2026 07:37:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBD39769B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:37:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323465; cv=none; b=FDsP9A8ZPTS1WYtXEXQYHdNhqIk8knneoCApFEQX3A+0Gef3JYpkNIDyiFdeZNyHVH78ihU6l3UPnsO6vZbs+2hcqLosH3DtX3Yms0YH1F0+0hzZsk9risBr4snh0hM/3LrxWxpxZXjwGN+YudGmFxwIt5xxOybLTWHhr7SIEY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323465; c=relaxed/simple;
	bh=JvWVPu6HU78CWF4y+nQbEPr+5n5FK2KXgTnzzkAAebA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrDRAJ+UOEecafg44shgbY5lDaQdMKDIMSp6Y2YR01FerFR/AVgue1B09WLJYktl2J6n4JUKgrV7RJCXsmJr8R2QL96JP+mBqdEdtNAv2KqMENLUCo6g2TkDsWUFhGE/VGTUoFoZxKjhvT3rgB/PrPo7GYnniKJEK3h6h/7urhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9dpEhk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTWnfoW5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Sb53593985
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=; b=E9dpEhk3pI2YePaz
	i+v8fBH+ZFHrTI85qIgEufDX/XsJJZXabcjYPobJ5OfnHWj7ulfcyLi2tXpfGRtI
	8Coo6aXCsLBqnW2hDrzdVIaZvU6SRr4qHyJmlQ8XxHBUP/DgWybHTmQW/y/mRKnr
	EhZ7z2Y+MYmV64lbqjR6j2gjsp0HXFVuQfxXEnj+AqzN/aExzXuT7IMiIjb6/TVg
	jWi+qx/UBqKMW5Xa2UBOWeBI1w6H3mX9eRNPaPPjm+qJLgh0RlSOrN+d2NfcwqLe
	8/o9sV/RvCvu8poVcuZ8DXLTXo/r7HuvCOkS63x1Ag1v/5MuVVut/+dc8PQwL2G+
	PayT3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwd63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:37:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e73fc29bfso394749385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783323457; x=1783928257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=;
        b=CTWnfoW5jLJLTDSU29hTCLDCgCpVBcMWLqbf4bj5B9gJTa3KTWajr+TRT0opE7/SZb
         xpqU7AI2LbpMx4INpLxnm2UiwblX3mNIoyTiChQJ1Bs9Zj3E9zRe/cSJouF5u01SLpXO
         QdjFgaYlcR6wzT1TC2VqGYA3hfPJz29x24ERtr+8iuL0DK0u1TJA6Jrr8nX3+skXQcR9
         li9gOT4DzUk3i4vKla1x3T5iaKRyG6BMR/60HTzNalUHQdFwZ/zmb+ZTJ8JQr7lZagLn
         6h71OCVvKM8tzamh4rpzSUi2GGtFSBCigAEagbmfhY7WLw2s0KKMzr+U6Rzgeu0hYPjW
         cmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783323457; x=1783928257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hbcu27UhhQ4jr4ufivOlKvSocOwA+H2JP4HM3wd8mI=;
        b=cPbDO2ZhW2wFi9TmsPvBhmIEeSnwA36bpHmkVxNDE2y3MadiDmhaClln5yM2JGCxFx
         dIPpb/SWy4uFbTONWEHa7N2iqyK5PSqmaT8HRVpmdm9nwHgAvsZlgKLtNbwY0aRf8zvQ
         ed7Ntav5QOmyhtWYIEgZRzXXG0eaDU+5n2NF9EZkIRx4o7dEWVbk7BQZcSXesdQ7xlXg
         rt7RPJF4+3fsxvM5Rvr410dWEgEnOgZZLUDGrAx3IE+LVP4fjYjgxTTe1/jkxt2mY6xH
         Z0ipLjhHKnUYitP2i1FPZkWCyJrVW+mxSmyQ+AnHLOdb+yE6/J9fa9YBzopqgEvKuBxk
         Esmg==
X-Gm-Message-State: AOJu0Yx31nMmXeuxHICUwVCTSS1qfmBB/+KmJc7m2vuw3YGK0etr6EPS
	Fn97uXuaSQEgZEfLkK1LHstUoffaLqEz5JZjCeHaxzVZ8noZxuJKljuYW4Rgos8FRUjfk3RMZeR
	aeWI8gfJmV7ltiM1aMUQDzI0W56GI0JhNd+a6ISzDE7QPaVmbIvgUFUYfcTMTVPgeui0m
X-Gm-Gg: AfdE7cnRxzB7fyi91DC4nMoWhrfOgksNINyxeN1grb60kH+bRPyZLJvIxclmuhqKkKR
	GG5arCvdrGs9+OXwWsdE42tn81Vf6aZYnn5R/pj4dE9gftOUZUiSyNopUVAjrux52BE08oMH2k0
	SrCOTetZxbofvUeSs2XDv7TFV2Amx+BbGdKWeOJA21WoUBFSeM3EcFqvAQPSEOH+SRtjCFdwQsj
	ME3BycjxnQM9hwlw0lLIFYXGcCLnOEFQT6TS4S9vKHvlrc5HDICwO/kWLBbG0RyQTZ2Hm3LJlk4
	aXJLkNPvQ4PmC8wjcn6dn7dvlkOqKgHTMI/qv4UGRUOyO3DNZGGNa20bj5s9jQGPHS1YQjkYpGm
	qpO33dqcoHIao5tM+50YiEuaQgbAnA1ezriabhZO0
X-Received: by 2002:a05:620a:461f:b0:92b:6805:9188 with SMTP id af79cd13be357-92e9a51ad8fmr1276613585a.64.1783323457423;
        Mon, 06 Jul 2026 00:37:37 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:92b:6805:9188 with SMTP id af79cd13be357-92e9a51ad8fmr1276611785a.64.1783323456949;
        Mon, 06 Jul 2026 00:37:36 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm23308756f8f.21.2026.07.06.00.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:37:36 -0700 (PDT)
Message-ID: <e8085b6b-35de-4f93-ad76-158bedb6d585@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:37:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
 <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b5b42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-8dpHqOT-xW3OEjmEsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EZRWG-GPrD7Cg2M3xzvKfHsb_uiVLCcn
X-Proofpoint-GUID: EZRWG-GPrD7Cg2M3xzvKfHsb_uiVLCcn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3NCBTYWx0ZWRfX0PD3UUASbbuv
 pa2Lso8z1w9MrHAVn9WfKsOSAc7A1tqIWEIKd4r9UKgDYchBzYcLHa1uVzKHGb7jd7tPttZUklG
 CbTRToBG7DRMzjXPyj/20PLKX4drhM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3NCBTYWx0ZWRfX3TzgBQPdY5Xt
 BQkT+n0oNMyUbDQ1O9wqYvheP6Lz+omr7PgdHrE9jY0RVSg2ZxaxBbuCKWYlIkOu66mTC8k5Khi
 jOoDZj12qGcPeUYaLdpNRTeIg6MvpUS0bo0V94Ki4tKr2hr4bfCTgN8fGa78FH6Znhf/KcNQrkA
 WZss9Hk3ttCS/NDYqq6jeprHIKMrNZuaLbSF3elEvb3RN/edXy/0PKBEcZFRgwgKvkUfZPcpubH
 uNyNWmGC2TxI2W+fLt6CmSGOk+Ihhq2+rjOAkTtedc7AeabSLqGJYgPe+TlbnKmfrA7c4LY8X0J
 LKBerS6tlkc4x9LFuXD0g4W8qCwBD3TnOQXFkbMtbBjV0ss/ojS3HMRwVjTj8UOD+Im/asbrjvE
 WDA+k32nLymdPla9uwwvXf3Pl16TU4KxjqeRRbkWMl+MI228IlztHEuwY6gbm/0PkDbdrKvCgOJ
 mugN+D34uRHe/G4t9xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B42970DB31

On 06/07/2026 09:19, Luca Weiss wrote:
> On Mon Jul 6, 2026 at 9:03 AM CEST, Krzysztof Kozlowski wrote:
>> DTS coding style prefers hyphens instead of underscores in the node
>> names.  Change should be safe, because node names are not considered an
>> ABI.
> 
> Until Qualcomm decides they are ABI :(

If such node-name-ABI ever comes from Qualcomm, I will NAK :)

Sashiko also pointed out the error and I will be sending v2.

I will introduce shellcheck-style exceptions for warnings to the
checker. But first let's fix all the warnings :)

Best regards,
Krzysztof

