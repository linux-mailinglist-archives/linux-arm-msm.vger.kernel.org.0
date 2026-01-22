Return-Path: <linux-arm-msm+bounces-90225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDeFFcA9cmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:09:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE72686AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E2BD3000099
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84652D8DCF;
	Thu, 22 Jan 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wwi0fW2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2fIL4Of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F85223DCE
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094588; cv=none; b=uYGv0PTfrDFQ93wH6gnqYwbrlPB5ti9k767BYmvWMC46MgFQqlIB65xtyfaNqkZCHLOnDHxHqyGdjAdClZYyvnHzmgbIOlWtW4GMectYfA1lIwJVD4wZLRxGeY4G3Bjn3oNoVV4ss4Icbh38xXQvUth/yW/KszQb6kTKgE/ElzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094588; c=relaxed/simple;
	bh=sbE5PufeqT0RKnJMK69xNDsIF1LFlMLkOQuKUzGXezw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kO6mVZMIt3ODuybmFJa/phV3vVYjSR/iBgwKYMXbI2zKfRIwSX2YBFVQBZNPU3BBRsceJM22bbjnosXCu5r/EgMQl63ZqG/0ZwrdxtIy9h6DlhD+P0VCvUhAZW9F0ek8Lgvqf8y4oBdKjIWuz7JyAgahL+5pf6fb36dZwdkC3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wwi0fW2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2fIL4Of; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M82CUt2278771
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXAmimutHpoBcMO8lKrYN+CbkqYF9tLexxbBKbeEfH4=; b=Wwi0fW2QMu1zsVHF
	iCkej8GUvuF1gpj2Q+sCXrz13x9cDXuaKmXjeTp0ecm6QAUZXN78x1ke5ErN9C0e
	58/HnaauB4ZbrrfEMWXE8/GpXdrOsDdjKd366vjcJGV+SjJr2RKCzCwbbKndG59I
	ZzKIr+V7PxxmiyRq5j4IXg+bXdEPRdTaG1TYPUFOq7bOH2qJ/+9Sxei8YIXDzHUi
	t1n3Y1b38btaxLlVDENrX42EISyCCYovc649/6g6b4xl6wf3wpyLIV+PjapL9y1b
	d7qZoy+nsrZ1OhKWdjrtW+/0rtuOymJnPbANllpuabUImYVznVWKaERpP34oZWE+
	4g2g9g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatrnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 15:09:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9480c7d515dso182267241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769094585; x=1769699385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXAmimutHpoBcMO8lKrYN+CbkqYF9tLexxbBKbeEfH4=;
        b=U2fIL4OfJFnNv8HOp/DDX/XwZgUbYTud2gPL2mR10OlLEag+7w1BrBRTWHSmZtvJAG
         /QX6wAPT7N0esYOZgmEqY+Db3thAeI8X3mvqxsvw/HGpEJzKQXuWCvmYEvtr3pCp95im
         hBuysXfjfonb8Cy7GvXg2rUYxUPTz60CHcrYsHdPnb5DD6x20vWp3rfnkVK3Hj2LSScw
         de0y6loVNLRYqoawUsf1WeOQ3A9+MXyUAubEZXacb6Zkb5gN+7EOlRXKvOZbWtaDX556
         ekT7uDkNwus/HGZoCzafte3c4e/mc+OSdm65kkE3WnVKTBbnosl6nTWnIsqeS2Bow4NI
         RmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094585; x=1769699385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXAmimutHpoBcMO8lKrYN+CbkqYF9tLexxbBKbeEfH4=;
        b=BH1f6KYUswoQfz3LQvoaogy12IwfqMBlRCW/n/QBS6bfXa6x+eugCjrvOgZBeObRMZ
         6ALAyKMFhCQGSCOSUbIzhaoUW/3Tlf4PMwgnzCG0eVa4c1DC6fDeQ3dnh9Vq/3ZOIxVK
         b5zk8ZplMzbsxW+MaTeKPBENXr/nctPKrxLqRopJWSSkldKyFRHnvt5EBeSIaxTnsOOm
         VWspUMjJ8kXm59yGVvXARaO05iq0CX7zW9/OxyALspfJQTM6wFigMRPwN+Z+91Zt+MU6
         jTSzWycoZAbp9lJOORlb3WHZzBLPnzM8G1d74ArG6wPbIlmh+tBSPAyCq/XKOzPAo/eO
         LpMQ==
X-Gm-Message-State: AOJu0Yz4y8mKjRdgmefcajLS5YHzsl7LJP92KL8Os8nYnpY41z3JejCG
	mwG0MrGqkLv1DeTyVlkd4Zrj+dnTADh9rc3/PnxJKaGWe6el4WRz4/9v3M1W0DecENxL7lE28Gs
	skRWlQ97WcAmLDWJ2iYCgnhywyESVto8o7d7VBAGLHhmwaPpPjnXtMqDdo5GTAhIpN/Jv
X-Gm-Gg: AZuq6aJ72G2lqOlVRFvp9kjUQGBKzBRDN5JfqjIyKgKjiunF96a5CDlXEvfhB293OB+
	ZvA0S/+vG1wdbW6DQqlg/JkEES4V8x4JXI2l8wZNxYOH8mycnVKyUpROCHizMoLsC8fMzX/sxqz
	v+MjS5Xe/9vlVRad3s/QXm/40UEG65EFr2OJDb7BiNT1V5/w+rPV8aR+WDxB7Bs7SoAeadx0MCV
	tNTh/infP6OluH8e1kn4AnSrGK5WOFtKD9mQZDqWNSCZI8HOx9pBHxHL7jBq/DJFWkBvYrtvvyZ
	f4xcjGLi0rUeOsA8fIfnlvKv7KWfiwaSm8rKQZhP+banCdnB08CA32P29uJHow/ltBJGKsN8KZ5
	SshYrljYXIJSs3RJMgZ32GLsq4O+F495UUsM6+QytPz1cJaD+2u+XEJo8GEUIy573Q8Q=
X-Received: by 2002:a05:6122:129b:b0:566:2275:c2 with SMTP id 71dfb90a1353d-5662f51f3cemr334947e0c.1.1769094584573;
        Thu, 22 Jan 2026 07:09:44 -0800 (PST)
X-Received: by 2002:a05:6122:129b:b0:566:2275:c2 with SMTP id 71dfb90a1353d-5662f51f3cemr334927e0c.1.1769094583999;
        Thu, 22 Jan 2026 07:09:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a192b6sm1700239966b.59.2026.01.22.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:09:42 -0800 (PST)
Message-ID: <883a2f40-a945-47f0-8022-20ad4146acf3@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 16:09:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] ufs: ufs-qcom: Align programming sequence for UFS
 controller v6.2
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
 <20260122141331.239354-3-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122141331.239354-3-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69723db9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9Ji7Tjym3mbZabC91LcA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExNSBTYWx0ZWRfX3VADW2uNlRZ9
 V6J29AJqynsMoehlzE4OOj8Ysk/P37Gd39NVzgFcLf/RplfIdalBrqKgRg5tZ7xGRvPBuIhevRu
 LNcOrSHrCJUbfi26VXB16c4bsHljpU+aYmnqIr6AMdch5AHUy9bZwPWkikSmcRwVQRWTjrRHc23
 rFay/lCWK1A/xvI3mfxk5/W3Ltmo8CgYQu4OVIBvCR0n1im5AKdauBVV43Cw7zzUTzZuHoj7Vhx
 HQOFzq8isZ0gj+U6YN20iR0vQavwoh/Jh6mgP1BHDP1B2btEbEj7keduPUbJEKou/mc+4rbx3ML
 hJkpXllA7xjUeptNQQtiSHBpunmwJ7J4Y5tlVzWqAroCwk42EPG0y//R8VYsidfUsvSfU24qO4r
 4n+jxmmnT6yqdNs0JPcRArrm1UwkSK2+7v7mWAy6R0LcgUoNIU5CVwS8db5Vel04wkI8CoYpJr6
 zSxSGOHbw/3O0A9GD9Q==
X-Proofpoint-ORIG-GUID: YJkVZfT1igAYRU2_z92n16Gv_nFx7oGu
X-Proofpoint-GUID: YJkVZfT1igAYRU2_z92n16Gv_nFx7oGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90225-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EE72686AF
X-Rspamd-Action: no action

On 1/22/26 3:13 PM, Nitin Rawat wrote:
> UFS controller v6.2 requires bit 31 in the spare configuration register
> to be set for high-speed link startup mode, as per the Hardware
> Programming Guide (HPG).

Please stick a "Qualcomm" before mentioning UFS controller v6.2, I
don't think that is immediately obvious without looking at the code..

> The spare register value is read during host driver initialization but
> gets cleared after UFS reset. To align with the UFS v6.2 programming
> sequence, preserve the spare register value during initialization and
> restore it during link startup to ensure proper high-speed mode

I believe you're supposed to write the value yourself, depending on the
state of the controller, it's 0 at reset.

> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 11 ++++++++---
>  drivers/ufs/host/ufs-qcom.h |  1 +
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index c43bb75d208c..ab5aed241913 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -686,6 +686,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
>  static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  					enum ufs_notify_change_status status)
>  {
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	int err = 0;
> 
>  	switch (status) {
> @@ -708,6 +709,10 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  		 */
>  		err = ufshcd_disable_host_tx_lcc(hba);
> 
> +		/* Update REG_UFS_DEBUG_SPARE_CFG to set HS-LSS mode in link startup */

"HS/LS"?

> +		if (host->hw_ver.major == 0x6 && host->hw_ver.minor == 0x2)
> +			ufshcd_writel(hba, host->spare_cfg,
> +				      REG_UFS_DEBUG_SPARE_CFG);

Is that a "only on v6.2", or "starting with v6.2"?

Also, I see that this register has more than just this one field, with
the previous question in mind, I think a rmw would be desired here

Konrad

