Return-Path: <linux-arm-msm+bounces-104759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFgOF4+M72l5CwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:19:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8947639C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACAF7303B8F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27843396F4;
	Mon, 27 Apr 2026 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKVQ2OQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoKknppy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB2346791
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305611; cv=none; b=KHOC5QHPcT1+gcAlLXySYq82hQeE6zB3y2pjffnmbUaCLhRTGzxz33A1cbWckRjaVMmSKWFMpFU/WASAgemAGVFEno7NWZoBZUkcv0YGqc6CMPX6QOrW91eUR6y1xSrGwO1FA7Ypj+SiJeG2d0V9nxHNCIiq5zmsrJpmrl9v0qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305611; c=relaxed/simple;
	bh=xA7oLw0PVHyFtLsv+xJ6J7jiDBNJ8vCSViifsyVMwXg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kX+B9FnzhHe0Mz+i9J3lMnDTZ+xKbt6mk7yQN/4WvSEddyT0NvFFRUBfKQDOzC7VvF1fXCkw7une84MnYFLlATfokdJ0q3zooUtEnpGjohgC67tgx110dCgMPAjY4lgWKj68TlJth9hNrB2MkBzPC11izld9V0UCofA/1NrwMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKVQ2OQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoKknppy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDGSeX3962106
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=; b=PKVQ2OQmoqFs0Tp9
	rRylN1a7twVqktNfcdbfCM0PGQmySefZQCz+pzdswhCTSkdwN9v9IPpdTUv1gRx8
	rza4VqGYjWzX00qy5Kh/+5RFP1lfRrBRLBXd5pE5iz6RbbxAdAD/tGT4oKBJOho0
	NoNNg+zO5nEEoyN53y5ERu64xmI/dlicXjQa8ubMFmCNCLnS6AtlLA4LN3RAGVbF
	C1MDkPklH6Dt8prsBYeQgqdoYUVdsKp2O7DVAw2b4gKr3HoM2lqztkkLJuUWBj07
	Hmc/Z7rnYQRmgyov5MSf9eDs0VPMxAmdDMSwVaRI2mFvPMd+ofVMY+rUaWdn7bjd
	fzmEbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k31urk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:00:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so80222251cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777305608; x=1777910408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=;
        b=BoKknppyXDoZIBj4I9wwOUkils1pKvZE+hH8T2Xrb1kVwtJikOAJfIqMN7IECJaJdE
         vZ4RYq/ae8BU63bFTCiwpi5ODHze1/rwXGyw8WSg8+9QnKABXJcGFg+vLeXzFyOjXcvv
         LwshQB3GlZc5P4q6tM40INdebNUOvZbdx6WdCWAoqdl2GuD74RCJFz9CJxUUW2lzpEmZ
         w6ozeAMre1wvkd0YqNpEwYf42CpyQPIB16TAOC+5GZR4pX4RbF+D321fzg+R9n+mzSXk
         wVvn0ADqmXXSNDrGuaQfepJUPuVQX5oIDzBsUE0LS1284S0+4WqSZMiHTAyyzHszPFcw
         rXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305608; x=1777910408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5YnZZPvlhd3x4Gktd+oBlK9waA9ib5xr0OuakVMGMQ=;
        b=OqtXAM7Rg5F72j9PwSSATS+lYWhnUdwIgZ9DoIKgfcLpSimGmhszE/JAKGEO9JML9A
         fHce8rSjaVJa3hW6aFzW11sis1GIWG/JNlfl8E26PjhvCDd8/NAfU6epSsQUaESBHCkq
         TOZJzAaqIfsdmYpOQcD4eqovDDqUWt6W0nWw5JpaA6JOIu3Q0l+foHu3tYAdOubdVSn8
         uGfvqDekNj5UigGUaxqv9y0mAXId4PnJ4N7IQ2ZYARXjggVex+CFd8E+EYEd61l7JOvz
         X+iyUU0b8P2qXlBveiFLQyzzc4A8d6ymNuUBFqK7oJYHOFDBwbAlOdGBR65jGLlesl/E
         8BDA==
X-Forwarded-Encrypted: i=1; AFNElJ/OiPg6fCkLlkXeR2kXE/q3QyV6pgSOIhNEoZ/lE2CZ7bunQkHL5q1mUtsThTDJCpQG7uHJPhgSjOSCpai9@vger.kernel.org
X-Gm-Message-State: AOJu0YzdO/RJYtmFnoDN/APR71ey0V30CuoeBpsmaSeVyEEMS0USzdzY
	mx7sfzLInmzhgJRELudI03Sm4YYKwBjjAIY5lmrFZbw3fnHwq3MaraDEHfuDiX8cXItmsJTRxa4
	o3JD+RxC8AZ9SnzEdlPLfHox8b4EWu7KeK5nA+mEf7ZSZyhhrxWuQHp0g41XhmCEiGRpw
X-Gm-Gg: AeBDiestLcuiCMTjmWR9qrTMkWX6NqBaHe/t9QW4HWiAsMjWq0jW/Af47PtOXDYDIQ/
	X3ws3iyuRpJz2ngYN07eeAqusC9SeghXrwMQJeezUM03MgWHCcW6pbhKhfTxFSNkcphhLshhCBb
	nspBIMX+X6xe0q7/lrQtNJb41LuNpfnlKIdAgYQRziHTC93dxnh/LUy57qa4Dha7lU24TDlsL+L
	GuY9CcXVBEYpJ1OkVRFPyRJYV+1ni3xlOHHvORU4RPrtLdqOgn2FjrEP77X3ipr8uNn0ZLQimq5
	3W7ncFDuIwxwriX48uHu4a7AaDQgCuC80t+nXzyGw5MSQjFBubL++hczlECOC/gJvU0gHY9yAex
	aoKChIAOpXEScjLFG+ILSdTZZOaLaywI8tfsmA06Pkg9kAT/o1qJijBmUSZ6d5CiCkPCVbkRzc2
	Gr9a+QjHtGzUz6uTc6GvbDAp6REarWonqALmdoNczlfDEhybaX1chVx0gh3qLbuM2g89nTxnFnc
	KPCaUyEq29/MR0J68jD4YYd6Tc=
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr687660481cf.30.1777305608428;
        Mon, 27 Apr 2026 09:00:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr687659071cf.30.1777305607655;
        Mon, 27 Apr 2026 09:00:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533b79sm1142735966b.54.2026.04.27.09.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:00:06 -0700 (PDT)
Message-ID: <0b7bc494-d463-42e8-966b-7201ae7495e2@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 18:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
 <39679013-dacd-4804-a52f-0c36adf8e698@packett.cool>
 <6290f555-3945-4c4e-83bc-31907e0d1ec6@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <6290f555-3945-4c4e-83bc-31907e0d1ec6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE3MCBTYWx0ZWRfX8SWXGEPaMwJg
 yhJMU5E7s9ffkYOsGiF6w/j7TEUB7jq2LcrQ3c0v5fuL7xILzG4k9qWfniJWRxi7K+nhW4lN/jl
 SIW30/pncR7m1i4NsNqDwv30AMVjaNigtcUJaPicKPqnDsirz2JZO8pf+xjgTNsjusQ83i6cZrz
 6aiWIRraejGS4f8JVxvR7PWGGolG2wNstuRVmhEM3m01zTs/MR5Bi1gN/bOvT/0NSRX5RHKLxjw
 xnMFOHHkIfTzaYKUNtMxw6Sh5LN4BTghnRhQ3URyOl5hSxPSwc02OPx1GGuI9sHswMmf+QLW9KQ
 6Apdpg5uoEQ4Q2LUDLYVax8gSuN4hoi/9Itk7Oq6gb9Dbm/GeyJuW5wWoKvvAZ50Dydronoc80K
 AwMm/pssj4Fh14g9XXUpN/qeWG0ghHrz6j3tVh+6wIV4RlOwC6fcRBbhGG6QNtKujmYuybzhGAR
 ZS1KYAb/d6Iqr6B7Ihw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef8809 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=yU1tb2PetugIyephoyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GD8WwtA_zRon2exZov4PEWWHSTFrncje
X-Proofpoint-ORIG-GUID: GD8WwtA_zRon2exZov4PEWWHSTFrncje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270170
X-Rspamd-Queue-Id: 61D8947639C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104759-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi,

On 26-Apr-26 20:20, Hans de Goede wrote:
> Hi Val,
> 
> On 25-Apr-26 18:10, Val Packett wrote:
>>
>> On 4/25/26 9:44 AM, Dmitry Baryshkov wrote:
>>> On Sat, 25 Apr 2026 at 15:33, Hans de Goede
>>> <johannes.goede@oss.qualcomm.com> wrote:
>>>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>>>> to stop functioning. The EFI GOP framebuffer should keep working until
>>>> the msm display driver loads, to help with boot debugging and to ensure
>>>> display output when the msm module is not in the initramfs.
>>>>
>>>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>>>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> Thanks for finding this!!
>>> Most likely we need this to be performed for all dispcc drivers. At
>>> least for all laptop usecases.
>>
>> This is relevant for phones (ex-Android) as well actually, though there have been attempts to fix that by adding stuff like
>>
>>             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>>                  <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>                  <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>>                  <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>>                  <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>>                  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>             power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
>>
>> to the simple-framebuffer node. However there have also been some "random" issues with the handover to mdss drivers (even with the mdss reset) so some postmarketOS kernel builds completely disable the simplefb driver.
> 
> Interesting. Note that just adding the clocks does not fully fix
> the parking issue. The clock gets parked as soon as the dispcc-x1e80100
> driver binds and the simpledrm driver binds later, so the clock will
> still get parked for at least a while, leading at best to a display
> glitch and as worse to the hw being in a confused state.
> 
> We do still need these clocks to have a chance for things to work
> without needing clk_ignore_unused.
> 
> I've been having quite a bit of trouble with getting a
> simple-framebuffer with similar clocks listed to work on a Snapdragon
> X1E78100 based ThinkPad T14s too work.
> 
> The problem is that every other boot or so once the msm driver
> loads the display goes black with the following errors:
> 
> [    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
> [    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100, CPU#8: kworker/8:1/138
> 
> I've tried putting a delay between the simpledrm driver turning
> off the clocks and the msm driver loading but that does not help.
> 
> My conclusion is that the current simple-framebuffer resource
> handling code concept/design is broken. The intention of listing the
> resources in the simple-framebuffer DT node is to avoid them getting
> turned off, IOW leave them untouched.
> 
> The turning them on at bind time of the driver is a no-op since all
> of them are already on and we also don't need to worry about
> power-sequencing because of the resources already being on.
> 
> But on unbind of the simpledrm driver / removal of the sysfb
> platform-device we actually do start touching resources and
> turning them off causing these problems (and not knowing
> anything about the correct power-off sequence).
> 
> So as said I believe the current design is broken, on unbind any
> usage counters like struct clk_core enable and prepare count
> should be decremented to allow the e.g. clk to turn off later;
> but at this point in time the hw-state should not be touched,
> so that the actual display driver inherits the hw in the exact
> state as setup by the firmware/bootloader.
> 
> A first approach to stop simpledrm from turning off the clocks
> just before the msm driver loads is here:
> 
> https://github.com/jwrdegoede/linux-sunxi/commits/efifb-simplefb-resources-wip
> 
> and then specifically the last 2 commits, which switch
> to setting the CLK_IGNORE_UNUSED flag on the clocks
> instead of doing clk_prepare_enable() on probe() followed
> by a problematic clk_disable_unprepare() on remove()
> 
> This works for my case and likely for more Qualcomm hw, but
> as the Self NACK in the commit messages explains:
> 
> This will not work some other device/driver uses a clock with
> the same parent and then runtime-suspends.
> 
> Because we don't increment the enable account, so the parent
> will then get disabled on the runtime-suspend of the other
> consumer.
> 
> Instead I'm thinking about adding a clk_decrement_disable_unprepare_count()
> function which goes through all the normal clk_disable_unprepare() motions
> except for actually calling the clock-driver's disable() and unprepare()
> callbacks (for both the clock itself and its parents).
> 
> I'll probably give that a shot tomorrow.

I've implemented this solution now and this seems to work nicely, see:

https://github.com/jwrdegoede/linux-sunxi/commits/efifb-simplefb-resources-wip-v2

Regards,

Hans



