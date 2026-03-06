Return-Path: <linux-arm-msm+bounces-95711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC64FTNtqmkPRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:59:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D749D21BE24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E267F30A0078
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 05:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452CD2DB791;
	Fri,  6 Mar 2026 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DID515sq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDB/soW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06936D508
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 05:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776638; cv=none; b=huVcwv3nulcs1jDoPq5xcNsYn7bYd7l0gfaJ/V5iLOpGXqlH6v9ijw+9PHCaW/31S0uSvAJA8AS4n5eBS6awF8ffGibnO2L+Occ+ey7smJEIiNbX2PQZCeEyCI4lDCBRabNClqEldfgpAWDxRQhwzM5qfXZm9O0LIR/dLKnEo10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776638; c=relaxed/simple;
	bh=XRshhNWCUls58Ec0Kd4jJCVhaUfesTsvoPyvZA++FtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFyyTD6Dc5yVzwSB9OMQNuGKfmbwh4Kkuw0A/at7slUT+H4IqbwL2RZK5yRLdf+wecXfS1UMvQOJauVE8UP3/zE0UWutuysfNUwN8EUDJbWoe1AceeecYm2/p8WugVV/gE7f2x42KcBAnKZmS8kdQUfKHnixximGfLnH8zAxuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DID515sq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDB/soW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aOLw2327756
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 05:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MiXXC9Y+HRfo/jOm96rMU2xnZoWoXsElrX39FtTY000=; b=DID515sqloTkGjjK
	Vui+++KEzoj0Wxds/W4mV/0g10ClKvTW3vPTjZ964veVCtbjD809lgLtEmEdDQAO
	b22bd9QJyFlYBqRnHEdG1aJB85TekWY8EZy/RcMITCHj11ZDfSPbiHJ/SANnpeA4
	+D+mTJkT0oiwML1XU95qCTl2CDvIAXlkxe6e38EzHrMwqAhiej8itSubDrc3pkLM
	K3ANdeURHnJta5Z0WUDxVWcs/W+0FOQw+jEMNgAUiVs7asxzpXTbZyVQ8Q6Kokg9
	LV52HSK2KbpWijGSJ8wkcuhgsOosLtKm8N0az+DiHVQLsJwsWLQ/zh+DsddmDNwb
	hNphYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09sr6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:57:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4e9577ceso229075975ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 21:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776634; x=1773381434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiXXC9Y+HRfo/jOm96rMU2xnZoWoXsElrX39FtTY000=;
        b=TDB/soW+z+JlevVnzYPNEBMQt6xu9xIel6ZSmGjwZTxQNrTfNkgE8iU7HFDaFCLNc6
         ra/jX3jOX6hOvWqTSJfJgNuipWUHLLxdY7FFVH+3dNxRsVMxapbysY8QpqYwsOtv5pwh
         vEZcJjKPe2XihrNLRp+xqZ8nNe9aKL0PsY7Y2mLez5SutvmQZrJDWwrFLmy9JFusFoS1
         m6d1hTd6hEkzLFTeMKX5dH8ms2dJRP1aiGPt6D0y18f7fsq7hvJVJ9XTYyhBXo5jcqte
         IxItZvthfsKcnz1bFg1hHpbE0WwMK1SWG9Q28iG9lWfNZx1W6lhKUyQ3Lik/qYmovP8M
         GM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776634; x=1773381434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiXXC9Y+HRfo/jOm96rMU2xnZoWoXsElrX39FtTY000=;
        b=UqzixLtYfj9eKoYPOV62YvSMDYDl9t/avhprqzG8di3sw+K7s5sYHGaj69Jekxk/js
         iu/BdvbcK7/ZU0KIlKWyOJktYSIrZeIoMfUloNqKTNeXrw878/+tt6XVMM8qX25QulYU
         Q8JMJaNzr0wAI+FlII4GdrYs2e6NbFmrIe9m0dPqTWoA9T+1hmtkTllDpO1m9BpqhHtF
         D7kp156OmFLfJphcqRlef0XnrLMs+vHL4S/zB+5NXKalUQFfyS/vA5ugZI9PzkxH6Tuz
         tTBk25Joaya8th4ShCkqChMWhImBM8bzHC/SlVFWCEAmxMR6dy7dm2pEvLsQoVDCp6qg
         FggA==
X-Forwarded-Encrypted: i=1; AJvYcCXvDohw/gQtbcVhRp01yAmWHtoM9oWYSFm9NvfOgj9LUDGqOFdqitop2f7AajsVNUpTXo/5tIGzaA10fgXc@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9pcJJ9oaO9kbxX7SM4bj7IYJTq/7PYfP0YC8ginNPparLib5
	aHWK8ofBU1Fzg3Qs9oDvuc1/ICuNsizmINGo4JCsIfvw9gSn5vlAb8Bfr7TbG9FlSTQgVGD8BQS
	FfKH7fOOndJ7aOZlCP3bx5sSqxtB/luvjTqLP426NE1Fkyb6jk7ibqOTwJp8CCAqljfCy
X-Gm-Gg: ATEYQzzbS9JCG6/MQiqG2B26cRxSw9EIDVyw2IHKN5WcZtwCG0wgGQNCS/PpB1tG8IS
	AR1UwnyuUytVO52gqffZ0gsZQU8FbxvrvGfze0k5Za7JGxiip+qmXVtv/ZRqFKScTohqrZjpNS1
	PBG1mPGaawInOUdKiMpX8Q0jPQe4CE7rZwtPd2OJ1nstWAeb4CKmGjHB6JpEZpEiD96DsFt1EWr
	QcZ/LD99eIoB7aPVTSLzDopluiEr9M+aYtfWVQ7Zj8PL+FJqxRYldzQprgbMRmvrx6YWmwBFDTW
	LkRwUCx4DML6XHBcQGjYQ70c2qiN5N6DACRFSaKm8F/PotQe3GQQa4YssMgxMF3u3aMQheDHz0t
	yJoprXsdF6LHIE8DLDLpNT8fL8CDy1KTRho+QgioTE6IZaTjBeQM=
X-Received: by 2002:a17:903:2ece:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2ae8249ad12mr12630615ad.53.1772776634044;
        Thu, 05 Mar 2026 21:57:14 -0800 (PST)
X-Received: by 2002:a17:903:2ece:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2ae8249ad12mr12630055ad.53.1772776633508;
        Thu, 05 Mar 2026 21:57:13 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fa81d5sm5952335ad.71.2026.03.05.21.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 21:57:13 -0800 (PST)
Message-ID: <20301a77-2f75-4447-979a-f2dd4431c85c@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:27:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 3/4] iio: adc: Add support for QCOM PMIC5 Gen3 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20260209105438.596339-1-jishnu.prakash@oss.qualcomm.com>
 <20260209105438.596339-4-jishnu.prakash@oss.qualcomm.com>
 <20260228193946.2e60ea5e@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260228193946.2e60ea5e@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T77HXKk9wumlKdF7HI-etO8oU7gZ7kzW
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aa6cba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UEldCo81gXLG25mkEUsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: T77HXKk9wumlKdF7HI-etO8oU7gZ7kzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfX8bFXdC9t+FZi
 vdI7ulnSBh5baEKH+Zc/3kiyRJakIvMtF66gJKfOOCV64ga1ro8iuYOHe0T5wSUKs04CBUROtfs
 +3CzTkAu0g1abeGDIVJD6N1DcVkwysLHHp6OGjLyme/FGajWYGQ1cPsSMUQtjhI3mZ6RMEgtKFB
 K6ZFLVEkeu0zEcKu718RtZUmHFqu3Df1+Qgcj2yvVR/NI+Rf1C8cjbCGyrlHbIhmmlMQXeY9yHV
 9t6ImT5ICk9APfSw4TYsdyA5k7ZR3e89EoINKuh08tiOgb/CaxSQTh3wGj/w7yT21P0ZmJgTVrj
 cD8uI5psTTqV8hY5Oy+xULcfRZLzRLAvVJuEEVrFj50PiKbQEP7nsKV4EQEQTVx4QILdxk1vKlj
 on4B0fjl4bTB7SUJOIooo4bVffCltBiavUgzFVmxisL4REMQh2v36Z6nPseQL29xDyAmaP8LTOU
 POp2rgCBTe98oHjBxdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055
X-Rspamd-Queue-Id: D749D21BE24
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
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,intel.com,arm.com,vger.kernel.org,chromium.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-95711-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Jonathan,

On 3/1/2026 1:09 AM, Jonathan Cameron wrote:
> On Mon,  9 Feb 2026 16:24:37 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> The ADC architecture on PMIC5 Gen3 is similar to that on PMIC5 Gen2,
>> with all SW communication to ADC going through PMK8550 which
>> communicates with other PMICs through PBS.
>>
>> One major difference is that the register interface used here is that
>> of an SDAM (Shared Direct Access Memory) peripheral present on PMK8550.
>> There may be more than one SDAM used for ADC5 Gen3 and each has eight
>> channels, which may be used for either immediate reads (same functionality
>> as previous PMIC5 and PMIC5 Gen2 ADC peripherals) or recurring measurements
>> (same as ADC_TM functionality).
>>
>> By convention, we reserve the first channel of the first SDAM for all
>> immediate reads and use the remaining channels across all SDAMs for
>> ADC_TM monitoring functionality.
>>
>> Add support for PMIC5 Gen3 ADC driver for immediate read functionality.
>> ADC_TM is implemented as an auxiliary thermal driver under this ADC
>> driver.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Ah. I just realized I built the immutable branch from v10 not this.
> I wasn't seeing any review outstanding on that version and didn't read your
> email closely enough :(
> 
> I'd rather not cause more confusion by ripping it down and creating a new
> one.  From a quick look none of the changes since v10 look vital.
> Perhaps we can spin a follow up patch to pull into IIO to make those
> tweaks if you want them?  That way the immutable branch remains
> the same.
> 

Thanks for picking the patches. Picking v10 shouldn't be a problem,
I can make separate refactoring patches for the v10->v11 differences later.

Since you have made the immutable branch now picking patches 1-3,
is it possible for the thermal maintainers to pick v10 patch 4 now
or are there any other procedures to be completed?

Thanks,
Jishnu

> Thanks,
> 
> Jonathan
> 
> 
>> ---
>> Changes since v10:
>> - Made following changes to address Jonathan's comments:
>>   - Replaced inclusion of device.h header file in 
>>     include/linux/iio/adc/qcom-adc5-gen3-common.h with forwards declaration
>>     of struct device.
>>   - Updated all for() loops to declare and initialize the loop iterator
>>     inside the for() loop statement.
>>   - Moved initializations for drvdata, completion struct and mutex within
>>     adc5_gen3_probe().
>>
>> Changes since v8:
>> - Dropped the common module (drivers/iio/adc/qcom-adc5-gen3-common.c) and moved
>>   all of its contents to drivers/iio/adc/qcom-spmi-adc5-gen3.c as suggested by Dmitry.
>> - Made following changes to address Dmitry's comment to use module_auxiliary_driver()
>>   in auxiliary driver patch, by simplifying auxiliary device structures:

