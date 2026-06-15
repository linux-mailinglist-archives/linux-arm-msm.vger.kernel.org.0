Return-Path: <linux-arm-msm+bounces-113184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +KP7Eg36L2q9KwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:11:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A868691F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:11:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QeT6aTgJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ef8FkRYh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5DF3048912
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CA63F39C7;
	Mon, 15 Jun 2026 13:09:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5F3EFD15
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:09:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528949; cv=none; b=l7AYRA4+VZD2BH7tLiDMoiInPvQHkfJ9UShQd4qLpdIy/OcvlvovdcIdzHvpYY0FOlVP6ww0QyD3LIlXEfz20QgGPxAEX4ev18VdSy3s50gih+7FxQgmCSpDhGSRs1mS7XtlJBf7tSOP2kfCqUrm8TDmNiYp3nVpvTYU9EtqV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528949; c=relaxed/simple;
	bh=RjFTDqXFgpvidYyapFhOxz9wI1lGXJd3oSnFiMwKBqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFWeeUd+L3HAnjVe19JB87rxpVLQGoZkufLhAUa3D6N0CAZNp6Wk9ak0btcM7baTnPNRhH382PFYOgoFqDKnCfWPZVliXgjvArA3fUSlfR9YMxVy3u3d/B9hXcx7QfVqbDtkTg/xiOJ5g8NoXkBBstKEvWBXlFQ4KkGXceqoYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeT6aTgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ef8FkRYh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCbG54503166
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=; b=QeT6aTgJvcITgCFY
	BpQbftyyrzvP3tBkqB2qco47qHoPS9cpIM89vPnL/BuGtcjSrYa70nEzqKkOHbp5
	cQj0fA/fHVdUz6l6qnE06O+JT5MF/xLoTJrUodZbQtQzhJcq3oYh1M1jIqVFHwgt
	N9UeT7IWrfc/aL2OVLxoEsM4nbkax0va1khfv91kaP5qK1r2rS9Dx5Bvik2EIv6l
	/pKkRRINKf6rYKQRZWbW+uXe5NlK56zOZDsDnyyqjM/USPrf649eQ+4GG/YFuAsW
	7Ng4TOX5RyCmFNgbtCPg0/k8M6Tuwa4Q4TpuCTZLR6DAT8drbsN8h4/FCWN4Wdd5
	Si6XRw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegurvhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 13:09:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85c530ddebso1621809a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781528946; x=1782133746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=;
        b=ef8FkRYhOuPuYlYefDnOLJA0hv1yW1TWn3TRi8mdtINAxpMLGcCSN1lehEIOW9Th/G
         z2OmYsXpSPYIhAhGdXXwKZTrzYstsYmOZhtpwHXNilgQ3edvCOygAQx3n4O9nMv4KVO2
         qKEziqgTwtJhue/bUqBniA9Rw+EGt+dqR0K00ecg50P9Ph0AvIucp9yIXHnakrYk8Ne8
         hJyln40OCg2TqT4D2N8jGubz/+16LhnhD/yjmDYKOo0Q5ayzlLVljdP7Q63YwFPZEsLi
         HXXE6BsY7NDpkpRRBz8mkfMT/lhxS8XHD3yosOBXSZJ0E7pfE13Wdl/x/u8ZS6wVaNwr
         RYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528946; x=1782133746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpXgSiHGC0bXiIpwfPNZDaXl/xnRlc9o8aSjGbu/Wc4=;
        b=IVUseC1RKM+/YNFhM6mbYPduJXy5wa29/RtlRob0Fc+a8Ha2pZC2Kog8ZhQ2imIDQM
         Mz7/DvvWL9ThXXOIUj0G2ynosYqt7hKUxa2YAgeR6U056q9nRFXohWsvy5CXcvVpyjMq
         araBtvGI4h7w1dvqim56ihCg3SDU/iQSu7F1ehjPqntMBd2lZ3eygKHO0MPHw3dHdhm9
         6PeKQVVgaKV6P+HOcoTAAZPZ9z8saNV6z8KoaQkLIyOTYPPJlRhGC3HxIJas7wpdLwGp
         N/3Bh5UsNYjO0kxeM10Kgt/Ia81ofFUoEYSXsgtGTRzttkKv48cBKqCbiw+2Q0ev6ju6
         S+Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9NTGva44ts4neBmHqV9809KPT766n1FRtkLk2G8+skxaD3HNQQWORJLeybSFlVL3u0iB1PNvl7rlCrUi4S@vger.kernel.org
X-Gm-Message-State: AOJu0YwanhVSp5BJIpEJNTv5tEA4z7t/LIGsjcxFkKWYyPqbfj7o6kZn
	JAJRoZHfdfrj1jRDqeeUm1mIQuUDEIUEHQHeYbRpVn/8YhwL4LfmVW8pplMN3SWCLEncm2+Gbiz
	Gx11cbDOG7FTbQ2SOGNO0tA9RcF0TR2ey/wwCpgbgP5l9Mu/i0KRFWiQAe5dP0op1vxX5
X-Gm-Gg: Acq92OFQXE4rMWqkZzqxjNBOh43Bu2RsmNnyh+mOTiww5Qe/Gd0y5Ak2CgDh8e9Nvg3
	eWgksUu7KWcpgbLgW75wyzsFm0BJG2vu7NBV85QBr8SD41aQafCNH7AyqyVCZld3p27Bm54ZyJc
	cUV2ihGrYMj+azsRySYQfjDdDVkYyW5LaiEm9jmi71J68frDHDQml0GzTmB3h+9WF/j9PFfwSTK
	/S3MeUN/QvUkHz9NLU7/4Uzjq4WP3T9tQUds1+nY7G7/BHcpE6zqcjp3oc3dNwNPAa7JLuqTRun
	Lp6wnN8a1urFQ4flqZMhVtmlA2IWAhA0aY+6iw+Oh2exoD/PKvyFA1GrV+rJFlOIhbGT4YGkr5i
	8gqqRW8oGhKD1zkt8Q0YJlq+glxAgpnfUSSnqSIpbg+RG2OAEBz7D+4E=
X-Received: by 2002:a05:6a21:3208:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b783b13836mr15703728637.2.1781528946207;
        Mon, 15 Jun 2026 06:09:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3208:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b783b13836mr15703681637.2.1781528945607;
        Mon, 15 Jun 2026 06:09:05 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f88bsm8829083a12.27.2026.06.15.06.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:09:05 -0700 (PDT)
Message-ID: <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 18:38:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm
 boards
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xin Liu <xin.liu@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
 <aivBcGQgeKGW45Is@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aivBcGQgeKGW45Is@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzOSBTYWx0ZWRfX0gtqSmkobG8E
 OctlfuVKAPEa3axoM1Krxk1vgZ6i7ctfPWa5cOsj+lVFj0SrsChKlEJuOaeOMUghmbG9QAGG0/H
 QlC1aiiuWT5jvyklJMOyr5FMm/qxFcxpqw8kza0CxWG7DxZUWTRaXxXzbHuTRhSj2WYIDQNEX33
 w3JI/ksVAYzhLUDpwNGY9WnoJuMWyR6po3xlc/nsSMoeO+Ujcq5LMDcofEs/DNzfrQ2fvSeW7Ee
 ClCkSTPeDF5E+WRQeMtjJYJeDqo4zzu4tMz7vSudi6d1q5znR1/PlumgxxfSYyMBcLT1ZjGSjzp
 eSEoPDGu6edgRDSxITgITPWgAn/fwTz8p8ovWb9IyJ76BSsyEyOui2UjUgrBe58CTFYhZSkScN/
 UYUQhGLAZEjRuM8piqbABwNjIcPrQe1RRAstMz0qZOebcuaenfv1xAW12KR+u9NdmQWPx1yvGXk
 osc58O2ND4JlawYzo1Q==
X-Proofpoint-ORIG-GUID: 8hu6EI7kUrDQzwzfW4e42JJ3bzfOaDBS
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2ff973 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N88bLgbrC_UBjzhzuoEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzOSBTYWx0ZWRfX7znIl3lmT+IV
 HFjYelstR2XGuqTAeAzjLNLXNJUU5V86AUGathz695xISqz2VMEh26PSiHPL23dstds75SE9tTw
 DxQsdqoaAi8ZTZ/rlcnU8aKCh+WkSo0=
X-Proofpoint-GUID: 8hu6EI7kUrDQzwzfW4e42JJ3bzfOaDBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113184-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:loic.poulain@oss.qualcomm.com,m:anurag.pateriya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xin.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A33A868691F



On 12-06-2026 13:51, Lorenzo Pieralisi wrote:
> On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
>> Hi Anurag,
>>
>> On Fri, May 29, 2026 at 4:29 PM Anurag Pateriya
>> <anurag.pateriya@oss.qualcomm.com> wrote:
>>>
>>> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
>>> kaanapali based boards.
>>
>> I would like to highlight that when Linux/EFI is enabled, which is a
>> common config, efi_reboot is used as the primary reboot path (see
>> machine_restart). 

Yes but, only if EFI RESET RUNTIME service is enabled by UEFI.

efi_reboot(...) {
..
          if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
                   return;
..

>> As a result, the PSCI reboot hook is not invoked in
>> this scenario, assuming Qualcomm firmware provides EFI runtime
>> services. 

Currently EFI RUNTIME RESET service is not enabled on these firmware.

>> As a follow-up, it would therefore be beneficial to also
>> improve the EFI path to support such custom mode(s)...

Yes, and potentially linux should also have some control, if it wants to
go via efi reset path or the PSCI reset path.

thanks,
Shivendra

> 
> I have not checked but we should probably put in a place a way for user
> space to check that PSCI is _not_ the reboot method that will be
> used, lest it would be allowed to send commands to the kernel that
> would be duly ignored.
> 
> Need to go through the whole thing again before commenting any further.
> 
> Thanks,
> Lorenzo
> 
>> Regards,
>> Loic
>>
>>
>>
>>>
>>> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
>>> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com/
>>>
>>> To: Bjorn Andersson <andersson@kernel.org>
>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>> To: Rob Herring <robh@kernel.org>
>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> To: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Fixed subject lines.
>>> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
>>>
>>> ---
>>> Anurag Pateriya (1):
>>>        arm64: dts: qcom: sm8750: add reboot-mode support
>>>
>>> Xin Liu (1):
>>>        arm64: dts: qcom: kaanapali: add reboot-mode support
>>>
>>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
>>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
>>>   6 files changed, 30 insertions(+), 2 deletions(-)
>>> ---
>>> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
>>> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
>>>
>>> Best regards,
>>> --
>>> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>>>
>>>


