Return-Path: <linux-arm-msm+bounces-97896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDRLFE7Zt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:19:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA40297CE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5268F3005AE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4D438E5D6;
	Mon, 16 Mar 2026 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhI0r4J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqDHrgut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7B38E126
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656395; cv=none; b=EQq0AtviDAtc8hQL4/dIAaixLEAri/Uja9iBFWgXVG5ISuoQpgGyLCcqgSGbyTKoLUsWJs5w7cqwPIHkldRb08K/jYngr9FCjBrWINzc3Sx3P5Th8QCenmfReaQoGeoxEqz/V2CxzsX69JHYjam0rnhodfJ7BigdrfBQqgEcFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656395; c=relaxed/simple;
	bh=12/NLr7alOSCqerRS64Wuq+i16eJUZJEVOjx4iWuFPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRuVqZIFlCXh/JorokOUnalsU4EadUF4CYBvLufPjqNjxpb5ecNkFO9UrtLO2yGXtXNafzeRhaCy1nHq6hLmzqQax6bLudTMYXlsaAa42NZOSQzFy0RWkz5DnjcIiMeqPdcbLPAq4mtKw1ViJePkuv4+sj7M/S/RUgqaGSbWzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhI0r4J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqDHrgut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gEm744129
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HlpOaypzQ+lzmlFaIM3kqq13ADeSYieA8ArdWdv7LwM=; b=VhI0r4J/0NKtvYGy
	z10DvA9xfunZp6gOLMiQIpshCaVVvtUI9rUY8lI7MkosTnXzNnu8IFwQlhNml87h
	YFFp17TNXt/A7qIIBGOmppqMPrvRkLxwcrqRrGENU8Hwo9DkMJyPXSkD4g6r2Odo
	7xNdJLizP+BoQtAmQOgio+eh88+GFW9WYAJOswsZus2zOavmV4B1rnkT7UGndKyR
	90RyyJb/cRCoXPH6NyWbIzGum758kXC7FoO935E/+x7BnVVokh2cWb/QcE7MfD1/
	IrSagM9pH4PLyb/wKKIa7pA/CaUs5Ik8Bt4PQ9mNx3MXZye/NhcFyPU9oPtOIcVl
	hrSlCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bda2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:19:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so22186698a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656391; x=1774261191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlpOaypzQ+lzmlFaIM3kqq13ADeSYieA8ArdWdv7LwM=;
        b=dqDHrgutRefXloKI63YSkk/GiPAhtGvvzTlsLWXaN6ePZNI5t88P4Q6hFn82q0VN9u
         bFXm3AlBszGRFfWBIAHnD0I8OdoLtv6fpfSWrl6hdo4Hc/R8V6xkRmDufnhV9iySSj1b
         L0NIw5WgvJpqWNRukbniyyOiTYIoMJdw3mkHlQxenyeZ5jrjRD/Oz6D6WYRoiOCDJ4Mf
         W3UbRn42KEBuR9rj9i+XCvVc4poMXPXlUdubWPkC/koYP5Lvq6eXP2FDsyhVneGl7d8C
         On03odKJnIiCsKMjdSVbSaSn/VRY+UCN4tks2nxJ5XToXXVMdrelqAB1Wrf3gLpyyoLa
         RCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656391; x=1774261191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlpOaypzQ+lzmlFaIM3kqq13ADeSYieA8ArdWdv7LwM=;
        b=QjPzMQ2cgjxk9I4E1igqJM4X7k+m3+W5FJ9E3B1/+u1aMxQz6QNNBIPy2qmj4bQQfe
         OK26xMmcTzILhNwALUyFeEnVzbj44/4PjZlXI7OajhZA2qLq7QuKzb6/4hva3aFwNFS0
         MSgKUheXWsmqi1ozZxyKB9xJ81gU0UwySI7YnA+w8wVMJmKIIYfQUZyVOpssaAXpR62s
         7qc+ICGOnVgdtDl46pRP3eBGR6z9aX9uanxMi/K2gPOEtuqhFE9F7O3MZ6JKYGR+2T6s
         Z+qef/0+ygbPVsjqLUMvSbltQsnZ+CgdpORVE6VniSmSE5MNCA2dA4yq9jCFL1tF77W3
         wO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3LfSEPbT663WxGY8vIDWeoKKhJUbI0j9eC6iHxAKlilkblH0YhBS/8Plr67zYxfTLhrnJcOXx1y8l2q++@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/h+nH/4pxnorqruOCOcqjttdt1tGUlAJq1puvQU/4LGyi4oQ
	9OXbq/J8LG08ZFBA0nqojUvDvdlRz6SCu6Bw6T1FirL8LW7f38rvW+gAQSAHCY03JxqUVJxX8nj
	FebBvuT8feYS0Xrk2jnB46dFYL8Z5JpFpXkfeE1wNP5tyfqZicbtihvHKksUZSmSBv+RZ
X-Gm-Gg: ATEYQzyAlQ0EJz/dtpzK2veHo+SXAeM+XoSGucnpFvq4O6tpar+ymRmQCmrePAEX5gY
	MPJI322WFq4NGFz0XmJOhF7saZ3C57c6n/UJVCVY4miBF+gTEf1znUVRovd6FwLOpgfG7zj6lBc
	pqz1YqRpET0FyVC1LJPRyUOnvWa+UW2DTiEVWxuknSUNo+H7x87vwErOKPj7lc2piHJD4qeoN4E
	FGGsrVDsIa8zLLMJvIxc70PIiAvC1jRqWnaIOSCfjdCbQAfWzz1x0kRlAjKm224i5p+QvzmX86Y
	VCyg8S2HOgtcfW34U0OddceJAUK5bJWAVg18WPu3/C11QP85DL7rz4+CsUOfl249ci5TC33yoCX
	9KF6JQEvLQyNGYP+ktZeyoSj9f/9rrzaHl5N9ycQTVALs236QXxc=
X-Received: by 2002:a17:90b:28ce:b0:359:8190:eede with SMTP id 98e67ed59e1d1-35a21e795e2mr10925784a91.9.1773656390706;
        Mon, 16 Mar 2026 03:19:50 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:359:8190:eede with SMTP id 98e67ed59e1d1-35a21e795e2mr10925751a91.9.1773656390002;
        Mon, 16 Mar 2026 03:19:50 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b90d3f572sm6413766a91.14.2026.03.16.03.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:19:49 -0700 (PDT)
Message-ID: <0f0ffa3e-36b0-4891-939c-8bfa89ec7e84@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:49:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] thermal: qcom: add qmi-cooling driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-5-gaurav.kohli@oss.qualcomm.com>
 <aaqe4Crgjswl5f-s@mai.linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <aaqe4Crgjswl5f-s@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7d948 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9U70_tPS8JYdgQIxHfoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NyBTYWx0ZWRfX0TgMWEmYqhbR
 8X55ymzRWgJ/PhyJV6L9Z96SCDZO8rWoFXVbZQSab8y8vK8odmqftTPGJC4d5VfK4umnIpIzWYw
 b63pV/+uqb89+VaqfI+hlRE+vS1uwrLNlzSe9lkMuOjbjEzFWxsoehLrDuFc/IGZI8Q56tw44Fq
 0QmGUO6pCZsZ7smjz/r11/Xc4x+MlFWbhzuFpjgnHDVb4h3mwQmx9ht4O3jW8VoJfBiP4z7Eirn
 /pgWW3TNd5WF68DN7OwS04rcL2M9y6gpVT6U2s8vVfonlW95scvK9F0BOy85Z3pRvNlCk4eLyy8
 cNmtrKu2Oen6/hgo5bKjZSKuGn+tPeBHwJZ17SdOHL9QVxfHeaooYuqWK8BfYCgthB3lGaE1hmz
 /A7J00ycrRua2efbIvJ0PGYBsY1CtfJUaEcnQV1XBRZNlQprYp1l1A8vzTGfZFDUNFmHRQiUhKY
 8ag6cOLXJFAb42olbmg==
X-Proofpoint-GUID: jX92yj5yNcAxd-eux85lAVCQdFyvrlE3
X-Proofpoint-ORIG-GUID: jX92yj5yNcAxd-eux85lAVCQdFyvrlE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97896-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AA40297CE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/6/2026 3:01 PM, Daniel Lezcano wrote:
> On Tue, Jan 27, 2026 at 09:27:18PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> The Thermal Mitigation Device (TMD) service exposes various platform
>> specific thermal mitigations available on remote subsystems (ie the
>> modem and cdsp). The service is exposed via the QMI messaging
>> interface, usually over the QRTR transport.
>>
>> Qualcomm QMI-based TMD cooling devices are used to mitigate thermal
>> conditions across multiple remote subsystems. These devices operate
>> based on junction temperature sensors (TSENS) associated with thermal
>> zones for each subsystem.
> 
> IIUC, QMI is the messaging mechanism for remote proc. TMD is the cooling device.
> 
> If it is correct, I suggest to follow the following organisation:
> 
>   - tmd_interface.c (qmi <-> tmd)
>   - tmd_cooling.c (tmd <-> thermal framework)
> 
> So we end up with:
> 
> qmi_interface -> tmd_interface -> tmd_cooling
> 

Thanks Daniel for review.

As discussed, I will make the changes as per the suggested partitions.

> AFAICT, it is similar with the pdr_interface, right ?
> 
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> ---
>>   drivers/soc/qcom/Kconfig       |  13 +
>>   drivers/soc/qcom/Makefile      |   1 +
>>   drivers/soc/qcom/qmi-cooling.c | 510 +++++++++++++++++++++++++++++++++
>>   drivers/soc/qcom/qmi-cooling.h | 429 +++++++++++++++++++++++++++
>>   4 files changed, 953 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.c
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.h
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 2caadbbcf830..905a24b42fe6 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -124,6 +124,19 @@ config QCOM_PMIC_GLINK
>>   	  Say yes here to support USB-C and battery status on modern Qualcomm
>>   	  platforms.
>>   
>> +config QCOM_QMI_COOLING
>> +	tristate "Qualcomm QMI cooling drivers"
>> +	depends on QCOM_RPROC_COMMON
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	select QCOM_QMI_HELPERS
>> +	help
>> +	   This enables the remote subsystem cooling devices. These cooling
>> +	   devices will be used by Qualcomm chipset to place various remote
>> +	   subsystem mitigations like remote processor passive mitigation,
>> +	   remote subsystem voltage restriction at low temperatures etc.
>> +	   The QMI cooling device will interface with remote subsystem
>> +	   using Qualcomm remoteproc interface.
>> +
>>   config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index b7f1d2a57367..b6728f54944b 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>>   CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
>> +obj-$(CONFIG_QCOM_QMI_COOLING) += qmi-cooling.o
>>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>>   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>> diff --git a/drivers/soc/qcom/qmi-cooling.c b/drivers/soc/qcom/qmi-cooling.c
>> new file mode 100644
>> index 000000000000..463baa47c8b6
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi-cooling.c
>> @@ -0,0 +1,510 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2017, The Linux Foundation
>> + * Copyright (c) 2025, Linaro Limited
>> + *
>> + * QMI Thermal Mitigation Device (TMD) client driver.
>> + * This driver provides an in-kernel client to handle hot and cold thermal
>> + * mitigations for remote subsystems (modem and DSPs) running the TMD service.
>> + * It doesn't implement any handling of reports from remote subsystems.
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/net.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/remoteproc/qcom_rproc.h>
>> +#include <linux/remoteproc_cooling.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/qmi.h>
>> +#include <linux/thermal.h>
>> +
>> +#include "qmi-cooling.h"
>> +
>> +#define CDSP_INSTANCE_ID	0x43
>> +#define CDSP1_INSTANCE_ID	0x44
>> +
>> +#define QMI_TMD_RESP_TIMEOUT msecs_to_jiffies(100)
>> +
>> +/**
>> + * struct qmi_tmd_client - TMD client state
>> + * @dev:	Device associated with this client
>> + * @name:	Friendly name for the remote TMD service
>> + * @handle:	QMI connection handle
>> + * @mutex:	Lock to synchronise QMI communication
>> + * @id:		The QMI TMD service instance ID
>> + * @cdev_list:	The list of cooling devices (controls) enabled for this instance
>> + * @svc_arrive_work: Work item for initialising the client when the TMD service
>> + *		     starts.
>> + * @connection_active: Whether or not we're connected to the QMI TMD service
>> + */
>> +struct qmi_tmd_client {
>> +	struct device *dev;
>> +	const char *name;
>> +	struct qmi_handle handle;
>> +	struct mutex mutex;
>> +	u32 id;
>> +	struct list_head cdev_list;
>> +	struct work_struct svc_arrive_work;
>> +	bool connection_active;
>> +};
>> +
>> +/**
>> + * struct qmi_tmd - A TMD cooling device
>> + * @np:		OF node associated with this control
>> + * @type:	The control type (exposed via sysfs)
>> + * @qmi_name:	The common name of this control shared by the remote subsystem
>> + * @rproc_cdev:	Remote processor cooling device handle
>> + * @cur_state:	The current cooling/warming/mitigation state
>> + * @max_state:	The maximum state
>> + * @client:	The TMD client instance this control is associated with
>> + */
>> +struct qmi_tmd {
>> +	struct device_node *np;
>> +	const char *type;
>> +	char qmi_name[QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1];
>> +	struct list_head node;
>> +	struct remoteproc_cdev *rproc_cdev;
>> +	unsigned int cur_state;
>> +	unsigned int max_state;
>> +	struct qmi_tmd_client *client;
>> +};
>> +
>> +/**
>> + * struct qmi_instance_id - QMI instance match data
>> + * @id:		The QMI instance ID
>> + * @name:	Friendly name for this instance
>> + */
>> +struct qmi_instance_data {
>> +	u32 id;
>> +	const char *name;
>> +};
>> +
>> +/* Notify the remote subsystem of the requested cooling state */
>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd)
>> +{
>> +	struct tmd_set_mitigation_level_resp_msg_v01 tmd_resp = { 0 };
>> +	struct tmd_set_mitigation_level_req_msg_v01 req = { 0 };
>> +	struct qmi_tmd_client *client;
>> +	struct qmi_txn txn;
>> +	int ret = 0;
>> +
>> +	client = tmd->client;
>> +
>> +	guard(mutex)(&client->mutex);
>> +
>> +	/*
>> +	 * This function is called by qmi_set_cur_state() which does not know if
>> +	 * the QMI service is actually online. If it isn't then we noop here.
>> +	 * The state is cached in tmd->cur_state and will be broadcast via
>> +	 * qmi_tmd_init_control() when the service comes up.
>> +	 */
>> +	if (!client->connection_active)
>> +		return 0;
>> +
>> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->qmi_name,
>> +		QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);
>> +	req.mitigation_level = tmd->cur_state;
>> +
>> +	ret = qmi_txn_init(&client->handle, &txn,
>> +			   tmd_set_mitigation_level_resp_msg_v01_ei, &tmd_resp);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn init failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_send_request(&client->handle, NULL, &txn,
>> +			       QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01,
>> +			       TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN,
>> +			       tmd_set_mitigation_level_req_msg_v01_ei, &req);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn send failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn wait failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (tmd_resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		ret = -tmd_resp.resp.result;
>> +		dev_err(client->dev, "qmi set state %d NOT success for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(client->dev, "Requested state %d/%d for %s\n", tmd->cur_state,
>> +		tmd->max_state, tmd->type);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_get_max_level(void *devdata, unsigned long *level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
>> +
>> +	*level = tmd->max_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_get_cur_level(void *devdata, unsigned long *level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
>> +
>> +	*level = tmd->cur_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_set_cur_level(void *devdata, unsigned long level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
>> +
>> +	if (level > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	if (tmd->cur_state == level)
>> +		return 0;
>> +
>> +	tmd->cur_state = level;
>> +
>> +	return qmi_tmd_send_state_request(tmd);
>> +}
>> +
>> +static const struct remoteproc_cooling_ops qmi_rproc_ops = {
>> +	.get_max_level = qmi_get_max_level,
>> +	.get_cur_level = qmi_get_cur_level,
>> +	.set_cur_level = qmi_set_cur_level,
>> +};
>> +
>> +static int qmi_register_cooling_device(struct qmi_tmd *tmd)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev;
>> +
>> +	rproc_cdev = remoteproc_cooling_register(tmd->np,
>> +						 tmd->type,
>> +						 &qmi_rproc_ops,
>> +						 tmd);
>> +
>> +	if (IS_ERR(rproc_cdev))
>> +		return dev_err_probe(tmd->client->dev, PTR_ERR(rproc_cdev),
>> +				     "Failed to register cooling device %s\n",
>> +				     tmd->qmi_name);
>> +
>> +	tmd->rproc_cdev = rproc_cdev;
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Init a single TMD control by registering a cooling device for it, or
>> + * synchronising state with the remote subsystem if recovering from a service
>> + * restart. This is called when the TMD service starts up.
>> + */
>> +static int qmi_tmd_init_control(struct qmi_tmd_client *client, const char *label,
>> +				u8 max_state)
>> +{
>> +	struct qmi_tmd *tmd = NULL;
>> +
>> +	list_for_each_entry(tmd, &client->cdev_list, node)
>> +		if (!strncasecmp(tmd->qmi_name, label,
>> +				 QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1))
>> +			goto found;
>> +
>> +	dev_dbg(client->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->rproc_cdev)
>> +		return qmi_tmd_send_state_request(tmd);
>> +
>> +	return qmi_register_cooling_device(tmd);
>> +}
>> +
>> +/*
>> + * When the QMI service starts up on a remote subsystem this function will fetch
>> + * the list of TMDs on the subsystem, match it to the TMDs specified in devicetree
>> + * and call qmi_tmd_init_control() for each
>> + */
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *client =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_mitigation_device_list_req_msg_v01 req = { 0 };
>> +	struct tmd_get_mitigation_device_list_resp_msg_v01 *resp __free(kfree) = NULL;
>> +	int ret = 0, i;
>> +	struct qmi_txn txn;
>> +
>> +	/* resp struct is 1.1kB, allocate it on the heap. */
>> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
>> +	if (!resp)
>> +		return;
>> +
>> +	/* Get a list of TMDs supported by the remoteproc */
>> +	scoped_guard(mutex, &client->mutex) {
>> +		ret = qmi_txn_init(&client->handle, &txn,
>> +				   tmd_get_mitigation_device_list_resp_msg_v01_ei, resp);
>> +		if (ret < 0) {
>> +			dev_err(client->dev,
>> +				"Transaction init error for instance_id: %#x ret %d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +
>> +		ret = qmi_send_request(&client->handle, NULL, &txn,
>> +				       QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01,
>> +				TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN,
>> +				tmd_get_mitigation_device_list_req_msg_v01_ei, &req);
>> +		if (ret < 0) {
>> +			qmi_txn_cancel(&txn);
>> +			return;
>> +		}
>> +
>> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +		if (ret < 0) {
>> +			dev_err(client->dev, "Transaction wait error for client %#x ret:%d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>> +			ret = resp->resp.result;
>> +			dev_err(client->dev, "Failed to get device list for client %#x ret:%d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +
>> +		client->connection_active = true;
>> +	}
>> +
>> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
>> +		struct tmd_mitigation_dev_list_type_v01 *device =
>> +			&resp->mitigation_device_list[i];
>> +
>> +		ret = qmi_tmd_init_control(client,
>> +					   device->mitigation_dev_id.mitigation_dev_id,
>> +					   device->max_mitigation_level);
>> +		if (ret)
>> +			break;
>> +	}
>> +}
>> +
>> +static void thermal_qmi_net_reset(struct qmi_handle *qmi)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +	struct qmi_tmd *tmd = NULL;
>> +
>> +	list_for_each_entry(tmd, &client->cdev_list, node) {
>> +		qmi_tmd_send_state_request(tmd);
>> +	}
>> +}
>> +
>> +static void thermal_qmi_del_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	scoped_guard(mutex, &client->mutex)
>> +		client->connection_active = false;
>> +}
>> +
>> +static int thermal_qmi_new_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
>> +
>> +	scoped_guard(mutex, &client->mutex)
>> +		kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq, sizeof(sq), 0);
>> +
>> +	queue_work(system_highpri_wq, &client->svc_arrive_work);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct qmi_ops thermal_qmi_event_ops = {
>> +	.new_server = thermal_qmi_new_server,
>> +	.del_server = thermal_qmi_del_server,
>> +	.net_reset = thermal_qmi_net_reset,
>> +};
>> +
>> +static void qmi_tmd_cleanup(struct qmi_tmd_client *client)
>> +{
>> +	struct qmi_tmd *tmd, *c_next;
>> +
>> +	guard(mutex)(&client->mutex);
>> +
>> +	client->connection_active = false;
>> +
>> +	qmi_handle_release(&client->handle);
>> +	cancel_work(&client->svc_arrive_work);
>> +	list_for_each_entry_safe(tmd, c_next, &client->cdev_list, node) {
>> +		if (tmd->rproc_cdev)
>> +			remoteproc_cooling_unregister(tmd->rproc_cdev);
>> +
>> +		list_del(&tmd->node);
>> +	}
>> +}
>> +
>> +/* Parse the controls and allocate a qmi_tmd for each of them */
>> +static int qmi_tmd_alloc_cdevs(struct qmi_tmd_client *client)
>> +{
>> +	struct device *dev = client->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct device_node *subnode;
>> +	struct qmi_tmd *tmd;
>> +	int ret;
>> +
>> +	for_each_available_child_of_node_scoped(node, subnode) {
>> +		const char *name;
>> +
>> +		tmd = devm_kzalloc(dev, sizeof(*tmd), GFP_KERNEL);
>> +		if (!tmd)
>> +			return dev_err_probe(client->dev, -ENOMEM,
>> +					     "Couldn't allocate tmd\n");
>> +
>> +		tmd->type = devm_kasprintf(client->dev, GFP_KERNEL, "%s",
>> +					   subnode->name);
>> +		if (!tmd->type)
>> +			return dev_err_probe(dev, -ENOMEM,
>> +					     "Couldn't allocate cooling device name\n");
>> +
>> +		if (of_property_read_string(subnode, "label", &name))
>> +			return dev_err_probe(client->dev, -EINVAL,
>> +					     "Failed to parse dev name for %s\n",
>> +					     subnode->name);
>> +
>> +		ret = strscpy(tmd->qmi_name, name,
>> +			      QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);
>> +		if (ret == -E2BIG)
>> +			return dev_err_probe(dev, -EINVAL, "TMD label %s is too long\n",
>> +					     name);
>> +
>> +		tmd->client = client;
>> +		tmd->np = subnode;
>> +		tmd->cur_state = 0;
>> +		list_add(&tmd->node, &client->cdev_list);
>> +	}
>> +
>> +	if (list_empty(&client->cdev_list))
>> +		return dev_err_probe(client->dev, -EINVAL,
>> +				     "No cooling devices specified for client %s (%#x)\n",
>> +				     client->name, client->id);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_client_probe(struct platform_device *pdev)
>> +{
>> +	const struct qmi_instance_data *match;
>> +	struct qmi_tmd_client *client;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	client = devm_kzalloc(dev, sizeof(*client), GFP_KERNEL);
>> +	if (!client)
>> +		return -ENOMEM;
>> +
>> +	client->dev = dev;
>> +
>> +	match = of_device_get_match_data(dev);
>> +	if (!match)
>> +		return dev_err_probe(dev, -EINVAL, "No match data\n");
>> +
>> +	client->id = match->id;
>> +	client->name = match->name;
>> +
>> +	mutex_init(&client->mutex);
>> +	INIT_LIST_HEAD(&client->cdev_list);
>> +	INIT_WORK(&client->svc_arrive_work, qmi_tmd_svc_arrive);
>> +
>> +	ret = qmi_tmd_alloc_cdevs(client);
>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, client);
>> +
>> +	ret = qmi_handle_init(&client->handle,
>> +			      TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN,
>> +			      &thermal_qmi_event_ops, NULL);
>> +	if (ret < 0)
>> +		return dev_err_probe(client->dev, ret, "QMI handle init failed for client %#x\n",
>> +			      client->id);
>> +
>> +	ret = qmi_add_lookup(&client->handle, TMD_SERVICE_ID_V01, TMD_SERVICE_VERS_V01,
>> +			     client->id);
>> +	if (ret < 0) {
>> +		qmi_handle_release(&client->handle);
>> +		return dev_err_probe(client->dev, ret, "QMI register failed for client 0x%x\n",
>> +			      client->id);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qmi_tmd_client_remove(struct platform_device *pdev)
>> +{
>> +	struct qmi_tmd_client *client = platform_get_drvdata(pdev);
>> +
>> +	qmi_tmd_cleanup(client);
>> +}
>> +
>> +static const struct qmi_instance_data qmi_cdsp = {
>> +	.id = CDSP_INSTANCE_ID,
>> +	.name = "cdsp",
>> +};
>> +
>> +static const struct qmi_instance_data qmi_cdsp1 = {
>> +	.id = CDSP1_INSTANCE_ID,
>> +	.name = "cdsp1",
>> +};
>> +
>> +static const struct of_device_id qmi_tmd_device_table[] = {
>> +	{
>> +		.compatible = "qcom,qmi-cooling-cdsp",
>> +		.data = &qmi_cdsp,
>> +	},
>> +	{
>> +		.compatible = "qcom,qmi-cooling-cdsp1",
>> +		.data = &qmi_cdsp1,
>> +	},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qmi_tmd_device_table);
>> +
>> +static struct platform_driver qmi_tmd_device_driver = {
>> +	.probe = qmi_tmd_client_probe,
>> +	.remove = qmi_tmd_client_remove,
>> +	.driver = {
>> +		.name = "qcom-qmi-cooling",
>> +		.of_match_table = qmi_tmd_device_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(qmi_tmd_device_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm QMI Thermal Mitigation Device driver");
>> diff --git a/drivers/soc/qcom/qmi-cooling.h b/drivers/soc/qcom/qmi-cooling.h
>> new file mode 100644
>> index 000000000000..e33f4c5979e5
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi-cooling.h
>> @@ -0,0 +1,429 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2017, The Linux Foundation
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef __QCOM_COOLING_H__
>> +#define __QCOM_COOLING_H__
>> +
>> +#include <linux/soc/qcom/qmi.h>
>> +
>> +#define TMD_SERVICE_ID_V01 0x18
>> +#define TMD_SERVICE_VERS_V01 0x01
>> +
>> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_RESP_V01 0x0020
>> +#define QMI_TMD_GET_MITIGATION_LEVEL_REQ_V01 0x0022
>> +#define QMI_TMD_GET_SUPPORTED_MSGS_REQ_V01 0x001E
>> +#define QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01 0x0021
>> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0023
>> +#define QMI_TMD_GET_SUPPORTED_MSGS_RESP_V01 0x001E
>> +#define QMI_TMD_SET_MITIGATION_LEVEL_RESP_V01 0x0021
>> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0024
>> +#define QMI_TMD_MITIGATION_LEVEL_REPORT_IND_V01 0x0025
>> +#define QMI_TMD_GET_MITIGATION_LEVEL_RESP_V01 0x0022
>> +#define QMI_TMD_GET_SUPPORTED_FIELDS_REQ_V01 0x001F
>> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01 0x0020
>> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0023
>> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0024
>> +#define QMI_TMD_GET_SUPPORTED_FIELDS_RESP_V01 0x001F
>> +
>> +#define QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 32
>> +#define QMI_TMD_MITIGATION_DEV_LIST_MAX_V01 32
>> +
>> +struct tmd_mitigation_dev_id_type_v01 {
>> +	char mitigation_dev_id[QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1];
>> +};
>> +
>> +static const struct qmi_elem_info tmd_mitigation_dev_id_type_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRING,
>> +		.elem_len = QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1,
>> +		.elem_size = sizeof(char),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_mitigation_dev_id_type_v01,
>> +				   mitigation_dev_id),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_mitigation_dev_list_type_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_dev_id;
>> +	u8 max_mitigation_level;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_mitigation_dev_list_type_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_mitigation_dev_list_type_v01,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_mitigation_dev_list_type_v01,
>> +				   max_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_device_list_req_msg_v01 {
>> +	char placeholder;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN 0
>> +const struct qmi_elem_info tmd_get_mitigation_device_list_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_device_list_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u32 mitigation_device_list_len;
>> +	struct tmd_mitigation_dev_list_type_v01
>> +		mitigation_device_list[QMI_TMD_MITIGATION_DEV_LIST_MAX_V01];
>> +};
>> +
>> +#define TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN 1099
>> +static const struct qmi_elem_info tmd_get_mitigation_device_list_resp_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_DATA_LEN,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list_len),
>> +	},
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = QMI_TMD_MITIGATION_DEV_LIST_MAX_V01,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_list_type_v01),
>> +		.array_type = VAR_LEN_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list),
>> +		.ei_array = tmd_mitigation_dev_list_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_dev_id;
>> +	u8 mitigation_level;
>> +};
>> +
>> +#define TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 40
>> +static const struct qmi_elem_info tmd_set_mitigation_level_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
>> +				   mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_SET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info tmd_set_mitigation_level_resp_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_resp_msg_v01, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +
>> +static const struct qmi_elem_info tmd_get_mitigation_level_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_req_msg_v01,
>> +				   mitigation_device),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 current_mitigation_level_valid;
>> +	u8 current_mitigation_level;
>> +	u8 requested_mitigation_level_valid;
>> +	u8 requested_mitigation_level;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 15
>> +static const struct qmi_elem_info tmd_get_mitigation_level_resp_msg_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   current_mitigation_level_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   current_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x11,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   requested_mitigation_level_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x11,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   requested_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_register_notification_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +static const struct qmi_elem_info
>> +	tmd_register_notification_mitigation_level_req_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x01,
>> +			.offset = offsetof(
>> +				struct tmd_register_notification_mitigation_level_req_msg_v01,
>> +				mitigation_device),
>> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_register_notification_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info
>> +	tmd_register_notification_mitigation_level_resp_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct qmi_response_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x02,
>> +			.offset = offsetof(
>> +				struct tmd_register_notification_mitigation_level_resp_msg_v01,
>> +				resp),
>> +			.ei_array = qmi_response_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_deregister_notification_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +static const struct qmi_elem_info
>> +	tmd_deregister_notification_mitigation_level_req_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x01,
>> +			.offset = offsetof(
>> +				struct tmd_deregister_notification_mitigation_level_req_msg_v01,
>> +				mitigation_device),
>> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_deregister_notification_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info
>> +	tmd_deregister_notification_mitigation_level_resp_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct qmi_response_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x02,
>> +			.offset = offsetof(
>> +				struct tmd_deregister_notification_mitigation_level_resp_msg_v01,
>> +				resp),
>> +			.ei_array = qmi_response_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_mitigation_level_report_ind_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +	u8 current_mitigation_level;
>> +};
>> +
>> +#define TMD_MITIGATION_LEVEL_REPORT_IND_MSG_V01_MAX_MSG_LEN 40
>> +static const struct qmi_elem_info tmd_mitigation_level_report_ind_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
>> +				   mitigation_device),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
>> +				   current_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +#endif /* __QMI_COOLING_INTERNAL_H__ */
>> -- 
>> 2.34.1
>>
> 


