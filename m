Return-Path: <linux-arm-msm+bounces-99160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE7GEqgKwWmVQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:40:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B952EF3A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECE263002E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB2F386C27;
	Mon, 23 Mar 2026 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lah6QYiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5EKjvrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF938552C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258621; cv=none; b=e86HwNecNz1rt1CPfy4NjKdv7Nw7/wq+g8aPmvGUj7XLpFVPcWJPUqtykGqxQj8HbhM24hIUA5F8LrLN6YCYPxI0qrAIRCp9MnJAGabPXsX5l5OpZ3rddcBxTxW+X8i5pIlpfIG8EKEYAlfzyzAEmiMRsjAGM2vqV2KEcxkFLAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258621; c=relaxed/simple;
	bh=PTdS4DuNCC8UIouhKxz1ZsGRjCcZsuhaZkWZ2JoRdmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD52lkDUoRb+kuS/zvs1wfkVaKilENoL+n83X8TgKR5sdENfYekV61ES4O85qe58Zt088shyipA1D0swu09ehl+BKVaXwX9iWx1RKH0WUH1bZbwAcSZFXi8bTV1QiFcYfiHw8RfJsNjNElkBV60Z5sGhFHJF9PlIZZiproetTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lah6QYiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5EKjvrf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73Uge3385863
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=; b=Lah6QYiPhzPhyACK
	NOSY2gBGTsA2/naYdWt54OtVOhgX6PRPIJPcJkg4CMWttdxzmiJkVBT+RUo1uWa3
	q4x45HJgm8n8nDXuVie/fTq0MpkSVDPYiz/CNIQ2BEROQ/EHhMwCsLGTzSk0eP0h
	bOkoC8u3X87dSv/qFqmvgfy7bxr06mWSyYzxQlRfoWBsCAqnYvkrmQUrkHh3e8ZJ
	WPxDONXiOBpBbbkg8NeM2wPVyIfAyL2jPyQC/ykAuezQdxHn0m8mcKZP2HsX/yfx
	TBkzh3n0bymDDeK37QVh4cQG56AAGeqsoLlqTWMmjHfp6E+tNdK7w1F4T/8Xyxug
	BanZhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jppj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:36:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093245c2d4so18268251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258618; x=1774863418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=;
        b=N5EKjvrf8h/4uTplLUlmwWoWQMgnPwevugf1dd6Y7qWSz9R5f/zh9G2vf+9ZZK+p4+
         uS+wDmDGtBo7gYo9e/Y4HwTfYO/nhICXA9b6lITgt1BU6tzrcpVDOZbIzgXzgheuruji
         9x/Gdt+cpC0w44dxzoRMKd1CC+YP3e8XK+qQbYVsdqOz/4IR8/JYLs2N+sYNWkPn71Ne
         mQzQcL1GmyWa/nDqsmt1oc5DZSTfUTetfCM4aXYSX7GzQ3ethjYDVHOfuot2nkSBYg7D
         NPdMZhL7H1JPtabtX0Hzx+FcQpVEedwCRlwIrq2vB9biijsHrphIfzaQ6v451jgZCGjh
         evew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258618; x=1774863418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=;
        b=pvaj8R2qPbhMypHv2gpS6/j6hMDZNoAUD8YEH5/ldgL8jLl2YuqRQbVHErHa0fjMS4
         AGrB7fC9euLPi92aLlzdBuuDg5eJBT3u30HrLVxCRALvnd+E5yLzoJDlIxmj3/jGz8P1
         /WfmBqOu2Tpu/Ddd9qVBtBH1FfbVaGpvGlz7zCjMR4Vqx4uMr2DfLCtZisijhK0YBKJb
         VwPM/jD8M7D02tuBh6gb0en7DfKZp7EYQgJmdbO5QgsrXH58XrwOgQwIeWt1LB6sOQXs
         oqcd/RKx9Lq+pQVbLF/aFXfsiJRgK3LJoS+6W1vpBTiIeAFd7P3307zk8Nl3Bi6qG3R6
         ZiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPlCnoyopGWHdwyHbP5Pw7YlGx0jHLXh8eoEZZsi7ccQH8SJN+JXrSMXQ7WWCByiEPz7ab58D5NPv/y/92@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3RTp2GWOTHb+Vwn5iT9FslIj5ZacVFdRAxe9ZdTYGZpbjkVv
	BvcQhojwUy1HU2rPjUCxhMu/4SW8dkJVffgakbydOwv+1L2kGrK7ikjumYsMg0YavcZxmX4TEO0
	dPwrK3YKU1xMfM6802hkIDsxd63BaFlHIuFmp15jqMDUd5p/sPqwSy2NMzwIqgyrIW+vh
X-Gm-Gg: ATEYQzyBF3b0AKN4bt4QgJ+7qoMWybuWT9acx1cvLlVzr2DWIan0pV0YQDFuMnIhfIJ
	GZUxH+xv84ZxvB6euqshFAs5HMWmY2qw8Prc9u+H91x/lp5ysqoLA+NzrJNoyl0whHUGOmaMfTH
	GrcVDjT/VJNcxiUqiMEtMXITBKeQ68M2YFRKPuglYNlSps0fwnoofrur/Y+HhRs3C1L/OnKIDy8
	sGK9Ob7aXg3hS4zz3YQGh8hwdyG4yHUBFEd0tFxeBLGQ8Mz7YMTU/JXYcbshldee3pxHdm8F1jr
	UR+oXs4vCQKALB1FAGzEAPSzOgDGFDz6rfDblOq3nYogQ6CqREMBf9BiECUxve7l3PjApS9TCza
	cW5xj8MV/NuHbSMmCr+BK25q8ZxPEbB/uNiiFzt0ALZwJSTXe7sAERDUBKgR66JFi1M5AXJIZt+
	C1unY=
X-Received: by 2002:a05:622a:5a11:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50b37215c43mr130730361cf.0.1774258618342;
        Mon, 23 Mar 2026 02:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5a11:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50b37215c43mr130730231cf.0.1774258617936;
        Mon, 23 Mar 2026 02:36:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832beecf4sm477756366b.0.2026.03.23.02.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:36:57 -0700 (PDT)
Message-ID: <c05ae272-6498-4af5-bf30-2bd151153195@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:36:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
 <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
 <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
 <90dc434a-42a7-4719-8006-0b141d281ac7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90dc434a-42a7-4719-8006-0b141d281ac7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfX6uuluiFA+U3X
 XE0slVnpOI0wlIXGAR8ZBBPZr6GGFzQv+qt+42Rxhoq77w9oNsRvT+dGjLGE4mFsrmBHaEawPHK
 r3V/mL6itYbY3hm2YJVxYNoKUPNQrGdiu0p+qOJQPPyLF4eDmUeLVbbKuThDWdS+ZjJ92gTvoRQ
 e7gPCunrQge8X7hLKLICvWIBLhD9TPxgTdh1v1AGyAXrhOch6QQkWbl2kSo1qtHiWkQMEM/dUpB
 4kSG0WbkPpv1to2xuSqNpWlQ2UYepwyjf1DpzzgM7cnaDxA/Nt+gHlNXfFek2mSSxEfRWz25G3J
 v1kxmTEci7AzIIK1xo6S13t4lWSXCjTZw+mC8ZEFGdqS7WVaKRZuSF9KNVy2EqOe2xABAr6v/nB
 0BB+8cdpjcPcRoJy02yKcp9zufQ/Z5Of+gFd1sChHsRQeJkIDxQkq4WaBbr3htv+QT/AK6bSXgL
 yWwBb+RmU4baf0VbjVg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c109bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=uUS1cO11Uey-smSlg-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 1eqtAHqpeTiOejchNOZKVRhBYlX2tUYM
X-Proofpoint-GUID: 1eqtAHqpeTiOejchNOZKVRhBYlX2tUYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99160-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0B952EF3A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 11:03 AM, Bryan O'Donoghue wrote:
> On 19/03/2026 19:57, Dmitry Baryshkov wrote:
>> On Thu, Mar 19, 2026 at 02:26:00PM +0100, Konrad Dybcio wrote:
>>> On 3/12/26 7:16 AM, Alexander Koskovich wrote:
>>>> This is required for devices (e.g. ASUS ROG Phone 3) where more than
>>>> one USB port can act as a sink and both share a single USBIN input on
>>>> the PMIC.
>>>>
>>>> Because the PM8150B uses USBIN to determine VBUS presence, a charger
>>>> connected to one port causes the PMIC to falsely detect VBUS on the
>>>> other port, preventing it from entering source mode.
>>>>
>>>> For example, plugging a charger into one port prevents using the other
>>>> port for a flash drive.
>>>>
>>>> Fix this by adding support for the vbus-gpios connector binding so the
>>>> driver can use an external GPIO for per-port VBUS presence detection
>>>> instead of the shared USBIN register.
>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>> ---
>>>> Changes in v2:
>>>> - Dropped RFC prefix
>>>> - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
>>>> - Updated cover to better describe scenario where this change is relevant
>>>> - Update comment for EN_TRY_SRC to make more sense
>>>> - Skip vSafe5V poll too not just vSafe0V
>>>> - return gpiod_get_value_cansleep (Konrad)
>>>> - regmap_update_bits -> regmap_set_bits (Konrad)
>>>> - Get vbus-gpios per connector (Konrad)
>>>> - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
>>>> - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
>>>> ---
>>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
>>>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> index 8051eaa46991..a8f6687a3522 100644
>>>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> @@ -5,6 +5,7 @@
>>>>     #include <linux/delay.h>
>>>>   #include <linux/err.h>
>>>> +#include <linux/gpio/consumer.h>
>>>>   #include <linux/interrupt.h>
>>>>   #include <linux/kernel.h>
>>>>   #include <linux/mod_devicetable.h>
>>>> @@ -176,6 +177,8 @@ struct pmic_typec_port {
>>>>       bool                vbus_enabled;
>>>>       struct mutex            vbus_lock;        /* VBUS state serialization */
>>>>   +    struct gpio_desc        *vbus_detect_gpio;
>>>
>>> I'd like for this to include the word 'secondary', since it's not obvious
>>> that if an external GPIO is at play, we have two ports connected in this
>>> uhh non-standard fashion
>>>
>>> perhaps just secondary_vbus_detect_gpio
>>
>> In theory it can be used even if we have one port.
>>
> 
> That's true.
> 
> Its quite common in OTG devices to have VBUS detect GPIOs.

Sure, that's true for the qcom_pmic_typec_port_vbus_detect() part, but
this also triggers the 'TRY_SRC/TRY_SNK' and 'bypass VSAFE0V' workarounds
which I would assume would not necessary in that case

Konrad

