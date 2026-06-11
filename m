Return-Path: <linux-arm-msm+bounces-112780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rUkmBWniKmpCywMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:29:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E10673886
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:29:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RNEoKpZp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HoKNa+xk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15B783032682
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F774968E9;
	Thu, 11 Jun 2026 16:22:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779234963AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:22:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194934; cv=none; b=A+hx6Ynm8YDNH17NA3ttTuchWsVLwOscSWX/obMh6qyJ048Ko3RwLdTB7XTN+7kmAHvsspFQAEXjT2NPhZNDJrNqt9PlRdwLusyJ0wNnmc03kLNg7ICX4zLWqoyROAvjhrCxHgfqoVT1gRYHSFY6cGCd6viTS6H6t72Jok9+Sxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194934; c=relaxed/simple;
	bh=MzZh791wBBcduzU8eKa8zBcQoGZIdqkJ3us7JknTT94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBypVt/e2P1qWwmHvXJd/GZjmMMsJwQOGex2lN/IQLKgyT+kNUFLuK0SBkN88IAYOWpUqJWK/vRPOYty7qTILws+/rMKlR5YYrtXJiqzDpC+aUjCGJfJSsONMGnHRqs8oJHtz00qwcGaIG0tyBuFBU/0JkgJuRPuyUfO33gxSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNEoKpZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoKNa+xk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEs25a975698
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=; b=RNEoKpZpXXlhW19u
	rkq2Yg+M6qExhzikZiCg8s/DzeWVooppQDlIjVVrvvAJmismaREsXBMA3P78+34x
	N9OCj4dDl7wCDhtEyXkecvSMlECLaAxH+lF76hZkkoy4ZypghqJ6irCatdaCnWJO
	eBQwfW8Lv1f4a7xPiiHP7eeacHVVc7BVMfA8vCvvdoEdWNOKZrDGTv6zWWdpLyyD
	9XvxXNIpmfJc5z1iCKaprNgfQ07MqaBwmdS68Z+7ETNP5nJV4CrXh/gZetvSVBs2
	C96DKy3inAJ8+PUCOyCqmOXeWDas3Czz0SR1CBBqFcaqPL0h/QP4kybalCBu2w7a
	1gDu3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6smesu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:22:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so115955ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781194930; x=1781799730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=;
        b=HoKNa+xkEK3CNEx2tPvy36GJkaky0jPrFTM19FF6Onzq0IwBQ1u9Rw/ako7EnMIz3z
         HI4cjO+e9QmxP7wZ8h9HaUz9bgViOzUdWDzBKxtehrunR9G5EYe2rx7VM66utEYhwiKc
         eWwiet8wzLmyLqnB2xD+aqrGMcES9htbYzxHdasjx9uYCJgvkdXUUhDv0cYdjgH/+acN
         KROQnrqS4Gy4lUEvuevk2qYiLPDaFeITpSMgQDXi2+9yrtXsaWjGAfaJbmv+lYgM2FqG
         aaKESxg57AWbiFmEnNHBHkW/RG/TYruKCJjy0c1mOETur0J17eQnrM35l88SxmXefw4e
         M3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194930; x=1781799730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=;
        b=HzxH0ZdKnMDDbUxOmYsJ2nBTkgp1f7yPXPKXeVHJmh5nVnNzjne4Y9bX/aWU6sz/RZ
         UcxrwuJyjXrC7qs9BBQgH/6mZPl/Q0rxoN4tlrJu7YP3LYM+n21egPTTfapN4vWOu3Mo
         JhmekuezjLy4LwzOkuGXmd4nnUvFjJfNuPy3/ppu84GJijLFiU7pBFAipoYAsCXlxG7Y
         5wOLP8Ng/Kx+XYlTNjcjYiNuc93/ZAde9AEhaBvEA/JNuOR+MgVIIGSSUla9vetZtkXd
         sLrjH/EYLodanNmVbTO6w8eWm55IoMkhs2EEC/x4719Vqncg4i4yNq4SyEM68cpOXgQd
         4zPg==
X-Forwarded-Encrypted: i=1; AFNElJ+S4tfudvYoIdQ4kAHO+eQvevCzXe0VlC1idddQGMKSP1EWZusxUEcRw/UN1dTKmFVrWMFAL1BAVcKwL7Tn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqw8WV1iaAcoWoZLzVQlIfj5K7Y5r9dkIRRZK5l90MUOhBZq0C
	YP9wdvHRw+kKDu7SBF52zEZROCsCxegN+KOstP0hgaZlBbNkMVLpIRtX/bZ1QOj4BTW2xvTDTQV
	jnW2zWzpu10OYRfWoxcuGsBDXFzjZbdlg5Etp2ix2sE+VdS8cMdPsQI/wszWLO820PTq/
X-Gm-Gg: Acq92OGxzhZ5oUgMwCpD1supT6CYf0+gnc350yEWT1G3k5/JddmI7+9Q0N/RtbaQ7ol
	NGRuXGSB/21RTcoNLn1TfsXAgIN4IfQSeobgEojD9wrHuU5WIimyDalbLU226Tzq5tYgcga/fl9
	BhHV44yVn+jj/JMBXp/U2luauNhFaOyrPQT3flX9hWPXlO1LInOC170cF15rMQt9YXrBmZhjOC6
	HRSdJs0O1kJkXSLdMKh8AHsDD/mKrmc+TeFYnEMvGuccrpjXnrWA8sTpKkkbyvfCzukR8fJ7Adh
	hDlfui7D8vf2OLdSTFIEEJzfC4EaaBR4hsW1UsmDeILl7+Vujj5F021Eg2+1JYa30Y2zcFtjPDa
	z6V6QmbIyLBJJAL9fGiAA2UbUAiuI4yPAQVZ7qY/cY0vs2ffbwuHQxflimepVvLQ=
X-Received: by 2002:a17:903:1984:b0:2c1:5135:39f3 with SMTP id d9443c01a7336-2c2f0639a6dmr44760235ad.11.1781194930438;
        Thu, 11 Jun 2026 09:22:10 -0700 (PDT)
X-Received: by 2002:a17:903:1984:b0:2c1:5135:39f3 with SMTP id d9443c01a7336-2c2f0639a6dmr44759545ad.11.1781194929759;
        Thu, 11 Jun 2026 09:22:09 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm296310835ad.36.2026.06.11.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:22:09 -0700 (PDT)
Message-ID: <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:52:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <aiqYtowP2DQt7Jw0@vaman>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <aiqYtowP2DQt7Jw0@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GhSHdkOjl7A_KfGcOzXtZCejO5pzSGfA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfXzzCWEhg7MMiS
 Hmbvz14enadmuJijpy9D5B4GgnFD5aTfLVvOr5gER/gGRTa8DA+1x9CbpgL86OjrotQiAVJlYJL
 Ywkzy3vfticS6fmjhnmzdL/2Qov1ZpM=
X-Proofpoint-ORIG-GUID: GhSHdkOjl7A_KfGcOzXtZCejO5pzSGfA
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2ae0b3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=MO7iE5JbH1gLMWvasfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX0dCk0gXbM70g
 9deeLjSxSGu26GwPM2G5elEXDBU/7M8FKCetLlblBBqy/xQ9qTNSV9+VRAqYK/malGkBncC6OrL
 +Wx+uQs5NF70PfRrVyP5Lsj82K4wTUTr58y42PNi10n0EulfCVwSdN73Qfg6r9ynhup96G6r6Rh
 B0aUHyyx2w5QsePE+hliguBZKDIXEBXfIQmxqc0zx2Ekio2hu2CDM6lUH5+jsu8Q5PzsVdUo/I9
 BVUUcZO0PwXqzRGcC8fAJhJyCl5LsiRDJGBUE/wrckSneAXtxtZRe64TaNhqJg0/eWumm7GiCtN
 unMreV9l6TUZP7MDI+IikpIxFsmJRONa+GFaxPvEwlLHJZMhieM8D+EMasozgvaMw57HzEZorOj
 D+x3e/2Id7n4E4Q2j9/2H7puTOVnzKZGvuzT9v+5FCnLD26hzjjP2LT/nOV0FSOweDZSYy+jUbu
 v6PFVx3zZkucy8PIj1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112780-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2E10673886


On 6/11/2026 4:45 PM, Vinod Koul wrote:
> On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
>> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
>> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
>> refgen supply is needed to bringup the PHYs. Both single and dual lane
>> shares the same HW init sequence. So reuse the tables.
>>
>> Document the compatible along with refgen supply and add the phy driver
>> support for it.
> Please rebase this on phy-next tomorrow. It does not apply for me due to
> changes applied ealier today

There is a discussion open about the supplies[1]. Once that is 
clarified, let me re spin. So we can take up this series for v7.3 once 
that discussion is closed.

[1] 
https://lore.kernel.org/linux-arm-msm/aiqYtowP2DQt7Jw0@vaman/T/#m37a571fac0c77fd00f6379ad9a2414b60431820b

>

