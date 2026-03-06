Return-Path: <linux-arm-msm+bounces-95809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFLDMM/HqmnVWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:25:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271892208EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B1DF3012276
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F93B35A925;
	Fri,  6 Mar 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLCnNkmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfRSqpgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A630F808
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799949; cv=none; b=cYYN6Tnurku+H4qNZYJrRT9+mSj5n7SwVjyQ/9lVWs/zmtjUHYttMFp7ZJgPVsBd3OvSn7NmYSDFHxk2y3kc8khAwsOm3tZCfwEAx43cM/Kc7z1lc70vzp0J5fA7ohKRNETj3uOwqjLLlqEjZ2n9+21FUZ+08S8yzpZhp/+KJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799949; c=relaxed/simple;
	bh=q1mpQNuvkguIV3yJYO03VFzF6mQ49ojmlZq1IbYRwws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4Kb2E+l0AlNCcLa86UTO8g+LfHXgbyTJNujpsOXCOXlDEXnBJyJHylNgVsF9pPYUxHlh5bsnFVTURGUiUtsF7VYuGtCpv0Q20KP6QdGP91C6Q445yL/XXR1jhvHVklENdag80aZj5QsEnSMEOjCHlCW2UNAkkOYtfTAfSTZ3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLCnNkmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfRSqpgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BagKt1451294
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=; b=eLCnNkmLsPJYxYtg
	qdJjU55/C4Mu8i+8CIxARztWS2jZUyolOBZ+nrPYrQFKlh62Im5f1/+YO5gzJER8
	jQ9kXAJVS5N00YlYWuzMa9yjLabWlSw4OS6VUjSSbKaWSZ8O/HRSNI50q6waRQkj
	uBSo0noKVLjeGoe9rPUedr668o0PBV/t/FJ1it0dbYuWvPGqg6oS33rOUJZdJRg4
	FjtmB6HGIBk3WSqx+fo5KZSppwIbyp+2t7YJmUXRkNBp3sG6NkAJEwWym8EBiEsX
	VvswcYq8jUmZ/bpwPTh66Pzig/sCmPA72DVhfEeyTDE+Um/Nd+KBDdVFHK+/DFAl
	BzSMzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9aghh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:25:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae5031c6b1so50863735ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799945; x=1773404745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=SfRSqpgnxt0XsMJV9LQJ/OKQUMtOErd1i9J5xHNtYL1RRXwuNxy2LiTS1ydQAjy2nY
         4R42aBcNP5HN4lv9t5lViCng+pdD18JxhnYB0TMUSVLw8fYDq5tFFyVkmn9ZgfOtetEq
         katrgX/e7IolISmYeS6B5FO2t4vTP/aC1Zxzv9h24w45HSyuomdxs5OBtC7SjGZQPdVQ
         v0r3obK7WdCiLcaokyXSzoTkBkGiAXRuzr7mC1LD7KNXfEVv6o1uIaZIaO+TOw7iGC+1
         NfcqP5eRCltklbwmUKF+27G3kXWF+lZrf8xTLFHo+KKRdcDv/ZtAkB4JnzAnLL6L/wGp
         ErGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799945; x=1773404745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUkRbAo0c0S2TlWvB7t+iwi/GOepW+rNCNuvKtI+MXU=;
        b=IYIzQ5nSlSLXASyIcDiFi5BcHFCP1ptlHSM+4MaEitXb7VhiV4ppXOAGl13EPjZLl0
         ftkIsnum4mW/1WToG7eIhwtIHV+I49Ei+MgBrKj8myuOcyMxV5Oe/Cxy8h9fdpvlDHmG
         hyQ655GTANQHA6YjIcn3cs2IDOIoLow8H8Hc76KP6WyKJdSF8a2xmhjseMxnD7yE3JQ/
         25Kmz2YDJoh78AphRdVryAvotCmPzawbhsVNXLpgXAGKQxtY+mmOqT1B8Z8JZVczOQ9s
         CWms4oiZM2XIGYA19QVo5R2T/o5ajpdpPtb+X2fDux/HYbSVXBrLfOyrcfYnN4M4LIEl
         9niQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhzrlaxne+iO1aYBTod+xVD68++U8kb59JwenZB+DhqSsUfodIBkwu6+Hg3zdNkMNFjn6+zA204iWtgr5p@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBgTcCSPuPfGww11vnZ5WMh4msaVMF2+br0wzQnhu4kGoSiWa
	4LbAphhuS1jupDcpqXuqiekF0IBIOiSnYFoeSlVSfAVWbyCd4N6IeP9fJf5jXSjyvXtuEYkGp0u
	Me3d8NEIDouCDE/1h6mrl8DBKZFS3sts0JmlIKGR+yrfm98Vpn0jZAKnj5zTW2MQMKYV0
X-Gm-Gg: ATEYQzwocejvu9/lCOJLohKMFOX31zJxe17F8l7T2TofQmMqJ8pGvA4yTtbeAtH8gmh
	04ReFJlRtv3PW8u+YEK7OIuQzREIg5Ws6tARhpuL1wzctzVBB9Fo1s8HuXiTqm6DPRtikPkXt3U
	S8FJKtQKtRcOGUxouSjzXzqHBqm/Z2/wFPHghGDitM/bKNOTjlDd5zX2EMwRgdTqQy+UFbouLRD
	VOpM/re+kJI9POP77XzmaILTE8oJa16Pp9XPRnUK8XNev4TZH5hOK13ILhEstg71S36M3y6OVJR
	hJ9Qm6L6Ng1L+UHYwuF/o5xL/RQR6yLqhIkxHM9AcAtpj1CL72XyHm9MrmVR1z1S4HmVZsTxR0o
	d/VptAiR4mYYccTQf0bSdbkwoYFWaZMANPsrZr4YfWYpbkL6BErGBbW8KUbHAwm97n+vv4JQSXz
	J/W4dAxNWZioQ=
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20485225ad.15.1772799945429;
        Fri, 06 Mar 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a17:903:f86:b0:2ae:3f3f:67b8 with SMTP id d9443c01a7336-2ae82382430mr20484965ad.15.1772799944923;
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm18940945ad.58.2026.03.06.04.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:25:44 -0800 (PST)
Message-ID: <2ffc06fa-002a-4058-a78f-9ff60da9ed22@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:25:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
To: Krzysztof Kozlowski <krzk@kernel.org>, avri.altman@wdc.com,
        bvanassche@acm.org, beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        Ajay Neeli <ajay.neeli@amd.com>,
        Peter Griffin <peter.griffin@linaro.org>,
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
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-2-can.guo@oss.qualcomm.com>
 <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <8bfda6d7-f802-4b44-858a-f52ac8c051ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IPVlo-gqX0KD7dyzSc8OZmZkxT8DgR0p
X-Proofpoint-ORIG-GUID: IPVlo-gqX0KD7dyzSc8OZmZkxT8DgR0p
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aac7ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bBPRlu2x3IQPgS2CUtEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXwa+mJfyjiUdM
 TC1FsMzqJ+thVPxqLKe2C52bBI+bCHZdC1znqedMmKwPw3CMenk6fh2XUxhUoqRH72dL5aPR8FW
 7YnvsulpOibK7nK2uUO7S3qP4QO/OUMTTMFiiFrphS5N9heqfnCaDSCiwFXAmAHSrC691AJGo+P
 LgsVEisiCldqfT2Saqd3LANnk/RSsA5t1OqI61h1DFBVilLyKr+oDO7JhXuBCDl18NdTcDpzZdd
 pQ+NwQ5x3m2GvZrwQ+mw1qpAwlgRJhsn5u1NKY8IDLEpG0YZFE0QwIk3/Umz2hZRIfji+HgexDG
 N+uaNQCS2U3uV0d6TbnpFk9bfJJjnRL9f/3eKIjNocCC7AsAnvN9gin9UujLCLeBPLIrST4b8sA
 Ccq67p+dw609HuTEOBvbepQkEml6iz+vwmNop9dnctaC20bYbLpLPNQvJZAXMp5kUpk9oKB/em7
 umgBQWi5zMGpExZbSrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 271892208EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,mediatek.com,gmail.com,kernel.org,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-95809-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action


On 3/5/2026 8:53 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 14:53, Can Guo wrote:
>>   {
>>   	int ret;
>>   
>> @@ -4747,6 +4745,22 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
>>   	return ret;
>>   }
>>   
> Missing kerneldoc.
Will add in next version.

Thanks,
Can Guo.
>
>> +int ufshcd_change_power_mode(struct ufs_hba *hba,
>> +			     struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +	int ret;
>> +
>> +	ufshcd_vops_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>> +
>> +	ret = ufshcd_dme_change_power_mode(hba, pwr_mode);
>> +
>> +	if (!ret)
>> +		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(ufshcd_change_power_mode);
>> +
>
> Best regards,
> Krzysztof


