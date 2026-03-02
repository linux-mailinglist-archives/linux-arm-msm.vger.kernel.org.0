Return-Path: <linux-arm-msm+bounces-94770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPp3E73WpGnYtgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:15:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD071D20A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E93113010B88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 00:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1183194A6C;
	Mon,  2 Mar 2026 00:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLibOj35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnAIchRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D30156677
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772410554; cv=none; b=ns48a6JRSYpDlRJ/8L9+pg4A0VtJIn2sxL0nfCDq88PJ7AjQDweCDITBF/7uSuj+RQLnttBbDbfm7P4cresRITObAYgRuK4xIW8lHykN1KqHac/qv6rB2pjBU20+pzuFZRJJKWQ+F0dYHiis2eYF1AR93BbZdK6S7A5mniaeypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772410554; c=relaxed/simple;
	bh=ybW7ZGIqp8Cj3D0c1tJ/QKxtNDpqm5IigPIVWWekitU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJt9TGO8keDbh2wt/97nK2id/3cZeEuEfSX1lT6p6XHUoUVmpk3vyHeq1sEHRGcTKp3XTb/pzXzmHsxaHiI3CzmORSI6OPUpGw6Ykn0phEuOdDuraeZsNNSbnitI/ZloMb9+uKKKGYmLhzLTjqv7KaB7cRcpvb8DodERJg3x8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLibOj35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnAIchRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6218ihdL1322657
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 00:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=; b=CLibOj358az11iNu
	my+7sfE+tfLmzugD6ZsrX+Fz/sytJJuWg3AM8HkNW6shh6zg0EdFjQnDOSt5W8eE
	NYe227IFbhhsRnUD1jUTl0pwBWJtCFXAIo2n+dgUe7+hT1CqToItVHx5JjqfIfSU
	/ltgdt3b1Aunpxqxvkvbp7mjVv/fCNOMQ2Oi/8pe3+QVyC5pmYV/0cNOwxWt+LWu
	k0bMSUvD32CSNVgkf9ruC+5l2YQUyBv5fXXPW3sEwu+SClFmj/w2ZcOX86NDaYqp
	IJA1yxik+c5bEvTsUfLZ5DRWsu7lQ3Ww2MrVy9iiuknpCi9dmfp/nn2J6IhcD1ur
	ya9GdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd3gva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:15:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3badc00dso13883805ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 16:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772410552; x=1773015352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=;
        b=fnAIchRr+ufq/YvbWpG3p9iRB5o2POSY3Ql909hhcF0NQVk7WqkJsV5irPmVGfDnKJ
         aX5pKYc4ZxZI4WbGTb34VKfxgWy5otHyWpYiio4gj8qkJ+03hgaeZpq5qdKzJXtKwQTM
         E3m2CBwG8FKKeQoo5hts9EvGHKxqSDRNIGLr48h75bnSViVfbZn7eGdNKqEPUktCQrgk
         MouNxAVccoL1X6r3VtlQRbul8B+U5MTNLiACX5VBvODwyBdhj+9VS9ass/BlituNKgeQ
         eO7Fe+JZj7PPCVYIoLte4CjXfK/SRiKdKqvslnmHdE5j7qWeM+qFnMjzG4glg8Ws4ehv
         wBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772410552; x=1773015352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBZuljD/+5TcXwhWoGNRFrGUV3OJ0gks35QtMWEwRDI=;
        b=wi9YYZFe3vMf2KHw2U7flKosTW+0a6Hep6lKshV2GKrc2brR0wno8yHTb7h9+CQ7Wo
         AQ+dzCqBqaL5PcozkcN+Nxq8OpTolrdHWT1KWGKG4sdmo1gtfZ617opH7NhlszGdkfE8
         XP8QFqk3ZgoHMQ1EVuYJBql3pW7zW/i0VliEV7i4kOBR9FRoaNJaIPk+i0sAyvDk0Rpd
         OAwdCmbMAHPMr8BQQ49gB3bNgXYfwevU+2zim2dw47QmpKILewdhyu5eWoEksXBbL70P
         v8ELkAdek0i2RnFZzpVtXfuZl3bHJVGF5UgodjuKBA1Sy1BEIIoQtrUCNqpH9s3CqCwC
         9DaA==
X-Forwarded-Encrypted: i=1; AJvYcCXnly7KZFWjSNl/mW2kYdPn/eRilHDMNj/LUJNhU/oIMtxzHsyp1lmq/zQW74HGOFvzBlrfC7dnJ5h789ea@vger.kernel.org
X-Gm-Message-State: AOJu0YzGTi5HTEM0FXrS3rFriTErBhWf0RZ4yi4PsOJHwXM0vA0sp2bc
	ZuuFRkkjmYorkC+pFzZOSSr4nM+3QljNlvzTAelph02vnHrgngDQE7X3wOqQYAQkBBTktBTU0iv
	q+WA9JbHjHqdRcQt7UcWlYTEgvTsMd2rxXlrmixrOVE7JTzp8L9Q+81GEGQuvY+HO/QdB
X-Gm-Gg: ATEYQzwCjYWBUOMt1bvA9JkyAsI1IrS7AFnF6gLYze5BuYYBCmMOx7VFtc6SM6PMC+c
	1T6yshL6YDxU5TW1KrfmixEwrAsfwEiUuNQEwGZ65AEr0lIvtblU/AIIETv+mCTp/OcS1Pi45gE
	AsZ1TB4whI+0q0IykWeK57jS7H/uH1NqYZmY19qVMeChB6jqw78NwzTleJZK6xK/RXoEb8rgdWb
	Ni5vgVqSvSGAXUem6elS8nqP52NpOlI3PV+XQUkKv5T8SApdRmGePBZST9Dz2hdmyjxJG3X/cf1
	F+VwEo0596QzwshDOItijg9SYOmSrMSq4BlnRSeucGVIZq6fYkfn8ZFvuA/78240az1XdIsFuMI
	ZmFAEJ3fdfANMi+L4swNbp6ox1Uy7240u2LlgSgCumu+OzxI=
X-Received: by 2002:a17:903:3804:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae3b3629c3mr58200845ad.16.1772410552086;
        Sun, 01 Mar 2026 16:15:52 -0800 (PST)
X-Received: by 2002:a17:903:3804:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae3b3629c3mr58200545ad.16.1772410551609;
        Sun, 01 Mar 2026 16:15:51 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6c4dd0sm120565185ad.70.2026.03.01.16.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 16:15:50 -0800 (PST)
Message-ID: <e2fe080b-c935-4090-88ce-f8b8c15b6efa@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 08:15:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Bart Van Assche <bvanassche@acm.org>, avri.altman@wdc.com,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Wang <peter.wang@mediatek.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Archana Patni <archana.patni@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
 <20260227160809.2620598-2-can.guo@oss.qualcomm.com>
 <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
 <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
 <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <3abcef32-f872-4aa5-a7e1-c99286f426aa@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAwMCBTYWx0ZWRfXz5nV4kI52rU2
 iME2bUJAfyvFz0e+mhDDhmcobnb2Kb9dQYnrpD05KShLx/gcZ/nzChh7cnaLI44lxvs2xKI6rLs
 p/lyKbPsX/6VX/u/CxnZArE7wgOfM/xZi8BsfropQTYAPc6S+j1FsHgQwQBmz6TuHG+FOPDLIHT
 RPDL1o9BL5z3ocsY9pyyk8PI9e7K850aEJ3UuhahunljCN9z/Ft/0+jyAMSxvAA/haPzMimSklc
 eLi3rEjrSU7lW0ee2cxwl/UZ+H/XR17IFyQqCBabd3YMD/ntCsDgLvVEDjSaCKCWWuPTyZ8NMuU
 ByYp79HWRHTpoCQY+/KLrx1PVFXMepkgHEyTOBoZG8NEmM6q5zd0Y9wSKCr1x32lhE4PUjEjyj7
 3UZCTdip4qWHr7MzB1Q+G8D8iZLvNqf31DC9TyzG4asElFLeQl/+NeBLkZz85SlwbRrBvsSosmM
 BveCDqVkWe5hnVPPkYw==
X-Proofpoint-ORIG-GUID: Tx7lPqvJC1YDhdhbVQhtIe0zLiem-xgf
X-Proofpoint-GUID: Tx7lPqvJC1YDhdhbVQhtIe0zLiem-xgf
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a4d6b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3hymWB_5rKpTfOV4Hd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94770-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAD071D20A8
X-Rspamd-Action: no action

Hi Bart,

On 3/2/2026 1:51 AM, Bart Van Assche wrote:
> On 3/1/26 6:26 AM, Can Guo wrote:
>> On 2/28/2026 3:31 AM, Bart Van Assche wrote:
>>> On 2/27/26 8:07 AM, Can Guo wrote:
>>>> -    return -ENOTSUPP;
>>>> +    return -EOPNOTSUPP;
>>>
>>> Why has ENOTSUPP been changed into EOPNOTSUPP?
>> I got a warning from checkpatch.pl when I add the new vops, so I 
>> changed the same for
>> ufshcd_vops_pwr_change_notify() too.
>>
>> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> Hi Can,
>
> SUSv4 = Single UNIX Specification, Version 4. This is a standard that
> defines how system calls should behave. Hence, ENOTSUPP must not be
> returned as an error value by e.g. sysfs callbacks. As far as I know the
> ufshcd_vops_pwr_change_notify() return value is never returned to user
> space and hence returning ENOTSUPP from inside this function is fine.
>
> If you want to keep this change in ufshcd_vops_pwr_change_notify()
> please make it a separate patch.
Thanks for the info. I will use ENOTSUPP in next version.

Best Regards,
Can Guo.
>
> Thanks,
>
> Bart.


