Return-Path: <linux-arm-msm+bounces-116531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PR8LIwcmSmon+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E47099B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:38:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lVLjp1BE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iqhx9puu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8339B301A1E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8812238B7D7;
	Sun,  5 Jul 2026 09:38:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC90386C3B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 09:38:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244286; cv=none; b=Ule6y88AhXEKuXGYMKwGsu2CXdzNRWQ8/pUg9sIOC0fTPGt020tdRbHg1UTyXXGqha++slyV+Qx97727a9nzkJDVyHWinndwO43G0sZj1qHWfpK+Qj2zcGmxlRStplVHGWeC59TQ6QpQ7P+yysNOh1+lg5xwca0iMb5YK3CuWRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244286; c=relaxed/simple;
	bh=gCbBXooVnN3k41/0JDtYVjFn6KqbQrAPWx/Q5waJ1NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFvFmHtDp/wfMCSkTdamkXfVsDzU3GbDBhbP9c65xowhu1eR3nUF1McbsIGUO8GZ0ReQzULzhnrV1WXL+N1rNmDAcZhpFP5XFxYplbFYJh/bvuF61wInZo35FeYgqT40qkZ2w1ZLlPhk9uL+UQ79N6089QeINbFlzbty5qMM/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVLjp1BE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqhx9puu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Mhlha4167460
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 09:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ewd3mk0qig3FuHi3oe799MF8ljVGpGl35xYn8JqcSgA=; b=lVLjp1BEh5/02w4q
	EmCL1gltyDlNxJjOL0M16QnFFxBD3NsMcu0ZYncgBlXVZeAGair0/47ULXzurMdb
	34NQBTDy5jBD/vTZ40Uk6KRwTnuEF0jT0oS7utFUQeDoT9UXrVzKrPKRKRIEFqV7
	Yr+euYYz5QMud1uMoMcPdDbImgwJEbg335DNFJIK2zavhxzqRyFpPlvfJwzT99u/
	pJyN+vQvUFBToa55bM3jJNaZy6BNRl8BhDq5IzoDOaf4L7y3mw1NhNe69QdTolVs
	AzX3T2SZ2+sc8mcK7LzJXqVKgN9sUZkKa9NuH1VH4G3anxbRNVe4L4zdtbrPMcMq
	Aqpc8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnjrrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 09:38:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so1743245a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783244282; x=1783849082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewd3mk0qig3FuHi3oe799MF8ljVGpGl35xYn8JqcSgA=;
        b=iqhx9puun1p4NJTMqSi6OvwY+ovXKiwSEQzfCwW7dH27bZbvhQM8FcVMvd4l1OMI3X
         6u/oKOhsiuu5dA09crCZvB4M6uDAMDNMzAFomIVgf4fRF84BF4hwe04NKhj/4qOcmzm6
         JHGYbyepyG7BUwpBvC5V01bM38i7S4G3q1XyAS3EZQQZZG+ADLNmhoPFcdWs/F3MF8/Y
         CSBVi3Zq5dKtSc51atJZLiSgIwqK1xpzQs0lg/PxfHklT7OOuc1uNDmji0N/8q/7N8c/
         cN9tQ3mzf9d81U3MAzQMgUxTOXIbihE++iU95enp7GZ2FTsU2fOeVywWYZOGg8x5jpmw
         3ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783244282; x=1783849082;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewd3mk0qig3FuHi3oe799MF8ljVGpGl35xYn8JqcSgA=;
        b=qAKa7x6xT2a3mhmOkGySsM2aNRNUZKa+0qHyW579Z8/3AuNIabWYaadDVFXbh+RJ8X
         qOKGroV3l8MsxU+TZi8S8YKi/Foh7kgELErQfPK5K35/LCykjA8Z1eMmDWYVitONoOgJ
         BoJl9NRkE9uszGT4qkp6cwl3PTJPyE1zFFKoebZpxKOR5jVl+fH0spkT2CReBWJoAO+W
         gyXkCIo+Dw1TrwpViGzARywWUNaWDAYf2Ac+9ekRTXX7wa/39r71Uts+SmZ77R5cCXUS
         16Fi6gV77e5gHrmtVQw1LxOAxZd/EBgMVL8nIEvqIhBIq5iB7PQIpM3Bisimh3NNVdK5
         UWTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwY1LhV4YS4JBbplQvmYvXuRrQsjszYdhWomFAeD06ts0L0VXiDELnTlLBGilBvYqRwMh0Rg5SEPe4IwS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8j9Mc2dw3CBbjaV6YzX5hxjBAOQxcwGAanc+Qo+POFmJTpVjg
	pHgFFdmnLur6pfTe2qwPAyZddNyVBAjtkp50Q4+foJBzTeb7FFKUcLkN+OrCKUQPqIYOMYpoZ/0
	XMaJ2ZazKRVIl567xk5FdLrkm+qv8xSwxXXLgFgtvCeSs14HXROu3jfAxaS6Z91/hbJ3l
X-Gm-Gg: AfdE7ckZ1OeSgonUgekhUK6U8LKlPDCNAgkd4Lp4Qu8rIX7N/Jp67VIgzG2//K1wcmT
	nY0YZd199qEUoXf27SO4C3/WCnndXA2TDgRJREXEmkER5OIXszwzCgXl2Hm3A1zxGjSIvxwQV3O
	eF2TOsV7vwT/8P4AMuJ+6yPQHo+fhFKT/MBFPdPYtIaStTKCVUSelH5tM0/WCauhZy++8nF6j3a
	TO2n+9scqs75Zu0QlFXFSI2kaSxZ5i/u2EjjYWTKQqFSALfbD3q44+yf8xcywSWQ1VQNsazmuZm
	MqyY7Uf7kPzoVmc+gNQTP/gXPLBgvlsAsxDvA31B/TA9rGWFZWzH9CvEGmDo3kRBVPRp0r+r0on
	wTCBsFiSD10h/PeNNyDXsMPX0FDDrxbu7UnLIJTCIPg==
X-Received: by 2002:a17:90a:d00b:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-382808ae0aamr5393739a91.9.1783244281814;
        Sun, 05 Jul 2026 02:38:01 -0700 (PDT)
X-Received: by 2002:a17:90a:d00b:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-382808ae0aamr5393704a91.9.1783244281232;
        Sun, 05 Jul 2026 02:38:01 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b4c5577sm45642249eec.0.2026.07.05.02.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 02:38:00 -0700 (PDT)
Message-ID: <4e9c4810-5ee8-433c-884a-90bd0d29aa62@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 15:07:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
 <20260703-overjoyed-laughing-panda-ee7ecb@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-overjoyed-laughing-panda-ee7ecb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA5OSBTYWx0ZWRfX4YuGnmjTcGLx
 GbTrvAmUfA51aCzohpHx88BYd0sdnwv0ycIdRPaKzTuYvOrWhpfNot98++xXJd2RS3Xcfs1CfUp
 NJ56mRl1brXyYjsvNaWatHWC4pmW52I=
X-Proofpoint-ORIG-GUID: eJsqI0GNcdlU6MVtO8rEauSzkkwHhSTj
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a25fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=oNAn0p0IznoDnlf92NwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA5OSBTYWx0ZWRfX3BndQFx/tVJO
 efz21qfcubMOxMuAuo82BzDEs69mXwSN/ks118MQa4vXARXQC6duNcqcR6hXDiq/xCgvUHjw1bD
 dqttZq6cj7/exnjGaUDCQ+OPkouEXo8Ug/CiGu09Glxy29KbdiD2T9e535vAhYDsn4piLZRpJiR
 IFaKuX1SI0VoiJfJBeYwIHeEkZxZvb5tQC0ZKbH2Uw59p12RC/gG27utCIrwbQz4zlFlGMAejuL
 72o0B1mFj4GrXZUW/ETC2spT3e9UtofAYfQjrYCqRS5l4GaQ4w3kI7rNxi4ItdLlAJZ2j2d8PHi
 Ym66JTFsZIh9YlMpEYDbBS2AB9FI9il6K2Bh3WfCUcJaxl4PxvQJHPbBkqH7my7OBuZPGG6bioA
 sAYS7ZmpuHHJmO2LprGHrgNoSKI8gOCc7UH+vpzr5+JliJe2aM5tmX47REjixuTzkG4nIDn3Rif
 r0b8NAZG5zLzM0B2NFA==
X-Proofpoint-GUID: eJsqI0GNcdlU6MVtO8rEauSzkkwHhSTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116531-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F6E47099B8



On 7/3/2026 1:33 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:06AM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
>> Device (TMD) cooling devices provided by remote subsystems.
>>
>> On Qualcomm platforms where remote processors expose mitigation controls
>> through the TMD QMI service, client drivers need support to discover the
>> service, register cooling devices for available mitigation endpoints,
>> and forward cooling state updates to remote subsystems.
>>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                      |   6 +
>>   drivers/soc/qcom/Kconfig         |  10 +
>>   drivers/soc/qcom/Makefile        |   1 +
>>   drivers/soc/qcom/qmi_tmd.c       | 581 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/qmi.h     |   1 +
>>   include/linux/soc/qcom/qmi_tmd.h |  23 ++
>>   6 files changed, 622 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ffd85fd1dd80..251b1f583913 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22287,6 +22287,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>>   F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
>>   F:	drivers/net/ethernet/qualcomm/ppe/
>>   
>> +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
>> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	linux-pm@vger.kernel.org
>> +F:	drivers/soc/qcom/qmi_tmd.c
>> +
>>   QUALCOMM QSEECOM DRIVER
>>   M:	Maximilian Luz <luzmaximilian@gmail.com>
>>   L:	linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 2caadbbcf830..44c2b533b494 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>>   
>> +config QCOM_QMI_TMD
>> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
>> +	depends on ARCH_QCOM
>> +	select QCOM_QMI_HELPERS
>> +	help
>> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
>> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
>> +	  TMD messaging and handles QMI communication with remote processors
>> +	  to exchange mitigation state and apply thermal mitigation requests.
>> +
>>   config QCOM_RAMP_CTRL
>>   	tristate "Qualcomm Ramp Controller driver"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index b7f1d2a57367..4544e61c74e7 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>>   CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
>> +obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
>>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>>   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 000000000000..d82500415f8e
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
>> @@ -0,0 +1,581 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Linaro Limited
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * QMI Thermal Mitigation Device (TMD).
>> + * Provides cooling device support for remote subsystems
>> + * running the TMD service via QMI.
>> + */
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/net.h>
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/qmi.h>
>> +#include <linux/soc/qcom/qmi_tmd.h>
>> +#include <linux/thermal.h>
>> +
>> +#define QMI_TMD_SERVICE_VERS_V01 0x01
>> +
>> +#define QMI_TMD_SET_LEVEL_REQ 0x0021
>> +#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
>> +
>> +#define QMI_TMD_DEV_ID_LEN_MAX 32
>> +#define QMI_TMD_DEV_LIST_MAX 32
>> +#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
>> +#define TMD_GET_LEVEL_REQ_MAX_LEN 36
>> +#define TMD_SET_LEVEL_REQ_MAX_LEN 40
>> +
>> +#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
>> +#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
>> +
>> +struct tmd_dev_id {
>> +	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
>> +};
>> +
>> +static const struct qmi_elem_info tmd_dev_id_ei[] = {
>> +	{
>> +		.data_type = QMI_STRING,
>> +		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
>> +		.elem_size = sizeof(char),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_id,
>> +				   mitigation_dev_id),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_dev_list {
>> +	struct tmd_dev_id mitigation_dev_id;
>> +	u8 max_mitigation_level;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_dev_list_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_dev_id),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_list,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_dev_id_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0,
>> +		.offset = offsetof(struct tmd_dev_list,
>> +				   max_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_dev_list_req {
>> +	char placeholder;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_dev_list_resp {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u32 mitigation_device_list_len;
>> +	struct tmd_dev_list
>> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
>> +};
>> +
>> +static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_DATA_LEN,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list_len),
>> +	},
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = QMI_TMD_DEV_LIST_MAX,
>> +		.elem_size = sizeof(struct tmd_dev_list),
>> +		.array_type = VAR_LEN_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_dev_list_resp,
>> +				   mitigation_device_list),
>> +		.ei_array = tmd_dev_list_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_level_req {
>> +	struct tmd_dev_id mitigation_dev_id;
>> +	u8 mitigation_level;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_set_level_req_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_dev_id),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_set_level_req,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_dev_id_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_level_req,
>> +				   mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_level_resp {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_level_resp, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +/**
>> + * struct qmi_tmd - A TMD cooling device
>> + * @name:	The name of this tmd shared by the remote subsystem
>> + * @cdev:	Thermal cooling device handle
>> + * @cur_state:	The current mitigation state
>> + * @max_state:	The maximum state
>> + * @qmi_tmd_cli:	Parent QMI TMD client
>> + */
>> +struct qmi_tmd {
>> +	const char *name;
>> +	struct thermal_cooling_device *cdev;
>> +	unsigned int cur_state;
>> +	unsigned int max_state;
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +};
>> +
>> +/**
>> + * struct qmi_tmd_client - QMI TMD client state
>> + * @dev:		Device associated with this instance
>> + * @handle:		QMI connection handle
>> + * @mutex:		Serializes QMI request/response sequences (qmi_txn_init,
>> + *			qmi_send_request) during DSP subsystem restart and
>> + *			protects @connection_active flag
>> + * @connection_active:	Whether or not we're connected to the QMI TMD service
>> + * @svc_arrive_work:	Work item for initialising when the TMD service starts
>> + * @num_tmds:		Number of tmds described in the device tree
>> + * @tmds:		An array of tmd structures
>> + */
>> +struct qmi_tmd_client {
>> +	struct device *dev;
>> +	struct qmi_handle handle;
>> +	/* protects QMI transactions and connection_active */
>> +	struct mutex mutex;
>> +	bool connection_active;
>> +	struct work_struct svc_arrive_work;
>> +	int num_tmds;
>> +	struct qmi_tmd tmds[] __counted_by(num_tmds);
>> +};
>> +
>> +/* Notify the remote subsystem of the requested cooling state */
>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
>> +{
>> +	struct tmd_set_level_resp resp = { 0 };
>> +	struct tmd_set_level_req req = { 0 };
>> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
>> +	struct qmi_txn txn;
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&qmi_tmd_cli->mutex);
>> +
>> +	if (!qmi_tmd_cli->connection_active)
>> +		return 0;
>> +
>> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
>> +		QMI_TMD_DEV_ID_LEN_MAX + 1);
>> +	req.mitigation_level = state;
>> +
>> +	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +			   tmd_set_level_resp_ei, &resp);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
>> +			       QMI_TMD_SET_LEVEL_REQ,
>> +			       TMD_SET_LEVEL_REQ_MAX_LEN,
>> +			       tmd_set_level_req_ei, &req);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
>> +			state, tmd->name, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		dev_err(qmi_tmd_cli->dev,
>> +			"qmi set state %d failed for %s result %#x error %#x\n",
>> +			state, tmd->name,
>> +			resp.resp.result, resp.resp.error);
>> +		return -EREMOTEIO;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
>> +		tmd->max_state, tmd->name);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long *state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +
>> +	*state = tmd->max_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long *state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +
>> +	/* cur_state is protected by thermal core's cdev->lock */
>> +	*state = tmd->cur_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +	int ret;
>> +
>> +	if (state > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	/* cur_state is protected by thermal core's cdev->lock */
>> +	if (tmd->cur_state == state)
>> +		return 0;
>> +
>> +	ret = qmi_tmd_send_state_request(tmd, state);
>> +	if (!ret)
>> +		tmd->cur_state = state;
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
>> +	.get_max_state = qmi_tmd_get_max_state,
>> +	.get_cur_state = qmi_tmd_get_cur_state,
>> +	.set_cur_state = qmi_tmd_set_cur_state,
>> +};
>> +
>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>> +			    const char *label, u8 max_state)
>> +{
>> +	struct device *dev = qmi_tmd_cli->dev;
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!strncasecmp(tmd->name, label,
>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>> +			goto found;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
>> +	if (IS_ERR(tmd->cdev))
>> +		return PTR_ERR(tmd->cdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
>> +{
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!tmd->cdev)
>> +			continue;
>> +
>> +		thermal_cooling_device_unregister(tmd->cdev);
>> +		tmd->cdev = NULL;
>> +	}
>> +}
>> +
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_dev_list_req req = { 0 };
>> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
>> +	int ret, i;
>> +	struct qmi_txn txn;
>> +
>> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
>> +	if (!resp) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +				   tmd_get_dev_list_resp_ei, resp);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
>> +				       QMI_TMD_GET_DEV_LIST_REQ,
>> +				TMD_GET_DEV_LIST_REQ_MAX_LEN,
>> +				tmd_get_dev_list_req_ei, &req);
>> +		if (ret < 0) {
>> +			qmi_txn_cancel(&txn);
>> +			goto out;
>> +		}
>> +
>> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>> +			ret = -EPROTO;
>> +			goto out;
>> +		}
>> +
>> +		qmi_tmd_cli->connection_active = true;
>> +	}
>> +
>> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
>> +		struct tmd_dev_list *device =
>> +			&resp->mitigation_device_list[i];
>> +
>> +		ret = qmi_tmd_register(qmi_tmd_cli,
>> +				       device->mitigation_dev_id.mitigation_dev_id,
>> +				       device->max_mitigation_level);
>> +		if (ret)
>> +			break;
>> +	}
>> +
>> +out:
>> +	if (ret)
>> +		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
>> +}
>> +
>> +static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		qmi_tmd_cli->connection_active = false;
>> +	}
>> +}
>> +
>> +static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +	int ret;
>> +
>> +	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
>> +				     sizeof(sq), 0);
>> +	}
>> +
>> +	if (ret < 0) {
>> +		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
>> +			service->node, service->port, ret);
>> +		return ret;
>> +	}
>> +
>> +	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct qmi_ops qmi_tmd_ops = {
>> +	.new_server = qmi_tmd_new_server,
>> +	.del_server = qmi_tmd_del_server,
>> +};
>> +
>> +/**
>> + * qmi_tmd_init() - Initialize QMI TMD instance
>> + * @dev: Device pointer
>> + * @instance_id: QMI service instance ID for the remote subsystem
>> + * @tmd_names: Array of TMD names
>> + * @num_tmds: Number of TMD names
>> + *
>> + * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
>> + */
>> +struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
>> +				    unsigned int instance_id,
>> +				    const char * const *tmd_names,
>> +				    int num_tmds)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli;
>> +	int ret, i;
>> +
>> +	if (!dev || !tmd_names || num_tmds <= 0)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);
> 
> Either this is dedicated to probe path or can be called from any context
> (probe or not probe). If the first, above is correct, but then:
> 1. kerneldoc is incomplete or function should be renamed to have _probe suffix,
> 2. why aren't you using dev_err_probe()?
> 

Thanks for review, this is probe-path only.
Will update the comment for context and dev_err_probe as well.

> If the latter, then above code is not correct because you do not have
> cleanup in qmi_tmd_exit() part, which leads to unspecific/unorganized
> way of cleaning devm resources during cleanup calls. Plus actual cleanup
> does not happen when consumer/user calls exit() but when remove() is
> called, leading to possible huge memory usage (not leak technically but
> same effect).
> 
>> +	if (!qmi_tmd_cli)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	qmi_tmd_cli->dev = dev;
>> +	qmi_tmd_cli->num_tmds = num_tmds;
>> +	mutex_init(&qmi_tmd_cli->mutex);
>> +	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
>> +
>> +	for (i = 0; i < num_tmds; i++) {
>> +		qmi_tmd_cli->tmds[i].name = tmd_names[i];
>> +		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
>> +	}
>> +
>> +	ret = qmi_handle_init(&qmi_tmd_cli->handle,
>> +			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
>> +			      &qmi_tmd_ops, NULL);
>> +	if (ret < 0) {
>> +		dev_err(dev, "QMI handle init failed: %d\n", ret);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
>> +			     QMI_TMD_SERVICE_VERS_V01, instance_id);
>> +	if (ret < 0) {
>> +		dev_err(dev, "QMI add lookup failed: %d\n", ret);
>> +		goto err_release_handle;
>> +	}
>> +
>> +	return qmi_tmd_cli;
>> +
>> +err_release_handle:
>> +	qmi_handle_release(&qmi_tmd_cli->handle);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(qmi_tmd_init);
>> +
>> +/**
>> + * qmi_tmd_exit() - Deinitialize QMI TMD instance
>> + * @qmi_tmd_cli: QMI TMD client to deinitialize
>> + */
>> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
>> +{
>> +	if (!qmi_tmd_cli)
>> +		return;
>> +
>> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
> 
> And what if work is re-queued now?

Thanks for catching this, qmi_handle_release should come before cancel 
of work item. Releasing the handle closes the socket which prevents any 
further callbacks. Will update this.
> 
>> +	qmi_handle_release(&qmi_tmd_cli->handle);
>> +	qmi_tmd_unregister(qmi_tmd_cli);
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
>> +		qmi_tmd_cli->connection_active = false;
>> +}
>> +EXPORT_SYMBOL_GPL(qmi_tmd_exit);
> 
> Best regards,
> Krzysztof
> 


