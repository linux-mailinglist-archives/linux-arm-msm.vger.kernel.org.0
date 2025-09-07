Return-Path: <linux-arm-msm+bounces-72442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C3B47CCA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 20:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2141F3A2DC1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECF61E231E;
	Sun,  7 Sep 2025 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWS82qrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C41A3166
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757269032; cv=none; b=EYMdgnXmeg1UROOtegX7M0inViwL20YSMeJjaadHpjFUN/6HDIG7xvDE3raZl2sV03P203Rw8o4cZ6dJhjDzXNPcaRU225Dw/eVGesrJ1q5/Lrn01ivBIcIlg/HxEbnufB1t/FG2KgViOTwkC7npk/vZPPswUPMN7/IRbFS40VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757269032; c=relaxed/simple;
	bh=vbtHhub+1RRGhMNNKtSKz9O92ySy744nqXoeDGy6E0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aplXcoBWB/Re8BuwmCXV1jLpSJ4QN7/7HKHhWJrOVeuQCDmca1Bli4jUl+33LtQiTWwiBkHI8Yro1KusgTwZm89/7OJWpYdMVO+zwGXA6P7zzno8RUwYBSFuXjurIHo69YJPGSJNSX9ApTrG390ZQtjB0g2dmIA1NxuB6JWDZp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWS82qrt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879dpY8005734
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 18:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NDLERyrBM5HRP4ILzHp+zzgB071aFZ7GTm70hkKh5g=; b=NWS82qrtJeFA2HPZ
	bQD1rQzv+UQMNujdqQz7JYBC2dVeCb4dnnOLsJNy3lBffbGa4rm90D022Jo8zLb3
	Ets4DlqqkIZMpPCTlk2bWzQZfJxE5PyokQ+JVugUKL6ZIdsq9QI1yoQGiEYgPV20
	wsfHjhpxfU/K7cXdPKiccxjJgdoGWEEHN56bwFY2Ke8Jxzrhqvo2/ExrMwc1Hgjm
	pfatx95jPfSztrgYotH+dG+q3OfSmX3HjuH8/KjyWZw2eUlA+WhWhu1Q5P8hynny
	n10KL+pArN+yxmk1NkHDStt2BP+sw8mzPKjKDAZ/+kAZmMi/UdF4pJA72gwa/5ld
	4BJ5yQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0jesc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 18:17:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4c46fbb997so3611737a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757269028; x=1757873828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NDLERyrBM5HRP4ILzHp+zzgB071aFZ7GTm70hkKh5g=;
        b=v6pd/wJ8DcMc7Xv4IyDT1unxt+4JZGep7oLcIN07ZAPnN/rf4F9MfZ1Fs8OLp8USOG
         BMdL10IfgfzZ+agHYQwrGTPYGN91Lhi8Ccr1sFlNYDuNtyypenADTxFPxWgHFglTCWcw
         g+jfgS/5zXL1/WdU+Jg+xr9wti2rmXMAdVEQMLgoxfRIqdnDqr2NOoRYAREn1ECWke0X
         Y5GPATtx5nHDvdGSzPFSOHUYAEiLMCHml7DiozI3iwBst7GgtfB6QT6eS26Y7O3X/nQO
         ARYCVXk9PkU0i29YF6ggX8j5oJ04poShCnExC5bSq73u3uaCKMf8vx8fg7kVsGOXjb3G
         0HJg==
X-Forwarded-Encrypted: i=1; AJvYcCXvhixkq4guaOYQzFDfoF+FeMreIpJhbeG+D+ntYdloNzChUGcZMNpnRFTgXIid4QkgAlw/qTQAAAUBOFlr@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbtDeftYOOEjMnCnv3KdUztjktkLqsFSuALa0kStup0fJKG0x
	Gk49Ay0Kss7KbQaaFdPkLRAdXyqpXo07pOMJDKYnDZ2Fr6QvttnEcn9QfRm7anu8SqdeXe7Vy7n
	5zDAx3FXKdI41CRZccKYajI7d5CA5lc+NktDD7it8+FGThpXXUGQfqPhrTocX9UfKxzUY
X-Gm-Gg: ASbGnctKQqvIbyemTZKD2DJxqsdnl2LjFqHAu25SU1yWFObh0T/SoiA8hjgm92+vVd6
	Qc5Q+aHBpHDr/QQHQXX3vpp9P9axxWCRCU1SFhuuGgVSl15o8HR/EsmW+ygOouSpNBsOHOMJHiq
	eVpo3Hit7SvX1zUd0IbH4jnORFGCxndMJsxhq8OfTbVlgHYvJGIAVjRjIpTABPuTczeS3CQYoUq
	XiYWdJdMitYYtTBQfF4aNi6MhrfbaUeNU1WcS8oraGrl3dvH//tIaLvV8e2ImSW6b7Hc58RdxGE
	ZVjkjF5N1VeOSauagZJ5s50mYSIYee+Vtk8Tik8lsbV2P1A6WAJTD9SB6RCmSxQhb2u5Ca+2/t3
	V
X-Received: by 2002:a05:6a21:339e:b0:243:b965:1bb7 with SMTP id adf61e73a8af0-24e84106fbfmr14045673637.19.1757269028058;
        Sun, 07 Sep 2025 11:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmiwifL76sqQbEY3LiDyw2AeOOQnvkn/QsnsWQJ9UZt7VhCP2Z+H4cEozEV8K5eMihsIvelQ==
X-Received: by 2002:a05:6a21:339e:b0:243:b965:1bb7 with SMTP id adf61e73a8af0-24e84106fbfmr14045655637.19.1757269027564;
        Sun, 07 Sep 2025 11:17:07 -0700 (PDT)
Received: from [192.168.1.5] ([110.226.157.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3096d1esm24027224a12.45.2025.09.07.11.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 11:17:07 -0700 (PDT)
Message-ID: <44378e83-b8e0-4bfa-a127-aafb0a12d798@oss.qualcomm.com>
Date: Sun, 7 Sep 2025 23:47:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] usb: dwc3: Modify role-switching QC drd usb
 controllers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <8629515f-5b2b-4e97-a998-05cd6eaa47cf@oss.qualcomm.com>
 <2025090734-plentiful-untracked-b7ab@gregkh>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <2025090734-plentiful-untracked-b7ab@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EndXFxIvrC0-EXw7lHCYKZ5cpf7BmDG6
X-Proofpoint-GUID: EndXFxIvrC0-EXw7lHCYKZ5cpf7BmDG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX48Mi3HZaHslD
 6GKBnI2Kyh47FiiFioFOpkUq0mwQWpo7yhL68utR2Csl71XH4hlQt0ULy6xLN9+dXudPQHJLTa+
 ufHmxwI6kkFFe4k3Om/gEJwvPoicEdyk4DeSgtqO/P5SW0BR1fs77u30KVHFYoSiEUqOgw8bDxc
 8LvvSTmFxTRwzvHHcSGUo2euGobB2nejJgmjlnVOsYdpZ56ORUeYTpSU5I0J57alX1FK8UpqT9E
 Xevo59bsfQ9bm11gYv9d7VgMGIhHVHOWeBg7vKXvyMkofLIep3ux7/LFdjgqxC2YtsDKlnbn42U
 Q7jNRqCB/wvO2SAyJb5MzVZvD7gT7/gjf0J9tMOGHeVRUtiyJuLNLX+Aspz9/djlyr0IQDZem8U
 5KxoIRJL
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bdcc25 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=QqF/YZBt/wu8DCr+JvV0/w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CGVWhDeSmqJaDp1pI4kA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 9/7/2025 1:41 PM, Greg Kroah-Hartman wrote:
> On Sun, Sep 07, 2025 at 01:18:51PM +0530, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 8/12/2025 11:25 AM, Krishna Kurapati wrote:
>>> Currently on QC targets, the conndone/disconnect events in device mode are
>>> generated by controller when software writes to QSCRATCH registers in qcom
>>> glue layer rather than the vbus line being routed to dwc3 core IP for it
>>> to recognize and generate these events. We need to set UTMI_OTG_VBUS_VALID
>>> bit of QSCRATCH_HS_PHY_CTRL register to generate a connection done event
>>> and clear it to generate a disconnect event during cable removal or mode
>>> switch is done
>>>
>>> When the disconnect is not generated upon cable removal, the "connected"
>>> flag of dwc3 is left marked as "true" and it blocks suspend routines and
>>> for that to happen upon cable removal, the cable disconnect notification
>>> from usb_role_switch to DWC3 core driver needs to reach DWC3 Qualcomm glue
>>> driver for it generate the event.
>>>
>>> Currently, the way DWC3 core and Qualcomm glue driver is designed, there
>>> is no mechanism through which the DWC3 core can notify the Qualcomm glue
>>> layer of any role changes which it receives from usb_role_switch. To
>>> register these glue callbacks at probe time, for enabling core to notify
>>> glue layer, the legacy Qualcomm driver has no way to find out when the
>>> child driver probe was successful since it does not check for the same
>>> during of_platform_populate.
>>>
>>> For flattened implementation of the glue driver, register callbacks for
>>> core to invoke and notify glue layer of role switch notifications.
>>>
>>> Set-Role and Run_stop notifier callbacks have been added to inform glue
>>> of changes in role and any modifications UDC might be performing on the
>>> controller. These callbacks allow us to modify qscratch accordingly and
>>> generate disconnect/connect events to facilitate suspend entry and proper
>>> enumeration.
>>>
>>> The series only allows autosuspend to be used but still relies on user
>>> enabling it from userspace (echo auto > a600000.usb/power/control).
>>>
>>
>> [...]
>>
>> Hi Greg,
>>
>>   The first two patches of this series are Acked and are independent of the
>> third patch. The first two patches include glue callbacks and suspend resume
>> for device mode for QC SoCs. The third patch is to enable auto-suspend for
>> xhci plat and hence independent of dwc3 patches.
>>
>>   If it is fine, can you take in the first two patches and I will resend the
>> third one if necessary after receiving review comments from Mathias.
> 
> Can you resend just the first two, as taking patches from a longer
> series is "hard" for my workflow, AND this series is not in my "to
> review" queue anymore due to the other comments on the patches that you
> don't want applied yet.
> 

Hi Greg,

  Thank you.

  Sent v5 [1] with just the acked patches. Will send the last patch 
later after it gets review comments.

[1]: 
https://lore.kernel.org/all/20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com/

Regards,
Krishna,

