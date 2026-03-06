Return-Path: <linux-arm-msm+bounces-95782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKSsMpyzqmkhVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:59:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E5421F63A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37B4830F410D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE41381B1D;
	Fri,  6 Mar 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3RwZmmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMZY7vOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7E35839C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772794479; cv=none; b=hVY23QKnP9Zw+bBHQAXg3b6+9gqBoym+hv2XXDMxXytn/fBjBuCia5a9l+g2Fbo+qhwGXf61+ZLR4jMxUbFO8e9qp4Sv+97yxX/jNWhNB2UHYvk9PoiA+9odfAtUHJL+31Cy7IDyLvg8RF4Lq6lgvppfCx8xi/exZCahTAoom9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772794479; c=relaxed/simple;
	bh=D1oR+MW5ly/+rf/6gV2gNte3878vf4od9GUDyycgZzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuapxGXZozzHXFMxNYzJDifivcm6zCgwK2yyFOWpdfZ6Y7MGLb8FRMkY2vDzYTQylylbSj5V69y6CibYk+c2XrZDud+9xszU67TWKrqWT+5jkVA71uqtWSyudUNy2K+CLmyCtaG+GpacMU7QFQM06sjEsnVJGbPxQQMDT6wJDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3RwZmmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMZY7vOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Ajk6H3220298
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 10:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=; b=K3RwZmmuwKD2EH+w
	w06GAo0gLxqbYKrImFFjYXgSLqj7erT0vJm1CPs/uFcWTbC6tNjGcjOspfaWYuf3
	QXLEX7MoIoVpGpijVYEuNS6Di1x04EClQEi4adhE0zl/dN1mDKSFskSh0SWpGz+9
	wsR/hbFDH+KFvDzMonLF03tYL7ePaRHluSeUPB/6YuJlZ6ltzxgzAfqG/WDfeRM5
	s/NmhQluqwGp5jEuC57IlOGHJ4HhreaDVcgjPAk+sUpEgFJwFPf0KTtqeKRuna6y
	dJKXuLRo3mO+et0zaZ6mvdUGK9/MgVY50P96cpd4qMJAOY0ZXHuJM5/HaODKe6JJ
	BXh7Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25tvhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:54:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb403842b6so5764832585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772794476; x=1773399276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=;
        b=gMZY7vOC2zlNmgY3ZGVcpyEYOSEeahz86EL8LoKFuv5GX8DshpWI7A1+Y6UMhlFTKg
         e8M7O/FlqoArCyL22/BIQyjAVZKQ7OZ8bEiRgWkUmZX71Ryz32JmzXry0yJWkEwrVh92
         4WCch/GorsGOlGvtSia3aNMxU0vJzfKM6Au/RWs6mP5VN5WNbY7ROYZR6I8i8p6Fy3hW
         t8uWF0gqWnU5gb7W24W2e2yWdFjLii1riaYsJlCGMhC7SP/Lfw0gz3rdIetx1XU3srlG
         t13NntSjjOJjC0yTUpv6QwgLxKZ0iZZbszDG0y2FH0V1tTOB8z7BZtUYBV9/7T8vvh0A
         Ry9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772794476; x=1773399276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=;
        b=rJem2MQFgO/udK2Hr7RTsObxm2UH4SI8SJ1xtIH4lPjfh+nnxKbn8B/QGMANJsR7S+
         JrMsU4XuGn0Fy2Ylzr5TMFUf0RqgflOYv4sG4wJFOBI3qX+UzulOF/NTS7KvtCTD6DKq
         KBtgEs766paUt+SbAVdO4B+W+4BCjc41nkklCYBARPxLFA0v6qchSJMwW647Ps9XRltI
         WBxPe2IkDAyXLzTf/1S9b27tWwc9SliDueINsgJoDaUkcR+VSd0QcJIBZJC3rsl6eH2u
         DkP1CR8OWtbky8L/fCi4cfvUKEUoZjNwv1Pf2rf0Re0RvsbHOSfRdx0xm60sPdKNVvvK
         xW4A==
X-Forwarded-Encrypted: i=1; AJvYcCXtnft/ED+hZKrYnqC+zQS1B6Or7VQamRQjAs/eKpFECmjjKqW5umnixv1sDrU2no+3cWlaFJJ5hkbR1RIX@vger.kernel.org
X-Gm-Message-State: AOJu0YycsaJYl5gouiOXFchnB7mglJbicIWx0OHdVOoU6eTCfpcmv82H
	6ggHOl424GwUBqyIQGItOHw1QH5rOU299Kkq0lk69JDz4jyW3ScaQyYKYd/Ogb0e9njHz0IPvr0
	eqzKTHswl4DPdH7qmFVp2LrYaMmKGqPX7X+fMNWXh1UkOjnpSN40al1oxY53j0GC0y+IV
X-Gm-Gg: ATEYQzw9idVC+F7gUb+X0kFre/PTXYMcDbpBREeSDuAXvLDJ4ASMPv6EG2rv4SAY3FP
	IxKTygoW4gfh4hYbvhLX48pHi0aE2iod88IG+5ge4zAjqtZG71cj4MRwwKMPHfqHglM03AGAZil
	A6sixXrsYqC4fV/qxbdtXOj4N3x0+5otsVn5VMhLwVY/G6s/RVwSdWRcSZqlmlbOybS02GLIQ7d
	XF4e7KtnkuCiSye3nelvyngwVT4XftowEkNYavnvhz9/SkmOh4zLhwaF9RaRkXtMOQt4nXVut0/
	TemGtPRt6B8lHHtiXcLmfSdtDu5d/1Bi+A/a7CmEiU7AnmWqzNnDtLsDTRaqZZRrhCV48baR/Yk
	6ZEuQb1aNMluTlu1h9WlYfO5q+b57EhOUoKLh+R85NwaMUqLN
X-Received: by 2002:a05:620a:29c5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cd6d505f23mr197924385a.80.1772794476444;
        Fri, 06 Mar 2026 02:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cd6d505f23mr197923185a.80.1772794476004;
        Fri, 06 Mar 2026 02:54:36 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm3137054f8f.15.2026.03.06.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:54:34 -0800 (PST)
Message-ID: <23434dcf-5f45-4d16-95fb-a13021331de6@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:54:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
To: Richard Acayan <mailingradian@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
 <aamJwMvex4aF6eah@rdacayan>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aamJwMvex4aF6eah@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZDmW8QKLTg66-pCvL-f3vLrnNtX58s2n
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aab26d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ta5eXiB5pPAQ62dtjbQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwMiBTYWx0ZWRfX51HgU0nhULM2
 xoZLdeVR3pydiHTNH/P71TG1VqkDUYs3bXvij7vwALOUG7U7ex/YNCVzXeXwgPfnE2EdcEXRKyr
 6GKZPX5Rw0vgo3xLk0iLxaOYl1tVXBNCVvsecXlSMeUsx2t+lSLY5fFifbGtBYlYolX3U8CD9J8
 lerWTDGMCLmXnuk4KnNeAVATz0LpKgsF6mXa1heY8vBU1kd9XhnSJMtAnRLYjvomhWtMeqsJcbO
 Zo895YYezZatu+CAmXSyWNrBtJO2eDHSgMYBq9fPXarOn3xB0q/5Gn7SI0xS/yzJz/qSDG3ONOO
 nTRUWWOhUEHrlITQsixxiE9GBRQRp/hCUFx0pvp2EPftBdzE42udlqItmSBrN+CiFO2hjMpYKxW
 dWVb59o/t/ZhqyJdsrRa3pGP0Lqe46OKzDiOO5VYZ63+hxQ7WXKzTcvHF5F8ZXCICQquzN6Znpm
 j0vI0gAKj1EknhhQlWQ==
X-Proofpoint-GUID: ZDmW8QKLTg66-pCvL-f3vLrnNtX58s2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060102
X-Rspamd-Queue-Id: 48E5421F63A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95782-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 1:48 PM, Richard Acayan wrote:
> On Wed, Mar 04, 2026 at 01:06:58PM +0000, Srinivas Kandagatla wrote:
>> This patchset contains few fixes for the bugs hit during testing with
>> Monza EVK platform
>> - around array out of bounds access on dai ids which keep extending but
>>   the drivers seems to have hardcoded some numbers, fix this and clean
>> the mess up
>> - fix few issues discovered while trying to shut down dsp.
>> - flooding rpmsg with write requests due to not resetting queue pointer,
>>   fix this resetting the pointer in trigger stop.
>> - possible multiple graph opens which can result in open failures.
>>
>> Apart from this few new enhancements to the dsp side
>> - add new LPI MI2S and senary dai entries
> 
> Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
I think the older SOCs did not have this I guess,

> 
> It sounds different from INT_MI2S so I can rebase my patches to depend
> on this series.
That would be wonderful
Sending out v4 soon!

--srini


