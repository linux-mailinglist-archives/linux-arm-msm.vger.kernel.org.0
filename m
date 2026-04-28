Return-Path: <linux-arm-msm+bounces-105055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGyPKEvp8Gn2awEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:07:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C34899AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 862AB30AC525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5458633D4EC;
	Tue, 28 Apr 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HA37AWkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFBQ3g8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8D533D4FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395598; cv=none; b=r1aFhgmmq90FSgTDSMNLWEcXQh1FQPzenv592+Ms9f3uHkb2eSwEUlQLNY6+4naEtrviHydwzRvVtoCzNK4Vh3C1QBcRuhDwt+z08yYTpMxQdKgH145ASndPHxUhYdljhzi59Eo7eFxVpPp0X+tEvHDKboa6VA/qAxCi1HHDpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395598; c=relaxed/simple;
	bh=zNIqD+u/6bHWR8ZaUGS9o2H1f9iCEtasVeyP2jQ2kmE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VDwpCZzu4dp80/kE0Wlliu7bZ2IpUUHQqyFSawDKclEw0BtZkuZSUGRcqkcZqLP0a9LLm33Nin1FwQjk9sDweWmmwGrW8V4wkSDdeAA0T6FfzpZOyKUlVAwjAeabR/QBu+MWpk9uh3RMTxGnx+nZ8EU3n7qQ58xNU1PIYCxJyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HA37AWkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFBQ3g8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsQXd2946261
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=; b=HA37AWkVgZsLXJGm
	InrnDxSRFeZPA8oUL45uqIbte1YJXCT6bS5pHHR0a9eCQFocRV0IGB77VDwCX1YE
	yNxSaHRsWZsjGLyHOkcpi8tko2yEnh8U2r0HoN4Sx9l4UElelGOzqmu+8QgnvVdA
	rIV08u5yygGPOSZQgZrGRDoNDeob2FlI7+FSD4k42D196NCep12ZJ+MpQuSWUF40
	JHUMGg5iAAUObylJCfOlXHxJ6890mEFuvqR0FHGD9OsQ0Z/WWEd7/sq5tg5ZnrCp
	iXTEAouwXsjnXRPjSJjl5+41XsqHejV7RFq3o8oc9f9Ub48C1XilRYms1sm+re5Y
	FtrGdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhajyda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:59:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so122230785ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777395595; x=1778000395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=;
        b=YFBQ3g8wY9gxrBiGr53ZQVWtj0ZuSs9boBrUIYMI+VS2alirOB3kQ7h3fvc0iWYb6T
         PtddgO7keEmC6+xIiipG3UiIzxEkwJi2flD/mzeo1IriSdQHLcWv5qHoAxGkRBLxS1FM
         qis/7hMs8O8SGpDcj0V4XdX75xc17ktO/meOtiqH6M4Jx/DtrR6nJ7Y85HTYvo3QdrtX
         sOFdxdGW9UEgm6y3PA6ZSeOLpGyxuIROT5n30t3+8AmCC01qHTlpmA2bdMdAtrq09enx
         P9Rty4dO9KWkjvAiFjTzTjpmSp4izwIEuyjMyswCURd7zum+AdzShx+I4Sp6vAWb9miw
         yBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395595; x=1778000395;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK+fabCdlgnUflnGF0rXROgGil+GCsdH9mAVd8Njjjk=;
        b=IfFJbQVeYzpRO9DtUlVMo4/myafKSllDOMVGHgoxfXoRfC6ka7HPXT5IZzJyL4Q2n/
         Z0Z5h5LnMZFrOCzm5RJ/mFLTIfmDFQY9zTN0u0FSASECpl55IUjuBBzaaYhJhres2qJb
         9O9JEyTVD1uju/qKYDrNIq6/37PQ6s6RKQa4hDZbjCZCqG8m6cMWUDdBl5iLhkm9w7IN
         HteXcVydVImqGKXA6MIDZvbZ1/WQVJydhOXxhHltUshezaNnziT4UeqTEmYI0LjRbcN1
         XEf7mGxB5GhWS7qO5AyVrbLj35fSZLexVhTWcqqehOQgUdW0vFLouu/keZoD3Mgk1awh
         91AA==
X-Forwarded-Encrypted: i=1; AFNElJ/pVuVS4G3YvoxXPU2U6V1sfqmzFw+7NMx+s1VhPBbyzhsVB2Fzx3pU3T7r/vBukWW/tvrMcqXh9EcjrCyN@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZJE+2WRxxQXPVyXqgIWWpxk1ZPPuHZtfbeDkFH7ZKaI2hEEH
	cACI48WZd5wGbUERq4MqwudxW+rY0h8WXnL2aV08W74nbumYkx7GKO2P9dqPdsO2CAsPeKxU9Ml
	i3CcE6PltQ9bha88k/HQq7YDysGBl/j+3Ox5U9uGN8uFbDZ54UrIA3bLsxgJD0lBhlKWh
X-Gm-Gg: AeBDietn8jXuisluksygH+//2vuYXLwVcJGaJJyUvNtiNoGOFs7lcxBxzt8UkNy7sR8
	K6C6yg+1R/lBXy/hnFY1mLeLNHF6VcXfaUXxofCRUuZJI8/wwvJuxM4GGkmKbS1YlhKLnfq1d+8
	a9E8KtZBnQQ+KibmfH/Aj1XUNcem7H5Dpjc581lyXuC8YvHUVjONbCa3+dhDzlM6PLcJNmb5ykB
	GEz3wHxXZgYurHUP15bpxuuLx6grUd+4+Vks2mCLWTvBrIpXV85MeoBy7pbqAckD+34Go5PRiGo
	DDNTBql/VpyCRxaLDh8JaFAuvq2/TSNeNHCrF3Kop0U8onvBBRgpr20q3NLnmdYSntDvD2oWtoJ
	SUYYHlrj0U7HyCBjv1kqn2+POIdJmdiH1SvAjejGSsTjHMn2RxIYllhuqBZQyGBfrASQrnHSnHq
	na
X-Received: by 2002:a17:902:c406:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b97c4b5815mr39711085ad.32.1777395594721;
        Tue, 28 Apr 2026 09:59:54 -0700 (PDT)
X-Received: by 2002:a17:902:c406:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b97c4b5815mr39710675ad.32.1777395594081;
        Tue, 28 Apr 2026 09:59:54 -0700 (PDT)
Received: from [10.48.22.70] ([110.224.84.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cbb1sm29142995ad.57.2026.04.28.09.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:59:53 -0700 (PDT)
Message-ID: <eb34a557-673e-4d1f-ae11-4958e7ef5efa@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:29:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <CAD++jLmxJUPNjXkFi490GSPwB-bHs4tdJmMFwxyCX07N=kxGHA@mail.gmail.com>
 <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3f5103b8-ebc5-4855-b032-f20f93c89dc8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MyBTYWx0ZWRfX6fIwp7q3Sy18
 nO70b72s2PVzZhC9FP8n3Rw5kTT6hRaaSPGU1dY6HV6ySYGYSZzphiYw6Gu97zc3Q5VzkXieF3C
 YHkBTqH4LJulqfugWBYRd9HWt7konuR/+prj0FuuEIQFcOtfEkSsvaYjMpGUEWdhtHcRj0JmwHy
 VyxhFN3262OlOFc93yiKnfj14r6GG1yAvHMePiIJiLRKGyySSms26j7jK1oqvTPLpAjDHGc3C92
 /HmvharoAffbDBRvmjbfOvxCwZrzCQqOKgx2v+xYSjcctYsHi3IK3DaVxit7NtGVNAufoWxb3Vn
 xC88eZyc/oWBJmyqNN4E/89eGK+WcPfiwLRkIAq7ir9zsbFx7NRRTyxwipR+w7jgmrbJMKYnfHD
 G2u4Q1u/IxAz/NnRL5Rco8l8pDdxrV4q30678oXNyZkg8cxz3EV2vO3WVAkkd/UZnltK7SX+hUf
 /9XsLfxWoUbaBqHb1jQ==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0e78b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8EseveZPm7Dyul5bA9sNTw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpjU6M01sBnjy44VZoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -nKrJq9H0KN-VOV7qE0SQ8iFCi2mbDNh
X-Proofpoint-ORIG-GUID: -nKrJq9H0KN-VOV7qE0SQ8iFCi2mbDNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280163
X-Rspamd-Queue-Id: 191C34899AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105055-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 9:44 PM, Kathiravan Thirumoorthy wrote:
>
> On 4/28/2026 2:57 PM, Linus Walleij wrote:
>> On Wed, Apr 15, 2026 at 1:29 PM Kathiravan Thirumoorthy
>> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>>
>>> The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
>>> Add the pinctrl support for the same.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> Patches applied for v7.2!
>
> Thanks Linus.
>
> To align with Krzysztof's change[1], do you prefer me to send the 
> patch for IPQ9650 on top of his change or do you plan to take care of 
> it when apply his change? Kindly do let me know.
>
> [1] 
> https://lore.kernel.org/linux-arm-msm/3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com/T/#mb046f22f0c90ed7073e17073dc04daa931e40ee4

Kindly ignore this. Krzysztof sent V2 which addresses IPQ9650 as well. 
Thanks Krzysztof...

>
>>
>> Yours,
>> Linus Walleij

