Return-Path: <linux-arm-msm+bounces-100889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QABhCXTJymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:05:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7E360228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28E03301BD57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946DD3E0C70;
	Mon, 30 Mar 2026 19:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvTu5zeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbrwsFUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154BE3E1CF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897421; cv=none; b=cbBZE6oJ+mAgGLkjgTgfCT7D9qGesOXTj4A3Lwea4puL9a7a+kGm6nYpYjwnJI6+GNjQzX7wszbPaY6TSzZ3kB4DHXFS4Si/FKkJqj1VsDamzfAk/rc2VFYDXZGljZIpiVeF3XxhiPnGKbezaj4GMuaiASLD0nuiJAh13Olhy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897421; c=relaxed/simple;
	bh=MQdfNe0iWrkeE7odJSzoRgjqdWdXch7HoJrElAiYXOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNB7nk34szzEUXM2VB5bN/RM8w41FvRraIvJST15YN3Fp1bSwP3wLLKJuxHH/6TsUzuaBsXvzspxHElaWoxZCc8gP4imarWhH6/Zjk+usdvVis/g5rBiUdT/KA+3f6TTbh0XSgMI3oKY5sWuixQxq3mi8zaol0tzoredEOdiTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvTu5zeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbrwsFUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UHc1hQ703473
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=; b=CvTu5zeTqot+M/t2
	XZndndwcEcFl/MjZVz7ykGFy2qSz6PeyyIVVlYrUWATz52el4T8kk51j0stGS2Za
	g7lZHJL6ZyVSLIsLZNcvQKXv0gTA1D7wJJ6DmoOHV6ZHDUtrBh3fEhGI0oFZfFdL
	0G+SSp6kkWCPLFCzaYv2SCJhOIqWvznwoT57vgmybsCmf+fSlyQGYmmb+kOKYdwz
	kYnGy/XDd/XRCguXYnEzNph/cUjXg0jYbygDaIPdq6B3WVXDqePIz9epRZ3Uz2lG
	jRroIwe1lGR8c6A093ttZpc1sSsv8QqMtW7KaBV6zTI/+sKP4YVZYni6l7XZ1JKj
	05E9tg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansj2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:03:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56cfaba5062so1499573e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897418; x=1775502218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=GbrwsFUiC96UrpQgguNaFumxlFxLfkpM7k/dUDrFO9ZBRcX6WWj6dOvSAxWyQKszPy
         HjyuCetbAz6vE6W85b63/wuhYVZfqWJhBGg5sQtDHLMzroJXbODdVzeveJCunfYZdJK7
         fWdwRp7vj7cCUxo52ykf3IFXwnripgvHiZVl2GqHTsyG5IGTV/YGcd4JmgtdEKEELLKV
         D+Y8bMm9JEiM2s2MdhM9WWTE2T/LZGkaVrOVVm3dHnPNHzApK2KW9oHTgSbzSkekp355
         ziO9jWdsb9z20ZoDNNH2V5L8RCMbYHPaJnivj7uBx8hrKoJO/S+GRLk1QA4ne/ZhfmAm
         Kccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897418; x=1775502218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDUjl7tFEqxNNCDYOtkshNsr/EvHhDf1KIBdRBBNzDU=;
        b=nxYv25vAWLoCNMe5tXni6qlQ1QiAgoIcjgK6ozPlX9dVkEm/03kaMVtpak/BfdvBji
         sCfhVkX9MktvYYCtYB3o372AE6I4I/D0SxzFGNnI6qarJ3EFqTYaElMs77jnFZ/FYr/N
         74xGqbu3dO+fmTVHo70LJ9PLMRfMIa6vsFBGQ4RTQBF/tqarPQXHRYRpgeCCC300xfWj
         iuNavLD25S85z/nCGJE2pEm/jKJO8rWdugjkj6J4gTH0D1kvaq0hYgj+tXzD41jIXWgh
         dhKShoQ0M/zB4G6cuygRkJA0iGsUBohvLFmGPebpzSu03onedlpYKMUAM/jeixe7iFQi
         FDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNXHh5ncWdTslrRdH1vmB1ljUtnlG4KPTdPNBbN+jB2eJ70tDK5lP+i9rTolc5uMSD5bq6u5r/MT9KviId@vger.kernel.org
X-Gm-Message-State: AOJu0Yyee4i8ynmTsuGo8ptPFvDMFO2bfSyI14rP05KsID/gCeU1oFRP
	xYiLj/3a0/CeUPuTu/gKEEhljuHdCwZf0JIoLKnFHOaVdzALROwbSz4I/IQBxe1fz39u7SkZ0Xf
	xeEnmL3gBiXOeU9HNXaCGCRaz4aPrd47LtDV02Rya0xHz4uncZnEuHmhq+uh6/KuxxknU
X-Gm-Gg: ATEYQzzK5XuIwFymvWE80Gg4aO98fji/3LEwO6Y8sa4DRtBVNViFJP9oKeEbu+/YbzH
	O0FpwHfF2zJvdehUzyr90+N+BF04XGSX/BvIOtwj1Bk6NkydmEvM1uQ88TLVPkhE2aJKFGysWK/
	JzVp7p/bnxzAN5J6YotlEAqcdWLmTWbNtoLJcLS//sRex+Gn4S3itXjWDnDeFyWWttkNxKcoVCv
	9DemsfIYX5SxUHrry9rvLZRBTUjfFRpt6m17C4lvSTsJ+uFGzQ33GwcqSJgJcFk0izKlD7ktq5n
	SIA2FXp77vbTu4LqSPZer5xRupgEtiE6Xjf8+SdeN6436bKhxDHTZfYIi/NkPEDLHRJ/mc+l8RF
	5hlpIQxxUuvKVLF13syqjnZkeQnVbqueqRAG55LCeR54m7JGvDnk0c2nunIK83IgJwI13S/b+XR
	0G/9T9osVWTqUg6Qi6MP2enFJuxu4DPHXb3NI=
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6242011e0c.6.1774897418262;
        Mon, 30 Mar 2026 12:03:38 -0700 (PDT)
X-Received: by 2002:a05:6122:f89:b0:56c:c88d:e8c0 with SMTP id 71dfb90a1353d-56d4a4d60demr6241941e0c.6.1774897417788;
        Mon, 30 Mar 2026 12:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm1845663e87.2.2026.03.30.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:03:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 0/5] Add driver for EC found on Qualcomm reference
 devices
Message-ID: <apuctb5nyxpkljwttvb74gcxcv3pe2tvu3yut3xpeze7l5xkzc@ej3msenxdrx2>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <45cad9a9-8bb3-4174-aa5b-7a7cb3b7603e@oss.qualcomm.com>
 <dcc83729-295b-4fb2-beab-bbea1daec7a2@oss.qualcomm.com>
 <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02B9FOqi8w1VfgZXtvUxqDmsSsHMVF21qAAZNxDFTDNfA@mail.gmail.com>
X-Proofpoint-GUID: 580vftqwHlFKjQvQSoXCEr1rnXwL2s67
X-Proofpoint-ORIG-GUID: 580vftqwHlFKjQvQSoXCEr1rnXwL2s67
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cac90b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8RI0V0Q6YUoWoVOrNxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX3Q9ExMj3OHSZ
 vxMncPOfj21RvhxZ1z3YIKJXv5kaYWzX6zkcIJBCXH4UYW0nq09Cls9bHmtySDIWj59+hIsIN2c
 F0u/vh/nmhNpTLXD9RcGMyh1TrhNZdBY1lTjrx0Vvb12DK1Z7n0QFlxQXwl5CfgBV4MuREjlAll
 OJEfN0C2xkm/Q6g6GM3LupiRhnb98n3i3pgNnuYjEon4q+Nr9jSvxeTDSG9ABxyXKYz5meFnSzC
 kyBerbPR4D9wBh6Eb2V6TVSV/QLcEgeiUd8B/db1YZH5VCGN3J4RwipUMiaRJ4wkGqEatE7DPX9
 iDMPCW6aZqJpzyy+4nAPywn+jc5SU45qwHJEErOwHHWXH1i3PpslRTdzxkFhaD8biZo35Jx62h5
 vb4L32n7p1UDZolDrwX7qQXS6QVs3dbGiMYnFNNAzVPBvO8FT9Bntbof7SpPOBOIXwiRYvigp8t
 FbUdc/k8KyF2wkF1pgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100889-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org,linux.intel.com,linaro.org,infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAE7E360228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:08:45AM -0700, Rob Clark wrote:
> On Sun, Mar 29, 2026 at 11:57 PM Anvesh Jain P
> <anvesh.p@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 3/29/2026 7:52 PM, Akhil P Oommen wrote:
> > > On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> > >> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > >>
> > >> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> > >> reference boards. It handles fan control, temperature sensors, access
> > >> to EC state changes and supports reporting suspend entry/exit to the EC.
> > >
> > > Just a question, is it possible to force fan to run at full speed
> > > constantly? That would be helpful to keep the passive cooling minimal
> > > and get a more consistent results while doing performance profiling.
> > >
> > > I see that you are registering a cooling device in this series. So I
> > > suppose we just need to update the cooling sysfs nodes.
> > >
> > > -Akhil
> > >
> >
> > Hi Akhil,
> >
> > Yes, that is possible. The cooling device registered by this driver
> > exposes the standard thermal sysfs interface. You can force the fan
> > to full speed by writing the maximum cooling state directly:
> >
> >   # Find the max state
> >   cat /sys/class/thermal/cooling_deviceX/max_state
> >
> >   # Set to max state (force full speed)
> >   echo <max_state> > /sys/class/thermal/cooling_deviceX/cur_state
> >
> > Where X is the index of the cooling device corresponding to the EC fan.
> 
> Getting a bit off topic, but is there a good way to associated cooling
> devices and thermal sensors to the GPU device?  I could see that being
> useful for nvtop (which currently supports shows GPU load and memory
> metrics, but thermal metrics are missing for us)

I had a dirty patch, providing temp readings in NVMem. Probably I need
to clean it up and submit upstream.

> 
> BR,
> -R
> 
> > --
> > Best Regards,
> > Anvesh
> >
> >

-- 
With best wishes
Dmitry

