Return-Path: <linux-arm-msm+bounces-116016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pSpJf1ZRmq6RQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:30:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF46F79B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:30:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fT135sld;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ismC6bZv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0229030B226A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2450947DD76;
	Thu,  2 Jul 2026 12:24:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2247DD54
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:24:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995056; cv=none; b=eHAKjmHlp0h7TUSUFunR9oRL1v67juwZ4v2nQ9LKQ1+nsaCTx8tdEgddfbpKT+/1/DxUALnwWsSUYgs79n/b46m4QqgxK0s9VBsvHO/pqLttM6GuPg8GQJk1SZ3UKsK9sp5LV3uuf0Y2mAdUqK9H0qbQb5+JKH7bGaFKw1yQH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995056; c=relaxed/simple;
	bh=Vw72B4i3j667yp9eTPCrh7awolB/g+gnqCYXLuXf9pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KaP1XwiJrsws5xRATZrxK0QjFl7ao6DzJ1dv8/x57MXZVQ7qHVvpTSTcGn1tdViv8ssXGizAYsV4tnrxxyY552SMEgRhpyXJbLPjodNX/VN7jsOuJO3tQvNkOzjPJB+aisrr6BtnbHmXOATvrnlN3sK8dXD6a4BR46ZSTWnCBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fT135sld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ismC6bZv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628OXVp3049474
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ysu6rFrwI6sIZQattoBdcRvr43Oa6oy8UfSfaHCL0s=; b=fT135sldthQO8UQ4
	UC4egYQJPJDc6gLbrR3Zle0no/md1PC/TWvgf1tdaze2rpGu9gUrw0sHpZ2cuaJy
	yItTn2/w0vU6Kzc1EPu/C+CdEU+7U5j0ONLUCYN4J7LEMO4Ckjy4Y9PR5n1iDUh+
	8bQhAi9q2bn99eeSQYYJ67pAo8zUcRkdUvLQCsWTXlFKUDC5GrJpvzaSvgI+XJp/
	lG/QTSEq5e7bM5vfD51vdWwduogzca36Hu45hbRVvxCcDH43TFAa+dg3hqvsqIYx
	vKAvQ2YRIToVihIaBop4H0UxqzZtOykYJOgPWU9Kd7TIHuJDF8SgUZKkggE9p1bj
	GNBBfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vntm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:24:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19a2da0eso1283281cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995053; x=1783599853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ysu6rFrwI6sIZQattoBdcRvr43Oa6oy8UfSfaHCL0s=;
        b=ismC6bZvwegM7NVkmw8duLzFld5bUr0jopWtCX8fIw2V+WDKV8HnBHqbeE39HN/oT4
         5fhS5c+3/gs+qGt4HPHVB/JhOjj5Qr4Kwi6C8a2URRhbMPr18BHy4nE1jbBm2usL4nfE
         JHwX4pWM3HvTRv1LhqztR4Ng+wSzxktSBoNDNSsXfAlfJRva3uKaNivHiWBJJkj8iwGo
         bfTMJYh6DLbwkCctTgtEuMXzaDD0ORWuEccsKuZuTxfhN/2E35gDxROLL19GEP7u8XE+
         G15Sjn28nETJjfSTX+/9wEqrnIZfZQHO9bn9Tp1pgZuCihbA6lO1KawJlH6ArbfvchSV
         aWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995053; x=1783599853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ysu6rFrwI6sIZQattoBdcRvr43Oa6oy8UfSfaHCL0s=;
        b=bx/sLcwWTZUehQ66ZPwvM85w6uhioswqU36mL22fwE4up9CkcR2RSys5L4Cxj9KDfv
         Nyzp9/rc+Nb1rWcUPexshS4uRA4pSBkgWeovs4I4cmJY0mhm9VnjTC1NNDo+p5+NwQx3
         FTcE/Akb/2q60EZCXKK7/Vb1tOeOJUjR/I9VJlcvPSEGKwfLhQQzpqjndA0ibH8vC/cL
         niDbgSswrLvnXlRDRMzIl2NrZmKwzZyXSqtRo9VTtkOLBEL7YPvQD0W3+Occ7Yte1ui+
         25ozb03FfiBaC7YBbkcc/KLyISyL9MiJRs+ii8mSIL71B2POqIE+V7rzfl6A/bs/SaL3
         UXxw==
X-Forwarded-Encrypted: i=1; AFNElJ94EAhb0aLUgRXKXBdUCWDTOe72MnfFiM7UwUt4E1YtVXzzQ5UyZuedPZ7h3F9BbCQZzKLeir1eStfdyk7K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/TJ9Y00ZqrhrWEnjmBlgcph8fmrnUoeuM0uu7tRwVSzabJJ66
	XpMCAc6cSpbN4vAjpDdDJA7D/pdd67G5rq57GLwvyDvibYADoHb6ZA8078K+Lc3jdS9woWzAXT0
	Bn9dyQrrT2mvrtvFhCGyAI7pX6OikbM7wFm/fW2kIUxlKcy3bSOlUNbKhOgNNHalfQcEK
X-Gm-Gg: AfdE7cnKUNtNjFwzVt+xPuF6X1jl9KQAMqRD2+Mq28ZrwkghWoh4wB1XRC/l4C0BNCv
	NzNQyTj5WJVmPew0XhjNLonMhUEbGgNj5S/IqvIUsYiom0VReQM2eCIdYErjO4FIVmizYXnB0Uz
	5LiN/FVUNgYeBJt5tMCn87HtIGD1FUweWq7hV8EeTPE8qw9eNgIe1cBeGdyY4S19n7pTLRCqVo7
	VrZhmSTfXh3JalELyaf/SPFGA0lic2e4Vm+WMIhoYva6RaWefEKRvVxrKboaxn/nu+lfB7fTwNR
	5AlHvtDGqjy1oHUGGep2G6+Em1pNpd2URy5MhaxJ2d7RuylBJ0FUOxWy4Rt5akJLzRZ3ZqT/nU8
	Pba9Rb9NjnRYAaXEoDFSiFMD6t3DzsHP87xY=
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr58178351cf.8.1782995053050;
        Thu, 02 Jul 2026 05:24:13 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51a:d45e:638d with SMTP id d75a77b69052e-51c26b25733mr58177911cf.8.1782995052418;
        Thu, 02 Jul 2026 05:24:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm123770266b.16.2026.07.02.05.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:24:11 -0700 (PDT)
Message-ID: <3c533783-e2a5-48f3-8275-4cef5651938b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:24:08 +0200
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
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-1-b5cf55621524@oss.qualcomm.com>
 <64f7efcc-1cd6-40f5-80c0-ab5f882854a3@oss.qualcomm.com>
 <3goo36jai5g2v24ijlf7g4gehq5zdlk7uwizya7dimqtm5pmrs@norf4xbqdlw5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3goo36jai5g2v24ijlf7g4gehq5zdlk7uwizya7dimqtm5pmrs@norf4xbqdlw5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sQ3jz0O-3K7WqzpYTg5HkuPFDvzpJ_Xf
X-Proofpoint-ORIG-GUID: sQ3jz0O-3K7WqzpYTg5HkuPFDvzpJ_Xf
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a46586d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hY6eLmSKl1PMl6UvZjUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX9mBSS74PWFXt
 K6tmt3mfygPGM8Gte+vxRiYdOXM5rNajcO36RKL9susIo+ZGeENspIQvcmq9vKZzNs2XKM9JDND
 QqmEf92pjIUa7g1Eb/1/wTGa1N5QkmUoglXgpWwwXWNKt39wQ8vRsMpJnJh4N7KCq7LSwkTgnaR
 7d/62oZwzst1X7BefszY0jiCmF6q5V9UhmYsZogyX2HzIGp+N2u3H1D6V5TEO2yAs2aAidinOwo
 3kJJFhwdNM8/yQb0Q0XPQ/CQR3F5oE1eK7clytcygqjHVi1ji2CrSyVk/h91RO+wM53zqHgzP3G
 i5KZtaHPr7IuNbrGCOrgT7X2sNsyCPTTAP/xs/03LFv7VcSFgfhEOGydVe81kFabuaF7mP89Ke3
 T0eLNjj/UvtogQ1h+WkpTCtMgtHS0CwdB7GscTm4XzeLNswljxI7uJF4/DoclWWpCz+Dx39/32g
 fSUW7tDb2dYSmIgReOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfXwB7aQKNE/iEF
 hpdHh4f0uO5285mv/FaVW4dFE+6YmQg0ghRj96qwCnNBKcZ/qivAjINwNqjbR8TzPVD/acobm1c
 155r9ykKwUwr+fTEjsNpel7DUZArsqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116016-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:krishna.kurapati@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3AF46F79B6

On 7/2/26 2:21 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 02, 2026 at 02:00:06PM +0200, Konrad Dybcio wrote:
>> On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
>>> The IPQ6018 and QCS615 platforms don't need to toggle the autoresume
>>> bit.
>>
>> why?
> 
> Here I have no idea, the HPG is unspecific, exact details are to be
> defined somewhere else. The platforms, when they were added, just stated
> that autoresume is to be skipped. Maybe original developers (in cc) can
> answer this question. Anyway, if autoresume is to be toggled, it should
> be coming as a separate fixup. I can reorder the patches though, so that
> at least register layout is correct.

+Krishna, Wesley?

Konrad

