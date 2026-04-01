Return-Path: <linux-arm-msm+bounces-101271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGQnIhDhzGm0XAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:10:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03893377504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6EF7300D9CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA512D9EF4;
	Wed,  1 Apr 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaEIdqqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dT5ECOX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB8387363
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034380; cv=none; b=VcwB/dzezlOmKZqDTcWsCaxLOVhff+NcanaIZaWFtDsFzpmpFz09n6VsQQPZH4NqrtmlPIQihf7H2QvZuetA/ZtgUKdcoWiB0jsMkwCYyD5dJUcMrHb59rXk7ZRN/PM3A4isvE9CqitnXMGzNEadl+BCDFPl41FquHp+2us/3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034380; c=relaxed/simple;
	bh=k0pbKjDMy85aTvHrK9anBROI3T2PgeIlOXsGs//saRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJoDER2l2H992AmpiURnrU2mxJwKqlm7PTFWL1runRumQ2tzqMdVF5KPWPd6trbeDWMK2culUsdcVctJw1u1t47hWm7eTBQU0IjRNb5ae0h31o/Cv709yKwx7cNFvC/c5cfpwO2fWMZTy7EYSsDL1kpLkfyKjZhePxTB42+1iD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaEIdqqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dT5ECOX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ZYWE1005231
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ilyGF00COqNSqFl8rpIGpiKyaB+Too2oQwo4Mjv8e8=; b=LaEIdqqJSpl/X4eK
	cm+kQSjHaNGtXPAl2MV+Ja4SsgRUmPi38GDwaX3hX+Do3cenNEuBitGvMPG3WTgz
	wu/u+zAXC0Mh9i00+dXuLKNq7WUXrlC29WeB8RhnefiAccp7RZdG/6VbgZcBGeeS
	XaEr/XR/s6v9LJzJmnJpgIKvJXRxz4sQ7r44A50Pe0RCb8CNYZpvGocITs6Rjz9Z
	2oI0imNawFzjNzEW3yBZ2CjmeZBcu1bTo0CPOiQs2Rvu9TULRV+CIMBm6SqgRqER
	lTMuUhOfDGroV+48tH1LowGKJm0VPCB5lmhNFf7tI6RNVGNWPoGy/Lx2jEicL2/o
	Y/7B/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhfnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:06:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfda078676so1950651985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034377; x=1775639177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ilyGF00COqNSqFl8rpIGpiKyaB+Too2oQwo4Mjv8e8=;
        b=dT5ECOX4emps6kIQmivAAGYQvjjl5XvYVntV0sUOYK31WiinYnP4afW/VCR6UC3Pl4
         ZN5zBrWkonLyjz2Tf3retTGDjG1xqCyHpjpNQU5+l1uPu3zqtChOSfh1pe88law+dPrD
         fHhHXcLNwTmxDbgVFFdXFa54p8dn3AMGghv7ctM48m8Hhbbf2n1iyFcb8rQd3ZV52sB9
         XrH4YHqVarJhvTSzESZgp1ZDBHtmMxih57O/r+2Blm1d7nmxL2T0tK9F5F9aQFtIijls
         hy18ghA/4Tf21x/YC9l3ecSjdDF9i1HJOs0qYcbvdydj222exW3vjHkxa6TSVXxihnZD
         l6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034377; x=1775639177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ilyGF00COqNSqFl8rpIGpiKyaB+Too2oQwo4Mjv8e8=;
        b=YE3batF6r2S83R9X2vRdSYHFMwetkFjh8cgI8JOZ1iWb4sfWfYCqusQkn+w9qnfVMo
         H15JQrP2ShXRrM1NvWgslEwDdCgaSSxH/cq1K/3Jru1UIYxVDey5bHpG/f+QStMdcFUF
         8SEXlPaEacu8bUO28Iw0+5YFl9ZXBnBpfq91c4ioQy22suJqQdX3cvvpBqHHlK56krhp
         Cek5Xd8oTO38bXmzKeGR1F2EJnvBAVRdsUfHm3LxDX6KwFLyC/PTVzdBDGMxzihu4NQn
         S1A1OtqXI4fWcxaJT1e5M/C2MCsN8JuI88Wtt8qFd5eQm+SL9HHO044jSzw78VkPTRKC
         +ZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtkL0VFazgZbI6+V1shvpDq2fQKHb5Y0Q2t70CB2uOKOIjRpLvGBMU5dM+WwBJs7G58zhnZCS1pXFTYWig@vger.kernel.org
X-Gm-Message-State: AOJu0YyxN3R14psSeJYcsosauJNh7xVgyEtxGN6zPgUqcN2KxgHWMLTu
	miDL6JHvSLoeahx5fDDv7ONcJ5HwnjVTmBRJzvH2zz3VcxZJ94jsHvF68Yp/N0ZKy5VFaEp7OlN
	KowQthP4zu8Ldp0OY0cTx3T4jpUR75a4y7RIWq9fZqVu5XGa5rp3iNF7Ct/BeXyxOa+Es
X-Gm-Gg: ATEYQzyAAPt+IXEkO2H5e/5zTxyCCxC/Qw3KhhIeNMjWL3APwmRvcbOuKepODBuZFjm
	rYLtXO6OuTbaxrg1jD4JFkaQz3CG8Z9pgi51kLY+MmTniBVTP1+ikeXoXfEe8mb0kzO0qMV0DBP
	wgCs2hg/UojBK+27wbgySGh0pSdDsYhX44EEFTVvHF6YRfgHUbp2GfVFag3xlWzqMwaVpCFaNzw
	CPnM/6PAKDJOq/gQep1OZCDToZh4og5D5CbFBQA1XqRiKjUf/8/8kqoaBg5z6jvq5qiG/5rIBGL
	ekd9RjMgCJhE/zOW9sH5sH0lb82QtuSjlUyAJ+8hBhrDgSNzjPniBzOAkONu5hO/xDqio65+cOu
	zXmAoUfQ7DFkZB4YMzKVD8mpvkPWa4+/dTgp/pxiVzlWBjyfu4yb1ZfGgmVfOCGu6bhG2B/sSNm
	DRb7oTCc2FRA==
X-Received: by 2002:a05:620a:4013:b0:8cf:dd4b:8a59 with SMTP id af79cd13be357-8d1b5bf2202mr393811685a.48.1775034377573;
        Wed, 01 Apr 2026 02:06:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:8cf:dd4b:8a59 with SMTP id af79cd13be357-8d1b5bf2202mr393808985a.48.1775034377163;
        Wed, 01 Apr 2026 02:06:17 -0700 (PDT)
Received: from [10.111.173.217] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028041f8esm1081926285a.31.2026.04.01.02.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:06:16 -0700 (PDT)
Message-ID: <13a19a04-9e9a-4846-910d-2aad512e7cdf@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 17:06:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
 <90c88cf7-8873-412f-b14b-cb0f94028194@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <90c88cf7-8873-412f-b14b-cb0f94028194@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E4b5OM61A-LdgpL3UzGV3gdwklffpFxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX2YHfn6XPgAkM
 aq+Tg1HLaZHd3jpg5/8JxLOFQC89wbHhlJfU1f3QOgV+/tFgAEF+akRZqI5mjJwXytUnYfAFMLS
 AKXACGnEgxUSYWXceSfqsJHXyJJaUKD+hCL5uDMdGhBbtS/TVy5VQRLvhuCyctphWsZFM0qFjOC
 xjIYlrA0CJBxR8XvaJOnZccoMnPGICZebnYhadvSE4CvcHUItHLDj9hoOT8IHAmC7tkDageQw2/
 zRvbKud/FcIUfraxc28viD7YnBlbXC6l8h97q5DckDevuBmuyrj3zwD6l3SHcESQWOfFaeTsgOm
 WdHNUtwQA1RE1ioqGkiMObA3S0HKd2MoMfjjq2GMXpgNOeNB1BRxjhifMD37mdWF1fvQNZyR0Yl
 +rsdD9/f2UVJdrKi7w7NljkEOBDrJZEMQM+0sCua8KnFUSisdHuc1K7qNlAbGHtt4oMWnt3T0vW
 bo5QQ9zV0sGWdIrlKNA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce00a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=o6FsmwAvNN4gRaNOWv8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: E4b5OM61A-LdgpL3UzGV3gdwklffpFxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101271-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03893377504
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 5:02 PM, Bryan O'Donoghue wrote:
> On 17/03/2026 10:05, Wenmeng Liu wrote:
>> Tested with following commands:
>> - media-ctl --reset
>> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
>> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
>>    --capture=7
> 
> I get this on Hamoa.
> 
> media-ctl --reset
> 
> media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> Unable to parse link: Invalid argument (22)
> 
> Failing to connect the TPG to the CSID.
> 
> Please resolve.
> 
> ---
> bod

Hi Bryan,

This is a typo,msm_tpg only have 0 pad.

please try media-ctl -l '"msm_tpg0":0->"msm_csid0":0[1]'


Thanks,
Wenmeng

