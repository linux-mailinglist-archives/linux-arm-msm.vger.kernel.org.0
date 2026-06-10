Return-Path: <linux-arm-msm+bounces-112325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p297MYkVKWqlQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AF666B59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="cdCFdCN/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MDLJLQ48;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112325-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112325-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0094E3021E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2399E374A17;
	Wed, 10 Jun 2026 07:36:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678F371067
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077019; cv=none; b=W9zScMvKXOrM7Z/kIoJWu7LNWuPVW2+K0rIh/lR1+fT95KqXmRkjTGEV9GdTasIMYOA6p94Elx+pAsTDRbzmjt/iqcrgBWTEoZtx6/06+nfio5a1MIqnkZLSTytkGWmA3BzZFdssxRREFXenc9Nv/jsDxVvlQQ+oH80CNL/ZIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077019; c=relaxed/simple;
	bh=w1EqAl9oC6gy9TGFnBAmf+O1ebSOZtRQoo+gPKAV2YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+d6fjhj8RIlSnyv+jsOrXFWGA+B7ueVf2/S9mlCpj3UbC6DWI4pgSUXPCeyVSU44mE5UC49vdTrss/pLoyvgwBRUsPWOkJ508MRlZgLvyVhyVaO4ifTJ45ocIpzd1OeY/8TjikO1QLGqobCk/B1IDkTIUnAqZaaiDh+BaRgR6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdCFdCN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDLJLQ48; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45IXf387503
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TvlMZYZTNJ+ViXfGDLpDEfqok6DEulBwZlUpy+zIAk=; b=cdCFdCN/auu6SSBP
	xPYbfwmoqoMNg5trvNsdnKboi+9fHvzVGBNkBgYn48iYq+fNTF8NNrkLTwa5yp9L
	SDMPRS7VKdfnLfvVa1Z0DXEUlAotxEzl05dbdHdnCF4rQVyGdxlbfbufroj39Hda
	5zFVfrud2YgDDM3Tq7xIj65T/Iw+pkSDJykyko9H8+GTXL+DF6/8VIACXsEJCl0A
	4fwS3vHIKzO0iUBvtSwU35Q8wtTmORYeg8IuK8suHDwo7gbqIoUeIVTf2Bc3aX5q
	/t5+NLEdj2l+RJrzv7ueOSVBRIECBfhJxT9SePO6Fh3CtaObDdH4C1zDUx5kcHEf
	plRM5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8puf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:36:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cecb6dee57so136985206d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781077015; x=1781681815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3TvlMZYZTNJ+ViXfGDLpDEfqok6DEulBwZlUpy+zIAk=;
        b=MDLJLQ48GnXXnw+p67Z+o40NpnUNImWtKK4AhbUoPKC5HVaqLZNXVlcp9u7ITccVWW
         13Gf80rbdU/cMMHxdmEgteEG9hAwO+xlrkmMeDbjSxODy8ylyUNAjQzP3HKxZVZyvNol
         H4RDVroNQLLCszx6SMzNwNMTbBHcSe7HiASFrl4UoOnvJnvIpsEYX4xZExh/N9JiSPFu
         ghBCv/3yfuAAE+HaG87vKUxfn3SwDJ7rXwrFnSyD6cl2WO8Y41pnDFTlw2uEMxZTYDKu
         me0j0mROEU6Xi5uH5xLLOBOAssgWKYmzf4gSkJ906mmFsaKJfwuFRxoPM06U5mWigRWP
         ge9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077015; x=1781681815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TvlMZYZTNJ+ViXfGDLpDEfqok6DEulBwZlUpy+zIAk=;
        b=ccQO7hGvDyxG/jbZqjkHOnh6ZTc5ioEpUJriYfMpJfFt2EJzDiGmWpLYb7HdK/0vFl
         PimnA601W/H/Rf1LZhKLwd5m3QFGJVkc8/AqAyfdc0u7o98hrXmcl70Lh13ioqJABJU0
         YzeMzFuoW2p13sx8mCapOA6eZgZBNCBXvYn1KX+ICmEhrnq+sinj7ccLW5Wjf4HOBtup
         6mwYbps1kXXfpVSMZnR3aLqvc9Mx0dtL2xle5BB/3UdIO5TRGrQ8M5IcMtjAkz1ajrNw
         wlfDU5Ct8Tf56aZnwJ7xKyUPHPAZAqC4CpsY/Vsz90rwep17s4GgloJwG+yhwyD3tSJ1
         T27g==
X-Gm-Message-State: AOJu0YwCoAmLWPfTWxNLgf/ReuPwQ9GnVIEvBOD2S2Fy9kXJrjHHY12y
	CvaS2hU9ZdIC0QGB6IzIVxIkkAc28uRFwgsz+tEnUyitxFhU+q3NeezisKGaw90Hs6yeP7oj9P7
	k/6OvDiSW/koU2+E3SnoN/u7oGcTzzAu2OKrNHnwlwIrUrIvQfL+v8Gx4j9krsRT1IFi4
X-Gm-Gg: Acq92OFyYMAYW14ovdWFkQ2o7kHAtvrGshFqcx9LAqS+y63p9P8yUBLwArMXj/FCLs5
	Cn1IwhC90FFF83QurIywSvvwyYn8y5UAVcbDA2PF9Kv5wmuU0pMgNZMI5uupIVLLWP4Qgt9PKRP
	PjRzV1Kk/aS7aRzaVaG2ndjMJOsT4YVg+HQONunlN9IAVOL/HQvgrEK7JU2cldg5+sAhV8llZjY
	MoSNAY7LrRhA4HH7/idD0J6mK+8bda75DEVy7Oer1vPY0mJmD0mT/kA3OsxJa+Iy+Y9zZu1Pwsx
	8122aJxghkxyRfVGVICt2f8pFlILexZZURVdjNfIzRDZZOy07M5D41LjoMItmPIVZoui9L1tWYV
	zvLikmh+0e25zxV7uPxeYmPmonPuHqLKNnAsmenTVAAVWs05SVm9hZ9WAAzQ=
X-Received: by 2002:a05:6214:2aa3:b0:8cb:d479:a103 with SMTP id 6a1803df08f44-8cee8cca594mr268263326d6.20.1781077015552;
        Wed, 10 Jun 2026 00:36:55 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa3:b0:8cb:d479:a103 with SMTP id 6a1803df08f44-8cee8cca594mr268263146d6.20.1781077015170;
        Wed, 10 Jun 2026 00:36:55 -0700 (PDT)
Received: from [10.239.31.31] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fa53sm226999946d6.8.2026.06.10.00.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:36:54 -0700 (PDT)
Message-ID: <c0eee7b4-50ee-4635-b8d6-fe9cb4ea05a8@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:36:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
 <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a291418 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1RIRpg9Uh1mo8reXIgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: f2q17G8upAgndnNpvQuRz7oLI9mHrnpd
X-Proofpoint-ORIG-GUID: f2q17G8upAgndnNpvQuRz7oLI9mHrnpd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3MCBTYWx0ZWRfX3/FXBghasnAv
 LURcsVqxa/Pko3UdP4OtPWdjK66TjUCjWlVZKvchTxLGlvqQM4LqEFPNCXeMQ1kvvyrloq7kEsG
 HbwVNAeQFCPO+Fhta7aHqQFTRiEM5ZzCoGXLuKd6lQlgRN7Cami91Uk+NW41lPEvG+MJN6ldEc+
 WzA3FOsa0rCIrrc3+vlWTgDDYVDTK0OOz5o3Lgq/KzgohRQxCTkSIVWtRDwYCwD9JiGJTNmBtYT
 MUfYs77M+G0yLh72Ov30khblsH3FOkp26qL+DgRPtqyGzXF5XhYjKb2d19vWr0WVfI5XHVCH190
 4FCSAMpiCRcvFGvAUIsCSrryrZXBC2ifvu121jJj3lLtNq4GNhiHd4EeDiErFEjJa67aruH3XON
 +K92l2+s/PVycTUoSJtC/T6lNON+SIUi0Pb68IBw7YZkGCBhewkyninfePKPI1GTOelAPyv9qAs
 K5mugRyOb5iRqYKdK3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100070
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-112325-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,quicinc.com,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiuzhuo.shang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 409AF666B59

Hi Bart,

The main change in v2 was the commit message — I added the motivation and an example log line as

Paul requested on v1. Carrying your Acked-by (given on v1) forward was just to avoid losing it. So

v2 wasn't sent solely to collect a tag.


Thanks,

Xiuzhuo
 

On 6/10/2026 3:07 PM, Bartosz Golaszewski wrote:
> On Wed, 10 Jun 2026 08:42:32 +0200, Xiuzhuo Shang
> <xiuzhuo.shang@oss.qualcomm.com> said:
>> Firmware version is critical for bug triage. Users reporting issues
>> typically share dmesg output rather than debugfs contents, requiring
>> extra communication rounds to collect this information. Log the FW
>> build version directly to the kernel log so it is immediately
>> available in bug reports.
>>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>> ---
> 
> Please don't send a new version if all you did is collected a single tag.
> 
> Bart


