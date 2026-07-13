Return-Path: <linux-arm-msm+bounces-118675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L60BDqShVGoKogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C021748ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o22EbOPM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WMNRTSJM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118675-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118675-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B684D3009815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896FC3A6F10;
	Mon, 13 Jul 2026 08:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07743A6B6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:14:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930492; cv=none; b=kYwYWcBZnO+Yd8FfuYMh8XVNrUxWwQ0ctEpev9YIKLO11jkMqv6IqHcVHetmY+aF7xXSKu/lSaSmyHj93w0Em3RrJ3JIkCYSr/gLmlnBn51p6y/kWGtu2S2g8D+xtmFdwMX8o0AJIKd6OSTIneuQk1O2TDqBNssdY5Fn0D/jIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930492; c=relaxed/simple;
	bh=I7iM8du2AcgwXflxNlwNtNuq54CpRR4WVNvb8Odgl2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erRNysltU8lMsxn1C3bkT2QUuQEKf1Q1eF9vuxOVwoE94nwHKNehcw71UxdbtbFN9rAcT1C8moBYMVyKzi8fBZolGS9A+YepSbYg1rF4kU6B5y1XYA95ytvxwcPGIBe7EZSuLcdJjQguluuyrc81mbZ1GTnu+jgzOjHD8kas6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o22EbOPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMNRTSJM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkMT507299
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=; b=o22EbOPMM/dJPX4m
	VwHbm2eM16tbHLpf+3jrLFY3OQ1d9GYFA9Kw2gJTzp0xtaHE2ojDDUR9zVeyRDe5
	/dsGnO5Mwghfamfw5cf2E9bOMHn5Chyh7SiebatvxPDRSOPeGqpZTNX+qY1kTEYF
	hJAuRxK3sohdvqaP6pptnZXKui55lhRIWWrjuBGYHiUufLXNMXFaWHA4PKwn+CrO
	8eDZ16NQ5dP0rmyDLJDsIZ5IJkWRh/j+z0BU2PrTBYxbgG6SY/iz/EPcXfI0m6eU
	bX/7DLTgsrpy9ftow8tL+zV94ooSRFBqjhts8BxZI5L6UOHpMpLH9D/Mo9fiBQjV
	iJVoAw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8ghx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:14:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso4963131a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930489; x=1784535289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=;
        b=WMNRTSJMMwUB7W3lJUQliA+TGKxXcO1WQH249oNg91fNm2Z7SFDCf9rWLoAbMUpI2m
         mU7e3jWcHFuhRXynH/3pO5Ihb8kkIBKyo0ioUf/tYu75vfhPIRtvUKVtnWPeeOA9Dvdd
         bAJFfLGswpOvmbPW8nm+aZljQJYF16S+M2ebkzZ4m8eSHWqKHPwFHysUJfPpnYatXy9h
         sP02DoDEIxaxhRRhsxrcD/XZvOcHmmI5a5FCtTT1vG19rirOmTS7cJanBE66b/n3Y/9n
         MNeRfAp9b933sQ8VAYGCOjtFttJAMI8saffjvqc0xA/WoW4diUB89ZLOa73giEjk5mgn
         Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930489; x=1784535289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa5gwV4FuV45W/DVPi3OpoAJltQZRv63LVhO/gAPcEs=;
        b=UoFfOfnTrRRaTP9Piz0CoxWf3NzkHuKJg/CzY6Aph466V0/hxZf7CKq6Ic2AP9n4si
         kfcd0TpKthoH7rBN7VWeMBN+nOg8l6vBlq4I7f7pmpEJqs879qcUJgSzSyFddvy+nK7D
         YP91HkRh83AXotcKMf01uYJt1RUIWcmfnRoSddlIfbBiRRC7nA96Mq5JocSZSrpkK5Zn
         R9O+VPWGoHEEU2HcDgMXv9kayb546V1CM6tZXlJ1hE1PKBeyV9KxSuyMD6b5S91/5tJt
         vN2W7zh4nxagmMdcmdaPKdQ7DjtTGRnP3yWT9zPcWBCDsgp3L0cL7p6TL91YBrxmpalC
         5fzw==
X-Forwarded-Encrypted: i=1; AHgh+RreIqnZbJBkIeHZu6yqiaCS6sjvFBfkcS/XVybDDUTypuO4XSuyxJP3oOaOkJYk0DtWbUbGwuvDy1IPuVep@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfxqp8os6eTfXJ/shgOmhbKctqZPcklwTqDVs3a9sFl2XGURvE
	qUGnb1pet44MIvwLDH5PtO3aU9Y4NcOnvzFgGldyN4+KzR77N9NFnDHNesOfV5671JK9EOrbADp
	Q826xdH4eAFACDpfJYhUwjUiA0oF8UWA8f5Z4IzU4eYjezLy5+m9RQYfm71gK8uQ56c4y
X-Gm-Gg: AfdE7cmmhgEihZiWgsy9IEmis8J5Ufi9INwQs3qKgUYU35CrK9+w6JzNO//UgcU0tkx
	tqzUGzadCTjcyd7PIgRmZqLHr63lbLxrakkP8a+HHuJEmLNR1+RRahnyZiNUV945cHsPxehPoxd
	rULpQAYOukpEH+Z2DtcwgS0UNqlkAINan2/xvPGxhTLJo81NA6QDLMvNwpdO7RKc6BZokq1z8+5
	qWZBUPNRdwBjNnXvop92m3MTcra2XCEei/e/o6XGQd+ggUgQvWFU+9yS9VXs6CYbhT7X+N5Xup5
	paUc8G5bLP5b7COIRLOz+BWLamVHGv+17vF7h3CVPuxEcKNctKY0jipp4cL9gq59fHlTaXflqUp
	ctpja9HPiKGZh/qFvqGwkqAklWpe7AyUeIt8GlBs=
X-Received: by 2002:a05:6a21:b84:b0:3c0:ad2e:753d with SMTP id adf61e73a8af0-3c110a1280cmr8438574637.7.1783930489190;
        Mon, 13 Jul 2026 01:14:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3c0:ad2e:753d with SMTP id adf61e73a8af0-3c110a1280cmr8438541637.7.1783930488748;
        Mon, 13 Jul 2026 01:14:48 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8a5992c9sm23762094c88.4.2026.07.13.01.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:14:47 -0700 (PDT)
Message-ID: <5def8e49-dcf6-4a79-9a4c-b851483ad1e0@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:44:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
 <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UTsJvsZH4JAPOLBkdwzV_aoWw4RQJu1X
X-Proofpoint-ORIG-GUID: UTsJvsZH4JAPOLBkdwzV_aoWw4RQJu1X
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a549e79 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JafrABjVyvUhwVX8spQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXzGUwZ5XVfgYq
 LWkUrOsbiZ6jLbr6JQyuJGqElXPrJOpZu5OclZNrnnqY+uPJyoRwzc4Bmh001lMQjh4RrdmFyQw
 CzeSaiW+GWj/42v2HlRdOCt2E0tqtHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX0MDyk9a6hxnQ
 9/J96O/ZCgVPvpaTpNf2yYBpihplTeEH7JgGiZ4QapWuwV29SehxRXbBVKnA/7nCeWSlLoXXLQy
 Nc6zV+nYKERW3QmnlnnCU86uMzsyCtqrDIzVk/nK7GMOe2EP30nz67Ik6YFqsnJhuFhrR1hBhzl
 MWLhz+G9Jy5hVOffrFrvlkewNaLNnIkNl1Tp0NCbexkLI1qhy1u8hTsxdqO1kPRElqwWKYTI93k
 nTRtJgIm/JcLKZjGuHT7aKYozoihgNOs4Zxd4m8XsQi68tN/cxctK4ol6dzXxyPCP4spIw3FftW
 le/u8k9VjCldaAV/41SzPgLMvHDBfVxwBqTrj7S8MRtY1tihxv/I/dt22rmsezC06/HvkGei2w8
 yTAaDVbSZtI/EaThCwoJ0/8eNQhq3UTHRyo/eddyBM36fJcNAi0racVLSJhgYjASRzC/0qFiv94
 biwRKai9emwBJ/u9fxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118675-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C021748ACD



On 09-Jul-26 3:20 PM, Dmitry Baryshkov wrote:
[...]
> 
> Is it compatible with the generic rpm-stats format? If so,
> qcom-rpm-stats should be a fallback compatible.
> 
Agreed Dmitry, thanks for pointing out. Will send out v3 with "qcom,rpm-stats"
as fallback compatible.

Thanks,
Sneh
>>  			reg = <0x0 0x04690000 0x0 0x14000>;
>>  		};
>>  
>>
>> -- 
>> 2.34.1
>>
> 


