Return-Path: <linux-arm-msm+bounces-118872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ngeZB9dAVWp2mAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:47:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7574EDCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S63gVapb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JRWzlVmt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD2D930234FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2E3359A70;
	Mon, 13 Jul 2026 19:44:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86E1359A6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971879; cv=none; b=IEUxivWcfczD2iHvbj5Lm1eiTwiqZuWndKI9uBmS/+lhUN6jgZrIVKgxnbKcwBa58a2E7nXTIx0biQF6xaNWIqITdo9oeOL+nle92/QLrbTTyirMz0I9VzTylmXqqm+RuMYHHxZW2TIvEoMcEotYWSbxKAFmEUWya6DkEdGjHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971879; c=relaxed/simple;
	bh=bX7bcivM1V4CxVFaVtrctqhByxPmyRUgATmy+3xbS8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4mVX6zLJSePhnGpa20NmpPvkA9Z9Yjq8cOvtekLDuIu4XfyHbiRqV2cywKifMqi0IfHZNDWV+hUpM4XqWFi0F64rVfCT/i+7BhvBV5MivN23JI8DiCZKN5m8aO1WXPITuBpxaNmnWYNyEV9g+fWC5Tvey5rIOQGwBfMgUZnvdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S63gVapb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRWzlVmt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Tjj2435393
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOQbo6JDfQAH9rksVpUZt/em/OoZxzABV1foGrL0vVs=; b=S63gVapbbRKGgKDn
	dLi+syvD3dNJnHKV2lzh65YGlzubozVjBnlGzp0LTSn8NfWibsF9PKdG2OezO5Zm
	8qZoRtzZVa5b1TV4y0zoFC94ajuABH7FkRWetKRIxpbCk5N7IJoS+zSwc3dUrRaf
	LgZhCQOygF27RMmQkwzudNp6aNBtK/rop0cPFrJUDqcMCENU0PyJuEB6Z9BClN5s
	oo/FGc/0AfZpA0h4MgAFdu6pP9MpwGp8Axh7ed64wCtpYLVS4PwjKZ6vq0D9M9Tb
	haGeLwECdvNpZpWEuWU0HTnlLOsZJeXPRspmhRggrpbsHmZjkMH2c1auS7vPbW8o
	DT9ubQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavte96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:44:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2626192a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971874; x=1784576674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOQbo6JDfQAH9rksVpUZt/em/OoZxzABV1foGrL0vVs=;
        b=JRWzlVmtLstW7VPPEtbdt9MG4r5P+rR2u0BLEo8de09vOqBIQnoIt3b6RFHHW2VczR
         hLxMQ1m66NVTFKuXD7pa+iy1IJaBz/gyphKfDyax5xslNtp70ke86JqLoiPnpw1rTalT
         7eqsWy0CgkCB2TzQZrKkKVYTikASjQ2ZnwULW9q11KWrfEhOZOlKnIW97GraDrx2RZ3W
         xeKTYhJ7rUZaR6lKh6KN8iWDXi9DLwlp5SmmtOPYCpGhIawmh605btAlDrIxcyUSroV+
         fT5VElTysQlPMf1rrgLe4TJZ05zmDTTZHhxtC5MMCFu4OZ1d/NXF4NVTWyrK1WbTbx+6
         mRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971874; x=1784576674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOQbo6JDfQAH9rksVpUZt/em/OoZxzABV1foGrL0vVs=;
        b=i7bQgFkLq4mZ3vaPGSGbhViL6R9jWYKaOP3lMGPO9RowjD9vJH4rLz0Pz/6rlGXeet
         kqhNnb3lYaJCOPTtV0I2nierPGnZRpgkol1G5Jqp5w/k4DDp2IYRzO05QvVxkrgP57gk
         H3VD2DtPtAiIPaWe3vqxcX9fydaGTdbB+TMMffyqksdOJSV0fpFH+fCIf6OOQNxJ5/If
         /45uXQeaWoK/Lk7HGILeQPe4zQnxopA8o0bS4n6KgHU1eYBnMOh0UwQE8NW/QgUP553d
         Ec9tVdu2ZQr01hfR5dZ8lWtqY+94HZwqbFn4d4fn0dxpr7ucvQddkdM1MfDrGv2eAdZt
         s5DQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRUmnOl6jQ/U3oB7DhBNmWDOjLryOUMAGLtc7T1rPhTDjhVK6DqCQUW6t3o8r3JhZ+f9JmMioBuyQiso76@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrp33Efj9Gr0LXNHhLcbUbMlze/2e6H3RfygA1b3Nzl1KyXSUl
	8Gq7WGYME+F8r4jE/6xc37QOEq2DGFOBX5Xn5pgio3+p3U8dcAK8rJ72dNEW4g4MRdlgkc8Q3Uw
	ITqJTUMebYuyGRIYoMyR7TZFB2d8UhKXJRsEr2A/FvSy3SmZVXPzSU6OO8Ged92bFyh6B
X-Gm-Gg: AfdE7cmLJ8sH54erKK8F3kryRjx44h6BpvQuYcas0owPoAQwH4/8mTxkhBFEzw32uRQ
	WZLczw7m6HIWLgin8DyqyoNQ3lKHIm7cqdxv48pI6zp4/7geTZjBoe5gECptmkzfB+3p7TaP5OF
	YbfbhqaF45YNpJk1e7OI/WQON9zle6awuC/HQRGwWOpp/T3u5QpE732icmD+WyRyOeAF0AbiOxQ
	Y2xaFgkhcltXAg5Mt2S20d8ApF2bT2LUQPDo6al5EntzXKbpKJFcWJtnpdrWCupapPNlKkkwzxz
	dxw2g413if/I9kptpUAa41prYgEsIyWS+P3NtMPGZd07LSVyQt1XFRXc+ftL9R6SIxRRG46GAwO
	m7xyoE546mo/ESYantDl/54rRsAcDtYMfASueBuukZHkZ7G5ZeIYgTV4myFhWygDe9Y9HO7BTiy
	evDuNwfQ0grpFvgVVNKFsupdV8/o5Bf9n6BA==
X-Received: by 2002:a05:6a21:514:b0:3bf:836e:876e with SMTP id adf61e73a8af0-3c110ad2b41mr11580740637.44.1783971873468;
        Mon, 13 Jul 2026 12:44:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3bf:836e:876e with SMTP id adf61e73a8af0-3c110ad2b41mr11580694637.44.1783971872360;
        Mon, 13 Jul 2026 12:44:32 -0700 (PDT)
Received: from [10.50.24.238] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm77343114eec.31.2026.07.13.12.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 12:44:31 -0700 (PDT)
Message-ID: <ee407cbf-3476-4209-ad40-b381535b94ac@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:14:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 7/9] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
 <akWBtfG1j7-53fec@baldur>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <akWBtfG1j7-53fec@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pRN82R5opnQsdjssMNq3gDBDTFg40aq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfX+yNtsp9K3KNT
 vhRwVnjNhjbuTGe3wCp5MJY7ibNq/UPkMluqN4OXub4HH0hb7ogG8qehUq4pOTTcuop2taexw1y
 hbCtFyAB6kGaYebIWWF/IsvyLhQRDO0k7X/sDibttUIz5xigUjCQeeUrOTQ7t3jKiQ1UnsqsAd3
 8tNgbSQzD0C2pcTuz7I9PxBtF9x2d8GmudJlK+g8pdmD+oPtu6X96zdpz/RY0jWgt3KKQaXEDj1
 rJiBjhc9uVmsKUdqvxsGeaIUkZW+K/jZDt5lWQuWwAV0jejjVzlAYBO5BVSug815EORj1bZwrdg
 dfdU8Ec6xG+HJismq024skvJfPcTPMv7VJ5+dJUQH1A99DJIhFjIjDc1A4GAthrbQGc5i0UnuQw
 4YhHXYLThhtitexLLZOxzZdt7FZNGDEjYZP3wPOJtMTJ7r1FqD1ROKN18cGxvlZTVJzkcjOAYqn
 1slFa+TWRl/4IW2OpwA==
X-Proofpoint-ORIG-GUID: pRN82R5opnQsdjssMNq3gDBDTFg40aq-
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a554022 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QqAQ6771Y7FsILi-PX0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwNCBTYWx0ZWRfX0IOlIiYV+3UH
 RZEZPFAEICUcMwscHZxdjgWu+/8cMpeacvAS6cJFFzaA1ebEw3fXY3NZL71u9vI1Uke15I2Svlv
 Z+gU/daCkjq0vNT6yuxKo9A1PkF5gNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-118872-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,pdevinfo.name:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pdevinfo.id:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 38A7574EDCD



On 02-Jul-26 10:51 PM, Bjorn Andersson wrote:
> On Wed, Jun 10, 2026 at 02:21:34PM +0530, Pragnesh Papaniya wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> On Qualcomm Glymur, Mahua and X1E/X1P (Hamoa) SoCs, the memlat governor and
>> the mechanism to control the various caches and RAM is hosted on the CPU
>> Control Processor (CPUCP), and configuration and control of this governor
>> is exposed through the QCOM SCMI Generic Extension Protocol, addressed via
>> the "MEMLAT" algorithm string.
>>
> 
> This explains that there's a bunch of functionality running on CPUCP and
> there's a "MEMLAT" string.
> 

CPUCP does all the real work: it samples CPU perf counters, computes IPM/stall,
and votes the DDR/LLCC/DDR_QOS buses on its own timer. The Linux driver only
pushes static configuration (freq maps, ceilings) once at probe and
starts/stops the CPUCP timer. I'll rewrite the message to say this plainly.

>> Introduce a devfreq SCMI client driver that uses the MEMLAT algorithm
>> string to detect memory-latency-bound workloads and control the
>> frequency/level of the memory buses (DDR, LLCC and DDR_QOS).
> 
> You established that there's stuff running in the firmware, now we're
> introducing a client driver to control memory buses.
> 
> But where did you explain how these two "facts" are related? Why is
> there a client driver, what is the actual distribution of roles in this
> dance?
> 

At runtime the driver is not in the control loop, CPUCP is. devfreq is used so
each bus shows up as a real device with trans_stat and the remote governor's
parameters like sample_ms and ipm_ceil are user-configurable. I'll make that
reasoning explicit in the commit text.

>> Model each bus
>> as a devfreq device using the remote devfreq governor. This provides basic
>> insight into device operation via trans_stat and allows further tuning of
>> the remote governor's parameters from userspace.
>>
> 
> Does this mean that the driver is "optional", and only exists to give
> insight and a way to tune the firmware operation?
> 
> If that's the case, why is it a devfreq driver?
> 
> Please write your commit messages (and patches) such that people outside
> your immediate team can understand why the patches are needed and what
> the code is supposed to do.
> 

Ack

>> Co-developed-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
>> Signed-off-by: Amir Vajid <amir.vajid@oss.qualcomm.com>
>> Co-developed-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
>> Signed-off-by: Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>> ---
>>  drivers/devfreq/Kconfig                    |  13 +
>>  drivers/devfreq/Makefile                   |   1 +
>>  drivers/devfreq/scmi-qcom-memlat-cfg.h     | 573 +++++++++++++++++++++++++++
>>  drivers/devfreq/scmi-qcom-memlat-devfreq.c | 616 +++++++++++++++++++++++++++++
>>  4 files changed, 1203 insertions(+)
>>
>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>> index 2caa87554914..98b5a50d3189 100644
>> --- a/drivers/devfreq/Kconfig
>> +++ b/drivers/devfreq/Kconfig
>> @@ -169,6 +169,19 @@ config ARM_SUN8I_A33_MBUS_DEVFREQ
>>  	  This adds the DEVFREQ driver for the MBUS controller in some
>>  	  Allwinner sun8i (A33 through H3) and sun50i (A64 and H5) SoCs.
>>  
>> +config SCMI_QCOM_MEMLAT_DEVFREQ
>> +	tristate "Qualcomm Technologies Inc. SCMI client driver"
>> +	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
>> +	select DEVFREQ_GOV_REMOTE
>> +	help
>> +	  This driver uses the MEMLAT (memory latency) algorithm string
> 
> Is "driver uses X algorithm string" idiomatic SCMI terms?
> 

No, "algorithm string" is an internal term. I'll drop the jargon and describe
it in plain SCMI vendor-protocol terms.

>> +	  hosted on QCOM SCMI Vendor Protocol to detect memory latency
>> +	  workloads and control frequency/level of the various memory
>> +	  buses (DDR/LLCC/DDR_QOS).
>> +
>> +	  This driver defines/documents the parameter IDs used while configuring
>> +	  the memory buses.
> 
> Imagine an person outside your team, sitting there in menuconfig
> wondering if they should enable this driver or not.
> 
> There's a sentence in the middle ("control frequency/level of various
> memory buses" - that sounds like something I want. But "detect memory
> latency", is it just monitoring or does that part relate to the
> controlling part? "This driver defines" so what are those parameters
> used for, do I need some other driver for the control part? Is this last
> paragraph adding value to my understanding for that
> CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ does?
> 

I'll rewrite it to say what you get (memory-bus scaling on these Qualcomm
SoCs), that CPUCP does the actual scaling, and that nothing else is required
to enable it. The parameter-ID paragraph will go.

>> +
>>  source "drivers/devfreq/event/Kconfig"
>>  
>>  endif # PM_DEVFREQ
>> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
>> index cde57c8cda76..b11f94e2f485 100644
>> --- a/drivers/devfreq/Makefile
>> +++ b/drivers/devfreq/Makefile
>> @@ -17,6 +17,7 @@ obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
>>  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>>  obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)	+= sun8i-a33-mbus.o
>>  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
>> +obj-$(CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ)	+= scmi-qcom-memlat-devfreq.o
>>  
>>  # DEVFREQ Event Drivers
>>  obj-$(CONFIG_PM_DEVFREQ_EVENT)		+= event/
>> diff --git a/drivers/devfreq/scmi-qcom-memlat-cfg.h b/drivers/devfreq/scmi-qcom-memlat-cfg.h
>> new file mode 100644
>> index 000000000000..1ab8b61ea271
>> --- /dev/null
>> +++ b/drivers/devfreq/scmi-qcom-memlat-cfg.h
> 
> Are the entities declared in this header file used by anything other
> than scmi-qcom-memlat-devfreq.c? If not why is it a separate header file?
> 

No, only scmi-qcom-memlat-devfreq.c uses it. I split it out just to keep the
large config tables out of the driver logic. Happy either way: do you prefer
I fold it back into the .c, or keep it as a header?

>> @@ -0,0 +1,573 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
>> +#define __DRIVERS_DEVFREQ_SCMI_QCOM_MEMLAT_CONFIG_H__
>> +
>> +/*
>> + * Memlat Effective Frequency Calculation Method
>> + * CPUCP_EFFECTIVE_FREQ_METHOD_0 - Uses CPU Cycles and CONST Cycles to calculate
>> + * CPUCP_EFFECTIVE_FREQ_METHOD_1 - Uses CPU Cycles and time period
>> + */
>> +#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_0	0
>> +#define CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1	1
> 
> #define ZERO 0
> #define ONE  1
> 
> Can these be given real names, or could the struct member even be a
> boolean?
> 
> That said, "ZERO" isn't used in your patch...
> 

I'll make cpucp_freq_method a bool. Method 0 is a valid firmware method and
will be used too, so I'll keep both and select via the bool.

>> +
>> +#define EV_CPU_CYCLES		0
>> +#define EV_CNT_CYCLES		1
>> +#define EV_INST_RETIRED		2
>> +#define EV_STALL_BACKEND_MEM	3
>> +#define EV_L2_D_RFILL		5
>> +#define INVALID_IDX		0xff
> 
> The names of these defines aren't awesome names to put in include
> files...
> 

Ack, I'll namespace them (MEMLAT_EV_*) and align INVALID_IDX with the
firmware's 0xFF.

>> +
>> +#define MEMLAT_ALGO_STR		0x4D454D4C4154ULL /* MEMLAT */
> 
> As you've seen a thousand times on LKML already, we want lower-case hex
> digits...
> 

Firmware expects upper-case string only.

>> +
>> +struct scmi_qcom_map_table {
>> +	unsigned int cpu_freq;
>> +	unsigned int mem_freq;
> 
> Unit soup
> 

I'll suffix them (cpu_freq_mhz / mem_freq_mhz).

>> +};
>> +
>> +struct scmi_qcom_opp_data {
>> +	unsigned long freq;
>> +	unsigned int level;
> 
> The arrays of opp_data is all static const, and you seem to only define
> "level" for ddr_qos, which if I read the code correctly you later
> treat in some special way anyways.
> 

Yes, level is only set for DDR_QOS and unused elsewhere. I'll drop the level
field entirely and document that the DDR_QOS OPP frequencies (1 and 100) are
not real frequencies; they stand in for the 0/1 level.

>> +};
>> +
>> +struct scmi_qcom_memory_range {
>> +	unsigned int min_freq;
>> +	unsigned int max_freq;
>> +};
>> +
>> +enum common_ev_idx {
>> +	INST_IDX,
>> +	CYC_IDX,
>> +	CONST_CYC_IDX,
>> +	FE_STALL_IDX,
>> +	BE_STALL_IDX,
>> +	NUM_COMMON_EVS
>> +};
>> +
>> +enum grp_ev_idx {
>> +	MISS_IDX,
>> +	WB_IDX,
>> +	ACC_IDX,
>> +	NUM_GRP_EVS
>> +};
>> +
>> +/*
>> + * CPUCP firmware identifies memory groups by a small integer (the hw_type
>> + * carried in node_msg / scalar_param_msg / map_param_msg / ev_map_msg).
> 
> Ok, sounds reasonable.
> 
>> The
>> + * encoding is shared between the cfg tables below and scmi_qcom_devfreq_get_cur_freq()
>> + * which special-cases DDR_QOS as a level-based bus rather than a frequency-scaled one.
> 
> The constants are shared between A and B, both being described as
> in-driver users. So is this constants shared between the first (as you
> said above) or an enumeration within the driver?
> 

It's a protocol ABI, shared with the first (firmware). I'll reword the comment
to say it's a firmware-defined encoding, not a driver-internal enum.

>> + */
>> +enum scmi_qcom_memlat_hw_type {
>> +	MEMLAT_HW_DDR			= 0,
>> +	MEMLAT_HW_LLCC			= 1,
>> +	MEMLAT_HW_DDR_QOS_COMPUTE	= 2,
> 
> Please use "enum" for enumerations and #define for constants. (These
> aren't enumerations, as they are defined constants)
> 

Ack, will keep it as enum (as you suggested below).

>> +};
>> +
>> +struct scmi_qcom_monitor_cfg {
>> +	const struct scmi_qcom_map_table *table;
>> +	const char *name;
>> +	u32 be_stall_floor;
> 
> What is a "be stall floor"? Also, it seems to be 1 in all your cases. Is
> it boolean? Is it constant?
> 

It's a back-end-stall percentage threshold. It happens to be 1 in all current
configs (meaning almost any stall qualifies). I'll document it as a percent.

>> +	u32 cpu_mask;
>> +	u32 ipm_ceil;
>> +	int table_len;
> 
> Why is this signed?
> 

Ack

>> +};
>> +
>> +struct scmi_qcom_memory_cfg {
>> +	const struct scmi_qcom_monitor_cfg *monitor_cfg;
>> +	const struct scmi_qcom_opp_data *mem_table;
>> +	struct scmi_qcom_memory_range memory_range;
>> +	const u32 *grp_ev;
>> +	const char *name;
>> +	u32 memory_type;
> 
> As the memory type isn't an enumeration, I asked you above to make it
> constants. But in the form you wrote it, there's no reason for this not
> to have its enum type.
> 

Ack, will keep it as enum.

>> +	int monitor_cnt;
>> +	int num_opps;
> 
> Aren't these unsigned?
> 

Ack

>> +};
>> +
>> +struct scmi_qcom_memlat_cfg_data {
>> +	const struct scmi_qcom_memory_cfg *memory_cfg;
>> +	const u32 *common_ev;
>> +	u32 cpucp_freq_method;
>> +	u32 cpucp_sample_ms;
>> +	int memory_cnt;
> 
> Unsigned...
> 

Ack

>> +};
>> +
>> +static const u32 glymur_common_ev[NUM_COMMON_EVS] = {
>> +	[INST_IDX]      = EV_INST_RETIRED,
>> +	[CYC_IDX]       = EV_CPU_CYCLES,
>> +	[CONST_CYC_IDX] = EV_CNT_CYCLES,
>> +	[FE_STALL_IDX]  = INVALID_IDX,
>> +	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
>> +};
>> +
>> +static const u32 glymur_ddr_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const u32 glymur_llcc_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const u32 glymur_ddr_qos_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const u32 hamoa_common_ev[NUM_COMMON_EVS] = {
>> +	[INST_IDX]      = EV_INST_RETIRED,
>> +	[CYC_IDX]       = EV_CPU_CYCLES,
>> +	[CONST_CYC_IDX] = EV_CNT_CYCLES,
>> +	[FE_STALL_IDX]  = INVALID_IDX,
>> +	[BE_STALL_IDX]  = EV_STALL_BACKEND_MEM,
>> +};
>> +
>> +static const u32 hamoa_ddr_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const u32 hamoa_llcc_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const u32 hamoa_ddr_qos_grp_ev[NUM_GRP_EVS] = {
>> +	[MISS_IDX] = EV_L2_D_RFILL,
>> +	[WB_IDX]   = INVALID_IDX,
>> +	[ACC_IDX]  = INVALID_IDX,
>> +};
>> +
>> +static const struct scmi_qcom_opp_data glymur_llcc_table[] = {
>> +	{ .freq = 315000000 },
>> +	{ .freq = 479000000 },
>> +	{ .freq = 545000000 },
>> +	{ .freq = 725000000 },
>> +	{ .freq = 840000000 },
>> +	{ .freq = 959000000 },
>> +	{ .freq = 1090000000 },
>> +	{ .freq = 1211000000 },
>> +};
>> +
>> +static const struct scmi_qcom_opp_data hamoa_llcc_table[] = {
>> +	{ .freq = 300000000 },
>> +	{ .freq = 466000000 },
>> +	{ .freq = 600000000 },
>> +	{ .freq = 806000000 },
>> +	{ .freq = 933000000 },
>> +	{ .freq = 1066000000 },
>> +};
>> +
>> +static const struct scmi_qcom_opp_data glymur_ddr_table[] = {
>> +	{ .freq = 200000000 },
>> +	{ .freq = 547000000 },
>> +	{ .freq = 1353000000 },
>> +	{ .freq = 1555000000 },
>> +	{ .freq = 1708000000 },
>> +	{ .freq = 2092000000 },
>> +	{ .freq = 2736000000 },
>> +	{ .freq = 3187000000 },
>> +	{ .freq = 3686000000 },
>> +	{ .freq = 4224000000 },
>> +	{ .freq = 4761000000 },
>> +};
>> +
>> +static const struct scmi_qcom_opp_data hamoa_ddr_table[] = {
>> +	{ .freq = 200000000 },
>> +	{ .freq = 547000000 },
>> +	{ .freq = 768000000 },
>> +	{ .freq = 1555000000 },
>> +	{ .freq = 1708000000 },
>> +	{ .freq = 2092000000 },
>> +	{ .freq = 2736000000 },
>> +	{ .freq = 3187000000 },
>> +	{ .freq = 3686000000 },
>> +	{ .freq = 4224000000 },
>> +};
>> +
>> +/*
>> + * DDR_QOS is a level-based bus (0 = nominal, 1 = boost), not a
>> + * frequency-scaled one.
> 
> "level-based"? Looks more like "boolean"?
> 
> So I presume "not a frequency-scaled one" should be interpreted as the
> .freq is bogus?
> 

Yes, the .freq values there are not real frequencies. Removing the
level field and rewording the comment will make that clear.

>> The OPP entries below use synthetic frequencies
>> + * (1 / 100) purely as distinct devfreq keys so trans_stat can show
>> + * level transitions.
> 
> 1/100? 0.01?
> 

Its not division, its an 'or'. Will drop '/'.

> Why are the frequencies 1 and 100, why not 0 and 1, or 0 and 100?
> 

0 can't be used, dev_pm_opp_add() rejects a 0 frequency. The two keys just
need to be non-zero and distinct, hence 1 and 100. I'll spell this out in the
comment.

>> scmi_qcom_devfreq_get_cur_freq() maps the firmware
>> + * level back to the matching key.
> 
> What is the "key" here?
> 

"key" means the OPP/devfreq frequency used for lookup. I'll say "OPP
frequency" instead of "key".

>> + */
>> +static const struct scmi_qcom_opp_data glymur_ddr_qos_table[] = {
>> +	{ .freq = 1, .level = 0 },
>> +	{ .freq = 100, .level = 1 },
>> +};
>> +
>> +static const struct scmi_qcom_memory_cfg glymur_memory_cfg[] = {
>> +	{
>> +		.memory_type = MEMLAT_HW_DDR,
>> +		.name = "ddr",
>> +		.mem_table = glymur_ddr_table,
>> +		.num_opps = ARRAY_SIZE(glymur_ddr_table),
>> +		.grp_ev = glymur_ddr_grp_ev,
>> +		.monitor_cnt = 4,
>> +		.memory_range = { .min_freq = 547000, .max_freq = 4761000},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0x3f,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 8,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 960, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1133, .mem_freq = 1353000 },
>> +					{ .cpu_freq = 1594, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 1920, .mem_freq = 1708000 },
>> +					{ .cpu_freq = 2228, .mem_freq = 2736000 },
>> +					{ .cpu_freq = 2362, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 2650, .mem_freq = 3686000 },
>> +					{ .cpu_freq = 2938, .mem_freq = 4761000 },
> 
> Why are these tables hard coded in the driver? Are they constant?
> 

These tables can be either in DT (like in earlier re-spins of the series) or in
the driver. For the former to work well with the existing OPP framework, we
would need a clock provider created for DDR/LLCC/DDR-QOS just to derive the
cpufreq to memfreq map tables. Having it in the driver simplifies the overall
implementation. 

>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xfc0,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 8,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 356, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1018, .mem_freq = 1353000 },
>> +					{ .cpu_freq = 1536, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 1748, .mem_freq = 1708000 },
>> +					{ .cpu_freq = 2324, .mem_freq = 2736000 },
>> +					{ .cpu_freq = 2496, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 2900, .mem_freq = 3686000 },
>> +					{ .cpu_freq = 3514, .mem_freq = 4761000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0x3f000,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 8,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 356, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1018, .mem_freq = 1353000 },
>> +					{ .cpu_freq = 1536, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 1748, .mem_freq = 1708000 },
>> +					{ .cpu_freq = 2324, .mem_freq = 2736000 },
>> +					{ .cpu_freq = 2496, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 2900, .mem_freq = 3686000 },
>> +					{ .cpu_freq = 3514, .mem_freq = 4761000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_3",
>> +				.cpu_mask = 0x3ffff,
>> +				.table_len = 4,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2823, .mem_freq = 547000 },
>> +					{ .cpu_freq = 3034, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 3226, .mem_freq = 1708000 },
>> +					{ .cpu_freq = 5012, .mem_freq = 2092000 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +	{
>> +		.memory_type = MEMLAT_HW_LLCC,
>> +		.name = "llcc",
>> +		.mem_table = glymur_llcc_table,
>> +		.num_opps = ARRAY_SIZE(glymur_llcc_table),
>> +		.grp_ev = glymur_llcc_grp_ev,
>> +		.monitor_cnt = 3,
>> +		.memory_range = { .min_freq = 315000, .max_freq = 1211000},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0x3f,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 7,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 960, .mem_freq = 315000 },
>> +					{ .cpu_freq = 1113, .mem_freq = 479000 },
>> +					{ .cpu_freq = 1594, .mem_freq = 545000 },
>> +					{ .cpu_freq = 1920, .mem_freq = 725000 },
>> +					{ .cpu_freq = 2362, .mem_freq = 840000 },
>> +					{ .cpu_freq = 2650, .mem_freq = 959000 },
>> +					{ .cpu_freq = 2938, .mem_freq = 1211000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xfc0,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 7,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 356, .mem_freq = 315000 },
>> +					{ .cpu_freq = 1018, .mem_freq = 479000 },
>> +					{ .cpu_freq = 1536, .mem_freq = 545000 },
>> +					{ .cpu_freq = 1748, .mem_freq = 725000 },
>> +					{ .cpu_freq = 2496, .mem_freq = 840000 },
>> +					{ .cpu_freq = 2900, .mem_freq = 959000 },
>> +					{ .cpu_freq = 3514, .mem_freq = 1211000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0x3f000,
>> +				.ipm_ceil = 60000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 7,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 356, .mem_freq = 315000 },
>> +					{ .cpu_freq = 1018, .mem_freq = 479000 },
>> +					{ .cpu_freq = 1536, .mem_freq = 545000 },
>> +					{ .cpu_freq = 1748, .mem_freq = 725000 },
>> +					{ .cpu_freq = 2496, .mem_freq = 840000 },
>> +					{ .cpu_freq = 2900, .mem_freq = 959000 },
>> +					{ .cpu_freq = 3514, .mem_freq = 1211000 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +	{
>> +		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
>> +		.name = "ddr-qos",
>> +		.monitor_cnt = 3,
>> +		.mem_table = glymur_ddr_qos_table,
>> +		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
>> +		.grp_ev = glymur_ddr_qos_grp_ev,
>> +		.memory_range = { .min_freq = 0, .max_freq = 1},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0x3f,
>> +				.ipm_ceil = 80000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2362, .mem_freq = 0 },
>> +					{ .cpu_freq = 2938, .mem_freq = 1 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xfc0,
>> +				.ipm_ceil = 80000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2496, .mem_freq = 0 },
>> +					{ .cpu_freq = 3514, .mem_freq = 1 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0x3f000,
>> +				.ipm_ceil = 80000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2496, .mem_freq = 0 },
>> +					{ .cpu_freq = 3514, .mem_freq = 1 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +};
>> +
>> +static const struct scmi_qcom_memory_cfg hamoa_memory_cfg[] = {
>> +	{
>> +		.memory_type = MEMLAT_HW_DDR,
>> +		.name = "ddr",
>> +		.mem_table = hamoa_ddr_table,
>> +		.num_opps = ARRAY_SIZE(hamoa_ddr_table),
>> +		.grp_ev = hamoa_ddr_grp_ev,
>> +		.monitor_cnt = 4,
>> +		.memory_range = { .min_freq = 200000, .max_freq = 4224000},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0xf,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xf0,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0xf00,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 547000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 768000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 2092000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 3187000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 4224000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_3",
>> +				.cpu_mask = 0xfff,
>> +				.table_len = 4,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 1440, .mem_freq = 547000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 768000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 1555000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 2092000 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +	{
>> +		.memory_type = MEMLAT_HW_LLCC,
>> +		.name = "llcc",
>> +		.mem_table = hamoa_llcc_table,
>> +		.num_opps = ARRAY_SIZE(hamoa_llcc_table),
>> +		.grp_ev = hamoa_llcc_grp_ev,
>> +		.monitor_cnt = 3,
>> +		.memory_range = { .min_freq = 300000, .max_freq = 1066000},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0xf,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 300000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xf0,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 300000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0xf00,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 6,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 999, .mem_freq = 300000 },
>> +					{ .cpu_freq = 1440, .mem_freq = 466000 },
>> +					{ .cpu_freq = 1671, .mem_freq = 600000 },
>> +					{ .cpu_freq = 2189, .mem_freq = 806000 },
>> +					{ .cpu_freq = 2516, .mem_freq = 933000 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1066000 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +	{
>> +		.memory_type = MEMLAT_HW_DDR_QOS_COMPUTE,
>> +		.name = "ddr-qos",
>> +		.monitor_cnt = 3,
>> +		.mem_table = glymur_ddr_qos_table,
>> +		.num_opps = ARRAY_SIZE(glymur_ddr_qos_table),
>> +		.grp_ev = hamoa_ddr_qos_grp_ev,
>> +		.memory_range = { .min_freq = 0, .max_freq = 1},
>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>> +			{
>> +				.name = "mon_0",
>> +				.cpu_mask = 0xf,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2189, .mem_freq = 0 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_1",
>> +				.cpu_mask = 0xf0,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2189, .mem_freq = 0 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1 },
>> +				}
>> +			},
>> +			{
>> +				.name = "mon_2",
>> +				.cpu_mask = 0xf00,
>> +				.ipm_ceil = 20000000,
>> +				.be_stall_floor = 1,
>> +				.table_len = 2,
>> +				.table = (const struct scmi_qcom_map_table[]) {
>> +					{ .cpu_freq = 2189, .mem_freq = 0 },
>> +					{ .cpu_freq = 3860, .mem_freq = 1 },
>> +				}
>> +			},
>> +		},
>> +	},
>> +};
>> +
>> +static const struct scmi_qcom_memlat_cfg_data glymur_memlat_data = {
>> +	.memory_cfg = glymur_memory_cfg,
>> +	.common_ev = glymur_common_ev,
>> +	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
>> +	.cpucp_sample_ms = 4,
>> +	.memory_cnt = ARRAY_SIZE(glymur_memory_cfg),
>> +};
>> +
>> +static const struct scmi_qcom_memlat_cfg_data hamoa_memlat_data = {
>> +	.memory_cfg = hamoa_memory_cfg,
>> +	.common_ev = hamoa_common_ev,
>> +	.cpucp_freq_method = CPUCP_EFFECTIVE_FREQ_CALC_METHOD_1,
>> +	.cpucp_sample_ms = 4,
>> +	.memory_cnt = ARRAY_SIZE(hamoa_memory_cfg),
>> +};
> 
> It would be wonderful to declare scmi_qcom_memlat_configs[] in the
> vicinity of these two definitions.
> 

Ack

>> +
>> +#endif
>> diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
>> new file mode 100644
>> index 000000000000..99ae229acfdc
>> --- /dev/null
>> +++ b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
>> @@ -0,0 +1,616 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/devfreq.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_opp.h>
>> +#include <linux/scmi_protocol.h>
>> +#include <linux/scmi_qcom_protocol.h>
>> +#include <linux/units.h>
>> +
>> +#define MAX_NAME_LEN				20
>> +#define MAX_MAP_ENTRIES				10
> 
> The names used for these defines are a bit generic...
> 

I'll prefix them (MEMLAT_MAX_*).

>> +
>> +#include "scmi-qcom-memlat-cfg.h"
>> +
>> +/**
>> + * enum scmi_memlat_protocol_cmd - parameter_ids supported by the "MEMLAT" algo_str hosted
>> + *                                 by the Qualcomm Generic Vendor Protocol on the SCMI controller.
> 
> This is supposed to be the short description, yet it's the same length
> as the long description on the very next line.
> 

Ack, will make it single line.

>> + *
>> + * MEMLAT (Memory Latency) monitors the counters to detect memory latency bound workloads
>> + * and scales the frequency/levels of the memory buses accordingly.
>> + *
>> + * @MEMLAT_SET_MEM_GROUP: initializes the frequency/level scaling functions for the memory bus.
>> + * @MEMLAT_SET_MONITOR: configures the monitor to work on a specific memory bus.
>> + * @MEMLAT_SET_COMMON_EV_MAP: set up common counters used to monitor the cpu frequency.
>> + * @MEMLAT_SET_GRP_EV_MAP: set up any specific counters used to monitor the memory bus.
>> + * @MEMLAT_IPM_CEIL: set the IPM (Instruction Per Misses) ceiling per monitor.
>> + * @MEMLAT_BE_STALL_FLOOR: set the back-end stall floor per monitor.
>> + * @MEMLAT_SAMPLE_MS: set the sampling period for all the monitors.
>> + * @MEMLAT_MON_FREQ_MAP: setup the cpufreq to memfreq map.
>> + * @MEMLAT_SET_MIN_FREQ: set the min frequency of the memory bus.
>> + * @MEMLAT_SET_MAX_FREQ: set the max frequency of the memory bus.
>> + * @MEMLAT_GET_CUR_FREQ: query the current frequency/level of the memory bus.
>> + * @MEMLAT_START_TIMER: start all the monitors with the requested sampling period.
>> + * @MEMLAT_STOP_TIMER: stop all the running monitors.
>> + * @MEMLAT_SET_EFFECTIVE_FREQ_METHOD: set the method used to determine cpu frequency.
>> + */
>> +enum scmi_memlat_protocol_cmd {
> 
> Don't use "enum" when you don't mean "enumeration".
> 

Ack, these are fixed SCMI parameter IDs with explicit values and gaps that must
match the firmware, so I'll switch them to #define.

>> +	MEMLAT_SET_MEM_GROUP = 16,
>> +	MEMLAT_SET_MONITOR,
>> +	MEMLAT_SET_COMMON_EV_MAP,
>> +	MEMLAT_SET_GRP_EV_MAP,
>> +	MEMLAT_IPM_CEIL = 23,
>> +	MEMLAT_BE_STALL_FLOOR = 25,
>> +	MEMLAT_SAMPLE_MS = 31,
>> +	MEMLAT_MON_FREQ_MAP,
>> +	MEMLAT_SET_MIN_FREQ,
>> +	MEMLAT_SET_MAX_FREQ,
>> +	MEMLAT_GET_CUR_FREQ,
>> +	MEMLAT_START_TIMER = 36,
>> +	MEMLAT_STOP_TIMER,
>> +	MEMLAT_SET_EFFECTIVE_FREQ_METHOD = 39,
>> +};
>> +
>> +struct cpucp_map_table {
>> +	__le16 v1;
>> +	__le16 v2;
> 
> v1 v2?
> 
> As far as I can tell these two numbers are cpu and memory frequency.
> 

v1 is CPU freq and v2 is memory freq (both in MHz). I'll rename them
accordingly.

>> +};
>> +
>> +struct map_param_msg {
>> +	__le32 hw_type;
>> +	__le32 mon_idx;
>> +	__le32 nr_rows;
>> +	struct cpucp_map_table tbl[MAX_MAP_ENTRIES];
>> +} __packed;
> 
> Does this really need the __packed? And if so, why is the only message
> that you explicitly mark as packed?
> 

It doesn't. I'll drop the __packed so all the message structs are consistent.

>> +
>> +struct node_msg {
>> +	__le32 cpumask;
>> +	__le32 hw_type;
>> +	__le32 mon_type;
>> +	__le32 mon_idx;
>> +	char mon_name[MAX_NAME_LEN];
>> +};
>> +
>> +struct scalar_param_msg {
>> +	__le32 hw_type;
>> +	__le32 mon_idx;
>> +	__le32 val;
>> +};
>> +
>> +struct ev_map_msg {
>> +	__le32 num_evs;
>> +	__le32 hw_type;
>> +	__le32 cid[NUM_COMMON_EVS];
>> +};
>> +
>> +struct scmi_qcom_memlat_map {
>> +	unsigned int cpufreq_mhz;
>> +	unsigned int memfreq_khz;
> 
> unit soup
> 

Same fix as above, will make both MHz.

>> +};
>> +
>> +struct scmi_qcom_monitor_info {
>> +	struct scmi_qcom_memlat_map *freq_map;
>> +	char name[MAX_NAME_LEN];
>> +	u32 mon_idx;
>> +	u32 mon_type;
>> +	u32 ipm_ceil;
>> +	u32 be_stall_floor;
>> +	u32 mask;
>> +	u32 freq_map_len;
> 
> Most of these values are merely copied from const tables to heap on
> probe - verbatim - and then put in messages. Would it be possible to
> just reference the static configuration, or are the any dynamic aspects
> that I'm missing?
> 

Apart from sample_ms, there's nothing dynamic here, it really is just a copy.
I'll build the messages directly from the const config instead of staging it
in heap structs, which also removes most of the allocation and cleanup below.

>> +};
>> +
>> +struct scmi_qcom_memory_info {
>> +	struct scmi_qcom_monitor_info **monitor;
>> +	u32 hw_type;
>> +	int monitor_cnt;
> 
> Why signed?
> 

Ack, will make unsigned.

>> +	u32 min_freq;
>> +	u32 max_freq;
> 
> Throughout the driver we see frequencies expressed in mhz, khz, and hz.
> Suffix these to help the reader.
> 

Ack

>> +	struct devfreq_dev_profile profile;
>> +	struct devfreq *devfreq;
>> +	struct platform_device *pdev;
>> +	struct scmi_protocol_handle *ph;
>> +	const struct qcom_generic_ext_ops *ops;
>> +};
>> +
>> +struct scmi_qcom_memlat_info {
>> +	struct scmi_protocol_handle *ph;
>> +	const struct qcom_generic_ext_ops *ops;
>> +	const struct scmi_qcom_memlat_cfg_data *cfg_data;
>> +	struct scmi_qcom_memory_info **memory;
>> +	u32 cpucp_freq_method;
>> +	u32 cpucp_sample_ms;
>> +	int memory_cnt;
> 
> Sounds like an unsigned to me
> 

Ack

>> +};
>> +
>> +static int configure_cpucp_common_events(struct scmi_qcom_memlat_info *info,
>> +					 const struct scmi_qcom_memlat_cfg_data *cfg_data)
>> +{
>> +	const struct qcom_generic_ext_ops *ops = info->ops;
>> +	struct ev_map_msg msg = {};
>> +	int i;
>> +
>> +	msg.num_evs = cpu_to_le32(NUM_COMMON_EVS);
>> +	/* Common events apply to all groups; INVALID_IDX flags "no specific group". */
> 
> Does hw_type of INVALID_IDX mean "all groups", or "any (no specific)
> group"?
> 
> Is the protocol defined that you pass "invalid index" for both hw_type
> and cid? Or do we just reuse the INVALID_IDX define because it happens
> to have the right value?
> 
> Why not "#define HW_TYPE_ALL 0xff"? Then you can skip the second half of
> the comment above, which only purpose is to clarify why the code looks
> "wrong".
> 

Common events apply to every group, so hw_type is a don't-care here.
Reusing INVALID_IDX was just convenient. I'll add a named #define
HW_TYPE_ALL 0xff and drop the apologetic comment.

>> +	msg.hw_type = cpu_to_le32(INVALID_IDX);
>> +	for (i = 0; i < NUM_COMMON_EVS; i++)
>> +		msg.cid[i] = cpu_to_le32(cfg_data->common_ev[i]);
>> +
>> +	return ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR,
> 
> This is always info->ops->set_param(info->ph, ..., ..., MEMLAT_ALGO_STR,
> ...), why not create a helper unction that takes info, the command,
> message and size instead?
> 
> Would make the code less noisy.
> 

Ack, I'll add a small wrapper (memlat_set_param(info, cmd, msg, size)) and use
it throughout.

>> +			      MEMLAT_SET_COMMON_EV_MAP);
>> +}
>> +
>> +static int configure_cpucp_grp(struct device *dev, struct scmi_qcom_memlat_info *info,
>> +			       const struct scmi_qcom_memlat_cfg_data *cfg_data,
>> +			       int memory_index)
>> +{
>> +	const u32 *grp_ev = cfg_data->memory_cfg[memory_index].grp_ev;
>> +	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
>> +	const struct qcom_generic_ext_ops *ops = info->ops;
>> +	struct ev_map_msg ev_msg = {};
>> +	struct node_msg msg = {};
>> +	int ret;
>> +	int i;
>> +
>> +	msg.cpumask = cpu_to_le32(*cpumask_bits(cpu_possible_mask));
>> +	msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	msg.mon_type = 0;
>> +	msg.mon_idx = 0;
>> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MEM_GROUP);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to configure mem type %d\n",
>> +				     memory->hw_type);
>> +
>> +	ev_msg.num_evs = cpu_to_le32(NUM_GRP_EVS);
>> +	ev_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	for (i = 0; i < NUM_GRP_EVS; i++)
>> +		ev_msg.cid[i] = cpu_to_le32(grp_ev[i]);
>> +
>> +	ret = ops->set_param(info->ph, &ev_msg, sizeof(ev_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_SET_GRP_EV_MAP);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to configure event map for mem type %d\n",
>> +				     memory->hw_type);
>> +
>> +	return ret;
>> +}
>> +
>> +static int configure_cpucp_mon(struct device *dev, struct scmi_qcom_memlat_info *info,
>> +			       int memory_index, int monitor_index)
>> +{
>> +	const struct qcom_generic_ext_ops *ops = info->ops;
>> +	struct scmi_qcom_memory_info *memory = info->memory[memory_index];
>> +	struct scmi_qcom_monitor_info *monitor = memory->monitor[monitor_index];
>> +	struct scalar_param_msg scalar_msg = {};
>> +	struct map_param_msg map_msg = {};
>> +	struct node_msg msg = {};
> 
> So you have scalar_msg, map_msg, and msg... Why is "msg" just "msg" and
> not "node_msg", is it special?
> 
> If you made scalar_param_msg the "msg" instead, this function would be
> significantly less characters :)
> 
> In fact, is it significant that these local variables are denoted to be
> messages? If you name them "scalar", "map" and "node" you will reduce
> the noise below quite a bit.
> 
> Same goes for all other functions that has multiple messages - where the
> message type is the more significant fact, and you choose to name the
> variable "this is a message".
> 

Ack, I'll rename to scalar/map/node (dropping the _msg suffix) here and in the
other functions that hold several or maybe drop this entirely.

>> +	int ret;
>> +	int i;
>> +
>> +	msg.cpumask = cpu_to_le32(monitor->mask);
>> +	msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	msg.mon_type = cpu_to_le32(monitor->mon_type);
>> +	msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	strscpy(msg.mon_name, monitor->name, sizeof(msg.mon_name));
>> +	ret = ops->set_param(info->ph, &msg, sizeof(msg), MEMLAT_ALGO_STR, MEMLAT_SET_MONITOR);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to configure monitor %s\n",
>> +				     monitor->name);
>> +
>> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	scalar_msg.val = cpu_to_le32(monitor->ipm_ceil);
>> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_IPM_CEIL);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to set ipm ceil for %s\n",
>> +				     monitor->name);
>> +
>> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	scalar_msg.val = cpu_to_le32(monitor->be_stall_floor);
>> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_BE_STALL_FLOOR);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to set be_stall_floor for %s\n",
>> +				     monitor->name);
>> +
>> +	map_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	map_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	map_msg.nr_rows = cpu_to_le32(monitor->freq_map_len);
>> +	for (i = 0; i < monitor->freq_map_len; i++) {
>> +		map_msg.tbl[i].v1 = cpu_to_le16(monitor->freq_map[i].cpufreq_mhz);
>> +
>> +		/*
>> +		 * Wire format v2 is u16 in MHz; convert from kHz.
> 
> Why is the freq_map cpufreq defined in MHz, but the memfreq in kHz - and
> then we convert the memory frequency to MHz before we write it?
> 
> Why are they not both defined in MHz?
> 

Ack, Firmware expects both values in MHz so I'll make memfreq as MHz in header
as well.

>> For DDR_QOS
>> +		 * the table holds level indices (0 / 1) rather than real
>> +		 * frequencies, so pass them through unchanged.
> 
> "holds level indices", "pass them through unchanged"? What are you
> trying to say?
> 

I meant: for DDR_QOS these are 0/1 levels, not frequencies, so don't divide
them. Won't need this anyway.

>> +		 */
>> +		if (monitor->freq_map[i].memfreq_khz > 1)
> 
> If you change memfreq_khz to memfreq_mhz you can remove the whole
> comment, the condition, as well as the divide. There might be a reason
> for you to do this, but the comment is poor, so I simply can't tell.
> 

Ack

>> +			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz / 1000);
>> +		else
>> +			map_msg.tbl[i].v2 = cpu_to_le16(monitor->freq_map[i].memfreq_khz);
>> +	}
>> +	ret = ops->set_param(info->ph, &map_msg, sizeof(map_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_MON_FREQ_MAP);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to configure freq_map for %s\n",
>> +				     monitor->name);
>> +
>> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	scalar_msg.val = cpu_to_le32(memory->min_freq);
>> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_SET_MIN_FREQ);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to set min_freq for %s\n",
>> +				     monitor->name);
>> +
>> +	scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +	scalar_msg.mon_idx = cpu_to_le32(monitor->mon_idx);
>> +	scalar_msg.val = cpu_to_le32(memory->max_freq);
>> +	ret = ops->set_param(info->ph, &scalar_msg, sizeof(scalar_msg), MEMLAT_ALGO_STR,
>> +			     MEMLAT_SET_MAX_FREQ);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to set max_freq for %s\n", monitor->name);
>> +
>> +	return ret;
>> +}
>> +
>> +static int scmi_qcom_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
>> +{
>> +	struct scmi_qcom_memory_info *memory = dev_get_drvdata(dev);
>> +	const struct qcom_generic_ext_ops *ops = memory->ops;
>> +	struct scalar_param_msg scalar_msg = {};
>> +	u32 max_freq_khz = 0;
>> +	__le32 cur_freq;
>> +	int ret, i;
>> +
>> +	/*
>> +	 * MEMLAT_GET_CUR_FREQ returns target_freq for a single (hw_type,
>> +	 * mon_idx) tuple. The bus's actual voted frequency is the max across
>> +	 * all configured monitors in the group, so query each one and pick
>> +	 * the highest vote.
> 
> You can say this with fewer words.
> 

Ack

>> +	 */
>> +	for (i = 0; i < memory->monitor_cnt; i++) {
>> +		scalar_msg.hw_type = cpu_to_le32(memory->hw_type);
>> +		scalar_msg.mon_idx = cpu_to_le32(memory->monitor[i]->mon_idx);
>> +		scalar_msg.val = 0;
>> +
>> +		ret = ops->get_param(memory->ph, &scalar_msg, sizeof(scalar_msg),
>> +				     MEMLAT_ALGO_STR, MEMLAT_GET_CUR_FREQ,
>> +				     sizeof(cur_freq));
>> +		if (ret < 0) {
>> +			dev_err(dev, "failed to get current frequency for %s\n",
>> +				memory->monitor[i]->name);
>> +			return ret;
> 
> We're grabbing a bunch of these, is it really fatal if one fails?
> 

No, it's a poll callback, so bailing on one failed monitor query is too
harsh. I'll skip the failing monitor and keep aggregating the rest.

>> +		}
>> +
>> +		/* qcom_scmi_common_xfer() returns the response into the same tx buffer. */
> 
> What is qcom_scmi_common_xfer()?
> 
> You can express in C the fact that msg is a in/out - by declaring it as
> a union.
> 
> That way you don't need a comment to describe why you're reinterpreting
> the first 4 bytes of msg as the result of the query.
> 

It's the internal transport that reuses the tx buffer for the response. I'll
try to express the in/out with a union (request struct plus a __le32
response) so the reinterpret is self-documenting and the memcpy and comment
can go.

>> +		memcpy(&cur_freq, &scalar_msg, sizeof(cur_freq));
>> +		if (le32_to_cpu(cur_freq) > max_freq_khz)
>> +			max_freq_khz = le32_to_cpu(cur_freq);
> 
> And you could then le32_to_cpu() out of the union to a local variable
> once, to avoid the double le32_to_cpu().
> 

Ack

>> +	}
>> +
>> +	/*
>> +	 * Frequency-scaled buses (DDR/LLCC) report cur_freq in kHz; convert
>> +	 * to Hz to match the devfreq OPP table units. Level-based buses
>> +	 * (e.g. DDR_QOS_COMPUTE) configure max_freq == 1 because the firmware
>> +	 * reports a 0/1 level rather than a frequency, and the matching
>> +	 * synthetic OPP keys (1 / 100) live in glymur_ddr_qos_table.
> 
> You surely don't need 5 lines of solid text to express this.
> 

Ack, will cut it down to a line or two.

>> +	 */
>> +	if (memory->max_freq > 1)
>> +		*freq = max_freq_khz * 1000UL;
>> +	else
>> +		*freq = max_freq_khz ? 100 : 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static void scmi_qcom_memlat_unwind(struct scmi_qcom_memlat_info *info, int count)
>> +{
>> +	for (int i = 0; i < count; i++) {
>> +		struct scmi_qcom_memory_info *memory = info->memory[i];
>> +
>> +		if (IS_ERR_OR_NULL(memory) || IS_ERR_OR_NULL(memory->pdev))
> 
> I don't get it, how can "memory" be IS_ERR()? Isn't it the result of the
> devm_kcalloc() in scmi_qcom_memlat_parse_cfg()?
> 

Ack, I'll use a plain !memory check (or drop it once the cleanup is
restructured).

>> +			continue;
>> +
>> +		dev_pm_opp_remove_all_dynamic(&memory->pdev->dev);
>> +		platform_device_unregister(memory->pdev);
>> +	}
>> +}
>> +
>> +static int scmi_qcom_memlat_configure_events(struct scmi_device *sdev,
>> +					     struct scmi_qcom_memlat_info *info)
>> +{
>> +	const struct qcom_generic_ext_ops *ops = info->ops;
>> +	struct scmi_protocol_handle *ph = info->ph;
>> +	__le32 sample_ms, freq_method;
>> +	int i, j, ret;
>> +
>> +	/* Configure common events ids */
>> +	ret = configure_cpucp_common_events(info, info->cfg_data);
>> +	if (ret < 0)
>> +		return dev_err_probe(&sdev->dev, ret, "failed to configure common events\n");
>> +
>> +	for (i = 0; i < info->memory_cnt; i++) {
>> +		/* Configure per group parameters */
>> +		ret = configure_cpucp_grp(&sdev->dev, info, info->cfg_data, i);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		for (j = 0; j < info->memory[i]->monitor_cnt; j++) {
>> +			/* Configure per monitor parameters */
>> +			ret = configure_cpucp_mon(&sdev->dev, info, i, j);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	/* Set loop sampling time */
>> +	sample_ms = cpu_to_le32(info->cpucp_sample_ms);
>> +	ret = ops->set_param(ph, &sample_ms, sizeof(sample_ms),
>> +			     MEMLAT_ALGO_STR, MEMLAT_SAMPLE_MS);
>> +	if (ret < 0)
>> +		return dev_err_probe(&sdev->dev, ret, "failed to set sample_ms\n");
>> +
>> +	/* Set the effective cpu frequency calculation method */
>> +	freq_method = cpu_to_le32(info->cpucp_freq_method);
>> +	ret = ops->set_param(ph, &freq_method, sizeof(freq_method),
>> +			     MEMLAT_ALGO_STR, MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
>> +	if (ret < 0)
>> +		return dev_err_probe(&sdev->dev, ret,
>> +				     "failed to set effective frequency calc method\n");
>> +
>> +	/* Start sampling and voting timer */
>> +	ret = ops->start_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_START_TIMER);
>> +	if (ret < 0)
>> +		return dev_err_probe(&sdev->dev, ret, "failed to start memory group timer\n");
>> +
>> +	for (i = 0; i < info->memory_cnt; i++) {
>> +		struct scmi_qcom_memory_info *memory = info->memory[i];
>> +		struct platform_device *pdev = memory->pdev;
>> +		struct devfreq_dev_profile *profile = &memory->profile;
>> +
>> +		/* sampling time should be double the devfreq observing time */
> 
> That's interesting, tell me more...
> 

This follows Lukasz's earlier point on Nyquist criterion: sample about 2x
faster than the changes you want to observe. CPUCP updates every
cpucp_sample_ms, so the devfreq poll runs at half that (sample_ms / 2) to
actually catch the transitions in trans_stat.

>> +		profile->polling_ms = max(1U, info->cpucp_sample_ms / 2);
>> +		profile->get_cur_freq = scmi_qcom_devfreq_get_cur_freq;
>> +		profile->initial_freq = memory->min_freq > 1 ?
>> +					(memory->min_freq * 1000UL) : memory->min_freq;
> 
> What is the purpose of this conditional?
> 
> You support memories with an actual frequency, and what you call
> "level". But for any memory with a "level" resource other than a boolean
> this logic fails.
> 
> For min_freq == 0 we get initial_freq of 0, both for frequency-based and
> level-based memories.
> 
> So the only case where this actually does anything is if you have a
> boolean resource with minimum value of 1 (i.e. a constant). Do we have
> those?
> 

The guard just separates DDR_QOS (level-based) from the frequency buses: for
DDR/LLCC, devfreq wants Hz, so initial_freq = min_freq * 1000, while
DDR_QOS passes its value through as-is.

>> +
>> +		platform_set_drvdata(pdev, memory);
>> +
>> +		memory->devfreq = devm_devfreq_add_device(&pdev->dev, profile,
>> +							  DEVFREQ_GOV_REMOTE, NULL);
>> +		if (IS_ERR(memory->devfreq)) {
>> +			dev_err(&sdev->dev, "failed to add devfreq device\n");
> 
> I personally don't like all the dev_err_probe() that you have sprinkled
> throughout the driver, but I know that many others do - and this one
> isn't consistent.
> 

Ack, I'll use dev_err_probe uniformly on the probe paths.

>> +			/* Stop sampling and voting timer */
>> +			ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
>> +			if (ret < 0)
>> +				dev_err_probe(&sdev->dev, ret,
>> +					      "failed to stop memory group timer\n");
> 
> The significant event is that adding the devfreq device failed, but the
> error message that you retain is "failed to stop memory group timer"...
> 

I am already capturing devfreq failure just above. This is inside that scope.
Do you want me to drop this? 

>> +			return PTR_ERR(memory->devfreq);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct scmi_qcom_memlat_map *
>> +scmi_qcom_parse_memlat_map(struct device *dev, const struct scmi_qcom_monitor_cfg *mon_cfg)
>> +{
>> +	struct scmi_qcom_memlat_map *map_table;
>> +	const struct scmi_qcom_map_table *table;
>> +
>> +	if (mon_cfg->table_len > MAX_MAP_ENTRIES)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	map_table = devm_kcalloc(dev, mon_cfg->table_len, sizeof(*map_table),
>> +				 GFP_KERNEL);
>> +	if (!map_table)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for (int i = 0; i < mon_cfg->table_len; i++) {
>> +		table = &mon_cfg->table[i];
>> +
>> +		map_table[i].cpufreq_mhz = table->cpu_freq;
>> +		map_table[i].memfreq_khz = table->mem_freq;
>> +	}
>> +
>> +	return map_table;
>> +}
>> +
>> +static const struct of_device_id scmi_qcom_memlat_configs[] = {
>> +	{ .compatible = "qcom,glymur", .data = &glymur_memlat_data},
>> +	{ .compatible = "qcom,mahua", .data = &glymur_memlat_data},
>> +	{ .compatible = "qcom,x1e80100", .data = &hamoa_memlat_data},
>> +	{ .compatible = "qcom,x1p42100", .data = &hamoa_memlat_data},
>> +	{ }
>> +};
>> +
>> +static int scmi_qcom_memlat_parse_cfg(struct scmi_device *sdev, struct scmi_qcom_memlat_info *info)
>> +{
>> +	const struct scmi_qcom_memlat_cfg_data *cfg_data;
>> +	struct scmi_qcom_monitor_info *monitor;
>> +	struct scmi_qcom_memory_info *memory;
>> +	int ret, i, j;
>> +
>> +	cfg_data = of_machine_get_match_data(scmi_qcom_memlat_configs);
>> +	if (!cfg_data) {
>> +		/*
>> +		 * The SCMI generic-ext protocol can bind on Qualcomm SoCs that
>> +		 * do not ship CPUCP memlat. Bail out quietly in that case rather
>> +		 * than printing an error on every such system.
>> +		 */
>> +		dev_dbg(&sdev->dev, "no memlat config data for this platform\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	info->memory = devm_kcalloc(&sdev->dev, cfg_data->memory_cnt,
>> +				    sizeof(*info->memory), GFP_KERNEL);
>> +	if (!info->memory)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < cfg_data->memory_cnt; i++) {
>> +		const struct scmi_qcom_memory_cfg *memory_cfg = &cfg_data->memory_cfg[i];
>> +		struct platform_device_info pdevinfo = { 0 };
>> +
>> +		pdevinfo.parent = &sdev->dev;
>> +		pdevinfo.name = memory_cfg->name;
>> +		pdevinfo.id = PLATFORM_DEVID_NONE;
>> +
>> +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
>> +		if (!memory)
>> +			return -ENOMEM;
>> +
>> +		memory->ops = info->ops;
>> +		memory->ph = info->ph;
>> +		memory->hw_type = memory_cfg->memory_type;
>> +		memory->monitor_cnt = memory_cfg->monitor_cnt;
>> +		memory->min_freq = memory_cfg->memory_range.min_freq;
>> +		memory->max_freq = memory_cfg->memory_range.max_freq;
>> +
>> +		memory->pdev = platform_device_register_full(&pdevinfo);
> 
> Why are there platform_devices in here?
> 
> I'm guessing that you want the struct devices to hang the opp tables
> off? But why a whole platform_device?
> 

Yes, I'll try to explore a lighter alternative.

>> +		if (IS_ERR(memory->pdev))
>> +			return dev_err_probe(&sdev->dev, PTR_ERR(memory->pdev),
>> +					     "failed to register platform device\n");
>> +
>> +		info->memory[i] = memory;
>> +		/* Track progress so probe() can unwind on a later failure. */
> 
> Please clean up your own mess. If this function becomes too long for you
> to be able to get things in order, that's just another indication that
> you need to refactor this function.
> 

Ack, I'll refactor so each function unwinds its own partial work on error, and
drop the external progress counter.

>> +		info->memory_cnt = i + 1;
>> +
>> +		for (j = 0; j < memory_cfg->num_opps; j++) {
>> +			const struct scmi_qcom_opp_data *table = &memory_cfg->mem_table[j];
>> +			struct platform_device *pdev = memory->pdev;
>> +			struct dev_pm_opp_data data = {};
>> +
>> +			data.freq = table->freq;
>> +			data.level = table->level;
>> +
>> +			ret = dev_pm_opp_add_dynamic(&pdev->dev, &data);
>> +			if (ret)
>> +				return dev_err_probe(&sdev->dev, ret, "failed to add OPP\n");
>> +		}
>> +
>> +		memory->monitor = devm_kcalloc(&sdev->dev, memory_cfg->monitor_cnt,
>> +					       sizeof(*memory->monitor), GFP_KERNEL);
>> +		if (!memory->monitor)
>> +			return -ENOMEM;
>> +
>> +		for (j = 0; j < memory_cfg->monitor_cnt; j++) {
>> +			const struct scmi_qcom_monitor_cfg *mon_cfg = &memory_cfg->monitor_cfg[j];
>> +
>> +			monitor = devm_kzalloc(&sdev->dev, sizeof(*monitor), GFP_KERNEL);
>> +			if (!monitor)
>> +				return -ENOMEM;
>> +
>> +			monitor->ipm_ceil = mon_cfg->ipm_ceil;
>> +			/* mon_type 0 = IPM-based latency monitor; 1 = stall-only (compute) */
>> +			monitor->mon_type = monitor->ipm_ceil ? 0 : 1;
> 
> So the actual mon_type in the message is just a 0 or 1? Is this 0 the
> same as the 0 in configure_cpucp_grp()? Should we have a couple of
> defines for these - instead of the comment?
> 

It's just latency(0)/compute(1). I'll make it a bool is_compute in the
driver too and drop the magic 0/1 and the comment. The mon_type/mon_idx
in configure_cpucp_grp is a don't-care, I'll stop reusing a bare 0 there.

>> +			monitor->be_stall_floor = mon_cfg->be_stall_floor;
>> +			monitor->mask = mon_cfg->cpu_mask;
>> +			monitor->freq_map_len = mon_cfg->table_len;
>> +
>> +			monitor->freq_map = scmi_qcom_parse_memlat_map(&sdev->dev, mon_cfg);
> 
> It might be a good idea to do this before you're starting to register
> platform_devices and opps, as it would simplify the cleanup.
> 

Ack

>> +			if (IS_ERR(monitor->freq_map))
>> +				return dev_err_probe(&sdev->dev, PTR_ERR(monitor->freq_map),
>> +						     "failed to populate cpufreq-memfreq map\n");
> 
> There are two ways scmi_qcom_parse_memlat_map() can fail, either the
> driver data is wrong and you get EINVAL (a developer BUG) or you get
> ENOMEM, which is already printed...
> 

Ack, will drop this.

>> +
>> +			strscpy(monitor->name, mon_cfg->name, sizeof(monitor->name));
> 
> Do you really need a copy? As far as I can see the next access is
> another copy out of this struct.
> 

No, it's redundant. Once messages are built from the const config directly,
I'll reference mon_cfg->name and drop the intermediate copy.

>> +			monitor->mon_idx = j;
>> +			memory->monitor[j] = monitor;
>> +		}
>> +	}
>> +
>> +	info->cfg_data = cfg_data;
>> +	info->cpucp_freq_method = cfg_data->cpucp_freq_method;
>> +	info->cpucp_sample_ms = cfg_data->cpucp_sample_ms;
> 
> So much code just moving data between two representations...
> 

Ack, Building messages straight from the const config collapses the two
representations and removes most of this function.

>> +
>> +	return 0;
>> +}
>> +
>> +static int scmi_qcom_devfreq_memlat_probe(struct scmi_device *sdev)
>> +{
>> +	const struct scmi_handle *handle = sdev->handle;
>> +	const struct qcom_generic_ext_ops *ops;
>> +	struct scmi_qcom_memlat_info *info;
>> +	struct scmi_protocol_handle *ph;
>> +	int ret;
>> +
>> +	if (!handle)
>> +		return -ENODEV;
>> +
>> +	info = devm_kzalloc(&sdev->dev, sizeof(*info), GFP_KERNEL);
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_QCOM_GENERIC, &ph);
>> +	if (IS_ERR(ops))
>> +		return PTR_ERR(ops);
>> +
>> +	info->ops = ops;
>> +	info->ph = ph;
>> +
>> +	ret = scmi_qcom_memlat_parse_cfg(sdev, info);
>> +	if (ret) {
>> +		scmi_qcom_memlat_unwind(info, info->memory_cnt);
> 
> scmi_qcom_memlat_unwind() unwinds the work done by
> scmi_qcom_memlat_parse_cfg(), this isn't really idiomatic. Please have
> scmi_qcom_memlat_parse_cfg() clean up its own mess on failure.
> 

Ack. The non-devm bits (platform_device_register_full and
dev_pm_opp_add_dynamic) are why the external unwind exists, I'll handle those
inside the function's own error paths.

>> +		return ret;
>> +	}
>> +
>> +	ret = scmi_qcom_memlat_configure_events(sdev, info);
>> +	if (ret) {
>> +		scmi_qcom_memlat_unwind(info, info->memory_cnt);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(&sdev->dev, info);
>> +
>> +	return ret;
>> +}
>> +
>> +static void scmi_qcom_devfreq_memlat_remove(struct scmi_device *sdev)
>> +{
>> +	struct scmi_qcom_memlat_info *info = dev_get_drvdata(&sdev->dev);
>> +	struct scmi_protocol_handle *ph;
>> +	const struct qcom_generic_ext_ops *ops;
>> +	int ret;
>> +
>> +	if (!info)
> 
> How is that possible?
> 

It isn't, probe always sets drvdata to a valid info on success. I'll drop the
!info check.

>> +		return;
>> +
>> +	ph = info->ph;
>> +	ops = info->ops;
>> +
>> +	ret = ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
>> +	if (ret < 0)
>> +		dev_err(&sdev->dev, "failed to stop memory group timer\n");
>> +
>> +	scmi_qcom_memlat_unwind(info, info->memory_cnt);
>> +}
>> +
>> +static const struct scmi_device_id scmi_id_table[] = {
>> +	{ SCMI_PROTOCOL_QCOM_GENERIC, "qcom-generic-ext" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>> +
>> +static struct scmi_driver scmi_qcom_devfreq_memlat_driver = {
>> +	.name		= "scmi-qcom-devfreq-memlat",
>> +	.probe		= scmi_qcom_devfreq_memlat_probe,
>> +	.remove		= scmi_qcom_devfreq_memlat_remove,
>> +	.id_table	= scmi_id_table,
>> +};
>> +module_scmi_driver(scmi_qcom_devfreq_memlat_driver);
>> +
>> +MODULE_AUTHOR("Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("SCMI QCOM DEVFREQ MEMLAT driver");
> 
> Let go of the shift key!
> 
> s/QCOM/Qualcomm/ at least.
> 
> Regards,
> Bjorn
> 

Ack, I'll change it to sentence case: "Qualcomm SCMI memlat devfreq driver".
Thanks for reviewing this!

-Pragnesh

>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>


