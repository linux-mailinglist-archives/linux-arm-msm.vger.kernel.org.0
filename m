Return-Path: <linux-arm-msm+bounces-117308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwifDM7uTGoEsQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:19:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93071B4AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UzIJtxOz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JzOTGJ6F;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117308-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117308-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EABCF3013C54
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C853FE369;
	Tue,  7 Jul 2026 12:17:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479913D75CE
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:17:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426675; cv=none; b=lOiHLhm9jWpKECX7k3YWxKeHmAvAy+IC23D8Yfr6/Q64oKp+X/CbnZnVrZXxY/h5Y76Zd+PVOkzo74SttKYMOfIa6OEHOyUpqV/pAGSyXyWw6bbMQ6aaHuebHPnzXF+RgsjHnAoB2sO5rjntCN9JDvs2Cujk+6e3Gbkll4ASynI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426675; c=relaxed/simple;
	bh=Ta/bE9egbWl7Xktartl8cK27C2xuvBOh7ciGfNUeAeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u22YVR8PEZhMR5b+uEpQ4mkB4q8PpXqU02gPM3NSQrRn8MYxApsbNwKmMm7lxqBddB201oDXToopfhYHrJR6AJQSaOcYQs3P8VPYeOPKgnoPe5ZkNW+dsUQI3msILu3gfkLqgelrd9zkll2Rzhr1QHH6srTIlVEEuFfhqB0IDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzIJtxOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzOTGJ6F; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C93iZ3590157
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SiZ+GGo/Uh7dQhyhwAq6wJ90giuKEqOR8zd+Na239c=; b=UzIJtxOzV1cRutQd
	LSIBy1pYgk5U6t0gbqXaVaPELgnzQ7Fgt7J0491uxgy4H8Det52h/mOZIsq8l5OX
	VRG2x+1+D6XaVC1Ji7WT4pONK6cM0my+ta274ZayqF7h/fLoQAXC8IoRXFucj80s
	GEFO/+tCb2On0YkvEtbKrBwY+1UMdOV/DMGAWtG/usI2gXg1HWaQxwUF4Mn8lWBQ
	tAa4Vi+Lv6EJLukmd0UK8UfIe3rdtOwysmQ4YdpGIDlFndlMSdqE/CzlFaE6LgAd
	4EMVHX72KPC+RuMzuo/tSwT+ff2qK5yFnuPcfs+NxfZkG/L2i7vIbgUnXNJVuBMg
	EpVH9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u948q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:17:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eb8914e651so83213706d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783426672; x=1784031472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SiZ+GGo/Uh7dQhyhwAq6wJ90giuKEqOR8zd+Na239c=;
        b=JzOTGJ6Fi2p67orK7c7vC2PihNDnHkd9crwjb5o9AB1O1t0jKnVfe6nXbujmtIbE+7
         wm88JEokLlzgVq4RXe+UA6+6DuLETF9NEoUcLR7QIEwgYVry7swo/yiFvqnpiJPx2tNd
         X+80BJOPPUuphh7N9eAAcVOm+ZQ0XQgSZlac1xEeyEp6HYVSDjP50x1yS3wSOeP8BK29
         jYrg2YPDw7ZwPeqve5zMeLF7yjvsJH2Knrusa3zqCUu6ZTM5F4ucSIUA8ZwnxD6i3hq3
         1X7SG08ppCeUJHfmjSioXePf4JtW0Oxo72XHZzIcmvaM0QRBALZdl7QYeUnm2u8JHUzn
         0zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426672; x=1784031472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SiZ+GGo/Uh7dQhyhwAq6wJ90giuKEqOR8zd+Na239c=;
        b=p7e/YAP89pkDr+y0ZMzL08BSg8xPq690ji/VOAcIO3A55gpwPpglb4QdvEoNrUhCaZ
         KMg5qbu21ku8zaJmhpCUCkBCcNqxBLKM+2OSq3LB8x6uxObdw/3lhe00p97D+Lf1NoNV
         ECME3YvJbGXrlnocYFllnrz9tovvgkKnZjbqic+fpsEf8hTILb5MDtmopOGKKEi2iGLk
         mKr1H20aqC6VGaDqSkEdu0wa2J1AHso690V95QPYi0i3KOw6GrUhY6eMqRMLqSEbxlnD
         rhyCjxDPThkJ+M+OjK712TjO7MBLV+pm37HVf/itnC7wM1JdWUDMkt7y45FguTq5sW8f
         ID7g==
X-Forwarded-Encrypted: i=1; AHgh+RpQlG7Bu9PK/GO8DUBvGl7EWY7hXdnqnPY802nlq9fUCxazmsdpGzbVNj0olLPwj+t3R7U1+tdh3oy149XC@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwn/QKeGkFh2Nl/LifElsGh2sn6zgv/sBt7Ci8Ezx0TJIrN6s
	ExFDhKzB57jjdUcqHEHUZ0hRoNY/LcrMgiNTEQgRoCcy2jJ58r1Nlt+BuLOKsSVnQMqMBbtkcSH
	KGIn6aZGre84tAvxuhBQiciP3PHgwGKhxLxZnUrkTANcLiA66GQK3IuVAaqKw1qCzWyup
X-Gm-Gg: AfdE7clHn1S0rhslpkKUzUkES+d0pgMfvd/xHQZT9EHJqcS3jH+CyGs2E18aCZhjzms
	3E30oyR5C7GneGRSQ7mqVd1oSRUVk0c85Y8MgZQpHPHD2f1eyIRfGAmLZMXCdLo4w60oCSigXVV
	Vi4aC1XShXchvpkGZqSUp7l7s+8yGY5dvrE1aFHNB5d2652JuX58pd3sKLUWyv7NYZs0M82V5bk
	ZtyZry+n9D2KAeQEPPVCXvcTp2UftrBaPBz1Ug9sWfgKBVW7E95dbtQ9h0umUFrbZVQMt5DXlSp
	wlUKD6jJ7yRlFU3OLtAKlwdu7ynv8bzU19jc30W34amDh0wohjGj9v1HQsTRC34CvZM/t5EVrod
	qgowbDzjOxpLv3cxkEbdkWeAVQaOcPSyZ+xjR0FEnIvSF7aZFcltPCn4l3L8xAUDfrE2jNPZfMI
	eL0aSuzk4=
X-Received: by 2002:a05:622a:286:b0:51c:7b12:120e with SMTP id d75a77b69052e-51c7b12172fmr21403871cf.76.1783426672487;
        Tue, 07 Jul 2026 05:17:52 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:7b12:120e with SMTP id d75a77b69052e-51c7b12172fmr21403491cf.76.1783426671913;
        Tue, 07 Jul 2026 05:17:51 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bc655sm118332266b.41.2026.07.07.05.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:17:50 -0700 (PDT)
Message-ID: <f9b667b3-26ef-4c1e-bff2-71533d657cce@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:17:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDExOSBTYWx0ZWRfXxEvqLhdL5V0Q
 /O557dL95Ebl0QtpExT8SArr5eJhEgWIulZ3DSa6pRGNPT7lKugjGwmq+qA4qX5ibFYndl55yCO
 +nrOVLFfHrqEbOHaG2eacm+74kIyW0E=
X-Proofpoint-GUID: 1b2v5OYYtBgb3M_p5p5GRWSXZT30hfZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDExOSBTYWx0ZWRfX67U1jh56KNaD
 9lDoR23BgChBSdwz6mwxPZ+TXE0uw/6GljNAO9FSUfLW0q5buCNSGLJ3MGNHQaZbLvnI/gQRgv4
 g0IqZCHw2mgiBPO6dEl5F1SdMzxNPTge6qUxIDAI6B3OW2DQgHBRanAFe/7YdlMo6SdjyBrTZ+e
 vR/dMz7eg2LEEsrKLwA/i0/tl5JcP/rlZy/Ewb0W1OeIjWzhdG8WInnn7LNCmZBpCKJZ67MwZ1g
 MePnXZb/y4EO6gVBCU2rj1UiQqZWb5sxGZlo4B3MyDcDVY5Tv/ilABd53FmodeVBkC2q6awMaW4
 QmAY2BsNuqQbYzMzolwmnY4l1iUWD0GeyTVPVGrfgmjAG9MwdcYfuT20IvlT11uwz7gxedH8ev2
 LffjYBUfYfLu3/sxHLLqHrR01bpktwUx1MUYX89dVCFi0UfzmyA83yR9I8cLMbj4Tc7vqu+IWUN
 0Ge5UbBZrxGzKxvsByQ==
X-Proofpoint-ORIG-GUID: 1b2v5OYYtBgb3M_p5p5GRWSXZT30hfZL
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cee71 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=uTxpKD40luCw_XNDSPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117308-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,nxsw.ie:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C93071B4AB

Hi Bryan,

On 7/7/2026 1:00 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 10:24, Konrad Dybcio wrote:
>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>
>>>>>
>>>>> The idea is to make all of these peers, eventually. Not particular 
>>>>> block
>>>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible 
>>>>> block.
>>>>>
>>>>
>>>> The statement provides the same information as before, e.g. it's 
>>>> found here:
>>>>
>>>> https://lore.kernel.org/linux-media/fbc018f5- 
>>>> c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>>>
>>>>       There's no functional linkage between CAMSS/IFE and JPEG - 
>>>> they are
>>>>       peers within the CAMSS power-island.
>>>>
>>>> Thus "the CAMSS power-island" exists, and it got its hardware 
>>>> description
>>>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>>>> a natural resource of all devices on "CAMSS power-island",
>>>
>>> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all 
>>> of the nodes within it depend on that and it is _external_ to the 
>>> block.
>>>
>>> There is a CSID MUX on some SOC other than that I'll restate it 
>>> again, I'm not sure why you won't accept it.
>>>
>>> There is no dependency between JPEG and IFE, one is _not_ 
>>> subordinate to the other and trying to find ways to invalidate that 
>>> statement runs counter to the facts.
>>
>> They are all subordinate to CAMSS_TOP - Vlad indeed said they are
>> peers (i.e. there's no co-dependence between them specifically, but
>> their parent is shared).
>>
>> You can't use any of these IP blocks if you don't first power up
>> TOP because of the physical layout.
>
> Yes and I'm asking for TOP to be listed in each of the subordinate 
> nodes for reasons given below.
>
> But unlike MDSS - OPE for example doesn't require IFE or CSID to do 
> its job.
>
> Over time we can move the bindings to a model where the only thing in 
> CAMSS is a top-level bus like declaration but _right_now_ what you 
> would do is create an artificial dependency on say CSIPHY for JPEG.
>
>> This is exactly identical to the MDSS case.
>> I was hoping this was clear after N other similar threads.
> When we split IFE, CSID etc up into their own individual nodes it 
> would be possible to model as for argument sake
>
> compat = "camss-bus";
> power-domains = <TITAN_TOP_GDSC>;
>
> jpeg@x {
>     power-domains = <JPEG_GDSC>, <MMCX>, <MXC>;
> };
>
> What I'm saying here is do this
>
> compat = "camss";
> regs = ife, csid; // exisiting bindings for the last ~ 11 years
> power-domains = <TITAN_TOP_GDSC>;
>
> jpeg@x {
>     power-domains = <TITAN_TOP_GDSC>, <JPEG_GDSC>, <MMCX>, <MXC>;
> };
>
> Otherwise you create entirely artificial dependencies between IFE, 
> CSIPHY and JPEG, OPE et al.
>
> And BTW if/when we get to the camss-bus stage of things having 
> TITAN_TOP_GDSC listed in OPE and JPEG is a very small price to pay.
>
> We've already agreed to gradually transition the bindings instead of 
> go for a big-band integration several times.

Just to clarify, from the jpeg driver perspective does not make any 
difference whether is child node of camss or other node. For sure it 
will be explained in binding documentation,

but just in theory we may have jpeg encoder in future platforms without 
camera sub-system. So where jpeg is placed is strictly platform 
depended. Do you agree to have series just

for the jpeg driver as it should be, the changes in camss and device 
tree changes for this platform will be not part of this patch series but 
send as additional one. Or you prefer

everything to have in this patch series with different order of the changes.

~Gjorgji

>
> ---
> bod
>

