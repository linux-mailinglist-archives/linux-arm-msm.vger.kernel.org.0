Return-Path: <linux-arm-msm+bounces-80064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E57C2A850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 09:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1C7188C182
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 08:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79742C3247;
	Mon,  3 Nov 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQsqVyma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7THsarj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37BD2D7DCB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157778; cv=none; b=SzHu25ThyHr0l3r7JZho87htsTn5OTzuHdm5Dx6pZxR3OpvOsc3Ueyc1it1C5SmyChqzSuag7ZSb9IGJMYy9AMkQ5H3vkLtAlfkZ1xZ+eufxaOEGiBabIocbK/J7bEc1PCTzYKQ8mizVJD1MqiXgCgk/U85b/8QvXRSsmfFRqcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157778; c=relaxed/simple;
	bh=o2L0msGbJYSkAD44J/YgIaw8tdT7sdmt2s7QT88EU3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4UgJNzn6tK3LWz0lWg6lDq683g4DleAXr4p496Er3hIovkP6G6syuBUPEsUuKbk4epzNsUSrlj7Yx9eDZbWTkE9DMGC+vCD9lqY+xidjPUa0PNWAECouoglap52QGAG/2OQJpeQSEmS8lPI4XxvrYaZBM2OFlmglIYU3hTq6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQsqVyma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7THsarj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A33DNQe1941200
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 08:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVFnX7GNGROVyRdZ0Cl5UHtsvlozFeCxuWa2wicmjyE=; b=BQsqVymalQz0pWs9
	+VUg9HfcV2OYQ1DfvEBjdSGd5fZFOt2hi7r7GcdwPiphqMmGIVJZYQFwvoBR1u7T
	l+2jlHukTX+Zxz1Y/jqbmgLjZhNLIqdGFZL9Dy0L+VqldORUXOEUUVTPufWJb/Xs
	4Xt2lN0pB4KWnl22W1j9IHPT7AJJVOrXd9DhIh6C2INlZW+vmt7uC94rpO13wlTX
	6n/kyg21aGYdchKrwTTBt9sWXauvH0ZkwFz9BSbcPkpH3KdCaYprPffnj/Rh1UuM
	CXo1LMbuWu7yhOXDIuzuyZowUZ0V3qmtyWndM+VMaNb5v8ik6zby0Coy3W7JxSn5
	x8avCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w8qx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 08:16:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-286a252bfbfso102631425ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762157775; x=1762762575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iVFnX7GNGROVyRdZ0Cl5UHtsvlozFeCxuWa2wicmjyE=;
        b=E7THsarjktnMLCE8wfyqhq+rQEZiJchaNiWzdV4H+qL4GrhOYduZaxCeQcrj5iN1Te
         31YIdjicRlOZaFRPtPyXjd8pR2rdS+kF3Zhl682I0OcQJhyclHJwIbbziMf/7Ienlxdd
         T7hGe+0P96wxkMIytzRo3EH1Iqcztf+A85VfTkMghuo1MxAaz5BYGPDHvKn1/JrIG6eM
         /A39EGULw8X6dsTNz5hojfphnY+xBKYLj/Ffs4qozVTSkUc32/l8LDMGS1zmNRjBasUw
         vag6HZ5EP/yLYBLCCs1IBo2tDit996l/Gt6JH80ko8wYX0JxW7xsbTgUoSyIUXybgJPN
         +XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762157775; x=1762762575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVFnX7GNGROVyRdZ0Cl5UHtsvlozFeCxuWa2wicmjyE=;
        b=pwL4i4yGai8T2YfOy8mMBnJschEsj2bPDOIfzaLsG0X56Sdk2WTSY5j+23RC0ShPLK
         I8Ty1uzaNm0+oSCsu1OgGS2Wb92Tg3TXU5qd4ZTQsc9EYJQcYM+ggB9xa4D/ySbHPJZF
         28Vcp2OvtxSzmVENo+vNNLVwjiE5d4v5rWys+DzsTLwe5xHZYOdXJCCQOgQwDDG+6uzK
         s4PjVBDgNMWMTJ9/J6yQPo/SgaC7B4AF7uc/sufzDaLaJpllAfIv+RCBti7DTfSZ4/Cc
         QVOYhBdj3ShudXsxhuDMmKttJY8v5GGrguClSJCOgdonkHsBo0sTocfrC2imxPHT0Khb
         YqJw==
X-Forwarded-Encrypted: i=1; AJvYcCV12gbtRHXHCr0kwlOW7D5f+n2/tFKsORUNJIrq3hHWSnEUdOEVXFEmS8LBdIavr9A5x/F97LvTW0/9d75b@vger.kernel.org
X-Gm-Message-State: AOJu0YzPeTZ3ASRHbJd3FqUp+4Ae27NM5oWjg09G3B7cH9vsbvdXY6sA
	wAtW0iaPCYVRoCRtyCmmVKOnbMWsHGLon0DaILzoFMQWxahAbTESrehpVg8I0E8li0oWPKRqq5+
	jaNn1k2an6sxY9kgw4DFoiIcbnaKZSAIhM5kjcH7Wqt7MCz4+k1UNjWz2QgEPkIh6cVyo
X-Gm-Gg: ASbGnctupAv1Lt86tL+hvXreArALjsITWAt4o9q+Qvq/q5JVjmS8JSDhSsnadbcXftG
	liA5N6A/s/aXA7XhinIoQiA0dNqjI1cAhHfZVU72zpkCMIgwbcJtYaw45cUSGloorOrLpfz3ke+
	hZN9xUToxwLUhL6RIt8ZFthtPitZRNdLQz8Wuo4laFujuGzt35eqr2lqVak9qBxcktyVJOheI9K
	fRaPPJcHxIMdYJvKNVMTh+4a/PxUhVy66OC//x5SOSkAl/WUtKRFrJN5x64RUr1aeBEcik1p1h7
	F5ZrZOb8skNSjGZmAeyR7xwaF8VC08Wn0R7qzVL1qlrkqIn22Fk6+XIr5RCUX1sPjdBJ2EGT7rY
	R3rgSLvbGqsrfUIc8NMKSyIh59A==
X-Received: by 2002:a17:903:1ce:b0:294:f30f:ea4b with SMTP id d9443c01a7336-2951a3620a9mr136065665ad.8.1762157774314;
        Mon, 03 Nov 2025 00:16:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVptNsFRThIRj56LPC+qiqp81PabtSvg+cP6nigHFGwAPwmS8AdyJ4CzJmYSmDVFvWVqS7bw==
X-Received: by 2002:a17:903:1ce:b0:294:f30f:ea4b with SMTP id d9443c01a7336-2951a3620a9mr136065305ad.8.1762157773627;
        Mon, 03 Nov 2025 00:16:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bda59f56sm9895920a12.21.2025.11.03.00.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:16:13 -0800 (PST)
Date: Mon, 3 Nov 2025 13:46:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list
 traversal
Message-ID: <20251103081601.ybwv7jzpxd6mndki@hu-mojha-hyd.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
 <5l2tcjbdtikkhkuhuz64ymk5et6wtl4kwf2mc265su27oh57rt@3shmo3wfx7fb>
 <efb52d01-0430-8bdb-e0c7-86c5a2857ef6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efb52d01-0430-8bdb-e0c7-86c5a2857ef6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=690864cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OYyXcgXM0HA3R5ad5ecA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KoWn5PEZf3Mtz6nFbTOGyXIoqoCogth_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3NSBTYWx0ZWRfXzf8yBHx2cez1
 oBtwp/GpgamH0bfIxQy5AlOC+SCZzFueT8CYPhqhM4wedWMxUilBZs87CugtI/j4fvF1ob9o9WO
 ElCCAqep81S5WU/xTLI8DWqi1nfu78f22JtfzEc8er9+QF1ClC2WSe6f+/SqM5nepyEeUctBav6
 Uuz1DL9372I4MV0yRwJNbrgHlNqpMj5WkcY6/zXoxN0OFCpDZSVQgIkVDAEKEZQCIg3UFCi3HnB
 5hBem7/T3TcrJdzb7+gZnxXU5c92ZVkuo63i6GCgqfEseavtGX2JqKuuQbAegLkSTTx/CuUC8iC
 4WYmJJvV4nPfp6ZlDk+UK72rXP1tfC7E+rMV1CFhXnj8a9mQVhy89JKRXn6Zwmx4ZAokwXwQjUj
 trce1VTSCZq01NjhLfTaxKmKx/0dWg==
X-Proofpoint-ORIG-GUID: KoWn5PEZf3Mtz6nFbTOGyXIoqoCogth_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030075

On Wed, Oct 29, 2025 at 11:18:52PM +0530, Shivendra Pratap wrote:
> 
> 
> On 10/28/2025 9:04 AM, Bjorn Andersson wrote:
> > On Wed, Oct 15, 2025 at 10:08:16AM +0530, Shivendra Pratap wrote:
> >> List traversals must be synchronized to prevent race conditions
> >> and data corruption. The reboot-mode list is not protected by a
> >> lock currently, which can lead to concurrent access and race.
> > 
> > Is it a theoretical future race or something that we can hit in the
> > current implementation?
> > 
> >>
> >> Introduce a mutex lock to guard all operations on the reboot-mode
> >> list and ensure thread-safe access. The change prevents unsafe
> >> concurrent access on reboot-mode list.
> > 
> > I was under the impression that these lists where created during boot
> > and then used at some later point, which at best would bring a
> > theoretical window for a race... Reviewing the code supports my
> > understanding, but perhaps I'm missing something?
> > 
> >>
> >> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> >> Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")
> >>
> > 
> > Skip this empty line, please.
> > 
> > 
> > And given that you have fixes here, I guess this is a problem today. In
> > which case, this shouldn't have been carried for 16 versions - but have
> > sent and been merged on its own already.
> > 
> > So please, if this is a real issue, start your commit message with a
> > descriptive problem description, to make it clear that this needs to be
> > merged yesterday - or drop the fixes.
> > 
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >>  drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
> >>  include/linux/reboot-mode.h       |  4 ++
> >>  2 files changed, 57 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> >> index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
> >> --- a/drivers/power/reset/reboot-mode.c
> >> +++ b/drivers/power/reset/reboot-mode.c
> >> @@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> >>  	if (!cmd)
> >>  		cmd = normal;
> >>  
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> -		if (!strcmp(info->mode, cmd))
> >> -			return info->magic;
> >> +	scoped_guard(mutex, &reboot->rb_lock) {
> >> +		list_for_each_entry(info, &reboot->head, list)
> >> +			if (!strcmp(info->mode, cmd))
> >> +				return info->magic;
> >> +	}
> >>  
> >>  	/* try to match again, replacing characters impossible in DT */
> >>  	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
> >> @@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> >>  	strreplace(cmd_, ',', '-');
> >>  	strreplace(cmd_, '/', '-');
> >>  
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> -		if (!strcmp(info->mode, cmd_))
> >> -			return info->magic;
> >> +	scoped_guard(mutex, &reboot->rb_lock) {
> >> +		list_for_each_entry(info, &reboot->head, list)
> >> +			if (!strcmp(info->mode, cmd_))
> >> +				return info->magic;
> >> +	}
> >>  
> >>  	return 0;
> >>  }
> >> @@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
> >>  
> >>  	INIT_LIST_HEAD(&reboot->head);
> >>  
> >> -	for_each_property_of_node(np, prop) {
> >> -		if (strncmp(prop->name, PREFIX, len))
> >> -			continue;
> >> -
> >> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> >> -		if (!info) {
> >> -			ret = -ENOMEM;
> >> -			goto error;
> >> -		}
> >> -
> >> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> >> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> >> -				info->mode);
> >> -			devm_kfree(reboot->dev, info);
> >> -			continue;
> >> -		}
> >> -
> >> -		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> >> -		if (!info->mode) {
> >> -			ret =  -ENOMEM;
> >> -			goto error;
> >> -		} else if (info->mode[0] == '\0') {
> >> -			kfree_const(info->mode);
> >> -			ret = -EINVAL;
> >> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> >> -				prop->name);
> >> -			goto error;
> >> +	mutex_init(&reboot->rb_lock);
> >> +
> >> +	scoped_guard(mutex, &reboot->rb_lock) {
> > 
> > I don't see how this can race with anything, reboot_mode_register() is
> > supposed to be called from some probe function, with reboot_mode_driver
> > being a "local" object.
> > 
> > The guard here "protects" &reboot->head, but that is not a shared
> > resources at this point.
> > 
> >> +		for_each_property_of_node(np, prop) {
> >> +			if (strncmp(prop->name, PREFIX, len))
> >> +				continue;
> >> +
> >> +			info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> >> +			if (!info) {
> >> +				ret = -ENOMEM;
> >> +				goto error;
> >> +			}
> >> +
> >> +			if (of_property_read_u32(np, prop->name, &info->magic)) {
> >> +				dev_err(reboot->dev, "reboot mode %s without magic number\n",
> >> +					info->mode);
> >> +				devm_kfree(reboot->dev, info);
> >> +				continue;
> >> +			}
> >> +
> >> +			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> >> +			if (!info->mode) {
> >> +				ret =  -ENOMEM;
> >> +				goto error;
> >> +			} else if (info->mode[0] == '\0') {
> >> +				kfree_const(info->mode);
> >> +				ret = -EINVAL;
> >> +				dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> >> +					prop->name);
> >> +				goto error;
> >> +			}
> >> +
> >> +			list_add_tail(&info->list, &reboot->head);
> >>  		}
> >>  
> >> -		list_add_tail(&info->list, &reboot->head);
> >> -	}
> >> -
> >> -	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
> >> -	register_reboot_notifier(&reboot->reboot_notifier);
> >> +		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
> >> +		register_reboot_notifier(&reboot->reboot_notifier);
> > 
> > Once register_reboot_notifier() has been called, &reboot->head is
> > visible outside the specific driver instance.
> > 
> > So, there's no reason to lock in reboot_mode_register().
> > 
> >>  
> >> -	return 0;
> >> +		return 0;
> >>  
> >>  error:
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> -		kfree_const(info->mode);
> >> +		list_for_each_entry(info, &reboot->head, list)
> >> +			kfree_const(info->mode);
> >> +	}
> >>  
> >>  	return ret;
> >>  }
> >> @@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
> >>  
> >>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> >>  
> >> -	list_for_each_entry(info, &reboot->head, list)
> >> -		kfree_const(info->mode);
> >> +	scoped_guard(mutex, &reboot->rb_lock) {
> > 
> > get_reboot_mode_magic() is only called from reboot_mode_notify(), which
> > is only invoked by blocking_notifier_call_chain().
> > 
> > blocking_notifier_call_chain() takes a read semaphore.
> > unregister_reboot_notifier() take a write semaphore.
> > 
> > So, if we're racing with a shutdown or reboot, I see two possible
> > things:
> > 
> > 1) blocking_notifier_call_chain() happens first and calls
> >    reboot_mode_notify(), blocking unregister_reboot_notifier(). Once it
> >    returns, the unregister proceeds and we enter case #2
> > 
> > 2) unregister_reboot_notifier() happens first (or after the
> >    blocking_notifier_call_chain() returns). Our reboot object is removed
> >    from the list and blocking_notifier_call_chain() will not invoke
> >    reboot_mode_notify().
> > 
> > In either case, the list has a single owner here.
> > 
> > 
> > As far as I can see, the only race left is if multiple concurrent calls
> > happens to blocking_notifier_call_chain(), the behavior of
> > reboot->write() might be undefined. But I think that is reasonable.
> > 
> > 
> > Please let me know if I'm missing something.
> 
> Thank you for the detailed review. Tried to summarize below:
> 
> The mutex lock was introduced in v13 following earlier discussions about
> whether the issue was a theoretical future race or something that could
> occur in the current implementation.
> 
> At the time (prior to v13), we concluded that while no race condition was
> observable in the current code, there could be a potential in future
> changes or usage patterns — making it a theoretical concern.
> 
> During review, there was further discussion around whether it's acceptable
> to leave the list unprotected simply because no race is currently suspected.
> The general consensus was that it's better practice to protect shared data
> structures like lists with a mutex to ensure correctness and future-proofing.
> 
> Based on that feedback, the mutex lock introduced in v13.

I agree with Bjorn here, we do not need a lock here..

> 
> Later in v15, the reboot-mode maintainer suggested that the patch should
> include a Fixes tag, which was incorporated accordingly.
> 
> So both the mutex addition in v13 and the Fixes tag in v15 were made in
> response to upstream review comments.
> 
> Need some guidance on how to take this forward or is it ok to protect all
> list operation, as done in this patch and keep the fixes tag as suggested
> in earlier reviews?

We should drop this patch., 

> 
> thanks,
> Shivendra

-- 
-Mukesh Ojha

