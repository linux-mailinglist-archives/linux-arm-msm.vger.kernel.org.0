Return-Path: <linux-arm-msm+bounces-105676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNxrHSpr+GmauQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:47:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F584BB2F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 11:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3EAC301D68D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEF5388370;
	Mon,  4 May 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8UW38ic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEVuUstS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58F3876BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887981; cv=none; b=GJGhXvIsVHd2OV45R5sm7gAfeZRe3li/XOF/X1NFK0kjtKFLtmHT4ToqV1t+GyekpYjytoUKPht1NsmZ/gYMtuRUn3s2weWJND4YKbfaQC8qRfdXk99WTbyepJbyU9vWJ5AhX7dJPhJNEFJvT2xaYA3MiFkJA9DSZLrYH8kmfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887981; c=relaxed/simple;
	bh=dqG192eOtmJ3VdZAPCkzoXgMKCHIO6X1qUD2bWnKf2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BF+KHQF777Uog41yQd+lSzCUmDIoG6F/A3ZPTvC0Xvb+b6aQJ1M7FY91EIwj4PhEk8mgX3KPFso3SyoLQUHKnw7Jsj/f49aPbcCuKd1ojHyFWpQ7Qws+CmQjl94wq3X/icW84Bn+WlVFhY3yaWejdoUCLXMR+GMltHC9HzjScpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8UW38ic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEVuUstS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fRFq3846987
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 09:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PXry2ouqo76kLotm75vsgQO2BUre/6UYqITnBpw2Vw=; b=U8UW38icJyfD3mub
	oPhRpfR+Y3s87vAKb/3+FU7KlH/Tcv/nYN5Xk9dZE7MnsPRPUcWIREXummTKKUUM
	PKtt8WDQ4T583ypmWcLfvg/e+V8LoczbSDwRf+AWqr8y0VQH2dVJNhwMrJlPgQiO
	NkQ7/IsWIIp19Vtob0BFhIzEfRhV52Rb/+OWfGn8e9KxriYRalkeqI1LvkaUMbA4
	4FxPELtYrbv4arcJ5iK0YmOIDcLwga/lFWYpZvApNitQz/fCIepdcIhHwqagRT5v
	Z5sTzdG9I+Ki6LY5zmHw2NgiPTCRTJeCvbgm+ukNMVBDOcOhjYqpVKk9kaTmJqkR
	K7kPXg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfdg4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:46:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cd546d390so190726241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 02:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777887978; x=1778492778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PXry2ouqo76kLotm75vsgQO2BUre/6UYqITnBpw2Vw=;
        b=UEVuUstSZohCFeZ1hEqsgF9sPepsq0V9R6lj3YcGYW1AvwUbLB38BvgsiCtBYgF38g
         STK/V1+0TClpMvVoGgUjhhwtCQKK4G4slUEY4CZin9ohK1lFUUKs+SAWq8SzfJBTI3kV
         f2zhnRr5g/BE7zZwU8I1tyTUwV9bMBiE9zKXeBns2kGW7QNlnjiw+xbNhRSkO5coYjjI
         2fcaD0zHWoZ0ycZxW2FW7XCUVBVFmoHR64jOKeP3jAVxD/B5WHGj4ZIadp0CaF37Ye7k
         uU3vmSbD1usj9JubydNjmV3ze5p/HtAanYk4TBBJjxaoTiUY/Q1h2sLSeQQdjDpggki0
         pMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887978; x=1778492778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PXry2ouqo76kLotm75vsgQO2BUre/6UYqITnBpw2Vw=;
        b=Q4xDBjvcS1M8rDtmbO5IrMn6IlUaqarExM7kB7Xn8BPB057SM177j+yuoPgYUGbLe0
         XmgjRe3hFZDQ0Z3+E08mfLyt9mi7oe3b5OICJmhvnx6yeTYWwP8qD4Nb9gogj+mQf3Cw
         fIL6wonsTjs9XjWXnrtDC7WI5UmyJ6Kftmt8sm4+ZS3JcSOVDIyE9CtyQycriZAAAaCO
         3cnxkhzvmNOLt5nkhyJ14B//HRQwoY6DRpzbWoRBuKmSxCd8F5MnCIVhJxLb5vI5tSdf
         PdWTWZzaSeITt1f4rLlOJ1E6AAfntT55J0RfOtwlTgSrk/bthdmbnkJg0DYLHsArvPKs
         1yMw==
X-Forwarded-Encrypted: i=1; AFNElJ/4abznznP5S7rw1XjB520976TjciwQvyrC6KgYO92CDxEwPqFvXLJ/O+PUeDeYKiNmG4OsE7+uYJCl/dCg@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJfQxD3tFJkyVAG3EJhwDBJV5h5+Dv3Gg5rVtUyuu/MwZTh9J
	hs+p087T7+0YJzw1ttHx1+118IGuXcxJHHH7rzHB533ah/dFvUGFFj3ZZwzNi8DuWDfoYgGXeWf
	hxKxwsEQUvfAg4JJm/BbT+doQNZ7G7KAM0OopT/WlgF9SdNCDQU7CA6NKjNUB/usYoyov
X-Gm-Gg: AeBDieup3kRZ74nrx2ni9o3hEmg4J2XC5YLkQrUri9gQWaMiaF8IjQX/G1XVu1YRJ5I
	1am9NW9pO+l+xaz+W4st4x+MlQCTXgH3rUkueZXLjZ9KlWKBj6cr3lG3VcVJ/vFBh/l6xh30RWw
	JpVSa5YaVFdNWgLwEqAWjZEIBpMMdZnLJzeaSdLlvP+pPMSyLzeFa6/ROs+q/qJA3mtpzNjGd4S
	9VbdsbL7RFeOqt3sIG20aFEYj4jpKE29Ck3atHcYEhS/aH0gbnE5e4Kfl7vnIl+LT055VawAfpD
	Gncpjep2ykGMeDZXqnA+gi+WeXcXpFRTvvyEhp4nbmXCwE1h7QMT40CuWT6O9h21CUZMG3Q5VvJ
	mZIyxK+CQQW26n2eGuaRRQQlqoGMxFTfzjJT33WLJMmIjagRRhl5kpq1LMlLLkjh8HxvTMEsmnw
	KnI02QiobyQ7/g/A==
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr143618e0c.3.1777887978216;
        Mon, 04 May 2026 02:46:18 -0700 (PDT)
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr143609e0c.3.1777887977704;
        Mon, 04 May 2026 02:46:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc11f2277f8sm174376566b.60.2026.05.04.02.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:46:16 -0700 (PDT)
Message-ID: <32502aff-4050-4685-a3f1-0464706a9c3f@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:46:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
 <c6c7c9a5-3051-4add-86a5-722fed426a78@oss.qualcomm.com>
 <fc027ab4-695b-4622-b30e-8a79ce6e1781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc027ab4-695b-4622-b30e-8a79ce6e1781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MREUyS2WFl9QeuzKI-mVwTaizXjudoLT
X-Proofpoint-GUID: MREUyS2WFl9QeuzKI-mVwTaizXjudoLT
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f86aeb cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hk6LQANNWBRQD0vcZogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNCBTYWx0ZWRfX27MAIVd7T7+U
 pVtI/98hhk4+6Mpndq5ekrO8O09k5Fp0aS6S7Jg+2czW8q3GY4/Qqlm48l1aE5WAOs7bqj1k0Ma
 Yngsjp8E41typh4NWxzDKkmoFvXLG02S6MQABsU9Q6m0pE9pwRBludqjL3u7JvTvdJ6vVX4kpXg
 PzrHCfXa9Kctdt5Zcbjj/fu3yv5bSD4zaVNqchv0PIlkdeNoMhy2Af2ChwnT7BIfjK71U4n5NyQ
 eW0YyE7U57FGVExkt/8N6XX0xvJQH3VMQb0H2azSOdpRz/HOn1m8oG/QBD/Gpql2lUY0cpTYd4P
 vJqf0edpo/pnPH/WwyMaBzoDdCr0aM1VEteCuyww7w6z0hjvVUaYYWtDd2T2gRJG7eOvcibS403
 rd61vk6ZSzZpsIroJydTaB8m80xFEhCg8HDPxjAQZLxmspLXAzsghUAlKIpyr6jGggltCyyIvj4
 u68rguO8UKS9qH5kS2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040104
X-Rspamd-Queue-Id: 10F584BB2F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105676-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 11:42 AM, Priyansh Jain wrote:
> 
> On 30-04-2026 09:30 pm, Konrad Dybcio wrote:
>> On 4/30/26 7:44 AM, Priyansh Jain wrote:
>>> The existing TSENS temperature read logic polls the valid bit and then
>>> reads the temperature register. When temperature reads are triggered
>>> at very short intervals, this can race with hardware updates and allow
>>> the temperature field to be read while it is still being updated.
>>>
>>> In this case, the valid bit may already be asserted even though the
>>> temperature value is transitioning, resulting in an incorrect reading.
>>>
>>> Hardware programming guidelines require the temperature value and the
>>> valid bit to be sampled atomically in the same read transaction. A
>>> reading is considered valid only if the valid bit is observed set in
>>> that same sample.
>>>
>>> The guidelines further specify that software should attempt the
>>> temperature read up to three times to account for transient update
>>> windows. If none of the attempts observe a valid sample, a stable
>>> fallback value must be returned: if the first and second samples match,
>>> the second value is returned; otherwise, if the second and third
>>> samples match, the third value is returned.
>>>
>>> Update the TSENS sensor read logic to implement atomic sampling along
>>> with the recommended retry-and-compare fallback behavior. This removes
>>> the race window and ensures deterministic temperature values in
>>> accordance with hardware requirements.
>>>
>>> Signed-off-by: Priyansh Jain<priyansh.jain@oss.qualcomm.com>
>>> ---


>>> +    ret = regmap_field_read(priv->rf[field], &status);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* VER_0 doesn't have VALID bit */
>>> +    if (tsens_version(priv) == VER_0) {
>>> +        *temp = status;
>>> +        return ret;
>> Ret will always be a '0' here (and in below cases)
> Yes correct it will be '0' , so you are suggesting to return 0 instead of ret ?

Yes, this makes things more obvious

Konrad

