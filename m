Return-Path: <linux-arm-msm+bounces-118283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GOKcLyrtUGpW8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:01:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D473B01E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ILbE+9ac;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YI5932qk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118283-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118283-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DA08302B235
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FEF42A160;
	Fri, 10 Jul 2026 12:57:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DD4279E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688241; cv=none; b=YnmusGqgF16qVLRTVDe+iUfL3aMjOWqPbTO7sN01d1hv3vCyU2NjOqCu8Y/tDqDs8onvi06qQML8pETXyyOFDYYNDxrDcaABvJ7WBiCZZNCddt+sA46IibEsJmUyRM5lPlR+NIHHYsgRBc8cBjPVsu8cJmHtt/sBSAPyLzqxN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688241; c=relaxed/simple;
	bh=sVZ6+VcHWJOzJjrm95xGZ/P7f7RZoBbxxZ3YrSMphgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9Ktr1826AuVo+XSiPRh76qboa1D2Cjepdl/JDlM55pHL0La7ZUPktizulodUxKb+yqp7rL3tGzI1XkUqBxUyxOgUFe4P9gIY8g+INByx5weaLYRIKQbn4rLfmQXH0W/Px/KtVV5/Y9u17etraIynTYxkWOK8U1axdQ4YHHM5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILbE+9ac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI5932qk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmZgK486437
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=; b=ILbE+9ac+nbhnz5F
	MceIV5jl8IpWlNm5d2+VbNrVt7Zsr6FuC/4sa51XAsrYJZOMweAOYvL9AGBS/T1o
	rFYH5H2H2WhE446/pD3HrM0/lGa+qBfbCkroYCjdkUgK/56cpZZ7dxpR4hJtjDuf
	Dn5F/XmamezgZdXgN2SlmPoKb97bOtJzI/1jpZLs3Y9beCAxFYNc+SDk3cLm6GOq
	lmRn+VrE/jUrY5qwK6pRNBX2ttFK3/WHn2fEA5lPSmz48Trh607E719U1Q4nFCXh
	ndjtnrSQwHS0wXzy+QGLTS3vld5tG0D+wTh2Vtk2Fxw7HUDI0fiWvVrpF82BIcrf
	RAFmHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtb3cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:57:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e566bae1bso23046685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688238; x=1784293038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=;
        b=YI5932qkNgwEjH68t29g9FjER1xntUPycHJvrec8SLu1/ztEwCueK3RzeNfCEfO1Rs
         KAZ2cAOXCUxti5rhUsMI7rVGg6tUgG6s0auF29bZsSDfn27vmwNo1x3edC7GELkmu9zk
         BJlm3O/CD44MKhVr1sNRkITFC4VEAJPYr7drXHTlfGuuPNeF9mBoUIiItP6A9PGF5r7O
         EwcHUSFGx3HmR0kMh9M8u1VNFlwmRT6WKarBTu+7h+mqPE5HhQKN6Lmj679AEy01GcFW
         ysmZ3uHNeHMARq2rFaHAav9mjPyZ2QuReJQdlZm4peEzV/J2VxoFkUeSYYBtn18/vgw8
         fLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688238; x=1784293038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=;
        b=pnY/qCXhEZAfiZZzJzN6Q+j42dtLNtYN3KaiwkU1O+nJjMFjcswwwu8k77nLOgamyU
         yqXXiLYEBEAYi4VLFpTz7FJ9PGEyaZ2sCoeKCguxW9CCFVHOrEBa/2JBNlmsqWpAigLh
         H0P0q4jo5Y5MVKKMnkHgTKqItBERq1y2jTiAkaahLeOJQU6k0dBAQh4FAvaDlEUJmNud
         0TBjwYKb4/l61wGfSYUI4N9hnj/bv+Te/ttuT3uAJAAKl5QBzb1GCjZxK5CP+JVdayg9
         291kdxivc60S6gi54U21K3YWoSqzUKpI9v2VnSa882zyG19P5C4/DraKpNg9//SH30Kq
         HMCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpynfQPzYJAt81VbRBaWUtC2EYABtZatbkVjwe8M9tayKJuEa/3adC2zq4uHIX8J/s9JG+BJcckQGBP0llb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuim4J7jSGR1vMmHKj8s21ycrGf0Xx7zCihn4i42FcT023KYBH
	Gtai4avdMzjyCz9LtF9gSvtvr5PGj0+Tob37eYnTTh8Y/B0AaKcRe5i0rdS2LHGXGdR5LdVLhIk
	+ts8a6NP/j/NXsYkCb+r0MCkxcUyIkAp3fJlB6PPFJSSanMDuOcuh3cTK93ZQWqmLCeW3
X-Gm-Gg: AfdE7ckWxpUOtqCq5BVBbxJElJ/UzJtKvfI8dbF0EyzxRZRXrNcDCxFFyR31hCizgdY
	uRrcCJf4Uv5KsySVVQOLmsMgZdf2VOvSThrTnU1FCfEC/utu0g2czBl2DfTbmHEbPCkvlNPQ30U
	0QeFOFtZE/YHT0hhYvZB2KNZql4XYBQ669dkOaR83bgu58VixGuy4syK2qapsXpzrUG9/BT4D6R
	HJewmAd2adL019P0JSHKum8fDBmfQ/P+/oUwZhozOYu+iE1RzLxTYrhIR3vcsGFVD5WNSSs6FO6
	GMCvbMSX6Gryt9aJtrQ3miRcC0xe5HQVQPb6bt7dMxbbecKeo/2zvxT0KS25prPaS4Y9k9U0eT3
	P+Fk5/Auo9K5mvJV+hNi42pmNkSYMAXtUB2U=
X-Received: by 2002:a05:620a:2a10:b0:92e:6485:f640 with SMTP id af79cd13be357-92ed7967da4mr720923685a.4.1783688238123;
        Fri, 10 Jul 2026 05:57:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2a10:b0:92e:6485:f640 with SMTP id af79cd13be357-92ed7967da4mr720920585a.4.1783688237638;
        Fri, 10 Jul 2026 05:57:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84483csm635119966b.17.2026.07.10.05.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:57:16 -0700 (PDT)
Message-ID: <aef3b873-38af-49ec-81ce-ea8b0fcc5a39@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
 <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50ec2f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3HzQtC_G-ZOHREKSRjcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7jIwzlcAkk9WBRqmsRaQ3IvWlM6vPlF8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfX/q6z8kfFSm+c
 UWRTi5JFf1rPglQFoNLiAT3R2KHr7lPSPpWl2nw0A5tR7mTWC+5ElFMlOwbWt5Ib7EtUucXADJs
 mQEWvV14kNrG1F3Gbd/lOSDc7Syh42A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfXwgayVTOBmiqp
 B1R9iRdqBV5XwkdBfwnUB/oBCJ/GU+DhefohaUaPkK/UjX/T9EfLOvgy2+wPvPoKwY2jNHItn3s
 NifNy3zAsgUQLyOO32JbtpqZ++mxqlP2pSqQik9VkVFdFbJhntC2CoWGr898hYouoWBdc0iRQAQ
 srBwUk2nY+HYucLrwkSPkOEJuG/GhP/bFLgDqX15U8WaIdjMLTjRpzNUNWefCVvPGGQDA8MOoDD
 rNKqq5k2+IplJzogqyjkUT8KzATxEhTIIquxtj0ts8YeGaWAoRvXqKFj21bUrCll4tlgItoGIAe
 +xQDYNztz7C9y4CKcl+tFt4beQM7srunb3852OL8eTwJgJGOOFI1rgWu84SRtOt/QzU52Vyeujy
 I8zwIsA5QEohqNlam1PtCqnNtKSVaSh+AH2neXA7+RI8AaWuVB2yPyDi9AcNqlj9JmgLwU7xNFQ
 3chX0iMk7oq42s/xpig==
X-Proofpoint-ORIG-GUID: 7jIwzlcAkk9WBRqmsRaQ3IvWlM6vPlF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio@oss.qualcomm.com:query timed out];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 103D473B01E

On 7/10/26 2:47 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 02:10:48PM +0200, Konrad Dybcio wrote:
>> On 7/10/26 1:58 PM, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>>> Hi Konrad,
>>>>
>>>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>

[...]

>>> I just checked,
>>>
>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>
>>> However, this panel uses MIPI DCS based backlight control with no
>>>
>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>
>>> we control it via the panel's pinctrl default state..
>>>
>>> So this is platform specific pin , we need this to enable/disable
>>>
>>> the backlight.
>>
>> Why would the backlight state be so tightly defined by the panel?
>> Disabling or adjusting the backlight level without shutting down
>> the panel is a perfectly valid use case.
>>
>> Take a look at pwm-backlight or gpio-backlight.
> 
> This one is different. The backlight is controlled over the DSI link. In
> this case there is no separate driver for the backlight, the panel
> driver handles it (it needs to be like this for multiple reasons).

Ah, OK I misread the statement above as 'this panel [doesn't use]
MIPI DCS based backlight'

Konrad

