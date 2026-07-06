Return-Path: <linux-arm-msm+bounces-116723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuavKmZ6S2puSAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:50:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAB70EC7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:50:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DQXpdCcO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aAZm5w9j;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCC7431B9C47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878524BC030;
	Mon,  6 Jul 2026 09:29:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5A3890F1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330173; cv=none; b=C363uqZTqPTlj3qkqKIMFqYD16JUzXw7JWcWV3gJEiln+qDvkxp0782LXuSQm8av8/D5WHM9HN57zA4kVwwey60vZcIYQQ+ELZIX/IsqLPusFaTsN5+SOgW48STsmJSOJhw2pXROBw5lFePA+Xw6m8RbmumBDto0KtHQripPUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330173; c=relaxed/simple;
	bh=9KU0+Qh3UhQzV4S/AeidafHAtgBcfgMjLpUHxSSz6u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoeglypHK6fugyJ2tZFGL6VG9AVntygpvmMxVVw04APZu3x7+1X1HbRrU/jPkt9tohbSyP/meMYUg5YBkOQYiE4XNKFQjLl9oCEo/fwwaq1jS2EzSjGSysHbeVjfVPMCu1a7SRJ4r67nwMH56FlUwQ9RW5lCWk7UAQVVZshrm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQXpdCcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAZm5w9j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gxke160086
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=; b=DQXpdCcOo89USyBt
	8XZNqqdIN6Uc7qJ/6IOlP74kJALJN6bjVoLmq0R+FZPKFKLPBFp8aiv6hBsZa+rz
	1IjheFNVRoS9AV4wfiswBidnQ7JoFfcs0ubVq+a+gJmtXb4vTRuQXq7cnhFHCUR9
	cvxdCe/GEfolG1RqOOFGLWV9wQ4/gyCPCESOXIHVWRfFoJl654MTB+A+F+jJhbcJ
	9xnTTASdXKR7DoVapAWlLnU4lKuAnVZbEh9H4Va+BV8pNg3h41oAXKQlebnu0Qdn
	Hh59yagpr9OJ47pNCBNt8Da48V1RYyeefgHHXOqYfPuzcL10xS4Q/UXQwiPsMR7w
	5/xdVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr1d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:29:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7579ded2so41226185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330167; x=1783934967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=aAZm5w9jOKMYMllCZPBgiCBwqrxxkXCTnWPXeWJ1DvVxZcqWbQr7B+o2o17KmnAEHZ
         g/i/DknjTPDGDIdx71GbvXL6awt3LqPd4E7QFlSGdbmSJkfuYs5jSotBdfREpmBlrRqV
         0mPJfoxz4DtJDZOEo6rRx7ZO7GmCyfLwQPa4RNMVpUPvPfEEEpBedkCsxPsWystYQ0sU
         OkNuIxP9wInGmKAsjsjmUPA1FS86a9+1F4J/vzdNVYH243xVIsW2piCpKCyhO3hfy8ZH
         DpsH3VGC01AbmM8DAVAKNkQUh5DIV43ceZ2a1aLp/1p67MXXTq42OdgMHLAv+Ueb2O3c
         +1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330167; x=1783934967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=KWVFpa5QGjkN1oOEUWGiijfaChUd1+sxtiCcVATHKZ/ghitj6ImLx4PYtjQezQUq60
         XOxkZr3xbapAUXUlnt00fp2gUiWl5wSmQKjylO6HFLs7Onx2926oAOhHCXlR1fzOf14u
         7sRDfTJvmhc9xKrMXicAUvkEK+4RZtQEozlP4tJbROvcADxqgQXB0fYcaJTEWjcG50pE
         3/wWrQb43juo/F2X1Q1vFFg2sftKkGXpvw+0PIe52QzL8fQ89SPKM7jUdNUYgc6dpars
         SiIZxQ63/96YhvsYNCrKg9ZwjHWLQhtKyxxSGdX5TiRHa1c+lY9HF6jRQNkowE66sGR/
         PF+g==
X-Gm-Message-State: AOJu0YwFpJPxCtdTAUyAE4W+GTZIhcNz1+i2+xvwEAb3sTMpZc5IFhq+
	e2eLtGs9P8H7SRfH7qqj1ffGjurhPQjMUfF+iH5ixj10tqNeky4W2RDYdE2ysUIAjw9Mwk3CzcZ
	Mhb40umJ0aS+i+1qOkZkzdvao6NYfnqfl6/B5G23lXG/0vJLsfpk7Z8YSV/YqDBbIComN
X-Gm-Gg: AfdE7cmAti7nu5t4SLivIqmnZLL5pxJOxr++n6jDV2Pm40UAZ49nzBNWTVNIkG9VlsS
	W1/wwNCiy2mYkmTyibyQicZ2sVaPjjpbf28btR93e2Z6Wf3fGmAzdLCODM1vIIX/N9eUawEK92f
	scPq/3jzUlU56FOu2qqYYPvRWvKTZrN9vqBH+jWXziaYtqQdY1iLABvsXr2vVlVvQJdH+Hg9tsc
	yop+Q31fJWlcPBOHo9YtaNr2REanEAa+JV+ItXRwCZgiaijTAanTrkwH7KXOsPkbcHWAhczr4YM
	r9EvjxoaEp0XlW96HIQTp3mq5PSWSSeWBu440WsEdFixof1LEqj59GYxhK1HPH3+kbIbSYNeh4o
	vQ9vzuUfCBt+7X/wa+hAoFNVSFTyXNuyi2Oc=
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117571cf.10.1783330167421;
        Mon, 06 Jul 2026 02:29:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117341cf.10.1783330166902;
        Mon, 06 Jul 2026 02:29:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm3562261a12.12.2026.07.06.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:29:25 -0700 (PDT)
Message-ID: <8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:29:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -f4QNh_s879YSGoyvuwVudyZ4JJEQd1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX0+c7O457MP/p
 1ZAqaqRCJpjqTLSdKJJecNXeBKSLkONBJddo+jX4Sr4fT5A8adLeEy4Teir1sp4hMSXWXgGhEo4
 WvV/qnS6x84zY3vtq4Xno0NB2VZSfG/vmoaoTgTogTPUL0bC0wKPdh0yohI+f5ZuqDrQfXjbmmI
 lhkeA84z97avjpPE3OaqmGxxr/riGEt3GyPGY1tSEx/9pduE3bGQ55sslYKPkdGCgud9t9dIcXM
 aKQGpxTx+tU+GdBgGlBASNHU09JSCqCA1deeFpMSN3ITi6hkraGJj43v35rAF0eW9eo8Jp/i/jj
 Pg4iJ3lqlaJVBs2HTM8GadowTSozleqIDxVD04fkfHODgzWlZVSMyGoDz7Kc9HpQAuzpM+TYSl3
 ow5kF67fSLOEm4VLBXk6mkQAIH/LLFVrv4Y4VkBaJv3CVgj1pADgSr7gnOfztkaLqeZea3h02hh
 9SJcREWulqjKFaUqVCg==
X-Proofpoint-ORIG-GUID: -f4QNh_s879YSGoyvuwVudyZ4JJEQd1j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX0QaG15+DzL58
 aLQQ8TzPMY4hRAI3fEuxtd+e+PYOlLYwMJGmRZ6XVFg7ZzOf09upaRbG+YX8S1xoCmwz1KS+PWA
 lWMNHxmAN1eK6LCpvWc5AtDPU4itwpU=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b7578 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=so6UWzPJPvBV26MIzc0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095
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
	TAGGED_FROM(0.00)[bounces-116723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EAAB70EC7E

On 5/1/26 7:06 PM, Elson Serrao wrote:
> Note: This v4 revision introduces a design change compared to v3.
> Based on discussion and feedback, the binding adopts a child-node-based
> model while preserving the legacy top-level 'ports' property. The
> child-node approach is required because EUD needs a separate OF graph
> per UTMI path to accurately describe per-path role switching.
> 
> Link to the discussion leading to this decision:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> ---

FWIW I've been running a slightly modified version of this on Agatti
(modified just because it's one of the platforms that needs one more
register write to enable the thing) and faced no obvious issues.

I'll happily see this in the tree after we're done with the paths
discussion

Konrad

