Return-Path: <linux-arm-msm+bounces-90894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2SarJIiKeWk6xgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:03:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6569CE86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4476F300D4D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D95D2FD7B3;
	Wed, 28 Jan 2026 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdr9VO0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6eNDN8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C71A3029
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572995; cv=none; b=HHOkyJlpGhODlQxMDAZE0oTFWOnXFtOkMTNf2VmAeOXkp4qk/ZpBcBfagLJVYEidjJj1yTuHLg5xD5yjt28kiKsFJmAUZzY9kPekuXSeGFr6Q+V5kmaCOOgLLKpXSvUyJbNCIe8jSwtI0OFnNANDECrn/lAUXNUxWmrHtTk8HDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572995; c=relaxed/simple;
	bh=kB8xsjBTb/gFKpjEArBn86GeVi12fURxDbiZebCBmFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNJCGROijF2Ycn69xNw3t184cbTbeCfYrndtfu69OOLFQZsXF7Hg65GVOZX0Mkb5HubjxoNhRmyN7s3YRb1FNASPrfvVXeLjf/CSjpU3UEmSwsLcqwUQdvJ7eGkbRefTLQv8h+7zejxMHH6qvsiL9yXQp6G28jfmzKfdU3UUS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdr9VO0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6eNDN8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RKRwN14003867
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUoswFlJ+yiIr8sXirOxgbmRv5wfMSzY+cd2zV55w+o=; b=Vdr9VO0sywE/pNOl
	cvkUInN2H/mY+ukQm+6Te9BjAS9eIS6Clv94KXYjt80lk8CESFHoi+tAuzd44KFF
	VZyO+qJcIqwkl/Ss03/kVgfVyc8WZgOOF8KiqsDUIHA1kpgvXAcjTqKbFzdpd/XD
	ZrlM3PDxGbrmVVYZjkZtApcpO5THE/FyXZAfEwXvpF0Dv/OXxf9lsjifLue+s1kF
	s2QS78uBaSscwvHcDnbDUOYbnLrMkHP3U3S+FAnndVEeP2kO4FpqB69nFZU2MlL2
	G3d0YecyOCG7SYawKbZskcVy6VgS0dU4HYFmJTRy7Zzx8UlMJEEe97fVTg5ovmX7
	Fc2R4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dys6jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:03:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b74766fae7so5363955eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769572993; x=1770177793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUoswFlJ+yiIr8sXirOxgbmRv5wfMSzY+cd2zV55w+o=;
        b=C6eNDN8JjWFsLY6yDBB1HWjU7eHRfSlXVb2WMkzjiDG/mxQbpWN9He4YFryW1v3pN/
         /Prss0ZZFDuYl4ZPHitZgSV8jpAj+vDRI9exOUdWwsAqGDQkS5EEQj0OY7QIqsdHG6gf
         jMuk3a3zCp6/fNE5xvzusM06kTOB5P3VvN+oE5i9hUL0YkmB2Hk/SOJnFPrMNwthNvni
         QXYS2rvo5osB6CiQSdiP77coyiSZCBvOHG1C5B/YCZ7cAGZJ6T8Da+AMTXR1oxkGAnBy
         9neAFVnurZDTbjaccAza/YTTkIgkmNvgnqltTNqCjEy4JtDhqMsP8QkCjGKxh8kx0SFl
         Ww8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769572993; x=1770177793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUoswFlJ+yiIr8sXirOxgbmRv5wfMSzY+cd2zV55w+o=;
        b=vvS159sZP+e1gVhCw+GjWLbzkQWDvKTv1V9PM20A2S1APLRMtt0/TBM9YtLc5eCpfE
         Wf5kPraH/yYKKz/Q+Begp1DzMG9XgMog3zsfYChLvBI2Q8Y6m5KPpwuz28Nf5ikX8gXh
         cYtmJra3Isez2f3dpaRsztVeeniLelI2yqI8aGn/hImGFDbaeBjJEFumz0XKvEduSY5b
         NrM/Bna0g+CPwpfHLOiZZ1T40QZXkgSrGFb7ueP5KFdL652Bn0Cz8jsYFfo5uGvdatXr
         pxKjIZ0DJlcdbuIDmJsFVpUfM0BQKFvb+crLZWpLXxAV47XkwhyLqYCABFjPDDsXtSFw
         N1gw==
X-Forwarded-Encrypted: i=1; AJvYcCWaADBZgIhDST6EmI14NJyvPKzLZN1ZScdTnkmdWmzTyqdLqcOHkebeAh2mzHMQfRfQgO3jtJ2LvAfNTuzI@vger.kernel.org
X-Gm-Message-State: AOJu0YyLOdIVixnAtW8UU6c7puZTpPRD8Xnv6yRIGrNUx273obxQuMmh
	ttDWF9UTOaArMLVXiTPkkLflZRBjwp/grXEXMllvzo3lWJxUGFpmQPudQES7JEinojWcVnSKpnC
	83mrVtHwvSzo8pGT7fZApnlsOAT7MimPyYD50FZFLh4HJTQZyaj/otyFm8eXqxACxTL71
X-Gm-Gg: AZuq6aIzjIpaQ/9RCTra/76YUbjQ21WIm30VeNVnC8HoWF7tSprBZAWL+UKi1FNwrlq
	6hl7QxHqPnPqB1LKm6Razwqu+5v4NOffoY2a/vqz80zVQ9cZXiVgv6rwHS24chFm5hiXqKWMJyA
	CSoHb1hjZPplgSEAHfQY2KP7AdAEG1lPrShfc01VRD3RN2BXR4gltP9mWdvIdeFvF8Y4JQLp6PP
	TaTzQ8r21y03wpFrdX/GIbl7ghQxUA8Op11s4ukIrNuCEFaVs5qqCkIhGC/a4CGbSBL2gngGH2b
	A2Ws7WYNYL9exfmfs85N5NMsoXKWEs7GbODGpoOspungrVsFHvKbcvxRi0CH1AQX4eqsMOpLuC9
	ylIKq2IAfwPXBWJ6FJ+fmRitKYGmBfJyQLeU2KOFrVNg/CNYd5kJlsFuKb+Iq+Tch
X-Received: by 2002:a05:7300:8c9f:b0:2ab:ca55:89c6 with SMTP id 5a478bee46e88-2b78da3eea0mr2595600eec.41.1769572991942;
        Tue, 27 Jan 2026 20:03:11 -0800 (PST)
X-Received: by 2002:a05:7300:8c9f:b0:2ab:ca55:89c6 with SMTP id 5a478bee46e88-2b78da3eea0mr2595561eec.41.1769572991167;
        Tue, 27 Jan 2026 20:03:11 -0800 (PST)
Received: from [10.110.57.207] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af88c4sm976319eec.31.2026.01.27.20.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:03:10 -0800 (PST)
Message-ID: <a1f8d7f5-8a32-4d27-869b-4ef2c18250c3@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:03:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
 <CABBYNZL-J3-kcrN-B_1yXci+nw8zjgiiD_YFH0i4xeRNvY_Jrw@mail.gmail.com>
Content-Language: en-US
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <CABBYNZL-J3-kcrN-B_1yXci+nw8zjgiiD_YFH0i4xeRNvY_Jrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=69798a81 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jLO2Fxiw5Y3_fRslxeUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: scwP_BFowMe6gxzI0FNuyR-BPE4lhjev
X-Proofpoint-ORIG-GUID: scwP_BFowMe6gxzI0FNuyR-BPE4lhjev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyOSBTYWx0ZWRfX1ql5egCn8KAV
 AipyoiI+7bir0k6ZXY5dHZw396NdNZ0sOXIhzYA2LO/itLRoVprD/y0mtx0EcFuXvxslSSQTSzz
 +sSiYaXY1buPPVbpEzTdGhV/VtNo5fn94sUePvZyn71PazbLTL3C+HLiDQmULIjZD3c4wQvIYHq
 r6Sod433wu52kEr2q4BelKiIdhIh9fZUbNeOMnNXcdHVCn2urcfXZKkijSY6CFsLWMfAKyEdjiQ
 eIq17qnY9MlsXCI7cG+mZwwg7iFSiH1kkPqgXsNg2hBL651SqJ9xbOOse8m+QVesrJzVhNMMG4c
 tOlAs/Eb+aoaty80qM0DORyVzsCzGYhGagYzAhw/rDvvKkRhBUMgzjg43/krk1XvFtF550pNZaT
 p2oEgBxTnvVDl6OZVDDQZ9nOmv8GMagcjQY3dKN8hFGQWraoOIa57VLcqp3TFcukVh6kzS9jocj
 A6f9DL7236HxKrU8yhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A6569CE86
X-Rspamd-Action: no action

Hi,

On 1/27/2026 11:47 PM, Luiz Augusto von Dentz wrote:
> Hi,
> 
> On Tue, Jan 27, 2026 at 10:06 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
>>>
>>>
>>> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
>>>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
>>>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
>>>>> data structures to enable Hands-Free Profile (HFP) hardware
>>>>> offload support on these Qualcomm Bluetooth chipsets.
>>>>>
>>>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/bluetooth/hci_qca.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>>> Any other chips which would benefit from this flag? If you are setting
>>>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
>>>> set for WCN6750?
>>>>
>>>
>>> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
>>> considered at this time.
>>
>> What does it mean? It either supports HFP ofload, or not. Does it?
> 
> Or does that mean offload is considered the default over HCI, and in
> that case does it actually work with the likes of Linux
> distros/Pipewire or it is Android only? The fact that it is mentioning
> HFP rather than SCO is already concerning to me, the kernel driver
> shouldn't be involved with profile layers other than core.
> 
> 

Offload over HCI is the default way in most cases, but I don't mean it
here. Offload over non-HCI ways (such as I2S, Slimbus) need other supports
from software aspect, but these supports are not ready for other chips yet.

I use HFP because I noticed that it was used before, like qca_configure_hfp_offload().
Should I change to use SCO if HFP is not proper here?

>>
>> --
>> With best wishes
>> Dmitry
> 
> 
> 


