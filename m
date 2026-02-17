Return-Path: <linux-arm-msm+bounces-93196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pfEMI8GAlGniFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:52:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B614D4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DAA4301117A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEB536B063;
	Tue, 17 Feb 2026 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+imDapy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XC9+TYaU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB6735502F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339967; cv=none; b=s+vROLPelYPQpswiq7jplqMshTYKyN1gDY/ECaHReuO3vW2eGHLx3ftktJDeFI8gUWX6xwgNL4V3h2Kr/eMjTied1oeptyTRsjQDy+P1aZJ275PZTfvgrgzj0wbn2Nudz43Y0V1h4EkMsPKPihEkuI5ch5ot03BSLH/o5CO1oFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339967; c=relaxed/simple;
	bh=tSi6AYP7aIoWJuc+4jw2ZnJeMjdSkF4hg2Vx44o+MaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ku4YoWo31+QA/0LVzXjT23SdoY8IJyWllMFhYRT5miK8Pt0vvMSiqXPmo6MpulDenbpTDnqVBjCWJUeaNpZffYrk+7lBu4cUtF2aLe4xqvM70WCgQfi6Nvzt9+TePlCs9kR/8jHZPBnPAYrHVkIiu2uWCFly6IRmU7RlL4SLaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+imDapy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XC9+TYaU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAWOMr597252
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSi6AYP7aIoWJuc+4jw2ZnJeMjdSkF4hg2Vx44o+MaI=; b=o+imDapyS5YvwofV
	A29CmlaulmYWf4kTpe3++LG9Bh1wh36c9sn39c3Z2nhwcVjgSkBfTILFNMT+ogtA
	+iQeJ3gYtrKK/HOwzECQdgMrCTA1nZZrFtbKKP9zv2NtAk4Q2Y6IuSyK79cyxb6b
	PYsoDSULWRkkn9llaxaDpxEEUah5lIMhjM0EiBkGBnukIR5qFdWDCGSpKJmGBV7X
	AT+rkmJ0LBisgcSomVaiI/bG1P4QnxgJRIEc9wCK/YYe1hbuIY9o+cACuZIMVOGd
	8X0w32LnZyRjMY2tzqjPls+89LAGpGMIemzGDzqsD/KmSfo3rhTgFjm2EdYi4OIM
	/igQmg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca3627m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:52:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3565fecff5cso1577722a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771339965; x=1771944765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSi6AYP7aIoWJuc+4jw2ZnJeMjdSkF4hg2Vx44o+MaI=;
        b=XC9+TYaUVdhcCAbluJFZW8kJfzj5XnQVzv7L0K/yBUw2tgog0HgJ3UfsNEW6gTSuZw
         2g2TWiouZjHlhA7KXhNQjo7tde7oEYbBSs0Top316MvvrqM5xKKk+O/Rz0Cb98PCbyyr
         xM9DoDq3m51bbNeUZw45eLbYjW76bcr48Qe0HeaYqMiS8M00xcEV+ywp13ZpnjxHwc/q
         I2eFlxSJUOpZl9c7ex1QCN+QL+O6OCOMcAqyrGd4lFX4nWH0cgitnzlxSR3v0JSDE/rz
         gJsLabEgoYHgSSwymVnJShbidFaItWcjHnldVu+3NrGOeikAyF3mk5w9LV3in0WLRxJn
         wLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339965; x=1771944765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSi6AYP7aIoWJuc+4jw2ZnJeMjdSkF4hg2Vx44o+MaI=;
        b=pqk85+UGDZ59wcZIR/Y//azaQx6GlJ6679W1l+rTg72dq5AlIZH3Ti2AD0/eMTEZ8a
         d7RYOP58VzcvDL7yeA1OjLrVnAJcvshKn0MErZ0vPbDaBB5Vw5cAJUY4M8um4ByZx4tS
         C2CDgscNsozl6FLGcqW9fnbju/NHoZIihIvHZjN/hYulyvcGJEiuYPQJMvXNisyE88dZ
         SZY9dTm+D1+d0nI3XvfAwSIA5RLjrc3x9bP5b2UPsMs5EsKiSBGnR+6ZPc/QdCBDqdvJ
         JJn6/6aKZtI834fZRpIofPcKXOW+5kvZNdDwCMZdrUdskuv1vaSzdOccV3CqBr+9Xv5p
         2xHg==
X-Gm-Message-State: AOJu0YwseYN+yqMq9dj/eZP2yDh/vzFzC3JyMW+tcWPqK340UCM1FYmQ
	wFA++tv+wUF8prc3+4kg6yLKyFquVNP5UokD2ISe5rNDu7NPRKtPBMA8jArKDx1ZrDW1CcrIk0p
	wX3dG4PWurlgoRqNav7zTlqipuN7pYDMrupbI+TcBf4VzaIBEBPTzp1ukgKeOzjMR9ux/
X-Gm-Gg: AZuq6aKxzfwOl6wWfjXaZJmY44Rw67O/FP6Mrh5YH6FsxQS3tWRHy+gxHj9Xm//bwgS
	aDxzcNho5vWNXqvj5EHEVtw4gnHaZI8T+JpsR6HIJp2dRqKeKYHGHikOWoGkltcxSw0LB9UkdmC
	O7K9mE+v2a8rsl2kh+HVivzSq6zU6zLdtJwS2LpYhmgmLouUDqMtu3CrAk3mxV8fBc/Wz/YhNYi
	4t06Fp9ZDIvxrbA09jwXDPa3tetroqHq9ddcYaVOH2OvvFJM4So0QX/VbSUTolVbLKDgA0FWjaO
	K5Mfm6wEhL0ZoS+BTLUC2Pwvwn3xzZ2NL+uQvNf0wtwU9sFSH7A5pYp9BZ9EoT0rd2VhAol3GMx
	7S1XXLSaXgrGrz2H6FuWZKt5Gtk3s0rxIZH20Db5iZDKjfWtlKw==
X-Received: by 2002:a17:90b:47:b0:356:216c:ed64 with SMTP id 98e67ed59e1d1-356a7a8adf3mr10007308a91.6.1771339964568;
        Tue, 17 Feb 2026 06:52:44 -0800 (PST)
X-Received: by 2002:a17:90b:47:b0:356:216c:ed64 with SMTP id 98e67ed59e1d1-356a7a8adf3mr10007277a91.6.1771339964137;
        Tue, 17 Feb 2026 06:52:44 -0800 (PST)
Received: from [192.168.0.8] ([49.204.24.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567ebc4331sm19339003a91.16.2026.02.17.06.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 06:52:43 -0800 (PST)
Message-ID: <1da7babe-01c9-491f-a0a1-bd3df13c3630@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 20:22:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
 <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
 <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
 <eec690df-5ab6-42b4-a9f1-ea8588f21713@oss.qualcomm.com>
 <88ba2bd9-e7d2-4a7e-b48d-1eb4d3d40aee@oss.qualcomm.com>
 <65ba157c-8a7f-44a9-9bcf-abb8af6535a5@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <65ba157c-8a7f-44a9-9bcf-abb8af6535a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEyMCBTYWx0ZWRfX/byKmvoZ+hYc
 BJiUBqtB6Nt8LxXpVgJD0SaAv0I0MOjZ8BJy1xiFjXmFBFbd/NIJZU9ZxUqIIEPxn1WfWGeNO02
 tsfbwbO5YNHlGpwO9jGlKLA77h6oRz7sclhvPQAAKnpXdXvscetfh6XUCNlx/jky+OqII3MJfbh
 D9HAoPeNK9MVwRzSfzgvvdFSXEd8CZCHPQ1lLgPbQSefzGBeosqFrCuOzJutZmHQV5t9Lap4Ztu
 v3WG6SxhJdpVqy62jOWlrFgtkMtDEbSijl8AU505MxDXAvwDzZIm0KVjY0R01Hptrn0/zyp3Y3I
 Zu5UTpHMM3bEFpYP3fzcXx0vpOemLAj6BXDKeYya6VrFSUP+UIK409Z1g8Lzyv1nbpr4GgA4ZUU
 hoAErYj2HdTmJWwFaukbnEhvqpYuljH/V2O7bd98WEKQv0xP08ytTo8qpLFNEFvVHEt4hEC/zNg
 XPy5wxAEPZO3i0goZjA==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=699480bd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=GH/ppe9Zt0ppH6VRuhbLmg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=BkfrM7CP6CQBk_4cqzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: X5GNWZVFAaI8fbbaYKtFa_QZKTEqOsmq
X-Proofpoint-ORIG-GUID: X5GNWZVFAaI8fbbaYKtFa_QZKTEqOsmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 250B614D4F7
X-Rspamd-Action: no action


On 2/17/2026 3:10 PM, Konrad Dybcio wrote:
> On 2/17/26 7:43 AM, Umang Chheda wrote:
>> On 2/16/2026 4:44 PM, Konrad Dybcio wrote:
>>> On 2/16/26 9:04 AM, Umang Chheda wrote:
>>>> On 2/12/2026 9:59 PM, Konrad Dybcio wrote:
>>>>> On 2/12/26 4:50 PM, Umang Chheda wrote:
>>>>>> Hi Konrad,
>>>>>>
>>>>>> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>>>>>>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>>>>>>> The Mezzanine is an hardware expansion add-on board designed
>>>>>>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>>>>>>> is there a better name for it?
>>>>>> Does, Interface Plus (IFP) Mezz sounds good ?
>>>>> I don't know, does it stay Interface Plus on the silkscreen or similar?
>>>> I checked the board - there is nothing written on the silkscreen. Internally we call this board Interface Plus (IFP) mezz.
>>> Let's keep using that name then please
>>
>> Ack, Should I also rename the DTSO filename to "monaco-evk-ifp-mezz.dtso" ? 
> Please do!

Ack

>
> Konrad

Thanks,

Umang


