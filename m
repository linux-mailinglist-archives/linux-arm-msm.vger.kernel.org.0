Return-Path: <linux-arm-msm+bounces-101459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKYaJ7MXzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:16:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9E384FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 171963089E70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 07:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563013845A8;
	Thu,  2 Apr 2026 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0qwkRGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRZEvJpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17B638642A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114115; cv=none; b=SBW4tvdevGRK3cfRNZ7ZBbXeeAZwZXZ7kHfMWFGmY5E3PRQ3qKrlYHX6ipezq3JLQG5tJKptOx+qNmE0zX2+pQY1JVcRwmMQTaG3fqx5XajaOsyoJpVO8tk/968y9cEedJ2uYUqgpDgYg1eHS4xOXtVCV9nCRLNYnCWeQzHaFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114115; c=relaxed/simple;
	bh=MVq8DhWMoK6RvFUDjljEbOIvSXLNjTRMDjhVlbIQDXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myggWnaW9PISy/6cYBuj3HfGuZmvhmRHSKxlDiuSJeWbU5x3b5XmCs5a7reu2g6gEsAD2tunpHNwZZY1tZzN2Zz01BmEl+83PuZTjNMMSXnyV7ZPXylrbxJkCw7Sx6ohOFgu1hG3IvS210bCuWV3vjgzFTuXRERH8l8PfGuB3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0qwkRGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRZEvJpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63270Td01128397
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 07:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=; b=Z0qwkRGPV5Pa3anG
	LSYxGqESmPkCyAtnYDmY5WRjqGdFCWUMEFdW2uMlPAWFjuq+m6bne7nQMdT/cdbN
	kXmUC4zM8cEAegY9lGekAmpSMFpP0aS8WZzm6i85rpjfUgkKpmlCvRra9OhYzBBr
	l9C5K6twqpbvfYkT0VDcBNOwtRzTEaVTVe5OTCYw46UQToUi5kmSOAn7Y34qpRX2
	5x283TF1G1raaCYsmIFJ29IRAgk9TjE6sLOQrw+nZWdfCExdSwNmYihr3JSeehdZ
	BjG0WBQWQKSgW9mvN5iwyEdjDyHtmQ7wyLdB0taDoNd5EYaDYNMYj2VwfCTl3Izg
	iqEpLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9asgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 07:15:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso622963a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775114111; x=1775718911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=;
        b=BRZEvJpiDYKzUjlb9xBZ3YyWdbAizAPMezp0iRwYyJIzm0YfWrX+wR5rKLyx0flcwV
         h7ernfn+dVwTJaHSo05dsEewFvK8g2cCjAl8HdjcjqkNww4PTqFErroK5BHabTaFM4Oz
         kBBUUtdKfdTeB7fYL+5fwqHui1A8hSG4QSMNinZiKcf/E+WB3fYqgYK3187lkzo4bw3g
         JZK8AS+Ibjvi+hKU2zbhhSTY/8p3pjedv2Vk15VpZWZYW89bHi26wYQsPkzrBy4ecVwl
         KJ7b0qZmfZUIrtwHJnXipgVi/HX+AcgFr4v5g69d7qbUAv8lMcLwBfwtNp/xP4jwVlYh
         3Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114111; x=1775718911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=;
        b=UAVswdRdgMtvowkHHVnFjBj05Rtn9xD3FRP6gnfv1BrShYYVHO7NAZRZyNt5y7dtl5
         65Q11c7x1BIeAwiWFD2YDOYHXZiEXk6GXB6rPj6N4w4I/CGWNbUfje8g346kE0G/imLi
         gr7xJM6mcF0IFUkihhfXkia56O74KnOrW6UwhDlCi0BWPycI+2nxLipE/RhDFgftIFui
         ztNbRXETB0Cug8xH3SiSLnlz5eadoad++VDzt0tMfU6XCvivlfXaldEEhRMWS3YcXujo
         5o4JGWGriLI52jqYMeri8ZImkVeip1ivuxpqb2UppA8Rvs9GgjN9l2KaihCitKnBwOkb
         haiw==
X-Forwarded-Encrypted: i=1; AJvYcCVyAX9Wku2QnmMNRly1aEA7SN3yUYute6D+QtAXd368WXsjlgHEuenbhje1UzsOJfLLU7adYhzzjMGKrcYz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3G2z27kwVPBBLq36zY6o1yUizA+9xwhvq2jvrO0xms00T+2I3
	+PiQVep0JvKp+yZivvqmNeR7AjBgm8fSnCDWVQ4tg3CmRBTB44MKw0tVqjYG+ohJnmuPdEC10Bu
	bgAxQRAlncAct1tS50lln13FAt7SyfWkwTTVSpj5wH1rbwkdTXbk0q4m04hMDwcneWKHe
X-Gm-Gg: AeBDietOMVUN8EFSskeg8IZJalQfC6A6O52EYKL6RyCnUtFYjJ+uDlM8xvjdZPw92Tv
	CA3gRGeFhEQ0tEI6DBI0mLwsD8F8G9fTNSB6d7qd+L+HAhrCUSeHt0dmG9nfrz4Zb90ohFvU2m6
	/VbVOwxEN6S4rGLyGVJBx9dwly+YeewAdFg/X5FmVhK2tKik4I3tlAPGklAZzIcOIMsiqmOWvgE
	h3uML/0r23S5o5KKEQfSCok8KC8C3+fHhazazFR9zwcgkRpJMMmAOvz0oZfnhMcZAUu43oK5nBL
	f8C44f/OAUJvhTfEnWP9mfEHcg2a7gc/xAFs1XWznj0kSx6/TJNw4gqIfSkZf/LNKsi9FLo3Ytb
	S3TZuSiJ8wXIzE1LBJjF+wjqHAdfQloYkr10SHtnK03IzmDSlqKnf
X-Received: by 2002:a17:90b:3e4e:b0:35d:8fdb:4f26 with SMTP id 98e67ed59e1d1-35dc6e2d0camr5522375a91.1.1775114111503;
        Thu, 02 Apr 2026 00:15:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4e:b0:35d:8fdb:4f26 with SMTP id 98e67ed59e1d1-35dc6e2d0camr5522327a91.1.1775114110887;
        Thu, 02 Apr 2026 00:15:10 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.224.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491157sm1629948a12.9.2026.04.02.00.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 00:15:10 -0700 (PDT)
Message-ID: <78c3e17a-9e67-4de1-9137-5fb617ff2e32@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:45:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sudeep Holla
 <sudeep.holla@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <acrdFfk8al80dynq@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce1780 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j/PqwQOCDgRQPIT2BnD5zw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8
 a=DkhKwNFMYnxxsx_nhJ0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 5TRFC2nYaD0xURM8_3_xLdhgxgrs4QyT
X-Proofpoint-GUID: 5TRFC2nYaD0xURM8_3_xLdhgxgrs4QyT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MiBTYWx0ZWRfX74CldZB2zHCn
 Qj+tVhIh+UvQZgEedoEGiLMzNNcJvIV4TzI4Jg94rnN/35L/5Ao+B1ZKPSQjrH5GWR3WNlUMe5x
 DH0J5G36xVOSzafOP9Njx8/mpKDf1CqacOVtnkpC1REEufFCONzD3UWoSOl2PMsnzZ1Jfj7sNpI
 a045ERVl1XdP4upHc2wLpxybgfiCNHOlenO2JJ1+DN1Tg+A7KpSVa13Beqs93Hlh2/tbeWdpTpE
 Df1jDMesXU/YLQdiw62h6RNOlANXi2McyTDdWb4WacWVyu0wTDyDS41sdu3p54RgD7JZlhZNylq
 IL7YL1wDTEc17uzk/kTl2JDbIB9Kq63SDTLz4gtg789dowwZRucDNc237brJrFW/QgWKQ66SxLh
 HkXvh2oyl3m05BXijwzvhiH1ctNi6S3WmJHK/pp436GocelV3fYDc8a6EYRJ1VpmWAo4jRrWVSu
 tPvz9DGEPcTMKLpqokg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101459-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BB9E384FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 2:18 AM, Bjorn Andersson wrote:
> On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
>> firmware to implement the suspend to RAM (S2RAM) functionality by
>> transitioning the system to a deeper low power state. When the system
>> enters such state, the power to the peripheral devices might be removed.
> 
> What is the actual extent of "peripheral devices" in this definition?
> 
>> So
>> the respective device drivers must prepare for the possible removal of the
>> power by performing actions such as shutting down or resetting the device
>> in their system suspend callbacks.
>>
> 
> Our typical interpretation of this state is that IP-blocks might be
> non-functional during this time, but typically some state is retained.
> 
> Will the acceptance of this patch result in that we in the Qualcomm case
> should start accepting/writing patches that implement save/restore of
> state that is generally retained throughout the drivers - in the name of
> "power might be removed"?
> 
>> The Linux PM framework allows the platform drivers to convey this info to
>> device drivers by calling the pm_set_suspend_via_firmware() and
>> pm_set_resume_via_firmware() APIs.
>>
>> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
>> mentioned APIs in the psci_system_suspend_begin() and
>> psci_system_suspend_enter() callbacks.
>>
> 
> With the right interpretation of what this means for us, I think this
> patch looks good - but as we've discussed, I'm a bit worried about how
> to deal with the alternative interpretations.
> 
> Specifically, if we fully adopt "power might be removed", we should to
> take actions which will prevent a typical Qualcomm system from waking up
> from sleep again.

The "power might be removed" not necessarily indicate that devices/ peripherals
should remove the wake up capability of interrupts in order to prevent waking up
from sleep.

The hibernation + suspend-to-ram is one such example, where "power might
be removed" but devices may still leave the wake up interrupts enabled.

Pasting from commit 62c552ccc3ed ("PM / Hibernate: Enable suspend to both for in-kernel hibernation.")

 |   It is often useful to suspend to memory after hibernation image has been
 |   written to disk. If the battery runs out or power is otherwise lost, the
 |   computer will resume from the hibernated image. If not, it will resume
 |   from memory

Which can be interpreted as wake up interrupt should be able to wake from suspend-to-ram state
"to the point until the power is cut off or battery runs out".

And in order to do so, wake up capable interrupts should be left enabled in HW,
for interrupt controllers like GIC (and PDC in Qualcomm SoC cases) to support wake up.

Adding Cc: linux-arm-msm for better visibility.

Thanks,
Maulik

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> [mani: reworded the description to be more elaborative]
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
>>
>> This patch was part of an old series that didn't make it to mainline due to
>> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
>> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
>>
>> But this patch on its own is useful for platforms implementing the S2RAM
>> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
>> resending it.
>>
>>  drivers/firmware/psci/psci.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22..e73bae6cb23a 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
>>  
>>  static int psci_system_suspend_enter(suspend_state_t state)
>>  {
>> +	pm_set_resume_via_firmware();
>> +
>>  	return cpu_suspend(0, psci_system_suspend);
>>  }
>>  
>> +static int psci_system_suspend_begin(suspend_state_t state)
>> +{
>> +	pm_set_suspend_via_firmware();
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct platform_suspend_ops psci_suspend_ops = {
>>  	.valid          = suspend_valid_only_mem,
>>  	.enter          = psci_system_suspend_enter,
>> +	.begin          = psci_system_suspend_begin,
>>  };
>>  
>>  static void __init psci_init_system_reset2(void)
>> -- 
>> 2.48.1
>>
> 


