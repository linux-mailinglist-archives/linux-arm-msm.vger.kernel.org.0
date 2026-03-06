Return-Path: <linux-arm-msm+bounces-95815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLo1LsbXqmnmXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:33:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AE221B97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92AFA3011C81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB232FB0A3;
	Fri,  6 Mar 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mo1QIFLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuIkbRBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350352F8BF0
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804032; cv=none; b=KgpiNMJTLIdxDsB9wHixFiTrP8x+I9EazjDdkCfhXJUCQqJZvc4+uyRV4Z1gfxcMjiIuZgTYO7B0W96hrpTzzMQgnoaGO+upQfkm5bvK9DBIgVpz9+tCxCgMuFpkbjX0Y8kTbPaMIeogAu6go5XcNM+9wCpmEzCnGkeWI+RxlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804032; c=relaxed/simple;
	bh=g4UsbzvhTYxaAE3At0jVq4iJk4NTD7B2R2kwPJZMhtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vh3Vm7+8tc4zIyShzxvHuKxnDcT9Wygfh6qK7uwB6j6Un7qp7VAecHDEnnkSqJw173SusKGLX3TQu/5fT7UCp2ePjdwCXNCNcelTUSlrrSJ2jnADySdYchyLVirbGUkm+VbE4+/gSLE3Yb204MOmez7y8/i9WWoSwVYjYWOPnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mo1QIFLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuIkbRBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BahY61451394
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 13:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czSs8U4CxUNoAoK8ugQbk+91u19ATbbbVF9YOUFqqPA=; b=mo1QIFLPo7Nuw7bj
	4+VrMIaa6f4WE98QFeFcoe4OwOtVaXctE+s4F78yTEk8PDaiJPskfKbUadAejPsT
	zjnjGOYVBUAC00ukXhlj9p1QeNxkhYQV8erQO6JOl6xT8EIdZ2TraIhzVjO2BRWE
	RRxkaQ1qNzidfW9o8kiCaKAhTBCiuR8OGCQMDs1SZD+OxIIH4+x/LDWccIbQeE/u
	dIyjMdwRSA97hhSSd5goSc4gMY+MOYBrQqS85Z4trjU9rQFuDuZ8/frFtfTlUa/k
	KbXupueQra8DOdVFWAf5qGR1gWi5ZrQMZX7fX8mjhUduWX+7UmCt65UszF5j6NBa
	ao7PCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9agr26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 13:33:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae50463ba8so260754675ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772804029; x=1773408829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czSs8U4CxUNoAoK8ugQbk+91u19ATbbbVF9YOUFqqPA=;
        b=KuIkbRBZ3EGDdQTA6eNeH3PknFF7Hr6rjLT6QaOWLLnFovuI/DahZxT4Tnaj5RmQl8
         f489MaKeO0U0FXWWs3BHAC/92qRUO8UPG5raezB1ljhLPudKL16+5ug6gtpypTgMpakP
         Czm2M5j4ufnQtis2n/6IBytw+4Neuso8PF+TurLQzw21pNNxXoQBP8K35uFY1g8XG/GL
         481uL8wT9JctOWXGOQIgR80alUGAefAG1LNOaHjy5sOgPh8BAaa1wSF+CwQRtzorrfpV
         XkTieq3fRJlNSEwBeUf+CAo1D5aeVBKKElpn3bJYRromHeupIuqrjNzIGB+KQ18yf02z
         Boag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804029; x=1773408829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czSs8U4CxUNoAoK8ugQbk+91u19ATbbbVF9YOUFqqPA=;
        b=ejv4eFKa7tjw/G4qQGXhvHfealZNePRqZvnN6Fn6XX5mCgt3JG4R1DlTvkgee75Kvq
         ERI0baCZDHbfqB5Uu3BRj0ergUV4q0trMR+usTrtjMeBL5YDNYuYA0CJRkJRihb6a8Y6
         aXxMqPP1mvfaYGy1EGRhX5lVQC/1DRfUz9/RUPgaB4Y2N/uagmktG3wB5swdGI5W9nF9
         q8jJ2tlF8/GjIKdMa77Th2W67OS8K+GRWtwPreZ8Vu9pZ2ax1ZCEJwhr252gl7i1WIZS
         r+Zw23V0EwSJm1fVerdhukOyXjoK/2kfofeBa8LjFZk2DharMUZmXffvSqeiCHesHkwm
         KrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCSCOPrPyg3rBzApuh235A3kjp5I0ttV+9s/DlZzflAApV3f/rnnTpVyYIlX1a3VLTECKUZE7tqvKJV2rt@vger.kernel.org
X-Gm-Message-State: AOJu0YzsULVNQO3twlic2ZxadO4Qft28cHG1GtKghquCuIRmqTHGHwth
	viKeDwWkOuSMiUh3Y+N2oKmzo6XuNsxYMIUSufdmJlBkruY1apUqBAW8300cP2K1hu96q4teVSv
	K6BqURHWBNnY/HZYxtiLe6JDStLghOqVuTEi/7tcPMQ+ydGkj70rSmzABYfZwLOwV1Oqe
X-Gm-Gg: ATEYQzzxxEOvs8hDJ8bsrd5xqA5ZjAdWnScgzzKrdXnptTU4QkvJRn+bjOQ7i8UPPYt
	OAklMNx3XOqhOxu2aNXTzprNypbpBlyfELomUHKMJHz4IX/3ybD7q35OTfZsHVhaPujxAcQgB4H
	8sSgULXdDHhGr9S6e6CCvFURjv1L0WDZYxU4I1JHdIWEhlrMtgOTtwQjFcb445aaEerIiT5r+t/
	Dh9/uR8TkNJ3/zFW+meJGkHvnFv/NRgZXb/r2L5jFDRUZbNaOB7rPcUUubIB5UlMBqwAZZjYy/J
	wsAPHxeyvdGX37Ue9lTGy2Ud+NK01kNa4aNovFPVKxAouO85rRHePishatmIcSnGfVp4aUFIq0i
	rwjH3+vU/6817j8jJG7qFmG3ewAXM+xUP1pKhcuikYBdWRpw9Re8V+3JlmvyHm2Owc2dZ69XWeP
	/RO3HL77Zn3jc=
X-Received: by 2002:a17:903:182:b0:2ae:8077:b1c7 with SMTP id d9443c01a7336-2ae8242d3a5mr25683375ad.37.1772804029026;
        Fri, 06 Mar 2026 05:33:49 -0800 (PST)
X-Received: by 2002:a17:903:182:b0:2ae:8077:b1c7 with SMTP id d9443c01a7336-2ae8242d3a5mr25683035ad.37.1772804028540;
        Fri, 06 Mar 2026 05:33:48 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm28225645ad.12.2026.03.06.05.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 05:33:48 -0800 (PST)
Message-ID: <29ada0cc-709f-40eb-b399-cb870059c831@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 21:33:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] scsi: ufs: ufs-qcom: Implement vops
 tx_eqtr_notify()
To: Bean Huo <beanhuo@iokpp.de>, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-9-can.guo@oss.qualcomm.com>
 <ce70f471d5c6bfd3c6ffcffe9c34a823e7b557b9.camel@iokpp.de>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <ce70f471d5c6bfd3c6ffcffe9c34a823e7b557b9.camel@iokpp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wn2LHLU9xr6Bl23hkpYlEFLxRWBfseKJ
X-Proofpoint-ORIG-GUID: Wn2LHLU9xr6Bl23hkpYlEFLxRWBfseKJ
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aad7be cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kjMh5VIOa_i923LlWvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEyOSBTYWx0ZWRfX/MRijccxefnQ
 ndXhDdTB6rFiad9y+lUQYwQFrg6EZo2IheAH38/cZxxL1kB6BSvAHK2TWygoVlZ9Es9Juw0f2oA
 dDmzRnL5muy6bkWFuKsYwz5NOTfF/hxIV/v8XR/2rM+dgunn282xodpAXQSNfLALIRt6+ZsM7Ky
 qb4ymCPsyahL5PdqN3/Go3tzaQQkMp7ZQamLRK31dLSsTl8rYYfVwyfIf2JgAutTu7BpuIZwyNZ
 F0beGIWsZLtJZKzX29IgN91lztOom9ftBgsOK4wc6tC+kWI2/mpmy/so4a8gqLgmDQsiSruKWon
 496QrGt/BHC8bVwslTOc+ko02SjwBcDK4fzviom3wgpYURvVxB5dSnhgRhde51ZmSbgT+3qXDvR
 Rl9NYs/1KajyYGaxWsdr6VqtyWmglqJDv+LwtIaDkWfgdUwC7Ojw+jvZp7bKaZe9H5kpR3vEgEg
 oWp8kZaazCBXWgp+Aaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060129
X-Rspamd-Queue-Id: 714AE221B97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95815-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bean,

On 3/6/2026 5:17 AM, Bean Huo wrote:
> On Wed, 2026-03-04 at 05:53 -0800, Can Guo wrote:
>> freq)
>>          return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
>>   }
>>   
>> +static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
>> +                                     struct ufs_pa_layer_attr *pwr_mode,
>> +                                     enum ufshcd_pmc_policy pmc_policy)
>> +{
>> +       int ret;
>> +
>> +       ret = ufs_qcom_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>> +       if (ret) {
>> +               dev_err(hba->dev, "Power change notify (PRE_CHANGE) failed:
>> %d\n",
>> +                       ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = ufshcd_change_power_mode(hba, pwr_mode, pmc_policy);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ufs_qcom_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +       return ret;
>> +}
> seems Qcom UFS driver does duplicate notify now, above
> ufs_qcom_change_power_mode() does PRE/POST itself, then calls core
> ufshcd_change_power_mode() which already does PRE/POST, double side effects? or
> I am wrong?
You are right... I made a mistake when I cleaned up the code. Thanks for 
catching it.

Best Regards,
Can Guo.
>
> Kind regards,
> Bean
>


