Return-Path: <linux-arm-msm+bounces-109363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHxhChiDEGoHYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FBA5B78B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF39D301F4CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A46343D9E;
	Fri, 22 May 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iccbAOg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXJVASHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333C31B828
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465561; cv=none; b=R4kz3HPI37c3s9p8KXzRBZ9P3DKDzk5Ory+/F8H9ptGQURZ6S0hCc1DA0+X9/t/KQqN4qg7qWdBCL6V+mVx630eV41Dm9hMq+XNsBtz30twFZfvtCZSbIr2aR0zCfkVTvVcb0EgbGhc+u3v+4nv4rkFzj068iu/Pp/lhK5yuIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465561; c=relaxed/simple;
	bh=hBmMjZnlb53B9za8MFTPUQZHUnWWipbTLBXWog4O5bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us0fFBlvBx31ip0T5fQn4gUc99CuZuXJPncV2cZqDTRiN5Lz5H0/gslX72rLUDX+RW/n8AgAqtnf8pa+5gl/fMFgX/41FdfFUjiaXhB9i125epmEbyUVndA+dGEg1kfc+WBgDDW8IYuZeZ4nn3oN0m/c/AiXgKOtvnpZlPWbZA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iccbAOg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXJVASHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpVw62125159
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=; b=iccbAOg3VhKIfFR/
	bJHBDoA2KRYGhth/sO3O53MqcvHZDovO9RNeNm6rktjUFKyb4YF4Mxqe9Y/wbEWq
	ZzfKYlW+rcrEiczsj3Ep9vkEfpvJCoggd2kWuKbHKPHiTrtljFBEJnTO29SFw3IM
	0P926k1ehNXwtkY/fhrWWbuRQ135ZJTjaxbsMWjYrUk6CtfXpskZI0aTN3cynW6v
	n2qyko7xCK3g1iykxkvm6eTMqUmxXH34SeDvYUWro707Bu/Tap2d3nMMYzFbhE2V
	9fn1JFC1SXVCIVdJaNf0tF7KYxaqu+MsHCrQWQW7fdygQwBurq8TMJeIH112Owwd
	4rSh0A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard88myv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:59:19 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd7d24b175so99173367b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779465559; x=1780070359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=;
        b=gXJVASHI/WTH1H9mjTwFqWfto9W6RE7v4VJRlNDGM7cd3I+x7kvZdg5AblXGUFNx9g
         LTatyOJpY308IkNOBmuuuqRsmWscqnS1ypjwa+qeL0c13dK7RSMakLAZpInAUMLll/vB
         TPAPNa5GK2glK7IjPKmj6SAB7phlufs8VAG85R4vf7skVqO2daxPy+8EZmmNGHEn+aZ2
         X9tnjYhGvXqwv9echb7jWXupIogw/iRsNYlSsB2CIQkx/+L6YyswFT48NWVT0W5inLVw
         Aek7U5y+W7ELndOq+J9CLirc/HlwIV8Cf/LLRpe2Xgoe0yKedY3RyqzZ6NPEo+gDYhvX
         6NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465559; x=1780070359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=;
        b=A6nvknH3c/mTS4tmw7KaqV768z3fAvJe1hr2zTDYka1vk/qqCuXfK9XHIOfc/fdNgq
         o4ctgahtkZwqGMHrAJxogx0tcaV5BZ3m/ULEZqFrjqSP7dvSfEpbl6Cd7eEGnGomKp7+
         bpBmJCe5LPtsgTm+OZi7ZNoV70U4xTunnYjcjVr1knXgU6mscGaSZGASJcfrf4lpG7e0
         4k64PyRB9qQUpKiPxFqHQ9+30gwNA3H/8y4UZZ3sCau9EMjO38WwjAGB3tdZZSz7raDM
         BhKdwgfnSUjcYIfd73qgGxE9ELL3e/zzucXN0MiXxMVf20AE5XitrhmbzY1F+huWAe0a
         6AjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9D083JSpTRRjZLxzVUx94/0rbmPrjKJGyuN0T7YpP/7yz2DeSB16/UZiLyO6ipDru2BzoCDJL8F/7r27LT@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9V6shuKBfnX998GrB0dwu++c5wAHdtq9FuiqIPozom53Ejfx
	k3Qt2g3uC8hTZEjDOZ8C8TVugo58c32ur0pcLpTGoChi6EqxsHQGaAB4olx+43axyhvUjuVah+b
	y+fShtv2O2L8lMtFyNFYi9S+g0aG4Gqqpb3+cDox4EWCSlb+z53seYeR5nR6zEuVYVdkm
X-Gm-Gg: Acq92OHC+sU58tAiS/PLW1gL30vbLA8rDuhLpW+NrUAVKnQE77VKX5j6aYdUiOLiayx
	ecluNTUM8EUWwHaEGiYGIlSD/CnU7+zhGxMdFuPKkdY5gePjqa0a/CkWFckbSqyuENTozyQmTG0
	1c5kznWmF30gy8g7PZygWEnVj6n2Pxz9FL7Ni1ZP1UXIFyjjfG9u3wQiGrRhQrsnpM2MWq7wbTS
	pVjQbN+5zDZpOc45DaPTXE8NSOxpRApyhecvwW1rQHtdJ3xArrPeVDxFoWlag1jAz0C9B7Z4zkU
	qRReAUtyn2Dmo9nt0qnSydqFNk0vptpN8Tjzd09BjInrBCNjDENJjeMU9wWF9qWfBaJQnTBosbK
	Ra6xwrfr1dMopHfVqCRA/1GVnndg6EaGzCsZUt4tbisx2riF/7/O9RDpXNEE55keAKELlWY52Bu
	vSK2vNAO+ImQ==
X-Received: by 2002:a05:690c:25c9:b0:7ba:f690:70be with SMTP id 00721157ae682-7d337fa0bdfmr51043367b3.7.1779465558792;
        Fri, 22 May 2026 08:59:18 -0700 (PDT)
X-Received: by 2002:a05:690c:25c9:b0:7ba:f690:70be with SMTP id 00721157ae682-7d337fa0bdfmr51042897b3.7.1779465558265;
        Fri, 22 May 2026 08:59:18 -0700 (PDT)
Received: from [192.168.101.236] (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c8basm9973097b3.37.2026.05.22.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:59:17 -0700 (PDT)
Message-ID: <8a6af223-901e-4d1a-ab3f-7e20980cb683@oss.qualcomm.com>
Date: Fri, 22 May 2026 08:59:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit
 after device teardown
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
        linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
 <d543fe6c-88a3-40b8-a83a-ccc6fa80eee3@linaro.org>
Content-Language: en-US
From: Michael Scott <mike.scott@oss.qualcomm.com>
In-Reply-To: <d543fe6c-88a3-40b8-a83a-ccc6fa80eee3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a107d57 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FPRIOUAp8Z76FSPQ8zIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: hUfUNrcKA_y1koFznKm2qqlT2LWrra5o
X-Proofpoint-GUID: hUfUNrcKA_y1koFznKm2qqlT2LWrra5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1OCBTYWx0ZWRfXzzXqnXx8Ryuu
 rqmybDB1B8965KwztDGttuanbzJrpQooofwwo/P7J+Df3G261/jxm3V+56KccIRYrzZgzWYDLv8
 j1P126E1wNXmUg8ZgQtrbL2vwn9m69vYOmnTnOy+JK33Q2OjiAaDIx6cSH/BOCUfJbmKCkEbK14
 fPiGXrIkxF7n0k6FFQ0gaGrVq8HSD2eBU3mjz+cVa35+NmVhrs3jlZYBZtJPDu/8pfe0Mf2D3ao
 OopkX1E2lq7bp0V+VbG9qHMYpYgOLi+YBWrDGRkv9Z4wJwPzTh6CSUKx5zqChNsIyCPlfGjWfMZ
 FNgqhxZfB3ilGpsh6mpWtdIYSluQeWWG0/C1Kxw55dPCAbjwoa397/vKppRUFU6g4Dww2w0KzR1
 ri/00wDqVrgNTqz43NFY1HaeNvCKa93FLcXFKkaVaVfBfWbq0D/eBZA53iQdqP9fDiqy+Wlf2aR
 hFMNag8r0ukJQO4H0OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220158
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-109363-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28FBA5B78B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 4:58 AM, Bryan O'Donoghue wrote:
> On 21/05/2026 02:09, Michael Scott wrote:
>> qmp_combo_usb_power_off() is reachable from an external consumer
>> (notably dwc3 via phy_exit() during driver unbind) after this device's
>> backing resources have already been released along a separate teardown
>> chain. The dereference of qmp->pcs (whose ioremap mapping has been
>> freed by devm cleanup) then takes a level-3 translation fault and
>> oopses.
>>
>> Easily reproducible during testing of USB-C role-switch enablement on
>> Dell Latitude 7455 (X1E80100), by writing "none" to a USB-C DWC3's
>> usb_role_switch role attribute, e.g.
>>
>>    echo none > /sys/class/usb_role/a800000.usb-role-switch/role
>>
>> which triggers the chain:
>>
>>    Unable to handle kernel paging request at virtual address 
>> ffff8000876c5400
>>    pc : qmp_combo_usb_power_off.isra.0+0x58/0x470 [phy_qcom_qmp_combo]
>>    Call trace:
>>      qmp_combo_usb_power_off+0x58/0x470 [phy_qcom_qmp_combo]
>>      qmp_combo_usb_exit+0x38/0x90 [phy_qcom_qmp_combo]
>>      phy_exit
>>      dwc3_phy_exit [dwc3]
>>      dwc3_core_remove [dwc3]
>>      dwc3_remove [dwc3]
>>      platform_remove
>>      device_release_driver_internal
>>      device_driver_detach
>>      unbind_store
>>      sysfs_kf_write
>>      vfs_write
>>      ksys_write
>>      __arm64_sys_write
>>      el0_svc
>>
>> Two WARNs precede the oops from the same teardown chain, confirming
>> the resource ordering:
>>
>>    WARNING: drivers/clk/clk.c:4494 at 
>> clk_nodrv_disable_unprepare+0x8/0x18
>>    WARNING: drivers/regulator/core.c:2657 at _regulator_put+0x84/0x98
>>
>> i.e. the pipe clock provider has been unregistered and the regulators
>> released before qmp_combo_usb_power_off() runs.
>>
>> The proper long-term fix is a teardown-ordering rework so the QMP
>> PHY's backing resources outlive any consumer that may still call its
>> phy_ops. Pending that, guard the power_off/exit paths with the
>> existing usb_init_count balance so re-entry after teardown does not
>> oops. usb_init_count tracks the balance of usb_power_on/off; if it
>> is zero we have either never powered on or have already powered off,
>> and there is nothing to do.
>>
>> The same guard is added to qmp_combo_usb_exit() since it is the entry
>> point used by external consumers via phy_exit().
>>
>> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
>
> Something like this requires a Fixes: tag
Thanks!  Noted.
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index cdcfad2e86b1..0db200292642 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy 
>> *phy)
>>       struct qmp_combo *qmp = phy_get_drvdata(phy);
>>       const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   +    /*
>> +     * Reachable as ->exit from external consumers (notably dwc3) after
>> +     * this device's backing resources have already been released along
>> +     * a teardown chain. Refuse to touch registers in that case.
>> +     */
>> +    if (!qmp->usb_init_count) {
>> +        dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
>> +            __func__);
>> +        return 0;
>> +    }
>> +
>>       /* PHY reset */
>>       qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   @@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
>>       struct qmp_combo *qmp = phy_get_drvdata(phy);
>>       int ret;
>>   +    /*
>> +     * See qmp_combo_usb_power_off(): an external consumer may call
>> +     * phy_exit() after the QMP device's resources have been torn
>> +     * down. usb_init_count tracks usb_init/usb_exit balance.
>> +     */
>> +    if (!qmp->usb_init_count) {
>> +        dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
>> +            __func__);
>> +        return 0;
>> +    }
>> +
>>       mutex_lock(&qmp->phy_mutex);
>>       ret = qmp_combo_usb_power_off(phy);
>
> This can't be right - you check usb_init_count before the mutex and 
> then again inside the mutex @ qmp_combo_usb_power_off();
>
> It seems like an error to even get to this function with 
> !usb_init_count also check if that is a signed or an unsigned value as 
> usb_init_count = -1 will evaluate true.

Yep, there are a few issues with this patch (and this looks like an 
extra check I accidentally left in).  I'm dropping this from the 
patchset and I'll revisit at a later date.

Apologies for the noise.

>
>>       if (ret)
>> -- 
>> 2.53.0
>>
>

