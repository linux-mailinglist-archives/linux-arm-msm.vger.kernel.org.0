Return-Path: <linux-arm-msm+bounces-114164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0bqKDAFjOmrj7gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:42:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF116B658E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:42:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YUGZ9eSL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HXKGHZbZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C962C306BB85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AF93D0BE1;
	Tue, 23 Jun 2026 10:41:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49213CFF68
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211309; cv=none; b=pzINojqNybyfw/X+co36yS7pAr9VTsHac8YPYAhBu7SY8hXqS6j2CGJej0lCBA7uQ6dBBxSs5moPotb4AkPzs5hkCJ7Y58Sl9GBRrmjXcyUCiEAre/O28YivDr6ScIbzJug6n7MpRw6bNVGxbk1+oNezGHLjGrwOZ5lfPzJeWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211309; c=relaxed/simple;
	bh=2VgH5KfDdlzlPIz+sChiqqNUH5YO3RGqBq0ILzjT9gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMnD20NuTxfA7PxafScaoJ1xWeEwofwzBU2+qtAN0+c/00hz7bmiwkw+lp2lAl6D2rpWVsd6Yr/HbbNSFr5jxEa/EHhjZ1szOmzF/fbWrH1x+4nrEYY6SJ4h9w+5A+6hmJMeAkh/PYyOXUqIqDQ8mKoINxUCaDewx34uB/Cr99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUGZ9eSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXKGHZbZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KXxU3919066
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=; b=YUGZ9eSL3yRCoXVS
	pbTafCobY+0E5kfukaWwl/XL85wJaPhO+G4h2wYAG91TY3FAFOzbAh/imY6FzCKq
	tybb+CyrFX4Ygpo4ZT18u1UwuBvdTJWLe/8tw1sEx4Yc7ysbOvRbD+OY6tjLSSq6
	2HrA64UtmDlGDJb+cNoUAtxKTQ2DpxC/8xlU4/Bn2d86xN34N5Su2bIhHwCHKYLU
	gynrCyvk9V9a+CN0AfBYTwakPKUDZ3ymEUkaUJM4TQwUK3FJldiAV17hyC6d/3GX
	FYrpUzTnW/kcxWY+DqnW5ZR7JH9ZXINGp0TVTb7dSRtCSsxDXXb9Cj4ga2YrL5ox
	vO+89Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68cna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:41:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b9d0162aso102316085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782211305; x=1782816105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=;
        b=HXKGHZbZ3ddZMslINCf1uj9qGqfVLuTnBWhDpdFuwlzI4LE4ogzj+QJRswQUwDehEr
         Hx0df9RssKgSa3IBaeJXcockBc/sAdDae6v7f7L7UgYBSYwc4x0TIZwsgA9CoxETvfvf
         33qWXh338UX95zqEtQVtdglibv/jE4tq5EdhlMyKXotX/I/wNvauCIORwhOVed5EKyPF
         kPgjOTKTIRQOfX3lSC0/VKvdrGSoaoN+UFkGAPwhpGdhcNCILwPa9/OPQT3M0Ndt5BZ4
         pB1EJK4TZti5sRxBVjd+3u2O+4MkGZfU3PVZn654KPxr16yuKFL2eSXGTl0ISQ7BTsA6
         y/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211305; x=1782816105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qW0iDkDs1LGQ0Qr0sk+Hgc/v7XkJCMVmkF2ubdjfZPA=;
        b=RugZdO0BjW3+vTlIfs3juyCMpEAUE4XwZ+dG8F2my+qRQeQuo0FBrm+9WPtyYNzH7o
         Y9cSQ0bI8jceQbSog4QJYgtaVkl8viU+HJAnUSfW/u+mw+Vn/hmWXCv9CTMQB59Ylvet
         TI8m52SbkZd82c8KnGxqkEAK42bl0H+YGQ0dThW1eNLTWiMXpQDVrwmDL5v65ijF5Z3q
         16E5/T/43lh8mzz4J+zIh3lhTQigI4XDpAiuWjgj2IEwv34UE+f0EO2bRMoQzfn1tCUx
         eJBkh/wT5WK6s4VVwI21ZKl6s0hKBpytbkUyDJgQw0oaWJt5iYa1RoaM4bai3z3PBeC8
         e4ZQ==
X-Gm-Message-State: AOJu0Yx0AGoUbbQwwQKYmaFbixrTRl/XIwWo0xry7VqM6cTlWABeFNs9
	GdNxcTTPR2cmYauSSuyTScRgLYSQ0aYlucFka+MnHWEjQOmLZA2rNIG8Oj62o+bCJVtgkSPEId4
	UbEeTxzoltw66nCKd+Mj6h3BvWHPzODeCiP2ErRw+kg9t/+bfaahCdE1oCsyXzGZGb5BZ
X-Gm-Gg: AfdE7ckHDSJ8bnMJ+FqS+aD/EtqSaRgYots2i3jsf1W6Lz47QsXObvGj4VqqJ7RqUjw
	97Ggyu3wewHYsIvgYnuX5ENuYsx+axfOEFig8CCq7qnfOcYquVEetBWCTUAZHmyDrCEGR7PDaKP
	csdDF8gR2fNCwwutYlEZEB2sX8A+PVpNV8vsChQc9JD7lUCrBf/tpzoYpZqmYY8wUIJFTtTAo/b
	K6MqDFgSkr1IDGDVZqVufi/7L0nm7oONd0qExPeQnCjyBsb5g1Z4IpAZ61yaaWU7rq7XG905/Wp
	JVALK14FWJDAXGL7eop1/8daAwaHofRNOdevr1035PR1djLbIGIZcnB9mjoEFQx+flPOZ/a/LQH
	1hJNqqsFI830hCxR4TIylbIp54C0YpQlOW3c=
X-Received: by 2002:a05:620a:4107:b0:90d:11b2:80f3 with SMTP id af79cd13be357-925c8ecdc9bmr475962885a.7.1782211305221;
        Tue, 23 Jun 2026 03:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:90d:11b2:80f3 with SMTP id af79cd13be357-925c8ecdc9bmr475959585a.7.1782211304705;
        Tue, 23 Jun 2026 03:41:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm496121466b.62.2026.06.23.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:41:43 -0700 (PDT)
Message-ID: <8386c50c-42ad-47f5-979d-54cbaa5109d3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
 <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
 <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HmzoFfEMDzvqZ4xlt03-elN2gBWSoAsD
X-Proofpoint-ORIG-GUID: HmzoFfEMDzvqZ4xlt03-elN2gBWSoAsD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX10azWJmakijD
 OLZT+zrFRBizTn5vhE3RIK8OuLeQITDCVbrdR7MMylor7K5bOSlBhWWnDV/P8bQ8WGXzgM0BmPk
 TMa+hryovsieVuyJsSW0GhcoUZbanno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX/ECsK3JzxLYP
 bQxgSyE4qK13zrZ7cRCcuLUpY6CkR6KIdX5yppr7gitlHZWOiRfaELUoERwVuq37Ar498F1MvGm
 n0E6YvJaI9VtiRASpwNiNVPCo5kGivLhv0pM3u7rirt8ct+19M7lWihAsR0MFpzI3OeCPtM75U/
 /LBMFRDf7BhqVrbSj1KbXoxf0mTO7mgQQ6/yf2ib7OMlSD4acCV4uF7bP9YWuKRGtDvr5G45TEP
 yFdnosbLcbEBdQkBnUJYVTLJz7DeyZ6XzW9QVF9SNfBIGfpzgKGc4IZ2ABPtjWmo/mSJXi+AclE
 Obr2+/niDnC5NjsudhjE6g3T5oQNwufHLLqQixf0txIJ7wErWjgiEFSkCkbKsoHpQJEFmbAMVAX
 J5Q4jBRe7uY56Ymb8iQBsaJltWwkKz/6+C9fqaS5iiRL/HXjm7Qcwa6L8ROmM3ALPaK02NenOIG
 ipc9090XNVg3TRa4iUg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a62e9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oS_SqjwSy1YzO6rVN58A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sachin.gupta@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EF116B658E

On 6/23/26 12:14 PM, Sachin Gupta wrote:
> 
> 
> On 6/19/2026 5:44 PM, Konrad Dybcio wrote:
>> On 6/19/26 8:45 AM, Sachin Gupta wrote:
>>>
>>>
>>> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>>>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>>
>>>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>>>> the die temperature, and when there is a level 1 upper threshold
>>>>> violation, it receives an interrupt over spmi. The driver reads
>>>>> the fault status register and notifies thermal accordingly.
>>>>>
>>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +    /*
>>>>> +     * Configure the last_temp one degree higher, to ensure the
>>>>> +     * violated temp is returned to thermal framework when it reads
>>>>> +     * temperature for the first time after the violation happens.
>>>>> +     * This is needed to account for the inaccuracy in the conversion
>>>>> +     * formula used which leads to the thermal framework setting back
>>>>> +     * the same thresholds in case the temperature it reads does not
>>>>> +     * show violation.
>>>>> +     */
>>>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>>>
>>>> Will this work fine if the user tries to set the max temp supported
>>>> by the hardware (i.e. is there headroom for max+1)?
>>>>
>>>
>>> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.
>>
>> You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:
>>
>> #define MBG_MAX_SUPPORTED_TEMP 160000,
>>
>> so passing temp=159999 is "valid" and after the addition it becomes 160999,
>> which in my understanding is outside the range
>>
>> Konrad
> 
> chip->last_temp is only a software cache used in one place, mbg_tm_get_temp(), to return a synthetic “trip violated” reading once after the IRQ. It is not programmed into any hardware register. So temp + MBG_TEMP_CONSTANT exceeding MBG_MAX_SUPPORTED_TEMP does not cause a hardware out-of-range condition.
> 
> Do you see this as an issue?

Right, I zoomed in too much

Konrad

