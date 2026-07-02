Return-Path: <linux-arm-msm+bounces-115873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CE2aAZY1RmpALwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:55:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0966F58E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ago6FKts;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WvuLy1By;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEF433179499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9975B35CB9C;
	Thu,  2 Jul 2026 09:29:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5863C98BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:29:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984582; cv=none; b=dqLUgA4NNhtpBKv8uxfc0ICn8HgQylErqYFTz2aUE+8koriu3lTeLOaQx196+lSNeSvmVpXcNaJmiwMatzuxr/Zpfv4GclyJNoIgNUWyLqRxshgx8RTp39C7L5It9v+XcafnGnx1QSuis2zIG/FxDqxYX0wL9ba+jdUYIr+ke8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984582; c=relaxed/simple;
	bh=yU/jpemcy7tvW3jtXBoDI4E00wHWts8RzfqbrMOa93c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omM30tZLsJvyGdxWSIMefNdj2JCLMztXcjUpJtNlS7Qc8ds+xj10otVjhhZjZHjMD0ex1YFUMh2Arj5pl03VwEZn2UxWIOKpB3EhgDNdUuQdnV+7ED1dkZcYgWNkC/D4P+I7mbNyjbFJP9HRvw3YA+qp+PYuoiosytfiFuWYhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ago6FKts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvuLy1By; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628dDhP3050058
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=; b=ago6FKtsuAh0thR4
	vgWMmcmuhEcLEEA95YZaPo2CnT4Xsr8gbODgmvQbKMQN9YW+sqheZsZLflSMwpy0
	3946ZOI7AvCTBOwzf5Qllf2tcYLYQGHEquoddNJGJhsoDSP3fAQzxkLk50XIvdvM
	vwheQ6SgQLDccCieknY7jKi174/gh416HDQ4QrnI4mg9Y6zyc2HT7IEXKmT7/52k
	NkyTNTKNogvWO8XqXAyDUlPh0r8u5LOwemQAhThQznKHI088QQ9/hsePmWOgW/Le
	dGI+dl8gCtb32GVjPtrH0rt/tVCvYK+xz7OfSgWhb7myliguUrJe5Oq2KRITTtt4
	QhwR1g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v086-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:29:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso3467556d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984580; x=1783589380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=;
        b=WvuLy1ByE0o7lUTqvjflTbDrOPVaI9vU4pu0Lpi8iwFOSNC0AX277E7Bvo9oVQRtcn
         icuo4F/As8lVUJaMOl+mrm9jykQXdfuAMxs91euLqL28JWUDuWNACUULfoIPBur3MtYn
         VRnTr1PzO1D4GCk87+taB53iZrGhMUb0feoCn81lHEqI3X6/o5PQ5KjZ7c9mCMS4bmDm
         jcIrElS3+gqQL1DgD1CXIznYzrT5T9HfGQ63rFEPBgdrHwZ4okJiJk3Ur1XUajqBYipf
         rarpAbwekQToVWWvZEnAYpVm1o5PUXqfC0D6lLn59zudkZLeblYBeeAs7To51E6UCYu7
         5I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984580; x=1783589380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7W0SwLJtrgKGcsnXDnu66SKr8OYCgeg1052OhuL06O0=;
        b=JMCXeUb3PO3iB6rN7J+Daj7iUqDWBxNsQu2124C21tDJdzan+HqU9iTmr0NSdX2EeI
         zkAyLhKFxewkj8j5k1SMr3CS8fPIMFlRkaH9ao7PsGG2qv3tYvIO3gVmBjbIefcc0iaa
         xE+96+8FjyHCiFtt+UDIzK4ZuV60HZ0bctJAoTVgzKgarBVlisFUIQUWNIJdYC+ncSRf
         hi501+W/qB9N+1KgF2JUIRtj2jCC7/CPxsTSI1DhJncGyl3NhR3ckeXtVaN6WC0gLCJT
         Oax6SdI6eexyFa7mWdufTu6Tyj/pMU3HqlnUpSy/rDo9QHSZF0VRdbROm7XzceP7A9up
         z/nA==
X-Gm-Message-State: AOJu0YxnuIHgP3Jtrt96yZ76CFCDufxIqAm0T5shhOwZAV5sFd7UoIPr
	8DMbikkp8nCxWuib7+ZM3fWD4yY3tdlqsf0fwvZE1MP7m9bp7sbjRLZDOlFCmKI/WRVirP9LkI3
	v0w6IWEAStpjUaI7uC89hIGYrVEXwkqnY0HfBbIdqJ85Jd7B0bMOdFTgR9xbjZtIekHLk3JsEhL
	rD
X-Gm-Gg: AfdE7clUx+T1bVNmoxGcRsvtC481sn6k0b46L7Zg6mkIP5wBd13zLLRCCBya33vbrEq
	5ZSl72oaxDQrvRIeu3rAEG4EqbSD46bb9+a2Ji96sUmkYeiq7Oggv0t45DTb4i1seWRpyxbzTsx
	1lrnwILvz40HlWMcpdKrw+usXsk/QGQ2WpBxaih/X3iI/w27nDj9fmFl5uhG3+9zO8vmJMJaIUo
	KLcl0fdC0n+E2rOf00J94rF/XNUTry+2IRra6azBj/jLqiHcRWwT7A9OkoIO0C5yQzpiHmI5MEh
	VuKa5yDyJq2rU71wqHv5DyN08r+sYPUVjD6JfCq7cRjRZ0yw5Swn4ZnF+kdjNimzQh+eiz3XQev
	DRmLzyZs/BVum8aXaGwJZC1iV9TLXkaGCHO0=
X-Received: by 2002:a05:6214:238f:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f3c5afce03mr48023436d6.1.1782984579632;
        Thu, 02 Jul 2026 02:29:39 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8db:edd0:98d4 with SMTP id 6a1803df08f44-8f3c5afce03mr48023266d6.1.1782984579167;
        Thu, 02 Jul 2026 02:29:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm669267a12.26.2026.07.02.02.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:29:38 -0700 (PDT)
Message-ID: <bdac77fc-41a2-4c89-9f60-3a8eefc9b9a4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI
 (SFA14-11)
To: Krzysztof Kozlowski <krzk@kernel.org>, Kaipeng Zeng
 <kaipeng94@gmail.com>,
        devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-2-kaipeng94@gmail.com>
 <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d9645e5-2e63-4c22-8b5f-b0f4368c581f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3UiZFxzBuLgHUlFllwRpfnOpSnvzyq_w
X-Proofpoint-ORIG-GUID: 3UiZFxzBuLgHUlFllwRpfnOpSnvzyq_w
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a462f84 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=HugCYbCrTmYlQir9MvkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5NiBTYWx0ZWRfX1/+htoH95n9D
 n28Uad2KW1H9gjOjfp/mb2vmoo9F6/IAlIeenNXdv6JFkFEL0zoxBnElv8MykphXUr/IoAnNBTj
 hOqPpquQ2/KWo6NBenhjbb/967N/yrS9OTPcMncRLSkt/mTXbLinRq2zFJOYvWsbeOQ23+Mj+Kp
 rPmEV7Y31xEyAp6oNQKmoxbmKuPAFlee0UkEfbSnHiwU/R8azTnlEh35DBagMauip5veKors03I
 IJATe9zzzNZoftnSZ7lI9BfI0EhFS0Q4DBVHdTx2BO82SHUkto3YlgBH3t1Mzv+ZFrfa+YsvyK2
 1BljDYgjkLq3BY9LeKapJO/I/GPWAkRSfWx4703+XTjD0rgZLG6kDp9UzlQucZGxyQTh9FbtODF
 neWIJRjmOMXvfCG641JZdAcBq5c7K/HDCR1uxE4TBsriAQkKhU7dIqXRisTsWEvH0MK9J3EDDJU
 QmM/H5Sg10PbzCygPpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5NiBTYWx0ZWRfX7ii0kPzYHnnU
 HNMktijRW7yUyUrzoH7vcGf3WDt9xjYu/PqOq/h+YhVC5MU5kjAVKxdg9rTygMPerBCQYyJA1DJ
 NhOs5U9kSsm6cSWyN3j94CwEBCtJlfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115873-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:kaipeng94@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D0966F58E1

On 7/2/26 8:27 AM, Krzysztof Kozlowski wrote:
> On 02/07/2026 08:31, Kaipeng Zeng wrote:
>> Add compatible values for the Acer Swift Go Pro AI (SFA14-11),
>> using "acer,sfa14-11".
> 
> "Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
> Elite (X1E78100) SoC."
> 
> That's it. Don't add unnecessary boilerplate.
> 
> 
>>
>> The laptop is based on the Snapdragon X Elite (X1E78100) SoC.
>>
>> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 50cc18a6ec5e..6b997d615bad 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1142,6 +1142,7 @@ properties:
>>  
>>        - items:
>>            - enum:
>> +              - acer,sfa14-11
> 
> Why no user-recognizable name is used? Look at other consumer products:
> lenovo,thinkpad-x13s, lenovo,flex-5g, microsoft,surface-prox,
> lenovo,thinkpad-t14s-lcd, tuxedo,elite14gen1, microsoft,denali,
> asus,vivobook-s15... and so on.

We have a good mix of both. I tend to dislike relying on marketing
names, as they may be similar (or identical) across wholly different
products.

e.g. microsoft,denali that you mentioned is a MS codename for the
Surface Pro something something

Konrad

