Return-Path: <linux-arm-msm+bounces-84039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 023BBC9A570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78EB6342595
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB282F5A09;
	Tue,  2 Dec 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlBu4dLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhDHYFg4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26F1F151C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657432; cv=none; b=DpsBA2yb1icbgXbs45DAahevx278/IlewsFif3BA3eGK8huXrh8f2qLlDLOCVrFfdvst7dKGaLwHcmRBH+PIMA75QQZnV4LThswtDmpVrP3lZYK5vp8QigIOOe5EJF741J2TjEnqtrvYx/1qClJKQnOoqthK/Lr5QePh1H+nXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657432; c=relaxed/simple;
	bh=3/qYgFvpwp6XiCiYlcvFgN3nu1CC+sJCWge2+da7nVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ax0uj5YQvbQVqQ6ee/MSfnqbq4KByraXKpYbR476Y8lpD34VdjceWmYVF++ec6i6IlTfLQIFxj8YJ+D73gPLNITT32x9sU2gz8eWjGsJFPVmln04n2veVO2AopJDbkRRHbQ9VvXf4gvCesF9IjNe5zefY26UkkjFDWgaUOdc1G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlBu4dLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhDHYFg4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KWx9r1145529
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+sPSNI4Tu7z7BRbSfD4/ZuFbrKNIUWwvy3EBtu7nHg=; b=OlBu4dLGSEe+D+V2
	nDd/2ID8yuQdGae9/vm2kTdN1SXdmYG4avtL53KuTaL6oaByLAclj9S/Zi0CY/BA
	AaAOv7tfLz4zItjF4gX/nIyKG4eXd/lcarpaR9iovi5opRz3z+b05beGXllaJpw0
	XKcXdFv/8GBFZJN6hnlA6jpUxGEca0uVXZvTCCxwyWa3Y5SbwNxYkbx3cvry/BMD
	iEMRg2C7Km8auvTQx85mLvkWInWI0+jSeUHRyOCscOqo4zukqCGpZD9e6jT3vxp8
	x+xOk5XKLfL74AOEKOLq8u6hnuhVkw9BX95F9NlhzSLrQd3vaYayqTyby256ioME
	/cIqqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5e9hb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:37:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba92341f38so5045727b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657429; x=1765262229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+sPSNI4Tu7z7BRbSfD4/ZuFbrKNIUWwvy3EBtu7nHg=;
        b=MhDHYFg4jADby42w/iqHgrhXJqognZ+EtMp2UNu6fjqb4gsgjWbxxpfCxWG42mbXqp
         cITlIDmA5NPzLnrTV/tENCqynLuvZB4nMrETLGOqiAIZqUpfDnJ5pwB2d+PYSHuW2g5R
         epOmT87bOCKASEzfELzKFMsDl04et1XfTtMACl5tR2udzlSxlbOfNDwkU181awslfdFn
         mlU3N+Ns4UV+sXlyDYfJCRYBlERRVA7kWT+acI3d9rTcWUEKGFMNz77j7MAhXct9xz+t
         PbOseIw3pUVhg7IeFawQ7OlIelk/iG/TVTODu1CHM96PvzFzDjqAMPXh8YGCmwBAZrmD
         Iamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657429; x=1765262229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+sPSNI4Tu7z7BRbSfD4/ZuFbrKNIUWwvy3EBtu7nHg=;
        b=bd7zu9JpzSv4k1+DRYpE5LUy65WElewI8dHP6MvuOipL6cua639vWcvdO1UGVgjnoY
         yQMy7+4ZIZlDxw5cLglUlea8FrcZVW/kYIVda54F348NJ6PohB2tpPqWiAP/vVlnA0jd
         Ca5mKRbdEJzD6Pr4vcKHajYTF9OgOxDyitvsXOq3zHDX7rFXkZeNZwmQKl3Q/PRb27H7
         Y2cV850+P6aHqCo7i0lWVBuo9OsTlZHMVuiQ7CodZCuFL8+jGF+XnSaGGg8LTaRLP72m
         h+OBGWcza04zopRr4qUg1pmeqKIL11Rj+r03n/rvlNn2Utbxtm7ViSQEYj2JigLzWli3
         k43g==
X-Forwarded-Encrypted: i=1; AJvYcCVF4ZAru1wGlR5OXNUxPT5898YFDQEmOHp11e33vehYlYukv9OOqK73YPYqRnFavq9g761pdZpvxguwIoa8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvAG2rQ4rGeb1WB0vrjkeR3IMiLxW8sZevA7b5Rq0Nr3D9mfs
	F3ez0aMITDtjKDS42A7TtZ+CnmcfqddU+Kg0sneo3XFMZGyUPHsk+bL+0JL3+2nkYg8+2rs4/tc
	KnU1ypkobkZkMToWrgEX+6ghePKs1BHDv5dpsbgeNmdB0rRqDe0SS8PGydMjVOOQUQlud
X-Gm-Gg: ASbGncu69YfWp/fHD3xoFuBEMLSo2DkIBdA9KRKZg8gHoiHzGSycjxWxEqEWSXACkH7
	SkNTPXeiru8ph53Q7snXTFnQVDxN46+5D/z9LyoQmjtxw7CzOsdI8LypLSuYJhELPkrZpDyTDOY
	SoGpwS4vJmKlP03wa40ZNhqBLnlq9SRjNrkFOrNNzPi4y6nTTB0zhvvumlXiYraV9mDOPB/ZW9q
	xemLpnnyzmMQBqKTWo18AaM/D/6anS2AmvsVnnkWVDEcZfRSRkBRojS+0HV7TM8Tw1m7E4QkQxt
	UQxoPlCG/rlRHzKQ+cU0KSn6vWXYvNcVQv3zfAqX4uvoPj9BlfOAEWG02zMzeETTOnUPY/zHn/6
	QID0KekjTx6vYQ1YGeYL1ZYDu6n9PHqNlZ5MDYg==
X-Received: by 2002:a05:6a00:b50:b0:7ab:39a2:919b with SMTP id d2e1a72fcca58-7ca8aaf099fmr26592755b3a.20.1764657428447;
        Mon, 01 Dec 2025 22:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6HM7OOW4Ce2nRZijRpqN4MJ6Fl5YIYv+wFew3/HV2L6/5p/RMpcs2gZutMvcfBC/F5ZW45Q==
X-Received: by 2002:a05:6a00:b50:b0:7ab:39a2:919b with SMTP id d2e1a72fcca58-7ca8aaf099fmr26592703b3a.20.1764657427795;
        Mon, 01 Dec 2025 22:37:07 -0800 (PST)
Received: from [10.218.43.241] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3f23sm15839067b3a.36.2025.12.01.22.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:37:07 -0800 (PST)
Message-ID: <f32bdc06-d76b-44f7-8738-2032669e793c@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 12:07:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, jack.pham@oss.qualcomm.com,
        faisal.hassan@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
 <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>
 <cwtbvgoljjqfvuktwlnnsnroa4jj7m6l63yq6t34hccs4wa6xp@mggosrleq7vl>
Content-Language: en-US
From: Sriram Dash <sriram.dash@oss.qualcomm.com>
In-Reply-To: <cwtbvgoljjqfvuktwlnnsnroa4jj7m6l63yq6t34hccs4wa6xp@mggosrleq7vl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k1Nm8gF2XClG2Wn2wab3EIc2e57UkGX-
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692e8915 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-tAHDEQtArZHiQS8Mg0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX2y8VtvWvySOY
 141vp2xSEZMOY9nbkE29nQpvArNGG4As1onPTfGHUv4ccoAFeCH4PmL/Cop/IDCzf7OUbwwwQIn
 S1GVKEXFStXxtZPzJShQUB3OGbjFGEgsplOh/4bZ4NJYrrQ3nG4806PqrCsI5joDt1rUnGjgdHW
 Rsr6sWHxlSI5+0QdBF4x6VwOvBBEGFkEIU+1RtNtPBJS6+lTEVnbCvu3LPwv6RqwTDA/wuJOKX+
 pqDKS03XVzVzyNNsYooFrt4n2efM+Ei6akOrnBe6hnPF1F+jf7Hk2MDrwqroBr7Hs8lQRRN39sa
 NVqnzUbrfFEDi8jpW7MHRTmuDxhO6lL4Kfg8100oWhTwnRp0l20KA4gY8hN91026cBFOpK3VXE1
 ml6QHhIHeaJsU9t5n8b2dG+FxpOraQ==
X-Proofpoint-ORIG-GUID: k1Nm8gF2XClG2Wn2wab3EIc2e57UkGX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020051

On 12/2/2025 10:51 AM, Bjorn Andersson wrote:
> On Thu, Nov 27, 2025 at 04:01:45PM +0530, Sriram Dash wrote:
>> Add support for firmware-managed resource states in the
>> Qualcomm DWC3 USB controller driver. On platforms
>> like sa8255p, where controller resources are abstracted
>> and managed collectively by firmware, the driver communicates
>> power management transitions using dedicated resource state
>> levels via dev_pm_opp_set_level().
>>
>> Macros are introduced to represent key lifecycle events:
>> initialization, system and runtime suspend/resume, and exit.
>> The driver sets the appropriate resource state during probe,
>> remove, suspend, and resume operations, enabling bulk ON/OFF
>> transitions of grouped resources according to the
>> controller's operational state.
>>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 97 ++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 88 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 9ac75547820d..9615ca6cfcae 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -13,6 +13,8 @@
>>  #include <linux/kernel.h>
>>  #include <linux/interconnect.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_opp.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/usb/of.h>
>>  #include <linux/reset.h>
>> @@ -85,10 +87,48 @@ struct dwc3_qcom {
>>  	struct icc_path		*icc_path_apps;
>>  
>>  	enum usb_role		current_role;
>> +	bool			fw_managed;
>>  };
>>  
>>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>>  
>> +/*
>> + * QCOM DWC3 USB Controller: Firmware-Managed Resource State Levels
>> + *
>> + * On select Qualcomm platforms, the USB controller’s power-related
>> + * resources including GDSC, reset lines, clocks, and interconnects
>> + * are managed collectively by system firmware via SCMI. The driver
>> + * signals the controller’s operational state to firmware using these
>> + * levels, each mapped to a specific power management transition or
>> + * lifecycle event:
>> + *
>> + * DWC3_QCOM_FW_MANAGED_INIT
> Both power and performance states are typically...states...
> But these are actions/transitions between states.
>
>
> The purpose of doing firmware assisted resource management (like done in
> ACPI) is that it abstracts away the power management aspects from the OS
> implementation, here we instead seems to complicate the OS
> implementation.
>
>> + *	Enable GDSC, Assert and Deassert Resets, and turn ON all clocks
>> + *	and interconnects.
>> + *
>> + * DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME
>> + *	Enable GDSC and turn ON all clocks and interconnects.
>> + *
>> + * DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME
>> + *	Turn ON all clocks and interconnects.
>> + *
>> + * DWC3_QCOM_FW_MANAGED_EXIT
>> + *	Turn OFF all clocks and interconnects, Assert reset and disable GDSC.
>> + *
>> + * DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND
>> + *	Turn OFF all clocks and interconnects and disable GDSC.
>> + *
>> + * DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND
>> + *	Turn OFF clocks and interconnects.
>> + */
>> +
>> +#define DWC3_QCOM_FW_MANAGED_INIT			1
>> +#define DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME		2
>> +#define DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME		3
> Given that dwc3_core_probe() calls pm_runtime_forbid(), do we actually
> hit these states, or are you in practice only hitting some "D0" and "D3"
> states?
>
> Could this be simplified to match what we would need here for an ACPI
> system?


Hi Bjorn,

thanks for the comments.

You’re right that the wording in the comment makes these look like
explicit “do X/Y/Z now” transitions rather than passive states. The
intention is not to expose an imperative sequence to firmware, but to
advertise a small set of abstract “resource configurations” that
correspond to specific OS power‑management contexts in the driver.

On sa8255p, the USB controller and its associated resources (GDSC,
clocks, interconnects, resets) are grouped behind a single
firmware‑managed perf domain. From the driver’s perspective we only have
a few meaningful configurations:

initial bring‑up during probe,
system suspend / system resume,
runtime suspend / runtime resume (planned once runtime PM is enabled), and
final shutdown on remove.

The levels are meant to encode which phase of the lifecycle we are in,
so that firmware can choose an internal representation that matches its
own notion of “D0‑like”, “temporarily suspended” or “off / removed”,
including any differences in how aggressively it can drop power, assert
resets, or preserve context.

You are correct that INIT and the various RESUME levels are all “on” in
the sense that the controller ends up operational, and similarly EXIT /
SUSPEND variants are “off / not actively used”. Today the driver does
not try to model these as strict D0/D3/D3hot/D3cold equivalents, because:

INIT may require a more complete bring‑up after boot, where firmware
might need to perform extra initialization compared to a resume from a
prior suspended state.
SYSTEM_* vs RUNTIME_* are tied to the OS‑level PM entry points
(dwc3_qcom_suspend() is used for both system and runtime suspend;
runtime is currently forbidden but it is planned later). The distinction
gives firmware the option to use different policies for system sleep vs
runtime idle, including wake‑capability and context‑retention.
That said, I agree that the current comment over‑specifies the concrete
actions (“Enable GDSC, Assert and Deassert Resets…”) and makes the
interface look more complicated than it actually is.

We can reword it to describe the effective resource state, without
prescribing exactly how the firmware should sequence GDSC, resets and
clocks. However, I’d still like to keep the separation between system
and runtime paths so that we don’t have to extend the protocol again
when runtime PM is enabled.

/*
 * QCOM DWC3 USB Controller: Firmware-Managed Resource State Levels
 *
 * On select Qualcomm platforms, the USB controller’s power-related
 * resources (such as GDSC, reset lines, clocks, and interconnects)
 * are managed collectively by system firmware. The driver reports
 * the controller’s lifecycle and power-management context using the
 * following abstract resource state levels. The exact sequencing and
 * choice of underlying resources for each level is left to firmware.
 *
 * DWC3_QCOM_FW_MANAGED_INIT
 *    Controller is initialized after probe and brought into a fully
 *    operational state suitable for normal use.
 *
 * DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME
 *    Controller returns from system suspend to a fully operational
 *    state suitable for normal use.
 *
 * DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME
 *    Controller returns from runtime suspend to an operational state
 *    sufficient for runtime activity.
 *
 * DWC3_QCOM_FW_MANAGED_EXIT
 *    Controller is shut down as part of driver removal and may be put
 *    into a fully powered-off state with no requirement for retention.
 *
 * DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND
 *    Controller is quiesced for system suspend; resources may be
 *    reduced or powered down according to platform policy.
 *
 * DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND
 *    Controller is quiesced for runtime suspend; a lower-power state
 *    is entered while allowing a later runtime resume.
 */
#define DWC3_QCOM_FW_MANAGED_INIT            1
#define DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME        2
#define DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME        3
#define DWC3_QCOM_FW_MANAGED_EXIT            8
#define DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND        9
#define DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND        10


Let me know if this is OK.



> Regards,
> Bjorn
>
>> +#define DWC3_QCOM_FW_MANAGED_EXIT			8
>> +#define DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND		9
>> +#define DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND		10
>> +
>>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>>  {
>>  	u32 reg;
>> @@ -335,7 +375,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>>  }
>>  
>> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
>>  {
>>  	u32 val;
>>  	int i, ret;
>> @@ -348,6 +388,13 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>  		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>  			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>>  	}
>> +	if (qcom->fw_managed) {
>> +		if (PMSG_IS_AUTO(msg))
>> +			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_SUSPEND);
>> +		else
>> +			dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_SUSPEND);
>> +	}
>> +
>>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>  
>>  	ret = dwc3_qcom_interconnect_disable(qcom);
>> @@ -369,7 +416,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>  	return 0;
>>  }
>>  
>> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup, pm_message_t msg)
>>  {
>>  	int ret;
>>  	int i;
>> @@ -380,6 +427,18 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>>  		dwc3_qcom_disable_interrupts(qcom);
>>  
>> +	if (qcom->fw_managed) {
>> +		if (PMSG_IS_AUTO(msg))
>> +			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_RUNTIME_RESUME);
>> +		else
>> +			ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_SYSTEM_RESUME);
>> +
>> +		if (ret < 0) {
>> +			dev_err(qcom->dev, "Failed to Resume fw managed device\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>>  	if (ret < 0)
>>  		return ret;
>> @@ -624,10 +683,18 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>  
>>  	qcom->dev = &pdev->dev;
>>  
>> +	qcom->fw_managed = device_get_match_data(dev);
>> +	if (qcom->fw_managed) {
>> +		ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_INIT);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>>  	if (IS_ERR(qcom->resets)) {
>> -		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>> -				     "failed to get resets\n");
>> +		dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>> +			      "failed to get resets\n");
>> +		goto resources_off;
>>  	}
>>  
>>  	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
>> @@ -638,7 +705,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>  	ret = reset_control_assert(qcom->resets);
>>  	if (ret) {
>>  		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
>> -		return ret;
>> +		goto resources_off;
>>  	}
>>  
>>  	usleep_range(10, 1000);
>> @@ -727,6 +794,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>  clk_disable:
>>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>  
>> +resources_off:
>> +	if (qcom->fw_managed)
>> +		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -739,6 +810,10 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>>  		return;
>>  
>>  	dwc3_core_remove(&qcom->dwc);
>> +
>> +	if (qcom->fw_managed)
>> +		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
>> +
>>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>  	dwc3_qcom_interconnect_exit(qcom);
>>  
>> @@ -756,7 +831,7 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = dwc3_qcom_suspend(qcom, wakeup);
>> +	ret = dwc3_qcom_suspend(qcom, wakeup, PMSG_SUSPEND);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -772,7 +847,7 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>>  	bool wakeup = device_may_wakeup(dev);
>>  	int ret;
>>  
>> -	ret = dwc3_qcom_resume(qcom, wakeup);
>> +	ret = dwc3_qcom_resume(qcom, wakeup, PMSG_RESUME);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -809,7 +884,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	return dwc3_qcom_suspend(qcom, true);
>> +	return dwc3_qcom_suspend(qcom, true, PMSG_AUTO_SUSPEND);
>>  }
>>  
>>  static int dwc3_qcom_runtime_resume(struct device *dev)
>> @@ -818,7 +893,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>>  	int ret;
>>  
>> -	ret = dwc3_qcom_resume(qcom, true);
>> +	ret = dwc3_qcom_resume(qcom, true, PMSG_AUTO_RESUME);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -839,6 +914,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>>  };
>>  
>>  static const struct of_device_id dwc3_qcom_of_match[] = {
>> +	{
>> +		.compatible	= "qcom,snps-dwc3-fw-managed",
>> +		.data		= (void *)true,
>> +	},
>>  	{ .compatible = "qcom,snps-dwc3" },
>>  	{ }
>>  };
>>
>> -- 
>> 2.34.1
>>

