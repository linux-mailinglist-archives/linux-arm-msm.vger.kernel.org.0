Return-Path: <linux-arm-msm+bounces-94741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ma/LaVMpGkZdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:26:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54F1D033A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 15:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54FC13018281
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 14:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DC61DF25F;
	Sun,  1 Mar 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRT2g4dK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7Udp2w6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE3317173
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375197; cv=none; b=S6yyKf5i8n+kf2UtU/bxGZIGVEvv623kC1ZNmNySjepIT/yCJ/NHQ8kVyQCWObuW9NV+ne9eydIgVnRgm0XwI4vT1Uc6x7Jq1dbSC34kqG0Mzv/sm6+RY8u4PNa3YjbHTSJm8AuyiUxUuOVZJ9AXzv/XlqZ8LaX+zjlPa4oL6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375197; c=relaxed/simple;
	bh=4K5uDwmOGHHAE2v0HwOM4PoClT+fHAn38D2q2GDRMgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T65HY61h8dZJgKn1vvcM5Eyw896SdSNp1zmkcbL+rlfbrNplqd5LXKWBKSHbewsfHo8qKVrt0eWVuJUj/MBIlwQANSPwFJe4cigpTc8yuBcTslHzcsxptIqhdGGhEx7jzBajyv3CqrsbyR6nt8UDbjjbGQFL7bacbAcSgYc8XIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRT2g4dK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7Udp2w6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6217PHAL158935
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=; b=PRT2g4dKb8MUvpUT
	6EeF4Yc+YA+y2s29jjszN5/MbgmHBMMEJ/InzQOW+QAacc9SDBScBPJk+DGdwkBZ
	PjCfggr8Dvrxl/LmbHk57xnPko3poAgrmQ9eG01odwv3xBbAsDgWi0bcbgw0NTvG
	Xn8yWNKhdoG88Vu2VMAbkzFb25QyZBn6tXICwtqUCQn0zxd1oOcsMJpTqORXFIAH
	O7uT+kyxTc1B0yfz2eCunEXApBujjLiTnYhc5GOzmb8pTiNPaCaYSV/g8/wxUcOp
	lNvGS5lg/qFVeErnYC/eRNAf5uA+JDNu4pR9ZnQE7tc+zELpcfFzJUsPh67Tcok/
	LNd52Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshktqva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 14:26:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso2887714a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375194; x=1772979994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=j7Udp2w6/FDDzIxefqZFAQD/ZxLTGJ8iUzcyfils0rY1HjpUTIeEkC5RlA7YeQ3Acq
         Qtq8sqpGp+aS1B+zk8YyHnG1gpXGplpAZR0XvRhedIz/2/J67IhNFNRRcWwAPfOkEGxx
         xPxkvtsTCznlRWF/uYQEkfw9oDXzKfPRdgDwGNh9C5c+PprszbS5ARWjhTVt6Z198KmJ
         cmEod5jFvRP6jP2Ls6w2Z5RMccoqPjcKqfEWuvMVwT2CH6vXR6ELcvsb9do/tHDJgxNa
         QOekZhE7QnhWXOyeCq6t3Y1zkhiJKiT568KGAHAhYzNAi3kVhWDwtDwmZqBA5h19Bi8Z
         QiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375194; x=1772979994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNX4FPcc10deSSmvIUjJw33Ay9Bm/BfMEU3pVvCYS6E=;
        b=ke0vtmV3VzPXvKL5ODfNYVlDbUcvzFqIOknWOUcdrkv1Q9959MrC5F27VMVkjj+M37
         MjsJ96gbFD/qSOoRYfKmoRXL4P48gRkUxepp+yeF7vZS6emadjW/eMdPm5VTc/0WYKoc
         wmew71wMBaMM2LYmqoiWJOHiYcMPBKFB9gWY22TpniYZKSOhTgrgwR+08iRYf1irr8QV
         oGuytBuk/xsbPKKSq3XcwGJtgRe3GuDfaIjRQGpN6nZ18Q4h4hNlr/KVRPnJj044nVaE
         tGmEj7oD0kxYIAzvAKlIsOP8kv69cJm50vxmy/2tLaA1evRilKgjRNM1EVKIPYVTR9qj
         1ZEA==
X-Forwarded-Encrypted: i=1; AJvYcCVo+ASV2w2ciIDH2WWRSSZcA/ItTZuZKNY30Z2db1lmyBqz52QeSsZA7mz3SnvkMBQoUnmRDVEB7blHpJAJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7azMBojd0RtH9HNcrcDl7OE9ZJe4fXwo0Q8noGJHsoe+5zX9h
	GXxKmHz55wqQjgB8Cjd/GTwx2toy1z15QqIX7wIzwghr6W2bzBL0wippSqKykXmiWJdCEYb6Mfw
	vXoc1dNiL0DgLIi2yE6jpn5vrzkqpoV8H6PGOmCw+cYVVBIY+DMTJigyUTyM1BXyjEwGN
X-Gm-Gg: ATEYQzymRko397ZYhivAfT1ugGN3qiUMaqZKedxj/B3e8Ypohi5OecQRTD0r19oPKq3
	rXi9QWBuCwQ9n65DIP1FvwuI7X/peCJtgak5BEZTZIuMB929sbl4iIxHyGU5Mc3khzoGwKtzlAP
	kTLnOqz9t1ZRg9fBvV/+myt6DqzUm+TTR6eKwTkRfay+kehL45OGDsorStRKlS8s2s9ijyAhrPN
	YcK/2YYexuKMB9rHelaW9kmEFfSs9BTAZrb4g/IJhttDtiRSg9oRf0+opZnkGLwU2kWO3VMz3Q9
	k7GXij+Jit/FygxAgR5qoQxQxk8YC9gCMEu4YQ6mpNMOxG7dHmn3Dej5j1cAhsOw/MLvD7VlK4Z
	cECsYeDFVaUk1kn+qbgZOyRQ3IGCfZLA27ct+W6QYfY1ckcg=
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553264637.32.1772375193651;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
X-Received: by 2002:a05:6a21:730c:b0:364:be7:6fe9 with SMTP id adf61e73a8af0-395c3a75434mr8553232637.32.1772375193170;
        Sun, 01 Mar 2026 06:26:33 -0800 (PST)
Received: from [192.168.0.102] ([183.193.18.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm8925971a12.3.2026.03.01.06.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:26:32 -0800 (PST)
Message-ID: <5a2961af-dada-44f3-8e57-119076f10750@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 22:26:20 +0800
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
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <9d975881-7570-495d-94ea-085e2012a9af@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMSBTYWx0ZWRfX8SRXoPGOmMnE
 o/I7VA2f1NcZ3UwXuNiY259QQYodVFCjvhebwqVCwmbptp9f9OUlZuDZhfPVfuC54ZwYNWbrEFA
 HZNCGVclGshwKhL196QZST+5Gm/S7AudRtbtI5EBK0pr6V1pGBuTNXahAowwW5fFtd2XCirHwLP
 tNMRKEnn6/WbttTXhZ5cvNJC+pJMcfPByhIAaNKuzfb9Ge+499pIr1ZZOeF09Ds5cCey8G+2tBC
 1NASrFcXd59C2hX4hHMfpTRpbIHyX61yY1EgNdvzTrlRkHLaRKNIlFYNxmU7kK1odUIs2BLefHR
 DZluM+nEUF1Z0E39X3JBlxMc8bITjw+dl8JRN1pzwEb++Esx4jYtvmWr4B7u1nsNK7bpmNcvCCM
 WfeFXm2DVuRZHk1/lBYYHgnyovIUiQp9o4kcBODGKpHpF0J4EmOyzMYuKemKG0UvB3wB/4YSOuy
 GoJrite/WKwy1mL4XeA==
X-Proofpoint-ORIG-GUID: 986HbGdlIKvjrYlgeJp5vyvgOm7j0svl
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a44c9a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=4/OApUm1v7sVY8kc7hZvWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Z9vnt9DBQu4Rfwh2U9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 986HbGdlIKvjrYlgeJp5vyvgOm7j0svl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-94741-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1D54F1D033A
X-Rspamd-Action: no action

Hi Bart,

On 2/28/2026 3:31 AM, Bart Van Assche wrote:
> On 2/27/26 8:07 AM, Can Guo wrote:
>> Before power mode change to a target power mode, TX Equalzation Training
>
> "Equalzation" -> "Equalization"
Done.
>
>> (EQTR) needs be done for that target power mode. In addition, before TX
>> EQTR we need to change the power mode to HS-G1. These cannot happen
>> before the vops pwr_change_notify(PRE_CHANGE) because we don't know the
>> negotiated target power mode yet. It is neither approprite if all these
>> happen post the vops pwr_change_notify(PRE_CHANGE) as we are going to
>> change the power mode to HS-G1 for TX EQTR.
>
> approprite -> appropriate
Done.
>
> Additionally, if "neither" occurs in a sentence, "nor" should occur in
> the same sentence. I don't see "nor" in the above sentence?
Will improve the commit message in next version.
>
>> Introduce a new ufshcd vops negotiate_pwr_mode(), so that TX EQTR can be
>> done after vops negotiate_pwr_mode() and before vops 
>> pwr_change_notify().
>
> This patch does much more than only introducing a new vendor operation.
> Please make sure the patch description is complete.
Done.
>
>> -    return -ENOTSUPP;
>> +    return -EOPNOTSUPP;
>
> Why has ENOTSUPP been changed into EOPNOTSUPP?
I got a warning from checkpatch.pl when I add the new vops, so I changed 
the same for
ufshcd_vops_pwr_change_notify() too.

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#59: FILE: drivers/ufs/core/ufshcd-priv.h:178:
+       return -ENOTSUPP;
>
>> -static int ufshcd_change_power_mode(struct ufs_hba *hba,
>> -                 struct ufs_pa_layer_attr *pwr_mode)
>> +static int __ufshcd_change_power_mode(struct ufs_hba *hba,
>> +                      struct ufs_pa_layer_attr *pwr_mode)
>>   {
>>       int ret;
>
> The double underscore prefix is typically used in the Linux kernel to
> indicate that the caller holds a lock. That is not the case here. Please
> choose another name for this function, e.g.
> ufshcd_dme_change_power_mode().
Done.
>
> Thanks,
>
> Bart.


