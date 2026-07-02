Return-Path: <linux-arm-msm+bounces-115991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFuHF0lVRmr9QwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:10:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E816F75C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:10:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=psYFDeYr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hQ15Z14S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0933158394
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9757E47F2C3;
	Thu,  2 Jul 2026 12:00:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931F47D933
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993619; cv=none; b=QV6ETuFj3l1ccs6ynbiLXmv7Sah4BWA/Xzr6QoF9ftA4cy0V9k4MBzZJgskgn0yZ1/eWJ3uCeolqihrSO7FcmyuNaGg7lbJNYhO8bzilwHsJSbKm4f3wFzRzOcvn/rdU52LR6T7gW1Jm6uID4lVY5OoIzZ10fLKqyXdg99RGVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993619; c=relaxed/simple;
	bh=VE009zKAiRXRg9OovYQVDq4QF8WErMKoILqPn+zh/QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhArJoQBXjkKQ9xpdbDW7Lv9rUEjTEHhMUf0ci1+jcHeV8HErvDPLf74VeCxggrAafRrgG8uPnAhYPF13nSvy/gEm/LOgsXaS+d1NFeiG9KXSX5uu6DX/Jr2tuxRKFaQ/7tVtUfRAYU9E35lXA9PEHqWgSuFlHjJVgoPElLC92s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psYFDeYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ15Z14S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KKYT4115193
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VE009zKAiRXRg9OovYQVDq4QF8WErMKoILqPn+zh/QQ=; b=psYFDeYrljUYVs1S
	dKbspBuA291Ut4sXnY8N7fn6GOQyMjLQ9P16Lkk1AQuh1zdQ5/7K7gyHLNAdBO7s
	DzUdHERWOUnblsLe1+pATVDrr1VeNAaAmjbHxcMVAq3WpXreK5GCQoZAJRiVUIkU
	QJ7ufVWFYPY9WzOgjUdRtRNMPzYWzq+c5dcNr1Bl/A3NbzhzB+gJC47udqrCl/xK
	WZ1JC5zh5WR+wSS27qLBLr4y8+sjC4aaQI8IYYx/lplhbZQF7q9Db9OwsuidVjam
	z+88IMNu4ISsLpO9grjSHPgDp8DZFaUF+JXfVh0RO86EpWd8RaiJ0w9q3RMYrMog
	OIzLhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940k4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:00:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c267931ebso6838461cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782993610; x=1783598410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE009zKAiRXRg9OovYQVDq4QF8WErMKoILqPn+zh/QQ=;
        b=hQ15Z14SpT7flWw6BJ1cBv85UoVfwiinEG/sp+uroUxLdTNSVcjpHy6YO6cCv/PUQH
         xrNO6SUs2C8kJK9CkLufIxHx7GStICjY514aEx1JeXsT/Dv9pyp+9smlZVuIUB+O8puc
         5OBfjSLQi1W6sp/fK1rTpTb+FhQmyxTVD5hX+X6AQ4Ac4WsqUpDpYwI16NaOiwmmTG+g
         rTNnaqv6hjB/H3Ru/TsgBUjRcdaWysxTWTsmFtAOD9y9gbUHCQwJ9Syfx6eQUtZi0DHz
         EtJKZL9EPaPmadACklMYnmy1tcZSRznYa1yq2Xm96TMe9L37t/jCIgAW3N2+NxJaoeka
         lzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993610; x=1783598410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VE009zKAiRXRg9OovYQVDq4QF8WErMKoILqPn+zh/QQ=;
        b=q5ObNUTTbxUNWnB6OrVbvF2zp3Ia8hg0OJbCHCI5tQD+VaiOU7CbbW4zNFZX4DMfCQ
         302IKxSRCOqEU4ONdOdb8WA+TdKWm5pWpToX3q5PNqzjh8N7iVkT+3JeqoG3u3cD2UOW
         fJaxguQKiaJDQ5WOVDgGqfzEdYBIOWxI3i38ll4uNgBJ2xXzh/lArFyAYMIKOoydd+ab
         60yccNLZIKptetyduGM7yWW+yHRuRmBBl77NIyD9uBLvscazhKtncZ9Dt17TTw2gAifW
         DD3HOdNSUidmZzKuzqDs+D8F4b4/ST530wu15+NeLQ0Pl3WYINkndYKi2nvZHQA4LvOZ
         J5nA==
X-Gm-Message-State: AOJu0YxCFyB03Ud3cv/yRMdREdpgDDdjPfZpDZrz6gjT0ut244hzWxuC
	zVpdUoe8RlITjOabZQjeq6EifJbd1d7H2ZSCoZcqE0g8I5yJ+y0ANc4HgMOmoKo01snglvoRLr8
	SxeNb7FY+kRZjYFQAfe8ZnRTeg17WR9QfBvGmGOtElwBE1GlP02m0DfVE5OHgRlSU1VZb
X-Gm-Gg: AfdE7ckC6whGLllSdQTr3D5P2t/KX4gLL5N5N5qS5aET4IaeFuPL4zRS4ZkzDHGA0TT
	Q+GF4QwF9zLbSFxpULa/dFgReb9lUbFBG7Em0texZnHIg6cmhNUSrfs7TSb+O8+QtUaFZ2Xxcc8
	LU3gOt1uPOzOsFtWYsSpD0hpulALLUfG2Slcdf0o5JgLPzfphU/s+zoGTNQ8j0DISm3o+ePNZlA
	athnqwx8OTpKolmW7VTFB676kcnxVduz7ubZ3aavMjWwksZnNZnjae2JdD3FsFdnjycg8x23TEs
	9zlool0IT9gxDKEBC73Zz3lAapFcscbvu0VbZ/HItYs4sZw4P0jtltDcPS2+5+hgrql2f4ZcnE4
	Q1ZRn+pIasCgyWkJOhP0o5R7lZYOWRWZ6ly4=
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr53766581cf.6.1782993610119;
        Thu, 02 Jul 2026 05:00:10 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr53766061cf.6.1782993609460;
        Thu, 02 Jul 2026 05:00:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b609382esm119942966b.18.2026.07.02.05.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:00:08 -0700 (PDT)
Message-ID: <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:00:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: don't unrelated bits if autoresume
 is not used
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX9TqnhsNoQZBQ
 5ML7g4FEqQIHbEdkFPnRLdwUk3TqgC8/PmGQsFsCRac6Ozmud4S5fq2Sq2kFc3wG9kcokvJljNA
 8YZgeuySOuNmls4aoRxbkArTlQIMZLPToTN59lC/REVz1ZW39urGhzN6+K8Bpgs8ce7Jvhf9Hq/
 nsyIWsSMSgo88wHXf3sh+LWFRV/SavUZKDGf5+++iySU1///N3egrU0XSG4dUNmTuUxhAdGZO10
 dQbdYslvLUHV7IJRc8GC8p7FMWFGKeWbPheKZsnI4NUtmYZ4dCschSJnPaDb4QlDaaaOdIcdrn1
 uMzQiDw687jLPOv8edkSUCxFLwU2tuiriIdeMvV4kF7ALZ9W2YZZXOscvstN+QBPYeHfP/gW8U2
 aQ2QA+FAUleVC4Nbe5nc7TCUz0ohiA4Ddwv5fMT9aBziHdqYxIB2jCoLuk0yPqkDTy0xtdyEnBW
 GfNbo3xTUeV72yAUY6A==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4652cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Y22fvUz4BkWrnB2esuoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9nuwrP6C9A-zYjbYQ6AK1fSm7NnlInq7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNSBTYWx0ZWRfX0aAFcHvjwREh
 CBlOWEe8OU4DLwnWw4WPip5upGbQyIXOYDEbucz+eat2gC7HNMEFJEySJFmWuJvZOrlF/81qTcr
 T+M555gEDnfakZAFFdh/hrZ6rcyVLKw=
X-Proofpoint-GUID: 9nuwrP6C9A-zYjbYQ6AK1fSm7NnlInq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85E816F75C5

On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
> The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
> bit.

why?

Konrad

