Return-Path: <linux-arm-msm+bounces-62790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAFAEB85A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29E201C27964
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D22A2BEC3B;
	Fri, 27 Jun 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf92O7bq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD74431;
	Fri, 27 Jun 2025 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029324; cv=none; b=UJDHO+QRJfE123W7YNw6FvlQMH3DMXewYwaYTdky5AfjNuf7IOGwmNtMGg4DEMOiw3gyoplIK1YvQKVl0HZW3npEV80Wy+NAbfDIJFZ8JAEWPPhnpip/I9byobRNhnlEeUiCKAgGwT30j9atOlXmvvp1PVIlPZAv1hP0z0jgZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029324; c=relaxed/simple;
	bh=gp0epzP3egqUiKQR6pxigJkagwhLBDTL6iCWSDgXGW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMXNPjYVGtTGsSPR4A/VSBOnNM8YlsOtMnCJGALZOy8wtJvHf+uxRUXQfF5Wy5jXph4bzdC7GH1ClH3Lbr4xPJ5nR7D4H45meCpd2p8oGIRMfyD0C60Bke/vgRiWGNVFjj1LOObOQApjXJJ8xfRhLw9JcbCxfxXJTHzGxl7MGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf92O7bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C1AC4CEED;
	Fri, 27 Jun 2025 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751029323;
	bh=gp0epzP3egqUiKQR6pxigJkagwhLBDTL6iCWSDgXGW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mf92O7bqAm0yXgSgJJHXrBRLCx2b7byyy6lPi78UfDbAB7PkOHyPZd3YNeI0ILwOI
	 GY6x6hbdFTyOQ2LBLZUKbH7UdrQ+CFwPS5/4aKnQJPutnbN1iewB4PxkdeZ1iPTp45
	 /dp6KNaKFRCeSmQEoFd09vt+XFIRGA6ZFlCjponUXeSAMVyzqcfJyBjOvdE128/90a
	 ipbTOmHrfwLKAm9qHHYvLzyFK3rDxxBx5UO8by6HUipMXcLQREbBLnAQdoj4LqeiPH
	 eB9W1kUck0QmVAAivR4sXVZdySBhqee5Kqe/JquE9QCgBcJkveO26vPhrw2TUZhJoc
	 Oi1/ft61NHVGA==
Message-ID: <26bc75ab-5bae-49e5-baaa-155599ab8903@kernel.org>
Date: Fri, 27 Jun 2025 14:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org, amahesh@qti.qualcomm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-4-quic_lxu5@quicinc.com>
 <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/25 1:23 PM, Konrad Dybcio wrote:
> On 6/27/25 12:33 PM, Ling Xu wrote:
>> Currently, domain ids are added for each instance, which is not a scalable.
> 
> 's/ a//g'
> 
> [...]
> 
>> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>> +		/* Unsigned PD offloading is only supported on CDSP*/
> 
> missing space before comment end
> 
> [...]
> 
>> index f33d914d8f46..b890f8042e86 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -18,6 +18,13 @@
>>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>>  
>> +#define ADSP_DOMAIN_ID (0)
>> +#define MDSP_DOMAIN_ID (1)
>> +#define SDSP_DOMAIN_ID (2)
>> +#define CDSP_DOMAIN_ID (3)
> 
Pl move the defines back to driver, see below comments.

> No need to include parentheses, as you're not interacting with any
> variables
> 
>> +#define FASTRPC_DOMAIN_MAX    3
> 
> #define FASTRPC_DOMAIN_MAX CDSP_DOMAIN_ID?
> 
> What I meant in the previous revision is that you can not move
> data inside the fastrpc_ioctl_capability struct, but you can
> definitely add a comment like:
> 
> struct fastrpc_ioctl_capability {
>         __u32 domain; /* Retired in v6.whatever, now ignored by the kernel */

hmm, If the plan is to make this field deprecated then why are we adding
the defines to UAPI, it does not make sense.
Also like Konrad suggested
>         __u32 domain; /* deprecated, ignored by the kernel */


Also please move this change as a new patch incase you plan to add the
deprecation along with checks in the kernel to make sure no one is
actually passing data in this member.

--srini


>         __u32 attribute_id;
>         __u32 capability;   /* dsp capability */
>         __u32 reserved[4];
> };
> 
> Konrad


